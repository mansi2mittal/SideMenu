//
//  LeftSideMenuViewController.swift
//  SideMenu
//
//  Created by Appinventiv on 23/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class LeftSideMenuViewController: UIViewController {
    
   // ARRAY TO STORE THE LABEL NAMES THAT HAS TO BE DISPLAYED INSIDE THE SIDE MENU
    
   let  arrayOfLabels = [" Red" , "Green" , "Blue" , " Yellow" ," Pink"]
    
   //OUTLETS
    
    @IBOutlet weak var leftSideTableView: UITableView!
    
    // VIEW LIFECYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.leftSideTableView.delegate = self
        self.leftSideTableView.dataSource = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
       

}
// MARK: EXTENSION OF THE MAIN VC FOR TABLE VIEW DELEGATES AND DATASOURCES

extension LeftSideMenuViewController : UITableViewDelegate , UITableViewDataSource
{
    // FUNCTION RETURNING THE NUMBER OF ROWS IN TABLEVIEW
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    // FUNCTION TO RETURN THE CELL AT A PARTICULAR INDEXPATH 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LeftMenuCellID") as? LeftMenuCell else{
            fatalError("Error Not Found")
        }
        
        cell.labelInCell.text = arrayOfLabels[indexPath.row]
        
        return cell
    }
    
     // FUNCTION DOING THE OPERATIONS ON THE SELECTED CELL
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row{
            
        case 0:
            
            let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "RedViewControllerID") as? RedViewController
            
            let parent = self.parent as! MainViewController
            parent.swapChild( child: newViewController!)
            
        case 1:
            
            let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "GreenViewControllerID") as? GreenViewController
            
            let parent = self.parent as! MainViewController
            parent.swapChild( child: newViewController!)
            
        default: print( " something is Wrong")


        }
        
    }
    
}

// CELL IN THE TABLE VIEW CELL

class LeftMenuCell : UITableViewCell
{
    
    @IBOutlet weak var labelInCell: UILabel!
}
