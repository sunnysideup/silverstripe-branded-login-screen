<style>
:root {
    <% if $SiteConfig.LoginScreenBackgroundColor %>--color-page-background: #$SiteConfig.LoginScreenBackgroundColor;<% end_if %>
    <% if $SiteConfig.LoginScreenBoxColor %>--color-form-background: #$SiteConfig.LoginScreenBoxColor;<% end_if %>
    <% if $SiteConfig.LoginScreenTextColor %>--color-form-text: #$SiteConfig.LoginScreenTextColor;<% end_if %>
    <% if $SiteConfig.LoginScreenLinkColor %>--color-link-primary: #$SiteConfig.LoginScreenLinkColor;<% end_if %>
    <% if $SiteConfig.LoginScreenButtonColor %>--color-button-primary-background: #$SiteConfig.LoginScreenButtonColor;<% end_if %>
    <% if $SiteConfig.LoginScreenButtonHoverColor %>--color-button-primary-hover-background: #$SiteConfig.LoginScreenButtonHoverColor;<% end_if %>
    <% if $SiteConfig.LoginScreenButtonTextColor %>--color-button-primary-text: #$SiteConfig.LoginScreenButtonTextColor;<% end_if %>
    <% if $SiteConfig.LoginScreenButtonTextHoverColor %>--color-button-primary-hover-text: #$SiteConfig.LoginScreenButtonTextHoverColor;<% end_if %>
}

main.login-form
    ul {
        list-style: none;
        padding: 0;
        display: flex;
        gap: 1rem;
        justify-content: flex-start;
        margin-bottom: 2rem;
        border-bottom: 2px solid var(--color-button-primary-background);
        padding-left: 0.5rem;
        padding-right: 0.5rem;
        padding-bottom: 1px;
    }

    ul li {
        text-align: center;
    }

    ul li a {
        text-decoration: none;
        padding: 0.5rem 1rem;
        border-radius: 4px;
        display: inline-block;
        width: 100%;
        border-bottom-left-radius: 0;
        border-bottom-right-radius: 0;
        background: #ccc;
        color: #555;
    }

    ul li a:hover {
        background: var(--color-button-primary-hover-background);
        text-decoration: none;
        color: var(--color-button-primary-hover-text);
    }
    ul li a.active {
        background: var(--color-button-primary-background);
        color: var(--color-button-primary-text);
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

