//
//  ViewController.swift
//  ChuckNorrisJokes
//
//  Created by Максим Юрисов on 24.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jokeLabel: UILabel!
    @IBOutlet weak var buttonShare: UIBarButtonItem!
    @IBOutlet weak var buttonRefresh: UIBarButtonItem!
    @IBOutlet weak var buttonAddToFavorites: UIButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBAction func pushRefreshJoke(_ sender: Any) {
        indicator.startAnimating()
        buttonRefresh.isEnabled = false
        getrandomJoke { joke in
            DispatchQueue.main.async {
                self.jokeLabel.text = joke
                self.indicator.stopAnimating()
                self.buttonRefresh.isEnabled = true
                self.buttonShare.isEnabled = true
                self.buttonAddToFavorites.isEnabled = true
            }
           
        }
    }
    
    @IBAction func pushShareJoke(_ sender: Any) {
       let acv =  UIActivityViewController(activityItems: [jokeLabel!.text!], applicationActivities: nil)
        
        present(acv, animated: true)
    }
    
    @IBAction func pushFavoritesAction(_ sender: Any) {
        addJokeToFavorites(newjoke: jokeLabel!.text!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(getrandomJoke())
    }


}

