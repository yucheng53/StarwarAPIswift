//
//  ViewController.swift
//  starWarApi
//
//  Created by cheng on 11/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var prevBtn: UIButton!
    @IBOutlet weak var myTabelView: UITableView!

    var peopleList = [Result]()
    var prevUrl: String?
    var nextUrl:  String?
    var planets = [Planet]()
    var homeDetail = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTabelView.delegate = self
        myTabelView.dataSource = self
        
        //getDataFromAPI(1)


        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        getDataFromAPI("https://swapi.py4e.com/api/people/?page=1")

    }
    
    
    func getDataFromAPI(_ url: String){
        //set URL
        guard let URL = URL(string: url) else {
            return
        }
        //GET request
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        //
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            if let data = data {
                //let str = String(data: data, encoding: .utf8)
                let decoder = JSONDecoder()
                do {
                    let parsedData: People = try decoder.decode(People.self, from: data)

                    //print("Parsed Data :, \(parsedData)")
                    self.peopleList = parsedData.results!
                    self.prevUrl = parsedData.previous
                    self.nextUrl = parsedData.next
                    self.peopleList.forEach { i in
                    }
                    //print(self.planets)
                    DispatchQueue.main.async {
                        self.myTabelView.reloadData()
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
            
        }
        task.resume()
    }
    
    func getHomeWorld(homeurl: String) {
        let homeURL = URL(string: homeurl)
        var homeURLRequest = URLRequest(url:homeURL!)
        homeURLRequest.httpMethod = "GET"
        let taskHomeURL = URLSession.shared.dataTask(with: homeURLRequest) {
            data, response, error in
            if let data = data {
                let decoder2 = JSONDecoder()
                do {
                    let homeData: Planet = try decoder2.decode(Planet.self, from: data)
                    print("homeData:", homeData.name!)
                    self.homeDetail = homeData.name!
                    //DispatchQueue.main.async {
                        //self.myTabelView.reloadData()
                    //}
                } catch {
                    print(error.localizedDescription)
                }
            }

        }
        taskHomeURL.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTabelView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! MyTableViewCell
        cell.nameLabel.text = String("Name: " + (peopleList[indexPath.row].name ?? ""))
        cell.eyeColorLabel.text = String("Eye Color: " + (peopleList[indexPath.row].eye_color ?? ""))
        cell.hairColorLabel.text = String("Hair Color: " + (peopleList[indexPath.row].hair_color ?? ""))
        let homeurl = peopleList[indexPath.row].homeworld!
        getHomeWorld(homeurl: homeurl)
        //cell.homeLabel.text = String("Home: " + (planets[indexPath.row].name ?? " "))
        cell.homeLabel.text = "Planet:" + self.homeDetail
        //cell.homeLabel.text = "Home"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    @IBAction func prevBtnTapped(_ sender: Any) {
        if prevUrl != nil {
            getDataFromAPI(self.prevUrl!)
        }
        self.myTabelView.reloadData()
    }
    
    
    @IBAction func nextBtnTapped(_ sender: Any) {
        if nextUrl != nil {
            getDataFromAPI(self.nextUrl!)
        }
        self.myTabelView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetails" { 
            let detailsVC = segue.destination as! DetailsViewController
            let cell = sender as! MyTableViewCell
            let indexPath = myTabelView.indexPath(for: cell)
            detailsVC.detailName = peopleList[indexPath!.row].name!
            detailsVC.detailEyeColor = peopleList[indexPath!.row].eye_color!
            detailsVC.detailHomePlanet = self.homeDetail
            detailsVC.detailFilms = peopleList[indexPath!.row].films!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //self.performSegue(withIdentifier: "ShowDetails", sender: indexPath.row)
    }
    

}

