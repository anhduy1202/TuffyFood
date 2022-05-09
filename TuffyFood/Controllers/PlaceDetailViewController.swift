//
//  PlaceDetailViewController.swift
//  TuffyFood
//
//  Created by csuftitan on 4/6/22.
//

import UIKit
import FirebaseAuth
import Firebase

class PlaceDetailViewController: UIViewController {
    @IBOutlet weak var placeLabel: UILabel!
    var placeData: restaurant?
    var placeImg: String?
    var rating: String?
    var email: String = ""
    var ref: DatabaseReference?
    var reviewRef: DatabaseReference?
    var reviews: [Reviews] = []
 
    @IBOutlet weak var reviewTableView: UITableView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBAction func ratingOnSlide(_ sender: UISlider) {
        ratingLabel.text = "\(String(round(ratingSlider.value))) / 5"
        self.rating = String(ratingSlider.value)
    }
    @IBOutlet weak var ratingSlider: UISlider!
    @IBOutlet weak var openButton: UIButton!
    
    @IBOutlet weak var closeButton: UIButton!
    @IBAction func showReview(_ sender: Any) {
        reviewField.isHidden = false
        openButton.isHidden = true
        ratingSlider.isHidden = false
        ratingLabel.isHidden = false
        closeButton.isHidden = false
        submitReviewBtn.isHidden = false
    }
    @IBAction func hideReview(_ sender: Any) {
        reviewField.isHidden = true
        ratingSlider.isHidden = true
        ratingLabel.isHidden = true
        openButton.isHidden = false
        closeButton.isHidden = true
        submitReviewBtn.isHidden = true
    }
    @IBOutlet weak var submitReviewBtn: UIButton!
    @IBOutlet weak var reviewField: UITextView!
    @IBOutlet weak var star1: UILabel!
    @IBOutlet weak var star2: UILabel!
    @IBOutlet weak var star3: UILabel!
    @IBOutlet weak var star4: UILabel!
    @IBOutlet weak var star5: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var coverPhoto: UIImageView!
    var starArray = [UILabel]()
    
    @IBAction func postReview(_ sender: UIButton) {
        let post = [
            "author": email,
            "content": reviewField.text!,
            "rating": String(round(ratingSlider.value))
        ] as [String : Any]
        
        ref!.setValue(post) {
            (error:Error?, ref:DatabaseReference) in
            if let error = error {
              print("Data could not be saved: \(error).")
            } else {
              print("Data posted successfully!")
                self.ratingLabel.text = "1.0/5"
                self.ratingSlider.value = 1.0
                self.reviewField.text = ""
            }
          }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewTableView.dataSource = self
        reviewTableView.register(UINib(nibName: Constants.Storyboard.reviewNibName, bundle: nil), forCellReuseIdentifier: Constants.Storyboard.reviewCell)
        self.ref = Database.database().reference().child("foodPlaces").child((placeData?.title)!).child("reviews").childByAutoId()
        self.reviewRef = Database.database().reference().child("foodPlaces").child((placeData?.title)!).child("reviews")
        
        reviewRef?.observeSingleEvent(of: .value, with: { (snapshot) in if let allReviews = snapshot.value as? [String:Any] {
            for (_,value) in allReviews {
                if let review = value as? [String:Any] {
                    let newReviews = Reviews(author: review["author"]! as! String , content: review["content"]! as! String, rating: review["rating"]! as! String)
                    self.reviews.append(newReviews)
                    
                    DispatchQueue.main.async {
                        //Update data
                        self.reviewTableView.reloadData()
                    }
                }
            }
        }});
        openButton.isHidden = true
        closeButton.isHidden = false
        reviewField.isHidden = false
        ratingSlider.isHidden = false
        ratingLabel.isHidden = false
        submitReviewBtn.isHidden = false
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
            if (index == Int(rating!)!) {
                break;
            }
            star.isHidden = false
        }
        hours.text = placeData?.hours
        address.text = placeData?.location
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

extension PlaceDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath) as! reviewTableViewCell
        print(reviews[indexPath.row].rating!)
        cell.reviewAuthor.text = reviews[indexPath.row].author
        cell.reviewContent.text = reviews[indexPath.row].content
        cell.rating.text = "\(reviews[indexPath.row].rating ?? "5") ⭐️"
        return cell
    }
}

