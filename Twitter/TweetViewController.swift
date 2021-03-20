//
//  TweetViewController.swift
//  Twitter
//
//  Created by Mila Paymukhina on 19.03.2021.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        TweetTextView.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var TweetTextView: UITextView!
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        if (!TweetTextView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: TweetTextView.text, success: { self.dismiss(animated: true, completion: nil)}, failure: { (error) in
                print("Error posting a tweet \(error)",
                self.dismiss(animated: true, completion: nil))
            })
            } else {
                self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
