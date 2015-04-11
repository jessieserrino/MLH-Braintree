import Foundation
import CoreLocation

let proximityUUID = NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")

class BeaconManager : NSObject, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: proximityUUID, identifier: "Estimote Region")
    var closest: CLBeacon?
    
    override init () {
        super.init()
        manager.delegate = self
    }
    
    func start() {
        switch CLLocationManager.authorizationStatus() {
        case .AuthorizedAlways, .AuthorizedWhenInUse:
            manager.startRangingBeaconsInRegion(region)
        case .NotDetermined:
            println("requesting...")
            manager.requestAlwaysAuthorization()
        case .Restricted, .Denied:
            println("Restricted")
        }
    }
    
    func locationManager(manager: CLLocationManager!, didStartMonitoringForRegion region: CLRegion!) {
        manager.requestStateForRegion(region)
    }
    
    func locationManager(manager: CLLocationManager!, didDetermineState state: CLRegionState, forRegion inRegion: CLRegion!) {
        if (state == .Inside) {
            manager.startRangingBeaconsInRegion(region)
        }
    }
    
    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
        var myBeacons = [CLBeacon]()
        for beacon in beacons {
            if let myBeacon = beacon as? CLBeacon {
                if ((myBeacon.major == 1412 && myBeacon.minor == 1412) || (myBeacon.major == 11617 && myBeacon.minor == 37843) || (myBeacon.major == 36593 && myBeacon.minor == 63260)) {
                    println("Beacon \(myBeacon.major): \(myBeacon.accuracy)")
                    myBeacons.append(myBeacon);
                }
            }
        }
        myBeacons = myBeacons.filter({$0.accuracy > 0})
        myBeacons.sort({$0.accuracy < $1.accuracy})
        if myBeacons.count == 3 {
            if closest?.major != myBeacons.first!.major {
                closest = myBeacons.first!
                println("Closest is now \(self.closest!.major)")
            }
        }
        
        println()
    }
    
    func locationManager(manager: CLLocationManager!, monitoringDidFailForRegion region: CLRegion!, withError error: NSError!) {
        println("monitoringDidFailForRegion \(error)")
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("didFailWithError \(error)")
    }
}