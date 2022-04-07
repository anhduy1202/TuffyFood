//
//  PlaceDetailViewController.swift
//  TuffyFood
//
//  Created by csuftitan on 4/6/22.
//

import UIKit

class PlaceDetailViewController: UIViewController {
    var placeData: restaurant?
    var placeImg: String?
    @IBOutlet weak var coverPhoto: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
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
