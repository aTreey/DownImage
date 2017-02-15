//
//  ViewController.m
//  DowneImage
//
//  Created by Hongpeng Yu on 2017/2/12.
//  Copyright © 2017年 Hongpeng Yu. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "TestImageView.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *appInfos;

/**
 * 下载队列
 */
@property (nonatomic, strong) NSOperationQueue *downLoadQueue;

/**
 * 缓存图片的字典
 */
@property (nonatomic, strong) NSMutableDictionary *operationCache;

@property (weak, nonatomic) IBOutlet TestImageView *testImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.appInfos = [Model appInfos];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    Model *appInfo = self.appInfos[arc4random_uniform(16)];
    
    NSLog(@"开始下载 ===%@", appInfo.icon);
//    if (_operationCache[appInfo.icon]) {
//        NSLog(@"正在下载中。。。");
//        return;
//    }
//    
//    DownOperation *operation = [DownOperation downImageWithurlPath:appInfo.icon finishBlcok:^(UIImage *image) {
//        
//        // 图片下载完成后清楚缓存字典中数据
//        [_operationCache removeObjectForKey:appInfo.icon];
//        
//        // 注意: 此处需回到主线程更新UI
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            self.testImage.image = image;
//            NSLog(@"下载完成");
//        }];
//        
//    }];
//    
//    
//    
//    // 下载任务添加到队列中
//    [self.downLoadQueue addOperation:operation];
//    
//    // 添加到操作缓存
//    self.operationCache[appInfo.icon] = operation;
    
    
    
//    // 增加manager 类后
//    [[DownLoadManager sharedInstance] downloadImageWithurlPath:appInfo.icon finishBlock:^(UIImage *image) {
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            self.testImageView.image = image;
//        }];
//    }];
    
    
    // 增加自定义的imageView类后
    [self.testImageView test_setDownLoadImageWithurlPath:appInfo.icon placeholderImage:[UIImage imageNamed:@"user_default"]];
    
    
    
    /*
    
    // NSOperation 添加依赖
    {
        NSOperationQueue *testQueue = [[NSOperationQueue alloc] init];
        NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"operation1 NSThread = %@", [NSThread currentThread]);
        }];
        
        NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"operation2 NSThead = %@", [NSThread currentThread]);
        }];
        
        // 添加依赖，1 依赖于 2，只有2 执行完之后才执行1
        [operation1 addDependency:operation2];
        // 加入到队列
        [testQueue addOperation:operation1];
        [testQueue addOperation:operation2];
        
        
        // 添加一组到队列中
        [testQueue addOperations:@[operation1, operation2] waitUntilFinished:NO];
        // 添加一个block 形式的operation
        [testQueue addOperationWithBlock:^{
            NSLog(@"执行一个新的线程");
        }];
        // 当前线程等待
        [testQueue waitUntilAllOperationsAreFinished];
    }
     
     */
}


#pragma mark -
#pragma mark lazy

- (NSOperationQueue *)downLoadQueue {
    if (!_downLoadQueue) _downLoadQueue = [[NSOperationQueue alloc] init];
    return _downLoadQueue;
}

- (NSMutableDictionary *)operationCache {
    if (!_operationCache) _operationCache = [NSMutableDictionary dictionary];
    return _operationCache;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    [_operationCache removeAllObjects];
    self.testImageView.image = nil;
    // Dispose of any resources that can be recreated.
}


@end
