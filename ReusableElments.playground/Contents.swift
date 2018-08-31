//: Playground - noun: a place where people can play

import UIKit

// MARK: - Alert - Action Sheet Controller
struct AlertController {
    
    static func alert(viewController: UIAlertController, title: String, message: String){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    static func actionSheet(viewController: UIAlertController, title: String, message: String){
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        // TODO: add aditional buttons
        
        actionSheet.addAction(cancel)
        // TODO: add aditional buttons in actionSheet
        
        viewController.present(actionSheet, animated: true, completion: nil)
    }
}

/* Usage:
    pass the Alert class and alert function
    AlertController.alert(viewController: self,title: "My Title",message: "My message")
 */


//=====================================================================================================
/*
 UIImageView donwloader
 - Parameter as String: This method will serialize the an image URL taking as String.
 
*/
extension UIImageView {
    func downloadPhoto(urlPhoto: String){
        guard let url = URL(string: urlPhoto) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if error != nil {
                print("Image couldn't download: ", error!.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }.resume()
    }
}


/*
 - TableView animation
 - TableView cell will animate transforming the scale x, y when viewWillAppear
 */
extension TableViewClass {
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1.0)
        
        UIView.animate(withDuration: 0.5, animations: {
            cell.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
        }, completion: nil)
    }
}




