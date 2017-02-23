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

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        sideButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        
        rightSideButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        
        let leftViewController = self.storyboard?.instantiateViewController(withIdentifier: "LeftSideMenuViewControllerID")
        
        slide = leftViewController
        
        self.addChildViewController(slide!)
        
        self.view.addSubview((slide?.view)!)
        
        slide?.view.frame = CGRect(x : -220 , y: 200,  width: 200 ,height: 667 )
        
       let childViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChildViewControllerID")
        
        self.addChildViewController(childViewController!)
        
        self.containerView.addSubview((childViewController?.view)!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    

}




