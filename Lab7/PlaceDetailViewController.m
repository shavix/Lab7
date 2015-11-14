//
//  PlaceDetailViewController.m
//  Lab7
//
//  Created by David Richardson on 11/11/15.
//  Copyright © 2015 David Richardson. All rights reserved.
//

#import "PlaceDetailViewController.h"

@interface PlaceDetailViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property(nonatomic, assign) id< UIWebViewDelegate > delegate;


@end

@implementation PlaceDetailViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.navigationItem.title = [self.place objectForKey:@"Name"];
    
    [self urlRequest];

}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}

- (void)urlRequest {
    
    NSString *website = [self.place objectForKey:@"Website"];
    
    NSURL *url = [NSURL URLWithString:website];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:urlRequest];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
