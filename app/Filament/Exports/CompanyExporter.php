<?php

namespace App\Filament\Exports;

use App\Models\Company;
use Filament\Actions\Exports\Enums\ExportFormat;
use Filament\Actions\Exports\ExportColumn;
use Filament\Actions\Exports\Exporter;
use Filament\Actions\Exports\Models\Export;

class CompanyExporter extends Exporter
{
    protected static ?string $model = Company::class;

    public static function getColumns(): array
    {
        return [
            ExportColumn::make('id')
                ->label('ID'),
            ExportColumn::make('project.name')
                ->label('Project ID'),
            ExportColumn::make('contact.full_name')
                ->label('Contact ID'),
            ExportColumn::make('name'),
            ExportColumn::make('phone'),
            ExportColumn::make('email'),
            ExportColumn::make('www'),
            ExportColumn::make('IC'),
            ExportColumn::make('DIC'),
            ExportColumn::make('subscriber'),
            ExportColumn::make('supplier'),
            ExportColumn::make('competition'),
            ExportColumn::make('address'),
            ExportColumn::make('city'),
            ExportColumn::make('zip_code'),
            ExportColumn::make('state'),
            ExportColumn::make('country'),
            ExportColumn::make('note'),
            ExportColumn::make('created_at'),
            ExportColumn::make('updated_at'),
        ];
    }

    public function getFormats(): array
    {
        return [
            ExportFormat::Xlsx,
        ];
    }

    public function getFileDisk(): string
    {
        return 'export';
    }

    public function getFileName(Export $export): string
    {
        return 'company';
    }

//    public static function getCsvDelimiter(): string
//    {
//        return ',';
//    }
    public static function getCompletedNotificationBody(Export $export): string
    {
        $body = 'Your company export has completed and ' . number_format($export->successful_rows) . ' ' . str('row')->plural($export->successful_rows) . ' exported.';

        if ($failedRowsCount = $export->getFailedRowsCount()) {
            $body .= ' ' . number_format($failedRowsCount) . ' ' . str('row')->plural($failedRowsCount) . ' failed to export.';
        }

        return $body;
    }
}
