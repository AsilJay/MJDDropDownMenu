//
//  MJDDropDownMenuItem.h
//  Lottery
//
//  Created by myjawdrops on 16/7/6.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MJDDropDownMenuItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *image;

+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image;

@end
