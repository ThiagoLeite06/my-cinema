//
//  MCMovieListViewModel.swift
//  my-cinema
//
//  Created by Thiago Leite on 17/03/23.
//

import UIKit

protocol MCMovieListViewModelDelegate: AnyObject {
    func didLoadInitialCharacters()
}

final class MCMovieListViewModel: NSObject {
    
    public weak var delegate: MCMovieListViewModelDelegate?

    private var cellViewModels: [MCMovieCollectionViewCellViewModel] = []
    
    private var movies: [MCMovie] = [] {
        didSet {
            for movie in movies {
                let viewModel = MCMovieCollectionViewCellViewModel(title: movie.title,
                                                                   movieImageUrl: movie.backdropPath)
                cellViewModels.append(viewModel)
            }
        }
    }
    
   
    
    func fetchMovies() {
        MCService.shared.execute(.listMoviesRequests,
                                 expecting: MCMovieResponse.self) { [weak self] result in
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                self?.movies = results
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCharacters()
                }
                
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    
}

extension MCMovieListViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MCMovieCollectionViewCell.cellIdentifier,
            for: indexPath) as? MCMovieCollectionViewCell else {
                fatalError("unsupported cell")
        }
        
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width * 1.5)
    }
    
}
