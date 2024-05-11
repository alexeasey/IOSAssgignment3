

import UIKit
import FirebaseDatabase
import NVActivityIndicatorView

class BaseClass: UIViewController {
    
    var loaderIndicator: NVActivityIndicatorView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loaderinit()
        
    }
    
    func loaderinit() {
        loaderIndicator = NVActivityIndicatorView(frame: CGRect(x: self.view.frame.width/2 - 25, y: self.view.frame.height/2 , width: 50, height: 50), type: .ballScaleRippleMultiple, color: .black , padding: 1)
        view.addSubview(loaderIndicator!)
    }
    func startLoading() {
        loaderIndicator?.startAnimating()
    }
    
    func stopLoading() {
        loaderIndicator?.stopAnimating()
    }
    
    
    func pushVC(nameOfVC : String , storyboardName : AppStoryboard) {
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: nameOfVC)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goBack() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    func showAlert(title: String = "Alert" , msg: String ,btn : String = "OK") {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btn, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithClosure(title: String, message: String, onSuccess closure: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .`default`, handler: { _ in
            closure()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
