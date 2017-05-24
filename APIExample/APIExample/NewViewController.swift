//
//  NewViewController.swift
//  APIExample
//
//  Created by Manish Kumar on 03/01/17.
//  Copyright © 2017 appface. All rights reserved.
//

import UIKit

class NewViewController: UIPageViewController,UIPageViewControllerDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataSource = self
        
        if let firsvi
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    private(set) lazy var orderedViewControllers: [UIViewController] = {
//        return [self.newColoredViewController(name: "apj_abdul_kalam"),
//                self.newColoredViewController(name: "hitler"),
//                self.newColoredViewController(name: "albert"),
//                self.newColoredViewController(name: "home")]
//    }()
//    private func newColoredViewController(name: String) -> UIViewController {
//        return UIStoryboard(name: "Main", bundle: nil) .
//            instantiateViewController(withIdentifier: "\(name)ViewController")
//    }
    private func newPageViewController (name:String)->UIViewController{
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(name)ViewController")
    }
    
     lazy var orderedViewController:[UIViewController] = {
        return [self.new
    }
    
    
//    private(set) lazy var orderViewController:[UIViewController] = {
//        return [self.newPageController(name : str)]
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{}
    
   
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    
    }
}
