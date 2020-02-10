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
    var questionList = [String: [Question]]()

    // **********************************
    var animalTypes = ["      Dogs", "      Cats", "      Rabbits", "      Wild Life"]
    var animalImages:[UIImage] = [ #imageLiteral(resourceName: "Dog_square"), #imageLiteral(resourceName: "Cats_Square"), #imageLiteral(resourceName: "Rabbit-square"), #imageLiteral(resourceName: "LionSquare")]
    //**********************************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeAnimalList()
        initializeQuestionListFor(animal: "      Cats", fileName: "CatsQuestionList")
        initializeQuestionListFor(animal: "      Dogs", fileName: "DogsQuestionList")
        initializeQuestionListFor(animal: "      Rabbits", fileName: "RabbitsQuestionList")
        initializeQuestionListFor(animal: "      Wild Life", fileName: "WildLifeQuestionList")
        self.animalTableView.dataSource = self
        self.animalTableView.delegate = self
    }
    
    func initializeAnimalList() {
        
        // TODO: Store name and image_url in a file and populate animalList from the file
        for animal in animalTypes {
            self.animalList.append(Animal(name: animal, image: URL(fileURLWithPath: "some_url")))
        }
    }
    
    func initializeQuestionListFor(animal: String, fileName: String) {

        let decoder = JSONDecoder()
        let jsonFilePath = Bundle.main.path(forResource: fileName, ofType: "json")
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: jsonFilePath!))
        
        let result = try! decoder.decode([Question].self, from: jsonData)
        
        for question in result {

            if questionList[animal] == nil {
               
                questionList[animal] = [question]
            }
            else {
                questionList[animal]?.append(question)
            }
        }
    }
}

// MARK - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "animalCellId", for: indexPath) as? MainTableViewCell else {
            return UITableViewCell(frame: .zero)
        }
        
        // GKG
       // cell.textLabel!.text = animalTypes[indexPath.row]
        cell.imageView?.image = animalImages[indexPath.row]
                  
        cell.backgroundColor = UIColor.yellow
        cell.configureCellWithAnimal(animal: self.animalList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animalList.count
    }
}
// MARK - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "triviaScreenSegue", sender: indexPath)
    }
}

extension MainViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "triviaScreenSegue" {
            
            if let indexPath = sender as? IndexPath {
                
                if let myCell = animalTableView.cellForRow(at: indexPath) as? MainTableViewCell {
                    
                    if let destination = segue.destination as? QuestionViewController {
                        destination.questionList = questionList[myCell.typeLabel.text!]!
                        print(destination.questionList)
                    }
                }
            }
            
        }
    }
}
