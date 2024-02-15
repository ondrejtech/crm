<?php

namespace App\Filament\Resources\CommodityResource\Pages;

use App\Filament\Resources\CommodityResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditCommodity extends EditRecord
{
    protected static string $resource = CommodityResource::class;

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
        return 'Commodity has been successfully updated';
    }
}
