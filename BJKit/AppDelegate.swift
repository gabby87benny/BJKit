/*
    Created by Benny on 02/04/17.
    
    
    Abstract:
    The application-specific delegate class.
*/

import UIKit

@UIApplicationMain
class AppDelegate: NSObject, UIApplicationDelegate {
    // MARK: - Properties

    var window: UIWindow?

    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let detailManager = DetailViewManager()
        
        if let splitVC = window?.rootViewController as? UISplitViewController {
            splitVC.preferredDisplayMode = .allVisible
            splitVC.delegate = detailManager
            splitVC.primaryBackgroundStyle = .sidebar
            detailManager.splitVC = splitVC
        }
        
        return true
    }
    
}
