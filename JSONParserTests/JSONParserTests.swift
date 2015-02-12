//
//  JSONParserTests.swift
//  JSONParserTests
//
//  Created by Victor Chan on 12/2/15.
//  Copyright (c) 2015 Spark Plug Studio. All rights reserved.
//

import UIKit
import XCTest

class JSONParserTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testArr(){
        let path = NSBundle.mainBundle().pathForResource("jsonDict", ofType:"json")
        let data = NSData(contentsOfFile:path!)
        let someKeyData: NSString? = (data >>> "Some Key") as? NSString
    }
    
}
