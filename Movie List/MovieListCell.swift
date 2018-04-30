//
//  MovieListCell.swift
//  Movie List
//
//  Created by Ruth on 4/30/18.
//  Copyright © 2018 Ruth. All rights reserved.
//

import UIKit

class MovieListCell: UITableViewCell {
    
        

    @IBOutlet weak var MovieRate: UILabel!
    @IBOutlet weak var MovieName: UILabel!
    @IBOutlet weak var MovieImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setimg(Url : String) {
        
        let url = URL (string: Url)
        let Request = URLRequest (url: url!)
        let session = URLSession (configuration: URLSessionConfiguration.default)
        let task = 	session.dataTask(with: Request) {[weak self] (data, response, error) in
        do {
            let data = try! Data(contentsOf: url!)
               self?.MovieImage.image = UIImage(data: data)
                
            }

        
        }
        task.resume()
}

}
