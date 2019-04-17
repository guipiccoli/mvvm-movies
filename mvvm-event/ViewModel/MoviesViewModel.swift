//
//  MoviesViewModel.swift
//  mvvm-event
//
//  Created by Fernando Locatelli Maioli on 15/04/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//
import Foundation
import UIKit

enum MovieType {
    case topRated, popular
}

class MoviesViewModel {
    
    var listType: MovieType {
        didSet {
            switch listType {
            case .popular:
                movies = moviesPopular?.results ?? []
            case .topRated:
                movies = moviesTopRated?.results ?? []
            }
        }
    }
    
    var movies: [Movie] = []
    
    private var moviesPopular: MoviePopular?
    private var moviesTopRated: MovieTopRated?
    var downloadDelegate: DownloadDelegate?
    
    
    
    init(listType: MovieType) {
        self.listType = listType
        if listType == .popular {
            fetchMoviesPopular()
        }
        else if listType == .topRated {
            fetchTopRatedMovies()
        }
    }
    
    func fetchMoviesPopular(){
        APIService.getPopularMovies { (MoviePopular) in
            self.moviesPopular = MoviePopular ?? nil
            self.movies = MoviePopular?.results ?? []
            self.downloadDelegate?.didFinishDownloading()
            
        }
        
    }
    
    func fetchTopRatedMovies(){
        APIService.getTopRatedMovies { (MoviesTopRated) in
            self.moviesTopRated = MoviesTopRated ?? nil
            self.movies = MoviesTopRated?.results ?? []
            self.downloadDelegate?.didFinishDownloading()
        }
    }

        
    func getMoviesNumber() -> Int {
//        if let size = moviesPopular?.results.count{
//            print(size)
//            return size - 2
//        }
//        return 0
        return movies.count
    }
    
    func getMovieAtIndex(index: IndexPath) -> MovieDetailViewModel? {
        let movie = (movies[index.row])
        let movieDetail = MovieDetailViewModel(movie: movie)
        return movieDetail
    }
    
    func getMovieTitleAtIndex(index: IndexPath) -> String {
        return movies[index.row].title
    }
    
    func getMovieReleaseDateAtIndex(index: IndexPath) -> String {
        return movies[index.row].releaseDate
    }
    
    func getMovieRateAtIndex(index: IndexPath) -> String {
        return "\(movies[index.row].voteAverage)"
    }
    
    func getMoviePosterIndex(index: IndexPath) -> String {
        return movies[index.row].posterPath
    }
}
