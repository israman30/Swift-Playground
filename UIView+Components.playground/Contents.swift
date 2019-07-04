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

