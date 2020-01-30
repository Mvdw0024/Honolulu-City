//
//  DetailsViewController.swift
//  Honolulu City
//
//  Created by mobapp08 on 30/01/2020.
//  Copyright © 2020 mobapp08. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var artwork:POI?
    
    @IBOutlet weak var disciplineLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var creatorLabel: UILabel!
    @IBOutlet weak var descLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if artwork != nil{
            
            disciplineLabel.text = artwork!.discipline
            dateLabel.text = artwork!.date
            titleLabel.text = artwork!.title
            creatorLabel.text = artwork!.creator
            descLabel.text = artwork!.artdescription
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
