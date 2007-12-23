//
//  NSObject.m
//  RegexKit
//  http://regexkit.sourceforge.net/
//

/*
 Copyright © 2007, John Engelhart
 
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 
 * Neither the name of the Zang Industries nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/ 

#import <RegexKit/NSObject.h>
#import <RegexKit/RegexKitPrivate.h>

#define RKPCREDefaultOptions (RKCompileUTF8 | RKCompileNoUTF8Check)

@implementation NSObject (RegexKitAdditions)

- (BOOL)isMatchedByRegex:(id)aRegex
{
  return([[self description] isMatchedByRegex:aRegex]);
}

//
//  Matching Regex In Array methods
//

- (BOOL)isMatchedByAnyRegexInArray:(NSArray *)regexArray
{
  return([[RKSortedRegexCollection sortedRegexCollectionForCollection:regexArray library:RKRegexPCRELibrary options:RKPCREDefaultOptions error:NULL] regexMatching:self lowestIndexInCollection:NO] == NULL ? NO : YES);
}

- (RKRegex *)anyMatchingRegexInArray:(NSArray *)regexArray
{
  return([[RKSortedRegexCollection sortedRegexCollectionForCollection:regexArray library:RKRegexPCRELibrary options:RKPCREDefaultOptions error:NULL] regexMatching:self lowestIndexInCollection:NO]);
}

- (RKRegex *)firstMatchingRegexInArray:(NSArray *)regexArray
{
  return([[RKSortedRegexCollection sortedRegexCollectionForCollection:regexArray library:RKRegexPCRELibrary options:RKPCREDefaultOptions error:NULL] regexMatching:self lowestIndexInCollection:YES]);
}

- (BOOL)isMatchedByAnyRegexInArray:(NSArray *)regexArray library:(NSString *)libraryString options:(RKCompileOption)libraryOptions error:(NSError **)outError
{
  return([[RKSortedRegexCollection sortedRegexCollectionForCollection:regexArray library:libraryString options:libraryOptions error:outError] regexMatching:self lowestIndexInCollection:NO] == NULL ? NO : YES);
}

- (RKRegex *)anyMatchingRegexInArray:(NSArray *)regexArray library:(NSString *)libraryString options:(RKCompileOption)libraryOptions error:(NSError **)outError
{
  return([[RKSortedRegexCollection sortedRegexCollectionForCollection:regexArray library:libraryString options:libraryOptions error:outError] regexMatching:self lowestIndexInCollection:NO]);
}

- (RKRegex *)firstMatchingRegexInArray:(NSArray *)regexArray library:(NSString *)libraryString options:(RKCompileOption)libraryOptions error:(NSError **)outError
{
  return([[RKSortedRegexCollection sortedRegexCollectionForCollection:regexArray library:libraryString options:libraryOptions error:outError] regexMatching:self lowestIndexInCollection:YES]);
}

//
//  Matching Regex In Set methods
//

- (BOOL)isMatchedByAnyRegexInSet:(NSSet *)regexSet
{
  return([[RKSortedRegexCollection sortedRegexCollectionForCollection:regexSet library:RKRegexPCRELibrary options:RKPCREDefaultOptions error:NULL] regexMatching:self lowestIndexInCollection:NO] == NULL ? NO : YES);
}

- (RKRegex *)anyMatchingRegexInSet:(NSSet *)regexSet
{
  return([[RKSortedRegexCollection sortedRegexCollectionForCollection:regexSet library:RKRegexPCRELibrary options:RKPCREDefaultOptions error:NULL] regexMatching:self lowestIndexInCollection:NO]);
}

- (BOOL)isMatchedByAnyRegexInSet:(NSSet *)regexSet library:(NSString *)libraryString options:(RKCompileOption)libraryOptions error:(NSError **)outError
{
  return([[RKSortedRegexCollection sortedRegexCollectionForCollection:regexSet library:libraryString options:libraryOptions error:outError] regexMatching:self lowestIndexInCollection:NO] == NULL ? NO : YES);
}

- (RKRegex *)anyMatchingRegexInSet:(NSSet *)regexSet library:(NSString *)libraryString options:(RKCompileOption)libraryOptions error:(NSError **)outError
{
  return([[RKSortedRegexCollection sortedRegexCollectionForCollection:regexSet library:libraryString options:libraryOptions error:outError] regexMatching:self lowestIndexInCollection:NO]);
}

@end