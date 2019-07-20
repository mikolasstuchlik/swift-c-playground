/*
    [TODO]
    -Existuje pointer i po ukončení skopu? V jakých případech, jaká je jeho životnost?
    -Není lepší způsob přetypování? Co pro argumenty bez strdup?
*/

import CswiftLib

func dumpMemoryLayout<T>(_ instance: inout T){
    print("Instance \(UnsafeRawPointer(&instance)) of type \(String(describing: T.self)): Alignment \(MemoryLayout.alignment(ofValue: instance)) Stride \(MemoryLayout.stride(ofValue: instance)) Size \(MemoryLayout.size(ofValue: instance)) description: \(instance)")
}

// Defaultní funkce :D
print("Hello, world!")

// Výpis do konzole z C knihovny
greetMe()

func printAddress(_ ptr: UnsafeMutableRawPointer, onHeap: Bool = false){
    print(ptr)

}

final class MyClass {
    var myString: String
    var myContiguousString: ContiguousArray<CChar>
    var myArray: Array<Character>
    var myCArray: Array<CChar>

    init(){
        let myName = "To je ale krásně, sluníčko svítí!"
        myString = myName
        myContiguousString = myName.utf8CString
        myArray = Array(myName)
        myCArray = Array(myName.utf8CString)
    }

    func printMe(){
        printAddress(&myString, onHeap: true)
        printAddress(&myContiguousString, onHeap: true)
        printAddress(&myArray, onHeap: true)
        printAddress(&myCArray, onHeap: true)
    }
}

final class Capsule {
    var instance: MyClass?

    init(){
        instance = nil
    }

    func doIt(){
        instance = MyClass()
    }
}

var myCls = Capsule()
myCls.doIt()
myCls.instance?.printMe()







//Inicializace prměnné pro const char * => UnsafePointer<Int8> kompilátor doplní sám
let myName = "Mikoláš"

//Když někdo zapomene "const" nastává problém, protože char * => UnsafeMutablePointer<Int8>
//let myCName = myName.utf8CString as ContiguousArray<Int8>
var myLastName = "Stuchlík"

//První možnost: nešikovný memory binding
/*
var array = Array(myLastName.utf8CString)
let unsafe = UnsafeRawPointer(&array).bindMemory(to: Int8.self, capacity: array.count)
let mutableUnsafe = UnsafeMutablePointer<Int8>(mutating: unsafe)
let employee = Employee(first_name: myName, last_name: mutableUnsafe, is_married: true, salary: 350_000, citizen_id: 9608117777);
*/

//Druhá možnost: automatické přeložení
/*
var array = Array(myLastName.utf8CString)
let employee = Employee(first_name: myName, last_name: &array, is_married: true, salary: 350_000, citizen_id: 9608117777);
*/

//Třetí možnost: strdup
var array = strdup(myLastName)
let employee = Employee(first_name: myName, last_name: array, is_married: true, salary: 350_000, citizen_id: 9608117777);

print_employee(employee);

employee.last_name?[2] = 100 
 
print_employee(employee);















var myString = "Dobré ráno raníčko :)"
var myCString = myString.utf8CString
var myCStringArray = Array(myString)

dumpMemoryLayout(&myString)

dumpMemoryLayout(&myCString)
for i in 0..<myCString.count {
    dumpMemoryLayout(&myCString[i])
}

dumpMemoryLayout(&myCStringArray)
for i in 0..<myCStringArray.count {
    dumpMemoryLayout(&myCStringArray[i])
}






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
