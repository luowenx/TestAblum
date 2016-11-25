//
//  AlbumViewController.m
//  Test
//
//  Created by luowenx on 2016/11/25.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import "AlbumViewController.h"
#import "AlbumTool.h"
@interface AlbumViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSArray *albumList;


@end

@implementation AlbumViewController
{
    UITableView *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    _albumList = [[AlbumTool sharePhotoTool] getPhotoAblumList];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_tableView];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_albumList count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    AblumList *model = _albumList[indexPath.row];
    cell.textLabel.text = model.title;
    [[AlbumTool sharePhotoTool] requestImageForAsset:model.headImageAsset size:CGSizeMake(35, 35) resizeMode:PHImageRequestOptionsResizeModeFast completion:^(UIImage *image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.imageView.image = image;
        });
    }];
    
    return cell;
}

////从这个回调中获取所有的图片
//- (void)getImageWithAsset:(PHAsset *)asset completion:(void (^)(UIImage *image))completion
//{
//    CGSize size = [self getSizeWithAsset:asset];
//    [[AlbumTool sharePhotoTool] requestImageForAsset:asset size:size resizeMode:PHImageRequestOptionsResizeModeFast completion:completion];
//}
//#pragma mark - 获取图片及图片尺寸的相关方法
//- (CGSize)getSizeWithAsset:(PHAsset *)asset
//{
//    CGFloat width  = (CGFloat)asset.pixelWidth;
//    CGFloat height = (CGFloat)asset.pixelHeight;
//    CGFloat scale = width/height;
//    
//    return CGSizeMake(self.collectionView.frame.size.height*scale, self.collectionView.frame.size.height);
//}




@end
