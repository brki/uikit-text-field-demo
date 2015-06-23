//
//  CurrencyDelegate.swift
//  textFieldDemo
//
//  Created by Brian on 22/06/15.
//  Copyright (c) 2015 truckin'. All rights reserved.
//

import Foundation
import UIKit

class CurrencyDelegate: NSObject, UITextFieldDelegate {
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        // As digits are typed, shift the characters to the left
        // $00.00
        // $00.01
        // $00.19
        // $01.99
        // $19.95
        // $199.50 etc.
        // The string representation of the number can become arbitrarily large (e.g. it's
        // not limited to the maximum double value).

        var newText = textField.text as NSString
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        textField.text = formatCurrency(newText as String)
        return false
    }

    func formatCurrency(currency: String) -> String {

        // Create a digit-only string without leading zeros
        var newString = ""
        var initialNonZeroSeen = false
        for char in (currency) {
            switch char {
            case "0":
                if initialNonZeroSeen {
                    newString.append(char)
                }
            case "1", "2", "3", "4", "5", "6", "7", "8", "9":
                initialNonZeroSeen = true
                newString.append(char)
            default:
                continue
            }
        }

        let charCount = count(newString)
        if charCount == 0 {
            // Special case if all characters were deleted:
            newString = "0000"
        } else if charCount < 4 {
            // If there are less than 4 characters, 0-pad the string:
            newString = String(format: "%04d", newString.toInt()!)
        }

        // Add the $ and . back in:
        newString = "$" + newString
        newString.insert(".", atIndex: newString.endIndex.predecessor().predecessor())
        return newString
    }

}