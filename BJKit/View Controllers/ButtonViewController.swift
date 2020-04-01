/*
    Created by Benny on 02/04/17.
    
    
    Abstract:
    A view controller that demonstrates how to use UIButton. The buttons are created using storyboards, but each of the system buttons can be created in code by using the UIButton.buttonWithType() initializer. See the UIButton interface for a comprehensive list of the various UIButtonType values.
*/

import UIKit

class ButtonViewController: UITableViewController {
    @IBOutlet weak var systemTextButton: UIButton!
    @IBOutlet weak var systemContactAddButton: UIButton!
    @IBOutlet weak var systemDetailDisclosureButton: UIButton!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var attributedTextButton: UIButton!
    @IBOutlet weak var symbolButton: UIButton!
    @IBOutlet weak var symbolTextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // All of the buttons are created in the storyboard, but configured below.
        configureSystemTextButton()
        configureSystemContactAddButton()
        configureSystemDetailDisclosureButton()
        configureImageButton()
        configureAttributedTextSystemButton()
        configureSymbolButton()
        configureSymbolTextButton()
    }
    
    func configureSystemTextButton() {
        systemTextButton.titleLabel?.text = NSLocalizedString("Button", comment: "")
        systemTextButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    func configureSystemContactAddButton() {
        systemContactAddButton.backgroundColor = UIColor.clear
        systemContactAddButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    func configureSystemDetailDisclosureButton() {
        systemDetailDisclosureButton.backgroundColor = UIColor.clear
        systemDetailDisclosureButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    func configureImageButton() {
        imageButton.tintColor = .systemPurple
        imageButton .setTitle("", for: .normal)
        imageButton.setImage(#imageLiteral(resourceName: "x_icon"), for: .normal)
        imageButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    func configureAttributedTextSystemButton() {
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor : UIColor.systemGreen,
            NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.thick.rawValue
        ]
        let attributedString = NSAttributedString(string: NSLocalizedString("Button", comment: ""), attributes: attributes)
        attributedTextButton.setAttributedTitle(attributedString, for: .normal)
        attributedTextButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    func configureSymbolButton() {
        let buttonImage = UIImage(systemName: "person")
        symbolButton.setImage(buttonImage, for: .normal)
        symbolButton.accessibilityLabel = NSLocalizedString("Person", comment: "")
        symbolButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    func configureSymbolTextButton() {
        let buttonImage = UIImage(systemName: "person")
        symbolTextButton.setImage(buttonImage, for: .normal)
        symbolTextButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        symbolTextButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        let config = UIImage.SymbolConfiguration(textStyle: .body, scale: .small)
        symbolTextButton.setPreferredSymbolConfiguration(config, forImageIn: .normal)
    }
    
    //MARK: Button tapped
    @objc func buttonTapped(_ button: UIButton) {
        print("A button was clicked: \(button).")
    }
}
