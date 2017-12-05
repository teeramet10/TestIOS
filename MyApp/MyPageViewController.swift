//
//  MyPageViewController.swift
//  MyApp
//
//  Created by teeramet kanchanapiroj on 11/27/2560 BE.
//  Copyright © 2560 teeramet kanchanapiroj. All rights reserved.
//

import UIKit

class MyPageViewController: UIPageViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    
    lazy var page : [UIViewController] = {
        return [self.inistance(identifier: "PageView1"),
                self.inistance(identifier: "PageView2"),
                self.inistance(identifier: "PageView3")]
        
    }()
    
    func inistance (identifier : String ) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:identifier)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewIndex = page.index(of: viewController) else { return nil }
        let previous = viewIndex - 1
        guard previous < 0 else {return page.first}
        guard page.count < previous else {return nil}
        return page[previous]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
       
        guard let viewIndex = page.index(of: viewController) else { return nil}
        let nextIndex = viewIndex+1
        guard nextIndex <= page.count else { return page.last}
        guard page.count > nextIndex else { return nil }
        return page[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return (self.page.count)
    }
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        if let first = page.first {
            setViewControllers([first], direction: .forward, animated: true, completion: nil)
        }
        let pagecontrol = UIPageControl.init(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY-36, width: UIScreen.main.bounds.width, height: 50))
        pagecontrol.currentPage = 0
        pagecontrol.tintColor = UIColor.black
        pagecontrol.numberOfPages = page.count
        pagecontrol.currentPageIndicatorTintColor = UIColor.white
        pagecontrol.pageIndicatorTintColor = UIColor.black
        self.view.addSubview(pagecontrol)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
