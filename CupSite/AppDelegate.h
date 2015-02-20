//
//  AppDelegate.h
//  CupSite
//
//  Created by Benjas on 17/02/15.
//  Copyright (c) 2015 Benjas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

NSMutableArray *nombreArray;
NSMutableArray *imgArray;
NSMutableArray *descArray;
NSMutableArray *datosArray;
NSMutableArray *latArray;
NSMutableArray *lonArray;





@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;




@end

