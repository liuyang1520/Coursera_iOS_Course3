//
//  ToDoHandleEntity.h
//  ToDoList
//
//  Created by Yang Liu on 2016-04-12.
//  Copyright © 2016 Macula Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ToDoHandleEntity <NSObject>

- (void)receiveEntity:(ToDoEntity *)incomingEntity;

@end
