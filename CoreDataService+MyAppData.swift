//
//  CoreDataService+MyAppData.swift
//  CoreDataTest
//
//  Created by Aleksandr Moroshovskyi on 04.05.2024.
//

import CoreData

// MARK: - Weather
extension CoreDataService {
    
    func insertMyAppData(name: String, image: URL) {
        
        let myAppDataEntityDescription = NSEntityDescription.entity(forEntityName: "MyAppData", in: context)!
        guard let myAppData = NSManagedObject(entity: myAppDataEntityDescription, insertInto: context) as? MyAppData
        else {
            assertionFailure()
            return
        }
        
        myAppData.name = name
        myAppData.image = image

        
        /*
        for details in info.weather {
            if let detailsEntity = insertWetherDeatils(with: details) {
                detailsEntity.relationship = weatherInfoEntity
            }
        }
         */
        
        save(context: context)
    }
    
    /*
    func insertWetherDeatils(with details: DMWeatherInfo.Weather) -> CDWeatherDetails? {
        
        let weatherDetailsEntityDescription = NSEntityDescription.entity(forEntityName: "CDWeatherDetails", in: context)!
        guard let weatherDetailsEntity = NSManagedObject(entity: weatherDetailsEntityDescription, insertInto: context) as? CDWeatherDetails
        else {
            assertionFailure()
            return nil
        }
        
        weatherDetailsEntity.id = Int32(details.id)
        weatherDetailsEntity.icon = details.icon
        weatherDetailsEntity.mainInfo = details.main
        weatherDetailsEntity.details = details.description
        
        return weatherDetailsEntity
    }
     */
    
    func fetchAllInfo() -> [MyAppData] {
        
        let fetchRequest = MyAppData.fetchRequest()
        let fetchedResult = fetchDataFromEntity(MyAppData.self, fetchRequest: fetchRequest)
        
        return fetchedResult
    }
    
    func deleteAllInfo() {
        
        deleteAll(MyAppData.self)
    }
}

/*
 static func deleteCoreData(indexPath: Int, items: [MyData]) {
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     let dataToRemove = items[indexPath]
     context.delete(dataToRemove)
     do {
         try context.save()
     } catch {
         print("error-Deleting data")
     }
 }
 */
