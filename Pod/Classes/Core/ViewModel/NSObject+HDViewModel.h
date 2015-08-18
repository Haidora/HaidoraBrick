//
//  NSObject+HDViewModel.h
//  Pods
//
//  Created by mrdaios on 15/8/17.
//
//

#import <Foundation/Foundation.h>
#import "HDViewModelProtocol.h"

/**
 *  在ViewModel中引入
 */
@interface NSObject (HDViewModel) <HDViewModelProtocol>

/**
 *  用于关联ViewModel和服务之间的关系.如果为空,自动创建.
 */
@property (nonatomic, strong, readonly) HDViewModelServices *services;

/**
 *  构造ViewModel
 *
 *  @param aServices 可为空
 *  @param aParams   可为空
 *
 *  @return
 */
- (instancetype)initWithServices:(HDViewModelServices *)services
                          params:(id)params __attribute__((objc_requires_super));

@end
