//
//  ViewController.swift
//  SlideDownMenu
//
//  Created by Adnann Muratovic on 31.08.21.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    let menuTransitionManager = MenuTransitionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        let sourceControler = segue.source as! MenuTableViewController
        self.title = sourceControler.currentItems
    }
}

extension NewsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        
        // ConfigureCell
        if indexPath.row == 0 {
            cell.postImageVIew.image = UIImage(named: "red-lights-lisbon")
            cell.titleLabel.text = "Red Lights, Lisabon"
            cell.authorNameLabel.text = "Adnann Muratovic (@adnann)"
            cell.authorImageView.image = UIImage(named: "image")
        } else if indexPath.row == 1 {
            cell.postImageVIew.image = UIImage(named: "val-throrens-france")
            cell.titleLabel.text = "Val, Thorens, France"
            cell.authorNameLabel.text = "Adnann Muratovic (@adnann)"
            cell.authorImageView.image = UIImage(named: "image")
        } else if indexPath.row == 2 {
            cell.postImageVIew.image = UIImage(named: "summer-beach-huts")
            cell.titleLabel.text = "Summer Beach Huts, England"
            cell.authorNameLabel.text = "Adnann Muratovic (@adnann)"
            cell.authorImageView.image = UIImage(named: "image")
        } else {
            cell.postImageVIew.image = UIImage(named: "taxis-nyc")
            cell.titleLabel.text = "Taxis, NYC"
            cell.authorNameLabel.text = "Adnann Muratovic (@adnann)"
            cell.authorImageView.image = UIImage(named: "image")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Navigarion Title
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let menuTableViewControler = segue.destination as! MenuTableViewController
        menuTableViewControler.currentItems = self.title!
        menuTableViewControler.transitioningDelegate = menuTransitionManager
        menuTableViewControler.modalPresentationStyle = .fullScreen
        menuTransitionManager.delegate = self
    }
}


extension NewsTableViewController: MenuTransitiomManagerDelegate {
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
