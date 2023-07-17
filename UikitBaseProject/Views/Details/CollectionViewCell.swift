import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var detailsLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        detailsLabel.sizeToFit()
        detailsLabel.backgroundColor = .systemCyan
    }
    
    
    
    
}
