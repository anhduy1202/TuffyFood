import Foundation

class Reviews {

    var author: String?
    var content: String?
    var rating: String?
    
    init(author: String, content: String, rating: String) {
        self.author = author
        self.content = content
        self.rating = rating
    }
}
