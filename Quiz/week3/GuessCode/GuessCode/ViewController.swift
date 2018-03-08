//
//  ViewController.swift
//  GuessCode
//
//  Created by 許庭瑋 on 2018/3/7.
//  Copyright © 2018年 Ting-Wei Hsu. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var oneButton: UIButton!
    
    @IBOutlet weak var twoButton: UIButton!
    
    @IBOutlet weak var threeButton: UIButton!
    
    @IBOutlet weak var fourButton: UIButton!
    
    @IBOutlet weak var fiveButton: UIButton!
    
    @IBOutlet weak var sixButton: UIButton!
    
    @IBOutlet weak var sevenButton: UIButton!
    
    @IBOutlet weak var eightButton: UIButton!
    
    @IBOutlet weak var nineButton: UIButton!
    
    @IBOutlet weak var zeroButton: UIButton!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var sendButton: UIButton!
    
    var buttons: [UIButton] = []
    
    var lastNumber: Int = 0
    
    var leftBound: Int = 1
    
    var rightBound: Int = 100
    
    var finalNumber: Int = 0
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttons = [oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton, zeroButton, cancelButton, sendButton]
        setUp(buttons: buttons)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        finalNumber = createRandomNumber()

    }

    func setUp(buttons: [UIButton]) {
        buttons.forEach {
            $0.layer.cornerRadius = oneButton.bounds.size.width / 2
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.white.cgColor
            $0.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        }
    }

    @objc func pressButton(_ button: UIButton) {
        switch button {
        case oneButton: addNumber(1)
        case twoButton: addNumber(2)
        case threeButton: addNumber(3)
        case fourButton: addNumber(4)
        case fiveButton: addNumber(5)
        case sixButton: addNumber(6)
        case sevenButton: addNumber(7)
        case eightButton: addNumber(8)
        case nineButton: addNumber(9)
        case zeroButton: addNumber(0)
        case cancelButton:
            lastNumber = 0
            numberLabel.text = "請輸入數字"
        case sendButton: checkNumber()
        default: break
        }
    }
    
    func addNumber(_ number: Int) {
        lastNumber = lastNumber * 10 + number
        numberLabel.text = "\(lastNumber)"
    }
    
    func checkNumber() {
        
        if lastNumber > rightBound || lastNumber < leftBound {
            numberLabel.text = "數字須介於 \(leftBound) ~ \(rightBound)"
            lastNumber = 0
            return
        }
        
        if lastNumber == finalNumber {
            numberLabel.text = "答對了!"
            finalNumber = createRandomNumber()
            leftBound = 1
            rightBound = 100
        } else if lastNumber > finalNumber {
            numberLabel.text = "數字介於 \(leftBound) ~ \(lastNumber)"
            rightBound = lastNumber
        } else {
            numberLabel.text = "數字介於 \(lastNumber) ~ \(rightBound)"
            leftBound = lastNumber
        }
        
        lastNumber = 0
    }
    
    func createRandomNumber() -> Int {
        return GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
    }
}

