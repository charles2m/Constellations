//
//  SelectionView.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 08/04/2024.
//

import SwiftUI

struct SelectionView: View {
    private let gridItems = [GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                   // MainTitleView(title: "Créer un Moment", color: .black)
                    Text("Quelles sont vos envies pour aujourd'hui ? ")
                        
                    LazyVGrid(columns: gridItems, spacing: 25) {
                        NavigationLink (
                        destination:
                        MeditationView()
                         ,label: {
                            SelectionCell(icon: "medi", text: "Méditer", isAvailable: true)
                        })
                        NavigationLink (
                        destination: MeditationView(),
                         label: {
                             SelectionCell(icon: "medi", text: "Créer une discusssion", isAvailable: false)
                         }).disabled(true)
                    }
                    Spacer()
                    
                    
                }
                
            }
            
        }
    }
}

#Preview {
    SelectionView()
}
