import UIKit

class InfoDetailsView: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
        
    private var data = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
   
    private func getData(){
        NetworkManager.shared.getUser { [weak self] result in
            guard let self else{ return }
            switch result{
            case .success(let data):
                self.data = data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    
}


extension InfoDetailsView: UITableViewDataSource{
    
    //MARK: Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Personal Info"
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.cell, for: indexPath) as! TableViewCell
        
        
        return cell

    }
    
}

extension InfoDetailsView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .green
    }
}

