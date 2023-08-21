
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var moneyTyoe: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var moneyLbael: UILabel!
    var coinManager=CoinManager()
    override func viewDidLoad() {
        pickerView.delegate=self
        pickerView.dataSource=self
        coinManager.returnManagerDelegate=self
        super.viewDidLoad()
      
    }
    
   
    
 
    //MARK: - UIPickerViewDelegate
    
}
extension ViewController:UIPickerViewDelegate{
    func pickerView(_ picker:UIPickerView, didSelectRow: Int, inComponent: Int){
        print(coinManager.currencyArray[didSelectRow])
        coinManager.getData(mony: coinManager.currencyArray[didSelectRow])
        moneyTyoe.text=coinManager.currencyArray[didSelectRow]
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        coinManager.currencyArray[row]
    }
    
}
//MARK: - UIPickerViewDataSource

extension ViewController:UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    
    
}
//MARK: - returnManager

extension ViewController:returnManager{
    func returnData(string : String) {
        
        DispatchQueue.main.async {
            self.moneyLbael.text=string
            print(string)
            
        }
    }
}
