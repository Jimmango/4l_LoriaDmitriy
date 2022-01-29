import UIKit

enum Speciallity: String {
    case sportA = "V-образный двигатель"
    case sportB = "аэродинамический профиль кузова"
}

enum CarType: String {
    case sport = "Спортивный автомобиль"
    case truck = "Грузовой автомобиль"
    case casual = "Легковой автомобиль"
}


class Car {
    var brand: String
    var year: Int
    var avSpeed: Double
    var carType: CarType
    
    init(brand: String, year: Int, carType: CarType, avSpeed: Double) {
        self.brand = brand
        self.year = year
        self.carType = carType
        self.avSpeed = avSpeed
    }
    
    func speed() {
        print("\(carType.rawValue) марки \(brand) разгоняется до 100 км/ч за \(avSpeed) секунд")
    }
}

class SportCar: Car {
    
    var speciallity: Speciallity
    
    init(brand: String,  year: Int, carType: CarType, avSpeed: Double, speciallity: Speciallity) {

        self.speciallity = speciallity

        super.init(brand: brand, year: year, carType: carType, avSpeed: avSpeed)
    }
    
    override func speed() {
        print("\(carType.rawValue) марки \(brand) разгоняется до 100 км/ч за \(avSpeed) секунд. Имеет специальный \(speciallity.rawValue).")
    }
    
}

class TrunkCar: Car {
    
    var trunkVolume: Int
    
    init(brand: String, year: Int, carType: CarType, avSpeed: Double, trunkVolume: Int) {
        
        self.trunkVolume = trunkVolume
        
        super.init(brand: brand, year: year, carType: carType, avSpeed: avSpeed)
    }
    
    override func speed() {
        print("\(carType.rawValue) марки \(brand) разгоняется до 100 км/ч за \(avSpeed) секунд. Может перевозить крупногабаритные грузы, так как имеет вместительный грузовой отдел, объемом на \(trunkVolume) литров.")
    }
    
}

let car = Car(brand: "lada", year: 2012, carType: .casual, avSpeed: 10.2)

car.speed()



let sportCar1 = SportCar(brand: "Audi", year: 2021, carType: .sport, avSpeed: 5.6, speciallity: .sportA)

let sportCar2 = SportCar(brand: "BMW", year: 2011, carType: .sport, avSpeed: 4.4, speciallity: .sportB)

sportCar1.speed()
sportCar2.speed()



let truck = TrunkCar(brand: "Ford", year: 2018, carType: .truck, avSpeed: 13.4, trunkVolume: 1600)

truck.speed()
