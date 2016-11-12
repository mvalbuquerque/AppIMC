//
//  ViewController.swift
//  AppIMC
//
//  Created by mvalbuquerque on 09/11/16.
//  Copyright © 2016 mvalbuquerque. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Defina valores minimo e máximo para o slader
        
        sdlPeso.minimumValue = 40
        sdlPeso.maximumValue = 200
        
        sdlAltura.minimumValue = 1.0
        sdlAltura.maximumValue = 2.8
        
        sdlPeso.value = 70
        sdlAltura.value = 1.70
        
        //
        self.computaValores()
   
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 1º Defina as propriedades dos elementos de tela
    //
    
    
    @IBOutlet weak var imcNavigation: UINavigationBar!
  
    //
    @IBOutlet weak var sdlPeso: UISlider!
    @IBOutlet weak var lblPeso: UILabel!
    
    //
    @IBOutlet weak var sdlAltura: UISlider!
    @IBOutlet weak var lblAltura: UILabel!

    //
    @IBOutlet weak var lblIMC: UILabel!
    @IBOutlet weak var lblIac: UILabel!
    
    func computaValores() {
        let valorPeso: Float = sdlPeso.value
        let valorAltura: Float = sdlAltura.value
        let valorIMC = valorPeso / (valorAltura * valorAltura)
        
        
        lblPeso.text = String(format : "%.2f",valorPeso)
        lblAltura.text = String(format : "%.2f",valorAltura)
        lblIMC.text = String(format: "%.2f",valorIMC)
        
        if (valorIMC < 18.5) {
            lblIac.text = "Excesso de Magreza"
            lblIac.backgroundColor = UIColor.yellow
        }
        else {
            
            if (valorIMC < 25) {
                lblIac.text = "Normal"
                lblIac.backgroundColor = UIColor.green
                
                
            }
            else {
                
                if (valorIMC < 30) {
                    lblIac.text = "Excesso de Peso"
                    lblIac.backgroundColor = UIColor(red:255/255.0, green:232/255.0, blue:59/255.0, alpha:1.0)
                }
                else {
                    if (valorIMC < 35) {
                        lblIac.text = "Obesidade - Nível I"
                        lblIac.backgroundColor = UIColor(red:255/255.0, green:169/255.0, blue:156/255.0, alpha:1.0)
                        
                    }
                else {
                        if (valorIMC < 40) {
                            lblIac.text =  "Obesidade - Nível II"
                            lblIac.backgroundColor = UIColor(red:255/255.0, green:122/255.0, blue:112/255.0, alpha:1.0)
                        }
                else {
                            if (valorIMC > 40) {
                                lblIac.text = "Obesidade - Nível III"
                                lblIac.backgroundColor = UIColor(red:255/255.0, green:16/255.0, blue:0/255.0, alpha:1.0)
                            }
                        }

                    }
                }
            }
        }
    }
    
    
    @IBAction func moveuSlider(_ sender: UISegmentedControl) {
        self.computaValores()
        
             }
}
