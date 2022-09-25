//
//  MainView.swift
//  Mockingbird
//
//  Created by Andrew Almasi on 9/24/22.
//

import SwiftUI

struct MainView: View {
    @State var showingDetail = false
    @State private var isPlaying = false
    @State private var hasTimeElapsed = false
    @State private var type = "Brother"
    @State private var sound = "Brother.mp3"
    
    var body: some View {
        ZStack{
            VStack{
            Button{
                self.showingDetail.toggle()
                self.isPlaying.toggle()
                type = "Brother"
                sound = "Brother.mp3"
            } label: {
                Text("Brother")
            }
            Button{
                self.showingDetail.toggle()
                self.isPlaying.toggle()
                type = "BF"
                sound = "BF.mp3"
            } label: {
                Text("BF")
            }
            Button{
                self.showingDetail.toggle()
                self.isPlaying.toggle()
                type = "Father"
                sound = "Father.mp3"
            } label: {
                Text("Father")
            }
            }
            if (showingDetail) {
                MyDesign(person: type, sound: sound)
            }
        }

        
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
