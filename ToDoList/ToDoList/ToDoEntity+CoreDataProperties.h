//
//  ToDoEntity+CoreDataProperties.h
//  ToDoList
//
//  Created by Yang Liu on 2016-04-12.
//  Copyright © 2016 Macula Soft. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ToDoEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToDoEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *toDoDetail;
@property (nullable, nonatomic, retain) NSString *toDoTitle;
@property (nullable, nonatomic, retain) NSDate *toDoDate;

@end

NS_ASSUME_NONNULL_END
