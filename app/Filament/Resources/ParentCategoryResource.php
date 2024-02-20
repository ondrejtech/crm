<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ParentCategoryResource\Pages;
use App\Filament\Resources\ParentCategoryResource\RelationManagers;
use App\Models\ParentCategory;
use Filament\Actions\DeleteAction;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use pxlrbt\FilamentExcel\Actions\Tables\ExportAction;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;
use pxlrbt\FilamentExcel\Exports\ExcelExport;

class ParentCategoryResource extends Resource
{
    protected static ?string $model = ParentCategory::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'Category management';
    protected static ?int $navigationSort = 1;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
               Forms\Components\Section::make()
                    ->schema([
                        Forms\Components\TextInput::make('SuperCategoryName')
                            ->required()
                            ->maxLength(255)
                            ->columnSpanFull(),
                        Forms\Components\TextInput::make('SuperCategoryCode')
                            ->required()
                            ->numeric(),
                        Forms\Components\TextInput::make('ParentSuperCategoryCode')
                            ->required()
                            ->numeric(),
                    ])->columns(2)
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->sortable()
                    ->searchable(isIndividual: true)
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('SuperCategoryCode')
                    ->numeric()
                    ->sortable()
                    ->searchable(isIndividual: true)
                    ->toggleable(),
                Tables\Columns\TextColumn::make('SuperCategoryName')
                    ->searchable(isIndividual: true)
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('ParentSuperCategoryCode')
                    ->numeric()
                    ->sortable()
                    ->searchable(isIndividual: true)
                    ->toggleable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->searchable(isIndividual: true)
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                ExportAction::make()
                    ->exports([
                        ExcelExport::make()
                            ->askForFilename()
                            ->askForWriterType()
                            ->fromModel()
                    ])
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make()
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                    ExportBulkAction::make()
                        ->exports([
                            ExcelExport::make()
                                ->askForFilename()
                                ->askForWriterType()
                                ->fromModel()
                        ])
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListParentCategories::route('/'),
            'create' => Pages\CreateParentCategory::route('/create'),
            'edit' => Pages\EditParentCategory::route('/{record}/edit'),
        ];
    }
}
