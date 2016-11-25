//
//  ViewController.m
//  Test
//
//  Created by luowenx on 16/10/28.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import "ViewController.h"
#import "Enumeration.h"
#import "MJRefresh.h"
#import "Instruction.h"
#import "DrawView.h"
#import "BlackCue.h"
#import <AVFoundation/AVFoundation.h>
#import "MLLinkLabel.h"
#import "GifView.h"
#import "PushViewController.h"
#import "AlbumViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,CAAnimationDelegate>

@property (strong, nonatomic) UIDatePicker *datePicke;

@property (strong, nonatomic) NSMutableArray *testArray;

@property (strong, nonatomic) UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *greenBtn;
@property (strong, nonatomic) NSString *jsonString;

@property (weak, nonatomic) GifView *gifView;


@end

@implementation ViewController
{
    UITextView *_textView;
    MLLabel *_mlLabel;
    MLLinkLabel *_linkLabel;
    NSString *_gif_url;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self labelTest];

//    [self linkLabelTest];
    
    [self.gifView startGif];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

-(void)gifTest
{
    CGRect frame = CGRectMake(50,50,0,0);
    frame.size = [UIImage imageNamed:@"B65F95DC232A7B35BE53667BC2C42935.gif"].size;
    // 读取gif图片数据
    NSData *gif = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"B65F95DC232A7B35BE53667BC2C42935" ofType:@"gif"]];
    // view生成
    UIWebView *webView = [[UIWebView alloc] initWithFrame:frame];
    webView.userInteractionEnabled = NO;//用户不可交互
    [webView loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView];
}

-(void) linkLabelTest
{
    _linkLabel = [[MLLinkLabel alloc] initWithFrame:CGRectMake(50, 50, 200, 100)];
    _linkLabel.numberOfLines = 0;
    _linkLabel.backgroundColor = [UIColor lightGrayColor];
    _linkLabel.text = @"@luowenx 我是一串长长的文字,很长www.baidu.com的一段文字";
    [_linkLabel setDidClickLinkBlock:^(MLLink *link, NSString *linkText, MLLinkLabel *label) {
        NSLog(@"%@",linkText);
    }];
    [self.view addSubview:_linkLabel];
    NSArray *guideInfoList;
    NSMutableArray *resultArray = [NSMutableArray array];
    for (/*因为数组里是字典，所以用字典接收*/NSDictionary *dic in guideInfoList) {
        //根据key 取出来放进新的数组中
        [resultArray addObject:(NSArray*)[dic valueForKey:@"guideInfoFiles"]];
    }
    
    NSMutableArray *flie_url_Array = [NSMutableArray array];
    for (NSArray *shabiArray in resultArray) {
        if (shabiArray.count) {
            for (NSDictionary *dic in shabiArray) {
                [flie_url_Array addObject:[dic valueForKey:@"file_url"]];
            }
        }
    }
//    NSArray *images;
//    if (images) {
//        // 这里表示有图片
//        for (NSDictionary *dic in images) {
//            NSString *url = dic[@"file_url"]; // 这个url就是那图片
//            cell.image........
//        }
//    }else{
////        这里表示没有图片
//    }


}

-(void) labelTest
{
    _mlLabel = [[MLLabel alloc] initWithFrame:CGRectMake(50, 50, 200, 100)];
    _mlLabel.numberOfLines = 0;
    _mlLabel.backgroundColor = [UIColor lightGrayColor];
    _mlLabel.text = @"我是一串长长的文字,很长的一段文字";
    _mlLabel.textInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    _mlLabel.lineSpacing = 10;
    [self.view addSubview:_mlLabel];
}


- (void) textViewTest
{
    //    系统字体改变通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(preferredContentSizeChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.view.bounds), 100)];
    _textView.layer.borderWidth = 0.5f;
    _textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];  // 字体跟随系统
    [self.view addSubview:_textView];
    
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName: [UIColor redColor],
                                 NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline],
                                 NSTextEffectAttributeName: NSTextEffectLetterpressStyle
                                 };
}
- (void)preferredContentSizeChanged:(NSNotification *)notification{
    _textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }

    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

- (NSString*) testMethod:(NSString *)string1 String:(NSString*)string2
{
    NSLog(@"biubiubiu");
    return [NSString stringWithFormat:@"%@-%@",string1, string2];
}
- (IBAction)click:(id)sender {
    
    [BlackCue showText:@"提示文字"];
    [self.navigationController pushViewController:[[PushViewController alloc] init] animated:YES];
}
- (IBAction)pushAction {
    [self.navigationController pushViewController:[[AlbumViewController alloc] init] animated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 平移动画
        CABasicAnimation *a11 = [CABasicAnimation animation];
        a11.keyPath = @"transform.translation.x";
        a11.toValue = @(100);
        CABasicAnimation *a12 = [CABasicAnimation animation];
        a12.keyPath = @"transform.translation.y";
        a12.toValue = @(100);
        // 缩放动画
        CABasicAnimation *a2 = [CABasicAnimation animation];
        a2.keyPath = @"transform.scale";
        a2.toValue = @(0.5);
        // 旋转动画
        CABasicAnimation *a3 = [CABasicAnimation animation];
        a3.keyPath = @"transform.rotation";
        a3.toValue = @(M_PI_2);

        // 组动画
        CAAnimationGroup *groupAnima = [CAAnimationGroup animation];

        groupAnima.animations = @[a11, a12, a2, a3];
        groupAnima.delegate = self;

        //设置组动画的时间
        groupAnima.duration = 2;
        groupAnima.fillMode = kCAFillModeForwards;
        groupAnima.removedOnCompletion = NO;

        [self.greenBtn.layer addAnimation:groupAnima forKey:nil];
    
    NSLog(@"%@",self.navigationController);
}
#pragma mark   ======   CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"动画前按钮位置%@",NSStringFromCGRect(self.greenBtn.frame));
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        NSLog(@"动画后按钮位置%@",NSStringFromCGRect(self.greenBtn.frame));
        self.greenBtn.userInteractionEnabled = YES;
    }
}

#pragma mark   ======   tableView   Test

- (void) tableViewTest
{
    [self.view addSubview:self.tableView];
    __weak __typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(netTime() * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"--------");
            [weakSelf.tableView.mj_header endRefreshing];
        });
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.textLabel.text = @"1234567";
    return cell;
}

#pragma mark =====  测试数组是否线程安全
-(void)IllegalOperationArray
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 1; i<100; i++) {
            @synchronized (self) {
                [self.testArray addObject:@(i)];
            }
        }
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 40; i< 60; i++) {
            @synchronized (self) {
                [self.testArray addObject:@(i)];
            }
        }
    });
    
    for (int i = 20; i<40; i++) {
        @synchronized (self) {
            [self.testArray addObject:@(i)];
        }
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"%@",self.testArray);

    });
}

#pragma mark =====  方法参数可变
-(NSArray*) addObjects:(NSString*)string,...
{
    id curName;
    va_list list;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    if(string)
    {
        [array addObject:string];
        va_start(list, string);
        while ((curName = va_arg(list, id))){
            [array addObject:curName];
        }
        va_end(list);
    }
    return array;
}

#pragma mark   ====== getter 

-(GifView *)gifView
{
    if (!_gifView) {
        _gif_url = [[NSBundle mainBundle] pathForResource:@"B65F95DC232A7B35BE53667BC2C42935.gif" ofType:nil];
        GifView *gifView = [[GifView alloc] initWithCenter:CGPointMake(160, 250) fileURL:[NSURL URLWithString:_gif_url]];
        _gifView = gifView;
        [self.view addSubview:gifView];
    }
    return _gifView;
}

-(UIDatePicker *)datePicke
{
    if (!_datePicke) {
        _datePicke = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 150, 320, 100)];
        _datePicke. datePickerMode = UIDatePickerModeDateAndTime ;
        // 显示中文
        _datePicke. locale = [ NSLocale localeWithLocaleIdentifier : @"zh_CN" ];
        
        
    }
    return _datePicke;
}

-(NSMutableArray *)testArray
{
    if (!_testArray) {
        _testArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _testArray;
}


-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

FOUNDATION_STATIC_INLINE CGFloat netTime ()
{
    return 0.1 * ((arc4random()%5) + 10);
}




@end

