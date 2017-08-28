//
//  Response.swift
//  RepositorySampleiOS
//
//  Created by Ehsan Mashhadi on 8/28/17.
//  Copyright © 2017 Nuesoft. All rights reserved.
//

import Foundation

class Response{
    
    var urlResponse:HTTPURLResponse!
    var data: Data!
    
    init(urlResponse:HTTPURLResponse, data:Data) {
        self.urlResponse = urlResponse
        self.data = data
    }
    
    func getStatus() -> Int{
        return self.urlResponse.statusCode
    }
    
    func getHeader(key:String) -> String {
        return self.urlResponse.allHeaderFields[key] as! String
    }
    
    func getIdentity() -> String?{
        return self.urlResponse.allHeaderFields["X-Identity"] as? String
    }
    
    func getBody() -> String{
        
        let dataString = String(data: self.data, encoding: .utf8)!
        return dataString
    }
    
    func getAuthenticated() -> Bool {
        return (self.getIdentity() != nil)
    }
    
    //Paged Response
}
