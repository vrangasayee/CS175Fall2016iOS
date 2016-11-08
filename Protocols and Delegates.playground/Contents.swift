//: Playground - noun: a place where people can play

import UIKit

print("Ready to Demo")


protocol FarmAnimal {
    var name: String { get set }  // name of the animal
    var food: String { get }      // food that the animal eats
    mutating func eat()
}

class Cow: FarmAnimal {
    var food = "grass"
    var name : String {
        willSet {
            print ("About to set the name to \(newValue)")
        }
        didSet {
            print ("Changed the name from \(oldValue)")
        }
    }
    
    
    init(name: String) {
        self.name = name
    }
    
    func eat() {
        print("I eat \(food)")
    }
}

class Horse: FarmAnimal {
    
    var name: String
    var food: String = "hay"
    
    init(name: String) {
        self.name = name
    }
    
    func eat() {
        self.name = "unicorn"
        print("Wahoo I just ate some \(self.food) because I'm a horse.")
        trotAround()
    }
    
    func trotAround() {
        print("Now I'm going to trot around because I'm a horse.")
    }
}

var cow : FarmAnimal = Cow(name: "Teddy")
cow.eat()
cow.name = "Bruno"

var horse : FarmAnimal = Horse(name: "Pegasus")
var realHorse = horse as! Horse
horse.eat()
print(horse.name)
realHorse.trotAround()



struct Bear : FarmAnimal {
    var name: String
    var food: String
    mutating func eat() {
        self.name = "Misha"
        print("Grrr I eat \(food) because I am a bear \(name)")
    }
}

var bear = Bear(name:"Oliver", food:"Anything I can get my hands on")
bear.eat()
print(bear.name)


var farmAnimals: [FarmAnimal] = [cow, horse, bear]
for animal in farmAnimals {
    var animalMutate = animal as FarmAnimal
    animalMutate.eat()
    
}


protocol CowDelegate {
    func feedCow(cow: LazyCow)
}

class CowFarmer:  CowDelegate {
    func feedCow(cow: LazyCow) {
        print("Feeding \(cow.name) some \(cow.food)...")
    }
}

// Add delegate to Cow
class LazyCow:  FarmAnimal {
    
    var name: String
    var food: String = "grass"
    var delegate: CowDelegate?
    
    init(name: String, delegate: CowDelegate) {
        self.name = name
        self.delegate = delegate
    }
    
    init(name: String) {
        self.name = name
    }
    
    func eat() {
        delegate?.feedCow(self)
        nap()
    }
    
    func nap() {
        print("Now I'm going to take a nap because I'm a cow.")
    }
}

class BadCowFarmer: CowDelegate {
    func feedCow(cow: LazyCow) {
        print("Feeding \(cow.name) some moldy cheese...")
    }
}

var happyCow = LazyCow(name: "LazySusan",delegate: CowFarmer())
happyCow.eat()
var sadCow = LazyCow(name: "LazyJohn", delegate: BadCowFarmer())
sadCow.eat()


// Using closures to do the same thing

class LazyButEfficientCow:  FarmAnimal {
    
    var name: String
    var food: String = "grass"
    var feedCow: ((name: String, food:String) -> ())?
    
    init(name: String) {
        self.name = name
    }
    
    func eat() {
        feedCow?(name: self.name, food: self.food)
        nap()
    }
    
    func nap() {
        print("Now I'm going to take a nap because I'm a cow.")
    }
}

var smartCow = LazyButEfficientCow(name: "Aleck")
smartCow.feedCow = { (name,food) in
    print("Feeding \(name) some moldy cheese...")
}
smartCow.eat()
