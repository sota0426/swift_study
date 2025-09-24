//
//  MovieList.swift
//  practice
//
//  Created by 飯森壮太 on 2025/09/22.
//

import SwiftUI
import SwiftData

struct MovieList : View{
    @Query(sort:\Movie.title) private var movies:[Movie]
    @Environment(\.modelContext) private var context
    @State private var newMovie : Movie?

    var body:some View{
        NavigationSplitView{
            
            List{
                ForEach(movies){movie in
                    NavigationLink(movie.title){
                        MovieDetail(movie:movie,isNew: false)
                    }
                }
                .onDelete(perform: deleteMovies(indexes:))
            }
            .navigationTitle("Movies")
            .toolbar{
                ToolbarItem{
                    Button("Add button",systemImage: "plus",action:addMovie)
                }
                ToolbarItem(placement:.topBarTrailing){
                    EditButton()
                }

            }
            .sheet(item: $newMovie) { movie in
                NavigationStack {
                    MovieDetail(movie: movie,isNew:true)
                }
                .interactiveDismissDisabled()
            }
            
        }detail:{
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func addMovie() {
        let newMovie = Movie(title: "", releaseDate: .now)
        context.insert(newMovie)
        self.newMovie = newMovie
    }
    
    private func deleteMovies(indexes:IndexSet){
        for index in indexes{
            context.delete(movies[index])
        }
    }

}

#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelContainer)
}

