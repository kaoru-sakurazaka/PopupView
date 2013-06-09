//****************************************************************************//
//  [ PopupController.h ]                                                     //
//****************************************************************************//

#import <QuartzCore/QuartzCore.h>
#import "PopupProtocol.h"

//============================================================================//
//  <PopupController>                                                         //
//============================================================================//
@interface PopupController : NSObject<PopupBackgroundViewDelegate>

@property(nonatomic,readonly)   NSUInteger count;

+(PopupController*)sharedPopupController;

-(BOOL)pushView:(UIView<PopupView>*)view;
-(BOOL)popView:(UIView<PopupView>*)view;

-(BOOL)tryUnloadBackgroundView;

@end
