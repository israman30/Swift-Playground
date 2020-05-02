//: Playground - noun: a place where people can play

import UIKit

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







