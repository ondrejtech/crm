<?php

namespace App\Filament\Resources;

use app\Enums\OrderStatus;
use App\Filament\Resources\OrderResource\Pages;
use App\Filament\Resources\OrderResource\RelationManagers;
use App\Models\Order;
use App\Models\Product;
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

                        Forms\Components\RichEditor::make('note')
                            ->columnSpanFull(),
                    ])->columns(),
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
                                    ->content(function ($get){
                                        return $get('unit_price') * $get('quantity');
                                    })
                            ])->columns(7)
                    ])
                ])->columnSpanFull()
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('company.name'),
                Tables\Columns\TextColumn::make('contact.full_name'),
                Tables\Columns\TextColumn::make('status'),

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
            'index' => Pages\ListOrders::route('/'),
            'create' => Pages\CreateOrder::route('/create'),
            'edit' => Pages\EditOrder::route('/{record}/edit'),
        ];
    }
}
