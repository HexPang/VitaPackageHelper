//
//  VitaPackageHelper.m
//  VitaPackageHelper
//
//  Created by Hex Pang on 16/9/2.
//  Copyright © 2016年 HexPang. All rights reserved.
//

#import "VitaPackageHelper.h"

@implementation VitaPackageHelper

- (NSArray *) loadPackage:(NSString*)path{
    NSMutableArray *packages = [[NSMutableArray alloc]init];
    NSFileManager *fm = [[NSFileManager alloc]init];
    NSError *err;
    NSArray *files = [fm contentsOfDirectoryAtURL:[NSURL URLWithString:path] includingPropertiesForKeys:nil options:0 error:&err];
    for (NSURL *fileUrl in files) {
        NSString *file = [fileUrl absoluteString];
        NSString *ext = [[file pathExtension] lowercaseString];
        BOOL isDir = NO;
    
        BOOL ahaha = [fm fileExistsAtPath:file isDirectory:&isDir];
        if(isDir){
            //目录处理，继续便利!
            NSLog(@"IS DIR %@",file);
            NSArray *packs = (NSArray *)[self loadPackage:file];
            NSLog(@"AH:%@",packs);
            [packages addObjectsFromArray:packs];
        }
        if([ext isEqualToString:@"vpk"]){
            [packages addObject:file];
        }
    }
    
    return packages;
//    NSLog(@"%@",files);
}
//
//- (NSDictionary *) loadSFO:(NSString*) package{
//    
//}

@end
