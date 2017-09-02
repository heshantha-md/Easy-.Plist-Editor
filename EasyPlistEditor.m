//
//  EasyPlistEditor.m
//  SampleFileManager
//
//  Created by Nadeeshan Jayawardana on 8/30/17.
//  Copyright © 2017 Nadeeshan Jayawardana (NEngineering). All rights reserved.
//

#import "EasyPlistEditor.h"

@implementation EasyPlistEditor  {
    NSString *plistFileName;
    NSError *fileError;
}

- (id)initWithName:(NSString *)plistName {
    self = [super init];
    if (self) {
        if (plistName.length > 0) {
            plistFileName = [NSString stringWithFormat:@"%@.plist",plistName];
            [self validatePlistFileDestinations];
        } else {
            NSLog(@"Error: .plist name cannot be empty");
        }
    }
    return self;
}

// Validate .plist file path
- (void)validatePlistFileDestinations {
    if (plistFileName != nil) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSError *error;
        NSArray *pathsArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *doumentDirectoryPath = [pathsArray objectAtIndex:0];
        NSString *destinationPath = [doumentDirectoryPath stringByAppendingPathComponent:plistFileName];
        if (![fileManager fileExistsAtPath:destinationPath]){
            NSString *sourcePath = [[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:plistFileName];
            [fileManager copyItemAtPath:sourcePath toPath:destinationPath error:&error];
            if (error != nil) {
                fileError = error;
                NSLog(@"Error: %@",[error localizedDescription]);
            }
        }
    } else {
        NSLog(@"Error: .plist name cannot be nil");
    }
}

// Read .plist file function
- (NSDictionary *)readPlistFile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = (paths.count) ? [paths objectAtIndex:0] : nil;
    NSString *docFilePath = [basePath stringByAppendingPathComponent:plistFileName];
    return [NSDictionary dictionaryWithContentsOfFile:docFilePath];
}

// Write .plist file function
- (void)writePlistFileWithDictionary:(NSDictionary *)source {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = (paths.count) ? [paths objectAtIndex:0] : nil;
    NSString *docFilePath = [basePath stringByAppendingPathComponent:plistFileName];
    [source writeToFile:docFilePath atomically:YES];
}


// Read Array Value From .plist resource
- (NSArray *)getArrayWithKey:(NSString *)key {
    if (fileError == nil) {
        if (key != nil) {
            NSDictionary *fileDictionary = [self readPlistFile];
            return (fileDictionary.count) ? [[fileDictionary valueForKey:key] mutableCopy] : nil;
        }
        NSLog(@"Error: Null parameters not acceptable");
    }
    return nil;
}

// Read Dictionary Value From .plist resource
- (NSDictionary *)getDictionaryWithKey:(NSString *)key {
    if (fileError == nil) {
        if (key != nil) {
            NSDictionary *fileDictionary = [self readPlistFile];
            return (fileDictionary.count) ? [[fileDictionary valueForKey:key] mutableCopy] : nil;
        }
        NSLog(@"Error: Null parameters not acceptable");
    }
    return nil;
}

// Read Boolean Value From .plist resource
- (Boolean)getBooleanWithKey:(NSString *)key {
    if (fileError == nil) {
        if (key != nil) {
            NSDictionary *fileDictionary = [self readPlistFile];
            if (fileDictionary.count) {
                return [[fileDictionary valueForKey:key] integerValue] ? true : false;
            }
        }
        NSLog(@"Error: Null parameters not acceptable");
    }
    return false;
}

// Read Data Value From .plist resource
- (NSData *)getDataWithKey:(NSString *)key {
    if (fileError == nil) {
        if (key != nil) {
            NSDictionary *fileDictionary = [self readPlistFile];
            return (fileDictionary.count) ? [fileDictionary valueForKey:key] : nil;
        }
        NSLog(@"Error: Null parameters not acceptable");
    }
    return nil;
}

// Read Date Value From .plist resource
- (NSDate *)getDateWithKey:(NSString *)key {
    if (fileError == nil) {
        if (key != nil) {
            NSDictionary *fileDictionary = [self readPlistFile];
            return (fileDictionary.count) ? [fileDictionary valueForKey:key] : nil;
        }
        NSLog(@"Error: Null parameters not acceptable");
    }
    return nil;
}

// Read Number Value From .plist resource
- (NSNumber *)getNumberWithKey:(NSString *)key {
    if (fileError == nil) {
        if (key != nil) {
            NSDictionary *fileDictionary = [self readPlistFile];
            return (fileDictionary.count) ? [fileDictionary valueForKey:key] : nil;
        }
        NSLog(@"Error: Null parameters not acceptable");
    }
    return nil;
}

// Read String Value From .plist resource
- (NSString *)getStringWithKey:(NSString *)key {
    if (fileError == nil) {
        if (key != nil) {
            NSDictionary *fileDictionary = [self readPlistFile];
            return (fileDictionary.count) ? [fileDictionary valueForKey:key] : nil;
        }
        NSLog(@"Error: Null parameters not acceptable");
    }
    return nil;
}

// Write Array Value to .plist resource
- (BOOL)setArray:(NSArray *)value withKey:(NSString *)key {
    if (fileError == nil) {
        if (key != nil && value != nil) {
            NSMutableDictionary *fileDictionary = [[self readPlistFile] mutableCopy];
            [fileDictionary setObject:[NSString stringWithFormat:@"%@",value] forKey:key];
            [self writePlistFileWithDictionary:fileDictionary];
            return true;
        }
        NSLog(@"Error: Null parameters not acceptable");
    }
    return false;
}

// Write Dictionary Value to .plist resource
- (BOOL)setDictionary:(NSDictionary *)value withKey:(NSString *)key {
    if (fileError == nil) {
        if (key != nil && value != nil) {
            NSMutableDictionary *fileDictionary = [[self readPlistFile] mutableCopy];
            [fileDictionary setObject:[NSString stringWithFormat:@"%@",value] forKey:key];
            [self writePlistFileWithDictionary:fileDictionary];
            return true;
        }
        NSLog(@"Error: Null parameters not acceptable");
    }
    return false;
}

// Write Boolean Value to .plist resource
- (BOOL)setBoolean:(Boolean)value withKey:(NSString *)key {
    if (fileError == nil) {
        if (key != nil) {
            NSMutableDictionary *fileDictionary = [[self readPlistFile] mutableCopy];
            [fileDictionary setObject:[NSNumber numberWithBool:value] forKey:key];
            [self writePlistFileWithDictionary:fileDictionary];
            return true;
        }
        NSLog(@"Error: Null parameters not acceptable");
    }
    return false;
}

// Write Data Value to .plist resource
- (BOOL)setData:(NSData *)value withKey:(NSString *)key {
    if (fileError == nil) {
        if (key != nil) {
            NSMutableDictionary *fileDictionary = [[self readPlistFile] mutableCopy];
            [fileDictionary setObject:value forKey:key];
            [self writePlistFileWithDictionary:fileDictionary];
            return true;
        }
        NSLog(@"Error: Null parameters not acceptable");
    }
    return false;
}

// Write Date Value to .plist resource
- (BOOL)setDate:(NSDate *)value withKey:(NSString *)key {
    if (fileError == nil) {
        if (key != nil) {
            NSMutableDictionary *fileDictionary = [[self readPlistFile] mutableCopy];
            [fileDictionary setObject:value forKey:key];
            [self writePlistFileWithDictionary:fileDictionary];
            return true;
        }
        NSLog(@"Error: Null parameters not acceptable");
    }
    return false;
}

// Write Number Value to .plist resource
- (BOOL)setNumber:(NSNumber *)value withKey:(NSString *)key {
    if (fileError == nil) {
        if (key != nil) {
            NSMutableDictionary *fileDictionary = [[self readPlistFile] mutableCopy];
            [fileDictionary setObject:value forKey:key];
            [self writePlistFileWithDictionary:fileDictionary];
            return true;
        }
        NSLog(@"Error: Null parameters not acceptable");
    }
    return false;
}

// Write String Value to .plist resource
- (BOOL)setString:(NSString *)value withKey:(NSString *)key {
    if (fileError == nil) {
        if (key != nil && value != nil) {
            NSMutableDictionary *fileDictionary = [[self readPlistFile] mutableCopy];
            [fileDictionary setObject:value forKey:key];
            [self writePlistFileWithDictionary:fileDictionary];
            return true;
        }
        NSLog(@"Error: Null parameters not acceptable");
    }
    return false;
}





@end
