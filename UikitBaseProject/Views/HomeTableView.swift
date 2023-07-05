import UIKit

class HomeTableView: UITableViewController{
    
    var homeTableViewModel = HomeTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeTableViewModel.users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = self.homeTableViewModel.users[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
    
    
    
    func getUsers(){
        NetworkManager.shared.getUser { [weak self] result in
            guard let self else{return}
            switch result{
            case .success(let users):
                homeTableViewModel.users = users
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
        let vc = storyBoard.instantiateViewController(identifier: "InfoDetailsView")
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeTableView: HomeTableViewModelOutput{
    func updateView() {
        tableView.reloadData()
    }
}

