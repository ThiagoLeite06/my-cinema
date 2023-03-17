//
//  MCTabBarController.swift
//  my-cinema
//
//  Created by Thiago Leite on 17/03/23.
//

import UIKit

class MCTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        let movieVC = MoviesViewController()
        let seriesVC = SeriesViewController()
        let favoritesVC = FavoritesViewController()
        let profileVC = ProfileViewController()
        
        movieVC.title = "Fimes"
        seriesVC.title = "Séries"
        favoritesVC.title = "Favoritos"
        profileVC.title = "Perfíl"
        
        let nav1 = UINavigationController(rootViewController: movieVC)
        let nav2 = UINavigationController(rootViewController: seriesVC)
        let nav3 = UINavigationController(rootViewController: favoritesVC)
        let nav4 = UINavigationController(rootViewController: profileVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Filmes", image: UIImage(systemName: "popcorn"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Séries", image: UIImage(systemName: "play.display"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Favoritos", image: UIImage(systemName: "star"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Perfíl", image: UIImage(systemName: "person"), tag: 4)
        
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
    }

}
