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
      
      setSession()
      
      // hey, if there's something happenning on the remote buttons, I want to know about it
      UIApplication.sharedApplication().beginReceivingRemoteControlEvents()
      // need to know where to go once we receive the event
      becomeFirstResponder()
      
      player = Player()
      
      let url = "http://htetnainga.sg-host.com/music_app/dubstep.mp3"
      
      player.playStream(url)
      changePlayButton()
   }
   func setSession () {
      do {
         // tells iOS that our app is the only one that allows to play audio at the same time
         try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
      }
      catch {
         print(error)
      }
   }

   @IBAction func playPauseButtonClick(sender: AnyObject) {
      if (player.avPlayer.rate > 0) {
         player.pauseAudio()
      }
      else {
         player.playAudio()
      }
      changePlayButton()
   }
   
   func changePlayButton() {
      if (player.avPlayer.rate > 0) {
         playPauseButton.setImage(UIImage(named: "pauseIcon"), forState: UIControlState.Normal)
      }
      else {
         playPauseButton.setImage(UIImage(named: "playIcon"), forState: UIControlState.Normal)
      }
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


}

