//
//  EasyPlistEditor.h
//  SampleFileManager
//
//  Created by Nadeeshan Jayawardana on 8/30/17.
//  Copyright © 2017 Nadeeshan Jayawardana (NEngineering). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EasyPlistEditor : NSObject

- (id)initWithName:(NSString *)plistName;
- (void)validatePlistFileDestinations;
- (NSDictionary *)readPlistFile;

// Get value from .plist resource
- (NSArray *)getArrayWithKey:(NSString *)key;
- (NSDictionary *)getDictionaryWithKey:(NSString *)key;
- (Boolean)getBooleanWithKey:(NSString *)key;
- (NSData *)getDataWithKey:(NSString *)key;
- (NSDate *)getDateWithKey:(NSString *)key;
- (NSNumber *)getNumberWithKey:(NSString *)key;
- (NSString *)getStringWithKey:(NSString *)key;

// Set value to .plist resource
- (BOOL)setArray:(NSArray *)value withKey:(NSString *)key;
- (BOOL)setDictionary:(NSDictionary *)value withKey:(NSString *)key;
- (BOOL)setBoolean:(Boolean)value withKey:(NSString *)key;
- (BOOL)setData:(NSData *)value withKey:(NSString *)key;
- (BOOL)setDate:(NSDate *)value withKey:(NSString *)key;
- (BOOL)setNumber:(NSNumber *)value withKey:(NSString *)key;
- (BOOL)setString:(NSString *)value withKey:(NSString *)key;

@end
