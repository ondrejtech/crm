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
use Filament\Forms\Components\Wizard;
use pxlrbt\FilamentExcel\Actions\Tables\ExportAction;
use pxlrbt\FilamentExcel\Exports\ExcelExport;

class ProductResource extends Resource
{
    protected static ?string $model = Product::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Wizard::make([
                    Wizard\Step::make('Product')->schema([
                        Forms\Components\Section::make('Product info')->schema([
                            Forms\Components\TextInput::make('Name')
                                ->required()
                                ->maxLength(255)
                                ->columnSpan(4),
			Forms\Components\TextInput::make('id')
                                ->required(),
                        ])->columns(5),
                        Forms\Components\Section::make()->schema([
                            Forms\Components\TextInput::make('Code')
                                ->label('Product Code')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('EANCode')
                                ->label('EAN')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('PartNumber')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('OnStockText')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('Unit')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('Warranty')
                                ->required()
                                ->maxLength(255),
                        ])->columns(3),
                    ])->columnSpanFull(),
                    Wizard\Step::make('Product price')->schema([
                        Forms\Components\Section::make('Shopping price')->schema([
                            Forms\Components\TextInput::make('YourPrice')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('GarbageFee')
                                ->required()
                                ->numeric(),
                            Forms\Components\TextInput::make('AuthorFee')
                                ->required()
                                ->numeric(),
                            Forms\Components\TextInput::make('YourPriceWithFees')
                                ->required()
                                ->numeric(),
                        ])->columns(4),
                        Forms\Components\Section::make('Finish Price')->schema([
                            Forms\Components\TextInput::make('DealerPrice')
                                ->required()
                                ->numeric(),
                            Forms\Components\TextInput::make('Vat')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('EndUserPrice')
                                ->required()
                                ->numeric(),
                        ])->columns(3)
                    ])->columnSpanFull(),
                    Wizard\Step::make('Product Germs')->schema([
                            Forms\Components\Section::make('Category Germ')->schema([
                                Forms\Components\Select::make('product_category_id')
                                    ->relationship('product_category', 'CategoryName')
                                    ->required(),
                                ])->columnSpanFull(),
                            Forms\Components\Section::make('Commodity Germ')->schema([
                                Forms\Components\TextInput::make('CommodityCode')
                                    ->required()
                                    ->maxLength(255),
                                Forms\Components\TextInput::make('CommodityName')
                                    ->required()
                                    ->maxLength(255),
                            ])->columns(2),
                        Forms\Components\Section::make(['Producer Germ'])->schema([
                                Forms\Components\TextInput::make('ProducerCode')
                                    ->required()
                                    ->maxLength(255),
                                Forms\Components\TextInput::make('ProducerName')
                                    ->required()
                                    ->maxLength(255),
                        ])->columns(),
                    ])->columnSpanFull(),
                    Wizard\Step::make('Product description')->schema([
                        Forms\Components\Section::make('Descriptions')->schema([
                            Forms\Components\RichEditor::make('DescriptionShort'),
                            Forms\Components\RichEditor::make('Description')
                        ])->columns(),
                    ])->columnSpanFull(),
                    Wizard\Step::make('Product image')->schema([
                        Forms\Components\Section::make('Url Image')->schema([
                            Forms\Components\TextInput::make('SmallImage'),
                            Forms\Components\TextInput::make('BigImage')
                        ])->columns(),
//                        Forms\Components\Section::make('File Image')->schema([
//                            Forms\Components\FileUpload::make('SmallImage'),
//                            Forms\Components\FileUpload::make('BigImage')
//                        ])->columns(),
                    ])->columnSpanFull(),

//
//
//
//                                Forms\Components\TextInput::make('ValuePack')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('ValuePackQty')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('Status')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('RateOfDutyCode')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('NameB2C')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('MultipleQuantity')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('IsTop')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('InfoCode')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('IndexSort1')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('IndexCode1')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('IndexOrder1')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('IndexImplicit1')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('IndexSort2')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('IndexCode2')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('IndexOrder2')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('IndexImplicit2')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('WarrantyUnit')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('PartNumber2')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('DateAvailible')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('DealerPrice1')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('OnStockCount')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('ImgCount')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('ImgLastChanged')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('B2C')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('B2FPrice')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('RCStatus')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('RCCode')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('IsPremium')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('ExtInfoCodes')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('EndUserPriceDPH')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\TextInput::make('Discount')
//                                    ->required()
//                                    ->numeric()
//                                    ->default(30),
//                                Forms\Components\TextInput::make('PriceDiscount')
//                                    ->required()
//                                    ->maxLength(255),
//                                Forms\Components\Textarea::make('DescriptionShort')
//                                    ->required()
//                                    ->maxLength(16777215)
//                                    ->columnSpanFull(),
//                                Forms\Components\Textarea::make('Description')
//                                    ->required()
//                                    ->maxLength(16777215)
//                                    ->columnSpanFull(),
//                            ])
                ])->columnSpanFull(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\ImageColumn::make('SmallImage')
                    ->circular(),
                Tables\Columns\TextColumn::make('id')
                    ->label('ProId')
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('product_category.id')
                    ->numeric()
                    ->sortable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('Code')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('Name')
                    ->limit(30)
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('YourPrice')
                    ->searchable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->money('CZK'),
                Tables\Columns\TextColumn::make('YourPriceWithFees')
                    ->numeric()
                    ->searchable()
                    ->sortable()
                    ->toggleable()
                    ->money('CZK'),
                Tables\Columns\TextColumn::make('CommodityCode')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('GarbageFee')
                    ->numeric()
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->money('CZK'),
                Tables\Columns\TextColumn::make('AuthorFee')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->money('CZK'),
                Tables\Columns\TextColumn::make('ValuePack')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('ValuePackQty')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('Warranty')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('CommodityName')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('DealerPrice')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->money('CZK'),
                Tables\Columns\TextColumn::make('EndUserPrice')
                    ->numeric()
                    ->searchable()
                    ->sortable()
                    ->money('CZK')
                    ->toggleable(),
                Tables\Columns\TextColumn::make('Discount')
                    ->numeric()
                    ->suffix('%')
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('PriceDiscount')
                    ->searchable()
                    ->sortable()
                    ->numeric()
                    ->money('CZK')
                    ->toggleable(),
                Tables\Columns\TextColumn::make('Vat')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('PartNumber')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('OnStock')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('OnStockText')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('Status')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('ProducerCode')
                    ->searchable()
                    ->sortable()
                    ->toggleable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('ProducerName')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('RateOfDutyCode')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('EANCode')
                    ->label('EAN')
                    ->searchable()
                    ->searchable()
                    ->toggleable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('NameB2C')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('MultipleQuantity')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('IsTop')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('InfoCode')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('IndexSort1')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('IndexCode1')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('IndexOrder1')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('IndexImplicit1')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('IndexSort2')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('IndexCode2')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('IndexOrder2')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('IndexImplicit2')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('WarrantyTerm')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('WarrantyUnit')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('PartNumber2')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('DateAvailible')
                    ->date()
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('DealerPrice1')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('Unit')
                    ->searchable(),
                Tables\Columns\TextColumn::make('OnStockCount')
                    ->searchable(),
                Tables\Columns\TextColumn::make('ImgCount')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('ImgLastChanged')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('B2C')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('B2FPrice')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('RCStatus')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('RCCode')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('IsPremium')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('ExtInfoCodes')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('EndUserPriceDPH')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
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
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\ViewAction::make(),
                    Tables\Actions\EditAction::make(),
                ])
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