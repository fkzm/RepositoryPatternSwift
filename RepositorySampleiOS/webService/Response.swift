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
    var error:Error?
    
    
    init(urlResponse:HTTPURLResponse, data:Data) {
        self.urlResponse = urlResponse
        self.data = data
    }
    
    init(urlResponse:HTTPURLResponse, error:Error) {
        self.urlResponse = urlResponse
        self.error = error
        
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
    
    func getBody() -> Data{
        
        let dataString = String(data: self.data, encoding: .utf8)!
        return self.data
    }
    
    func getAuthenticated() -> Bool {
        return (self.getIdentity() != nil)
    }
    
    func getField(name:String) -> Any?{
        
        do{
            let body = try JSONSerialization.jsonObject(with: self.getBody(), options: []) as? [String : Any]
            return body?[name]
        }
        catch{
            return nil
        }
    }
    
    //Paged Response
}
