<?php

namespace Sunnysideup\BrandedLoginScreen;

use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\FieldGroup;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Core\Extension;
use TractorCow\Colorpicker\Forms\ColorField;

class SiteConfigExtension extends Extension
{
    private static array $db = [
        'LoginScreenBackgroundColor' => 'Varchar(8)',
        'LoginScreenBoxColor' => 'Varchar(8)',
        'LoginScreenTextColor' => 'Varchar(8)',
        'LoginScreenLinkColor' => 'Varchar(8)',
        'LoginScreenButtonColor' => 'Varchar(8)',
        'LoginScreenButtonHoverColor' => 'Varchar(8)',
        'LoginScreenButtonTextColor' => 'Varchar(8)',
        'LoginScreenButtonTextHoverColor' => 'Varchar(8)',
        'LoginFooterContent' => 'HTMLText',
    ];

    private static array $has_one = [
        'LoginScreenLogo' => Image::class,
    ];

    private static array $defaults = [
        'LoginScreenBackgroundColor' => 'F7F8FA',
        'LoginScreenBoxColor' => 'FFFFFF',
        'LoginScreenTextColor' => '43536D',
        'LoginScreenLinkColor' => '0071C4',
        'LoginScreenButtonColor' => '008A00',
        'LoginScreenButtonHoverColor' => '006400',
        'LoginScreenButtonTextColor' => 'FFFFFF',
        'LoginScreenButtonTextHoverColor' => 'FFFFFF',
    ];

    private static $owns = [
        'LoginScreenLogo',
    ];

    public function updateCMSFields(FieldList $fields)
    {
        $fields->findOrMakeTab('Root.LoginScreen', 'Login Screen Settings');
        $defaults = $this->getOwner()->config()->get('defaults');
        $fields->addFieldsToTab(
            'Root.LoginScreen',
            [
                UploadField::create('LoginScreenLogo', 'Login Screen Logo')
                    ->setAllowedFileCategories('image')
                    ->setAllowedMaxFileNumber(1),
                FieldGroup::create(
                    'Login Screen Colors',
                    ColorField::create('LoginScreenBackgroundColor', 'Background Color')
                        ->setDescription('Default: #' . $defaults['LoginScreenBackgroundColor']),
                ),
                FieldGroup::create(
                    'Login Screen Colors2',
                    ColorField::create('LoginScreenBoxColor', 'Box Color')
                        ->setDescription('Default: #' . $defaults['LoginScreenBoxColor']),
                    ColorField::create('LoginScreenTextColor', 'Text Color')
                        ->setDescription('Default: #' . $defaults['LoginScreenTextColor']),
                    ColorField::create('LoginScreenLinkColor', 'Link Color')
                        ->setDescription('Default: #' . $defaults['LoginScreenLinkColor']),
                ),
                FieldGroup::create(
                    'Login Screen Colors3',
                    ColorField::create('LoginScreenButtonColor', 'Button Color')
                        ->setDescription('Default: #' . $defaults['LoginScreenButtonColor']),
                    ColorField::create('LoginScreenButtonTextColor', 'Button Text Color')
                        ->setDescription('Default: #' . $defaults['LoginScreenButtonTextColor']),
                    ColorField::create('LoginScreenButtonHoverColor', 'Hover Button Color')
                        ->setDescription('Default: #' . $defaults['LoginScreenButtonHoverColor']),
                    ColorField::create('LoginScreenButtonTextHoverColor', 'Hover Button Text Color')
                        ->setDescription('Default: #' . $defaults['LoginScreenButtonTextHoverColor']),
                ),
                HTMLEditorField::create(
                    'LoginFooterContent',
                    'Footer Content',
                )->setDescription('Content displayed at the bottom of the login screen.'),
            ]
        );
    }
}
