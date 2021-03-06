//
//  ArtWorkTableTableViewController.swift
//  Honolulu City
//
//  Created by mobapp08 on 29/01/2020.
//  Copyright © 2020 mobapp08. All rights reserved.
//

import UIKit

class ArtWorkTableTableViewController: UIViewController {
    
    
    @IBOutlet weak var tabView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var artsummary = [POI]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artsummary = DAO.sharedInstance.getAllArtWorks()
    }
    override func viewWillAppear(_ animated: Bool) {
        artsummary = DAO.sharedInstance.getAllArtWorks()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! ArtWorkTableViewCell
        let index = tabView.indexPath(for: cell)!
        let art = artsummary[index.item]
        
        let destination = segue.destination as! DetailsViewController
        
        destination.artwork = art
        
    }
}

extension ArtWorkTableTableViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artsummary.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexpath:IndexPath)->UITableViewCell{
        //maak verwijzing naar cell in storyboard
        let curCell:ArtWorkTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ArtWorkTableViewCell
        //juiste rij in DataSource gezocht
        let currArt = artsummary[indexpath.row]
        
        curCell.ArtTitle.text = currArt.title
        curCell.disciplineLabel.text = currArt.discipline
        
        
        return curCell
        
    }
}

