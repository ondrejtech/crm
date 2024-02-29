<?php

namespace App\Filament\Resources;

use App\Enums\OrderStatus;
use App\Filament\Resources\OrderResource\Pages;
use App\Filament\Resources\OrderResource\RelationManagers;
use App\Http\Controllers\TestController;
use App\Models\Company;
use App\Models\Contact;
use App\Models\Order;
use App\Models\Product;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Support\Contracts\HasLabel;
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
                    Forms\Components\Wizard\Step::make('Order Detail')->schema([
                        Forms\Components\Section::make()->schema([
                            Forms\Components\TextInput::make('number')
                                ->label('Order number')
                                ->default('OR-'.random_int(100000,999999))
                                ->disabled(),
                            Forms\Components\Select::make('company_id')
                                ->label('Company')
                                ->options(Company::query()->pluck('name','id'))
                                ->searchable()
                                ->preload(),
                            Forms\Components\Select::make('contact_id')
                                ->label('Contact')
                                ->options(Contact::query()->pluck('full_name','id'))
                                ->searchable()
                                ->preload()
                                ->required(),
                            Forms\Components\Select::make('status')
                                ->options(OrderStatus::class)
                                ->preload()
                                ->required(),
                        ])->columns(),
                        Forms\Components\RichEditor::make('note')
                            ->columnSpanFull()
                    ]),
                    Forms\Components\Wizard\Step::make('Order items')->schema([
                        Forms\Components\Section::make()->schema([
                            Forms\Components\Repeater::make('items')
                                ->relationship()
                                ->schema([
                                    Forms\Components\Select::make('product_id')
                                        ->label('Product')
                                        ->options(Product::query()->pluck('Name','id'))
                                        ->searchable()
                                        ->preload()
                                        ->required()
                                        ->reactive()
                                        ->afterStateUpdated(fn($state, Forms\Set $set) =>
                                        $set('unit_price', Product::find($state)?->EndUserPrice ?? 0)),
                                    Forms\Components\TextInput::make('quantity')
                                        ->numeric()
                                        ->default(1)
                                        ->required(),
                                    Forms\Components\TextInput::make('unit_price')
                                        ->label('Unit price')
                                        ->disabled()
                                        ->dehydrated()
                                        ->numeric()
                                ])->columns(3)
                        ])
                     ])->columnSpan(3)
                ])->columnSpanFull()
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('order.id'),
                Tables\Columns\TextColumn::make('product.id'),
                Tables\Columns\TextColumn::make('number')
                    ->numeric()
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('customer.name')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('Status')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('total_price')
                    ->sortable()
                    ->searchable()
                    ->summarize([
                        Tables\Columns\Summarizers\Sum::make()->money()
                    ]),
                Tables\Columns\TextColumn::make('created_at')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('updated_at')
                    ->searchable()
                    ->sortable()
                    ->toggleable()
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
