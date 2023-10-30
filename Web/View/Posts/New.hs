module Web.View.Posts.New where
import Web.View.Prelude

data NewView = NewView
    { post :: Post
    , postWithDefault :: Post
    }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New Post, without default</h1>
        {renderForm post}

        <h1>New Post, with default</h1>
        {renderForm postWithDefault}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Posts" PostsAction
                , breadcrumbText "New Post"
                ]

renderForm :: Post -> Html
renderForm post = formFor post [hsx|
    {(textField #title)}
    {(selectField #postType values)}
    {submitButton}
|]
    where
        values = allEnumValues @PostType


instance CanSelect PostType where
    type SelectValue PostType = PostType
    selectValue value = value
    selectLabel = show