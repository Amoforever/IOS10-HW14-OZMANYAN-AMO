//
//  ViewController.swift
//  IOS10-HW14-OZMANYAN AMO
//
//  Created by Amahastla on 20.07.2023.
//

import UIKit



class ViewController: UIViewController {
    
    enum Metric {
        static let layoutIndent: CGFloat = 12
        static let leftIndentLayout: CGFloat = 6
        static let photoRadius: CGFloat = 10
        static let topIndentVerticalSection: CGFloat = 20
    }
    
    private let model = DataManager.shared.createModels()
    
    // MARK: - UI
    
    private lazy var collection: UICollectionView = {
        let layout = createLayout ()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.identifier)
        collectionView.register(TableCell.self, forCellWithReuseIdentifier: TableCell.identifier)
        collectionView.register(TableCellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TableCellHeader.identifier)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    // MARK: - Lifecycle
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "МЕДИАТЕКА"
        setupView()
        setupHierarchy()
        setupLayout()
    }
       
    // MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupHierarchy() {
        view.addSubview(collection)
        }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
            }
   
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return model[0].count
        case 1:
            return model[1].count
        case 2:
            return model[2].count
        case 3:
            return model[3].count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let data = model[indexPath.section][indexPath.item]
        
        switch indexPath.section {
        case 0:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.identifier, for: indexPath) as? AlbumCell
            item?.photoImageView.image = UIImage(named: data.image)
            item?.namePhotoLabel.text = data.name
            item?.numberPhotosLabel.text = data.description
            return item ?? UICollectionViewCell()
        case 1:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.identifier, for: indexPath) as? AlbumCell
            item?.photoImageView.image = UIImage(named: data.image)
            item?.namePhotoLabel.text = data.name
            item?.numberPhotosLabel.text = data.description
            return item ?? UICollectionViewCell()
        case 2:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: TableCell.identifier, for: indexPath) as? TableCell
            item?.iconView.image = UIImage(systemName: data.image)
            item?.nameLabel.text = data.name
            item?.numberPhotosLabel.text = data.description
            return item ?? UICollectionViewCell()
        default:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: TableCell.identifier, for: indexPath) as? TableCell
            item?.iconView.image = UIImage(systemName: data.image)
            item?.nameLabel.text = data.name
            item?.numberPhotosLabel.text = data.description
            return item ?? UICollectionViewCell()
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch indexPath.section {
            
        case 0, 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TableCellHeader.identifier, for: indexPath) as! TableCellHeader
            header.title.text = "Мои альбомы"
            return header
        case 2:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TableCellHeader.identifier, for: indexPath) as! TableCellHeader
            header.title.text = "Типы медиафайлов"
            return header
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TableCellHeader.identifier, for: indexPath) as! TableCellHeader
            header.title.text = "Другое"
            return header
        }
        
        
    }
}
    
    
    enum Sections: Int {
        case first = 0
        case second = 1
        case third = 2
        case fourth = 3
    }
    
    extension ViewController {
        private func createLayout() -> UICollectionViewLayout {
            let layout = UICollectionViewCompositionalLayout {
                (sectionIndex: Int,
                 layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
                
                guard let sectionLayout = Sections(rawValue: sectionIndex) else { return nil }
                
                switch sectionLayout {
                case .first:
                    return self.firstSection()
                case .second:
                    return self.secondSection()
                case .third:
                    return self.thirdSection()
                case .fourth:
                    return self.fourthSection()
                }
            }
            return layout
        }
    }
    
    extension ViewController {
        private func firstSection() -> NSCollectionLayoutSection {
            
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(
                top: Metric.layoutIndent,
                leading: Metric.leftIndentLayout,
                bottom: .zero,
                trailing: Metric.leftIndentLayout)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1 / 2.2),
                heightDimension: .absolute(399)
            )
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: groupSize,
                subitem: item,
                count: 2
            )
            
            group.interItemSpacing = .fixed(88)
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = .zero
            section.contentInsets = NSDirectionalEdgeInsets(
                top: .zero,
                leading: Metric.layoutIndent,
                bottom: 112,
                trailing: Metric.layoutIndent)
            section.orthogonalScrollingBehavior = .paging
            
            section.contentInsets.leading = Metric.layoutIndent
            
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(45))
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)
            header.zIndex = Int.max
            section.boundarySupplementaryItems = [header]
            
            let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                                 heightDimension: .estimated(80))
            let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            section.boundarySupplementaryItems = [layoutSectionHeader]
            return section
            
        }
        
        private func secondSection() -> NSCollectionLayoutSection {
            
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(
                top: .zero,
                leading: Metric.leftIndentLayout,
                bottom: .zero,
                trailing: Metric.leftIndentLayout
            )
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .estimated(192),
                heightDimension: .absolute(186)
            )
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: groupSize,
                subitem: item,
                count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = .zero
            section.contentInsets = NSDirectionalEdgeInsets(
                top: .zero,
                leading: Metric.layoutIndent,
                bottom: 60,
                trailing: Metric.layoutIndent)
            section.orthogonalScrollingBehavior = .paging
            
            section.contentInsets.leading = Metric.layoutIndent
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading:    Metric.layoutIndent, bottom: 50, trailing: 0)
            
            return section
            
        }
        
        private func thirdSection() -> NSCollectionLayoutSection {
            
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(52)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(
                top: Metric.topIndentVerticalSection,
                leading: .zero,
                bottom: .zero,
                trailing: .zero)
            
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: itemSize,
                subitem: item,
                count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            
            section.contentInsets.leading = Metric.layoutIndent
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading:    Metric.layoutIndent, bottom: 5, trailing: 0)
            
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(45))
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)
            header.zIndex = Int.max
            section.boundarySupplementaryItems = [header]
            
            let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                                 heightDimension: .estimated(80))
            let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            section.boundarySupplementaryItems = [layoutSectionHeader]
            
            return section
            
        }
        
        private func fourthSection() -> NSCollectionLayoutSection {
            
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(52)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(
                top: Metric.topIndentVerticalSection,
                leading: .zero,
                bottom: .zero,
                trailing: .zero
            )
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: itemSize,
                subitem: item,
                count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            
            section.contentInsets.leading = Metric.layoutIndent
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading:    Metric.layoutIndent, bottom: 20, trailing: 0)
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(45))
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)
            header.zIndex = Int.max
            section.boundarySupplementaryItems = [header]
            
            let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                                 heightDimension: .estimated(80))
            let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            section.boundarySupplementaryItems = [layoutSectionHeader]
            return section
            
        }
        
    }

