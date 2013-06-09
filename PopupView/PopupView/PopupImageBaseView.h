//****************************************************************************//
//  [ PopupImageView.h ]                                                      //
//****************************************************************************//

#import <UIKit/UIKit.h>
#import "PopupProtocol.h"

//============================================================================//
//  <PopupImageBaseView>                                                      //
//============================================================================//
@interface PopupImageBaseView : UIImageView<PopupView>

- (id)initWithImage:(UIImage *)image;
- (void)show;
- (void)dismiss;

@end
