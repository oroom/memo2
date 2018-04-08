import Foundation
import UIKit

protocol CardsViewDelegate {
    func didTapCard(at index: Int)
}

class CardsView: UIStackView {
    var delegate: CardsViewDelegate?
    private let cardColor = UIColor.orange
    private let backColor = UIColor.brown
    
    @IBOutlet var cards: [UIButton]!
    @IBOutlet var uiCounter: UILabel!

    
    @IBAction func cardTapped(_ sender: UIButton) {
        if let index = cards.index(of: sender) {
            delegate?.didTapCard(at: index)
        }
    }
    
    func updateView(game: Game) {
        uiCounter.text = String(game.counter)
        for (i, card) in game.cards.enumerated() {
            let button = cards[i]
            button.isHidden = card.isMatched
            if card.isOpened {
                open(card: button)
            }
            else {
                hide(card: button)
            }
        }
    }
    func initView(game: Game) {
        for (i, card) in game.cards.enumerated() {
            cards[i].setTitle(card.id, for: .normal)
        }
    }
    
    private func open(card: UIButton) {
        card.backgroundColor = cardColor
        card.setTitleColor(UIColor.black, for: .normal)
    }
    
    private func hide(card: UIButton) {
        card.setTitleColor(UIColor.clear, for: .normal)
        card.backgroundColor = backColor
    }
}
