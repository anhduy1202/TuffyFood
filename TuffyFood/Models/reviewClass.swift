import Foundation

class Reviews {

    var name: String
    var comment: String
    var rating: String
    var anonymousCheck: Bool
    var review: String
    
    init(name: String, comment: String, rating: String, anonymousCheck: Bool) {
        self.name = name
        self.comment = comment
        self.rating = rating
        self.anonymousCheck = anonymousCheck
        if anonymousCheck == true {
            self.name = "Anonymous"
        }
        self.review = "\(name) gives a \(rating) rating and says \(comment)"
    }
    
    func displayReview() {
        print(review)
    }
}
