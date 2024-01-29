<?php

namespace App\Filament\Resources\ComingWorkTypeResource\Pages;

use App\Filament\Resources\ComingWorkTypeResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditComingWorkType extends EditRecord
{
    protected static string $resource = ComingWorkTypeResource::class;

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
        return 'Attendance has been updated';
    }
}
