//
//  BBCardViewController.swift
//  DeckOfOneCardObjC
//
//  Created by Bethany Wride on 10/8/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

import UIKit

class BBCardViewController: UIViewController {
    @IBOutlet weak var cardSuitLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var drawNewCardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func drawNewCardButtonTapped(_ sender: UIButton) {
        BBCardController.shared()?.drawNewCard(1, completion: { (cards) in
            guard let cards = cards else { return }
            let card = cards[0]
            BBCardController.shared()?.fetchImage(from: card, completion: { (image) in
                guard let image = image else { return }
                DispatchQueue.main.async {
                    self.cardImageView.image = image
                    self.cardSuitLabel.text = card.suit
                }
            })
        })
    }
} // End of class


