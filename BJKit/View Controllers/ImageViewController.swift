/*
    Created by Benny on 02/04/17.
    
    
    Abstract:
    A view controller that demonstrates how to use UIImageView.
*/

import UIKit

class ImageViewController: UIViewController {
    // MARK: - View Life Cycle

    @IBOutlet weak var customImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImageView()
    }
    
    // MARK: - Configuration
    
    func configureImageView() {
        // We want the image to be scaled to the correct aspect ratio within imageView's bounds.
        customImageView.animationImages = (1...2).map {
            (UIImage(named: "Flowers_\($0)")!)
        }
        customImageView.contentMode = .scaleAspectFit
        customImageView.animationDuration = 5
        customImageView.startAnimating()
        customImageView.isAccessibilityElement = true
        customImageView.accessibilityLabel = NSLocalizedString("Animated", comment: "")
    }
}
