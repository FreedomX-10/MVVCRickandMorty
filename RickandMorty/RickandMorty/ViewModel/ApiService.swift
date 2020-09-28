//
//  ApiService.swift
//  RickandMorty
//
//  Created by Akkarin Phain on 28/9/2563 BE.
//

import Foundation

// call api
struct RickandMorty{
    
    func parse(comp: @escaping ([Result]) -> ()) {
        let url = URL(string: "https://rickandmortyapi.com/api/character/")
        URLSession.shared.dataTask(with: url!){
            data,response,error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            do{
                let result = try JSONDecoder().decode(RickData.self, from: data!)
                
               
                comp(result.results)
            }catch{
                
            }
        }.resume()
        
    }
    
}
