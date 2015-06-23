//
//  ViewController.swift
//  textFieldDemo
//
//  Created by Brian on 22/06/15.
//  Copyright (c) 2015 truckin'. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var field1: UITextField!
    @IBOutlet weak var field2: UITextField!
    @IBOutlet weak var field3: UITextField!
    @IBOutlet weak var allowSwitch: UISwitch!

    let fiveDigitDelegate = FiveDigitDelegate()
    let currencyDelegate = CurrencyDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        field1.delegate = fiveDigitDelegate
        field2.delegate = currencyDelegate
        field3.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return allowSwitch.on
    }

    @IBAction func allowToggle(sender: UISwitch) {
        if !sender.on {
            field3.resignFirstResponder()
        }
    }

}

