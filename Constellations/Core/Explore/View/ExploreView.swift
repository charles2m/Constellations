//
//  ExploreView.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 22/03/2024.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                  
              // MainTitleView(title: "Les Membres", color: .green)
                    SearchBar(text: $viewModel.searchText)
                        .padding(.horizontal)
                    ScrollView{
                        LazyVStack(alignment:.leading){
                            ForEach(viewModel.searchableUsers){ user in
                                NavigationLink{
                                   ProfileView(user: user)
                                } label: {
                                    UserRowView(user: user)
                                }
                            }
                        }
                    }
                    
                }
            }  .navigationTitle("Communauté")
                .navigationBarTitleDisplayMode(.inline)
        }
      
    }
}

#Preview {
    ExploreView()
}
