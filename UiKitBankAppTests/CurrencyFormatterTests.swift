//
//  CurrencyFormatterTests.swift
//  UiKitBankAppTests
//
//  Created by Albany Buipe on 20/06/2023.
//

import Foundation
import XCTest
@testable import UiKitBankApp

class CurrencyFormatterTests: XCTestCase {
    
    var formatter: CurrencyFormatter!
    var symbol: String!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
        symbol = Locale.current.currencySymbol
    }
    
    func testBreakDollarsIntoCents() throws {
        let result = formatter.breakIntoDollarsAndCents(929466.23)
        XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
    
    func testDollarsFormatted() throws {
        // Converts 929466 > $929,466.00
        let result = formatter.dollarsFormatted(929466)
        XCTAssertEqual(result, "\(symbol!)929,466.00")
    }
    
    func testZeroDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(0)
        XCTAssertEqual(result, "\(symbol!)0.00")
    }
}
