//
//  AuthViewModel.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 02/04/2024.
//

import SwiftUI
import Firebase


class AuthViewModel:ObservableObject {
    
    @Published var userSession:FirebaseAuth.User?
    private let service = UserService()
    @Published var currentUser:User?
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func login(withEmail email : String, password:String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("DEBUG : faield to sign in with \(error.localizedDescription)")
                return
                
            }
            guard let user = result?.user else {return}
            self.userSession = user
           self.fetchUser()
            print("Did log user in")
        }
        
    }
    
    func register(withEmail email:String, password:String, fullname:String, username:String){
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print ("DEBUG: Failed to register with error \(error.localizedDescription)")
                
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            
            print("DEBUG : Reigster user succesfully")
            print("Debug: User is \(self.userSession?.uid)")
            
            let data = [
                "email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid":user.uid,
                
            ]
            
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data){ _ in
                    print("DEBUG: Did upload user data ...")
                 self.fetchUser()
                }
            
        }
    }
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
        
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else {return}
        service.fetchUser(withUid: uid) { user in
          self.currentUser = user
        }
        
        
    }
    
}

