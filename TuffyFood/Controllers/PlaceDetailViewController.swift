//
//  PlaceDetailViewController.swift
//  TuffyFood
//
//  Created by csuftitan on 4/6/22.
//

import UIKit

class PlaceDetailViewController: UIViewController {
    @IBOutlet weak var placeLabel: UILabel!
    var placeData: restaurant?
    var placeImg: String?
    var rating: Int?

    @IBOutlet weak var star1: UILabel!
    @IBOutlet weak var star2: UILabel!
    @IBOutlet weak var star3: UILabel!
    @IBOutlet weak var star4: UILabel!
    @IBOutlet weak var star5: UILabel!
    @IBOutlet weak var coverPhoto: UIImageView!
    var starArray = [UILabel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        star1.isHidden = true
        star2.isHidden = true
        star3.isHidden = true
        star4.isHidden = true
        star5.isHidden = true
        starArray.append(star1)
        starArray.append(star2)
        starArray.append(star3)
        starArray.append(star4)
        starArray.append(star5)
        self.rating = placeData?.rating

        for (index, star) in  starArray.enumerated() {
            if (index == rating) {
                break;
            }
            star.isHidden = false
        }
        
        placeLabel.text = placeData?.title
        self.title = placeData?.title
        coverPhoto.loadFrom(URLAddress: placeData?.image ?? "")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        URLSession.shared.dataTask(with: url) {(data,ressponse,error) in
            if error != nil {
                print("Failed loading image")
                return
            }
            guard let response = ressponse as? HTTPURLResponse, response.statusCode == 200 else {
                print("Error http response")
                return
            }
            
            //Fetch the main thread
            DispatchQueue.main.async { [weak self] in
                if let imageData = try? Data(contentsOf: url) {
                    if let loadedImage = UIImage(data: imageData) {
                            self?.image = loadedImage
                    }
                }
            }
        }.resume()
        
     
    }
}
