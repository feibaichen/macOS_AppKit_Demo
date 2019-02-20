
/**
 *  弱引用与强引用
 */
#define WEAKSELF __weak __typeof(self)weakSelf=self
#define STRONGSELF __strong __typeof(weakSelf)strongSelf=weakSelf


/* API 主接口  */
#define URL_img  @"http://userphoto/"

