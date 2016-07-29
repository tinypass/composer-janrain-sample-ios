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
#import "JRPinapinapL1PluralElement.h"

@interface JRPinapinapL2PluralElement (JRPinapinapL2PluralElement_InternalMethods)
+ (id)pinapinapL2PluralElementFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath fromDecoder:(BOOL)fromDecoder;
- (BOOL)isEqualToPinapinapL2PluralElement:(JRPinapinapL2PluralElement *)otherPinapinapL2PluralElement;
@end

@implementation NSArray (JRArray_PinapinapL2Plural_ToFromDictionary)
- (NSArray*)arrayOfPinapinapL2PluralElementsFromPinapinapL2PluralDictionariesWithPath:(NSString*)capturePath fromDecoder:(BOOL)fromDecoder
{
    NSMutableArray *filteredPinapinapL2PluralArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *dictionary in self)
        if ([dictionary isKindOfClass:[NSDictionary class]])
            [filteredPinapinapL2PluralArray addObject:[JRPinapinapL2PluralElement pinapinapL2PluralElementFromDictionary:(NSDictionary*)dictionary withPath:capturePath fromDecoder:fromDecoder]];

    return filteredPinapinapL2PluralArray;
}

- (NSArray*)arrayOfPinapinapL2PluralElementsFromPinapinapL2PluralDictionariesWithPath:(NSString*)capturePath
{
    return [self arrayOfPinapinapL2PluralElementsFromPinapinapL2PluralDictionariesWithPath:capturePath fromDecoder:NO];
}

- (NSArray*)arrayOfPinapinapL2PluralDictionariesFromPinapinapL2PluralElementsForEncoder:(BOOL)forEncoder
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JRPinapinapL2PluralElement class]])
            [filteredDictionaryArray addObject:[(JRPinapinapL2PluralElement*)object newDictionaryForEncoder:forEncoder]];

    return filteredDictionaryArray;
}

- (NSArray*)arrayOfPinapinapL2PluralDictionariesFromPinapinapL2PluralElements
{
    return [self arrayOfPinapinapL2PluralDictionariesFromPinapinapL2PluralElementsForEncoder:NO];
}

- (NSArray*)arrayOfPinapinapL2PluralReplaceDictionariesFromPinapinapL2PluralElements
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JRPinapinapL2PluralElement class]])
            [filteredDictionaryArray addObject:[(JRPinapinapL2PluralElement*)object toReplaceDictionary]];

    return filteredDictionaryArray;
}
@end

@interface NSArray (PinapinapL1PluralElement_ArrayComparison)
- (BOOL)isEqualToPinapinapL2PluralArray:(NSArray *)otherArray;
@end

@implementation NSArray (PinapinapL1PluralElement_ArrayComparison)

- (BOOL)isEqualToPinapinapL2PluralArray:(NSArray *)otherArray
{
    if ([self count] != [otherArray count]) return NO;

    for (NSUInteger i = 0; i < [self count]; i++)
        if (![((JRPinapinapL2PluralElement *)[self objectAtIndex:i]) isEqualToPinapinapL2PluralElement:[otherArray objectAtIndex:i]])
            return NO;

    return YES;
}
@end

@interface JRPinapinapL1PluralElement ()
@property BOOL canBeUpdatedOnCapture;
@end

@implementation JRPinapinapL1PluralElement
{
    NSString *_string1;
    NSString *_string2;
    NSArray *_pinapinapL2Plural;
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

- (NSArray *)pinapinapL2Plural
{
    return _pinapinapL2Plural;
}

- (void)setPinapinapL2Plural:(NSArray *)newPinapinapL2Plural
{
    _pinapinapL2Plural = [newPinapinapL2Plural copy];
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

+ (id)pinapinapL1PluralElement
{
    return [[JRPinapinapL1PluralElement alloc] init];
}

- (NSDictionary*)newDictionaryForEncoder:(BOOL)forEncoder
{
    NSMutableDictionary *dictionary =
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dictionary setObject:(self.string1 ? self.string1 : [NSNull null])
                   forKey:@"string1"];
    [dictionary setObject:(self.string2 ? self.string2 : [NSNull null])
                   forKey:@"string2"];
    [dictionary setObject:(self.pinapinapL2Plural ? [self.pinapinapL2Plural arrayOfPinapinapL2PluralDictionariesFromPinapinapL2PluralElementsForEncoder:forEncoder] : [NSNull null])
                   forKey:@"pinapinapL2Plural"];

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

+ (id)pinapinapL1PluralElementFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath fromDecoder:(BOOL)fromDecoder
{
    if (!dictionary)
        return nil;

    JRPinapinapL1PluralElement *pinapinapL1PluralElement = [JRPinapinapL1PluralElement pinapinapL1PluralElement];

    NSSet *dirtyPropertySetCopy = nil;
    if (fromDecoder)
    {
        dirtyPropertySetCopy = [NSSet setWithArray:[dictionary objectForKey:@"dirtyPropertiesSet"]];
        pinapinapL1PluralElement.captureObjectPath = ([dictionary objectForKey:@"captureObjectPath"] == [NSNull null] ?
                                                              nil : [dictionary objectForKey:@"captureObjectPath"]);
        pinapinapL1PluralElement.canBeUpdatedOnCapture = [(NSNumber *)[dictionary objectForKey:@"canBeUpdatedOnCapture"] boolValue];
    }
    else
    {
        pinapinapL1PluralElement.captureObjectPath      = [NSString stringWithFormat:@"%@/%@#%ld", capturePath, @"pinapinapL1Plural", (long)[(NSNumber*)[dictionary objectForKey:@"id"] integerValue]];
        pinapinapL1PluralElement.canBeUpdatedOnCapture = YES;
    }

    pinapinapL1PluralElement.string1 =
        [dictionary objectForKey:@"string1"] != [NSNull null] ? 
        [dictionary objectForKey:@"string1"] : nil;

    pinapinapL1PluralElement.string2 =
        [dictionary objectForKey:@"string2"] != [NSNull null] ? 
        [dictionary objectForKey:@"string2"] : nil;

    pinapinapL1PluralElement.pinapinapL2Plural =
        [dictionary objectForKey:@"pinapinapL2Plural"] != [NSNull null] ? 
        [(NSArray*)[dictionary objectForKey:@"pinapinapL2Plural"] arrayOfPinapinapL2PluralElementsFromPinapinapL2PluralDictionariesWithPath:pinapinapL1PluralElement.captureObjectPath fromDecoder:fromDecoder] : nil;

    if (fromDecoder)
        [pinapinapL1PluralElement.dirtyPropertySet setSet:dirtyPropertySetCopy];
    else
        [pinapinapL1PluralElement.dirtyPropertySet removeAllObjects];

    return pinapinapL1PluralElement;
}

+ (id)pinapinapL1PluralElementFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    return [JRPinapinapL1PluralElement pinapinapL1PluralElementFromDictionary:dictionary withPath:capturePath fromDecoder:NO];
}

- (void)replaceFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    DLog(@"%@ %@", capturePath, [dictionary description]);

    NSSet *dirtyPropertySetCopy = [self.dirtyPropertySet copy];

    self.canBeUpdatedOnCapture = YES;
    self.captureObjectPath = [NSString stringWithFormat:@"%@/%@#%ld", capturePath, @"pinapinapL1Plural", (long)[(NSNumber*)[dictionary objectForKey:@"id"] integerValue]];

    self.string1 =
        [dictionary objectForKey:@"string1"] != [NSNull null] ? 
        [dictionary objectForKey:@"string1"] : nil;

    self.string2 =
        [dictionary objectForKey:@"string2"] != [NSNull null] ? 
        [dictionary objectForKey:@"string2"] : nil;

    self.pinapinapL2Plural =
        [dictionary objectForKey:@"pinapinapL2Plural"] != [NSNull null] ? 
        [(NSArray*)[dictionary objectForKey:@"pinapinapL2Plural"] arrayOfPinapinapL2PluralElementsFromPinapinapL2PluralDictionariesWithPath:self.captureObjectPath fromDecoder:NO] : nil;

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

    [snapshotDictionary setObject:[self.dirtyPropertySet copy] forKey:@"pinapinapL1PluralElement"];

    return [NSDictionary dictionaryWithDictionary:snapshotDictionary];
}

- (void)restoreDirtyPropertiesFromSnapshotDictionary:(NSDictionary *)snapshotDictionary
{
    if ([snapshotDictionary objectForKey:@"pinapinapL1PluralElement"])
        [self.dirtyPropertySet addObjectsFromArray:[[snapshotDictionary objectForKey:@"pinapinapL1PluralElement"] allObjects]];

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

    [dictionary setObject:(self.pinapinapL2Plural ?
                          [self.pinapinapL2Plural arrayOfPinapinapL2PluralReplaceDictionariesFromPinapinapL2PluralElements] :
                          [NSArray array])
                   forKey:@"pinapinapL2Plural"];

    [self.dirtyPropertySet removeAllObjects];
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

- (void)replacePinapinapL2PluralArrayOnCaptureForDelegate:(id<JRCaptureObjectDelegate>)delegate context:(NSObject *)context
{
    [self replaceArrayOnCapture:self.pinapinapL2Plural named:@"pinapinapL2Plural" isArrayOfStrings:NO
                       withType:@"" forDelegate:delegate withContext:context];
}

- (BOOL)needsUpdate
{
    if ([self.dirtyPropertySet count])
         return YES;

    return NO;
}

- (BOOL)isEqualToPinapinapL1PluralElement:(JRPinapinapL1PluralElement *)otherPinapinapL1PluralElement
{
    if (!self.string1 && !otherPinapinapL1PluralElement.string1) /* Keep going... */;
    else if ((self.string1 == nil) ^ (otherPinapinapL1PluralElement.string1 == nil)) return NO; // xor
    else if (![self.string1 isEqualToString:otherPinapinapL1PluralElement.string1]) return NO;

    if (!self.string2 && !otherPinapinapL1PluralElement.string2) /* Keep going... */;
    else if ((self.string2 == nil) ^ (otherPinapinapL1PluralElement.string2 == nil)) return NO; // xor
    else if (![self.string2 isEqualToString:otherPinapinapL1PluralElement.string2]) return NO;

    if (!self.pinapinapL2Plural && !otherPinapinapL1PluralElement.pinapinapL2Plural) /* Keep going... */;
    else if (!self.pinapinapL2Plural && ![otherPinapinapL1PluralElement.pinapinapL2Plural count]) /* Keep going... */;
    else if (!otherPinapinapL1PluralElement.pinapinapL2Plural && ![self.pinapinapL2Plural count]) /* Keep going... */;
    else if (![self.pinapinapL2Plural isEqualToPinapinapL2PluralArray:otherPinapinapL1PluralElement.pinapinapL2Plural]) return NO;

    return YES;
}

- (NSDictionary*)objectProperties
{
    NSMutableDictionary *dictionary =
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dictionary setObject:@"NSString" forKey:@"string1"];
    [dictionary setObject:@"NSString" forKey:@"string2"];
    [dictionary setObject:@"NSArray" forKey:@"pinapinapL2Plural"];

    return [NSDictionary dictionaryWithDictionary:dictionary];
}

@end
