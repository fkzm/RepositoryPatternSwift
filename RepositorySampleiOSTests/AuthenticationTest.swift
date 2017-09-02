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
    
    var restAdapter:RestAdapter!
    
    override func setUp() {
        
        super.setUp()
        self.restAdapter  = RestAdapter(baseUrl: "https://nc.carrene.com/apiv1/", tokenLocalStorageKey: "token")
    }
    
    func testExample() {
        
        let expectation = self.expectation(description: "GET  SUMMERY")
        
        var credential = [String:Any] ()
        credential.updateValue("hamed@carrene.com", forKey: "email")
        credential.updateValue("123456", forKey: "password")
        
        self.restAdapter.login(credentials: credential).then { (Response) -> Void in

            expectation.fulfill()
            let token:String = Response.getField(name: "token") as! String
            XCTAssertNotNil(token)
            XCTAssertTrue(self.restAdapter.getAuthenticator().isAuthenticated())
            
            
        }
        waitForExpectations(timeout: 50, handler: nil)

    }
    
    override func tearDown() {
        super.tearDown()
        self.restAdapter.logOut()
        XCTAssertFalse(self.restAdapter.getAuthenticator().isAuthenticated())
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
