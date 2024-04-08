//
//  ConstellationsApp.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 18/03/2024.
//

import SwiftUI
import Firebase
@main
struct ConstellationsApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }.environmentObject(viewModel)
        }
    }
}
