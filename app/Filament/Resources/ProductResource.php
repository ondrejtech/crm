<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ProductResource\Pages;
use App\Filament\Resources\ProductResource\RelationManagers;
use App\Models\Product;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ProductResource extends Resource
{
    protected static ?string $model = Product::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('producer_id')
                    ->numeric(),
                Forms\Components\TextInput::make('product_category_id')
                    ->numeric(),
                Forms\Components\TextInput::make('commodity_id')
                    ->numeric(),
                Forms\Components\TextInput::make('ProId')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('Code')
                    ->maxLength(255),
                Forms\Components\TextInput::make('Name')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('GarbageFee')
                    ->numeric(),
                Forms\Components\TextInput::make('AuthorFee')
                    ->numeric(),
                Forms\Components\TextInput::make('YourPrice')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('YourPriceWithFees')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('EndUserPrice')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('Warranty')
                    ->maxLength(255),
                Forms\Components\TextInput::make('PartNumber')
                    ->maxLength(255),
                Forms\Components\TextInput::make('OnStockText')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('Unit')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('Status')
                    ->maxLength(255),
                Forms\Components\TextInput::make('EANCode')
                    ->maxLength(255),
                Forms\Components\TextInput::make('IsPremium')
                    ->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('producer_id')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('product_category_id')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('commodity_id')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('ProId')
                    ->searchable(),
                Tables\Columns\TextColumn::make('Code')
                    ->searchable(),
                Tables\Columns\TextColumn::make('Name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('GarbageFee')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('AuthorFee')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('YourPrice')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('YourPriceWithFees')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('EndUserPrice')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('Warranty')
                    ->searchable(),
                Tables\Columns\TextColumn::make('PartNumber')
                    ->searchable(),
                Tables\Columns\TextColumn::make('OnStockText')
                    ->searchable(),
                Tables\Columns\TextColumn::make('Unit')
                    ->searchable(),
                Tables\Columns\TextColumn::make('Status')
                    ->searchable(),
                Tables\Columns\TextColumn::make('EANCode')
                    ->searchable(),
                Tables\Columns\TextColumn::make('IsPremium')
                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
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
            'index' => Pages\ListProducts::route('/'),
            'create' => Pages\CreateProduct::route('/create'),
            'edit' => Pages\EditProduct::route('/{record}/edit'),
        ];
    }
}
