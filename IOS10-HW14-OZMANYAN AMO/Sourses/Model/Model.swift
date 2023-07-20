//
//  Model.swift
//  IOS10-HW14-OZMANYAN AMO
//
//  Created by Amahastla on 20.07.2023.
//

import Foundation

struct Model {
    let image: String
    let name: String
    let description: String
}

struct Label {
    let bigLabel: String
}

class DataManager {
    private init() {}
    
    static let shared = DataManager()
    
    func createModels() -> [[Model]] {
        return [
            [
                Model(image: "1", name: "Недавние", description: "12786"),
                Model(image: "2", name: "Избранное", description: "2344"),
                Model(image: "3", name: "WhatsApp", description: "5435"),
                Model(image: "4", name: "Instagram", description: "342"),
                Model(image: "5", name: "Дом", description: "678"),
                Model(image: "6", name: "Работа", description: "654"),
                Model(image: "7", name: "Семья", description: "9876"),
                Model(image: "8", name: "Горы", description: "3456")
            ],
            [
                Model(image: "9", name: "Автоселфи", description: "1432"),
                Model(image: "10", name: "Смысл жизни", description: "5737"),
                Model(image: "11", name: "Питер", description: "7895"),
                Model(image: "12", name: "Фото на аву", description: "8765")
            ],
            [
                Model(image: "video", name: "Видео", description: "3465"),
                Model(image: "person.crop.square", name: "Селфи", description: "3235"),
                Model(image: "livephoto", name: "Фото Live Photo", description: "643"),
                Model(image: "cube", name: "Портреты", description: "153"),
                Model(image: "pano", name: "Панорамы", description: "353"),
                Model(image: "square.stack.3d.down.right", name: "Серии", description: "465")
                
            ],
            [
                Model(image: "square.stack.3d.forward.dottedline", name: "Анимированные", description: "132"),
                Model(image: "square.and.arrow.down", name: "Импортированные", description: "43"),
                Model(image: "eye.slash", name: "Скрытые", description: "24"),
                Model(image: "trash", name: "Недавно удаленные", description: "123")
            ]
        ]
    }
    
    func createLabel() -> [[Label]] {
        return [
            [Label(bigLabel: "Мои альбомы")],
            [Label(bigLabel: "Медиафайлы")]
            
        ]
    }
}
