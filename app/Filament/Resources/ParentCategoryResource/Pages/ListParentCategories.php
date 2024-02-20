<?php

namespace App\Filament\Resources\ParentCategoryResource\Pages;

use App\Filament\Resources\ParentCategoryResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListParentCategories extends ListRecords
{
    protected static string $resource = ParentCategoryResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
