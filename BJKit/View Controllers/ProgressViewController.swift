/*
    Created by Benny on 02/04/17.
    
    
    Abstract:
    A view controller that demonstrates how to use UIProgressView.
*/

import UIKit

class ProgressViewController: UITableViewController {
    @IBOutlet weak var defaultStyleProgressView: UIProgressView!
    @IBOutlet weak var barStyleProgressView: UIProgressView!
    @IBOutlet weak var tintedProgressView: UIProgressView!
    @IBOutlet var progressViews: [UIProgressView]!
    
    var observer: NSKeyValueObservation?
    let progress = Progress(totalUnitCount: 10)
    var updateTimer: Timer?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        observer = progress.observe(\.fractionCompleted, options: [.new], changeHandler: { (_, _) in
            for progressView in self.progressViews {
                progressView.setProgress(Float(self.progress.fractionCompleted), animated: true)
            }
        })
    }
    
    deinit {
        observer?.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDefaultStyleProgressView()
        configureBarStyleProgressView()
        configureTintedProgressView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Reset the completed progress of the `UIProgressView`s.
        for progressView in progressViews {
            progressView.setProgress(0.0, animated: false)
        }
        
        /** Reset the `completedUnitCount` of the `NSProgress` object and create
            a repeating timer to increment it over time.
        */
        progress.completedUnitCount = 0
        updateTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
            /** Update the `completedUnitCount` of the `NSProgress` object if it's
                not completed. Otherwise, stop the timer.
            */
            if self.progress.completedUnitCount < self.progress.totalUnitCount {
                self.progress.completedUnitCount += 1
            } else {
                self.updateTimer?.invalidate()
            }
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // Stop the timer from firing.
        updateTimer?.invalidate()
    }
    
    func configureDefaultStyleProgressView() {
        defaultStyleProgressView.progressViewStyle = .default
    }
    
    func configureBarStyleProgressView() {
        barStyleProgressView.progressViewStyle = .bar
    }
    
    func configureTintedProgressView() {
        tintedProgressView.progressViewStyle = .default
        tintedProgressView.trackTintColor = UIColor.systemBlue
        tintedProgressView.progressTintColor = UIColor.systemPurple
    }
}
