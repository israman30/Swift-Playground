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
            if let error = error {
                print("Image couldn't download: ", error.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }.resume()
    }
    
    func secondDownloadUrl(url: URL){
        do {
            let data = try Data(contentsOf: url)
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        } catch let error {
            print("Error", error.localizedDescription)
        }
    }
}

// URL Image class
class URLImage {
    
    static func downloadUrlImage(image: URL, completion: @escaping (UIImage)-> Void) {
        
        URLSession.shared.dataTask(with: image) { (data, response, error) in
            if let error = error {
                print("Error", error.localizedDescription)
                return
            }
            guard let data = UIImage(data: data!) else { return }
            DispatchQueue.main.async {
                completion(data)
            }
        }.resume()
    }
    
    static func secondDownloadUrl(url: URL, completion: @escaping (UIImage)-> Void){
        do {
            let data = try Data(contentsOf: url)
            DispatchQueue.main.async {
                if let imageData = UIImage(data: data) {
                    completion(imageData)
                }
            }
        } catch let error {
            print("Error", error.localizedDescription)
        }
    }
}



/*
 - Adding views programmatically as sub views
*/
extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}

extension UIStackView {
    func addArrangeSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}

//=====================================================================================================


/*
 - Spinner Animation class
 */
class Spinner {
    
    static func spinerActivity(spinner status: Bool){
        
        let spinner = UIActivityIndicatorView()
        
        if status == true {
            spinner.isHidden = false
            spinner.startAnimating()
        } else {
            spinner.isHidden = true
            spinner.stopAnimating()
        }
    }
}

// Usage: -> User a downloadURL funciton
func secondDownloadUrl(url: URL, imageURL: UIImageView){
    // Start spinning = true
    Spinner.spinerActivity(spinner: true)
    do {
        let data = try Data(contentsOf: url)
        DispatchQueue.main.async {
            imageURL.image = UIImage(data: data)
            // Once image is downloaded, Start spinning = false
            Spinner.spinerActivity(spinner: false)
        }
    } catch let error {
        print("Error", error)
    }
}







