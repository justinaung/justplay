//
//  ViewController.swift
//  justplay
//
//  Created by Justin Naing on 10/13/16.
//  Copyright © 2016 JIT. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

   @IBOutlet weak var playPauseButton: UIButton!
   var player: Player!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      player = Player()
      
      let url = "http://htetnainga.sg-host.com/music_app/dubstep.mp3"
      
      player.playStream(url)
   }

   @IBAction func playPauseButtonClick(sender: AnyObject) {
      if (player.avPlayer.rate > 0) {
         player.pauseAudio()
      }
      else {
         player.playAudio()
      }
      
   }
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


}

