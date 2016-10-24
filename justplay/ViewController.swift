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
      UIApplication.shared.beginReceivingRemoteControlEvents()
      // need to know where to go once we receive the event
      becomeFirstResponder()
      
      // subscribe to notification center
      NotificationCenter.default.addObserver(self, selector: "handleInterruption", name:
         NSNotification.Name.AVAudioSessionInterruption, object: nil)
      
      player = Player()
      
      let url = "http://htetnainga.sg-host.com/music_app/dubstep.mp3"
      
      player.playStream(url)
      changePlayButton()
   }
   
   override var canBecomeFirstResponder : Bool {
      return true
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

   @IBAction func playPauseButtonClick(_ sender: AnyObject) {
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
         playPauseButton.setImage(UIImage(named: "pauseIcon"), for: UIControlState())
      }
      else {
         playPauseButton.setImage(UIImage(named: "playIcon"), for: UIControlState())
      }
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

   override func remoteControlReceived(with event: UIEvent?) {
      if event!.type == UIEventType.remoteControl {
         if event!.subtype == UIEventSubtype.remoteControlPause{
            print("pause")
            player.pauseAudio()
         }
         else if event!.subtype == UIEventSubtype.remoteControlPlay{
            player.playAudio()
         }
      }
   }
   
   // the method can also be used to handel head phone in/out
   func handleInterruption(_ notification: Notification) {
      player.pauseAudio()
      
      // check the interruption type
      let interruptionTypeAsObject = (notification as NSNotification).userInfo![AVAudioSessionInterruptionTypeKey] as! NSNumber
      
      let interruptionType = AVAudioSessionInterruptionType(rawValue: interruptionTypeAsObject.uintValue)
      
      if let type = interruptionType {
         if type == .ended {  // for example, the phone call is done
            player.playAudio()
         }
      }
   }
}

