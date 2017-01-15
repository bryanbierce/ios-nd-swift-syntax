//: ### Calm the compiler
// Problem 1
protocol DirtyDeeds {
    func cheat()
    func steal()
}

class Minion: DirtyDeeds, Souschef {
    var name: String
    
    init(name:String) {
        self.name =  name
    }
    func cheat() {
        print("BAHAHAHA")
    }
    func steal() {
        print("/swipe")
    }
    func chop(_ vegetable: String) -> String {
        return vegetable
    }
    func rinse(_ vegetable: String) -> String {
        return vegetable
    }
}

// Problem 2
class DinnerCrew {
    var members: [Souschef]
    
    init(members: [Souschef]) {
        self.members = members
    }
}

protocol Souschef {
    func chop(_ vegetable: String) -> String
    func rinse(_ vegetable:String) -> String
}

var deviousDinnerCrew = DinnerCrew(members: [Minion]())

// Problem 3
protocol DogWalker {
    func throwBall(_ numberOfTimes:Int) -> Int
    func rubBelly()
}

class Neighbor: DogWalker {
    
    func throwBall(_ numberOfTimes:Int) -> Int {
        var count = 0
        while count < numberOfTimes {
            print("Go get it!")
            count += 1
        }
        return count
    }
    
    func rubBelly() {
        print("Rub rub")
    }
}
