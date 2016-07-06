//
//  ViewController.m
//  MJDDropDownMenu
//
//  Created by myjawdrops on 16/7/6.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import "ViewController.h"
#import "MJDDropDownMenu/MJDDropDownMenu.h"
#import "MJDDropDownMenu/MJDDropDownMenuItem.h"
#define MenuItems   9
#define MenuYOffset     64
#define MenuHWScale     1.2
#define MennuItemCols   4


@interface ViewController ()<MJDDropDownMenuDelegate>

@property (nonatomic, strong) MJDDropDownMenu *menu;
@property (nonatomic, strong) NSMutableArray *items;


@end

@implementation ViewController


- (NSMutableArray *)items{
    if (!_items) {
        _items = [NSMutableArray array];
        for (int i = 0; i < MenuItems; i++){
            MJDDropDownMenuItem *item = [MJDDropDownMenuItem itemWithTitle:@"Hello" image:[UIImage imageNamed:@"red"]];
            [_items addObject:item];
        }
    }
    return _items;
}

- (MJDDropDownMenu *)menu{
    if (!_menu){
        
        _menu = [MJDDropDownMenu menuInView:self.view withItemCols:MennuItemCols andItems:self.items andYOffset:MenuYOffset andHWScale:MenuHWScale];
        
        _menu.delegate = self;
    }
    return _menu;
}

- (IBAction)showMenu:(id)sender {
    
    if (self.menu.isMenuVisible) {
        [self.menu hide];
        self.menu = nil;
        
    }else{
        [self.menu show];
    }
}

#pragma mark - ***** MJDDropDownMenuDelegate *****
- (void)dropDownMenu:(MJDDropDownMenu *)menu clickedBtn:(UIButton *)btn{
    NSLog(@"clicked menuButton - %ld",btn.tag);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
