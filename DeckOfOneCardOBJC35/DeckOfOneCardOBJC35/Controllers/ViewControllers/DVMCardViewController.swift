//
//  DVMCardViewController.swift
//  DeckOfOneCardOBJC35
//
//  Created by Todd Crandall on 8/11/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

import UIKit

class DVMCardViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var suitNameLabel: UILabel!
    @IBOutlet weak var cardValueLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    //    //MARK: - Properties
    //    var card: DVMCard? {
    //        didSet {
    //            updateView()
    //        }
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func drawButtonTapped(_ sender: UIButton) {
        DVMCardController.shared().drawANewCard { (card) in
            DispatchQueue.main.async {
                self.updateView(for: card)
                self.suitNameLabel.text = card[0].suit
                self.cardValueLabel.text = card[0].cardValue
            }
        }
    }
    
    
    //MARK: - Methods
    func updateView(for card: [DVMCard]) {
        
        DVMCardController.shared().fetchCardImage(card[0]) { (card) in
            DispatchQueue.main.async {
//                self.suitNameLabel.text = card.suit
//                self.cardValueLabel.text = card.cardValue
                self.cardImageView.image = card
            }
        }
    }
}
