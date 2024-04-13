//
//  MeditationViewModel.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 08/04/2024.
//

import Foundation
import Firebase


class MeditationViewModel:ObservableObject {
    
    
  @Published var meditations:[Meditation]
    @Published var selectedSoundIndex: Int = 0
   let service = MeditationService()
    
   init() {
        let meditations = MeditationDataService.meditations
        self.meditations = meditations
        //fetchMeditation()
   }
    
}
