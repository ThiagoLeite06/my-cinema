//
//  MoviesViewController.swift
//  my-cinema
//
//  Created by Thiago Leite on 17/03/23.
//

import UIKit

class MCMoviesViewController: UIViewController {
    
    let movieListView = MCMovieListView()
    let movieListViewModel = MCMovieListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Filmes"
        view.backgroundColor = .systemRed
        view.addSubview(movieListView)
        NSLayoutConstraint.activate([
            movieListView.topAnchor.constraint(equalTo: view.topAnchor),
            movieListView.leftAnchor.constraint(equalTo: view.leftAnchor),
            movieListView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            movieListView.rightAnchor.constraint(equalTo: view.rightAnchor  )
        ])
        movieListViewModel.fetchMovies()
        
    }
}



