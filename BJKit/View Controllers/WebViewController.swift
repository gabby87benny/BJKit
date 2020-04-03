/*
    Created by Benny on 02/04/17.
    
    
    Abstract:
    A view controller that demonstrates how to use UIWebView.
*/

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        loadAddressURL()
    }
    
    func loadAddressURL() {
        if let url = Bundle.main.url(forResource: "content", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url)
        }
    }
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        let webKitError = error as NSError
        if webKitError.code == NSURLErrorNotConnectedToInternet {
            // Report the error inside the web view.
            let localizedErrorMessage = NSLocalizedString("An error occurred:", comment: "")
            
            let message = "\(localizedErrorMessage) \(error.localizedDescription)"
            let errorHTML =
                "<!doctype html><html><body><font color = 'red'><div style=\"width: 100%%; text-align: center; font-size: 36pt;\">\(message)</div></font></body></html>"
            
            webView.loadHTMLString(errorHTML, baseURL: nil)
        }
    }
}
