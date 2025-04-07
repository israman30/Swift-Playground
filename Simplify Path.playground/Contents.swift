import UIKit

func simplifyPath(_ path: String) -> String {
    var stack = [String]()
    let components = path.split(separator: "/")
    
    for component in components {
        switch component {
        case "", ".":
            continue
        case "..":
            if !stack.isEmpty {
                stack.removeLast()
            }
        default:
            stack.append(String(component))
        }
    }
    
    let simplifiedPath = "/" + stack.joined(separator: "/")
    return simplifiedPath
}

print(simplifyPath("/home/"))
