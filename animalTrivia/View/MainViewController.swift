//
//  MainViewController.swift
//  animalTrivia
//
//  Created by Raein Mehraban Teymouri on 8/21/19.
//  Copyright © 2019 Raein Mehraban Teymouri. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var animalTableView: UITableView!
    var animalList = [Animal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeAnimalList()
        initializeQuestionList()
        self.animalTableView.dataSource = self
        self.animalTableView.delegate = self
    }
    
    func initializeAnimalList() {
        
        // TODO: Store name and image_url in a file and populate animalList from the file
        let animalTypes = ["Dogs", "Cats", "Rabbits", "Wild Life"]
        
        for animal in animalTypes {
            self.animalList.append(Animal(name: animal, image: URL(fileURLWithPath: "some_url")))
        }
    }
    
    func initializeQuestionList() {

        let decoder = JSONDecoder()
        let jsonFilePath = Bundle.main.path(forResource: "QuestionList", ofType: "json")
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: jsonFilePath!))
        
        let result = try! decoder.decode([Question].self, from: jsonData)
        
        for question in result {
            
            print(question.question)
            print(question.answers)
            print(question.correctAnswer)
        }
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "animalCellId", for: indexPath) as? MainTableViewCell else {
            return UITableViewCell(frame: .zero)
        }
        
        cell.backgroundColor = UIColor.yellow
        cell.configureCellWithAnimal(animal: self.animalList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animalList.count
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
}
