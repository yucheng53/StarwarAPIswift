//
//  DetailsViewController.swift
//  starWarApi
//
//  Created by cheng on 11/14/22.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var detailNameLb: UILabel!
    
    @IBOutlet weak var detailEyeLb: UILabel!
    
    @IBOutlet weak var detailHomePlanetLb: UILabel!
    

    @IBOutlet weak var detailFilmsTextView: UITextView!
    
    var detailName = ""
    var detailEyeColor = ""
    var detailHomePlanet = ""
    var detailFilms = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailNameLb.text = "Name: " + detailName
        self.detailEyeLb.text = "Eye Color: " + detailEyeColor
        self.detailHomePlanetLb.text = "Home: " + detailHomePlanet
        let filmsString = detailFilms.joined(separator: "\n")
        self.detailFilmsTextView.text = "Films: \n" + filmsString
        //self.detailFilmsTextView.text = detailFilms[0]

        // Do any additional setup after loading the view.
    }
    
  



}
