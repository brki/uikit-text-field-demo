//
//  FiveDigitDelegate.swift
//  textFieldDemo
//
//  Created by Brian on 22/06/15.
//  Copyright (c) 2015 truckin'. All rights reserved.
//

import Foundation
import UIKit

class FiveDigitDelegate: NSObject, UITextFieldDelegate {
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        // Allow change if there will be less than 5 characters, or if this is a deletion (e.g. range.length > 0)
        return count(textField.text) + count(string) <= 5 || range.length > 0
    }
}
