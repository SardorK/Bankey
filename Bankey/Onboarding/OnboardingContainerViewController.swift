//
//  OnboardingContainerViewController.swift
//  Bankey
//
//  Created by User 2 on 01/10/22.
//

import UIKit

class OnboardingContainerViewController: UIViewController {
    
    let pageViewController: UIPageViewController
    var pages = [UIViewController]()
    var currentVC: UIViewController{
        didSet{
            
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        let page1 = ViewController1()
        let page2 = ViewController2()
        let page3 = ViewController3()
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.topAnchor),
            view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false)
        currentVC = pages.first!
    }
}

extension OnboardingContainerViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }
    
    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController?{
        guard let index = pages.firstIndex(of: viewController),index - 1 >= 0 else {return nil}
        currentVC = pages[index - 1]
        return pages[index - 1]
    }
    
    private func getNextViewController(from viewController: UIViewController) -> UIViewController?{
        guard let index = pages.firstIndex(of: viewController),index + 1 < pages.count else {return nil}
        currentVC = pages[index + 1]
        return pages[index + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }
    
}


class ViewController1: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
}

class ViewController2: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
    }
}

class ViewController3: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
    }
}
