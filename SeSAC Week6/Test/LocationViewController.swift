//
//  LocationViewController.swift
//  SeSAC Week6
//
//  Created by 이승현 on 2023/08/22.
//
import UIKit
import CoreLocation // 1. CoreLocation Import
import MapKit
import SnapKit

class LocationViewController: UIViewController {
    // 2. 위치 매니저 생성: 위치에 대한 대부분을 담당
    let locationManager = CLLocationManager()
    let mapView = MKMapView()
    let cafeButton = UIButton()
    let foodButton = UIButton()
    let filterButton = UIButton()

    var theaterList = TheaterList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(50)
        }
        view.addSubview(cafeButton)
        cafeButton.backgroundColor = .red
        cafeButton.addTarget(self, action: #selector(cafeButtonClicked), for: .touchUpInside)
        cafeButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(20)
            make.size.equalTo(50)
            make.leading.equalTo(view).offset(100)
        }
        view.addSubview(foodButton)
        foodButton.backgroundColor = .blue
        foodButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(20)
            make.size.equalTo(50)
            make.trailing.equalTo(view).offset(-100)
        }
        
        view.addSubview(filterButton)
        filterButton.backgroundColor = .gray
        filterButton.addTarget(self, action: #selector(showFilterOptions), for: .touchUpInside)
        filterButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.size.equalTo(50)
            make.trailing.equalTo(view).offset(-150)
        }
        view.backgroundColor = .white
        // 3. 위치 프로토콜 연결
        locationManager.delegate = self
        checkDeviceLocationAuthorization() // // iOS 위치 서비스 활성화 체크
        let center = CLLocationCoordinate2D(latitude: 37.518385, longitude: 126.884187)
        setRegionAndAnnotation(center: center)
        setAnnotation(type: 0)
        addTheaterAnnotations(theaterList.mapAnnotations)
    }
    
    
    //😎
    func addTheaterAnnotations(_ theaters: [Theater]) {
        var annotations: [MKAnnotation] = []
        
        for theater in theaters {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: theater.latitude, longitude: theater.longitude)
            annotation.title = theater.type
            annotation.subtitle = theater.location
            annotations.append(annotation)
        }
        
        mapView.addAnnotations(annotations)
    }
    
    //파란색버튼
    @objc func cafeButtonClicked() {
        print("=d=d=d=d=")
        setAnnotation(type: 1)
        
        
    }
    //😎
    @objc func showFilterOptions() {
        let actionSheet = UIAlertController(title: "Filter", message: "Select a theater type", preferredStyle: .actionSheet)
        
        let lotteCinemaAction = UIAlertAction(title: "롯데시네마", style: .default)
        
        let megaboxAction = UIAlertAction(title: "메가박스", style: .default)
        
        let cgvAction = UIAlertAction(title: "CGV", style: .default)
        
        let showAllAction = UIAlertAction(title: "전체보기", style: .default) { _ in
            self.addTheaterAnnotations(self.theaterList.mapAnnotations)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(lotteCinemaAction)
        actionSheet.addAction(megaboxAction)
        actionSheet.addAction(cgvAction)
        actionSheet.addAction(showAllAction)
        actionSheet.addAction(cancelAction)
        
        present(actionSheet, animated: true, completion: nil)
    }

    

    //😎
    func setRegionAndAnnotation(center: CLLocationCoordinate2D, annotations: [MKAnnotation]) {
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 400, longitudinalMeters: 400)
        mapView.setRegion(region, animated: true)
        
        mapView.removeAnnotations(mapView.annotations) // Remove existing annotations
        mapView.addAnnotations(annotations)
        
        let userAnnotation = MKPointAnnotation()
        userAnnotation.title = "Your Location"
        userAnnotation.coordinate = center
        mapView.addAnnotation(userAnnotation)
    }
    
    // MARK: - 지도 뷰에 어노테이션(annotation)을 추가하거나 제거하는 역할
    func setAnnotation(type: Int) {
        print("=====333=====", type)
        //37.517857, 126.886714 //컴포즈
        //37.517746, 126.887131 //오밥
        //37.518107, 126.884798 seven
        //37.518135, 126.885853 청년취업사관학교

        
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude: 37.518107, longitude: 126.884798)
        
//        mapView.removeAnnotation(annotation1)
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 37.517746, longitude: 126.887131)
        
//        mapView.addAnnotations([annotation2])
        
        if type == 0 { //viewDidLoad때 annotation1, annotation2를 지도에 추가
            mapView.addAnnotations([annotation1, annotation2])
        
        } else if type == 1 {
            //이전에 추가되어 있는 모든 어노테이션을 제거한 후에 annotation2 어노테이션을 추가
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations([annotation2])
        }
    }
    
    // MARK: - 주어진 중심 좌표를 기반으로 지도 뷰의 표시 영역을 설정하고, 해당 위치에 어노테이션(annotation)을 추가하는 역할
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        //지도 중심 기반으로 보여질 범위 설정
        //let center = CLLocationCoordinate2D(latitude: 37.60385, longitude: 127.03328)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 400, longitudinalMeters: 400)
        mapView.setRegion(region, animated: true)
        
        // 지도에 어노테이션 추가
        let annotation = MKPointAnnotation() // 애플 기본 핀 모양
        annotation.title = "마이 홈"
        annotation.coordinate = center
        mapView.addAnnotation(annotation) // 핀 한개
        // mapView.addAnnotations(<#T##annotations: [MKAnnotation]##[MKAnnotation]#>) // 핀 여러개
    }
    
    // MARK: - 위치 서비스를 사용할 수 없는 상황에서 사용자에게 알림 창을 보여주는 역할
    //사용자에게 위치 서비스 활성화를 유도하고, 설정으로 이동할 수 있는 옵션을 제공
    func showLocationSetiingAlert() {
        let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요", preferredStyle: .alert)
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .default)  { _ in
            
            // 설정에서 직접적으로 앱 설정 화면에 들어간적이 없다면
            // 한번도 설정 앱에 들어가지 않았거나, 막 다운받은 앱이라서
            // 설정 페이지로 넘어갈 수 는 있어도 설정 상세 페이지로 넘어갈 수는 없다.
            if let appSetting = URL(string: UIApplication.openSettingsURLString) { //앱 설정 화면의 URL을 가져옴
                UIApplication.shared.open(appSetting) //앱 설정 화면을 연다.
            }
        }
    
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(goSetting)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    
    // MARK: - 위치 서비스 권한을 확인하는 함수
    func checkDeviceLocationAuthorization() {
        // iOS 위치 서비스 활성화 체크
        // 위치 권한 체크는 비동기로 처리해야함.
        DispatchQueue.global().async {
            // 위치 서비스가 활성화되어 있는지 확인. 만약 활성화되어 있으면, 권한 확인 및 처리(현재 사용자의 위치 권한 상태를 가지고 옴)를 진행.
            if CLLocationManager.locationServicesEnabled() {
            //현재 사용자의 위치 권한 상태를 가져옴. iOS 14.0 이상의 경우에는 locationManager.authorizationStatus를 사용하고,
            //그 이하 버전에서는 CLLocationManager.authorizationStatus()를 사용하여 상태를 가져옴. 가져온 권한 상태는 authorization 변수에 저장됨.
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                print(authorization, "77")
            //메인 스레드에서 권한 상태를 처리하는 부분. 메인 스레드에서 UI 업데이트 및 사용자 액션을 처리해야 하므로, 백그라운드 스레드에서 확인한 권한 상태를 메인 스레드에서 처리함.
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
            } else {
                print("위치 서비스가 꺼져 있어서 위치 권한 요청을 못합니다.")
            }
        }
    }
    
    // MARK: - 위치 서비스 권한의 상태에 따라 적절한 동작을 수행하는 역할을 하는 함수
    /// - Parameter status: status 매개변수로 권한 상태를 전달받음.
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        print("Check", status)
        //    @frozen >> 더 이상 열거형에 절대 추가될 케이스가 없다고 확인한다.!!!
        switch status {
        case .notDetermined: //사용자가 위치 권한을 아직 결정하지 않은 상태
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // 위치 업뎃 정확도 설정
            locationManager.requestWhenInUseAuthorization() //권한 허용을 위한 alert(info.plist)창을 표시하도록 요청함. 사용자에게 위치 정보를 사용할 때의 권한을 요청.
            setMapViewCenterBasedOnAuthorization()
        case .restricted: //앱에 의해 제한된 상태. 일반적으로 부모가 관리하는 계정이나 디바이스 제한.
            print("restricted")
            setMapViewCenterBasedOnAuthorization()
        case .denied: //사용자가 위치 권한을 거부한 상태.
            print("denied")
            showLocationSetiingAlert() //위치 설정을 변경하도록 유도하는 알림창을 표시
            setMapViewCenterBasedOnAuthorization()
        case .authorizedAlways: //항상 위치 사용 권한이 허용된 상태
            print("authorizedAlways")
            setMapViewCenterBasedOnAuthorization()
        case .authorizedWhenInUse: //앱 사용 중에 위치 사용 권한이 허용된 상태
            print("authorizedWhenInUse")
            locationManager.startUpdatingLocation()
            setMapViewCenterBasedOnAuthorization()// 위치 업데이트를 시작. 이후 didUpdateLocation 메서드 호출.
        case .authorized: // iOS 14.0 이상에서 deprecated된 상태, .authorizedAlways 또는 .authorizedWhenInUse로 처리됨.
            print("authorized")
        @unknown default: // 위치 권한 종류가 더 생길 가능성 대비하여 기본 처리를 정의
            print("default")
        }
    }
    
// MARK: - 사용자가 위치 권한을 허용한 경우에는 맵뷰의 중심을 사용자의 현재 위치로 설정 / 거부한 경우 디폴트(새싹)
    func setMapViewCenterBasedOnAuthorization() {
        let defaultCenter = CLLocationCoordinate2D(latitude: 37.518135, longitude: 126.885853)
        
        if CLLocationManager.locationServicesEnabled() {
            switch locationManager.authorizationStatus {
            case .authorizedWhenInUse, .authorizedAlways:
                if let userLocation = locationManager.location?.coordinate {
                    mapView.setCenter(userLocation, animated: true)
                } else {
                    mapView.setCenter(defaultCenter, animated: true)
                }
            case .denied, .restricted, .notDetermined:
                mapView.setCenter(defaultCenter, animated: true)
            @unknown default:
                mapView.setCenter(defaultCenter, animated: true)
            }
        } else {
            mapView.setCenter(defaultCenter, animated: true)
        }
    }
}



    // 4. 프로토콜 선언
// MARK: - 위치 관련 이벤트를 처리하는 메서드들을 구현하고 있는 프로토콜 확장. 각 메서드는 사용자의 위치 정보 및 위치 권한 변경에 대한 처리를 담당
extension LocationViewController: CLLocationManagerDelegate {
    // 5. 사용자의 위치 정보를 성공적으로 가져왔을 때 호출됨
    // 한번만 실행되지 않는다. iOS 위치 업데이트가 필요한 시점에 알아서 여러번 호출
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(#function)
        if let coordinate = locations.last?.coordinate {
            let lat = coordinate.latitude //위도
            let lon = coordinate.longitude //경도
            print(lat, lon)
            print(coordinate)
            //날씨api호출
        }
        locationManager.stopUpdatingLocation()
        //stopUpdatingLocation()을 호출하여 위치 업데이트를 중단함. 이렇게 하면 한 번 위치를 가져온 후 업데이트를 중단할 수 있다.
    }
    // 사용자의 위치를 가지고 오지 못한 경우
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    // 사용자의 권한 상태가 바뀔 때를 알려줌
    // 거부했다가 설정에서 변경을 했거나, 혹은 notDetermined 상태에서 허용을 했거나
    // 허용해서 위치를 가지고 오는 도중에, 설정에서 거부를 하고 앱으로 다시 돌아올 때 등
    // iOS 14 이상
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkDeviceLocationAuthorization() //위치 권한 상태를 확인하고 처리.
    }
    
    //사용자의 위치 권한 상태가 변경되었을 때(iOS 14 미만), 호출됨. iOS 14 이상에서는 위의 locationManagerDidChangeAuthorization를 사용하므로
    //이 메서드는 deprecated된 상태. 위치 권한 변경에 따른 추가 처리를 이곳에서 구현할 수 있다.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
}

// MARK: - MKMapViewDelegate 프로토콜을 확장, 지도 뷰에 관련된 이벤트를 처리하는 메서드
// 지도 영역이 변경되거나 어노테이션을 선택할 때 필요한 로직을 이 메서드들 내에서 구현
extension LocationViewController: MKMapViewDelegate {
    //지도의 표시 영역이 변경되었을 때 호출
    /// - Parameters:
    ///   - mapView: 변경된 지도 뷰의 인스턴스
    ///   - animated: 지도 표시 영역이 애니메이션으로 변경되었는지 여부를 나타냄
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print(#function)
    }
    
    //지도 상에서 어노테이션(annotation)을 선택했을 때 호출
    func mapView(_ mapView: MKMapView, didSㄴelect annotation: MKAnnotation) {
        print(#function)
    }
    //  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    //    print(#function)
    //  }
}


