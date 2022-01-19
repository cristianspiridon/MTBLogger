//
//  AthleteViewController.swift
//  MTBLogger
//
//  Created by Cristian Spiridon on 18/01/2022.
//

import UIKit

extension UIImageView {
    func from(url: URL?) {
        guard let url = url else { return }
        do {
            let data = try Data(contentsOf: url)
            self.image = UIImage(data: data)
        }
        catch {
            return
        }
    }
}

class AthleteViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let currentAthlete = currentAthlete else { return }
        setupWith(with: currentAthlete)
    }
    
    private func setupWith(with athlete: RAthlete) {
        nameLabel.text = athlete.firstname + " " + athlete.lastname
        profileImage.from(url: URL(string: athlete.profile))
        locationLabel.text = athlete.city + ", " + athlete.country
        if let date = athlete.createdAt {
            createdAtLabel.text = "Member since " + date.toString()
        }
    }
}


extension Date {

    func toString(format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
