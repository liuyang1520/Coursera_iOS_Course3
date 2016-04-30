//
//  ToDoUINavigationController.m
//  ToDoList
//
//  Created by Yang Liu on 2016-04-12.
//  Copyright © 2016 Macula Soft. All rights reserved.
//

#import "ToDoUINavigationController.h"

@interface ToDoUINavigationController ()

@property(strong, nonatomic) NSManagedObjectContext *moc;

@end

@implementation ToDoUINavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC {
    self.moc = incomingMOC;
    id<ToDoHandleMOC> child = (id<ToDoHandleMOC>)self.viewControllers[0];
    [child receiveMOC:self.moc];
}

@end
