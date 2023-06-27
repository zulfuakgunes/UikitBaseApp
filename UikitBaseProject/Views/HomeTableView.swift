import UIKit

class HomeTableView: UITableViewController{

    private var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.getUser { [weak self] result in
            switch result{
            case .success(let users):
                
                    self?.users = users
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
        content.text = self.users[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
}


