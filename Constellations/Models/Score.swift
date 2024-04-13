//
//  Score.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 09/04/2024.
//

import Foundation
import SwiftUI

struct Score:  Identifiable, Decodable {
    
    //il faut en creer un seul par name/ type de score
    let name: String
    let score: Int
    //let color: String
    let uid: String
    
    var id:String
    {name}
    
    var user:User?
}
