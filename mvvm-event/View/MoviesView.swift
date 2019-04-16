//
//  MoviesView.swift
//  mvvm-event
//
//  Created by Fernando Locatelli Maioli on 15/04/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import UIKit
import Foundation

protocol DownloadDelegate {
    
    func didFinishDownloading()
}


class MoviesView: UIViewController {
    
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    @IBOutlet weak var popularMoviesButton: UIButton!
    @IBOutlet weak var topRatedMoviesButton: UIButton!
    
    var movies: MoviesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movies = MoviesViewModel.init()
        moviesTableView.dataSource = self 
        moviesTableView.delegate = self
        movies?.downloadDelegate = self
        
    }
    
}
extension MoviesView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movies = movies else { return }
        guard let movie = movies.getMovieAtIndex(index: indexPath) else { return }
        
        performSegue(withIdentifier: "movieDetailSegue", sender: movie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let movie = sender as? MovieDetailViewModel {
            if let movieDetailView = segue.destination as? MovieDetailView {
                movieDetailView.title = movie.getMovieTitle()
                movieDetailView.movie = movie
            }
        }
    }
}

extension MoviesView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movies = movies else { return 0}
        return movies.getMoviesNumber()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("CELL ROW: \(indexPath.row)")
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieCell

        guard let movies = movies else { return cell }
        cell.movieImage.image = UIImage(named: "star")
        cell.movieName.text = movies.getMovieTitleAtIndex(index: indexPath)
        cell.movieReleaseDate.text = movies.getMovieReleaseDateAtIndex(index: indexPath)
        cell.movieVoteAverage.text = movies.getMovieRateAtIndex(index: indexPath)
        
        
        guard let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + (movies.getMoviePosterIndex(index: indexPath))) else {return cell}
        
        DispatchQueue.global(qos: .background).async {
            let data = try! Data(contentsOf: imageUrl)
            DispatchQueue.main.async {
             
                let image = UIImage(data: data)
                cell.movieImage.image = image
            }
        }
        return cell
    }
}

extension MoviesView: DownloadDelegate {
    
    func didFinishDownloading() {
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
    
}


