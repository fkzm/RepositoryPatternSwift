//
//  Request.swift
//  RepositorySampleiOS
//
//  Created by Ehsan Mashhadi on 8/28/17.
//  Copyright © 2017 Nuesoft. All rights reserved.
//

import Foundation
import UIKit

class Request{
    
    var restAdapter:RestAdapter?
    var resources:String?
    var verb : String?
    var payload : [String:Any]?
    var queryString : [URLQueryItem]? = [URLQueryItem]()
    var headers:[String:String]? = [String:String]()
    var encoding :String?
    
    init() {
//        var ur1 = URL(string: "http://stackoverflow.com")
//        var url1 = URLRequest(url: ur1!)
//        url1.httpMethod = "METHOD"
    }
    
    init(restAdapter:RestAdapter,resources:String = "",verb:String = "GET",payload:[String:Any]=[:], queryString:[URLQueryItem]=[],encoding:String) {
        self.restAdapter = restAdapter
        self.resources = resources
        self.verb = verb
        self.payload = payload
        self.queryString = queryString
        self.encoding = encoding
    }
    
    func addHeader(key:String, value:String){
        self.headers?.updateValue(value, forKey: key)
    }
    
    func setVerb(verb:String) -> Request{
        self.verb = verb
        return self
    }
    
    func take(take:Int)->Request{
        self.addQueryString(name: "take", value: take)
        return self
    }
    
    //skip
    
    //sort
    
    //filter
    
    
    func addQueryString(name:String,value:Any,allowDuplicated:Bool = false){
        //Warning on optional value // Test Request
        let stringValue = String(describing: value)
        self.queryString?.append(URLQueryItem(name: name, value:stringValue))
    }
    
    //compose url
    
    func send(){
        
//        var requestBody:
        
        let url = URL(string: "https://nc.carrene.com")!
        var urlRequst = URLRequest(url: url)
        urlRequst.httpMethod = self.verb?.uppercased()
        urlRequst.allHTTPHeaderFields = self.headers

        
        if( self.encoding == nil){
            
        }
        
        else if(self.encoding == "json"){
            
            urlRequst.setValue("application/json",forHTTPHeaderField:"Content-Type")
            
            do {
                let data = try JSONSerialization.data(withJSONObject: self.payload!)
                urlRequst.httpBody = data
            }
            catch let error{
                print(error)
            }
          }
        
        URLSession.shared.dataTask(with: urlRequst, completionHandler: {
            (data, response, error) -> Void in
            
//            let httpResponse = response as? HTTPURLResponse
            
            
            
            })
        }
    }
