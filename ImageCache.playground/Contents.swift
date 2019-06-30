/*
    IMAGE CACHE
    - Capturing image with cache when is downloaded with a url image
    - Reusable image for cell item/row
 */

import UIKit

let imageCahe = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func chacheImageURLString(urlString: String) {
        
        // - Set image to nil when imageView is going to be re-used
        image = nil
        
        // MARK: - Check if image are cached before session
        if let cache = imageCahe.object(forKey: urlString as AnyObject) as? UIImage {
            image = cache
            return
        }
        
        // MARK: - If there is not image cached, do session
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, res, error) in
                if let error = error {
                    print("Error getting url",error.localizedDescription)
                    return
                }
                guard let data = data else { return }
                
                DispatchQueue.main.async {
                    if let downloadImage = UIImage(data: data) {
                        imageCahe.setObject(downloadImage, forKey: urlString as AnyObject)
                        self.image = downloadImage
                    }
                }
            }.resume()
        }
    }
}

