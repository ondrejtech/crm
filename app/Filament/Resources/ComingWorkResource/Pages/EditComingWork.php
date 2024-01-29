<?php

namespace App\Filament\Resources\ComingWorkResource\Pages;

use App\Filament\Resources\ComingWorkResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditComingWork extends EditRecord
{
    protected static string $resource = ComingWorkResource::class;

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
