<?php

namespace Sunnysideup\BrandedLoginScreen;

use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\FieldGroup;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\ORM\DataExtension;
use TractorCow\Colorpicker\Forms\ColorField;

class SiteConfigExtension extends DataExtension
{
    private static array $db = [
        'LoginScreenBackgroundColor' => 'Varchar(7)',
        'LoginScreenBoxColor' => 'Varchar(7)',
        'LoginScreenTextColor' => 'Varchar(7)',
        'LoginScreenLinkColor' => 'Varchar(7)',
        'LoginScreenButtonColor' => 'Varchar(7)',
        'LoginScreenButtonHoverColor' => 'Varchar(7)',
        'LoginScreenButtonTextColor' => 'Varchar(7)',
        'LoginScreenButtonTextHoverColor' => 'Varchar(7)',
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

    public function updateCMSFields(FieldList $fields)
    {
        $fields->findOrMakeTab('Root.LoginScreen', 'Login Screen Settings');
        $fields->addFieldsToTab(
            'Root.LoginScreen',
            [
                UploadField::create('LoginScreenLogo', 'Login Screen Logo')
                    ->setAllowedFileCategories('image')
                    ->setAllowedMaxFileNumber(1),
                FieldGroup::create(
                    'Login Screen Colors',
                    ColorField::create('LoginScreenBackgroundColor', 'Background Color'),
                    ColorField::create('LoginScreenBoxColor', 'Box Color'),
                    ColorField::create('LoginScreenTextColor', 'Text Color'),
                    ColorField::create('LoginScreenLinkColor', 'Link Color'),
                    ColorField::create('LoginScreenButtonColor', 'Button Color'),
                    ColorField::create('LoginScreenButtonTextColor', 'Button Text Color'),
                    ColorField::create('LoginScreenButtonHoverColor', 'Hover Button Text Color'),
                    ColorField::create('LoginScreenButtonTextHoverColor', 'Hover Button Text Color'),
                ),
                HTMLEditorField::create(
                    'LoginFooterContent',
                    'Footer Content',
                )->setDescription('Content displayed at the bottom of the login screen.'),
            ]
        );
    }
}