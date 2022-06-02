import UIKit

// MARK: - Base protocol

protocol Coffee {
    var cost: Int { get }
}


// MARK: - Decorators protocol

protocol CoffeeDecorator: Coffee {
    var base: Coffee { get }
    init (base: Coffee)
}

// MARK: - Decorators

class Milk: CoffeeDecorator {
    let base: Coffee
    
    var cost: Int {
        return base.cost + 20
    }
    
    required init(base: Coffee) {
        self.base = base
    }
}

class Whip: CoffeeDecorator {
    let base: Coffee
    
    var cost: Int {
        return base.cost + 30
    }
    
    required init(base: Coffee) {
        self.base = base
    }
}

class Sugar: CoffeeDecorator {
    let base: Coffee
    
    var cost: Int {
        return base.cost + 10
    }
    
    required init(base: Coffee) {
        self.base = base
    }
}

class Cinnamon: CoffeeDecorator {
    let base: Coffee
    
    var cost: Int {
        return base.cost + 15
    }
    
    required init(base: Coffee) {
        self.base = base
    }
}

// MARK: - Base class

class SimpleCoffee: Coffee {
    var cost: Int {
        return 100
    }
}

let coffe = SimpleCoffee()
print(coffe.cost)
let coffeWithMilk = Milk(base: coffe)
print(coffeWithMilk.cost)
let coffeWithDoubleMilk = Milk(base: coffeWithMilk)
print(coffeWithDoubleMilk.cost)
let chefsCoffee = Cinnamon(base: Milk(base: Sugar(base: Whip(base: coffe))))
print(chefsCoffee.cost)
