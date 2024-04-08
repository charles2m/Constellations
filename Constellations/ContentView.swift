//
//  ContentView.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 18/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel:AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession == nil {
               LoginView()
            }else{
                
             MainTabView()
            }
            
        }
     
    }
}

#Preview {
    ContentView()
}
