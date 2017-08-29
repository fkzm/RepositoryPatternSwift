//
//  UserDefaultTest.swift
//  RepositorySampleiOS
//
//  Created by Ehsan Mashhadi on 8/28/17.
//  Copyright © 2017 Nuesoft. All rights reserved.
//

import XCTest

class UserDefaultTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUserDefaultReplacement() {
        
        UserDefaults.standard.set("Ehsan", forKey: "Ehsan")
        var ehsan = UserDefaults.standard.value(forKey: "Ehsan") as? String
        XCTAssertEqual(ehsan, "Ehsan")
        
        UserDefaults.standard.set("Fateme", forKey: "Ehsan")
        ehsan = UserDefaults.standard.value(forKey: "Ehsan") as? String
        XCTAssertEqual(ehsan, "Fateme")

        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
