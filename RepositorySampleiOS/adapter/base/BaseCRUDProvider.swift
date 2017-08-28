//
//  BaseCRUDProvider.swift
//  RepositorySampleiOS
//
//  Created by Ehsan Mashhadi on 8/28/17.
//  Copyright © 2017 Nuesoft. All rights reserved.
//

import Foundation

protocol BaseCRUDProvider{
    
//    static func getAll()
//    
//    static func getOne(id:Int)
    
    func save <T:BaseModel> (model:T)
    
    
    
}


