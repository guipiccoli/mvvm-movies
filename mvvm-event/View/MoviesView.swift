//
//  MoviesView.swift
//  mvvm-event
//
//  Created by Fernando Locatelli Maioli on 15/04/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import UIKit
import Foundation

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
        
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
        
    }
    
    //    @IBAction func popularMovies(_ sender: UIButton) {
    //        movies = MoviesViewModel(listType: "popular")
    //        DispatchQueue.main.async {
    //            self.moviesTableView.reloadData()
    //        }
    //    }
    
    //    @IBAction func topRatedMovies(_ sender: UIButton) {
    //        movies = MoviesViewModel(listType: "topRated")
    //        DispatchQueue.main.async {
    //            self.moviesTableView.reloadData()
    //        }
    //    }
}
extension MoviesView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movies = movies else { return }
        guard let movie = movies.moviesPopular?.results[indexPath.row] else { return }
        performSegue(withIdentifier: "movieDetailSegue", sender: movie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let movie = sender as? ResultPopular {
            if let movieDetailView = segue.destination as? MovieDetailView {
                movieDetailView.title = movie.originalTitle
                movieDetailView.resultPopular = movie
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
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieCell

        guard let movies = movies else { return cell }
        cell.movieImage.image = UIImage(named: "star")
        cell.movieName.text = movies.moviesPopular?.results[indexPath.row].originalTitle
        cell.movieReleaseDate.text = movies.moviesPopular?.results[indexPath.row].releaseDate
        cell.movieVoteAverage.text = "\(movies.moviesPopular!.results[indexPath.row].voteAverage)"
        return cell
    }
}


