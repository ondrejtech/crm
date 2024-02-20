<?php

namespace App\Filament\Resources\ParentCategoryResource\Pages;

use App\Filament\Resources\ParentCategoryResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateParentCategory extends CreateRecord
{
    protected static string $resource = ParentCategoryResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }

    protected function getCreatedNotificationTitle(): ?string
    {
        return 'Category has been successfully created';
    }
}
