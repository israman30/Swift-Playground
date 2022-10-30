import UIKit

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

enum APIError: Error {
    case badURL
    case badImage
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
