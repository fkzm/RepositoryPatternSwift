//
//  BaseAdapter.swift
//  RepositorySampleiOS
//
//  Created by Ehsan Mashhadi on 8/20/17.
//  Copyright © 2017 Nuesoft. All rights reserved.
//

import Foundation


protocol BaseAdapter {
    
    func create <T> (model: T)
    func getAll <T> (model: T) -> [T]

}
