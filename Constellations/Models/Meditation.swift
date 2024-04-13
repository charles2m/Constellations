//
//  Meditation.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 08/04/2024.
//

import Foundation
struct Meditation:Identifiable,Hashable,Decodable {
    
    var id = UUID().uuidString
    var name:String
    var image:String
    var sounds:[Sound]
    var isSelected:Bool
    
    
}
    
struct Sound : Identifiable, Hashable,Decodable {
    
    
    var sound:String
    var id = UUID()
    var time:String
    var file:String
    
    
}
