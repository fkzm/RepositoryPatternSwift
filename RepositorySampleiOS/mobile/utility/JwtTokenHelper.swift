//
//  JwtTokenHelper.swift
//  RepositorySampleiOS
//
//  Created by Ehsan Mashhadi on 8/29/17.
//  Copyright © 2017 Nuesoft. All rights reserved.
//

import Foundation

import JWTDecode

class JwtTokenHelper{
    
    
    static func getTokenBody(token:String)->[String:Any]{
        var body:[String:Any]?
        do{
            let jwt = try decode(jwt: token)
            body = jwt.body
            
        } catch{
            print(error)
        }
        return body!
    }
}
