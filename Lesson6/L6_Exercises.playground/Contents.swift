//: ## Lesson 6 Exercises - Classes, Properties and Methods

import UIKit

//: __Problem 1__
//:
//: __1a.__
//: The compiler is complaining because the class Animal has no initializers. Write an init method for the Animal class and quiet this error. Include a mechanism to initialize the length of the Animal's tail using the Tail struct provided.
struct Tail {
    let lengthInCm: Double
}

class Animal {
    var species: String = ""
    let tail: Tail
    
    init (species: String, tailLength: Double) {
        self.species = species
        self.tail = Tail(lengthInCm: tailLength)
    }
}

//: __1b.__
//: Instantiate and initialize a few different Animals.
Animal(species: "tiger", tailLength: 52)
Animal(species: "elephant", tailLength: 70)
//: __Problem 2__
//:
//: Below are the beginnings of the Peach class.
class Peach {
    let variety: String
    
    // Softness is rated on a scale from 1 to 5, with 5 being the softest
    var softness: Int
    static let varieties = ["type1", "type2"]
    
    init(variety: String, softness: Int) {
        self.variety = variety
        self.softness = softness
    }
    
    func ripen() -> String {
        self.softness += 1
        return "The peach is \(self.softness > 3 ? "ripe" : "not ripe")"
    }
}
//: __2a.__
//: Add a type property to the Peach class called "varieties". It should hold an array of different types of peaches.
//:
//: __2b.__
//: Add an instance method called ripen() that increases the value of the stored property, softness, and returns a string indicating whether the peach is ripe.
//:
//: __2c.__
//: Create an instance of the Peach class and call the method ripen().
let peach = Peach(variety: "type1", softness: 2)
peach.ripen()
peach.ripen()
//: __Problem 3__
//:
//: __3a.__
//:Add the computed property, "cuddlability", to the class, FluffyDog. Cuddlability should be computed based on the values of the stored properties, fluffiness and droolFactor.
var theFluffiestDog = UIImage(named:"fluffyDog")
class FluffyDog {
    let name: String
    let fluffiness: Int
    let droolFactor: Int
    lazy var cuddlability: Int = {
        [unowned self] in
        print("Assigning cuddlability")
        return self.fluffiness - self.droolFactor
    }()
    
    init(name: String, fluffiness: Int, droolFactor: Int) {
        self.name = name
        self.fluffiness = fluffiness
        self.droolFactor = droolFactor
    }
    
    func chase(_ wheeledVehicle: String)-> String {
        return "Where are you going, \(wheeledVehicle)? Wait for me! No, don't go! I will catch you!"
    }
}
//: __3b.__
//: Instantiate and initialize an instance of the class, FluffyDog. Use it to call the method, chase().
let dog = FluffyDog(name: "Miles", fluffiness: 10, droolFactor: 0)
dog.chase("bike")
print("before calling cuddlability")
dog.cuddlability
//: __Problem 4__
//:
//: __4a.__
//: Write an instance method, bark(), that returns a different string based on the value of the stored property, size.
enum Size: Int {
    case small
    case medium
    case large
}

class ChattyDog {
    let name: String
    let breed: String
    let size: Size
    
    init(name: String, breed: String, size: Size) {
        self.name = name
        self.breed = breed
        self.size = size
    }
    
    static func speak(size: Size) {
        switch size {
        case .small :
            print("hi")
        case .medium:
            print("Hi!")
        case .large:
            print("HELLO THERE PERSON!")
        }
    }
    
    func bark() {
        switch self.size {
        case .small :
            print("hi")
        case .medium:
            print("Hi!")
        case .large:
            print("HELLO THERE PERSON!")
        }
    }
}
//: __4b.__
//: Create an instance of ChattyDog and use it to call the method, bark().
let talkyDog = ChattyDog(name: "bastard", breed: "yapper", size: Size.medium)
talkyDog.bark()
//: __4c.__
//: Rewrite the method, bark(), as a type method and rename it speak(). Call your type method to test it out.
ChattyDog.speak(size: Size.large)
//: __Problem 5__
//:
//:__5a.__
//: Write an initialization method for the House class below.
enum Quality {
    case poor, fair, good, excellent
}

enum NaturalDisaster {
    case earthquake
    case wildfire
    case hurricane
}

class House {
    var numberOfBedrooms: Int = 0
    let location: Quality
    
    init(quality: Quality, numberOfBedrooms: Int) {
        self.location = quality
        self.numberOfBedrooms = numberOfBedrooms
    }
 
    func willStayStanding(_ naturalDisaster:NaturalDisaster)-> Bool {
        switch naturalDisaster {
        case .earthquake:
            return true
        case .wildfire:
            return true
        case .hurricane:
            return false
        }
    }
    
    func _locationQualityToValue() -> Int {
        switch self.location {
        case .poor:
            return 1
        case .fair:
            return 2
        case .good:
            return 3
        case .excellent:
            return 4
        }
    }
    func _bedroomNumToValue(_ bedroomTarget: Int) -> Int {
        return 7 + self.numberOfBedrooms - bedroomTarget
    }
    func worthyOfAnOffer(bedroomTarget: Int) -> Bool {
        return self._bedroomNumToValue(bedroomTarget) + self._locationQualityToValue() > 10
    }
}

//: __5b.__
//: Create an instance of the House class and use it to call the method, willStayStanding().  This method takes in a parameter of type NaturalDisaster and return a Bool indicating whether the house will stay standing in a given natural disaster.
let goodHouse = House(quality: Quality.good, numberOfBedrooms: 3)
goodHouse.willStayStanding(NaturalDisaster.earthquake)
//: __5c.__
//: Add a computed property called, "worthyOfAnOffer". This property should be a Bool, whose return value is dependent upon some combination of the stored properties, numberOfBedrooms and location.
goodHouse.worthyOfAnOffer(bedroomTarget: 2)

let badHouse = House(quality: Quality.poor, numberOfBedrooms: 2)
badHouse.worthyOfAnOffer(bedroomTarget: 2)



