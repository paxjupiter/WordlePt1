//
//  KeyboardViewController.swift
//  Wordle
//
//  Created by Mari Batilando on 2/12/23.
//

import UIKit

class KeyboardController: NSObject,
                          UICollectionViewDataSource,
                          UICollectionViewDelegate,
                          UICollectionViewDelegateFlowLayout {

  private let keyboardRows: [[String]] = [
    ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
    ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
    ["Z", "X", "C", "V", "B", "N", "M", DELETE_KEY]
  ]
  var didSelectString: ((String) -> Void)?

  init(collectionView: UICollectionView) {
    super.init()
    collectionView.delegate = self
    collectionView.dataSource = self
  }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        // Exercise 1: Return the correct number of items in a section
        return numItems(in: section) // Uses the helper method
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KeyboardCell",
                                                      for: indexPath) as! KeyboardCell
        let key = keyboardRows[indexPath.section][indexPath.row]
        cell.configure(with: key)
        
        // Exercise 4: Pass `didSelectString` to the cell
        cell.didSelectString = { [weak self] selectedKey in
            self?.didSelectString?(selectedKey)
        }
        
        return cell
    }
        

  // MARK: - Private Methods
  func numItems(in row: Int) -> Int {
    return keyboardRows[row].count
  }
}
