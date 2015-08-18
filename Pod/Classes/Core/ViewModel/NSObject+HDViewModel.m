//
//  NSObject+HDViewModel.m
//  Pods
//
//  Created by mrdaios on 15/8/17.
//
//

#import "NSObject+HDViewModel.h"
#import <objc/runtime.h>
#import "HDViewModelServices.h"

static char *kHD_NSObject_services = "kHD_NSObject_services";
static char *kHD_NSObject_params = "kHD_NSObject_params";

@interface NSObject (HDViewModelPrivate)

@property (nonatomic, strong, readwrite) HDViewModelServices *services;
@property (nonatomic, strong, readwrite) id params;

@end
@implementation NSObject (HDViewModel)

- (instancetype)initWithServices:(HDViewModelServices *)services params:(id)params
{
    self = [self init];
    if (self)
    {
        self.services = services;
        self.params = params;
    }
    return self;
}
#pragma mark
#pragma mark Getter/Setter

- (void)setServices:(HDViewModelServices *)services
{
    objc_setAssociatedObject(self, kHD_NSObject_services, services,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HDViewModelServices *)services
{
    id result = objc_getAssociatedObject(self, kHD_NSObject_services);
    if (!result)
    {
        result = [[HDViewModelServices alloc] init];
        [self setServices:result];
    }
    return result;
}

- (void)setParams:(id)params
{
    objc_setAssociatedObject(self, kHD_NSObject_params, params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)params
{
    return objc_getAssociatedObject(self, kHD_NSObject_params);
}

@end
