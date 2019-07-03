import CswiftLib

print("Hello, world!")

greetMe()

let myName = "Mikoláš"
//let myCName = myName.utf8CString as ContiguousArray<Int8>
let myLastName = "Stuchlík"
var array = Array(myLastName.utf8CString)
let unsafe = UnsafeRawPointer(&array).bindMemory(to: Int8.self, capacity: array.count)
let mutableUnsafe = UnsafeMutablePointer<Int8>(mutating: unsafe)

let employee = Employee(first_name: myName, last_name: mutableUnsafe, is_married: true, salary: 350_000, citizen_id: 9608117777);

print_employee(employee);

employee.last_name?[2] = 100 
 
print_employee(employee);

// Convention C a scope
test_block(1995, { (aNumber: UInt64) -> Void in
    for _ in 0..<3 {
        print(aNumber)
    }
})

extension UInt64 {
    func decoration() {
        test_block(1995, { (aNumber: UInt64) -> Void in
            for _ in 0..<10 {
                // print(self + aNumber)
            }
        })
    }
}

// Convention C a explicitní blok
let hireBlock: @convention(c) (Employee) -> Bool = { employee -> Bool in
    return !employee.is_married
}

let cHireBlock: HireEmployee = hireBlock

//Unions lolec :D
var myProperty = MyProperty.init(total_friend_debt: (0, 255, 0, 255, 0, 255, 0, 255))
print(myProperty.total_friend_debt)
print(myProperty.total_debt)

myProperty.total_debt = 10000
print(myProperty.total_friend_debt)
print(myProperty.total_debt)