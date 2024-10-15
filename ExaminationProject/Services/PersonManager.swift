//
//  PersonManager.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 15.10.2024.
//

import UIKit

class PersonManager {
    func getPersons() -> [PersonModel]{
        [
            PersonModel(imageName: "investor", position: "Инвестор", firstName: "Евгений", lastName: "Бабкин", age: 50, info: "Самый любимый и уважаемый человек в компании, наш кормилец и волшебный пендель."),
            PersonModel(imageName: "creativeDirector", position: "Креативщик", firstName: "Лебедь", lastName: "Артемьев", age: 36, info: "Экстроординарный нескончаемый источник идей и вдохновения"),
            PersonModel(imageName: "marketing", position: "Маркетолог", firstName: "Наталья", lastName: "Кэшбэк", age: 28, info: "Жизнерадостная и обоятельная. Не хочет ничего решать, хочет бюджет на рекламу."),
            PersonModel(imageName: "seniorDev", position: "Разработчик", firstName: "Синьор", lastName: "Дэв", age: 33, info: "Специалист высочайшего класса, может писать код даже во сне. Считает себя самым крутым и скромным."),
            PersonModel(imageName: "stranger", position: "Мистер Х", firstName: "Эйты", lastName: "Кудаблин", age: 3, info: "Никто не знает кто это. Три года приходит и пьет кофе нахаляву.")
        ]
    }
}
