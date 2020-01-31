//
//  AboutViewController.swift
//  Honolulu City
//
//  Created by mobapp08 on 30/01/2020.
//  Copyright © 2020 mobapp08. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    var images: [String] = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","9.png","11.jpg"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        pageControl.numberOfPages = images.count
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        
        for index in 0..<images.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let imageView = UIImageView(frame: frame)
            imageView.image = UIImage(named: images[index])
            self.scrollView.addSubview(imageView)
        }
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(images.count), height: scrollView.frame.size.height)
        scrollView.delegate = self
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumb = scrollView.contentOffset.x/scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumb)
    }
    
}
