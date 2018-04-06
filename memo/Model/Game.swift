import Foundation

class Game {
    private (set) var cards: [Card]
    private var openedCardIndex: Int?
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func showCard(at index: Int) {
        cards[index].isOpened = true
        
        if let previousCardIndex = openedCardIndex {
            // та же карточка
            if index == previousCardIndex {
                return
            }
            
            // карточки совпали
            if cards[previousCardIndex] == cards[index] {
                cards[previousCardIndex].isMatched = true
                cards[index].isMatched = true
            }
            // карточки не совпали
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
