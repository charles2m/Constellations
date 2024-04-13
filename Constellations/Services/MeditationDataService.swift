//
//  MeditationDataService.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 08/04/2024.
//

import Foundation

class MeditationDataService {
    
    static let meditations = [
        Meditation(name: "Nature", image: "nature", sounds: [
            Sound(sound: "sound1", time: "10:00", file: "intro.mp3"),
            Sound(sound: "sound2", time: "10:00", file: "lechemin.mp3")], isSelected: true),
        Meditation(name: "Mountain", image: "mountain", sounds: [
            Sound(sound: "sound3", time: "10:00", file: "intro2.mp3"),
            Sound(sound: "sound4", time: "10:00", file: "lechalet.mp3")], isSelected: false)]
    
    
}
