//
//  ViewController.m
//  验证BOOL类型转换
//
//  Created by 魏忠海 on 16/6/22.
//  Copyright © 2016年 魏忠海. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()<CLLocationManagerDelegate>
@property (nonatomic, strong)CLLocationManager *locationManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.delegate = self;
        //定义一个CLLocationCoordinate2D作为区域的圆心
        CLLocationCoordinate2D companyCenter;
        companyCenter.latitude = 23.126272;
        companyCenter.longitude = 113.05568;
        //使用CLCircularRegion创建一个圆形区域，半径为500米
        CLRegion *fkit = [[CLCircularRegion alloc]initWithCenter:companyCenter radius:500 identifier:@"fkit"];
        [self.locationManager startMonitoringForRegion:fkit];
    }else{
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"这玩意不好使" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
    }
}
- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region{
    [[[UIAlertView alloc]initWithTitle:@"区域检测提示" message:@"您已经【进入】疯狂软件教育中心了" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
}
- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region{
    [[[UIAlertView alloc] initWithTitle:@"区域监测提示" message:@"您已经【离开】疯狂软件教育中心区域" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
