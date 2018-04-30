//
//  MovieDetails.swift
//  Movie List
//
//  Created by Ruth on 4/28/18.
//  Copyright © 2018 Ruth. All rights reserved.
//

import UIKit

class MovieDetails: UIViewController {
    
    var image = ""
    var Rate = ""
    var Name = ""
    var category = ""
    var ReleaseDate = ""

    @IBOutlet weak var catecory: UITextView!
    @IBOutlet weak var Releaseitem: UITextField!
    @IBOutlet weak var MovieRate: UILabel!
    @IBOutlet weak var MovieName: UILabel!
    @IBOutlet weak var ImageMovie: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        MovieName.text = Name
        MovieRate.text = Rate
        ImageMovie.image = UIImage(named: image)
        Releaseitem.text = ReleaseDate
        catecory.text = category
        
              // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setimg(Url : String) {
        
        let url = URL (string : Url )
        let Request = URLRequest (url: url!)
        let session = URLSession (configuration: URLSessionConfiguration.default)
        let task = 	session.dataTask(with: Request) {[weak self] (data, response, error) in
        do {
       let data = try! Data(contentsOf: url!)
            
             self?.ImageMovie.image = UIImage(data:data)
                
            }
   
        }
        
        task.resume()
        
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
