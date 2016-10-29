//
//  Player.swift
//  justPlay
//
//  Created by Justin Naing on 10/29/16.
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
   
   func playStream (_ fileUrl: String) {
      let songUrl = NSURL(string: fileUrl)
      
      avPlayer = AVPlayer(url: songUrl! as URL)
      avPlayer.play()
      
      setPlayingScreen(fileUrl)
      
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
   
   func setPlayingScreen (_ fileUrl: String) {
      let urlArray = fileUrl.characters.split(separator: "/").map(String.init)
      
      let name = urlArray[urlArray.endIndex-1]
      
      print(name)
      
      let songInfo = [
         MPMediaItemPropertyTitle: name,
         MPMediaItemPropertyArtist: "Just Play"
      ]
      
      MPNowPlayingInfoCenter.default().nowPlayingInfo = songInfo
   }
}
