//
//  TeamData.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 11.10.2024.
//

import UIKit

struct PersonModel {
    let imageName: String
    let position: String
    let firstName: String
    let lastName: String
    let age: Int
    let info: String
    
    var fullName: String {
        firstName + " " + lastName
    }
    
    var information: String {
        "\(personData.getCurrentPerson().fullName)\nВозраст: \(personData.getCurrentPerson().age)\n\(personData.getCurrentPerson().info)"
    }
}

class PersonManager {
    func getPersons() -> [PersonModel]{
        return [
            PersonModel(imageName: "investor", position: "Инвестор", firstName: "Евгений", lastName: "Бабкин", age: 50, info: "Самый любимый и уважаемый человек в компании, наш кормилец и волшебный пендель."),
            PersonModel(imageName: "creativeDirector", position: "Креативщик", firstName: "Лебедь", lastName: "Артемьев", age: 36, info: "Экстроординарный нескончаемый источник идей и вдохновения"),
            PersonModel(imageName: "marketing", position: "Маркетолог", firstName: "Наталья", lastName: "Кэшбэк", age: 28, info: "Жизнерадостная и обоятельная. Не хочет ничего решать, хочет бюджет на рекламу."),
            PersonModel(imageName: "seniorDev", position: "Разработчик", firstName: "Синьор", lastName: "Дэв", age: 33, info: "Специалист высочайшего класса, может писать код даже во сне. Считает себя самым крутым и скромным."),
            PersonModel(imageName: "stranger", position: "Мистер Х", firstName: "Эйты", lastName: "Кудаблин", age: 3, info: "Никто не знает кто это. Три года приходит и пьет кофе нахаляву.")
        ]
    }
}

class PersonDataManager {
    private var persons: [PersonModel] = []
    private var currentIndex = 0
    
    init(persons: [PersonModel]) {
        self.persons = persons
    }
    
    func getCurrentPerson() -> PersonModel {
        persons[currentIndex]
    }

    func getLastPerson() -> PersonModel {
        if currentIndex > 0 {
            currentIndex -= 1
        }
        return getCurrentPerson()
    }

    func getNextPerson() -> PersonModel {
        if currentIndex < persons.count - 1 {
            currentIndex += 1
        }
        return getCurrentPerson()
    }
    
    func getFirstPerson() -> PersonModel {
            currentIndex = 0
            
        return getCurrentPerson()
    }
}

let personData = PersonDataManager(persons: PersonManager().getPersons())
