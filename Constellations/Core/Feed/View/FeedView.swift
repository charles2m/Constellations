//
//  FeedView.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 18/03/2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(0...5,id:\.self) { _ in
                
                    TweetRowView()
                }
                
                
            }
            
            
        }
    }
}

#Preview {
    FeedView()
}
