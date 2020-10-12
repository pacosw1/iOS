import Cocoa

var str = "Hello, playground"



class DiceSystem {
    
    var totalRange: ClosedRange<Int> = 1...12
    var dieRange: ClosedRange<Int> = 1...6
    
    var totalRolled: Int = 0
    public var possibleChances = [Chance]()
    
    func rollDice() -> Void {
        
         totalRolled += 1
        
        //roll dice
        dieOne = Int.random(in: dieRange)
        dieTwo = Int.random(in: dieRange)
        
        let index = dieOne + dieTwo - 1
        
        let chance = self.possibleChances[index];
        
        chance.timesRolled += 1
        chance.setPercent(total: totalRolled)
    
    }
    
    var dieOne: Int = 1
    var dieTwo : Int = 6
    
    
    init() {
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



var dieGen = DiceSystem()

dieGen.rollDice()
dieGen.rollDice()

dieGen.rollDice()
dieGen.rollDice()

dieGen.rollDice()
dieGen.rollDice()
dieGen.rollDice()
dieGen.rollDice()

for chance in dieGen.possibleChances {
    print(chance.number)
    print(chance.percent * 100)
}



