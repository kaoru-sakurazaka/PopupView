//****************************************************************************//
//  [ TestPopupView.m ]                                                       //
//****************************************************************************//

#import "TestPopupView.h"
#import <QuartzCore/QuartzCore.h>

//============================================================================//
//  <TestPopupView>                                                           //
//============================================================================//
@implementation TestPopupView

// -----------------------------------------------------------------------
//	[initWithFrame]
//	  in  @ (CGRect)frame
//	  out @ id
- (id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowRadius = 5.0;
        self.layer.shadowOpacity = 1.0;
        self.layer.shadowOffset = CGSizeMake( 0, 2 );
        self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    }
    return self;
}

#pragma mark - PopupView
// -----------------------------------------------------------------------
//	[doShow]
//	  in  @ none
//	  out @ none
-(void)doShow{
    self.hidden = NO;
    self.alpha = 0.0;
    
    CGAffineTransform translation = CGAffineTransformMakeTranslation( 0, 20 );
    CGAffineTransform rotation = PopupRotationTransformWithOrientation([UIApplication sharedApplication].statusBarOrientation);
    
    self.transform = CGAffineTransformConcat( translation, rotation );
    
    id animations = ^{
        self.alpha = 1.0;
        CGAffineTransform translation = CGAffineTransformMakeTranslation( 0, 0 );
        self.transform = CGAffineTransformConcat( translation, rotation );
    };
    
    [UIView animateWithDuration:0.2 animations:animations];
}

// -----------------------------------------------------------------------
//	[doRemoveFromSuperView]
//	  in  @ (BOOL)animated
//	  out @ none
-(void)doRemoveFromSuperView:(BOOL)animated{
    if( animated ){
        id animations = ^{
            self.alpha = 0.0;
            CGAffineTransform translation = CGAffineTransformMakeTranslation( 0, 20 );
            CGAffineTransform rotation = PopupRotationTransformWithOrientation([UIApplication sharedApplication].statusBarOrientation);
            self.transform = CGAffineTransformConcat( translation, rotation );
        };
        
        id completion = ^(BOOL finished){
            if( finished )    [self removeFromSuperview];
        };
        
        [UIView animateWithDuration:0.2 animations:animations completion:completion];
    }else{
        [self removeFromSuperview];
    }
}

// -----------------------------------------------------------------------
//	[willChangeOrientation]
//	  in  @ (UIInterfaceOrientation)newOrientation
//        @ animated:(BOOL)animated
//	  out @ none
-(void)willChangeOrientation:(UIInterfaceOrientation)newOrientation animated:(BOOL)animated{
    
    if( animated ){
        id animations = ^{
            self.transform = PopupRotationTransformWithOrientation(newOrientation);
        };
        
        [UIView animateWithDuration:[UIApplication sharedApplication].statusBarOrientationAnimationDuration animations:animations];
    }else{
        self.transform = PopupRotationTransformWithOrientation(newOrientation);
    }
}

// -----------------------------------------------------------------------
//	[didChangeOrientation]
//	  in  @ (UIInterfaceOrientation)orientation
//	  out @ none
-(void)didChangeOrientation:(UIInterfaceOrientation)orientation{
    
}

@end
