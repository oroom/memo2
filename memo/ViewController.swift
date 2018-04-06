//
//  ViewController.swift
//  memo
//
//  Created by Dzimtry Navak on 3/28/18.
//  Copyright © 2018 oroom. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CardsViewDelegate {
    @IBOutlet weak var stackView: CardsView!
    private var game: Game!
    
    // Just hardcoded images for cards
    var images = ["🥝", "🍩", "🥗", "🥝", "🍩", "🥗", "🍔", "🍔"]
    
    override func viewDidLoad() {
        stackView.delegate = self
        startGame()
    }
    
    func didTapCard(at index: Int) {
        game.showCard(at: index)
        stackView.updateView(game: game)
    }
    
    private func startGame() {
        let cards = images.map { Card(isOpened: false, isMatched: false, id: $0) }
        game = Game(cards: cards)
    }
}
