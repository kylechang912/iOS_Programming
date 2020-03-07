//
//  RecipeViewController.swift
//  KUCookBook
//
//  Created by Chang Chan Woo on 09/08/2019.
//  Copyright © 2019 Chang Chan Woo. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var ingredientLabel: UILabel!
    @IBOutlet var recipeTextView: UITextView!
    
    var recipe: RecipeInfo!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ingredientLabel.text = recipe.ingredient
        recipeTextView.text = recipe.recipe
        
        self.navigationItem.title = recipe.title
        let image = UIImage(named: recipe.imageName)
        imageView.image = image
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
