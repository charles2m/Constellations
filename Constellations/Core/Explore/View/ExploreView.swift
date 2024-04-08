//
//  ExploreView.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 22/03/2024.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                  
                //    MainTitleView(title: "Les Membres", color: .green)
                    //SearchBar(text: $viewModel.searchText)
                        //.padding(.horizontal)
                    ScrollView{
                        LazyVStack(alignment:.leading){
                            ForEach(0...4,id:\.self){ user in
                                NavigationLink {
                                   // ProfileView(user: user)
                                } label: {
                                    UserRowView()
                                }
                            }
                        }
                    }
                    
                }
            }  .navigationTitle("Stars")
                .navigationBarTitleDisplayMode(.inline)
        }
      
    }
}

#Preview {
    ExploreView()
}
