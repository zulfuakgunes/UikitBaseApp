//
//  CustomCollectionViewCell.swift
//  UikitBaseProject
//
//  Created by Zülfü Akgüneş on 5.07.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dataLabel: UILabel!
    
    func setup(user: String){
        dataLabel.text = user
    }
    
    
}
