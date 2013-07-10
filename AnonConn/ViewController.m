//
//  ViewController.m
//  AnonConn
//
//  Created by Dawson Blackhouse on 6/24/13.
//  Copyright (c) 2013 Dawson Blackhouse. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


UIView *RootView,
        *rightView,
        *sideMenuView;
const int SIDE_BUTTON_WIDTH = 100;
const int SIDE_BUTTON_HEIGHT = 92;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self layoutRootView];
    [self layoutSideMenu];
    [self layoutHomeView];
}

- (void) layoutRootView
{
    //create home view
    RootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:RootView];
    
    sideMenuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * .20, self.view.frame.size.height)];
    [sideMenuView setBackgroundColor:UIColorFromRGB(0x2c3e50)];
    [RootView addSubview:sideMenuView];
    
    rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [rightView setBackgroundColor:[UIColor alizarinColor]];
    
    UIImage *menuButtonImage = [UIImage imageNamed:@"glyphicons_157_show_lines-white.png"];
    
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    menuButton.frame = CGRectMake(5, 5, 25, 25);
    [menuButton setBackgroundImage:menuButtonImage forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(toggleSideMenu) forControlEvents:UIControlEventTouchUpInside];
    menuButton.tag = 1;
    [rightView addSubview:menuButton];
    
    [RootView addSubview:rightView];
}

/****************
 SIDE MENU
*****************/

- (void) layoutSideMenu
{
    FUIButton *recentButton = [[FUIButton alloc] initWithFrame:CGRectMake(0, 0, SIDE_BUTTON_WIDTH, SIDE_BUTTON_HEIGHT)];
    recentButton.buttonColor = [UIColor midnightBlueColor];
    recentButton.shadowColor = [UIColor wetAsphaltColor];
    recentButton.shadowHeight = 1.0f;
    recentButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [recentButton setTitle:@"RECENTS" forState:UIControlStateNormal];
    [recentButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [recentButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [recentButton addTarget:self action:@selector(sideMenuButtonNormal:) forControlEvents:UIControlEventTouchDragOutside];
    [recentButton addTarget:self action:@selector(sideMenuButtonHighlight:) forControlEvents:UIControlEventTouchDown];
    [recentButton addTarget:self action:@selector(showRecentsView) forControlEvents:UIControlEventTouchUpInside];
    [recentButton addTarget:self action:@selector(sideMenuButtonNormal:) forControlEvents:UIControlEventTouchUpInside];
    [sideMenuView addSubview:recentButton];
    
    FUIButton *topRatedButton = [[FUIButton alloc] initWithFrame:CGRectMake(0, SIDE_BUTTON_HEIGHT, SIDE_BUTTON_WIDTH, SIDE_BUTTON_HEIGHT)];
    topRatedButton.buttonColor = [UIColor midnightBlueColor];
    topRatedButton.shadowColor = [UIColor wetAsphaltColor];
    topRatedButton.shadowHeight = 1.0f;
    topRatedButton.titleLabel.font = [UIFont boldFlatFontOfSize:14];
    [topRatedButton setTitle:@"TOP RATED" forState:UIControlStateNormal];
    [topRatedButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [topRatedButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [topRatedButton addTarget:self action:@selector(sideMenuButtonNormal:) forControlEvents:UIControlEventTouchDragOutside];
    [topRatedButton addTarget:self action:@selector(sideMenuButtonHighlight:) forControlEvents:UIControlEventTouchDown];
    [topRatedButton addTarget:self action:@selector(showTopRatedView) forControlEvents:UIControlEventTouchUpInside];
    [topRatedButton addTarget:self action:@selector(sideMenuButtonNormal:) forControlEvents:UIControlEventTouchUpInside];
    [sideMenuView addSubview:topRatedButton];
    
    FUIButton *searchButton = [[FUIButton alloc] initWithFrame:CGRectMake(0, SIDE_BUTTON_HEIGHT * 2, SIDE_BUTTON_WIDTH, SIDE_BUTTON_HEIGHT)];
    searchButton.buttonColor = [UIColor midnightBlueColor];
    searchButton.shadowColor = [UIColor wetAsphaltColor];
    searchButton.shadowHeight = 1.0f;
    searchButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [searchButton setTitle:@"SEARCH" forState:UIControlStateNormal];
    [searchButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [searchButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [searchButton addTarget:self action:@selector(sideMenuButtonNormal:) forControlEvents:UIControlEventTouchDragOutside];
    [searchButton addTarget:self action:@selector(sideMenuButtonHighlight:) forControlEvents:UIControlEventTouchDown];
    [searchButton addTarget:self action:@selector(showSearchView) forControlEvents:UIControlEventTouchUpInside];
    [searchButton addTarget:self action:@selector(sideMenuButtonNormal:) forControlEvents:UIControlEventTouchUpInside];
    [sideMenuView addSubview:searchButton];
    
    FUIButton *browseButton = [[FUIButton alloc] initWithFrame:CGRectMake(0, SIDE_BUTTON_HEIGHT * 3, SIDE_BUTTON_WIDTH, SIDE_BUTTON_HEIGHT)];
    browseButton.buttonColor = [UIColor midnightBlueColor];
    browseButton.shadowColor = [UIColor wetAsphaltColor];
    browseButton.shadowHeight = 1.0f;
    browseButton.titleLabel.font = [UIFont boldFlatFontOfSize:14];
    [browseButton setTitle:@"BROWSE" forState:UIControlStateNormal];
    [browseButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [browseButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [browseButton addTarget:self action:@selector(sideMenuButtonNormal:) forControlEvents:UIControlEventTouchDragOutside];
    [browseButton addTarget:self action:@selector(sideMenuButtonHighlight:) forControlEvents:UIControlEventTouchDown];
    [browseButton addTarget:self action:@selector(showBrowseView) forControlEvents:UIControlEventTouchUpInside];
    [browseButton addTarget:self action:@selector(sideMenuButtonNormal:) forControlEvents:UIControlEventTouchUpInside];
    [sideMenuView addSubview:browseButton];
    
    FUIButton *favsButton = [[FUIButton alloc] initWithFrame:CGRectMake(0, SIDE_BUTTON_HEIGHT * 4, SIDE_BUTTON_WIDTH, SIDE_BUTTON_HEIGHT)];
    favsButton.buttonColor = [UIColor midnightBlueColor];
    favsButton.shadowColor = [UIColor wetAsphaltColor];
    favsButton.shadowHeight = 1.0f;
    favsButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [favsButton setTitle:@"FAVS" forState:UIControlStateNormal];
    [favsButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [favsButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [favsButton addTarget:self action:@selector(sideMenuButtonNormal:) forControlEvents:UIControlEventTouchDragOutside];
    [favsButton addTarget:self action:@selector(sideMenuButtonHighlight:) forControlEvents:UIControlEventTouchDown];
    [favsButton addTarget:self action:@selector(showFavsView) forControlEvents:UIControlEventTouchUpInside];
    [favsButton addTarget:self action:@selector(sideMenuButtonNormal:) forControlEvents:UIControlEventTouchUpInside];
    [sideMenuView addSubview:favsButton];
}

- (void) showRecentsView
{
    [self resetRootView];
    [self layoutRecentsView];
}

- (void) showSearchView
{
    [self resetRootView];
    [self layoutSearchView];
}

- (void) showFavsView
{
    [self resetRootView];
    [self layoutFavsView];
}

- (void) showTopRatedView
{
    [self resetRootView];
    [self layoutTopRatedView];
}

- (void) showBrowseView
{
    [self resetRootView];
    [self layoutBrowseView];
}

- (void) toggleSideMenu
{
    if (rightView.frame.origin.x == 0) {
        rightView.frame = CGRectMake(sideMenuView.frame.size.width, 0, rightView.frame.size.width, rightView.frame.size.height);
    } else {
        rightView.frame = CGRectMake(0, 0, rightView.frame.size.width, rightView.frame.size.height);
    }
}

- (void) sideMenuButtonHighlight:(id)sender
{
    [sender setButtonColor:[UIColor alizarinColor]];
}

- (void) sideMenuButtonNormal:(id)sender
{
    [sender setButtonColor:[UIColor midnightBlueColor]];
}

/***********************************************************
 LAYOUTS: SEARCH, FAVS, LATEST EVENTS, TOP RATED, BY LOCALE
************************************************************/

- (void)layoutHomeView
{
    FUIButton *myButton = [[FUIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    myButton.buttonColor = [UIColor wetAsphaltColor];
    myButton.shadowColor = [UIColor wisteriaColor];
    myButton.shadowHeight = 3.0f;
    myButton.cornerRadius = 6.0f;
    myButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [myButton setTitle:@"NICE" forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [myButton addTarget:self action:@selector(toggleSideMenu) forControlEvents:UIControlEventTouchUpInside];
    [rightView addSubview:myButton];
}

- (void) layoutRecentsView
{
    UILabel *recentsTitle = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 5, 10, 10)];
    recentsTitle.text = @"RECENTS";
    recentsTitle.font = [UIFont boldFlatFontOfSize:84];
    [recentsTitle setTextColor:[UIColor whiteColor]];
    [recentsTitle setTransform:CGAffineTransformMakeRotation(M_PI / 2)];
    [recentsTitle setBackgroundColor:[UIColor clearColor]];
    [recentsTitle setAlpha:0.7f];
    [recentsTitle sizeToFit];
    recentsTitle.frame = CGRectMake(self.view.frame.size.width - recentsTitle.frame.size.width, 5, recentsTitle.frame.size.width, recentsTitle.frame.size.height);
    [rightView addSubview:recentsTitle];
}

- (void) layoutFavsView
{
    UILabel *favTitle = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 5, 10, 10)];
    favTitle.text = @"FAVS";
    favTitle.font = [UIFont boldFlatFontOfSize:84];
    [favTitle setTextColor:[UIColor whiteColor]];
    [favTitle setTransform:CGAffineTransformMakeRotation(M_PI / 2)];
    [favTitle setBackgroundColor:[UIColor clearColor]];
    [favTitle setAlpha:0.7f];
    [favTitle sizeToFit];
    favTitle.frame = CGRectMake(self.view.frame.size.width - favTitle.frame.size.width, 5, favTitle.frame.size.width, favTitle.frame.size.height);
    [rightView addSubview:favTitle];
}

- (void) layoutSearchView
{
    UILabel *searchTitle = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 5, 10, 10)];
    searchTitle.text = @"SEARCH";
    searchTitle.font = [UIFont boldFlatFontOfSize:84];
    [searchTitle setTextColor:[UIColor whiteColor]];
    [searchTitle setTransform:CGAffineTransformMakeRotation(M_PI / 2)];
    [searchTitle setBackgroundColor:[UIColor clearColor]];
    [searchTitle setAlpha:0.7f];
    [searchTitle sizeToFit];
    searchTitle.frame = CGRectMake(self.view.frame.size.width - searchTitle.frame.size.width, 5, searchTitle.frame.size.width, searchTitle.frame.size.height);
    [rightView addSubview:searchTitle];
}

- (void) layoutBrowseView
{
    UILabel *browseTitle = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 5, 10, 10)];
    browseTitle.text = @"BROWSE";
    browseTitle.font = [UIFont boldFlatFontOfSize:84];
    [browseTitle setTextColor:[UIColor whiteColor]];
    [browseTitle setTransform:CGAffineTransformMakeRotation(M_PI / 2)];
    [browseTitle setBackgroundColor:[UIColor clearColor]];
    [browseTitle setAlpha:0.7f];
    [browseTitle sizeToFit];
    browseTitle.frame = CGRectMake(self.view.frame.size.width - browseTitle.frame.size.width, 5, browseTitle.frame.size.width, browseTitle.frame.size.height);
    [rightView addSubview:browseTitle];
}

- (void) layoutTopRatedView
{
    UILabel *topRatedTitle = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 5, 10, 10)];
    topRatedTitle.text = @"TOP RATED";
    topRatedTitle.font = [UIFont boldFlatFontOfSize:84];
    [topRatedTitle setTextColor:[UIColor whiteColor]];
    [topRatedTitle setTransform:CGAffineTransformMakeRotation(M_PI / 2)];
    [topRatedTitle setBackgroundColor:[UIColor clearColor]];
    [topRatedTitle setAlpha:0.7f];
    [topRatedTitle sizeToFit];
    topRatedTitle.frame = CGRectMake(self.view.frame.size.width - topRatedTitle.frame.size.width, 5, topRatedTitle.frame.size.width, topRatedTitle.frame.size.height);
    [rightView addSubview:topRatedTitle];
}

- (void) resetRootView
{
    [self clearMainView];
    [self toggleSideMenu];
}

- (void) clearMainView
{
    for (UIView *view in rightView.subviews) {
        if (view.tag != 1) {
            [view removeFromSuperview];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
