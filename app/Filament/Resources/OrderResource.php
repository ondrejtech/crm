<?php

namespace App\Filament\Resources;

use app\Enums\OrderStatus;
use App\Filament\Resources\OrderResource\Pages;
use App\Filament\Resources\OrderResource\RelationManagers;
use App\Models\Contact;
use App\Models\Country;
use App\Models\Order;
use App\Models\Product;
use App\Models\State;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class OrderResource extends Resource
{
    protected static ?string $model = Order::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Wizard::make([
                    Forms\Components\Wizard\Step::make('Order')->schema([
                        Forms\Components\Select::make('company_id')
                            ->label('Company')
                            ->relationship('company','name')
                            ->searchable()
                            ->preload(),
                        Forms\Components\Select::make('contact_id')
                            ->label('Customer')
                            ->relationship('contact','full_name')
                            ->searchable()
                            ->preload()
                            ->required(),
                        Forms\Components\Select::make('status')
                            ->options([
                                'PENDING' => 'PENDING',
                                'PROCESSING' => 'PROCESSING',
                                'COMPLETED' => 'COMPLETED',
                                'DECLINED' => 'DECLINED',
                                'CANCEL' => 'CANCEL',
                            ])
                            ->required(),
                        Forms\Components\TextInput::make('delivery_address')
                            ->label('Delivery Street')
                            ->required(),
                        Forms\Components\TextInput::make('delivery_city')
                            ->label('Delivery City')
                            ->required(),
                        Forms\Components\TextInput::make('delivery_psc')
                            ->label('Delivery PSC')
                            ->required(),
                        Forms\Components\Select::make('delivery_country')
                            ->label('Delivery country')
                            ->options(Country::query()->pluck('name','id'))
                            ->searchable()
                            ->preload()
                            ->required(),
                        Forms\Components\Select::make('delivery_state')
                            ->label('Delivery State')
                            ->options(State::query()->pluck('name','id'))
                            ->searchable()
                            ->preload()
                            ->required(),
                        Forms\Components\RichEditor::make('note')
                            ->columnSpanFull(),
                    ])->columns(3),
                    Forms\Components\Wizard\Step::make('Order Item')->schema([
                        Forms\Components\Repeater::make('orderItems')
                            ->relationship()
                            ->schema([
                                Forms\Components\Select::make('product_id')
                                    ->label('Product')
                                    ->options(Product::query()->pluck('Name','id'))
                                    ->searchable()
                                    ->preload()
                                    ->reactive()
                                    ->required()
                                    ->afterStateUpdated(fn ($state, Forms\Set $set) =>
                                    $set('unit_price', Product::find($state)?->EndUserPrice ?? 0))
                                    ->columnSpan(4),
                                Forms\Components\TextInput::make('quantity')
                                    ->default(1)
                                    ->live()
                                    ->dehydrated()
                                    ->numeric()
                                    ->suffix('ks')
                                    ->required(),
                                Forms\Components\TextInput::make('unit_price')
                                    ->label('Unit price')
                                    ->disabled()
                                    ->dehydrated()
                                    ->numeric()
                                    ->required()
                                    ->columnSpan(1),
                                Forms\Components\Placeholder::make('total_price')
                                    ->label('Total Price')
                                    ->disabled()
                                    ->reactive()
                                    ->live()
                                    ->dehydrated()
                                    ->content(function ($get){
                                        return $get('unit_price') * $get('quantity');
                                    }),
//                                Forms\Components\TextInput::make('total_price')
//                                    ->label('Total price')
//                                    ->disabled()
//                                    ->dehydrated()
//                                    ->reactive()
//                                    ->live()
//                                    ->default(function (Forms\Get $get): string{
//                                        return $get('unit_price') * $get('quantity');
//                                    })
                            ])->columns(7)
                    ])
                ])->columnSpanFull()
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('company.name')
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('contact.full_name')
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('delivery_address')
                    ->sortable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('delivery_city')
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('delivery_psc')
                    ->sortable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('delivery_state')
                    ->sortable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('delivery_country')
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('status')
                    ->sortable()
                    ->searchable()
                    ->toggleable(),

            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
//                Tables\Actions\Action::make('Create Invoice')
//                ->url(fn (Order $record): string => route('admin.invoice.generate', $record))
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
            'index' => Pages\ListOrders::route('/'),
            'create' => Pages\CreateOrder::route('/create'),
            'edit' => Pages\EditOrder::route('/{record}/edit'),
        ];
    }
}
