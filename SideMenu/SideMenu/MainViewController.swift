//
//  MainViewController.swift
//  SideMenu
//
//  Created by Appinventiv on 23/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var sideButton: UIButton!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var rightSideButton: UIButton!
    
    var slide : UIViewController!
    
    var storePage = UIViewController()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        slide = self.storyboard?.instantiateViewController(withIdentifier: "LeftSideMenuViewControllerID") as! LeftSideMenuViewController
        
        storePage = self.storyboard?.instantiateViewController(withIdentifier: "ChildViewControllerID")as!  ChildViewController

        sideButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        
        rightSideButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        
      }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewWillLayoutSubviews()
    {
        self.addChildViewController(storePage)
        
        storePage.view.frame = CGRect( x: 0 ,y: 64 , width: Int(self.view.frame.width), height: Int(self.view.frame.height - 60))
        
        storePage.didMove(toParentViewController: self)
        
        self.view.addSubview(storePage.view)

        self.sideButton.isSelected = false
        
        self.addChildViewController(slide)
        
        self.view.addSubview(slide.view)
        
        slide.view.frame = CGRect(x : -200 , y: 64 , width: 200 , height: 667)
        
        slide.didMove(toParentViewController: self)
        
        print(self.childViewControllers.count)
    }

    // FUNCTION TO DISPLAY THE LEFT SIDE MENU ON THE CLICK OF THE LEFT BUTTON
    
    func leftButtonTapped( sender : UIButton)
    {
        
        if sender.isSelected {
            
            sender.isSelected = false
            
         UIView.animate( withDuration: 0.05, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .allowAnimatedContent, animations: ({
            
        self.slide.view.frame = CGRect(x : -420 , y: 90,  width: 200 ,height: 667 )
    
        }), completion: nil)
        }
        else
        {
            sender.isSelected = true
            
            UIView.animate( withDuration: 0.05, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .allowAnimatedContent, animations: ({
                
            self.slide?.view.frame = CGRect(x : 0 , y: 120,  width: 150 ,height: 667 )
                
            }), completion: nil)

        }


        
    }
    // FUNCTION TO DISPLAY THE  RIGHT SIDE MENU ON THE CLICK OF THE RIGHT BUTTON
    
    func rightButtonTapped( sender : UIButton)
    {
        if sender.isSelected {
            sender.isSelected = false
            
            UIView.animate( withDuration: 0.05, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .allowAnimatedContent, animations: ({
                
                self.slide.view.frame = CGRect(x : 600 , y: 90,  width: 200 ,height: 667 )
                
            }), completion: nil)
            
        
        }
        else
        {
            sender.isSelected = true
            
            UIView.animate( withDuration: 0.05, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .allowAnimatedContent, animations: ({
                
                self.slide?.view.frame = CGRect(x : 250 , y: 120,  width: 150 ,height: 667 )
                
            }), completion: nil)
            
        }

    }
    
    func swapChild( child : UIViewController){
        
        storePage.removeFromParentViewController()
        storePage = child
        viewWillLayoutSubviews()
    }
    

}




