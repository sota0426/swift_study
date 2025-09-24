//
//  FriendDetail.swift
//  practice
//
//  Created by 飯森壮太 on 2025/09/23.
//

import SwiftUI

struct MovieDetail:View{
    @Bindable var movie:Movie
    let isNew:Bool

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    init(movie:Movie,isNew:Bool=false){
        self.movie = movie
        self.isNew = isNew
    }

    var sortedFriends : [Friend]{
        movie.favoritedBy.sorted{first,second in
            first.name > second.name
        }
    }
    
    var body:some View{
        Form{
            TextField("Name",text:$movie.title)
            
            DatePicker("Release date",selection:$movie.releaseDate,displayedComponents:.date)

            if !movie.favoritedBy.isEmpty{
                Section("Favorite by"){
                    ForEach(sortedFriends){friend in
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationTitle(isNew ? "New Movie":"Movie")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
           if isNew {       
            ToolbarItem(placement:.confirmationAction){
                Button("Save"){
                    dismiss()
                }
            }
            ToolbarItem(placement:.cancellationAction){
                Button("Cancel"){
                    context.delete(movie)
                    dismiss()
                }
            }

            }
        }
    }
}

#Preview("New Movie") {
    NavigationStack{
        MovieDetail(movie:SampleData.shared.movie,isNew:true)
    }
}
