//****************************************************************************//
//  [ TestViewController.m ]                                                  //
//****************************************************************************//

#import "TestViewController.h"
#import "TestPopupView.h"
#import "TestPopupImageView.h"
#import "PopupController.h"

//============================================================================//
//  <TestViewController>                                                      //
//============================================================================//
@implementation TestViewController

// -----------------------------------------------------------------------
//	[viewDidLoad]
//	  in  @ none
//	  out @ none
- (void)viewDidLoad{
    [super viewDidLoad];
    
    UIImage* image;
    if( [[UIDevice currentDevice].model isEqualToString:@"iPad"] ){
        image = [UIImage imageNamed:@"cookery"];
    }else{
        image = [UIImage imageNamed:@"sweet_love"];
    }

    UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    CGRect frame = imageView.frame;
    frame.origin.x = ( self.view.frame.size.width - frame.size.width ) * 0.5;
    frame.origin.y = ( self.view.frame.size.height - frame.size.height ) * 0.5;
    imageView.frame = frame;
    
    [self.view addSubview:imageView];
    
    UIButton* buttonPopup = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonPopup.frame = CGRectMake( 12, 16, 128, 44 );
    [buttonPopup setTitle:@"PopupView" forState:UIControlStateNormal];
    [buttonPopup setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.7]];
    [buttonPopup addTarget:self action:@selector(actButtonPopup:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:buttonPopup];
    
    
    UIButton* buttonPopupImage = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonPopupImage.frame = CGRectMake( 12, 68, 176, 44 );
    [buttonPopupImage setTitle:@"PopupImageView" forState:UIControlStateNormal];
    [buttonPopupImage setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.7]];
    [buttonPopupImage addTarget:self action:@selector(actButtonPopupImage:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonPopupImage];
}

// -----------------------------------------------------------------------
//	[actButtonPopup]
//	  in  @ (UIButton*)sender
//	  out @ none
-(void)actButtonPopup:(UIButton*)sender{
    
    TestPopupView* popupView = [[[TestPopupView alloc] initWithSize:CGSizeMake(280, 248)] autorelease];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake( 12, 12, 280-24, 44 );
    [button setTitle:@"Next Popup" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(actButtonPopup:) forControlEvents:UIControlEventTouchUpInside];
    [popupView addSubview:button];

    UIButton* buttonAll = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonAll.frame = CGRectMake( 12, 60, 280-24, 44 );
    [buttonAll setTitle:@"All Remove" forState:UIControlStateNormal];
    [buttonAll addTarget:self action:@selector(actButtonAll:) forControlEvents:UIControlEventTouchUpInside];
    [popupView addSubview:buttonAll];

    UILabel* label = [[[UILabel alloc] initWithFrame:CGRectMake( 16, 112, 280-32, 120 )] autorelease];
    label.opaque = NO;
    label.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    [label setText:[NSString stringWithFormat:@"Popup:%d\nTouch Background\nFor\nDismiss This Popup.",[PopupController sharedPopupController].count+1]];
    [popupView addSubview:label];
    
    [popupView show];
}

// -----------------------------------------------------------------------
//	[actButtonAll]
//	  in  @ (UIButton*)sender
//	  out @ none
-(void)actButtonAll:(UIButton*)sender{
    [[PopupController sharedPopupController] popAllViews];
}

// -----------------------------------------------------------------------
//	[actButtonPopupImage]
//	  in  @ (UIButton*)sender
//	  out @ none
-(void)actButtonPopupImage:(UIButton*)sender{
    
    TestPopupImageView* popupView = [[[TestPopupImageView alloc] initWithImage:[UIImage imageNamed:@"background"]] autorelease];
    popupView.touchedBackgroundDisappear = NO;

    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake( (256-80)*0.5, 256-44-16, 80, 44 );
    [button setTitle:@"Close" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(actButtonClose:) forControlEvents:UIControlEventTouchUpInside];
    [popupView addSubview:button];
    
    UILabel* label = [[[UILabel alloc] initWithFrame:CGRectMake( 16, 16, 256-32, 256 - 24 - 44 )] autorelease];
    label.opaque = NO;
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [label setText:@"Touch \"Close Button\" for Dismiss This Popup."];
    [popupView addSubview:label];
    
    [popupView show];
}

// -----------------------------------------------------------------------
//	[actButtonClose]
//	  in  @ (UIButton*)sender
//	  out @ none
-(void)actButtonClose:(UIButton*)sender{
    TestPopupImageView* popupView = (TestPopupImageView*)sender.superview;
    [popupView dismiss];
}

@end
