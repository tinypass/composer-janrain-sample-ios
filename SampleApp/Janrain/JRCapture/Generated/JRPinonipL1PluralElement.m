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
#import "JRPinonipL1PluralElement.h"

@interface JRPinonipL2Object (JRPinonipL2Object_InternalMethods)
+ (id)pinonipL2ObjectObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath fromDecoder:(BOOL)fromDecoder;
- (BOOL)isEqualToPinonipL2Object:(JRPinonipL2Object *)otherPinonipL2Object;
@end

@interface JRPinonipL1PluralElement ()
@property BOOL canBeUpdatedOnCapture;
@end

@implementation JRPinonipL1PluralElement
{
    NSString *_string1;
    NSString *_string2;
    JRPinonipL2Object *_pinonipL2Object;
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

- (JRPinonipL2Object *)pinonipL2Object
{
    return _pinonipL2Object;
}

- (void)setPinonipL2Object:(JRPinonipL2Object *)newPinonipL2Object
{
    [self.dirtyPropertySet addObject:@"pinonipL2Object"];

    _pinonipL2Object = newPinonipL2Object;

    [_pinonipL2Object setAllPropertiesToDirty];
}

- (id)init
{
    if ((self = [super init]))
    {
        self.captureObjectPath      = @"";
        self.canBeUpdatedOnCapture  = NO;

        _pinonipL2Object = [[JRPinonipL2Object alloc] init];

        [self.dirtyPropertySet setSet:[self updatablePropertySet]];
    }
    return self;
}

+ (id)pinonipL1PluralElement
{
    return [[JRPinonipL1PluralElement alloc] init];
}

- (NSDictionary*)newDictionaryForEncoder:(BOOL)forEncoder
{
    NSMutableDictionary *dictionary =
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dictionary setObject:(self.string1 ? self.string1 : [NSNull null])
                   forKey:@"string1"];
    [dictionary setObject:(self.string2 ? self.string2 : [NSNull null])
                   forKey:@"string2"];
    [dictionary setObject:(self.pinonipL2Object ? [self.pinonipL2Object newDictionaryForEncoder:forEncoder] : [NSNull null])
                   forKey:@"pinonipL2Object"];

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

+ (id)pinonipL1PluralElementFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath fromDecoder:(BOOL)fromDecoder
{
    if (!dictionary)
        return nil;

    JRPinonipL1PluralElement *pinonipL1PluralElement = [JRPinonipL1PluralElement pinonipL1PluralElement];

    NSSet *dirtyPropertySetCopy = nil;
    if (fromDecoder)
    {
        dirtyPropertySetCopy = [NSSet setWithArray:[dictionary objectForKey:@"dirtyPropertiesSet"]];
        pinonipL1PluralElement.captureObjectPath = ([dictionary objectForKey:@"captureObjectPath"] == [NSNull null] ?
                                                              nil : [dictionary objectForKey:@"captureObjectPath"]);
        pinonipL1PluralElement.canBeUpdatedOnCapture = [(NSNumber *)[dictionary objectForKey:@"canBeUpdatedOnCapture"] boolValue];
    }
    else
    {
        pinonipL1PluralElement.captureObjectPath      = [NSString stringWithFormat:@"%@/%@#%ld", capturePath, @"pinonipL1Plural", (long)[(NSNumber*)[dictionary objectForKey:@"id"] integerValue]];
        pinonipL1PluralElement.canBeUpdatedOnCapture = YES;
    }

    pinonipL1PluralElement.string1 =
        [dictionary objectForKey:@"string1"] != [NSNull null] ? 
        [dictionary objectForKey:@"string1"] : nil;

    pinonipL1PluralElement.string2 =
        [dictionary objectForKey:@"string2"] != [NSNull null] ? 
        [dictionary objectForKey:@"string2"] : nil;

    pinonipL1PluralElement.pinonipL2Object =
        [dictionary objectForKey:@"pinonipL2Object"] != [NSNull null] ? 
        [JRPinonipL2Object pinonipL2ObjectObjectFromDictionary:[dictionary objectForKey:@"pinonipL2Object"] withPath:pinonipL1PluralElement.captureObjectPath fromDecoder:fromDecoder] : nil;

    if (fromDecoder)
        [pinonipL1PluralElement.dirtyPropertySet setSet:dirtyPropertySetCopy];
    else
        [pinonipL1PluralElement.dirtyPropertySet removeAllObjects];

    return pinonipL1PluralElement;
}

+ (id)pinonipL1PluralElementFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    return [JRPinonipL1PluralElement pinonipL1PluralElementFromDictionary:dictionary withPath:capturePath fromDecoder:NO];
}

- (void)replaceFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    DLog(@"%@ %@", capturePath, [dictionary description]);

    NSSet *dirtyPropertySetCopy = [self.dirtyPropertySet copy];

    self.canBeUpdatedOnCapture = YES;
    self.captureObjectPath = [NSString stringWithFormat:@"%@/%@#%ld", capturePath, @"pinonipL1Plural", (long)[(NSNumber*)[dictionary objectForKey:@"id"] integerValue]];

    self.string1 =
        [dictionary objectForKey:@"string1"] != [NSNull null] ? 
        [dictionary objectForKey:@"string1"] : nil;

    self.string2 =
        [dictionary objectForKey:@"string2"] != [NSNull null] ? 
        [dictionary objectForKey:@"string2"] : nil;

    if (![dictionary objectForKey:@"pinonipL2Object"] || [dictionary objectForKey:@"pinonipL2Object"] == [NSNull null])
        self.pinonipL2Object = nil;
    else if (!self.pinonipL2Object)
        self.pinonipL2Object = [JRPinonipL2Object pinonipL2ObjectObjectFromDictionary:[dictionary objectForKey:@"pinonipL2Object"] withPath:self.captureObjectPath fromDecoder:NO];
    else
        [self.pinonipL2Object replaceFromDictionary:[dictionary objectForKey:@"pinonipL2Object"] withPath:self.captureObjectPath];

    [self.dirtyPropertySet setSet:dirtyPropertySetCopy];
}

- (NSSet *)updatablePropertySet
{
    return [NSSet setWithObjects:@"string1", @"string2", @"pinonipL2Object", nil];
}

- (void)setAllPropertiesToDirty
{
    [self.dirtyPropertySet addObjectsFromArray:[[self updatablePropertySet] allObjects]];

}

- (NSDictionary *)snapshotDictionaryFromDirtyPropertySet
{
    NSMutableDictionary *snapshotDictionary =
             [NSMutableDictionary dictionaryWithCapacity:10];

    [snapshotDictionary setObject:[self.dirtyPropertySet copy] forKey:@"pinonipL1PluralElement"];

    if (self.pinonipL2Object)
        [snapshotDictionary setObject:[self.pinonipL2Object snapshotDictionaryFromDirtyPropertySet]
                               forKey:@"pinonipL2Object"];

    return [NSDictionary dictionaryWithDictionary:snapshotDictionary];
}

- (void)restoreDirtyPropertiesFromSnapshotDictionary:(NSDictionary *)snapshotDictionary
{
    if ([snapshotDictionary objectForKey:@"pinonipL1PluralElement"])
        [self.dirtyPropertySet addObjectsFromArray:[[snapshotDictionary objectForKey:@"pinonipL1PluralElement"] allObjects]];

    if ([snapshotDictionary objectForKey:@"pinonipL2Object"])
        [self.pinonipL2Object restoreDirtyPropertiesFromSnapshotDictionary:
                    [snapshotDictionary objectForKey:@"pinonipL2Object"]];

}

- (NSDictionary *)toUpdateDictionary
{
    NSMutableDictionary *dictionary =
         [NSMutableDictionary dictionaryWithCapacity:10];

    if ([self.dirtyPropertySet containsObject:@"string1"])
        [dictionary setObject:(self.string1 ? self.string1 : [NSNull null]) forKey:@"string1"];

    if ([self.dirtyPropertySet containsObject:@"string2"])
        [dictionary setObject:(self.string2 ? self.string2 : [NSNull null]) forKey:@"string2"];

    if ([self.dirtyPropertySet containsObject:@"pinonipL2Object"])
        [dictionary setObject:(self.pinonipL2Object ?
                              [self.pinonipL2Object toUpdateDictionary] :
                              [[JRPinonipL2Object pinonipL2Object] toUpdateDictionary]) /* Use the default constructor to create an empty object */
                       forKey:@"pinonipL2Object"];
    else if ([self.pinonipL2Object needsUpdate])
        [dictionary setObject:[self.pinonipL2Object toUpdateDictionary]
                       forKey:@"pinonipL2Object"];

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

    [dictionary setObject:(self.pinonipL2Object ?
                          [self.pinonipL2Object toReplaceDictionary] :
                          [[JRPinonipL2Object pinonipL2Object] toUpdateDictionary]) /* Use the default constructor to create an empty object */
                   forKey:@"pinonipL2Object"];

    [self.dirtyPropertySet removeAllObjects];
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

- (BOOL)needsUpdate
{
    if ([self.dirtyPropertySet count])
         return YES;

    if ([self.pinonipL2Object needsUpdate])
        return YES;

    return NO;
}

- (BOOL)isEqualToPinonipL1PluralElement:(JRPinonipL1PluralElement *)otherPinonipL1PluralElement
{
    if (!self.string1 && !otherPinonipL1PluralElement.string1) /* Keep going... */;
    else if ((self.string1 == nil) ^ (otherPinonipL1PluralElement.string1 == nil)) return NO; // xor
    else if (![self.string1 isEqualToString:otherPinonipL1PluralElement.string1]) return NO;

    if (!self.string2 && !otherPinonipL1PluralElement.string2) /* Keep going... */;
    else if ((self.string2 == nil) ^ (otherPinonipL1PluralElement.string2 == nil)) return NO; // xor
    else if (![self.string2 isEqualToString:otherPinonipL1PluralElement.string2]) return NO;

    if (!self.pinonipL2Object && !otherPinonipL1PluralElement.pinonipL2Object) /* Keep going... */;
    else if (!self.pinonipL2Object && [otherPinonipL1PluralElement.pinonipL2Object isEqualToPinonipL2Object:[JRPinonipL2Object pinonipL2Object]]) /* Keep going... */;
    else if (!otherPinonipL1PluralElement.pinonipL2Object && [self.pinonipL2Object isEqualToPinonipL2Object:[JRPinonipL2Object pinonipL2Object]]) /* Keep going... */;
    else if (![self.pinonipL2Object isEqualToPinonipL2Object:otherPinonipL1PluralElement.pinonipL2Object]) return NO;

    return YES;
}

- (NSDictionary*)objectProperties
{
    NSMutableDictionary *dictionary =
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dictionary setObject:@"NSString" forKey:@"string1"];
    [dictionary setObject:@"NSString" forKey:@"string2"];
    [dictionary setObject:@"JRPinonipL2Object" forKey:@"pinonipL2Object"];

    return [NSDictionary dictionaryWithDictionary:dictionary];
}

@end
