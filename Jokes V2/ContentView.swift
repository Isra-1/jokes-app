//
//  ContentView.swift
//  Jokes V2
//
//  Created by apple on 03/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    var jokes=[
        joke(setup: "Why did the chicken cross the road?", punchline: "To get to the other side!"),
        joke(setup: "Why couldn't the bicycle stand up?",
             punchline: "It was two tired!"),
        joke(setup: "Is this pool safe for diving?",
             punchline:  "to cross the road")
    ]
    
    @State var isPunshlineShown = false
    @State var currentJokeIndex = 0
    @State var isFeedbackPresented = false
    @State var feedbackShown = false
    @State var likedJoke = true
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
            VStack {
                Text(jokes[currentJokeIndex].setup)
                    .padding()
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Button{
                    isPunshlineShown = true
                }label: {
                    Text("**Tell me the answer**")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                }
                .padding(40)
                
                if isPunshlineShown{
                    
                    Text(jokes[currentJokeIndex].punchline )
                        .padding()
                        .fontWeight(.black)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                    
                    
                    Text("tap here to continue")
                        .padding()
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                
            }
            .padding()
            
        }
        .onTapGesture {
            if isPunshlineShown{
                currentJokeIndex = (currentJokeIndex + 1) % jokes.count
                isPunshlineShown = false
                isFeedbackPresented = true
            }
    }
        .alert("did you like that joke?", isPresented: $isFeedbackPresented){
            Button("Yes Iloved it"){
                print(":)")
                feedbackShown = true
                likedJoke = true
            }
            Button("No I hate it"){
                print(":(")
                feedbackShown = true
                likedJoke = false
            }
        }
        .sheet(isPresented: $feedbackShown){
            FeedBackView(likedJoke: likedJoke)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
