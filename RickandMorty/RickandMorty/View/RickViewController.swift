//
//  RickViewController.swift
//  RickandMorty
//
//  Created by Akkarin Phain on 28/9/2563 BE.
//

import UIKit


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class RickViewController: UIViewController {
    
    

    @IBOutlet weak var imageView: UIImageView!
    
    
    
    
    
    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var statusView: UILabel!
    @IBOutlet weak var speciesView: UILabel!
    @IBOutlet weak var genderView: UILabel!
    @IBOutlet weak var createdView: UILabel!
    
    
    var Rick: Result?
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //show Detail
        nameView.text = "Name: " + (Rick?.name)!
        statusView.text = "Status: " + (Rick?.status)!
        speciesView.text = "Species: " + (Rick?.species)!
        genderView.text = "Sex: " + (Rick?.gender)!
        createdView.text = "Created " + (Rick?.created)!
        
        
      
        guard let post = Rick?.image else { return  }
        let urlString = post
        
        let url = URL(string: urlString)
        
        imageView.downloaded(from: url!)
      
        
        
        

        

        
        
    }
}

