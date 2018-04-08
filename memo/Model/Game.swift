import Foundation

class Game {
    private (set) var cards: [Card]
    private var openedCardIndex: Int?
    private (set) var counter: Int = 0
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func showCard(at index: Int) {
        cards[index].isOpened = true
        counter += 1
        
        if let previousCardIndex = openedCardIndex {
            if index == previousCardIndex {
                return
            }
            
            if cards[previousCardIndex] == cards[index] {
                cards[previousCardIndex].isMatched = true
                cards[index].isMatched = true
            }
            else {
                cards[previousCardIndex].isOpened = false
                cards[index].isOpened = false
            }
            openedCardIndex = nil
        }
        else {
            openedCardIndex = index
        }
    }
}
