EasyPlistEditor is a class that create to insert custom .plist file to your iOS project where will copy to application resource directory when the first time application run and access the custom .plist file anywhere from your application to read or write. the custom .plist file will remain on your application resource until the application remove from device or reset the device. You can create NSArray, NSDictonary, Boolean, Data, Date, NSNumber, NSString variables within your custom .plist file and assign, use NSArray, NSDictonary, Boolean, Data, Date, NSNumber, NSString values anywhere your application.

To create your custom “.plist” file please follow this steps

1. Create a “.plist” inside your project folder or copy the “SampleService-Info.plist” file your project folder where your project “Info.plist” contain and include (Drag and drop to XCode project) “.plist” files to your project.

2. Copy “EasyPlistEditor.h” and “EasyPlistEditor.m” files to your project folder and include (Drag and drop to XCode project) both files to your project.

3. Import “EasyPlistEditor.h” file to your class or ViewController.

	Ex: 
	   
	    #import "EasyPlistEditor.h"

4. Make a global object using EasyPlistEditor class

	Ex: 

	    @implementation YourViewController {
		    EasyPlistEditor *easyPlistEditor;
	    }

5. Initiate an object of EasyPlistEditor class using your custom “.plist” name

	Ex: 
	
	    easyPlistEditor = [[EasyPlistEditor alloc] initWithName:@"SampleService-Info"]; // SampleService-Info is the custom “.plist” file name in sample project

	Note: if you use EasyPlistEditor for a view controller, Please Initiate your object inside viewDidLoad method

	Ex: 
	
	   - (void)viewDidLoad {
    		[super viewDidLoad];
    		// Init an object of EasyPlistEditor class
    		easyPlistEditor = [[EasyPlistEditor alloc] initWithName:@"SampleService-Info"];  // SampleService-Info is the custom “.plist” file name in sample project
	   }


************************* Read to custom “.plist” file **********************************

Use following methods to read values from your custom “.plist” file

	// Read Array value form .plist file
	// - (NSArray *)getArrayWithKey:(NSString *)key;

    	Ex: NSArray *value = [easyPlistEditor getArrayWithKey:@"SampleArrayVariable"]; // SampleArrayVariable is a declared NSArray variable within SampleService-Info where use in sample project

	// Read Dictionary value form .plist file
	// - (NSDictionary *)getDictionaryWithKey:(NSString *)key;

    	Ex: NSDictionary *value = [easyPlistEditor getDictionaryWithKey:@"SampleDictonaryVariable"]; // SampleDictonaryVariable is a declared NSDictionary variable within SampleService-Info where use in sample project

	// Read Boolean value form .plist file
	// - (Boolean)getBooleanWithKey:(NSString *)key;

    	Ex: BOOL *value = [easyPlistEditor getBooleanWithKey:@"SampleBooleanVariable"]; // SampleBooleanVariable is a declared Boolean variable within SampleService-Info where use in sample project

	// Read NSData value form .plist file
	// - (NSData *)getDataWithKey:(NSString *)key;

    	Ex: NSData *value = [easyPlistEditor getDataWithKey:@"SampleDataVariable"]; // SampleDataVariable is a declared NSData variable within SampleService-Info where use in sample project

	// Read NSDate value form .plist file
	// - (NSDate *)getDateWithKey:(NSString *)key;

    	Ex: NSDate *value = [easyPlistEditor getDateWithKey:@"SampleDateVariable"]; // SampleDateVariable is a declared NSDate variable within SampleService-Info where use in sample project

	// Read NSNumber value form .plist file
	// - (NSNumber *)getNumberWithKey:(NSString *)key;

    	Ex: NSNumber *value = [easyPlistEditor getNumberWithKey:@"SampleNumberVariable"]; // SampleNumberVariable is a declared NSNumber variable within SampleService-Info where use in sample project

	// Read NSString value form .plist file
	// - (NSString *)getStringWithKey:(NSString *)key;

    	Ex: NSString *value = [easyPlistEditor getStringWithKey:@"SampleStringVariable"]; // SampleStringVariable is a declared NSString variable within SampleService-Info where use in sample project

*****************************************************************************************

************************* Write to custom “.plist” file *********************************

	// Write to NSArray variable in .plist file
	// - (BOOL)setArray:(NSArray *)value withKey:(NSString *)key;

    	Ex: NSArray *sampleValueArray = @[@"SampleValueChange_1", @"SampleValueChange_2", @"SampleValueChange_3"];
    	    BOOL arrayStatues = [easyPlistEditor setArray:sampleValueArray withKey:@"SampleArrayVariable"];
    	    if (arrayStatues) {
        	NSLog(@"Array value successfully set to .plist file");
    	    } 

	// SampleArrayVariable is a declared NSArray variable within SampleService-Info where use in sample project


	
	// Write to NSDictionary variable in .plist file
	// - (BOOL)setDictionary:(NSDictionary *)value withKey:(NSString *)key;

    	Ex: NSMutableDictionary *SampleValueMutableDictionary = [[NSMutableDictionary alloc] init];
    		[SampleValueMutableDictionary setObject:@"SampleValueChange_1" forKey:@"SampleKey_1"];
    		[SampleValueMutableDictionary setObject:@"SampleValueChange_2" forKey:@"SampleKey_2"];
    		[SampleValueMutableDictionary setObject:@"SampleValueChange_3" forKey:@"SampleKey_3"];
    		BOOL dictionaryStatues = [easyPlistEditor setDictionary:SampleValueMutableDictionary withKey:@"SampleDictonaryVariable"];
    		if (dictionaryStatues) {
        		NSLog(@"Dictionary value successfully set to .plist file");
    		} 

	// SampleDictonaryVariable is a declared NSDictionary variable within SampleService-Info where use in sample project



	// Write to Boolean variable in .plist file
	// - (BOOL)setBoolean:(Boolean)value withKey:(NSString *)key;

    	Ex: BOOL booleanStatues = [easyPlistEditor setBoolean:true withKey:@"SampleBooleanVariable"];
    		if (booleanStatues) {
        		NSLog(@"Boolean Value successfully set to .plist file");
    		}

	// SampleBooleanVariable is a declared Boolean variable within SampleService-Info where use in sample project



	// Write to NSData variable in .plist file
	// - (BOOL)setData:(NSData *)value withKey:(NSString *)key;

    	Ex: NSData *SampleData = [NSData dataWithBytes:(unsigned char[]){0x0F} length:1];
    		BOOL dataStatues = [easyPlistEditor setData:SampleData withKey:@"SampleDataVariable"];
    		if (dataStatues) {
        		NSLog(@"Data Value successfully set to .plist file");
    		}

	// SampleDataVariable is a declared NSData variable within SampleService-Info where use in sample project



	// Write to NSDate variable in .plist file
	// - (BOOL)setDate:(NSDate *)value withKey:(NSString *)key;

    	Ex: BOOL dateStatues = [easyPlistEditor setDate:[NSDate date] withKey:@"SampleDateVariable"];
    		if (dateStatues) {
        		NSLog(@"Date Value successfully set to .plist file");
    		}

	// SampleDateVariable is a declared NSDate variable within SampleService-Info where use in sample project


	
	// Write to NSNumber variable in .plist file
	// - (BOOL)setNumber:(NSNumber *)value withKey:(NSString *)key;

    	Ex: BOOL numberStatues = [easyPlistEditor setNumber:[NSNumber numberWithInt:10] withKey:@"SampleNumberVariable"];
    		if (numberStatues) {
       			NSLog(@"Number Value successfully set to .plist file");
    		}

	// SampleNumberVariable is a declared NSNumber variable within SampleService-Info where use in sample project



	// Write to NSString variable in .plist file
	// - (BOOL)setString:(NSString *)value withKey:(NSString *)key;

    	Ex: BOOL stringStatues = [easyPlistEditor setString:@“Sample Value” withKey:@"SampleStringVariable"];
    		if (stringStatues) {
       			NSLog(@"String Value successfully set to .plist file");
    		}

	// SampleStringVariable is a declared NSString variable within SampleService-Info where use in sample project

*****************************************************************************************

Created by Nadeeshan Jayawardana (NEngineering).
