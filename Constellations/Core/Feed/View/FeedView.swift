//
//  FeedView.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 18/03/2024.
//

import SwiftUI

struct FeedView: View {
    
    @State var isHide = false
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    MainTitleView(title: "ACCEUIL", displayButton: true, isHide: $isHide)
                    ScrollView{
                        
                        LazyVStack(spacing:20){
                           
                            scrollTracker
                            
                            ForEach(0...5,id:\.self) { _ in
                                
                                TweetRowView()
                            }
                            
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    FeedView()
}


extension FeedView {
    
    var scrollTracker: some View {
        
        GeometryReader { reader -> AnyView in
            
            let yAxis = reader.frame(in: .global).minY
            print(yAxis)
            if yAxis < 0 && !isHide {
                DispatchQueue.main.async {
                    withAnimation {isHide = true}
                    
                    
                }
            }
            if yAxis > 0 && isHide {
                DispatchQueue.main.async {
                    withAnimation {
                        isHide = false
                    }
                    
                }
            }
            return  AnyView(Text("")
                .frame(width:0, height:0))
        }
    }
}
