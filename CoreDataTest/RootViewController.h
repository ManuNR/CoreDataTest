//
//  RootViewController.h
//  CoreDataTest
//
//  Created by Manu on 23/06/16.
//  Copyright © 2016 ManuGowda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UILabel *label;

-(IBAction)save;
-(IBAction)fetch;
@end
