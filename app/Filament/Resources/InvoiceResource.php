<?php

namespace App\Filament\Resources;

use App\Filament\Resources\InvoiceResource\Pages;
use App\Filament\Resources\InvoiceResource\RelationManagers;
use App\Models\Invoice;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class InvoiceResource extends Resource
{
    protected static ?string $model = Invoice::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('number')
                    ->required()
                    ->default('INV-'.random_int(1111,99999)),
                Forms\Components\Select::make('order_id')
                    ->label('Order number')
                    ->relationship('order','id')
                    ->searchable()
                    ->preload()
                    ->required(),
                Forms\Components\Select::make('order_number')
                    ->label('Order number')
                    ->relationship('order','number')
                    ->searchable()
                    ->preload()
                    ->required(),
                Forms\Components\Select::make('company_id')
                    ->label('Company')
                    ->relationship('company','name')
                    ->searchable()
                    ->preload()
                    ->required(),
                Forms\Components\Select::make('contact_id')
                    ->label('Contact')
                    ->relationship('contact','full_name')
                    ->searchable()
                    ->preload()
                    ->required(),
                Forms\Components\TextInput::make('note')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('status')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('delivery_address')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('delivery_city')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('delivery_psc')
                    ->required()
                    ->maxLength(255),
                Forms\Components\Select::make('delivery_state_id')
                    ->label('Delivery state')
                    ->required()
                    ->label('Delivery state')
                    ->relationship('deliveryState','name')
                    ->searchable()
                    ->preload(),
                Forms\Components\Select::make('delivery_country_id')
                    ->label('Delivery country')
                    ->relationship('deliveryCountry','name')
                    ->searchable()
                    ->preload()
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('number')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('order_number')
                    ->numeric()
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('company.name')
                    ->numeric()
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('contact.full_name')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('delivery_address')
                    ->searchable(),
                Tables\Columns\TextColumn::make('delivery_city')
                    ->searchable(),
                Tables\Columns\TextColumn::make('delivery_psc')
                    ->searchable(),
                Tables\Columns\TextColumn::make('deliveryCountry.name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('deliveryState.name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('status')
                    ->searchable(),
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
            'index' => Pages\ListInvoices::route('/'),
            'create' => Pages\CreateInvoice::route('/create'),
            'edit' => Pages\EditInvoice::route('/{record}/edit'),
        ];
    }
}
