//
// PGTSSchemaDescription.h
// BaseTen
//
// Copyright 2006-2010 Marko Karppinen & Co. LLC.
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import <Foundation/Foundation.h>
#import <BaseTen/libpq-fe.h>
#import <BaseTen/PGTSAbstractObjectDescription.h>


@class PGTSTableDescription;


@interface PGTSSchemaDescription : PGTSAbstractObjectDescription 
{
	NSDictionary *mTablesByName;
}
- (PGTSTableDescription *) tableNamed: (NSString *) name;
- (NSArray *) allTables;

//Thread un-safe methods.
- (void) setTables: (id <NSFastEnumeration>) tables;
@end