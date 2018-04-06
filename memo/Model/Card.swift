import Foundation

struct Card: Equatable {
    var isOpened: Bool
    var isMatched: Bool
    var id: String
    
    public static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
}
