//
//  ExploreViewModel.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 08/04/2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var users = [User]()
    let service = UserService()
    @Published var searchText = ""
    
    
    var searchableUsers : [User] {
        if searchText.isEmpty {
            return users
        } else {
            let lowercaseQuery = searchText.lowercased()
            
            return users.filter {
                $0.username.contains(lowercaseQuery)
                
            }
        }
    }
    init() {
        fetchUsers()
        
        
    }
    func fetchUsers() {
        
        service.fetchUsers { users in
            self.users = users
            
            print("DEBUG: Users are... \(users)")
            
        }
        
    }
    
    
}
