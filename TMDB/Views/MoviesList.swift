//
//  MoviesList.swift
//  TMDB
//
//  Created by Alisson Alves on 17/11/22.
//

import SwiftUI

struct MoviesList: View {
    @StateObject var viewModels = ViewModel()
    var body: some View {
        NavigationView{
            List(viewModels.moviesList) { movie in
                
                NavigationLink{
                    MovieDetailed(movie: movie)
                } label: {
                    HStack {
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)")) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        Text(movie.title)
                    }
                }
                
            }.onAppear{
                viewModels.fetch()
            }.navigationTitle("Movies")
            
            
        }
    }
}

struct MoviesList_Previews: PreviewProvider {
    static var previews: some View {
        MoviesList()
    }
}
