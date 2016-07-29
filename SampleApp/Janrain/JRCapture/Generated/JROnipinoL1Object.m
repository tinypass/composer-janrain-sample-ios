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
#import "JROnipinoL1Object.h"

@interface JROnipinoL2PluralElement (JROnipinoL2PluralElement_InternalMethods)
+ (id)onipinoL2PluralElementFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath fromDecoder:(BOOL)fromDecoder;
- (BOOL)isEqualToOnipinoL2PluralElement:(JROnipinoL2PluralElement *)otherOnipinoL2PluralElement;
@end

@implementation NSArray (JRArray_OnipinoL2Plural_ToFromDictionary)
- (NSArray*)arrayOfOnipinoL2PluralElementsFromOnipinoL2PluralDictionariesWithPath:(NSString*)capturePath fromDecoder:(BOOL)fromDecoder
{
    NSMutableArray *filteredOnipinoL2PluralArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *dictionary in self)
        if ([dictionary isKindOfClass:[NSDictionary class]])
            [filteredOnipinoL2PluralArray addObject:[JROnipinoL2PluralElement onipinoL2PluralElementFromDictionary:(NSDictionary*)dictionary withPath:capturePath fromDecoder:fromDecoder]];

    return filteredOnipinoL2PluralArray;
}

- (NSArray*)arrayOfOnipinoL2PluralElementsFromOnipinoL2PluralDictionariesWithPath:(NSString*)capturePath
{
    return [self arrayOfOnipinoL2PluralElementsFromOnipinoL2PluralDictionariesWithPath:capturePath fromDecoder:NO];
}

- (NSArray*)arrayOfOnipinoL2PluralDictionariesFromOnipinoL2PluralElementsForEncoder:(BOOL)forEncoder
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JROnipinoL2PluralElement class]])
            [filteredDictionaryArray addObject:[(JROnipinoL2PluralElement*)object newDictionaryForEncoder:forEncoder]];

    return filteredDictionaryArray;
}

- (NSArray*)arrayOfOnipinoL2PluralDictionariesFromOnipinoL2PluralElements
{
    return [self arrayOfOnipinoL2PluralDictionariesFromOnipinoL2PluralElementsForEncoder:NO];
}

- (NSArray*)arrayOfOnipinoL2PluralReplaceDictionariesFromOnipinoL2PluralElements
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JROnipinoL2PluralElement class]])
            [filteredDictionaryArray addObject:[(JROnipinoL2PluralElement*)object toReplaceDictionary]];

    return filteredDictionaryArray;
}
@end

@interface NSArray (OnipinoL1Object_ArrayComparison)
- (BOOL)isEqualToOnipinoL2PluralArray:(NSArray *)otherArray;
@end

@implementation NSArray (OnipinoL1Object_ArrayComparison)

- (BOOL)isEqualToOnipinoL2PluralArray:(NSArray *)otherArray
{
    if ([self count] != [otherArray count]) return NO;

    for (NSUInteger i = 0; i < [self count]; i++)
        if (![((JROnipinoL2PluralElement *)[self objectAtIndex:i]) isEqualToOnipinoL2PluralElement:[otherArray objectAtIndex:i]])
            return NO;

    return YES;
}
@end

@interface JROnipinoL1Object ()
@property BOOL canBeUpdatedOnCapture;
@end

@implementation JROnipinoL1Object
{
    NSString *_string1;
    NSString *_string2;
    NSArray *_onipinoL2Plural;
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

- (NSArray *)onipinoL2Plural
{
    return _onipinoL2Plural;
}

- (void)setOnipinoL2Plural:(NSArray *)newOnipinoL2Plural
{
    _onipinoL2Plural = [newOnipinoL2Plural copy];
}

- (id)init
{
    if ((self = [super init]))
    {
        self.captureObjectPath = @"/onipinoL1Object";
        self.canBeUpdatedOnCapture = YES;


        [self.dirtyPropertySet setSet:[self updatablePropertySet]];
    }
    return self;
}

+ (id)onipinoL1Object
{
    return [[JROnipinoL1Object alloc] init];
}

- (NSDictionary*)newDictionaryForEncoder:(BOOL)forEncoder
{
    NSMutableDictionary *dictionary =
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dictionary setObject:(self.string1 ? self.string1 : [NSNull null])
                   forKey:@"string1"];
    [dictionary setObject:(self.string2 ? self.string2 : [NSNull null])
                   forKey:@"string2"];
    [dictionary setObject:(self.onipinoL2Plural ? [self.onipinoL2Plural arrayOfOnipinoL2PluralDictionariesFromOnipinoL2PluralElementsForEncoder:forEncoder] : [NSNull null])
                   forKey:@"onipinoL2Plural"];

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

+ (id)onipinoL1ObjectObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath fromDecoder:(BOOL)fromDecoder
{
    if (!dictionary)
        return nil;

    JROnipinoL1Object *onipinoL1Object = [JROnipinoL1Object onipinoL1Object];

    NSSet *dirtyPropertySetCopy = nil;
    if (fromDecoder)
    {
        dirtyPropertySetCopy = [NSSet setWithArray:[dictionary objectForKey:@"dirtyPropertiesSet"]];
        onipinoL1Object.captureObjectPath = ([dictionary objectForKey:@"captureObjectPath"] == [NSNull null] ?
                                                              nil : [dictionary objectForKey:@"captureObjectPath"]);
    }

    onipinoL1Object.string1 =
        [dictionary objectForKey:@"string1"] != [NSNull null] ? 
        [dictionary objectForKey:@"string1"] : nil;

    onipinoL1Object.string2 =
        [dictionary objectForKey:@"string2"] != [NSNull null] ? 
        [dictionary objectForKey:@"string2"] : nil;

    onipinoL1Object.onipinoL2Plural =
        [dictionary objectForKey:@"onipinoL2Plural"] != [NSNull null] ? 
        [(NSArray*)[dictionary objectForKey:@"onipinoL2Plural"] arrayOfOnipinoL2PluralElementsFromOnipinoL2PluralDictionariesWithPath:onipinoL1Object.captureObjectPath fromDecoder:fromDecoder] : nil;

    if (fromDecoder)
        [onipinoL1Object.dirtyPropertySet setSet:dirtyPropertySetCopy];
    else
        [onipinoL1Object.dirtyPropertySet removeAllObjects];

    return onipinoL1Object;
}

+ (id)onipinoL1ObjectObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    return [JROnipinoL1Object onipinoL1ObjectObjectFromDictionary:dictionary withPath:capturePath fromDecoder:NO];
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

    self.onipinoL2Plural =
        [dictionary objectForKey:@"onipinoL2Plural"] != [NSNull null] ? 
        [(NSArray*)[dictionary objectForKey:@"onipinoL2Plural"] arrayOfOnipinoL2PluralElementsFromOnipinoL2PluralDictionariesWithPath:self.captureObjectPath fromDecoder:NO] : nil;

    [self.dirtyPropertySet setSet:dirtyPropertySetCopy];
}

- (NSSet *)updatablePropertySet
{
    return [NSSet setWithObjects:@"string1", @"string2", nil];
}

- (void)setAllPropertiesToDirty
{
    [self.dirtyPropertySet addObjectsFromArray:[[self updatablePropertySet] allObjects]];

}

- (NSDictionary *)snapshotDictionaryFromDirtyPropertySet
{
    NSMutableDictionary *snapshotDictionary =
             [NSMutableDictionary dictionaryWithCapacity:10];

    [snapshotDictionary setObject:[self.dirtyPropertySet copy] forKey:@"onipinoL1Object"];

    return [NSDictionary dictionaryWithDictionary:snapshotDictionary];
}

- (void)restoreDirtyPropertiesFromSnapshotDictionary:(NSDictionary *)snapshotDictionary
{
    if ([snapshotDictionary objectForKey:@"onipinoL1Object"])
        [self.dirtyPropertySet addObjectsFromArray:[[snapshotDictionary objectForKey:@"onipinoL1Object"] allObjects]];

}

- (NSDictionary *)toUpdateDictionary
{
    NSMutableDictionary *dictionary =
         [NSMutableDictionary dictionaryWithCapacity:10];

    if ([self.dirtyPropertySet containsObject:@"string1"])
        [dictionary setObject:(self.string1 ? self.string1 : [NSNull null]) forKey:@"string1"];

    if ([self.dirtyPropertySet containsObject:@"string2"])
        [dictionary setObject:(self.string2 ? self.string2 : [NSNull null]) forKey:@"string2"];

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

    [dictionary setObject:(self.onipinoL2Plural ?
                          [self.onipinoL2Plural arrayOfOnipinoL2PluralReplaceDictionariesFromOnipinoL2PluralElements] :
                          [NSArray array])
                   forKey:@"onipinoL2Plural"];

    [self.dirtyPropertySet removeAllObjects];
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

- (void)replaceOnipinoL2PluralArrayOnCaptureForDelegate:(id<JRCaptureObjectDelegate>)delegate context:(NSObject *)context
{
    [self replaceArrayOnCapture:self.onipinoL2Plural named:@"onipinoL2Plural" isArrayOfStrings:NO
                       withType:@"" forDelegate:delegate withContext:context];
}

- (BOOL)needsUpdate
{
    if ([self.dirtyPropertySet count])
         return YES;

    return NO;
}

- (BOOL)isEqualToOnipinoL1Object:(JROnipinoL1Object *)otherOnipinoL1Object
{
    if (!self.string1 && !otherOnipinoL1Object.string1) /* Keep going... */;
    else if ((self.string1 == nil) ^ (otherOnipinoL1Object.string1 == nil)) return NO; // xor
    else if (![self.string1 isEqualToString:otherOnipinoL1Object.string1]) return NO;

    if (!self.string2 && !otherOnipinoL1Object.string2) /* Keep going... */;
    else if ((self.string2 == nil) ^ (otherOnipinoL1Object.string2 == nil)) return NO; // xor
    else if (![self.string2 isEqualToString:otherOnipinoL1Object.string2]) return NO;

    if (!self.onipinoL2Plural && !otherOnipinoL1Object.onipinoL2Plural) /* Keep going... */;
    else if (!self.onipinoL2Plural && ![otherOnipinoL1Object.onipinoL2Plural count]) /* Keep going... */;
    else if (!otherOnipinoL1Object.onipinoL2Plural && ![self.onipinoL2Plural count]) /* Keep going... */;
    else if (![self.onipinoL2Plural isEqualToOnipinoL2PluralArray:otherOnipinoL1Object.onipinoL2Plural]) return NO;

    return YES;
}

- (NSDictionary*)objectProperties
{
    NSMutableDictionary *dictionary =
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dictionary setObject:@"NSString" forKey:@"string1"];
    [dictionary setObject:@"NSString" forKey:@"string2"];
    [dictionary setObject:@"NSArray" forKey:@"onipinoL2Plural"];

    return [NSDictionary dictionaryWithDictionary:dictionary];
}

@end
