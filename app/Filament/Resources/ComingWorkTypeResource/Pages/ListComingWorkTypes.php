<?php

namespace App\Filament\Resources\ComingWorkTypeResource\Pages;

use App\Filament\Resources\ComingWorkTypeResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListComingWorkTypes extends ListRecords
{
    protected static string $resource = ComingWorkTypeResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
