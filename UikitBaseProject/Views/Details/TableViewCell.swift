import UIKit

class TableViewCell: UITableViewCell {
    
    var detailsInfo = [User]()

    
    @IBOutlet weak var collectionView: UICollectionView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        getDetails()
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    

    func getDetails(){
        NetworkManager.shared.getUser { [weak self] result in
            guard let self else {return}
            switch result{
            case .success(let users):
                self.detailsInfo = users
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
}


extension TableViewCell: UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.collectionViewCell, for: indexPath) as! CollectionViewCell
        let detailsData = detailsInfo[indexPath.row]
        cell.detailsLabel.text = "Name: \(detailsData.name) Username: \(detailsData.username) Email: \(detailsData.email)"
        return cell
    }
    
}


