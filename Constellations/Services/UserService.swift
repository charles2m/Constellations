//
//  UserService.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 06/04/2024.
//

import Foundation
import Firebase

struct UserService {
    
    func fetchUser(withUid uid : String, completion:@escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else {return}
                
               
                guard let user = try? snapshot.data(as: User.self) else  {return }
                
             completion(user)
                
              //  print("DEBUG: Username is \(user.username)")
              //  print("DEBUG: EMAIL is \(user.email)")
            }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        
        var users = [User]()
        
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                documents.forEach { document in
                    guard let user = try? document.data(as: User.self) else {return}
                    users.append(user)
                }
                print("DEBUG : Users is : \(users)")
                completion(users)
            }
                }
    
}
