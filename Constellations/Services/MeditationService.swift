//
//  MeditationService.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 08/04/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct MeditationService {
    
    func fetchMeditations(completion:@escaping([Meditation]) -> Void) {
        
        var meditations = [Meditation]()
        
        Firestore.firestore().collection("meditations")
            .getDocuments { snapshot, _  in
                
                guard let documents = snapshot?.documents else {return}
                
                documents.forEach { document in
                    guard let meditation = try? document.data(as: Meditation.self) else {return}
                    meditations.append(meditation)
                }
                
                completion(meditations)
                
                print("DEBUG : Meditation is : \(meditations)")
                    
                }
            }
        
    }
    
