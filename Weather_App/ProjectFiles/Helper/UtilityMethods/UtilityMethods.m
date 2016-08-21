//
//  UtilityMethods.m
//  Weather_App
//
//  Created by reliancegames on 8/1/16.
//  Copyright © 2016 reliancegames. All rights reserved.
//

#import "UtilityMethods.h"

@implementation UtilityMethods

+ (UILabel *)createLabelWitText:(NSString *)titleText
                           font:(NSString *)fontName
                       fontSize:(CGFloat)fontSize
                   fontColorHex:(NSString *)fontColor
                  textAlignment:(NSTextAlignment)textAlignment {
    
    UILabel *label = [[UILabel alloc]init];
    if ([UtilityMethods isStringPresent:fontName]) {
        
        [label setFont:[UIFont fontWithName:fontName size:fontSize]];
    }else {
        
        [label setFont:[UIFont systemFontOfSize:fontSize]];
    }
    [label setTextAlignment:textAlignment];
    [label setTextColor:[self colorFromHexString:fontColor]];
    [label setText:titleText];
    
    return label;
}

#pragma mark - String Utils

+ (BOOL)isStringPresent:(NSString *)string {
    
    if (string == (id)[NSNull null] || string.length == 0 ) {
        
        return NO;
    }else {
        
        return YES;
    }
    
    return YES;
}

#pragma mark - Color

+ (UIColor *)colorFromHexString:(NSString *)hex {
    
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

+ (UIButton*)createButtonWithBGImageName:(NSString*)bgImageName
                 andHighlightedImageName:(NSString *)hgImageName
                          andEventTarget:(id)targetedObject
                               andAction:(SEL)action
                                  andTag:(int)tagNo
                          andButtonTitle:(NSString*)title
                             andFontSize:(int)size
                             andFontType:(NSString*)fontType
                         andFontColorHEX:(NSString*)fontColor
                         andLeftCapWidth:(float)leftCapWidth
                        andLeftCapHeight:(float)leftCapHeight {
    
    
    UIButton *button = [[UIButton alloc] initForAutoLayout];
    
    if ([UtilityMethods isStringPresent:bgImageName]) {
        
        UIImage *stretchableImage = [[UIImage imageNamed:bgImageName] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:leftCapHeight];
        [button setBackgroundImage:stretchableImage forState:UIControlStateNormal];
        
        
    }
    
    if ([UtilityMethods isStringPresent:hgImageName]) {
        
        UIImage *stretchableImage = [[UIImage imageNamed:hgImageName] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:leftCapHeight];
        
        [button setBackgroundImage:stretchableImage forState:UIControlStateHighlighted];
    }
    
    
    [button addTarget:targetedObject
               action:action
     forControlEvents:UIControlEventTouchUpInside];
    
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button.titleLabel setFont:[UIFont fontWithName:fontType size:size]];
    
    [button setTitleColor:[UtilityMethods colorFromHexString:fontColor] forState:UIControlStateNormal];
    
    [button setTag:tagNo];
    
    return button;
    
}

@end
