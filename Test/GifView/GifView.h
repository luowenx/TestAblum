//
//  GifView.h
//  Test
//
//  Created by luowenx on 2016/11/25.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GifView : UIView

/*
 * @brief desingated initializer
 */
- (id)initWithCenter:(CGPoint)center fileURL:(NSURL*)fileURL;
/*
 * @brief start Gif Animation
 */
- (void)startGif;
/*
 * @brief stop Gif Animation
 */
- (void)stopGif;
/*
 * @brief get frames image(CGImageRef) in Gif
 */
+ (NSArray*)framesInGif:(NSURL*)fileURL;

@end
