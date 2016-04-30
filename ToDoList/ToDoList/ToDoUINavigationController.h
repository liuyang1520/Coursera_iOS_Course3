//
//  ToDoUINavigationController.h
//  ToDoList
//
//  Created by Yang Liu on 2016-04-12.
//  Copyright © 2016 Macula Soft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoHandleMOC.h"

@interface ToDoUINavigationController : UINavigationController <ToDoHandleMOC>

- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC;

@end
