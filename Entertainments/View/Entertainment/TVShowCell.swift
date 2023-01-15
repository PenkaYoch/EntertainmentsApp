//
//  TVShowCell.swift
//  Entertainments
//
//  Created by Penka Yochkova on 26.12.22.
//

import UIKit

class TVShowCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tvShowImageView: UIImageView!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setUpData(tvShow: TVShow) {
        
        self.titleLabel.text = tvShow.title
        if let start = tvShow.startTime, let end = tvShow.endTime {
            self.startTimeLabel.text = Utils.convertSecondsToDateTime(time: start)
            self.endTimeLabel.text = Utils.convertSecondsToDateTime(time: end)
            self.durationLabel.text = String(Utils.findDurationBetweenDates(time1: start, time2: end))
        }
        
        if let imageUrl = tvShow.imageUrl {
            
            DispatchQueue.global(qos: .userInitiated).async {
                let image = Utils.loadImage(from: imageUrl)
                
                DispatchQueue.main.async {
                    self.tvShowImageView.image = image
                }
            }
        }
        
    }
    
}
