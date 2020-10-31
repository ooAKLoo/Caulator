//
//  ViewController.swift
//  Calculator
//
//  Created by 杨东举 on 2020/10/4.
//

import UIKit

class ViewController: UIViewController {

        var userIsTyping = false
        var m_num1: Double!
        var m_num2: Double!
        var m_opt:String!
        var m_result: Double!
        var flag=0;
        var dp=0
    
//    override func viewDidLoad() {
//           super.viewDidLoad()
//           self.view.backgroundColor = UIColor.black
//           let btn = UIButton()
//           self.numButton(btn)
//           btn.layer.cornerRadius = 34
//    }
    
    @IBAction func performOPeration(_ sender: UIButton) {
        sender.layer.cornerRadius = 0.5*sender.bounds.width
        switch sender.currentTitle!{
               case "+/-":
                   flag+=1
                   self.display.text = ""
                   if flag % 2 != 0 {
                       self.display.text = "-"+self.display.text!
                       flag -= 1
                   }
                   else{
                       self.display.text = self.display.text!+sender.currentTitle!
                   }
               case ".":
                   self.display.text = self.display.text!+sender.currentTitle!
               case "+","-","×","/","x^y","÷":
                   self.m_opt = sender.currentTitle!
                   let num1 = self.display.text!
                   self.m_num1=Double(num1)
                   self.display.text=self.m_opt
                   dp=1
                case "log10","√","1/x","ln":
                    let num1 = self.display.text!
                    self.m_num1=Double(num1)
                    self.m_result=self.Compute(num2: m_num1, operand: sender.currentTitle!)
                    let len = String(self.m_result).count
                    if len>10{
                        self.display.text=String(String(self.m_result).prefix(7))
                    }
                    else{
                        self.display.text=String(self.m_result)
                    }
                    dp=1
               case "=":
                   let num2=self.display.text!
                   self.m_num2=Double(num2)
                   if (self.m_opt=="/"||self.m_opt=="%") && self.m_num2 == 0{
                       self.display.text="error"
                       return
                   }
                   if self.m_num1 != nil{
                       self.m_result=self.Compute(num1: self.m_num1, num2: m_num2, operand: m_opt)
                   }
                let len = String(self.m_result).count
//                sessionId.index(sessionId.startIndex, offsetBy: 2)
                if len>10{
                    self.display.text=String(String(self.m_result).prefix(5))
                }
                else{
                    self.display.text=String(self.m_result)
                }
                   dp=1
               case "AC":
                   self.display.text=" "
               default:
                   break
               }
           }
               func Compute(num1 n1:Double,num2 n2:Double,operand opt:String)->Double{
                   print(n1,n2)
                   switch opt{
                   case "+":
                       return n1+n2
                   case "-":
                       return n1-n2
                   case "×":
                       return n1*n2
                   case "÷":
                       return n1/n2
                   case "x^y":
                       return pow(n1, n2)
                   default:
                       return 0.0
                   }
               }
           func Compute(num2 n2:Double, operand opt:String)->Double{
               switch opt{
               case "√":
                   return sqrt(n2)
               case "log10":
                   return log10(n2)
               case "ln":
                   return log(n2)
               case "1/x":
                   return 1/n2
               default:
                   break
               }
               return 0.0
        }
    
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func numButton(_ sender: UIButton) {
        sender.layer.cornerRadius = 0.5*sender.bounds.width
    let digit = sender.currentTitle!
    if userIsTyping{
        if dp==1{
            display.text=""
            let textInDisplay = display.text!
            display.text = textInDisplay + digit
            dp=0
        }
        else{
            let textInDisplay = display.text!
            display.text = textInDisplay + digit
        }
    }
    else{
        display.text=digit
        userIsTyping=true
    }
    print("\(String(describing: digit)) is called")
    }


}
    


