//
//  MoviesViewModel.swift
//  mvvm-event
//
//  Created by Fernando Locatelli Maioli on 15/04/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//
import Foundation
import UIKit

class MoviesViewModel {
    
    private var moviesPopular: MoviePopular?
    var downloadDelegate: DownloadDelegate?
//    var moviesTopRated: MovieTopRated?
    
    init() {
        fetchMoviesPopular()
    }
    
    func fetchMoviesPopular(){
        APIService.getPopularMovies { (MoviePopular) in
            self.moviesPopular = MoviePopular ?? nil
            self.downloadDelegate?.didFinishDownloading()
            
        }
        
    }
        
    func getMoviesNumber() -> Int {
        if let size = moviesPopular?.results.count{
            print(size)
            return size - 2
        }
        return 0
    }
    
    func getMovieAtIndex(index: IndexPath) -> MovieDetailViewModel? {
        guard let movie = (moviesPopular?.results[index.row]) else { return nil }
        let movieDetail = MovieDetailViewModel(movie: movie)
        return movieDetail
    }
    
    func getMovieTitleAtIndex(index: IndexPath) -> String {
        return moviesPopular?.results[index.row].title ?? ""
    }
    
    func getMovieReleaseDateAtIndex(index: IndexPath) -> String {
        return moviesPopular?.results[index.row].releaseDate ?? ""
    }
    
    func getMovieRateAtIndex(index: IndexPath) -> String {
        return "\(moviesPopular?.results[index.row].voteAverage ?? 0.0)"
    }
    
    func getMoviePosterIndex(index: IndexPath) -> String {
        return moviesPopular?.results[index.row].posterPath ?? ""
    }
}
