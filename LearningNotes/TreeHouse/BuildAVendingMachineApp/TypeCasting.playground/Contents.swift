class Employee {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class HourlyEmployee: Employee {
    let hourlyWage: Double
    
    init(name: String, hourlyWage: Double) {
        self.hourlyWage = hourlyWage
        super.init(name: name)
    }
    
    func payWages(for hours: Double) -> Double {
        return hourlyWage * hours
    }
}

class SalariedEmployee: Employee {
    let salary: Double
    
    init(name: String, salary: Double) {
        self.salary = salary
        super.init(name: name)
    }
    
    func paySalary() -> Double {
        return salary/24
    }
}

let hourlyEmployee = HourlyEmployee(name: "Taylor", hourlyWage: 12.00)
let salariedEmployee = SalariedEmployee(name: "Lorenzo", salary: 62000)

let employees = [hourlyEmployee, salariedEmployee]
//both these types have a common base type and when we mix and match them in the array, Swift converts or casts each obj to the "base type" to satusfy the array homogeneity rule.
for employee in employees {
    //IS operator returns true if the type matches a type we specify and false if not.
    if employee is HourlyEmployee {
        // Typecast operator "AS": to cast to one of the more specific subclasses in a process known as downcasting.
        let hourlyEmployee = employee as! HourlyEmployee
        // the forced form(as!) should ibly be used when you know the downcast will succeed.
        //in this if satement, we're sure that employee is sa salaried emplyee, so we can use as!
        hourlyEmployee.payWages(for: 10.00)
    }
    if employee is SalariedEmployee {
        //conditional typecast(as?): returns an optional value if cast succceeds of nil if it fails.
        if let salariedEmployee = employee as? SalariedEmployee {
            salariedEmployee.paySalary()
        }
        
        
    }
}

