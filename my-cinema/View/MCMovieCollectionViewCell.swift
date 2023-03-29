//
//  MCMovieCollectionViewCell.swift
//  my-cinema
//
//  Created by Thiago Leite on 17/03/23.
//

import UIKit

class MCMovieCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "MCMovieCollectionViewCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .label
        title.font = .systemFont(ofSize: 16, weight: .bold)
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 2
        return title
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(imageView, title)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            title.heightAnchor.constraint(equalToConstant: 70),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -3),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        title.text = nil
    }
    
    public func configure(with viewModel: MCMovieCollectionViewCellViewModel) {
        title.text = viewModel.title
        
        viewModel.fetchImage(completion: { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        })
    }
    
}
