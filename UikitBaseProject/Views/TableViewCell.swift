//
//  TableViewCell.swift
//  UikitBaseProject
//
//  Created by Zülfü Akgüneş on 5.07.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let data:[String] = ["Remzi", "Fatmagül", "Dicle", "Zülfü"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout{
        //item
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        //group
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitems: item, count: 2)
        
        //section
        
        let section = NSCollectionLayoutSection(group: group)
        
        //return
        
        return UICollectionViewCompositionalLayout(section: section )
    }
    

}


extension TableViewCell: UICollectionViewDelegate{
    
}


extension TableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        cell.setup
        
        return cell
    }
    
    
}

