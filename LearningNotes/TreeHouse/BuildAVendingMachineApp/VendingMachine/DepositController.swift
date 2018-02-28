//
//  DepositController.swift
//  VendingMachine
//
//  Created by 許庭瑋 on 2018/2/28.
//  Copyright © 2018年 Treehouse Island, Inc. All rights reserved.
//

import UIKit

class DepositController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        //it is the responsibility of the view controller that presented the view to dismiss it.
        //but when calling this method on presented model view controller, UIkit automatically asks its parent to dismiss it. the method is actually dispatched to the proper obj.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
