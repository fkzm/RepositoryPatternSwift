//
//  AuthenticationTest.swift
//  RepositorySampleiOS
//
//  Created by Ehsan Mashhadi on 8/29/17.
//  Copyright © 2017 Nuesoft. All rights reserved.
//

import XCTest
@testable import RepositorySampleiOS

class AuthenticationTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let expectation = self.expectation(description: "GET  SUMMERY")
        var restAdapter  = RestAdapter(baseUrl: "https://nc.carrene.com/apiv1/", tokenLocalStorageKey: "token")
        
        var credential = [String:Any] ()
        credential.updateValue("hamed@carrene.com", forKey: "email")
        credential.updateValue("123456", forKey: "password")
        
        restAdapter.login(credentials: credential).then { (Response) -> Void in

            expectation.fulfill()
            let token:String = Response.getField(name: "token") as! String
            XCTAssertNotNil(token)
            XCTAssertTrue(restAdapter.getAuthenticator().isAuthenticated())
        
            
        }
        waitForExpectations(timeout: 50, handler: nil)

        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
