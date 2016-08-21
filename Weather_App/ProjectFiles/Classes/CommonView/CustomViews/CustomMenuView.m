//
//  CustomMenuView.m
//  Weather_App
//
//  Created by Sumeet on 14/08/16.
//  Copyright © 2016 reliancegames. All rights reserved.
//

#import "CustomMenuView.h"

@implementation CustomMenuView

- (id)initForAutoLayout {
    
    self = [super initForAutoLayout];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    
    self.cityList = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] valueForKey:CITY_NAME_LIST]];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self addMenuButton];
    [self addAddCityButton];
    [self addcityLabel];
    [self addTableView];
    
}

- (void)reload {
    
    [self.tableView reloadData];
}

- (void)addTableView {
    
    _tableView = [[UITableView alloc]initForAutoLayout];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:self.tableView];
    [self.tableView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:50];
    [self.tableView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self withOffset:-5.0];
    [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeRight];
}

- (void)addMenuButton {
    
    _menuButton = [UtilityMethods createButtonWithBGImageName:@"menu"
                                      andHighlightedImageName:@""
                                               andEventTarget:self
                                                    andAction:@selector(menuButtonAction)
                                                       andTag:10
                                               andButtonTitle:@""
                                                  andFontSize:10
                                                  andFontType:@""
                                              andFontColorHEX:@""
                                              andLeftCapWidth:0
                                             andLeftCapHeight:0];
    [self addSubview:self.menuButton];
    [self.menuButton autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:10];
    [self.menuButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10.0];
    [self.menuButton autoSetDimensionsToSize:CGSizeMake(16, 16)];
}

- (void)addAddCityButton {
    
    _addCityButton = [UtilityMethods createButtonWithBGImageName:@"add"
                                         andHighlightedImageName:@""
                                                  andEventTarget:self
                                                       andAction:@selector(addCityButtonTapped)
                                                          andTag:1
                                                  andButtonTitle:@""
                                                     andFontSize:15
                                                     andFontType:@""
                                                 andFontColorHEX:@"000000"
                                                 andLeftCapWidth:0
                                                andLeftCapHeight:0];
    [self addSubview:self.addCityButton];
    
    [self.addCityButton autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:10];
    [self.addCityButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10.0];
    [self.addCityButton autoSetDimensionsToSize:CGSizeMake(24, 24)];
}

- (void)addcityLabel {
    
    _cityLabel = [UtilityMethods createLabelWitText:@"City"
                                               font:@""
                                           fontSize:20
                                       fontColorHex:@"000000"
                                      textAlignment:NSTextAlignmentCenter];
    [self addSubview:self.cityLabel];
    [self.cityLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:10];
    [self.cityLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.menuButton withOffset:0];
    [self.cityLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.addCityButton withOffset:0];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _cityList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 35;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    NSString *cellIdentifier = @"Cell Identifier";
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [_cityList objectAtIndex:indexPath.row];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.customMenuViewDelegate && [self.customMenuViewDelegate respondsToSelector:@selector(changeCity:)]) {
        
        [self.customMenuViewDelegate changeCity:[_cityList objectAtIndex:indexPath.row]];
    }
}

- (void)menuButtonAction {
    
    if (self.customMenuViewDelegate && [self.customMenuViewDelegate respondsToSelector:@selector(menuDelegateAction)]) {
        
        [self.customMenuViewDelegate menuDelegateAction];
    }
}

- (void)addCityButtonTapped {
    
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Add City"
                                                          message:@"Enter a city name"
                                                         delegate:self
                                                cancelButtonTitle:@"Cancel"
                                                otherButtonTitles:@"OK", nil];
    
    myAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [myAlertView show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSLog(@"%@", [alertView textFieldAtIndex:0].text);
    
    if ([UtilityMethods isStringPresent:[alertView textFieldAtIndex:0].text]) {
        
        if (self.customMenuViewDelegate && [self.customMenuViewDelegate respondsToSelector:@selector(changeCity:)]) {
            
            [self.customMenuViewDelegate changeCity:[alertView textFieldAtIndex:0].text];
            APP_Delegate.isMenuHidden = YES;
            [self menuButtonAction];
        }
    }
}

@end
