/*
    Created by Benny on 3/30/20.
    
    
    Abstract:
    A view controller that demonstrates how to use UIActivityIndicatorView.
*/

import UIKit

class ActivityIndicatorViewController: UITableViewController {
    @IBOutlet weak var defaultSmallActivityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var defaultLargeActivityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var tintedSmallActivityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var tintedLargeActivityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDefaultActivityIndicator()
        configureTintedActivityIndicator()
    }
    
    func configureDefaultActivityIndicator() {
        defaultSmallActivityIndicatorView.style = UIActivityIndicatorView.Style.medium
        defaultLargeActivityIndicatorView.style = UIActivityIndicatorView.Style.large
        
        defaultSmallActivityIndicatorView.startAnimating()
        defaultLargeActivityIndicatorView.startAnimating()
        
        defaultSmallActivityIndicatorView.hidesWhenStopped = true
        defaultLargeActivityIndicatorView.hidesWhenStopped = true
    }
    
    func configureTintedActivityIndicator() {
        tintedSmallActivityIndicatorView.style = UIActivityIndicatorView.Style.medium
        tintedLargeActivityIndicatorView.style = UIActivityIndicatorView.Style.large
        
        tintedSmallActivityIndicatorView.color = UIColor.systemPurple
        tintedLargeActivityIndicatorView.color = UIColor.systemPurple
        
        tintedSmallActivityIndicatorView.startAnimating()
        tintedLargeActivityIndicatorView.startAnimating()
    }
}
