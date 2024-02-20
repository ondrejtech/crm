<?php

namespace App\Filament\Resources\ParentCategoryResource\Pages;

use App\Filament\Resources\ParentCategoryResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditParentCategory extends EditRecord
{
    protected static string $resource = ParentCategoryResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }

    protected function getRedirectUrl(): ?string
    {
        return $this->getResource()::getUrl('index');
    }

    protected function getSavedNotificationTitle(): ?string
    {
        return 'Category has been successfully updated';
    }
}
