//
//  GameLavelViewController.swift
//  WorngColorGameDesign
//
//  Created by undhad kaushik on 08/01/23.
//

import UIKit

class GameLavelViewController: UIViewController {
    @IBOutlet weak var screenImage: UIImageView!
    
    @IBOutlet weak var gameSelectModeLabel: UILabel!
    @IBOutlet weak var easyLavelButton: UIButton!
    @IBOutlet weak var midiumLavelButton: UIButton!
    @IBOutlet weak var hardLavelButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func easyLavelButttonTapped(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let easyLavelController = storyBoard.instantiateViewController(withIdentifier: "AllLavelPlayGame")
        UserDefaults.standard.set(10.0, forKey: "second")
       // UserDefaults.standard.synchronize()
        self.navigationController?.pushViewController(easyLavelController, animated: true)
    }
    
    
    @IBAction func midiumLavelButtonTapped(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let midiumLavelController = storyBoard.instantiateViewController(withIdentifier: "AllLavelPlayGame")
        UserDefaults.standard.set(7.0, forKey: "second")
      //  UserDefaults.standard.synchronize()
        self.navigationController?.pushViewController(midiumLavelController, animated: true)
    }
    
    @IBAction func hardLavelButtonTapped(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let hardLavelController = storyBoard.instantiateViewController(withIdentifier: "AllLavelPlayGame")
        UserDefaults.standard.set(5, forKey: "second")
      //  UserDefaults.standard.synchronize()
        self.navigationController?.pushViewController(hardLavelController, animated: true)
    }
}
