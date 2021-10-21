//
//  ViewController.swift
//  streaming
//
//  Created by Jenny Woorim Lee on 2021/10/21.
//

import UIKit
import StreamingKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var greyView: UIView!
    
    private let videoPlayer = StreamingVideoPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoPlayer()
    }
    
    private func setupVideoPlayer() {
        videoPlayer.add(to: greyView)
    }
    
    @IBAction func playButtonTapped() {
        guard let text = textfield.text, let url = URL(string: text) else {
            print("Error parsing URL")
            return
        }
        videoPlayer.play(url: url)
    }
    
    
    @IBAction func pauseButtonTapped() {
        videoPlayer.pause()
    }
    
    @IBAction func clearButtonTapped() {
        textfield.text = ""
        videoPlayer.pause()
    }

}

