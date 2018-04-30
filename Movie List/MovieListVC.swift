//
//  MovieListVC.swift
//  Movie List
//
//  Created by Ruth on 4/28/18.
//  Copyright © 2018 Ruth. All rights reserved.
//

import UIKit

class MovieListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableviewmovie: UITableView!
          
var Data = [MovieModel]()
    
    
    
//    var genre = [[String]]()
//    var Name = [String] ()
//    var Image = [String]()
//    var rate = [Double]()
//    var releasedate = [Int]()
//    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
       
       let url = URL (string: "http://api.androidhive.info/json/movies.json")
        let Request = URLRequest (url: url!)
        let session = URLSession (configuration: URLSessionConfiguration.default)
        let task = 	session.dataTask(with: Request) {[weak self] (data, response, error) in
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String : Any]]
                    
                    else{
                        return
                }

            
                
                
                DispatchQueue.main.sync {
                    
                    for categ in json {
//                        
//                        guard let genre = categ ["genre"]  as? [String]
//                            else{
//                                return
//                        }
//                        
//                        self?.genre.append(genre)
//                        
//                           else{
//                                return
//                        }
//                        self?.Name.append("title")
//                        
//                        guard let image = categ ["image"] as? String
//                            
//                            else{
//                                return
//                        }
//                        self?.Image.append("image")
//                        
//                        guard let rating = categ ["rating"] as? Double
//                            else{
//                                return
//                        }
//                        self?.rate.append(rating)
//                        
//                        guard let releaseYear = categ ["releaseYear"] as? Int
//                            else {
//                                return
//                        }
//                        self?.releasedate.append(releaseYear) guard let title = categ ["title"] as? String
                        
                    
                       self?.Data.append(MovieModel(image: categ ["image"] as! String, Nametext: categ["title"] as! String, Rate: categ["rating"] as! Double, ReleaseDate: categ["releaseYear"] as! Int, Genre: categ["genre"] as! [String]))
                        
                         }
                
                    self?.tableviewmovie.reloadData()
                
            }
            }
                
            catch {
                print("Cannot Load from Server")
            }
            
            }
            
        task.resume()
        }
        
        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieListCell
        
        cell.MovieName?.text = Data[indexPath.row].Title
        cell.MovieRate.text = String(Data[indexPath.row].Rate)
        cell.setimg(Url: Data[indexPath.row].image)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let MoviedetailsObj = storyboard?.instantiateViewController(withIdentifier: "MovieDetails") as? MovieDetails
        MoviedetailsObj?.Name = Data[indexPath.row].Title
        MoviedetailsObj?.category = String(describing: Data[indexPath.row].Genre)
        MoviedetailsObj?.Rate = String(Data[indexPath.row].Rate)
        MoviedetailsObj?.ReleaseDate = String(Data[indexPath.row].ReleaseDate)
        MoviedetailsObj?.setimg(Url: Data[indexPath.row].image)

            
        navigationController?.pushViewController(MoviedetailsObj!, animated: true)
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
