import UIKit

//=====================================================================================================

/*
 - TableView animation
 - TableView cell will animate transforming the scale x, y when viewWillAppear
 */

    
func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1.0)
    
    UIView.animate(withDuration: 0.5, animations: {
        cell.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
    }, completion: nil)
}

extension UITableView {
    
    func animateTableView() {
        reloadData()
        let cells = visibleCells
        let tableViewEffects = bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewEffects)
        }
        
        var delay:Double = 0
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: delay * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delay += 1
        }
    }
}

//=====================================================================================================
