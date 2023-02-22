//
//  FeedBackView.swift
//  Jokes V2
//
//  Created by apple on 21/02/2023.
//

import SwiftUI

struct FeedBackView: View {
    
    var likedJoke : Bool
    
    var body: some View {
        
        ZStack{
            if likedJoke{
                Color.green
                 .edgesIgnoringSafeArea(.all)
            }else{
                Color.red
                    .edgesIgnoringSafeArea(.all)
            }
           
            Text(likedJoke ? "Thank you I apprecitate it" : "Why not that was good")
                .font(.largeTitle)
                .foregroundColor(.white)
                
        }
        
    }
}

struct FeedBackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedBackView(likedJoke: true)
    }
}
