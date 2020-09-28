//
//  Data.swift
//  RickandMorty
//
//  Created by Akkarin Phain on 28/9/2563 BE.
//

import Foundation

struct RickData: Codable {
    let results:[Result]
    
   
    }


struct Result : Codable {
    
    let id: Int
    let name,status,species,gender,image,created: String
    
    }
    
