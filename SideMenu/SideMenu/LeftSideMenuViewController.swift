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
        
        leftSideTableView.delegate = self
        leftSideTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
// MARK: EXTENSION OF THE MAIN VC FOR TABLE VIEW DELEGATES AND DATASOURCES

extension LeftSideMenuViewController : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LeftMenuCellID") as? LeftMenuCell else{
            fatalError("Error Not Found")
        }
        
        cell.labelInCell.text = arrayOfLabels[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0
        {
            let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "BlueViewControllerID") as! BlueViewController
            
            UIView.animate(withDuration: 0.1 , delay: 0.0, options: .curveEaseInOut, animations:
                {  self.navigationController?.pushViewController(newViewController, animated: true)
            }, completion:nil )

        }
        
    }
}

// CELL IN THE TABLE VIEW CELL

class LeftMenuCell : UITableViewCell
{
    
    @IBOutlet weak var labelInCell: UILabel!
}
