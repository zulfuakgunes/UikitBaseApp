import UIKit

class InfoDetailsView: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func getAllData(){
    }
    
}



extension InfoDetailsView: UITableViewDataSource{
    
    //MARK: Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.collectionView.tag = indexPath.section
        
        
        return cell
        
    }
    
    
}

extension InfoDetailsView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .green
    }
}
