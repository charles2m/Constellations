//
//  ScoreService.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 09/04/2024.
//

import Foundation
import Firebase
import SwiftUI

struct ScoreService {
    
    
    func uploadScore(score:Int, completion:@escaping(Bool) -> Void) {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let data = [
            "uid" : uid,
            "score":10,
            "name":"Intuition"
        ]
        as [String : Any]
        
        Firestore.firestore().collection("scores")
            .document().setData(data){ error in
                if let error = error {
                    print("Debug : fail to upload to score with error: \(error.localizedDescription)")
                    completion(false)
                    
                }
                
                completion(true)
                
            }
        
    }
    
    
    func addPointsToScore(_ score: Score) {
        
        print ("DEBUG : Score Added")
        Firestore.firestore().collection("scores").document().updateData(["scores":score.score + 10]) { _ in
            
        }
    }
    
    
    
    func fetchScores(forUid uid: String, completion: @escaping ([Score])-> Void) {
        
        Firestore.firestore().collection("scores")
        
            .whereField("uid", isEqualTo: uid)
        
            .getDocuments { snapshot, _ in
                
            guard let documents = snapshot?.documents else { return }
            
            let scores = documents.compactMap { try? $0.data(as: Score.self)
                
            }
               completion(scores)
                
            }
        
        }
        
  
    
    
    func fetchFinalScore(forUid uid: String, completion: @escaping (Int) -> Void) {
        Firestore.firestore().collection("scores")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, error in
                guard let documents = snapshot?.documents else {
                    print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                    completion(0) // En cas d'erreur, retourne 0
                    return
                }
                
                var totalScore = 0
                for document in documents {
                    if let score = document.data()["score"] as? Int {
                        totalScore += score
                    }
                }
                completion(totalScore)
            }
    }
    

    }

