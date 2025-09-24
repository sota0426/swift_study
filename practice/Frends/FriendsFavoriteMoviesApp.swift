//
//  FriendsFavoriteMoviesApp.swift
//  practice
//
//  Created by 飯森壮太 on 2025/09/23.
//


import SwiftUI

@main
struct FriendFavoriteMoviesApp:App{
    var body:some Scene{
        WindowGroup{
            ContentView()
        }
        .modelContainer(for:[Movie.self,Friend.self])
    }
}
