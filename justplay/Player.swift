//
//  Player.swift
//  justplay
//
//  Created by Justin Naing on 10/14/16.
//  Copyright © 2016 JIT. All rights reserved.
//

import Foundation
import MediaPlayer

class Player
{
   var avPlayer: AVPlayer!
   
   init () {
      avPlayer = AVPlayer()
   }
   
   func playStream (fileUrl: String) {
      let url = NSURL(string: fileUrl)
      
      avPlayer = AVPlayer(URL: url!)
      avPlayer.play()
      print("Playing stream")
   }
   
   func playAudio () {
      if (avPlayer.rate == 0 && avPlayer.error == nil) {
         avPlayer.play()
      }
   }
   
   func pauseAudio () {
      if (avPlayer.rate > 0 && avPlayer.error == nil) {
         avPlayer.pause()
      }
   }
}