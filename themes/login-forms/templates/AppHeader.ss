<style>
:root {
    <% if $SiteConfig.LoginScreenBackgroundColor %>--color-page-background: #$SiteConfig.LoginScreenBackgroundColor;<% end_if %>
    <% if $SiteConfig.LoginScreenBoxColor %>--color-form-background: #$SiteConfig.LoginScreenBoxColor;<% end_if %>
    <% if $SiteConfig.LoginScreenBoxColor %>--color-form-background-lighter: #{$SiteConfig.LoginScreenBoxColor}33;<% end_if %>
    <% if $SiteConfig.LoginScreenTextColor %>--color-form-text: #$SiteConfig.LoginScreenTextColor;<% end_if %>
    <% if $SiteConfig.LoginScreenLinkColor %>--color-link-primary: #$SiteConfig.LoginScreenLinkColor;<% end_if %>
    <% if $SiteConfig.LoginScreenButtonColor %>--color-button-primary-background: #$SiteConfig.LoginScreenButtonColor;<% end_if %>
    <% if $SiteConfig.LoginScreenButtonColor %>--color-button-primary-background-lighter: #{$SiteConfig.LoginScreenButtonColor}33;<% end_if %>
    <% if $SiteConfig.LoginScreenButtonColor %>--color-button-primary-background-lightest: #{$SiteConfig.LoginScreenButtonColor}11;<% end_if %>
    <% if $SiteConfig.LoginScreenButtonHoverColor %>--color-button-primary-hover-background: #$SiteConfig.LoginScreenButtonHoverColor;<% end_if %>
    <% if $SiteConfig.LoginScreenButtonTextColor %>--color-button-primary-text: #$SiteConfig.LoginScreenButtonTextColor;<% end_if %>
    <% if $SiteConfig.LoginScreenButtonTextHoverColor %>--color-button-primary-hover-text: #$SiteConfig.LoginScreenButtonTextHoverColor;<% end_if %>
}

body {
    justify-content: flex-start!important;
    padding-top: 10vh;
}

main.login-form {
    width: 550px;
    max-width: 100%;
    .message {
        padding: 1rem 0;
        margin-bottom: 1rem;
        font-weight: bold;
    }
    h1, h2 {
        color: var(--color-form-text);
        padding-bottom: 1rem;
        text-align: center;
        width: 100%;
    }
    > ul {
        list-style: none;
        padding: 0;
        display: flex;
        gap: 1rem;
        justify-content: flex-start;
        margin-bottom: 0rem;
        border-bottom: 2px solid var(--color-button-primary-background);
        padding-left: 0.5rem;
        padding-right: 0.5rem;
        padding-bottom: 0px;
        > li {
            text-align: center;
            > a {
                text-decoration: none;
                padding: 0.5rem 1rem;
                border-radius: 4px;
                display: inline-block;
                width: 100%;
                border-bottom-left-radius: 0;
                border-bottom-right-radius: 0;
                color: var(--color-form-text);
                background: var(--color-button-primary-background-lightest);
            }
            > a:hover {
                background: var(--color-button-primary-hover-background);
                text-decoration: none;
                color: var(--color-button-primary-hover-text);
            }
            > a.active {
                background: var(--color-button-primary-background);
                color: var(--color-button-primary-text);
            }
        }
    }
    > .form-tab {
        padding: 1rem;
        border: 2px solid var(--color-button-primary-background);
        border-top: none;
        border-radius: 0 0 8px 8px;
        background: var(--color-button-primary-background-lighter);
        > h3:first-child {
            display: none;
        }
    }
    p {
        max-width: var(--sizing-content-width);
        margin-left: auto;
        margin-right: auto;
    }
    form {
        max-width: var(--sizing-content-width);
        margin-left: auto;
        margin-right: auto;
        .field {
            .description {
                color: var(--color-form-text);
            }
        }
        label {
            color: var(--color-form-text);
        }
    }
    .login-form__content,
    form {
        margin-left: auto;
        margin-right: auto;
    }

}
</style>

<p>
    <% if $SiteConfig.LoginScreenLogo %>
    <a href="/">
        <img src="$SiteConfig.LoginScreenLogo.URL" alt="Logo" width="240">
    </a>
    <% end_if %>
</p>

