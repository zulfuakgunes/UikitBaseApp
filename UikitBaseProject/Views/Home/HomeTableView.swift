import UIKit

class HomeTableView: UITableViewController{
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeTableViewCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = self.users[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
    
    
    
    private func getUsers(){
        NetworkManager.shared.getUser { [weak self] result in
            guard let self else{return}
            switch result{
            case .success(let users):
                self.users = users
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
}

extension HomeTableView{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "InfoDetailsView") as! InfoDetailsView
        
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}


