//
//  RootViewController.m
//  CoreDataTest
//
//  Created by Manu on 23/06/16.
//  Copyright © 2016 ManuGowda. All rights reserved.
//

#import "RootViewController.h"
#import "AppDelegate.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)save{
    
    AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
    
    NSEntityDescription *entity = (NSEntityDescription*)[NSEntityDescription insertNewObjectForEntityForName:@"Team" inManagedObjectContext:appdelegate.managedObjectContext];
    
    [entity setValue:self.textField.text forKey:@"name"];
    
    NSError *error;
    
    BOOL isSaved = [appdelegate.managedObjectContext save:&error];
    NSLog(@"saved successfully : %d", isSaved);
    self.textField.text = @"";
    
}
-(IBAction)fetch{
    
    
    AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate]
    ;
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Team" inManagedObjectContext:appdelegate.managedObjectContext];
    NSFetchRequest *req = [[NSFetchRequest alloc] init];
    [req setEntity:entity];
    
    NSMutableArray *array = [[appdelegate.managedObjectContext executeFetchRequest:req error:nil] copy];
    
    for (NSManagedObject *obj in array) {
        self.label.text = [obj valueForKey:@"name"];
        
    }
}
@end
