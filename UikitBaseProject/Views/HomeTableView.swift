import UIKit

class HomeTableView: UITableViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.getUser { result in
            switch result{
            case .success(let success):
                success.forEach { User in
                    print(User)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
        content.text = "Hello World"
        cell.contentConfiguration = content
        
        return cell
    }
}
