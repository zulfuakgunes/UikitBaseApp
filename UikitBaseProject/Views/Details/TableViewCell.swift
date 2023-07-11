import UIKit

class TableViewCell: UITableViewCell {
    
    let data:[String] = ["Remzi", "Fatmagül", "Dicle", "Zülfü","Remzi", "Fatmagül", "Dicle", "Zülfü","Remzi", "Fatmagül", "Dicle", "Zülfü","Remzi", "Fatmagül", "Dicle", "Zülfü","Remzi", "Fatmagül", "Dicle", "Zülfü","Remzi", "Fatmagül", "Dicle", "Zülfü","Remzi", "Fatmagül", "Dicle", "Zülfü","Remzi", "Fatmagül", "Dicle", "Zülfü","Remzi", "Fatmagül", "Dicle", "Zülfü","Remzi", "Fatmagül", "Dicle", "Zülfü","Remzi", "Fatmagül", "Dicle", "Zülfü","Remzi", "Fatmagül", "Dicle", "Zülfü","Remzi", "Fatmagül", "Dicle", "Zülfü","Remzi", "Fatmagül", "Dicle", "Zülfü","Remzi", "Fatmagül", "Dicle", "Zülfü","Remzi", "Fatmagül", "Dicle", "Zülfü"]
    
    @IBOutlet weak var collectionView: UICollectionView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


extension TableViewCell: UICollectionViewDelegate{
    
}


extension TableViewCell: UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        cell.detailsLabel.text = data[indexPath.row]
        return cell
    }
    
    
}

