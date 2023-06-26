
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkManager.shared.getUser { result in
            switch result {
            case .success(let success):
                success.forEach { user in
                    print(user.name)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
        
        
    }
}

