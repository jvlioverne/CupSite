//
//  HomeTable.h
//  CupSite
//
//  Created by Benjas on 17/02/15.
//  Copyright (c) 2015 Benjas. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface HomeTable : UIViewController <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *TableView;

- (IBAction)btnReload:(id)sender;

@end
