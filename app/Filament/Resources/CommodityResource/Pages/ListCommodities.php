<?php

namespace App\Filament\Resources\CommodityResource\Pages;

use App\Filament\Resources\CommodityResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListCommodities extends ListRecords
{
    protected static string $resource = CommodityResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
