@import <Ratatosk/WLRemoteTransformers.j>
@import "User.j"

@implementation Page : WLRemoteObject
{
    CPString    pk              @accessors;
    CPString    uuid            @accessors;
    CPString    projectURI      @accessors;
    CPNumber    imageFileSize   @accessors;
    CPNumber    compatFileSize  @accessors;
    CPString    pageName        @accessors;
    CPString    pageImage       @accessors;
    CPString    pageOrder       @accessors;
    CPString    smallThumbURL   @accessors;
    CPString    mediumThumbURL  @accessors;
    CPString    largeThumbURL   @accessors;
    CPDate      created         @accessors;
    CPDate      updated         @accessors;
    User        creator         @accessors;
    BOOL        processed       @accessors;
}

+ (CPArray)remoteProperties
{
    return [
        ['pk', 'url'],
        ['uuid', 'uuid'],
        ['projectURI', 'project'],
        ['pageName', 'name'],
        ['imageFileSize', 'image_file_size', nil, true],
        ['compatFileSize', 'compat_image_file_size', nil, true],
        ['pageImage', 'page_image'],
        ['pageOrder', 'page_order'],
        ['smallThumbURL', 'small_thumb_url', nil, true],
        ['mediumThumbURL', 'medium_thumb_url', nil, true],
        ['largeThumbURL', 'large_thumb_url', nil, true],
        ['created', 'created', [[WLDateTransformer alloc] init], true],
        ['updated', 'updated', [[WLDateTransformer alloc] init], true],
        ['creator', 'creator', [WLForeignObjectTransformer forObjectClass:User]],
        ['processed', 'processed', nil, true]
    ];
}

- (CPString)remotePath
{
    if ([self pk])
        return [self pk]
    else
        return @"/pages/";
}
@end
