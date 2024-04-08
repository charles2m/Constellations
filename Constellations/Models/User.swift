//
//  User.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 06/04/2024.
//

import FirebaseFirestoreSwift


struct User:Identifiable ,Decodable {
    
    
    @DocumentID var id:String?
    let username:String
    let fullname:String
    let email:String
    
    
    
    
    
}

