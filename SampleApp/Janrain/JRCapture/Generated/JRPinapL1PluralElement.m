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
#import "JRPinapL1PluralElement.h"

@interface JRPinapL2PluralElement (JRPinapL2PluralElement_InternalMethods)
+ (id)pinapL2PluralElementFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath fromDecoder:(BOOL)fromDecoder;
- (BOOL)isEqualToPinapL2PluralElement:(JRPinapL2PluralElement *)otherPinapL2PluralElement;
@end

@implementation NSArray (JRArray_PinapL2Plural_ToFromDictionary)
- (NSArray*)arrayOfPinapL2PluralElementsFromPinapL2PluralDictionariesWithPath:(NSString*)capturePath fromDecoder:(BOOL)fromDecoder
{
    NSMutableArray *filteredPinapL2PluralArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *dictionary in self)
        if ([dictionary isKindOfClass:[NSDictionary class]])
            [filteredPinapL2PluralArray addObject:[JRPinapL2PluralElement pinapL2PluralElementFromDictionary:(NSDictionary*)dictionary withPath:capturePath fromDecoder:fromDecoder]];

    return filteredPinapL2PluralArray;
}

- (NSArray*)arrayOfPinapL2PluralElementsFromPinapL2PluralDictionariesWithPath:(NSString*)capturePath
{
    return [self arrayOfPinapL2PluralElementsFromPinapL2PluralDictionariesWithPath:capturePath fromDecoder:NO];
}

- (NSArray*)arrayOfPinapL2PluralDictionariesFromPinapL2PluralElementsForEncoder:(BOOL)forEncoder
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JRPinapL2PluralElement class]])
            [filteredDictionaryArray addObject:[(JRPinapL2PluralElement*)object newDictionaryForEncoder:forEncoder]];

    return filteredDictionaryArray;
}

- (NSArray*)arrayOfPinapL2PluralDictionariesFromPinapL2PluralElements
{
    return [self arrayOfPinapL2PluralDictionariesFromPinapL2PluralElementsForEncoder:NO];
}

- (NSArray*)arrayOfPinapL2PluralReplaceDictionariesFromPinapL2PluralElements
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JRPinapL2PluralElement class]])
            [filteredDictionaryArray addObject:[(JRPinapL2PluralElement*)object toReplaceDictionary]];

    return filteredDictionaryArray;
}
@end

@interface NSArray (PinapL1PluralElement_ArrayComparison)
- (BOOL)isEqualToPinapL2PluralArray:(NSArray *)otherArray;
@end

@implementation NSArray (PinapL1PluralElement_ArrayComparison)

- (BOOL)isEqualToPinapL2PluralArray:(NSArray *)otherArray
{
    if ([self count] != [otherArray count]) return NO;

    for (NSUInteger i = 0; i < [self count]; i++)
        if (![((JRPinapL2PluralElement *)[self objectAtIndex:i]) isEqualToPinapL2PluralElement:[otherArray objectAtIndex:i]])
            return NO;

    return YES;
}
@end

@interface JRPinapL1PluralElement ()
@property BOOL canBeUpdatedOnCapture;
@end

@implementation JRPinapL1PluralElement
{
    NSString *_string1;
    NSString *_string2;
    NSArray *_pinapL2Plural;
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

- (NSArray *)pinapL2Plural
{
    return _pinapL2Plural;
}

- (void)setPinapL2Plural:(NSArray *)newPinapL2Plural
{
    _pinapL2Plural = [newPinapL2Plural copy];
}

- (id)init
{
    if ((self = [super init]))
    {
        self.captureObjectPath      = @"";
        self.canBeUpdatedOnCapture  = NO;


        [self.dirtyPropertySet setSet:[self updatablePropertySet]];
    }
    return self;
}

+ (id)pinapL1PluralElement
{
    return [[JRPinapL1PluralElement alloc] init];
}

- (NSDictionary*)newDictionaryForEncoder:(BOOL)forEncoder
{
    NSMutableDictionary *dictionary =
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dictionary setObject:(self.string1 ? self.string1 : [NSNull null])
                   forKey:@"string1"];
    [dictionary setObject:(self.string2 ? self.string2 : [NSNull null])
                   forKey:@"string2"];
    [dictionary setObject:(self.pinapL2Plural ? [self.pinapL2Plural arrayOfPinapL2PluralDictionariesFromPinapL2PluralElementsForEncoder:forEncoder] : [NSNull null])
                   forKey:@"pinapL2Plural"];

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

+ (id)pinapL1PluralElementFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath fromDecoder:(BOOL)fromDecoder
{
    if (!dictionary)
        return nil;

    JRPinapL1PluralElement *pinapL1PluralElement = [JRPinapL1PluralElement pinapL1PluralElement];

    NSSet *dirtyPropertySetCopy = nil;
    if (fromDecoder)
    {
        dirtyPropertySetCopy = [NSSet setWithArray:[dictionary objectForKey:@"dirtyPropertiesSet"]];
        pinapL1PluralElement.captureObjectPath = ([dictionary objectForKey:@"captureObjectPath"] == [NSNull null] ?
                                                              nil : [dictionary objectForKey:@"captureObjectPath"]);
        pinapL1PluralElement.canBeUpdatedOnCapture = [(NSNumber *)[dictionary objectForKey:@"canBeUpdatedOnCapture"] boolValue];
    }
    else
    {
        pinapL1PluralElement.captureObjectPath      = [NSString stringWithFormat:@"%@/%@#%ld", capturePath, @"pinapL1Plural", (long)[(NSNumber*)[dictionary objectForKey:@"id"] integerValue]];
        pinapL1PluralElement.canBeUpdatedOnCapture = YES;
    }

    pinapL1PluralElement.string1 =
        [dictionary objectForKey:@"string1"] != [NSNull null] ? 
        [dictionary objectForKey:@"string1"] : nil;

    pinapL1PluralElement.string2 =
        [dictionary objectForKey:@"string2"] != [NSNull null] ? 
        [dictionary objectForKey:@"string2"] : nil;

    pinapL1PluralElement.pinapL2Plural =
        [dictionary objectForKey:@"pinapL2Plural"] != [NSNull null] ? 
        [(NSArray*)[dictionary objectForKey:@"pinapL2Plural"] arrayOfPinapL2PluralElementsFromPinapL2PluralDictionariesWithPath:pinapL1PluralElement.captureObjectPath fromDecoder:fromDecoder] : nil;

    if (fromDecoder)
        [pinapL1PluralElement.dirtyPropertySet setSet:dirtyPropertySetCopy];
    else
        [pinapL1PluralElement.dirtyPropertySet removeAllObjects];

    return pinapL1PluralElement;
}

+ (id)pinapL1PluralElementFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    return [JRPinapL1PluralElement pinapL1PluralElementFromDictionary:dictionary withPath:capturePath fromDecoder:NO];
}

- (void)replaceFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    DLog(@"%@ %@", capturePath, [dictionary description]);

    NSSet *dirtyPropertySetCopy = [self.dirtyPropertySet copy];

    self.canBeUpdatedOnCapture = YES;
    self.captureObjectPath = [NSString stringWithFormat:@"%@/%@#%ld", capturePath, @"pinapL1Plural", (long)[(NSNumber*)[dictionary objectForKey:@"id"] integerValue]];

    self.string1 =
        [dictionary objectForKey:@"string1"] != [NSNull null] ? 
        [dictionary objectForKey:@"string1"] : nil;

    self.string2 =
        [dictionary objectForKey:@"string2"] != [NSNull null] ? 
        [dictionary objectForKey:@"string2"] : nil;

    self.pinapL2Plural =
        [dictionary objectForKey:@"pinapL2Plural"] != [NSNull null] ? 
        [(NSArray*)[dictionary objectForKey:@"pinapL2Plural"] arrayOfPinapL2PluralElementsFromPinapL2PluralDictionariesWithPath:self.captureObjectPath fromDecoder:NO] : nil;

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

    [snapshotDictionary setObject:[self.dirtyPropertySet copy] forKey:@"pinapL1PluralElement"];

    return [NSDictionary dictionaryWithDictionary:snapshotDictionary];
}

- (void)restoreDirtyPropertiesFromSnapshotDictionary:(NSDictionary *)snapshotDictionary
{
    if ([snapshotDictionary objectForKey:@"pinapL1PluralElement"])
        [self.dirtyPropertySet addObjectsFromArray:[[snapshotDictionary objectForKey:@"pinapL1PluralElement"] allObjects]];

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

    [dictionary setObject:(self.pinapL2Plural ?
                          [self.pinapL2Plural arrayOfPinapL2PluralReplaceDictionariesFromPinapL2PluralElements] :
                          [NSArray array])
                   forKey:@"pinapL2Plural"];

    [self.dirtyPropertySet removeAllObjects];
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

- (void)replacePinapL2PluralArrayOnCaptureForDelegate:(id<JRCaptureObjectDelegate>)delegate context:(NSObject *)context
{
    [self replaceArrayOnCapture:self.pinapL2Plural named:@"pinapL2Plural" isArrayOfStrings:NO
                       withType:@"" forDelegate:delegate withContext:context];
}

- (BOOL)needsUpdate
{
    if ([self.dirtyPropertySet count])
         return YES;

    return NO;
}

- (BOOL)isEqualToPinapL1PluralElement:(JRPinapL1PluralElement *)otherPinapL1PluralElement
{
    if (!self.string1 && !otherPinapL1PluralElement.string1) /* Keep going... */;
    else if ((self.string1 == nil) ^ (otherPinapL1PluralElement.string1 == nil)) return NO; // xor
    else if (![self.string1 isEqualToString:otherPinapL1PluralElement.string1]) return NO;

    if (!self.string2 && !otherPinapL1PluralElement.string2) /* Keep going... */;
    else if ((self.string2 == nil) ^ (otherPinapL1PluralElement.string2 == nil)) return NO; // xor
    else if (![self.string2 isEqualToString:otherPinapL1PluralElement.string2]) return NO;

    if (!self.pinapL2Plural && !otherPinapL1PluralElement.pinapL2Plural) /* Keep going... */;
    else if (!self.pinapL2Plural && ![otherPinapL1PluralElement.pinapL2Plural count]) /* Keep going... */;
    else if (!otherPinapL1PluralElement.pinapL2Plural && ![self.pinapL2Plural count]) /* Keep going... */;
    else if (![self.pinapL2Plural isEqualToPinapL2PluralArray:otherPinapL1PluralElement.pinapL2Plural]) return NO;

    return YES;
}

- (NSDictionary*)objectProperties
{
    NSMutableDictionary *dictionary =
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dictionary setObject:@"NSString" forKey:@"string1"];
    [dictionary setObject:@"NSString" forKey:@"string2"];
    [dictionary setObject:@"NSArray" forKey:@"pinapL2Plural"];

    return [NSDictionary dictionaryWithDictionary:dictionary];
}

@end
