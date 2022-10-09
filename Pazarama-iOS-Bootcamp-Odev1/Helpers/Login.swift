//
//  Login.swift
//  Pazarama-iOS-Bootcamp-Odev1
//
//  Created by GÜRHAN YUVARLAK on 24.09.2022.
//

import Foundation

final class Login {
    
    init() {}
    
    private func privateReadLine(title: String) -> String {
        var read = ""
        while true {
            if read != "" {
                break;
            } else {
                if title == "gender" {
                    print("Please enter your \(title) (Male or Female) :")
                } else {
                    print("Please enter your \(title) :")
                }
                read = readLine()!
                continue;
            }
        }
        return read
    }
    
    private func jobReadLine() -> String {
        var job = ""
        let jobs = jobs()
        while true {
            if job != "" {
                break;
            } else {
                print("Please choose your job: ")
                for item in jobs {
                    print("\(item.key) - \(item.value)")
                }
                job = readLine()!
                continue;
            }
        }
        job = getJob(jobKey: job)
        return job
    }
    
    private func jobs() -> Dictionary<String, String> {
        let jobs: [String: String] = ["1":"Boyacı", "2": "Su Ustası", "3": "Duvar Ustası", "4": "Marangoz"]
        return jobs
    }
    
    private func getJob(jobKey: String) -> String {
        let job = jobs().filter { $0.key == jobKey }
        return job[jobKey] ?? ""
    }
    
    public func register() -> User{
        let name = privateReadLine(title: "name")
        let gender = privateReadLine(title: "gender")
        let age = Int(privateReadLine(title: "age")) ?? 0
        let job = jobReadLine()
        print("Registration completed successfully.")
        print("Welcome to hardware store! \(name) - \(job)")
        return User(id: UUID().uuidString, name: name, gender: gender, age: age, job: job)
        
    }
}

