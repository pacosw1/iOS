//
//  ViewController.swift
//  probability
//
//  Created by paco williams on 8/31/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var Rolled: UILabel!
    @IBOutlet weak var totalRolls: UILabel!
    @IBOutlet weak var RollBtn: UIButton!
    @IBOutlet weak var ResetBtn: UIButton!
    @IBOutlet weak var histogramView: UICollectionView!
    
    //dice images
    @IBOutlet weak var dieOneImg: UIImageView!
    @IBOutlet weak var dieTwoImg: UIImageView!
    
    //init logic
    var dices = DiceSystem(maxRolls: 50)
    var images: [UIImage?] = []
    
    
    @IBAction func onReset(_ sender: Any) {

        dices.resetHistogram()
        totalRolls.text = "Rolls: \(dices.totalRolled)"
        histogramView.reloadData()
        
        RollBtn.isEnabled = true
        ResetBtn.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ResetBtn.isHidden = true
        totalRolls.text = "Rolls: \(dices.totalRolled)"
        images = [UIImage(named: "one"),UIImage(named: "two"),UIImage(named: "three"),UIImage(named: "four"),UIImage(named: "five"),UIImage(named: "six")]
        
       

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func RollDice(_ sender: Any) {
    
        //roll the dice
        let rolled = dices.rollDice()
        //display rolled result
        Rolled.text = "\(rolled)"
        
        //update Images to appropriate dice
        dieOneImg.image = images[dices.dieOne-1]
        dieTwoImg.image = images[dices.dieTwo-1]
  
        //display total rolls
        totalRolls.text = "Rolls: \(dices.totalRolled)"
        
        let indexPath = IndexPath(item: rolled-2, section: 0)
       
        histogramView.reloadItems(at: [indexPath])
//        histogramView.reloadData()

    }
    
    //colors based on ranges
       func progressReducer(percent: Float) -> UIColor {
           switch percent {
           case 0...0.25:
               return UIColor.red
           case 0.26...0.50:
               return UIColor.orange
           case 0.51...0.75:
               return UIColor.yellow
           case 0.76...1:
               return UIColor.green
           default:
               return UIColor.blue
           }
       }
       
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dices.total
    }
    
    
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HistogramCell", for: indexPath) as! CollectionViewCell
        
        
       let chance = dices.possibleChances[indexPath.item]
        cell.number.text = String(chance.number)
        
        
        
        
        let zero = "hasn't been rolled"
        let nonZero = "has been rolled "
        
        let plurality = chance.timesRolled == 1 ? "once": "\(chance.timesRolled) times"
        cell.amount.text = chance.timesRolled == 0 ? zero: nonZero + plurality
        cell.percentage.text = "\(floor(chance.percent*100))%"
        cell.progressBar.setProgress(chance.percent, animated: true)
        cell.progressBar.progressTintColor = progressReducer(percent: chance.percent)
        
        if chance.number == 1 {return CollectionViewCell.init()}
        return cell
        
    }


}







//app logic
class DiceSystem {
    public var maxRolls: Int
    public var total: Int = 11;
    var totalRange: ClosedRange<Int> = 2...12
    var dieRange: ClosedRange<Int> = 1...6
    
    var totalRolled: Int = 0
    public var possibleChances = [Chance]()
    
    
    func resetHistogram() {
        
        //reset all counters
        for chance in possibleChances {
            chance.percent = 0
            chance.timesRolled = 0
        }
        
        totalRolled = 0
        
    }
    
    func recalculateProgress() -> Void {
        for chance in self.possibleChances {
            chance.setPercent(total: totalRolled)
        }
    }
    
    func rollDice() -> Int {
        
         totalRolled += 1
        
        //roll dice
        dieOne = Int.random(in: dieRange)
        dieTwo = Int.random(in: dieRange)
        
        let index = dieOne + dieTwo - 2
        
        let chance = self.possibleChances[index];
        
        chance.timesRolled += 1
        chance.setPercent(total: maxRolls)
        
        return index+2
    
    }
    
    var dieOne: Int = 1
    var dieTwo : Int = 6
    
    
    init(maxRolls:Int) {
        
        self.maxRolls = maxRolls
        //initilalize all counters to 0
        for index in totalRange {
            possibleChances.append(Chance(timesRolled: 0, number: index, percent: 0))
        }
    }
    
    
}



class Chance {
    
    public var timesRolled: Int
    public var percent: Float
    public var number: Int
    
    func setPercent(total: Int) {
        self.percent = Float(timesRolled) / Float(total)
    }
    
    init(timesRolled: Int = 0, number: Int, percent: Float = 0) {
        self.timesRolled = timesRolled
        self.number = number
        self.percent = percent
    }
}


