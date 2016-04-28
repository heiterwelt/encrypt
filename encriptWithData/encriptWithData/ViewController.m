//
//  ViewController.m
//  testchrchieve
//
//  Created by Linyou-IOS-1 on 16/4/25.
//  Copyright © 2016年 MuYou INTERACTIVE TECHNOLOGY LIMITED. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //  names=nil;
    
    
    
    
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSUserDefaults *defalt=[NSUserDefaults standardUserDefaults];
    
    NSData *data=[NSKeyedArchiver archivedDataWithRootObject:@"你好"];
    NSMutableData *datamutable=[NSMutableData dataWithData:data];
    
    NSData *dataappend=[NSData dataWithBytes:"123" length:3];
    
    [datamutable appendData:dataappend];
    
    
    NSLog(@"datamutable:%@",datamutable);
    [defalt setObject:datamutable forKey:@"name"];
    
    
    if ([[defalt valueForKey:@"name"] isKindOfClass:[NSString class]]) {
        [defalt removeObjectForKey:@"name"];
    }
    
    
    NSMutableData *mudata=[defalt objectForKey:@"name"];
    
    NSRange  range= NSMakeRange(0, mudata.length-3);
    
    
    NSData *datagogo= [mudata subdataWithRange:range];
    NSLog(@"datagogogogog:%@",datagogo);
    NSString *names=[NSKeyedUnarchiver unarchiveObjectWithData:datagogo];
    NSLog(@"names:%@",names);
    
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(0, 90, 90, 30)];
    lab.text=names;
    [self.view addSubview:lab];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
