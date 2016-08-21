//
//  CustomAlertView.m
//  Weather_App
//
//  Created by Sumeet on 21/08/16.
//  Copyright © 2016 reliancegames. All rights reserved.
//

#import "CustomAlertView.h"

@implementation CustomAlertView

- (id)initForAutoLayout {
    
    self = [super initForAutoLayout];
    if (self) {
        
        [self createUI];
    }
    return self;
}

- (void)createUI {
    
    [self addCancelButton];
}

- (void)addCancelButton {
    
    _cancelButton = [UtilityMethods createButtonWithBGImageName:@"cancel"
                                        andHighlightedImageName:@""
                                                 andEventTarget:self
                                                      andAction:@selector(cancelButtonTapped)
                                                         andTag:1
                                                 andButtonTitle:@""
                                                    andFontSize:12
                                                    andFontType:@""
                                                andFontColorHEX:@"000000"
                                                andLeftCapWidth:0
                                               andLeftCapHeight:0];
    [self addSubview:self.cancelButton];
    
    [self.cancelButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:-5.0];
    [self.cancelButton autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:5.0];
    [self.cancelButton autoSetDimensionsToSize:CGSizeMake(16, 16)];
}

- (void)addTitleLabel {
    
    _titleLabel = [UtilityMethods createLabelWitText:@"Add City"
                                                font:@""
                                            fontSize:15
                                        fontColorHex:@"000000"
                                       textAlignment:NSTextAlignmentCenter];
    [self addSubview:self.titleLabel];
    
    [self.titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:5.0];
    [self.titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:21.0];
    [self.titleLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.cancelButton withOffset:0];
    
}

- (void)addTextField {
    
    _textField = [[UITextField alloc]initForAutoLayout];
    [_textField setPlaceholder:@"Enter a city name"];
    [self addSubview:self.textField];
    
    [self.textField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:10.0];
//    self.textField autoPinEdge:<#(ALEdge)#> toEdge:<#(ALEdge)#> ofView:<#(nonnull UIView *)#> withOffset:<#(CGFloat)#>
}

- (void)addOkButton {
    
    
}

#pragma mark - Event Handlings

- (void)cancelButtonTapped {
    
    
}

@end
