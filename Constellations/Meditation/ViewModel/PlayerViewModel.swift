//
//  PlayerViewModel.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 09/04/2024.
//

import Foundation



 class PlayerViewModel :ObservableObject {
    
    
    let service = TweetService()
    let scoreService = ScoreService()
    @Published var didUploadTweet = false
 //   @Published var didUploadScore = false

    func uploadTweet(withCaption caption:String,withAlbum album:String) {
        
        service.uploadTweet(caption: caption, album: album) { success in
            
            if success {
                self.didUploadTweet = true
            } else {
                // Show error
                
            }
            
        }
    }
    /*
    func addPointsToScore(score:Score) {
        
        scoreService.addPointsToScore(score)
        
        
    }
    
    */
    
    func addPointsToScore(withScore score:Int) {
        
        scoreService.uploadScore(score: score){ success in
            
       
            
        }
        
        
    }
    
    
}
/*
class PlayerViewModel :ObservableObject {
    
    
    
    let service = TweetService()
    let scoreService = ScoreService()
    @Published var didUploadTweet = false
 //   @Published var didUploadScore = false

    func uploadTweet(withCaption caption:String,withAlbum album:String) {
        
        service.uploadTweet(caption: caption, album: album) { success in
            
            if success {
                self.didUploadTweet = true
            } else {
                // Show error
                
            }
            
        }
    }
    /*
    func addPointsToScore(score:Score) {
        
        scoreService.addPointsToScore(score)
        
        
    }
    
    */
    
    func addPointsToScore(withScore score:Int) {
        
        scoreService.uploadScore(score: score){ success in
            
       
            
        }
        
        
    }
    
    
}
*/
