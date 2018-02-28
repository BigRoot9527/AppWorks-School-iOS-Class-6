//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 許庭瑋 on 2018/2/25.
//  Copyright © 2018年 Treehouse Island, Inc. All rights reserved.
//

import Foundation

import UIKit

enum VendingSelection: String /*raw value*/{
    case soda
    case dietSoda
    case chips
    case cookie
    case sandwich
    case wrap
    case candyBar
    case popTart
    case water
    case fruitJuice
    case sportsDrink
    case gum
    
    func icon() -> UIImage {
        if let image = UIImage(named: self.rawValue) {
            return image
        } else {
            return #imageLiteral(resourceName: "default") //image literal
        }
    }
}

protocol VendingItem {
    var price: Double { get }
    var quantity: Int { set get }
}

protocol VendingMechine {
    var selection: [VendingSelection] { get }
    var inventory: [VendingSelection: VendingItem] { get set }
    var amountDeposited: Double { get set }
    
    init(inventory: [VendingSelection: VendingItem])
    //this indicates that when conforming to the protocol, we need to create a throwing func as well.
    func vend(selection: VendingSelection, quantity: Int) throws
    func deposit(_ amount: Double)
    func item(forSelection selection:VendingSelection) -> VendingItem?
}

//When discussing different kinds of object, for simple data structures where it didn't matter which instance of the object we had, "structs" worked quite well.
//Value type (struct or enum) => are things
//Reference type (class) => do things
struct Item: VendingItem {
    let price: Double
    var quantity: Int
}

enum InventoryError: Error {
    case invalidResource
    case conversionFailure
    case invalidSelection
}

//Plist (Property List): A file that organizes data into named values and lists of values much like the dictionaries and arrays. Work only with "primitive" kinds of data.
//XML (Extensible Markup language): Set of rules for encoding documents in both machine and human readable format.
//Data in app: data should never be tightly coupled to your model.
//#1 obj: take a plist file as input and returns a dic as output.
class PlistConverter {
    //Instance Method: A method that is called on an instance of a particular type.
    //Type Method: Methods that are defined on the type itself rather than an instance.
    //indicate a type method: Adding the word "STATIC" before the method name, if it's a struct or a class.
    //Why do we create instances of objs? We do this to give them some data, and then work with that data for the life of the obj. The data in that instance changes over time, so it makes sense to hold onto it and create instance methods to work with the data at different points.
    //since we're not holding on to the data, creating an instance is unnecessary.
    static func dictionary(fromFile name: String, ofType type: String) throws -> [String: AnyObject] {
        /*Type aliases:
            AnyObject: an instance of any class type.
            Any: an instance of absolutely any type in Swift including functions.*/
        guard let path = Bundle.main.path(forResource: name, ofType: type) else {
            throw InventoryError.invalidResource
        }
        //Type casting
        guard let dictionary = NSDictionary(contentsOfFile: path) as?[String: AnyObject] else {
            throw InventoryError.conversionFailure
        }
        return dictionary
    }
    
}
//#2 obj: takes a dict of arbitrary input and convert it to an inventory obj.
class InventoryUnarchiver {
    static func vendingInventory(fromDictionary dictionary: [String: AnyObject]) throws -> [VendingSelection: VendingItem] {
        //vendingItem is itself a protocol because protocols are types themselves. => not restricted to a single type we can pass in as a value in an inventory obj.
        var inventory: [VendingSelection: VendingItem] = [:]
        for (key, value) in dictionary {
            //value would be Double or Int => using "Any"
            if let itemDictionary = value as? [String: Any], let price = itemDictionary["price"] as? Double, let quantity = itemDictionary["quantity"] as? Int {
                let item = Item(price: price, quantity: quantity)
                
                guard let selection = VendingSelection(rawValue: key) else {
                    throw InventoryError.invalidSelection
                }
                inventory.updateValue(item, forKey: selection)
            }
        }
        return inventory
        
    }
}

enum VendingMechineError: Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds(required: Double)
}


//Classes are good at modeling state. The particular value in our data model at a point in time.
class FoodVendingMachine: VendingMechine {
    //there is no nice way to ask an enum for how many members it encapsulates and what those members are. so we have to manually create an array to do this.
    let selection: [VendingSelection] = [.candyBar,.chips,.cookie,.dietSoda,.fruitJuice,.gum,.popTart,.sandwich,.soda,.sportsDrink,.water,.wrap]
    var inventory: [VendingSelection : VendingItem]
    var amountDeposited: Double = 10.0
    
    required init(inventory: [VendingSelection : VendingItem]) {
        self.inventory = inventory
    }
    
    func vend(selection: VendingSelection, quantity: Int) throws {
        guard var item = inventory[selection] else {
            throw VendingMechineError.invalidSelection
        }
        guard item.quantity >= quantity else {
            throw VendingMechineError.outOfStock
        }
        let totalPrice = item.price * Double(quantity)
        if amountDeposited >= totalPrice {
            amountDeposited -= totalPrice
            
            item.quantity -= quantity
            
            inventory.updateValue(item, forKey: selection)
        } else {
            let amountRequired = totalPrice - amountDeposited
            throw VendingMechineError.insufficientFunds(required: amountRequired)
        }
    }
    
    func deposit(_ amount: Double) {
        amountDeposited += amount
    }
    func item(forSelection selection: VendingSelection) -> VendingItem? {
        return inventory[selection]
    }
}





















