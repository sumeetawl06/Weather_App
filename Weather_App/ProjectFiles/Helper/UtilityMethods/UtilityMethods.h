//
//  UtilityMethods.h
//  Weather_App
//
//  Created by reliancegames on 8/1/16.
//  Copyright © 2016 reliancegames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UtilityMethods : NSObject

+ (UIColor *)colorFromHexString:(NSString *)hex;
+ (BOOL)isStringPresent:(NSString *)string;
+ (UILabel *)createLabelWitText:(NSString *)titleText
                           font:(NSString *)fontName
                       fontSize:(CGFloat)fontSize
                   fontColorHex:(NSString *)fontColor
                  textAlignment:(NSTextAlignment)textAlignment;

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
                        andLeftCapHeight:(float)leftCapHeight;


@end
