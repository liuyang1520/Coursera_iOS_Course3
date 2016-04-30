//
//  ToDoHandleMOC.h
//  ToDoList
//
//  Created by Yang Liu on 2016-04-12.
//  Copyright © 2016 Macula Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ToDoHandleMOC <NSObject>

- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC;

@end
