//
//  ColorsViewController.h
//  RSSchool_T9
//
//  Created by Mikita Shalima on 28.07.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SelectRow
// объявляем метод делегата
- (NSIndexPath *)getDefaultRowIndex;
- (void)setDefaultRowIndex:(NSIndexPath *)row;
- (void)setDetailedText:(NSString *)detailedText andColor:(UIColor *)color;
@end

@interface ColorsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) id<SelectRow> delegate;

@end

NS_ASSUME_NONNULL_END
