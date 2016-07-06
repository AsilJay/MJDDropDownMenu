//
//  MJDDropDownMenu.m
//  Lottery
//
//  Created by myjawdrops on 16/7/5.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import "MJDDropDownMenu.h"
#import "MJDDropDownMenuItem.h"
#define MJDScreenWidth [UIScreen mainScreen].bounds.size.width

#define MenuItem_Margin 1

@interface MJDDropDownMenu ()
@property (nonatomic, assign) NSInteger  itemCols;

@property (nonatomic, assign) NSInteger  itemRows;

@property (nonatomic, assign) CGFloat  scale;
@end


@implementation MJDDropDownMenu

+ (instancetype)menuInView:(UIView *)superView withItemCols:(NSInteger)itemCols andItems:(NSArray *)menuItems andYOffset:(NSUInteger)yOffset andHWScale:(CGFloat)scale{
    MJDDropDownMenu *menu = [[MJDDropDownMenu alloc] init];
    menu.menuItems = menuItems;
    menu.scale = scale;
    
    NSInteger itemRows = (menuItems.count - 1) / itemCols + 1;
    menu.itemCols = itemCols;
    menu.itemRows = itemRows;
    
    CGFloat menuW = MJDScreenWidth;
    CGFloat menuH = menuW/menu.itemCols *scale * itemRows;
    CGFloat menuX = 0;
    CGFloat menuY = yOffset;
    menu.isMenuVisible = NO;
    menu.frame = CGRectMake(menuX, menuY, menuW, menuH);
    
    int i = 0;
    for (MJDDropDownMenuItem * item in menuItems) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [btn setImage:item.image forState:(UIControlStateNormal)];
        [btn setTitle:item.title forState:(UIControlStateNormal)];
        btn.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1];
        btn.tag = i;
        i++;
        [btn addTarget:menu action:@selector(menuBtnClicked:) forControlEvents:(UIControlEventTouchUpInside)];
        
        [menu.btns addObject:btn];
        [menu addSubview:btn];
    }
    menu.hidden = YES;
    
    [superView addSubview:menu];
    
    return menu;
}

- (void)menuBtnClicked:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(dropDownMenu:clickedBtn:)]){
        [self.delegate dropDownMenu:self clickedBtn:btn];
    }
}

- (void)layoutSubviews{
    
    NSInteger col = 0,row = 0;
    NSInteger i = 0;
    CGFloat w,h,x,y;
    for (UIButton *btn in self.subviews) {
        col = i % self.itemCols;
        row = i / self.itemCols;
        
         w = MJDScreenWidth / _itemCols - MenuItem_Margin;
         x = (w+MenuItem_Margin) * col;
         h = (w+MenuItem_Margin) * self.scale;
        if (col == self.itemCols - 1 ) {
            w = MJDScreenWidth / _itemCols;
            x = w * col;
        }
        
        
        y = (h+MenuItem_Margin) * row;
        btn.frame = CGRectMake(x, y, w, h);
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        i++;
    }

}

- (void)show{
    self.hidden = NO;
    self.isMenuVisible = !self.isMenuVisible;
    self.transform = CGAffineTransformTranslate(self.transform, 0,  - self.frame.size.height);
    [UIView animateWithDuration:0.25 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:(UIViewAnimationOptionCurveEaseIn) animations:^{
        self.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
    }];
}


- (void)hide{
    self.isMenuVisible = !self.isMenuVisible;
    [UIView animateWithDuration:0.25 animations:^{
        self.transform = CGAffineTransformTranslate(self.transform, 0, - self.frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
    
}

@end
