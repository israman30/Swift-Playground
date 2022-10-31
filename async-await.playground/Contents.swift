import UIKit

/**
 Async stands for asynchronous and can be seen as a method attribute making it clear that a method performs asynchronous work.
 */

/*
 Resources:
 https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html
 https://medium.com/@ashokrawat086/why-to-use-swift-async-await-b19993be27cf
 https://www.avanderlee.com/swift/async-await/
 https://www.hackingwithswift.com/swift/5.5/async-await
 **/
/// async: Indicates that a function/property is asynchronous. It further lets you suspend the execution
/// of the code until an asynchronous function/property returns a value or result.

/// await: Indicates that your code might halt its execution while it awaits the return of an asynchronous function/property.

// Error handler enum
enum APIError: Error {
    case badURL
    case badImage
    case badResponse
    case badDecoding(Error)
}

func fetchImage(from url: URL) async throws -> UIImage {
    // Fetch images from url and return image
    let (data, response) = try await URLSession.shared.data(from: url)
    // Throw error if response status code is not succeess
    guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.badURL }
    // Create Image from response data
    let image = UIImage(data: data)
    // Resize image and return or Throw error if not valid image
    guard let thumbnail = await image?.byPreparingThumbnail(ofSize: .init(width: 100, height: 100)) else {
        throw APIError.badImage
    }
    // return valid image
    return thumbnail
}

do {
    let image = try await fetchImage(from: URL(string: "")!)
} catch {
    print("Error")
}


enum UserError: Error {
    case invalidCount, dataTooLong
}

func fetchUsers(count: Int) async throws -> [String] {
    if count > 3 {
        throw UserError.invalidCount
    }
    return Array(["Eva", "John", "Lana"].prefix(count))
}

func save(users: [String]) async throws -> String {
    let saveUser = users.joined(separator: ", ")
    if saveUser.count > 32 {
        throw UserError.dataTooLong
    }
    return "Saved \(saveUser)"
}

func updateUsers() async {
    do {
        let users = try await fetchUsers(count: 3)
        let result = try await save(users: users)
    } catch {
        print("No users")
    }
}

// MARK: Trying to fetch an API

struct ServerStatus: Decodable {
    let data: Data?
    init(data: Data? = nil) {
        self.data = data
    }
}

class NetworkService {
    // Pre-async/await asynchrony
    func fetchServerStatus(completion: @escaping(ServerStatus) -> Void) {
        URLSession.shared.dataTask(with: URL(string: "http://amazingserver.com/status")!) { data, response, error in
            do {
                let serverStatus = try JSONDecoder().decode(ServerStatus.self, from: data!)
                completion(serverStatus)
            } catch {}
        }
        .resume()
    }
    
    func fetcheServerStatusWithAsync() async throws -> ServerStatus {
        let (data, _) = try await URLSession.shared.data(from: URL(string: "http://amazingserver.com/status")!)
        return ServerStatus(data: data)
    }
}

struct ViewModel {
    var serverStatus = ServerStatus()
}

class ViewController {
    let api = NetworkService()
    var vm = ViewModel()
    func viewDidAppear() {
        api.fetchServerStatus { [weak self] status in
            //  do something
        }
        Task {
            vm.serverStatus = try await api.fetcheServerStatusWithAsync()
        }
    }
}

// MARK: - Decoding an array of articles using async await
struct Posts: Codable {
    let id: Int
    let title: String
    let body: String
}

/// Fetching api using the original way to do

func fetchPosts(completion: @escaping(Result<[Posts], APIError>) -> Void) {
    URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/posts")!) { data, response, error in
        guard error != nil else {
            completion(.failure(.badURL))
            return
        }
        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode), let data = data else {
            completion(.failure(.badResponse))
            return
        }
        
        do {
            let posts = try JSONDecoder().decode([Posts].self, from: data)
            completion(.success(posts))
        } catch {
            completion(.failure(.badDecoding(error)))
        }
    }
    .resume()
}

/// Replacing the above method using async await

func fetchPostsWithAsync() async throws {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
    let request = URLRequest(url: url)
    let (data, response) = try await URLSession.shared.data(for: request)
    
    guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
        return
    }
    let posts = try JSONDecoder().decode([Posts].self, from: data)
}
