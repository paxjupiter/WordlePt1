//
//  KeyboardCell.swift
//  Wordle
//
//  Created by Mari Batilando on 2/12/23.
//

import UIKit

class KeyboardCell: UICollectionViewCell {

  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var labelContainerView: UIView!
  private var string: String!
  var didSelectString: ((String) -> Void)!

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapString))
    contentView.addGestureRecognizer(tapGestureRecognizer)
  }

    func configure(with string: String) {
        labelContainerView.layer.cornerRadius = 4.0
        labelContainerView.backgroundColor = .gray

        // Exercise 2: Assign string to the private property and update the label
        self.string = string  // Store the string
        label.text = string   // Update the UILabel text
    }

  // Exercise 5: Call the `didSelectString` closure and pass in the string this cell holds (see line 14)
  // Checkpoint: After finishing this exercise, you should now be able to tap on a keyboard cell and have the letter shown on the board! If it's not working, check your work on exercises 3,4, and 5.
    @objc private func didTapString() {
        didSelectString?(string) // Call closure with the stored letter
    }
}
