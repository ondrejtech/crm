<?php

namespace App\Filament\Imports;

use App\Models\Company;
use Filament\Actions\Imports\ImportColumn;
use Filament\Actions\Imports\Importer;
use Filament\Actions\Imports\Models\Import;

class CompanyImporter extends Importer
{
    protected static ?string $model = Company::class;

    public static function getColumns(): array
    {
        return [
            ImportColumn::make('name')
                ->requiredMapping()
                ->rules(['required', 'max:255']),
            ImportColumn::make('phone')
                ->requiredMapping()
                ->numeric()
                ->rules(['required', 'max:255']),
            ImportColumn::make('email')
                ->requiredMapping()
                ->rules(['required', 'email', 'max:255']),
            ImportColumn::make('www')
                ->rules(['max:255']),
            ImportColumn::make('IC')
                ->requiredMapping()
                ->rules(['required', 'max:255']),
            ImportColumn::make('DIC')
                ->rules(['max:255']),
            ImportColumn::make('subscriber')
                ->requiredMapping()
                ->boolean()
                ->rules(['required', 'boolean']),
            ImportColumn::make('supplier')
                ->requiredMapping()
                ->boolean()
                ->rules(['required', 'boolean']),
            ImportColumn::make('competition')
                ->requiredMapping()
                ->boolean()
                ->rules(['required', 'boolean']),
            ImportColumn::make('address')
                ->requiredMapping()
                ->rules(['required', 'max:255']),
            ImportColumn::make('city')
                ->rules(['max:255']),
            ImportColumn::make('zip_code')
                ->rules(['max:255']),
            ImportColumn::make('state')
                ->rules(['max:255']),
            ImportColumn::make('country')
                ->rules(['max:255']),
            ImportColumn::make('note')
                ->rules(['max:16777215']),
        ];
    }

    public function resolveRecord(): ?Company
    {
        // return Company::firstOrNew([
        //     // Update existing records, matching them by `$this->data['column_name']`
        //     'email' => $this->data['email'],
        // ]);

        return new Company();
    }

    public static function getCompletedNotificationBody(Import $import): string
    {
        $body = 'Your company import has completed and ' . number_format($import->successful_rows) . ' ' . str('row')->plural($import->successful_rows) . ' imported.';

        if ($failedRowsCount = $import->getFailedRowsCount()) {
            $body .= ' ' . number_format($failedRowsCount) . ' ' . str('row')->plural($failedRowsCount) . ' failed to import.';
        }

        return $body;
    }
}
