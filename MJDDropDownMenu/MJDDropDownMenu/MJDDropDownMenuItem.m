//
//  MJDDropDownMenuItem.m
//  Lottery
//
//  Created by myjawdrops on 16/7/6.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import "MJDDropDownMenuItem.h"

@implementation MJDDropDownMenuItem
+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image{
    MJDDropDownMenuItem *item = [[MJDDropDownMenuItem alloc] init];
    item.title = title;
    item.image = image;
    return item;
}
@end
