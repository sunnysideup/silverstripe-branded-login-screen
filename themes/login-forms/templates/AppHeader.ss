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
</style>

<p>
    <% if $SiteConfig.LoginScreenLogo %>
    <a href="/">
        <img src="$SiteConfig.LoginScreenLogo.URL" alt="Logo" width="240">
    </a>
    <% end_if %>
</p>

