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
   
   func setPlayingScreen (fileUrl: String) {
      let urlArray = fileUrl.characters.split{$0 == "/"}.map(String.init)
      
      let name = urlArray[urlArray.endIndex-1]
      
      print(name)
      
      let songInfo = [
         MPMediaItemPropertyTitle: name,
         MPMediaItemPropertyArtist: "Just Play"
      ]
      
      MPNowPlayingInfoCenter.defaultCenter().nowPlayingInfo = songInfo
   }
}