/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 Copyright (c) 2012, Janrain, Inc.

 All rights reserved.

 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation and/or
   other materials provided with the distribution.
 * Neither the name of the Janrain, Inc. nor the names of its
   contributors may be used to endorse or promote products derived from this
   software without specific prior written permission.


 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(...)
#endif

#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)


#import "JRCaptureObject+Internal.h"
#import "JROinoL1Object.h"

@interface JROinoL2Object (JROinoL2Object_InternalMethods)
+ (id)oinoL2ObjectObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath fromDecoder:(BOOL)fromDecoder;
- (BOOL)isEqualToOinoL2Object:(JROinoL2Object *)otherOinoL2Object;
@end

@interface JROinoL1Object ()
@property BOOL canBeUpdatedOnCapture;
@end

@implementation JROinoL1Object
{
    NSString *_string1;
    NSString *_string2;
    JROinoL2Object *_oinoL2Object;
}
@synthesize canBeUpdatedOnCapture;

- (NSString *)string1
{
    return _string1;
}

- (void)setString1:(NSString *)newString1
{
    [self.dirtyPropertySet addObject:@"string1"];

    _string1 = [newString1 copy];
}

- (NSString *)string2
{
    return _string2;
}

- (void)setString2:(NSString *)newString2
{
    [self.dirtyPropertySet addObject:@"string2"];

    _string2 = [newString2 copy];
}

- (JROinoL2Object *)oinoL2Object
{
    return _oinoL2Object;
}

- (void)setOinoL2Object:(JROinoL2Object *)newOinoL2Object
{
    [self.dirtyPropertySet addObject:@"oinoL2Object"];

    _oinoL2Object = newOinoL2Object;

    [_oinoL2Object setAllPropertiesToDirty];
}

- (id)init
{
    if ((self = [super init]))
    {
        self.captureObjectPath = @"/oinoL1Object";
        self.canBeUpdatedOnCapture = YES;

        _oinoL2Object = [[JROinoL2Object alloc] init];

        [self.dirtyPropertySet setSet:[self updatablePropertySet]];
    }
    return self;
}

+ (id)oinoL1Object
{
    return [[JROinoL1Object alloc] init];
}

- (NSDictionary*)newDictionaryForEncoder:(BOOL)forEncoder
{
    NSMutableDictionary *dictionary =
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dictionary setObject:(self.string1 ? self.string1 : [NSNull null])
                   forKey:@"string1"];
    [dictionary setObject:(self.string2 ? self.string2 : [NSNull null])
                   forKey:@"string2"];
    [dictionary setObject:(self.oinoL2Object ? [self.oinoL2Object newDictionaryForEncoder:forEncoder] : [NSNull null])
                   forKey:@"oinoL2Object"];

    if (forEncoder)
    {
        [dictionary setObject:([self.dirtyPropertySet allObjects] ? [self.dirtyPropertySet allObjects] : [NSArray array])
                       forKey:@"dirtyPropertiesSet"];
        [dictionary setObject:(self.captureObjectPath ? self.captureObjectPath : [NSNull null])
                       forKey:@"captureObjectPath"];
        [dictionary setObject:[NSNumber numberWithBool:self.canBeUpdatedOnCapture]
                       forKey:@"canBeUpdatedOnCapture"];
    }

    return [NSDictionary dictionaryWithDictionary:dictionary];
}

+ (id)oinoL1ObjectObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath fromDecoder:(BOOL)fromDecoder
{
    if (!dictionary)
        return nil;

    JROinoL1Object *oinoL1Object = [JROinoL1Object oinoL1Object];

    NSSet *dirtyPropertySetCopy = nil;
    if (fromDecoder)
    {
        dirtyPropertySetCopy = [NSSet setWithArray:[dictionary objectForKey:@"dirtyPropertiesSet"]];
        oinoL1Object.captureObjectPath = ([dictionary objectForKey:@"captureObjectPath"] == [NSNull null] ?
                                                              nil : [dictionary objectForKey:@"captureObjectPath"]);
    }

    oinoL1Object.string1 =
        [dictionary objectForKey:@"string1"] != [NSNull null] ? 
        [dictionary objectForKey:@"string1"] : nil;

    oinoL1Object.string2 =
        [dictionary objectForKey:@"string2"] != [NSNull null] ? 
        [dictionary objectForKey:@"string2"] : nil;

    oinoL1Object.oinoL2Object =
        [dictionary objectForKey:@"oinoL2Object"] != [NSNull null] ? 
        [JROinoL2Object oinoL2ObjectObjectFromDictionary:[dictionary objectForKey:@"oinoL2Object"] withPath:oinoL1Object.captureObjectPath fromDecoder:fromDecoder] : nil;

    if (fromDecoder)
        [oinoL1Object.dirtyPropertySet setSet:dirtyPropertySetCopy];
    else
        [oinoL1Object.dirtyPropertySet removeAllObjects];

    return oinoL1Object;
}

+ (id)oinoL1ObjectObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    return [JROinoL1Object oinoL1ObjectObjectFromDictionary:dictionary withPath:capturePath fromDecoder:NO];
}

- (void)replaceFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    DLog(@"%@ %@", capturePath, [dictionary description]);

    NSSet *dirtyPropertySetCopy = [self.dirtyPropertySet copy];

    self.canBeUpdatedOnCapture = YES;

    self.string1 =
        [dictionary objectForKey:@"string1"] != [NSNull null] ? 
        [dictionary objectForKey:@"string1"] : nil;

    self.string2 =
        [dictionary objectForKey:@"string2"] != [NSNull null] ? 
        [dictionary objectForKey:@"string2"] : nil;

    if (![dictionary objectForKey:@"oinoL2Object"] || [dictionary objectForKey:@"oinoL2Object"] == [NSNull null])
        self.oinoL2Object = nil;
    else if (!self.oinoL2Object)
        self.oinoL2Object = [JROinoL2Object oinoL2ObjectObjectFromDictionary:[dictionary objectForKey:@"oinoL2Object"] withPath:self.captureObjectPath fromDecoder:NO];
    else
        [self.oinoL2Object replaceFromDictionary:[dictionary objectForKey:@"oinoL2Object"] withPath:self.captureObjectPath];

    [self.dirtyPropertySet setSet:dirtyPropertySetCopy];
}

- (NSSet *)updatablePropertySet
{
    return [NSSet setWithObjects:@"string1", @"string2", @"oinoL2Object", nil];
}

- (void)setAllPropertiesToDirty
{
    [self.dirtyPropertySet addObjectsFromArray:[[self updatablePropertySet] allObjects]];

}

- (NSDictionary *)snapshotDictionaryFromDirtyPropertySet
{
    NSMutableDictionary *snapshotDictionary =
             [NSMutableDictionary dictionaryWithCapacity:10];

    [snapshotDictionary setObject:[self.dirtyPropertySet copy] forKey:@"oinoL1Object"];

    if (self.oinoL2Object)
        [snapshotDictionary setObject:[self.oinoL2Object snapshotDictionaryFromDirtyPropertySet]
                               forKey:@"oinoL2Object"];

    return [NSDictionary dictionaryWithDictionary:snapshotDictionary];
}

- (void)restoreDirtyPropertiesFromSnapshotDictionary:(NSDictionary *)snapshotDictionary
{
    if ([snapshotDictionary objectForKey:@"oinoL1Object"])
        [self.dirtyPropertySet addObjectsFromArray:[[snapshotDictionary objectForKey:@"oinoL1Object"] allObjects]];

    if ([snapshotDictionary objectForKey:@"oinoL2Object"])
        [self.oinoL2Object restoreDirtyPropertiesFromSnapshotDictionary:
                    [snapshotDictionary objectForKey:@"oinoL2Object"]];

}

- (NSDictionary *)toUpdateDictionary
{
    NSMutableDictionary *dictionary =
         [NSMutableDictionary dictionaryWithCapacity:10];

    if ([self.dirtyPropertySet containsObject:@"string1"])
        [dictionary setObject:(self.string1 ? self.string1 : [NSNull null]) forKey:@"string1"];

    if ([self.dirtyPropertySet containsObject:@"string2"])
        [dictionary setObject:(self.string2 ? self.string2 : [NSNull null]) forKey:@"string2"];

    if ([self.dirtyPropertySet containsObject:@"oinoL2Object"])
        [dictionary setObject:(self.oinoL2Object ?
                              [self.oinoL2Object toUpdateDictionary] :
                              [[JROinoL2Object oinoL2Object] toUpdateDictionary]) /* Use the default constructor to create an empty object */
                       forKey:@"oinoL2Object"];
    else if ([self.oinoL2Object needsUpdate])
        [dictionary setObject:[self.oinoL2Object toUpdateDictionary]
                       forKey:@"oinoL2Object"];

    [self.dirtyPropertySet removeAllObjects];
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

- (void)updateOnCaptureForDelegate:(id<JRCaptureObjectDelegate>)delegate context:(NSObject *)context
{
    [super updateOnCaptureForDelegate:delegate context:context];
}

- (NSDictionary *)toReplaceDictionary
{
    NSMutableDictionary *dictionary =
         [NSMutableDictionary dictionaryWithCapacity:10];

    [dictionary setObject:(self.string1 ? self.string1 : [NSNull null]) forKey:@"string1"];
    [dictionary setObject:(self.string2 ? self.string2 : [NSNull null]) forKey:@"string2"];

    [dictionary setObject:(self.oinoL2Object ?
                          [self.oinoL2Object toReplaceDictionary] :
                          [[JROinoL2Object oinoL2Object] toUpdateDictionary]) /* Use the default constructor to create an empty object */
                   forKey:@"oinoL2Object"];

    [self.dirtyPropertySet removeAllObjects];
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

- (BOOL)needsUpdate
{
    if ([self.dirtyPropertySet count])
         return YES;

    if ([self.oinoL2Object needsUpdate])
        return YES;

    return NO;
}

- (BOOL)isEqualToOinoL1Object:(JROinoL1Object *)otherOinoL1Object
{
    if (!self.string1 && !otherOinoL1Object.string1) /* Keep going... */;
    else if ((self.string1 == nil) ^ (otherOinoL1Object.string1 == nil)) return NO; // xor
    else if (![self.string1 isEqualToString:otherOinoL1Object.string1]) return NO;

    if (!self.string2 && !otherOinoL1Object.string2) /* Keep going... */;
    else if ((self.string2 == nil) ^ (otherOinoL1Object.string2 == nil)) return NO; // xor
    else if (![self.string2 isEqualToString:otherOinoL1Object.string2]) return NO;

    if (!self.oinoL2Object && !otherOinoL1Object.oinoL2Object) /* Keep going... */;
    else if (!self.oinoL2Object && [otherOinoL1Object.oinoL2Object isEqualToOinoL2Object:[JROinoL2Object oinoL2Object]]) /* Keep going... */;
    else if (!otherOinoL1Object.oinoL2Object && [self.oinoL2Object isEqualToOinoL2Object:[JROinoL2Object oinoL2Object]]) /* Keep going... */;
    else if (![self.oinoL2Object isEqualToOinoL2Object:otherOinoL1Object.oinoL2Object]) return NO;

    return YES;
}

- (NSDictionary*)objectProperties
{
    NSMutableDictionary *dictionary =
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dictionary setObject:@"NSString" forKey:@"string1"];
    [dictionary setObject:@"NSString" forKey:@"string2"];
    [dictionary setObject:@"JROinoL2Object" forKey:@"oinoL2Object"];

    return [NSDictionary dictionaryWithDictionary:dictionary];
}

@end
