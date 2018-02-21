//
//  ViewController.swift
//  FunFacts
//
//  Created by 許庭瑋 on 2018/2/16.
//  Copyright © 2018年 許庭瑋. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    let factProvider = FactProvider()
    let assignmentProvider = AssignmentProvider()
    let backgroundColorProvider = BackgroundColorProvider()

    @IBOutlet weak var funFactLabel: UILabel!
    @IBOutlet weak var funFactButton: UIButton!
    @IBOutlet weak var assignmentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        funFactLabel.text = factProvider.randomFact()
        assignmentLabel.text = assignmentProvider.randomtext()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showFact() {
        funFactLabel.text = factProvider.randomFact()
        assignmentLabel.text = assignmentProvider.randomtext()
        let randomColor = backgroundColorProvider.radomColor()
        view.backgroundColor = randomColor
        funFactButton.tintColor = randomColor
        
    }
}

