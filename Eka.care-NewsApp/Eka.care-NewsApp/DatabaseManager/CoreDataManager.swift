//
//  DatabaseManager.swift
//  Eka.care-NewsApp
//
//  Created by Ankur Kumar on 15/03/25.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    let persistentContainer: NSPersistentContainer
    
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "Eka_care_NewsApp")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data failed to load: \(error)")
            }
        }
    }
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveArticle(_ article: Article) {
        let savedArticle = SavedArticle(context: context)
        savedArticle.title = article.title
        savedArticle.descriptionText = article.description
        savedArticle.articleURL = article.url
        savedArticle.imageURL = article.urlToImage
        
        do {
            try context.save()
            print("✅ Article successfully saved!")
        } catch {
            print("❌ Failed to save article: \(error.localizedDescription)")
        }
    }
    
    
    func fetchSavedArticles() -> [SavedArticle] {
        let request: NSFetchRequest<SavedArticle> = SavedArticle.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("Failed to fetch articles: \(error)")
            return []
        }
    }
    
    func deleteArticle(_ article: SavedArticle) {
        context.delete(article)
        do {
            try context.save()
            print("🗑 Article Deleted Successfully")
        } catch {
            print("❌ Error deleting article: \(error.localizedDescription)")
        }
    }
    
    
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save Core Data context: \(error)")
        }
    }
    
}
