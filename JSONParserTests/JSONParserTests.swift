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
    
    func testDataToDict(){
        let path = NSBundle.mainBundle().pathForResource("jsonDict", ofType:"json")
        let data = NSData(contentsOfFile:path!)
        let someKeyData: NSString? = (data >>> "Some Key") as? NSString
        let testString = "Hi there. I'm stored in some key"
        XCTAssert(someKeyData!.isEqualToString(testString) , "jsonDict did not extract the right data")
        XCTAssertNil((data >>> "Absent Key"), "jsonDict should be nil when wrong key is passed in")
        XCTAssertNil((data >>> 0), "jsonDict should be nil when number is passed in")
    }
    
    func testDataToArray(){
        let path = NSBundle.mainBundle().pathForResource("jsonArr", ofType:"json")
        let data = NSData(contentsOfFile:path!)
        let someKeyData: NSString? = (data >>> 0) as? NSString
        let testString = "Item 0"
        XCTAssert(someKeyData!.isEqualToString(testString) , "jsonArr did not extract the right data")
        XCTAssertNil((data >>> "Absent Key"), "jsonArr should be nil when wrong key is passed in")
        XCTAssertNil((data >>> 6), "jsonArr should be nil when wrong number is passed in")
        XCTAssertNil((data >>> -1), "jsonArr should be nil when negative number is passed in")
    }
    func testMixedDataChain(){
        let path = NSBundle.mainBundle().pathForResource("jsonMix", ofType:"json")
        let data = NSData(contentsOfFile:path!)
        let someKeyData:AnyObject? = data >>> "glossary" >>> "GlossDiv" >>> "GlossList" >>> "GlossEntry" >>> "GlossDef" >>> "GlossSeeAlso" >>> 0
        let testString = "GML"
        XCTAssert(someKeyData!.isEqualToString(testString) , "jsonMix did not extract the right data")
        XCTAssertNil((data >>> "glossary" >>> "GlossDiv" >>> "GlossList" >>> "GlossMissing" >>> "GlossDef" >>> "GlossSeeAlso" >>> 0), "jsonMix should be nil when wrong key is passed in")
        XCTAssertNil((data >>> "glossary" >>> "GlossDiv" >>> "GlossList" >>> "GlossEntry" >>> "GlossDef" >>> "GlossSeeAlso" >>> 4), "jsonMix should be nil when wrong number is passed in")
        
        
    }
    
}
