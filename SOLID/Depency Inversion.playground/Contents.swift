import UIKit

// Dependency Inversion
/*
 Different parts of your code should not depend on concrete classes. They don’t need that knowledge. This encourages the use of protocols instead of using concrete classes to connect parts of your app.
 
 1.- High-level modules should not depend on low-level modules. Both should depend on abstractions.
 2.- Abstractions should not depend on details. Details should depend on abstractions.
 */


protocol NetworkManagerProtocol {
    func servicesIsOnline() -> Bool
}

class APIManager {
    
    var networkServices: NetworkManagerProtocol
    
    init(_ networkServices: NetworkManagerProtocol) {
        self.networkServices = networkServices
    }
    
    func login() {
        if networkServices.servicesIsOnline() {
            print("Connected")
        } else {
            print("Disconnected")
        }
    }
}

class NetworkServices: NetworkManagerProtocol {
    
    func servicesIsOnline() -> Bool {
        return true
    }
}

class SomeViewController {
    
    private var netowrk = APIManager(NetworkServices())
    
    func connect() {
        netowrk.login()
    }
}



let object = SomeViewController()
object.connect()


// Another case where protocl extension takes care of handling user and does not depends on abstraction.


struct User {
    let name: String
    let email: String
}

protocol UserHandlerProtocol {
    func add(_ user: User)
    func delete(_ user: User)
    func edit(_ user: User)
}

protocol DataStoreProtocol {
    func insert(_ user: User)
    func delete(_ user: User)
    func edit(_ user: User)
}

class DataBase: DataStoreProtocol {
    func insert(_ user: User) {}
    func delete(_ user: User) {}
    func edit(_ user: User) {}
}

final class UserHandler: UserHandlerProtocol {
    private let dataBase: DataStoreProtocol
    
    init(_ dataBase: DataStoreProtocol) {
        self.dataBase = dataBase
    }
    
    func add(_ user: User) {
        dataBase.insert(user)
    }
    
    func delete(_ user: User) {
        dataBase.delete(user)
    }
    
    func edit(_ user: User) {
        dataBase.edit(user)
    }
}
