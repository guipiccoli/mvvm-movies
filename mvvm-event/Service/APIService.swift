//
//  APIService.swift
//  mvvm-event
//
//  Created by Guilherme Piccoli on 16/04/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import Foundation

struct APIService {
    

    
    static func getPopularMovies(completionHandler completion: @escaping (MoviePopular?) -> Void) {
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=edac55baa5247ecf4089bac4553ff6ed&language=en-US&page=1")!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            guard let error = error
                else {
                    let movie = try? JSONDecoder().decode(MoviePopular.self, from: data!)
                    completion(movie)
                    return
                }
            print(error.localizedDescription)
            completion(nil)
            return
        })
        dataTask.resume()
    }
    
    static func getTopRatedMovies(completionHandler completion: @escaping (MovieTopRated?) -> Void) {
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=edac55baa5247ecf4089bac4553ff6ed&language=en-US&page=1")!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            guard let error = error
                else {
                    let movie = try? JSONDecoder().decode(MovieTopRated.self, from: data!)
                    completion(movie)
                    return
            }
            print(error.localizedDescription)
            completion(nil)
            return
        })
        dataTask.resume()
    }
}
