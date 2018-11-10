//
//  AMapViewController.m
//  JYPProduct
//
//  Created by apple on 2018/6/1.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "AMapViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import "CurrentLocationAnnotation.h"

// 设置公司经纬度
#define kLatitude 29.538061
#define kLongitude  106.506818

@interface AMapViewController ()<MAMapViewDelegate,AMapSearchDelegate>

// 地图
@property (nonatomic, strong) MAMapView            *mapView;

// 自定义大头针
@property (nonatomic, strong) UIImageView          *centerImageView;

// 当前选中类型
@property (nonatomic, copy) NSString               *currentType;

// 搜索引擎
@property (nonatomic, strong) AMapSearchAPI        *search;

// 防止重复点击
@property (nonatomic, assign) BOOL                  isMapViewRegionChangedFromTableView;

// 是否正在定位
@property (nonatomic, assign) BOOL                  isLocated;

// 坐标数据源
@property (nonatomic, strong) NSMutableArray        *searchPoiArray;

// 有多少个打卡范围(可拓展不同地方打卡)
@property (nonatomic, copy)NSMutableArray *circles;

@end

@implementation AMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"在线找房";
    
    [self p_initMapView];
    
    
    NSMutableArray *arr = [NSMutableArray array];
    MACircle *circle1 = [MACircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(kLatitude, kLongitude) radius:1000];
    [arr addObject:circle1];
    [self.circles addObjectsFromArray:arr];
    
}

// 装载数据坐标
-(NSMutableArray *)searchPoiArray
{
    if (!_searchPoiArray) {
        _searchPoiArray = [[NSMutableArray alloc]init];
    }
    return _searchPoiArray;
}

-(NSMutableArray *)circles
{
    if (!_circles) {
        _circles = [[NSMutableArray alloc]init];
    }
    return _circles;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    /**
     * 自定义用户 大头针
     */
    [self initCenterView];
    
    self.mapView.zoomLevel = 14;              /// 缩放级别（默认3-19，有室内地图时为3-20）,级别越大，显示的越精确
    self.mapView.showsUserLocation = YES;     /// 是否显示用户位置
    self.mapView.showsCompass = YES;          /// 是否显示指南针
    self.mapView.showsScale   = YES;          /// 是否显示比例尺
    self.mapView.minZoomLevel = 4;            /// 限制最小缩放级别
    
    
    // 将绘制的图形添加到地图上
    [self.mapView addOverlays:self.circles];
    
}

// 自定义用户大头针
- (void)initCenterView
{
    // 自己的坐标
    self.centerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"homePage_wholeAnchor"]];
    self.centerImageView.center = CGPointMake(self.mapView.center.x, self.mapView.center.y - CGRectGetHeight(self.centerImageView.bounds) / 2);
    
    [self.mapView addSubview:self.centerImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 初始化地图
- (void)p_initMapView
{
    self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.delegate = self;
    [self.view addSubview:_mapView];
    
    
    ///如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MAUserTrackingModeFollow;
    
    //NO表示禁用旋转手势，YES表示开启
    self.mapView.rotateEnabled = NO;
    
    
    self.search = [[AMapSearchAPI alloc] init];
    self.search.delegate = self;
    
}

/**
 * @brief 根据overlay生成对应的Renderer
 * @param mapView 地图View
 * @param overlay 指定的overlay
 * @return 生成的覆盖物Renderer
 */
- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay
{
    
    if ([overlay isKindOfClass:[MACircle class]])
    {
        MACircleRenderer *circleRenderer = [[MACircleRenderer alloc] initWithCircle:overlay];
        circleRenderer.lineWidth    = 1.f;
        circleRenderer.strokeColor = rgb(36, 183, 235, 0.3);

        
        NSInteger index = [self.circles indexOfObject:overlay];
        
//        if(index == 0) {
            circleRenderer.fillColor    = rgb(36, 183, 235, 0.3);
//        } else if(index == 1) {
//            circleRenderer.fillColor   = [[UIColor greenColor] colorWithAlphaComponent:0.3];
//        } else if(index == 2) {
//            circleRenderer.fillColor   = [[UIColor blueColor] colorWithAlphaComponent:0.3];
//        } else {
//            circleRenderer.fillColor   = [[UIColor yellowColor] colorWithAlphaComponent:0.3];
//        }
        return circleRenderer;
    }
    
    return nil;
}


#pragma mark - MapViewDelegate

/**
 * @brief 地图区域改变过程中会调用此接口 since 4.6.0
 * @param mapView 地图View
 */
- (void)mapViewRegionChanged:(MAMapView *)mapView
{
    self.centerImageView.alpha = 0.6;
}

/**
 * @brief 地图区域改变完成后会调用此接口
 * @param mapView 地图View
 * @param animated 是否动画
 */
- (void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    self.centerImageView.alpha = 1.0;
   
    NSLog(@"%f     %f",self.mapView.centerCoordinate.latitude,self.mapView.centerCoordinate.longitude);
    
    // 防止重复点击
    if (!self.isMapViewRegionChangedFromTableView && self.mapView.userTrackingMode == MAUserTrackingModeNone)
    {
        // 重新检索周边区域
        [self actionSearchAroundAt:self.mapView.centerCoordinate];
    }
    self.isMapViewRegionChangedFromTableView = NO;
}

/**
 * 地图
 */
- (void)actionSearchAroundAt:(CLLocationCoordinate2D)coordinate
{
    [self searchReGeocodeWithCoordinate:coordinate];
    [self searchPoiWithCenterCoordinate:coordinate];

    
    [self.mapView removeOverlays:self.circles];
    [self.circles removeAllObjects];
    
    MACircle *circle = [MACircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude) radius:1000];
    [self.circles addObject:circle];
    
    
    [self centerAnnotationAnimimate];
}



#pragma mark - userLocation
/**
 * @brief 位置或者设备方向更新后，会调用此函数
 * @param mapView 地图View
 * @param userLocation 用户定位信息(包括位置与设备方向等数据)
 * @param updatingLocation 标示是否是location数据更新, YES:location数据更新 NO:heading数据更新
 */
- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    if(!updatingLocation)
        return ;

    if (userLocation.location.horizontalAccuracy < 0){
        return ;
    }

    // only the first locate used.
    if (!self.isLocated) {

        self.isLocated = YES;
        self.mapView.userTrackingMode = MAUserTrackingModeFollow;
        [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude)];

        // 重新检索周边区域
        [self actionSearchAroundAt:userLocation.location.coordinate];
    }
}


/**
 * @brief 定位失败后，会调用此函数
 * @param mapView 地图View
 * @param error 错误号，参考CLError.h中定义的错误号
 */
- (void)mapView:(MAMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"error = %@",error);
}




#pragma mark - search

/**
 * @brief 根据中心点坐标来搜周边的POI.
 */
- (void)searchPoiWithCenterCoordinate:(CLLocationCoordinate2D )coord
{
    AMapPOIAroundSearchRequest *request = [[AMapPOIAroundSearchRequest alloc] init];

    request.location = [AMapGeoPoint locationWithLatitude:coord.latitude  longitude:coord.longitude];

    request.radius   = 1000;            /// 搜索范围 （可自定义）
    request.types    = @"学校";          /// 搜索类型 （可自定义 @[@"住宅", @"学校", @"楼宇", @"商场"] 等）
    request.sortrule = 0;               /// 排序规则

    [self.search AMapPOIAroundSearch:request];
}

/**
 * @brief 逆地址编码查询接口
 */
- (void)searchReGeocodeWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    AMapReGeocodeSearchRequest *regeo = [[AMapReGeocodeSearchRequest alloc] init];

    regeo.location = [AMapGeoPoint locationWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    regeo.requireExtension = YES;

    [self.search AMapReGoecodeSearch:regeo];
}

/**
 * @brief POI查询回调函数
 * @param request  发起的请求，具体字段参考 AMapPOISearchBaseRequest 及其子类。
 * @param response 响应结果， 具体字段参考   AMapPOISearchResponse 。
 */
- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
{
    
    
    [self.mapView removeAnnotations:self.searchPoiArray];
    [self.searchPoiArray removeAllObjects];
    
    
    
    if (response.pois.count == 0)
    {
        return;
    }
    
    
    //解析response获取POI信息，具体解析见 Demo
    NSLog(@" >>> %@",response.pois);
    
    [response.pois enumerateObjectsUsingBlock:^(AMapPOI *obj, NSUInteger idx, BOOL *stop) {
        
        // 这里使用了自定义的坐标是为了区分系统坐标 不然蓝点会被替代
        CurrentLocationAnnotation *annotation = [[CurrentLocationAnnotation alloc] init];
        [annotation setCoordinate:CLLocationCoordinate2DMake(obj.location.latitude, obj.location.longitude)];
        [annotation setTitle:[NSString stringWithFormat:@"%@ - %ld米", obj.name, (long)obj.distance]];
        [annotation setSubtitle:obj.address];
        
        NSLog(@"%@   %@",obj.address,annotation.title);
        
        [self.searchPoiArray addObject:annotation];
    }];
    
    /**
     *检索完立刻显示在地图上，也可以做个按钮，点击按钮，再把数据显示出来
     */
    [self showPOIAnnotations];
}

// 设置地图使其可以显示数组中所有的annotation
- (void)showPOIAnnotations
{
    // 向地图窗口添加一组标注
    [self.mapView addAnnotations:self.searchPoiArray];
    
    
    // 将绘制的图形添加到地图上
    [self.mapView addOverlays:self.circles];
    
    
   
    
    if (self.searchPoiArray.count == 1)
    {
        //  如果数组中只有一个则直接设置地图中心为annotation的位置。
 //       self.mapView.centerCoordinate = [(CurrentLocationAnnotation *)self.searchPoiArray[0] coordinate];
   //     [self.mapView setZoomLevel:16 animated:NO];
    }
}

/**
 * @brief 根据anntation生成对应的View
 * @param mapView 地图View
 * @param annotation 指定的标注
 * @return 生成的标注View
 */
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    
    // 自定义坐标
    if ([annotation isKindOfClass:[CurrentLocationAnnotation class]])
    {
        static NSString *reuseIndetifier = @"CustomAnnotationView";
        MAAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIndetifier];
        }
        annotationView.image = [UIImage imageNamed:@"HomePage_nearbyBikeRedPacket"];
        // 设置为NO，用以调用自定义的calloutView
        annotationView.canShowCallout = NO;
        
        // 设置中心点偏移，使得标注底部中间点成为经纬度对应点
        annotationView.centerOffset = CGPointMake(0, -18);
        return annotationView;
        
    }
    return nil;
}


#pragma mark - Handle Action

/* 移动窗口弹一下的动画 */
- (void)centerAnnotationAnimimate
{
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         CGPoint center = self.centerImageView.center;
                         center.y -= 20;
                         [self.centerImageView setCenter:center];}
                     completion:nil];

    [UIView animateWithDuration:0.45
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         CGPoint center = self.centerImageView.center;
                         center.y += 20;
                         [self.centerImageView setCenter:center];}
                     completion:nil];
}

@end
