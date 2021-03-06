//
//  WSKService.m
//  WebServiceKit
//
//  Created by Geoffrey Foster on 11-04-16.
//  Copyright 2011 g-Off.net. All rights reserved.
//

#import "WSKService.h"
#import "WSKRequest.h"

#define kWSKOperationQueueName @"net.g-Off.WebServiceKit"

@implementation WSKService

- (id)init
{
	if ((self = [super init])) {
		requestQueue = [[NSOperationQueue alloc] init];
		[requestQueue setName:kWSKOperationQueueName];
		[requestQueue setMaxConcurrentOperationCount:NSOperationQueueDefaultMaxConcurrentOperationCount];
	}
	
	return self;
}

- (void)dealloc
{
	[requestQueue release];
	
	[super dealloc];
}

- (void)sendRequest:(WSKRequest *)aRequest
{
	[requestQueue addOperation:aRequest];
}

- (void)performRequest:(WSKRequest *)request
{
	[self sendRequest:request];
}

- (void)performRequest:(WSKRequest *)request target:(id)aTarget action:(SEL)anAction
{
	
}

- (void)performRequest:(WSKRequest *)request delegate:(id)aDelegate
{
	
}

- (void)performRequest:(WSKRequest *)request withResponseHandler:(void (^)(WSKResponse *response))handler
{
	[request setResponseHandler:handler];
	[self sendRequest:request];
}

@end
