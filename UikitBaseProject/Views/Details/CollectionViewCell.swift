import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var detailsLabel: UILabel!
    
    //var selectedLabel = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        detailsLabel.sizeToFit()
        detailsLabel.backgroundColor = .systemCyan
        //detailsLabel.text = selectedLabel
    }
    
    
    
    
}
