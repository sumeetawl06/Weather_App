//
//  CustomAlertView.h
//  Weather_App
//
//  Created by Sumeet on 21/08/16.
//  Copyright © 2016 reliancegames. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomAlertViewDelegate <NSObject>

- (void)okButtonTappedWithTextFieldValue:(NSString *)text;

@end

@interface CustomAlertView : UIView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *okButton;
@property (nonatomic, strong) UIButton *cancelButton;

@end
