//
//  WordGenerator.swift
//  Wordle
//
//  Created by Mari Batilando on 2/20/23.
//

import Foundation

class WordGenerator {
  // Exercise 8: Add more possible words
  static let possibleWords = ["AUDIO", "CRANE", "SLATE", "BRICK", "FROST", "PLUMB", "SWING", "DRIVE", "MIGHT", "GLASS"]

  static func generateRandomWord() -> String? {
    // Return a random word from the list
    return possibleWords.randomElement()
  }
}

