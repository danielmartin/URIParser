//
//  AppDelegate.m
//  URIParser
//
//  Created by Daniel Martín on 4/24/13.
//  Copyright (c) 2013 Daniel Martín. All rights reserved.
//

#import <URIParser/URIParser.h>
#import "AppDelegate.h"
#import "NSTextField+Blank.h"

@implementation AppDelegate

@synthesize URITextField, resultsTextView;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (void)appendTextToResults:(NSString *)text
{
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:text];
    NSTextStorage *storage = [self.resultsTextView textStorage];
    [storage beginEditing];
    [storage appendAttributedString:string];
    [storage endEditing];
}

- (IBAction)parse:(id)sender {
    [self.resultsTextView setString:@""];
    
    if ([self.URITextField isBlank]) {
        [self appendTextToResults:@"Please, enter a URI in the text field."];
        return;
    }
    // Create a URIParser object with the input URI as constructor parameter
    URIParser *uriParser = new URIParser(string([self.URITextField.stringValue UTF8String]));
    const URI *resultURI = uriParser->parse();
    if (resultURI) {
        string schemeName = resultURI->getSchemeName();
        if (!schemeName.empty()) {
            NSString *schemeString = [NSString stringWithFormat:@"Scheme: %@\n", [NSString stringWithUTF8String:schemeName.c_str()]];
            [self appendTextToResults:schemeString];
        }
        string authorityName = resultURI->getAuthority();
        if (!authorityName.empty()) {
            NSString *authorityString = [NSString stringWithFormat:@"Authority: %@\n", [NSString stringWithUTF8String:authorityName.c_str()]];
            [self appendTextToResults:authorityString];
        }
        string credentialsName = resultURI->getCredentials();
        if (!credentialsName.empty()) {
            NSString *credentialsString = [NSString stringWithFormat:@"Credentials: %@\n", [NSString stringWithUTF8String:credentialsName.c_str()]];
            [self appendTextToResults:credentialsString];
        }
        string destinationName = resultURI->getDestination();
        if (!destinationName.empty()) {
            NSString *destinationString = [NSString stringWithFormat:@"Destination: %@\n", [NSString stringWithUTF8String:destinationName.c_str()]];
            [self appendTextToResults:destinationString];
        }
        string user = resultURI->getUser();
        if (!user.empty()) {
            NSString *userString = [NSString stringWithFormat:@"User: %@\n", [NSString stringWithUTF8String:user.c_str()]];
            [self appendTextToResults:userString];
        }
        string password = resultURI->getPassword();
        if (!password.empty()) {
            NSString *passwordString = [NSString stringWithFormat:@"Password: %@\n", [NSString stringWithUTF8String:password.c_str()]];
            [self appendTextToResults:passwordString];
        }
        string host = resultURI->getHost();
        if (!host.empty()) {
            NSString *hostString = [NSString stringWithFormat:@"Host: %@\n", [NSString stringWithUTF8String:host.c_str()]];
            [self appendTextToResults:hostString];
        }
        string port = resultURI->getPort();
        if (!port.empty()) {
            NSString *portString = [NSString stringWithFormat:@"Port: %@\n", [NSString stringWithUTF8String:port.c_str()]];
            [self appendTextToResults:portString];
        }
        string path = resultURI->getPath();
        if (!path.empty()) {
            NSString *pathString = [NSString stringWithFormat:@"Path: %@\n", [NSString stringWithUTF8String:path.c_str()]];
            [self appendTextToResults:pathString];
        }
        string queryString = resultURI->getQueryString();
        if (!queryString.empty()) {
            NSString *qsString = [NSString stringWithFormat:@"Query String: %@\n", [NSString stringWithUTF8String:queryString.c_str()]];
            [self appendTextToResults:qsString];
        }
        string fragmentID = resultURI->getFragmentIdentifier();
        if (!fragmentID.empty()) {
            NSString *fragmentIDString = [NSString stringWithFormat:@"Fragment ID: %@\n", [NSString stringWithUTF8String:fragmentID.c_str()]];
            [self appendTextToResults:fragmentIDString];
        }
        
    } else {
        [self appendTextToResults:@"The URI is not conformant to RFC."];
    }
}

@end
