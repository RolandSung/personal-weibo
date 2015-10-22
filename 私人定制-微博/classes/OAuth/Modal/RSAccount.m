//
//  RSAccount.m
//  私人定制-微博
//
//  Created by imac on 15/10/19.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSAccount.h"
#import "MJExtension.h"

#define RSAccountTokenKey @"token"
#define RSUidKey @"uid"
#define RSExpires_inKey @"exoires"
#define RSExpires_dateKey @"date"

@implementation RSAccount
// 底层便利当前的类的所有属性，一个一个归档和接档
MJCodingImplementation
+(instancetype)accountWithDictionary:(NSDictionary *)dic{
    RSAccount *account = [[RSAccount alloc]init];
    
    [account setValuesForKeysWithDictionary:dic];
    
    return account;
    
}
-(void)setExpires_in:(NSString *)expires_in{
    _expires_in = expires_in;
    
    _expires_date = [NSDate dateWithTimeIntervalSinceNow:[_expires_in longLongValue]];
}

//#pragma mark - NSCoding
//// 归档的时候调用：告诉系统哪个属性需要归档，如何归档
//- (void)encodeWithCoder:(NSCoder *)aCoder
//{
//    [aCoder encodeObject:_access_token forKey:RSAccountTokenKey];
//    [aCoder encodeObject:_expires_in forKey:RSExpires_inKey];
//    [aCoder encodeObject:_uid forKey:RSUidKey];
//    [aCoder encodeObject:_expires_date forKey:RSExpires_dateKey];
//}
//
//// 解档的时候调用：告诉系统哪个属性需要解档，如何解档
//
//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//    if (self = [super init]) {
//        
//        // 一定要记得赋值
//        _access_token =  [aDecoder decodeObjectForKey:RSAccountTokenKey];
//        _expires_in = [aDecoder decodeObjectForKey:RSExpires_inKey];
//        _uid = [aDecoder decodeObjectForKey:RSUidKey];
//        _expires_date = [aDecoder decodeObjectForKey:RSExpires_dateKey];
//    }
//    return self;
//}

@end
