import UIKit

enum ComposotionalGroupAlignment{
    case vertical
    case horizontal
}


struct CompositionalLayout{
    
    static func createItem(height:NSCollectionLayoutDimension , width:NSCollectionLayoutDimension, spacing:CGFloat) -> NSCollectionLayoutItem{
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        
        return item
    }
    
    static func createGroup(alignment:ComposotionalGroupAlignment ,width: NSCollectionLayoutDimension, height: NSCollectionLayoutDimension, items: [NSCollectionLayoutItem]) -> NSCollectionLayoutGroup{
        switch alignment{
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitems: items)
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitems: items)
        }


    }
    
    
}
