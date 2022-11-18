//
//  ViewModel.swift
//  TMDB
//
//  Created by Alisson Alves on 17/11/22.
//

import Foundation

struct MoviesResult: Hashable, Codable {
    var results: [Movie]
}

struct Movie: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var poster_path: String
    var overview: String
    static let mock = Movie(id: 436270, title: "Black Adam", poster_path: "https://image.tmdb.org/t/p/w500/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg", overview: "A good movie")
}

class ViewModel: ObservableObject {
    @Published var moviesList: [Movie] = []
    func fetch() {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)")
        else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){[weak self]data, _,error in
            guard let data = data, error == nil
            else {
                return
            }
            do{
                let moviesResult = try JSONDecoder().decode(MoviesResult.self, from: data)
                DispatchQueue.main.async {
                    self?.moviesList = moviesResult.results
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
