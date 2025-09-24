//
//  ContentView.swift
//  practice
//
//  Created by 飯森壮太 on 2025/09/22.
//

import SwiftUI

struct ContentView :View{
    var body: some View{
        TabView{
            Tab("Frends",systemImage: "person.and.person"){
                FriendList()
            }
            Tab("Movies",systemImage: "film.stack"){
                MovieList()
            }
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
