//
//  AlbumCell.swift
//  IOS10-HW14-OZMANYAN AMO
//
//  Created by Amahastla on 20.07.2023.
//

import UIKit

final class AlbumCell: UICollectionViewCell {
    
    static let identifier = "AlbumCell"
    
    // MARK: Constants
    
    enum Metric {
        static let indent: CGFloat = 5
        static let photoRadius: CGFloat = 10
    }
    
    // MARK: - Preperties
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Metric.photoRadius
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var namePhotoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    lazy var numberPhotosLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        label.textColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension AlbumCell {
    func configure() {
        contentView.addSubviewsForAutoLayout([
        photoImageView,
        namePhotoLabel,
        numberPhotosLabel
        ])
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: self.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor),
            
            namePhotoLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: Metric.indent),
            numberPhotosLabel.topAnchor.constraint(equalTo: namePhotoLabel.bottomAnchor, constant: Metric.indent)
        ])
    }
}

