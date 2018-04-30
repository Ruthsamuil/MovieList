//
//  ViewController.swift
//  Movie List
//
//  Created by Ruth on 4/28/18.
//  Copyright © 2018 Ruth. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    
    enum Genre {
        case Action
        case Comedy
        case Drama
        case SciFi
        case Thriller
        case Adventure
        case History
        case Fantasy
        case Family
        case Animation
        case Horror
        case Crime
        
        static var count: Int { return Genre.Crime.hashValue+1 }
        
    }
    func MovieCategory(parameters) -> <#return type#> {
        <#function body#>
    }
    
let values = [Genre]()
    
    
    // var categoryarray = Category.self as! [String]
    
    var genre = [[String]]()
    var Name = [String] ()
    var image = [String]()
    var rate = [Double]()
    var releasedate = [Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL (string: "http://api.androidhive.info/json/movies.json")
        let Request = URLRequest (url: url!)
        let session = URLSession (configuration: URLSessionConfiguration.default)
        let task = 	session.dataTask(with: Request) {[weak self] (data, response, error) in
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String : Any]]
                
                    else{
                        return
               }
                
                for categ in json {
                    
                    guard let genre = categ ["genre"]  as? [String]
                       else{
                            return
                    }
                
                self?.genre.append(genre)
                    
                    guard let title = categ ["title"] as? String
                        else{
                            return
                    }
                self?.Name.append("title")
                    
                    guard let image = categ ["image"] as? String
                    
                        else{
                          return
                    }
                    self?.image.append("image")
                    
                    guard let rating = categ ["rating"] as? Double
                        else{
                            return
                    }
                   self?.rate.append(rating)
                    
                    guard let releaseYear = categ ["releaseYear"] as? Int
                        else {
                            return
                    }
                    self?.releasedate.append(releaseYear)
                }
                
               
               DispatchQueue.main.async {
                    self?.collectionview.reloadData()
               }
            }
    catch {
    }

        }
    task.resume()
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return Genre.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell" , for: indexPath)
        
     
        let labeltext = cell .viewWithTag(1) as! UILabel
        labeltext.text = String (describing: values [indexPath.row])
        
        return cell
        
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        switch Genre.self {
        case Genre.Action:
           

        default:
            <#code#>
        }
    }
}



