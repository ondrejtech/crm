<?php

namespace App\Filament\Resources\FileTypesResource\Pages;

use App\Filament\Resources\FileTypesResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditFileTypes extends EditRecord
{
    protected static string $resource = FileTypesResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
