<?php

namespace App\Filament\Resources\ComingWorkResource\Pages;

use App\Filament\Resources\ComingWorkResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListComingWorks extends ListRecords
{
    protected static string $resource = ComingWorkResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
