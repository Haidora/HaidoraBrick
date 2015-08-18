//
//  HDRouter.h
//  Pods
//
//  Created by mrdaios on 15/8/17.
//
//

#import <Foundation/Foundation.h>
@protocol HDViewProtocol;
@protocol HDViewModelProtocol;

@interface HDRouter : NSObject

/**
 *  ViewModel <=> ViewController
 */
@property (nonatomic, strong, readonly) NSMutableDictionary *viewModelViewMappings;

+ (instancetype)sharedInstance;
- (id<HDViewProtocol>)viewControllerForViewModel:(id<HDViewModelProtocol>)viewModel;

@end
