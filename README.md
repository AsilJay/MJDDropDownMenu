##<center>A MJDDropDownMenu Guide
---

* ## Introduction
	A simple library to show a <font color=#FF0000 size=4> *dropdown menu* </font>. You can decide <font color=#FF0000 size=4>*the columns of items*</font> to be displayed, where to display, just by giving the proper argument(s). The items ( I use <font color=#FF0000 size=4>*buttons*</font>, you can make your own choice by edit the source code, if you like )could respond to click events by using <font color=#FF0000 size=4>*delegate*</font>. What's more, there is a little <font color=#FF0000 size=4>*animation*</font>
when the menu comes out or dismiss.
	
	![Alt text](/Users/myjawdrops/Desktop/11.png
)
* ## Usage
	#### 3 steps
	* Set an NSArray (or mutable one) to save the models. In the demo, the model is defined in the MJDDropDownMenuItem class.
    ```objc
	@property (nonatomic, strong) NSMutableArray *items;
	```
    
  * Set a strong property to save a menu object.

   ``` objc
	@property (nonatomic, strong) MJDDropDownMenu *menu;
	```
    
  * Lazy load both properties above, for we need just one copy of them in memory. Remenber to fill the 'items' array with items you create. If you want the items to resond to clicks, set the controller as the menu's delegate in the lazy load.

   ```objc
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
  ```

 * Implement the responding method of a button, or whatever subclass of an UIResponder, by which the menu comes out.

   ```objc
   - (IBAction)showMenu:(id)sender {
      if (self.menu.isMenuVisible) {
          [self.menu hide];
          self.menu = nil;   
      }else{
          [self.menu show];
      }
  }
 ```
 
 * Implement the delegate method to respond to the items' action.

   ```objc
   #pragma mark - ***** MJDDropDownMenuDelegate *****
   - (void)dropDownMenu:(MJDDropDownMenu *)menu clickedBtn:(UIButton *)btn{
          NSLog(@"clicked menuButton - %ld",btn.tag);
}
 ```
      
      
   * ##Contact
    * Tel: 189-9414-1036
    * E-mail: 894318488@qq.com  /  shine_tingyv@163.com

     


   

