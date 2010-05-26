//
// BXSystemEventNotifier.m
// BaseTen
//
// Copyright (C) 2010 Marko Karppinen & Co. LLC.
//
// Before using this software, please review the available licensing options
// by visiting http://www.karppinen.fi/baseten/licensing/ or by contacting
// us at sales@karppinen.fi. Without an additional license, this software
// may be distributed only in compliance with the GNU General Public License.
//
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License, version 2.0,
// as published by the Free Software Foundation.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
//
// $Id$
//

#import "BXSystemEventNotifier.h"
#import "BXIOKitSystemEventNotifier.h"
#import "BXProbes.h"

#import "../BaseTenAppKit/Sources/BXAppKitSystemEventNotifier.h"
Class BXAppKitSystemEventNotifierClass WEAK_IMPORT_ATTRIBUTE;



NSString * const kBXSystemEventNotifierProcessWillExitNotification = @"kBXSystemEventNotifierProcessWillExitNotification";
NSString * const kBXSystemEventNotifierSystemWillSleepNotification = @"kBXSystemEventNotifierSystemWillSleepNotification";
NSString * const kBXSystemEventNotifierSystemDidWakeNotification   = @"kBXSystemEventNotifierSystemDidWakeNotification";



@implementation BXSystemEventNotifier
+ (id) copyNotifier
{
	id retval = nil;
	if (BXAppKitSystemEventNotifierClass)
		retval = [BXAppKitSystemEventNotifierClass copyNotifier];
	else
		retval = [BXIOKitSystemEventNotifier copyNotifier];
	
	return retval;
}


- (void) install
{
}


- (void) invalidate
{
}


- (void) processWillExit
{
	BASETEN_BEGIN_EXIT_PREPARATION ();
	NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
	[nc postNotificationName: kBXSystemEventNotifierProcessWillExitNotification object: self];
	BASETEN_END_EXIT_PREPARATION ();
}


- (void) systemWillSleep
{
	BASETEN_BEGIN_SLEEP_PREPARATION ();
	NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
	[nc postNotificationName: kBXSystemEventNotifierSystemWillSleepNotification object: self];
	BASETEN_END_SLEEP_PREPARATION ();
}


- (void) systemDidWake
{
	BASETEN_BEGIN_WAKE_PREPARATION ();
	NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
	[nc postNotificationName: kBXSystemEventNotifierSystemDidWakeNotification object: self];
	BASETEN_END_WAKE_PREPARATION ();
}
@end