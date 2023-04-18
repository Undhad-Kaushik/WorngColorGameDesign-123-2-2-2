//
//  MidiumLavelViewController.swift
//  WorngColorGameDesign
//
//  Created by undhad kaushik on 08/01/23.


import UIKit

class AllLavelPlayGame: UIViewController {
    
    
    @IBOutlet weak var screenImage: UIImageView!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var mindGame: UILabel!
    @IBOutlet weak var timeCountProgressBar: UIProgressView!
    @IBOutlet weak var midiumCollectionView: UICollectionView!
    
    
    
    var timerCount: Double = UserDefaults.standard.double(forKey: "second")
    
    
    var timer: Timer!
    var point: Int = 0
    var rendomColour = UIColor()
    var arrcolorItems: [Colour] = []
    
    var arrcolor = [UIColor.brown,UIColor.white,UIColor.red,UIColor.blue,UIColor.gray,UIColor.orange,UIColor.purple,UIColor.cyan,UIColor.green]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrcolor = arrcolor.shuffled()
        rendomColour = arrcolor.randomElement()!
        setup()
    }
    private func setup(){
        configurCatagoryCollectionView()
        configureTimerProgressView()
    }
    
    private func configurCatagoryCollectionView(){
        let nibFile: UINib = UINib(nibName: "MidiumGameLavelCollectionViewCell",bundle: nil)
        midiumCollectionView.register(nibFile, forCellWithReuseIdentifier: "cell")
        
    }
    
    private func configureTimerProgressView() {
      //  timer = Timer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        timeCountProgressBar.setProgress(10, animated: true)
    }
    
    @objc
    func updateTime(collectionView: UICollectionView) {
        if timerCount > 0 {
            timerCount = timerCount - 0.01
            timeCountProgressBar.setProgress(Float(timerCount/UserDefaults.standard.double(forKey: "second")), animated: true)
        
        } else {
            timer.invalidate()
            displayValidation()
        }
    }
    
    
    
    private func displayValidation() {
        let alert: UIAlertController = UIAlertController(title: "Game Over\n", message: "Score \(point)", preferredStyle: .alert)
        
        let playAgain: UIAlertAction = UIAlertAction(title: "play Again", style: .cancel){ button in
        }
        
        let newGame: UIAlertAction = UIAlertAction(title: "New Game", style: .default){
            button in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let midiumLavelViewController = storyboard.instantiateViewController(withIdentifier: "GameLavelViewController")
            self.navigationController?.popViewController(animated: true)
        }
        
        alert.addAction(playAgain)
        alert.addAction(newGame)
        present(alert,animated: true,completion: nil)
        
    }
    
}


extension UIColor {
    var name12: String?{
        switch self {
        case UIColor.brown : return "brown"
        case UIColor.white : return "white"
        case UIColor.red : return "red"
        case UIColor.blue : return "blue"
        case UIColor.gray : return "gray"
        case UIColor.orange : return "orange"
        case UIColor.purple : return "purple"
        case UIColor.cyan : return "cyan"
        case UIColor.green : return "green"
        default:
            break
        }
        return ""
    }
}



extension AllLavelPlayGame: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrcolor.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: MidiumGameLavelCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MidiumGameLavelCollectionViewCell
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 50
        cell.layer.masksToBounds = true
        
        if rendomColour == arrcolor[indexPath.row] {
            
            cell.nameLabel.text = arrcolor.randomElement()?.name12
            cell.layer.backgroundColor = arrcolor[indexPath.row].cgColor
            
        } else {
            
            cell.layer.backgroundColor = arrcolor[indexPath.row].cgColor
            cell.nameLabel.text = arrcolor[indexPath.row].name12
            
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        if arrcolor[indexPath.row].name12 == rendomColour.name12 {
            point += 1
            pointsLabel.text = "\(point)"
            arrcolor = arrcolor.shuffled()
            rendomColour = arrcolor.randomElement()!
            midiumCollectionView.reloadData()
            configureTimerProgressView()
            timerCount = UserDefaults.standard.double(forKey: "second")
        } else {
            if point != 0 {
                point -= 0
            }
            pointsLabel.text = "\(point)"
        }
        
        
    }
}

extension AllLavelPlayGame: UICollectionViewDelegateFlowLayout{
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let sizeFrem = midiumCollectionView.frame.width
        
        let totalSize = sizeFrem/4
        
        return CGSize(width: totalSize, height: totalSize)
        
        //  return CGSize(width: 95, height: 95)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 26, bottom: 8, right: 26)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 22
    }
}
