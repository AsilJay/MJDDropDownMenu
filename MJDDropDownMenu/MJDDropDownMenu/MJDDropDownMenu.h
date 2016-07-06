//
//  MJDDropDownMenu.h
//  Lottery
//
//  Created by myjawdrops on 16/7/5.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MJDDropDownMenu;

@protocol MJDDropDownMenuDelegate <NSObject>

@optional
- (void)dropDownMenu:(MJDDropDownMenu *)menu clickedBtn:(UIButton *)btn;

@end

@interface MJDDropDownMenu : UIView

@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic, strong) NSMutableArray *btns;
@property (nonatomic, assign) BOOL  isMenuVisible;

@property(nonatomic,weak)  id<MJDDropDownMenuDelegate> delegate;

+ (instancetype)menuInView:(UIView *)superView withItemCols:(NSInteger)itemCols andItems:(NSArray *)menuItems andYOffset:(NSUInteger)yOffset andHWScale:(CGFloat)scale;

- (void)hide;

- (void)show;
@end
