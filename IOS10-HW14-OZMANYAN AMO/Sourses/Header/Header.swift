//
//  Header.swift
//  IOS10-HW14-OZMANYAN AMO
//
//  Created by Amahastla on 20.07.2023.
//

import UIKit
import SnapKit

class TableCellHeader: UICollectionReusableView {
    
static let identifier = "TableCellHeader"
    
// MARK: - Outlets
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
// MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init (frame: frame)
        clipsToBounds = true
        setupHierarchy ()
        setupLayout ()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }
// MARK: - Setup
    private func setupHierarchy() {
        addSubview(title)
    }
    
    private func setupLayout ( ) {
        title.snp.makeConstraints { make in
            make.bottom.equalTo (self)
            make.left.equalTo(self)
        }
    }
        override func prepareForReuse() {
            super.prepareForReuse()
            title.text = nil
        }
    }

