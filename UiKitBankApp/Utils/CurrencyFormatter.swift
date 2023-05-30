//
//  CurrencyFormatter.swift
//  UiKitBankApp
//
//  Created by Albany Buipe on 29/05/2023.
//

import Foundation
import UIKit

struct CurrencyFormatter {
    
    func makeAttributedCurrency(_ amount: Decimal) -> NSMutableAttributedString {
        let tuple = breakIntoDollarsAndCents(amount)
        return makeBalanceAttributed(dollars: tuple.0, cents: tuple.1)
    }
    
    // Converts 929466.23 > "929,466" "23"
    func breakIntoDollarsAndCents(_ amount: Decimal) -> (String, String) {
        let tuple = modf(amount.toDouble())
        
        let dollars = convertDollar(tuple.0)
        let cents = convertCents(tuple.1)
        
        return (dollars, cents)
    }
    
    // Converts 929466 > 929,466
    private func convertDollar(_ dollarPart: Double) -> String {
        let dollarsWithDecimal = dollarsFormatted(dollarPart) // "$929,466.00"
        let formatter = NumberFormatter()
        let decimalSeparator = formatter.decimalSeparator! // "."
        let dollarComponents = dollarsWithDecimal.components(separatedBy: decimalSeparator) // "$929,466" "00"
        var dollars = dollarComponents.first! // "$929,466"
        dollars.removeFirst() // "929,466"

        return dollars
    }
    
    // Convert 0.23 > 23
    private func convertCents(_ centPart: Double) -> String {
        let cents: String
        if centPart == 0 {
            cents = "00"
        } else {
            cents = String(format: "%.0f", centPart * 100)
        }
        return cents
    }
    
    // Converts 929466 > $929,466.00
    func dollarsFormatted(_ dollars: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true
        
        if let result = formatter.string(from: dollars as NSNumber) {
            return result
        }
        
        return ""
    }
    
    private func makeBalanceAttributed(dollars: String, cents: String) -> NSMutableAttributedString {
        let cediSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let cediAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let pesesawAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        
        let rootString = NSMutableAttributedString(string: "₵", attributes: cediSignAttributes)
        let cediString = NSAttributedString(string: dollars, attributes: cediAttributes)
        let pesewaString = NSAttributedString(string: cents, attributes: pesesawAttributes)
        
        rootString.append(cediString)
        rootString.append(pesewaString)
        
        return rootString
    }
}

extension Decimal {
    func toDouble() -> Double {
        return Double(truncating: self as NSNumber)
    }
}
