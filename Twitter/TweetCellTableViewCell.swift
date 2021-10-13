//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Nagato Kadoya on 10/2/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var TweetContent: UILabel!
    @IBOutlet weak var UserNameLabel: UILabel!
    @IBOutlet weak var ProfileImageView: UIImageView!
 
    @IBOutlet weak var favButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    
    var favirited: Bool = false
    var tweetid: Int = -1
    var retweeted:Bool = false
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favirited
        if toBeFavorited{
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetid, success: {
                self.setFavorite(true)
            }, failure: { error in
                print("Favorite did not succeed")
            })
        }else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetid, success: {
                self.setFavorite(false)
            }, failure: { error in
                print("Failed to unfavorite")
            })
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetid, success: {
            self.setRetweeted(true)
        }, failure: { err in
            print("\(err)")
        })
    }
    
    func setRetweeted(_ isRetweeted: Bool){
        if isRetweeted{
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }else{
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
        
    }

    func setFavorite(_ isFavorited: Bool){
        favirited = isFavorited
        if favirited{
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
