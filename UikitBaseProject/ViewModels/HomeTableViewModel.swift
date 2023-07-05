import Foundation


protocol HomeTableViewModelOutput: AnyObject{
    func updateView()
}

final class HomeTableViewModel {
    
    
    weak var output: HomeTableViewModelOutput?
    var reloadTableView:(() -> Void)?
    
    var users = [User]()

    
    
}
