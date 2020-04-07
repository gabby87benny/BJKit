/*
    Created by Benny on 02/04/17.
    
    
    Abstract:
    A view controller that demonstrates how to use UIPageControl.
*/

import UIKit

class PageControlViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var colorView: UIView!
    
    // Colors that correspond to the selected page. Used as the background color for `colorView`.
    let colors = [
        UIColor.black,
        UIColor.systemGray,
        UIColor.systemRed,
        UIColor.systemGreen,
        UIColor.systemBlue,
        UIColor.systemPink,
        UIColor.systemYellow,
        UIColor.systemIndigo,
        UIColor.systemOrange,
        UIColor.systemPurple
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageControl()
        pageControlValueDidChange()
    }

    func configurePageControl() {
        pageControl.numberOfPages = colors.count
        pageControl.currentPage = 2
        pageControl.pageIndicatorTintColor = UIColor.systemGreen
        pageControl.currentPageIndicatorTintColor = UIColor.systemPurple
        pageControl.addTarget(self, action: #selector(PageControlViewController.pageControlValueDidChange), for: .valueChanged)
    }
    
    @objc func pageControlValueDidChange() {
        colorView.backgroundColor = colors[pageControl.currentPage]
    }
}
