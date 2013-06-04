@import <Ratatosk/WLRemoteObject.j>
@import "Result.j"
@import "Page.j"

@implementation RunJob : WLRemoteObject
{
    CPString    pk          @accessors;
    CPString    jobName     @accessors;
    CPNumber    sequence    @accessors;
    CPNumber    status      @accessors;
    BOOL        needsInput  @accessors;
    CPArray     jobSettings @accessors;
    CPArray     result      @accessors;
    // this uses a simplified page object instead of the full one via Ratatosk. It's just the page name and url.
    JSObject    page        @accessors;
    CPDate      created     @accessors;
    CPDate      updated     @accessors;
}

+ (CPArray)remoteProperties
{
    return [
        ['pk', 'url', nil, true],
        ['jobName', 'job_name'],
        ['sequence', 'sequence'],
        ['status', 'status'],
        ['needsInput', 'needs_input'],
        ['result', 'result', [WLForeignObjectsTransformer forObjectClass:Result]],
        ['page', 'page', [WLForeignObjectTransformer forObjectClass:Page]],
        ['created', 'created', [[WLDateTransformer alloc] init], true],
        ['updated', 'updated', [[WLDateTransformer alloc] init], true]
    ];
}


/**
 * Returns the last component of the pk URL, which is the UUID of the RunJob.
 * If pk is nil, returns nil.
 */
- (CPString)getUUID
{
    var runJobUUID = nil;
    if ([self pk])
    {
        runJobUUID = [pk lastPathComponent];
    }
    return runJobUUID;
}


- (CPString)remotePath
{
    if ([self pk])
    {
        return [self pk]
    }
    else
    {
        return @"/runjobs/";
    }
}

@end
