//
//  TweetService.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 09/04/2024.
//

import Foundation
import Firebase

struct TweetService {
    
    
    func uploadTweet(caption:String,album:String, completion:@escaping(Bool) -> Void) {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let data = ["uid" : uid,
                    "caption": caption,
                    "album": album,
                    "likes":0,
                    "timestamp" :Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("tweets")
            .document().setData(data){ error in
                if let error = error {
                    print("Debug : fail to upload to tweet with error: \(error.localizedDescription)")
                    completion(false)
                    
                }
                
                completion(true)
                
            }
        
    }
}
