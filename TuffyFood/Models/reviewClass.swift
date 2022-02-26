import Foundation

class Reviews {

    var comment: String
    var rating: Double
    
    init( comment: String, rating: Double) {
        self.comment = comment
        self.rating = rating
    }
    
    func displayReview() {
        print("=============================\n")
        print("Stars: \(rating)\n")
        print("   > \(comment)\n")
        print("=============================")
    }
}
