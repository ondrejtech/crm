<?php

namespace App\Filament\Resources\ProjectResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class FilesRelationManager extends RelationManager
{
    protected static string $relationship = 'files';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Document relations')
                    ->schema([
                        Forms\Components\Select::make('project.id')
                            ->label('Parent Project')
                            ->relationship('projects', 'name')
                            ->searchable()
                            ->preload(),
                        Forms\Components\Select::make('company.id')
                            ->label('Parent Company')
                            ->relationship('companies', 'name')
                            ->searchable()
                            ->preload(),
                        Forms\Components\Select::make('contact.id')
                            ->label('Parent Contact')
                            ->relationship('contacts', 'full_name')
                            ->searchable()
                            ->preload(),
                        Forms\Components\TextInput::make('name')
                            ->minLength(2)
                            ->maxLength(255)
                            ->required(),
                        Forms\Components\Select::make('priority')
                            ->options([
                                'Low' => 'Low',
                                'Medium' => 'Medium',
                                'Height' => 'Height'
                            ])
                            ->required(),
                        Forms\Components\FileUpload::make('document')
                            ->disk('public')
                            ->preserveFilenames()
                            ->storeFileNamesIn('attachment_file_names')
                            ->downloadable()
                            ->previewable()
                            ->required(),
                    ])->columns(2)
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('name')
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->sortable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('projects.name')
                    ->limit(20)
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('companies.name')
                    ->limit(20)
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('contacts.full_name')
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('name')
                    ->limit(10)
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('priority')
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('document')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make(),
            ])
            ->actions([
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\EditAction::make(),
                    Tables\Actions\DeleteAction::make(),
                ])
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }
}
