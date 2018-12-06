//
//  ZLGViewController.m
//  ZLGImageRecognizeSDK
//
//  Created by ag970898664@163.com on 12/05/2018.
//  Copyright (c) 2018 ag970898664@163.com. All rights reserved.
//
#import "ZLGImageRecognition.h"
#import "ZLGViewController.h"

@interface ZLGViewController ()
@property (nonatomic,strong) UITextView *textView;
@end

@implementation ZLGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self UI];
    
//    [self selectImageCallBack];
    
//    [self localImageCallBack];
}

//从相机或者相册选择图片
- (void)selectImageCallBack {
    
    //从百度云平台申请的对应项目的 AppKey 与 SecretKey
    
    [ZLGImageRecognition authWithAppKey:@"SQfnxusjdIGGCAKduBec8lom" andSecretKey:@"Pyf2aYzvcCbtVknHiiAu7wkvRG2xconr"];
    
    __weak typeof(self) weakSelf = self;
    [ZLGImageRecognition imageRecognitionViewController:self successHandler:^(id result, UIImage *image) {
        
        //处理数据
        NSMutableString *message = [NSMutableString string];
        if(result[@"words_result"]){
            if([result[@"words_result"] isKindOfClass:[NSDictionary class]]){
                [result[@"words_result"] enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                    if([obj isKindOfClass:[NSDictionary class]] && [obj objectForKey:@"words"]){
                        [message appendFormat:@"%@: %@\n", key, obj[@"words"]];
                    }else{
                        [message appendFormat:@"%@: %@\n", key, obj];
                    }
                    
                }];
            }else if([result[@"words_result"] isKindOfClass:[NSArray class]]){
                for(NSDictionary *obj in result[@"words_result"]){
                    if([obj isKindOfClass:[NSDictionary class]] && [obj objectForKey:@"words"]){
                        [message appendFormat:@"%@\n", obj[@"words"]];
                    }else{
                        [message appendFormat:@"%@\n", obj];
                    }
                    
                }
            }
            
        }else{
            [message appendFormat:@"%@", result];
        }
        
        
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
            
            if (message.length > 0) {
                weakSelf.textView.text = message;
            }
            else{
                weakSelf.textView.text = @"内容为空";
            }
            NSLog(@"%@",message);
        }];
        
    } failHandler:^(NSError *err) {
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
            weakSelf.textView.text = @"识别有误";
            NSLog(@"%@",err);
        }];
        
    }];
    
}

//从本地直接上传图片识别
- (void)localImageCallBack {
    //从百度云平台申请的对应项目的 AppKey 与 SecretKey
    
    [ZLGImageRecognition authWithAppKey:@"SQfnxusjdIGGCAKduBec8lom" andSecretKey:@"Pyf2aYzvcCbtVknHiiAu7wkvRG2xconr"];
    
    __weak typeof(self) weakSelf = self;
    UIImage *image = [UIImage imageNamed:@"图片"];
    [ZLGImageRecognition imageRecognitionWithImage:image successHandler:^(id result, UIImage *image) {
        
        //处理数据
        NSMutableString *message = [NSMutableString string];
        if(result[@"words_result"]){
            if([result[@"words_result"] isKindOfClass:[NSDictionary class]]){
                [result[@"words_result"] enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                    if([obj isKindOfClass:[NSDictionary class]] && [obj objectForKey:@"words"]){
                        [message appendFormat:@"%@: %@\n", key, obj[@"words"]];
                    }else{
                        [message appendFormat:@"%@: %@\n", key, obj];
                    }
                    
                }];
            }else if([result[@"words_result"] isKindOfClass:[NSArray class]]){
                for(NSDictionary *obj in result[@"words_result"]){
                    if([obj isKindOfClass:[NSDictionary class]] && [obj objectForKey:@"words"]){
                        [message appendFormat:@"%@\n", obj[@"words"]];
                    }else{
                        [message appendFormat:@"%@\n", obj];
                    }
                    
                }
            }
            
        }else{
            [message appendFormat:@"%@", result];
        }
        
        
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
            
            if (message.length > 0) {
                weakSelf.textView.text = message;
            }
            else{
                weakSelf.textView.text = @"内容为空";
            }
            NSLog(@"%@",message);
        }];
        
    } failHandler:^(NSError *err) {
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
            weakSelf.textView.text = @"识别有误";
            NSLog(@"%@",err);
        }];
        
    }];
}

//显示返回结果
-(void) UI {
    
    //
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(50, 100, 100, 40)];
    button1.titleLabel.font = [UIFont systemFontOfSize:13];
    [button1 setTitle:@"本地图片识别" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor lightGrayColor];
    [button1 addTarget:self action:@selector(localImageCallBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    //
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(button1.frame)+20, 100, 170, 40)];
    button2.titleLabel.font = [UIFont systemFontOfSize:13];
    [button2 setTitle:@"从相册或相机取图片识别" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor lightGrayColor];
    [button2 addTarget:self action:@selector(selectImageCallBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-150, [UIScreen mainScreen].bounds.size.height*0.5)];
    self.textView.font = [UIFont systemFontOfSize:15];
    self.textView.textColor = [UIColor blackColor];
    self.textView.center = self.view.center;
    [self.view addSubview:self.textView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
