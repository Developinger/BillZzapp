//
//  SubscriptionSelectionController.swift
//  BillZzapp
//
//  Created by Petit Bradley on 3/22/23.
//

import UIKit

class SubscriptionSelectionController: UIViewController {

    //Images
    @IBOutlet weak var spotifyImage: UIImageView!
    @IBOutlet weak var netflixImage: UIImageView!
    @IBOutlet weak var amazonImage: UIImageView!
    @IBOutlet weak var disneyImage: UIImageView!
    @IBOutlet weak var hboImage: UIImageView!
    @IBOutlet weak var appleTVImage: UIImageView!
    @IBOutlet weak var uberEatsImage: UIImageView!
    @IBOutlet weak var tubiImage: UIImageView!
    @IBOutlet weak var ShowtimeImage: UIImageView!
    @IBOutlet weak var VRVImage: UIImageView!
    @IBOutlet weak var DoordashImage: UIImageView!
    @IBOutlet weak var applemusicImage: UIImageView!
    @IBOutlet weak var paramountImage: UIImageView!
    @IBOutlet weak var crunchyImage: UIImageView!
    
    //Image Checks
    @IBOutlet weak var SpotifyCheck: UIImageView!
    @IBOutlet weak var netflixCheck: UIImageView!
    @IBOutlet weak var amazonCheck: UIImageView!
    @IBOutlet weak var disneyCheck: UIImageView!
    @IBOutlet weak var hboCheck: UIImageView!
    @IBOutlet weak var appleTVCheck: UIImageView!
    @IBOutlet weak var uberEatsCheck: UIImageView!
    @IBOutlet weak var tubiCheck: UIImageView!
    @IBOutlet weak var showtimeCheck: UIImageView!
    @IBOutlet weak var vrvCheck: UIImageView!
    @IBOutlet weak var doordashCheck: UIImageView!
    @IBOutlet weak var appleMusicCheck: UIImageView!
    @IBOutlet weak var paramountCheck: UIImageView!
    @IBOutlet weak var crunchyrollCheck: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        let tapGesture6 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        let tapGesture7 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        let tapGesture8 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        let tapGesture9 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        let tapGesture10 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        let tapGesture11 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        let tapGesture12 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        let tapGesture13 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        let tapGesture14 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))

        spotifyImage.addGestureRecognizer(tapGesture1)
        netflixImage.addGestureRecognizer(tapGesture2)
        amazonImage.addGestureRecognizer(tapGesture3)
        disneyImage.addGestureRecognizer(tapGesture4)
        hboImage.addGestureRecognizer(tapGesture5)
        appleTVImage.addGestureRecognizer(tapGesture6)
        uberEatsImage.addGestureRecognizer(tapGesture7)
        tubiImage.addGestureRecognizer(tapGesture8)
        ShowtimeImage.addGestureRecognizer(tapGesture9)
        VRVImage.addGestureRecognizer(tapGesture10)
        DoordashImage.addGestureRecognizer(tapGesture11)
        applemusicImage.addGestureRecognizer(tapGesture12)
        paramountImage.addGestureRecognizer(tapGesture13)
        crunchyImage.addGestureRecognizer(tapGesture14)


        spotifyImage.isUserInteractionEnabled = true
        netflixImage.isUserInteractionEnabled = true
        amazonImage.isUserInteractionEnabled = true
        disneyImage.isUserInteractionEnabled = true
        hboImage.isUserInteractionEnabled = true
        appleTVImage.isUserInteractionEnabled = true
        uberEatsImage.isUserInteractionEnabled = true
        tubiImage.isUserInteractionEnabled = true
        ShowtimeImage.isUserInteractionEnabled = true
        VRVImage.isUserInteractionEnabled = true
        DoordashImage.isUserInteractionEnabled = true
        applemusicImage.isUserInteractionEnabled = true
        paramountImage.isUserInteractionEnabled = true
        crunchyImage.isUserInteractionEnabled = true
    }

    @objc func imageTapped(_ sender: UITapGestureRecognizer) {

        if let imageView = sender.view as? UIImageView {
     
            if imageView == spotifyImage {
                print("Image 1 tapped")
                SpotifyCheck.isHidden = !SpotifyCheck.isHidden
                spotifyImage.alpha = SpotifyCheck.isHidden ? 1 : 0.5
            } else if imageView == netflixImage {
                print("Image 2 tapped")
                netflixCheck.isHidden = !netflixCheck.isHidden
                netflixImage.alpha = netflixCheck.isHidden ? 1 : 0.5
            } else if imageView == amazonImage {
                print("Image 3 tapped")
                amazonCheck.isHidden = !amazonCheck.isHidden
                amazonImage.alpha = amazonCheck.isHidden ? 1 : 0.5
            } else if imageView == disneyImage {
                print("Image 4 tapped")
                disneyCheck.isHidden = !disneyCheck.isHidden
                disneyImage.alpha = disneyCheck.isHidden ? 1 : 0.5
            } else if imageView == hboImage {
                print("Image 5 tapped")
                hboCheck.isHidden = !hboCheck.isHidden
                hboImage.alpha = hboCheck.isHidden ? 1 : 0.5
            } else if imageView == appleTVImage {
                print("Image 6 tapped")
                appleTVCheck.isHidden = !appleTVCheck.isHidden
                appleTVImage.alpha = appleTVCheck.isHidden ? 1 : 0.5
            } else if imageView == uberEatsImage {
                print("Image 7 tapped")
                uberEatsCheck.isHidden = !uberEatsCheck.isHidden
                uberEatsImage.alpha = uberEatsCheck.isHidden ? 1 : 0.5
            } else if imageView == tubiImage {
                print("Image 8 tapped")
                tubiCheck.isHidden = !tubiCheck.isHidden
                tubiImage.alpha = tubiCheck.isHidden ? 1 : 0.5

            } else if imageView == ShowtimeImage {
                print("Image 9 tapped")
                showtimeCheck.isHidden = !showtimeCheck.isHidden
                ShowtimeImage.alpha = showtimeCheck.isHidden ? 1 : 0.5

            } else if imageView == VRVImage {
                print("Image 10 tapped")
                vrvCheck.isHidden = !vrvCheck.isHidden
                VRVImage.alpha = vrvCheck.isHidden ? 1 : 0.5

            } else if imageView == DoordashImage {
                print("Image 11 tapped")
                doordashCheck.isHidden = !doordashCheck.isHidden
                DoordashImage.alpha = doordashCheck.isHidden ? 1 : 0.5

            } else if imageView == applemusicImage {
                print("Image 12 tapped")
                appleMusicCheck.isHidden = !appleMusicCheck.isHidden
                applemusicImage.alpha = appleMusicCheck.isHidden ? 1 : 0.5

            } else if imageView == paramountImage {
                print("Image 13 tapped")
                paramountCheck.isHidden = !paramountCheck.isHidden
                paramountImage.alpha = paramountCheck.isHidden ? 1 : 0.5

            } else if imageView == crunchyImage {
                print("Image 14 tapped")
                crunchyrollCheck.isHidden = !crunchyrollCheck.isHidden
                crunchyImage.alpha = crunchyrollCheck.isHidden ? 1 : 0.5

            }
                
        }
    }
}
