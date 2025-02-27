//
//  BoardController.swift
//  Wordle
//
//  Created by Mari Batilando on 2/20/23.
//

import Foundation
import UIKit

class BoardController: NSObject,
                       UICollectionViewDataSource,
                       UICollectionViewDelegate,
                       UICollectionViewDelegateFlowLayout {

  // MARK: - Properties
  let numItemsPerRow = 5
  let numRows = 6
  let collectionView: UICollectionView
  let goalWord: [String]

  var numGuesses = 0
  var currRow: Int {
    return numGuesses / numItemsPerRow
  }

  init(collectionView: UICollectionView) {
    self.collectionView = collectionView
    self.goalWord = WordGenerator.generateRandomWord()!.map { String($0) }
    super.init()
    collectionView.delegate = self
    collectionView.dataSource = self
  }

  // MARK: - Public Methods
  func enter(_ string: String) {
    guard numGuesses < numItemsPerRow * numRows else { return }
    let cell = collectionView.cellForItem(at: IndexPath(item: numGuesses, section: 0)) as! LetterCell
    cell.set(letter: string)
      UIView.animate(withDuration: 0.1,
                     delay: 0.0,
                     options: [.autoreverse],
                     animations: {
          // Exercise 7: Make the cell slightly larger (1.05x)
          cell.transform = cell.transform.scaledBy(x: 1.05, y: 1.05)
      }, completion: { finished in
          cell.transform = CGAffineTransform.identity // Reset the transform after animation
      })
    if isFinalGuessInRow() {
      markLettersInRow()
    }
    numGuesses += 1
  }

    func deleteLastCharacter() {
        guard numGuesses > 0 && numGuesses % numItemsPerRow != 0 else { return }
        
        let cell = collectionView.cellForItem(at: IndexPath(item: numGuesses - 1, section: 0)) as! LetterCell
        numGuesses -= 1
        
        // Clear the letter and reset style properly
        cell.clearLetter()
        cell.set(style: .initial) // Use the correct enum `LetterCellStyle`
    }
}
