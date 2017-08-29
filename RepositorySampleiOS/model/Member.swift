//
//  Member.swift
//  RepositorySampleiOS
//
//  Created by Ehsan Mashhadi on 8/29/17.
//  Copyright © 2017 Nuesoft. All rights reserved.
//

import Foundation
class Member{
    private var name:String?
    private var id:Int?
    
    init(name:String!,id:Int!) {
        self.name = name
        self.id = id
    }
    
    public func setName(name:String){
        self.name = name
    }
    
    public func setId(id:Int){
        self.id = id
    }
    
    public func getName()->String{
        return self.name!
    }
    
    public func getId()->Int{
        return self.id!
    }
}
