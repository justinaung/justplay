//
//  Song.swift
//  justPlay
//
//  Created by Justin Naing on 10/29/16.
//  Copyright © 2016 JIT. All rights reserved.
//

import Foundation

class Song {
   var id: Int
   var name: String
   var numLikes: Int
   var numPlays: Int
   var artist: String
   
   init? (id: String, name: String, numLikes: String, numPlays: String, artist: String) {
      self.id       = Int(id)!
      self.name     = name
      self.numLikes = Int(numLikes)!
      self.numPlays = Int(numPlays)!
      self.artist   = artist
   }
   
   func getId () -> Int {
      return id
   }
   
   func getName () -> String {
      return name
   }
   
   func getNumLikes () -> Int {
      return numLikes
   }
   
   func getNumPlays () -> Int {
      return numPlays
   }
   
   func getArtist () -> String {
      return artist
   }
   
   func getCleanName () -> String {
      var cleanName: String = name
      let range = name.index(name.endIndex, offsetBy: -4)..<name.endIndex
      cleanName.removeSubrange(range)
      
      return cleanName.capitalized(with: NSLocale.current)
   }
}
