//
//  MainTabView.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 20/03/2024.
//

import SwiftUI

struct MainTabView: View {
    @State var selected:String = "sparkles"
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack{
            switch selected {
                
            case "sparkles":
                FeedView()
                
            case "plus.square.fill":
                SelectionView()
                
            case "list.star":
               ExploreView()
                
            case "star":
                Color.green
                
            default:
                EmptyView()
            }
            VStack{
                Spacer()
                CustomTabBar(selectedTab: $selected)
            }
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    MainTabView()
}
