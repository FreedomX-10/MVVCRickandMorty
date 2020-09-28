//
//  ViewController.swift
//  RickandMorty
//
//  Created by Akkarin Phain on 28/9/2563 BE.
//

import UIKit

class ViewController: UIViewController {
   
    let parser = RickandMorty()
    var contacts = [Result]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        parser.parse{
            data in
            self.contacts = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        tableView.dataSource = self
        tableView.delegate = self
        
    }

// call Data Table by name
    
}


extension ViewController : UITableViewDataSource,UITableViewDelegate{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return contacts.count

}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
    cell.textLabel?.text = contacts[indexPath.row].name.capitalized
    return cell
}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RickViewController {
            destination.Rick = contacts[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    
    
}
