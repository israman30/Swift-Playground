import UIKit

extension UIButton {
    
    func setButton(_ title: String, fontSize: CGFloat = 0, bold: Bool, titleColor: UIColor, background: UIColor) {
        setTitle(title, for: .normal)
        if bold != true {
            titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        } else {
            titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        }
        setTitleColor(titleColor, for: .normal)
        backgroundColor = background
    }
    
    func setImageButton(image: UIImage? = nil, backgroundImage: UIImage? = nil) {
        setImage(image, for: .normal)
        setBackgroundImage(backgroundImage, for: .normal)
    }
}

extension UITextField {
    
    func setTextField(placeholder string: String = "", fontSize: CGFloat = 0, color: UIColor? = nil, secureEntry: Bool){
        placeholder = string
        UIFont.systemFont(ofSize: fontSize)
        textColor = color
        isSecureTextEntry = secureEntry
    }
    
    func placeholderAttributed(placeholder string: String, fontSize: CGFloat, color: UIColor, placeholderAlpha: CGFloat, inputTextColor: UIColor, inputSizeText: CGFloat = 0, secureEntry: Bool = false) {
        
        let placeholderWithAttributes = NSMutableAttributedString.init(
            attributedString: NSAttributedString(
                string: string, attributes: [
                    .font : UIFont.systemFont(ofSize: fontSize),
                    .foregroundColor : color.withAlphaComponent(placeholderAlpha)
                ]
            )
        )
        attributedPlaceholder = placeholderWithAttributes
        textColor = inputTextColor
        font = UIFont.systemFont(ofSize: inputSizeText)
        isSecureTextEntry = secureEntry
    }
    /*
     UITextField custom bottom line extension
    - Gives to the text field a bottom line with color
    - Dismiss the border and creates a bottom line using CALayer()
    - Added as a sublayer
    */
    func setTextFieldBottomLine(color: UIColor){
        // Create a bottom line with CALayer
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0,
                                  y: frame.height - 2,
                                  width: frame.width,
                                  height: 2)
        bottomLine.backgroundColor = color.cgColor
        // Remove text border
        borderStyle = .none
        
        // Add the line at the bottom of the textField
        layer.addSublayer(bottomLine)
    }
}

extension UILabel {
    
    func setLabel(text string: String = "", fontSize: CGFloat = 0, bold: Bool = false, color: UIColor? = nil, background: UIColor? = nil, aligment: NSTextAlignment = .left, isUppercased: Bool = false) {
        text = string
        textColor = color
        backgroundColor = background
        font = bold == false ?
            UIFont.systemFont(ofSize: fontSize) :
            UIFont.boldSystemFont(ofSize: fontSize)
        numberOfLines = 0
        textAlignment = aligment
        text = isUppercased != false ? string.uppercased() : string.lowercased()
    }
}

extension UIImageView {
    
    func setImageView(string photoImage: String = "", contentAspect: ContentMode, bounds: Bool = false){
        image = UIImage(named: photoImage)
        contentMode = contentAspect
        clipsToBounds = bounds
    }
}

/*
 UIColor extension
*/
extension UIColor {
    // Method returns a custom color
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return .init(red: blue / 255, green: green / 255, blue: blue / 255, alpha: 1.0)
    }
}

// MARK: - Hex UIColor extension
extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        
        let length = hexSanitized.count
        
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        
        switch length {
        case 6:
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
        case 8:
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
        default:
            return nil
        }
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    // Creating custom color method
    static func  mainColor() -> UIColor? {
        return UIColor(hex: "fcfbf0")
    }
}

/*
 ````
 func sayHello() {
     print("hello")
 }
 ````
 
 **/
func sayHello() {
    print("Hello")
}

