//
//  MovieDetailed.swift
//  TMDB
//
//  Created by Alisson Alves on 17/11/22.
//

import SwiftUI

struct MovieDetailed: View {
    var movie: Movie
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                Text(movie.title).font(.title)
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }.aspectRatio(contentMode: .fit)
                Text(movie.overview).font(.subheadline)
            }.padding()
            
        }
    }
}

struct MovieDetailed_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailed(movie: Movie.mock)
    }
}
