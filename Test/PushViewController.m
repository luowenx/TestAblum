//
//  PushViewController.m
//  Test
//
//  Created by luowenx on 2016/11/25.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import "PushViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "NSString+transcoding.h"

#define SCREEN_WIDTH     [[UIScreen mainScreen] bounds].size.width

@interface PushViewController ()

@property (strong, nonatomic) AVAudioPlayer *player;

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *s = @"The weather on \U0001F30D is \U0001F31E today.";
    self.title = s;
    // The weather on 🌍 is 🌞 today.
    NSRange fullRange = NSMakeRange(0, [s length]);
    [s enumerateSubstringsInRange:fullRange
                          options:NSStringEnumerationByComposedCharacterSequences
                       usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop)
    {
        NSLog(@"%@ %@", substring, NSStringFromRange(substringRange));
    }];
//    [self play];

}

- (float)calculateContentHeight:(NSString *)content{
    
    UIFont *font = [UIFont systemFontOfSize:13];
    CGFloat lineHeight = font.lineHeight;
    int height = 0;
    float max_width = SCREEN_WIDTH-30;
    float max_height = ceil(lineHeight)*6;
    
    CGSize content_size = [content sizeWithFont:font constrainedToSize:CGSizeMake(max_width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    height = ceil(content_size.height);
    if (content.length == 0) {
        return 0;
    }
    
    height = MIN(max_height, height);
    return height;
}


- (void) play
{
    //播放背景音乐
    NSString *musicPath = [[NSBundle mainBundle] pathForResource:@"backgraoud" ofType:@"mp3"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:musicPath];
    
    // 创建播放器
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player prepareToPlay];
    [self.player setVolume:1];
    self.player.numberOfLoops = -1; //设置音乐播放次数  -1为一直循环
    [self.player play]; //播放
}


@end
