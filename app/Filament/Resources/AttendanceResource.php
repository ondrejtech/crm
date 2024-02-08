<?php

namespace App\Filament\Resources;

use App\Filament\Resources\AttendanceResource\Pages;
use App\Filament\Resources\AttendanceResource\RelationManagers;
use Filament\Forms\Components\Section;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\TimePicker;
use Filament\Forms\Components\MarkdownEditor;
use App\Models\Attendance;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use mysql_xdevapi\Schema;
use pxlrbt\FilamentExcel\Actions\Tables\ExportAction;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;
use pxlrbt\FilamentExcel\Exports\ExcelExport;

class AttendanceResource extends Resource
{
    protected static ?string $model = Attendance::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?int $navigationSort = 5;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Founding information')
                    ->schema([
                        TextInput::make('subject')
                            ->required()
                            ->columnSpanFull()
                            ->maxLength(255),
                        Select::make('project.id')
                            ->label('Parent Project')
                            ->relationship('projects','name')
                            ->searchable()
                            ->preload()
                            ->required()
                            ->createOptionForm([
                                Forms\Components\Section::make('Founding information')
                                    ->schema([
                                        Forms\Components\TextInput::make('name')
                                            ->required()
                                            ->maxLength(255)
                                            ->columnSpanFull(),
                                        Forms\Components\Select::make('company_id')
                                            ->relationship('company', 'name')
                                            ->required()
                                            ->createOptionForm([
                                                Forms\Components\Section::make('Founding information ')
                                                    ->schema([
                                                        Forms\Components\TextInput::make('name')
                                                            ->required()
                                                            ->maxLength(255),
                                                        Forms\Components\TextInput::make('phone')
                                                            ->required()
                                                            ->prefix('420'),
                                                        Forms\Components\TextInput::make('email')
                                                            ->email()
                                                            ->required()
                                                            ->maxLength(255),
                                                        Forms\Components\TextInput::make('www')
                                                            ->label('www')
                                                            ->prefix('https://www.')
                                                            ->maxLength(255),
                                                        Forms\Components\TextInput::make('IC')
                                                            ->required()
                                                            ->numeric(),
                                                        Forms\Components\TextInput::make('DIC')
                                                            ->maxLength(255),
                                                    ])->columns(3),
                                                Forms\Components\Section::make('Address')
                                                    ->schema([
                                                        Forms\Components\TextInput::make('address')
                                                            ->required()
                                                            ->maxLength(255),
                                                        Forms\Components\TextInput::make('city')
                                                            ->required()
                                                            ->maxLength(255),
                                                        Forms\Components\TextInput::make('zip_code')
                                                            ->required()
                                                            ->maxLength(255),
                                                        Forms\Components\TextInput::make('state')
                                                            ->required()
                                                            ->maxLength(255),
                                                        Forms\Components\Select::make('country')
                                                            ->required()
                                                            ->options([
                                                                'Czech Republic' => 'Czech republic',
                                                                'Slovakia' => 'Slovakia'
                                                            ])->columnSpan(2),
                                                    ])->columns(3),
                                                Forms\Components\Section::make('User note')
                                                    ->schema([
                                                        Forms\Components\Textarea::make('note')
                                                            ->maxLength(16777215)
                                                    ])
                                                    ->columnSpanFull(),
                                            ]),
                                        Forms\Components\Select::make('contact_id')
                                            ->relationship('contact', 'full_name')
                                            ->required(),
                                        Forms\Components\Select::make('employee_id')
                                            ->relationship('employee', 'full_name')
                                            ->required(),
                                    ])->columns(3),
                                Forms\Components\Section::make('Project information')
                                    ->schema([
                                        Forms\Components\DatePicker::make('start_project')
                                            ->required(),
                                        Forms\Components\DatePicker::make('planned_project_end')
                                            ->required(),
                                        Forms\Components\DatePicker::make('end_project'),
                                        Forms\Components\Select::make('project_types_id')
                                            ->required()
                                            ->relationship('project_types','name')
                                            ->createOptionForm([
                                                Forms\Components\Section::make('Department information')
                                                    ->schema([
                                                        Forms\Components\TextInput::make('name')
                                                            ->maxLength(255)
                                                            ->required()
                                                            ->columnSpanFull(),
                                                    ])
                                            ]),
                                        Forms\Components\TextInput::make('finish_price')
                                            ->maxLength(255),
                                        Forms\Components\Select::make('user.id')
                                            ->label('User name')
                                            ->searchable()
                                            ->preload()
                                            ->multiple()
                                            ->relationship('users','name')
                                    ])->columns(3),
                                Forms\Components\Section::make('User note')
                                    ->schema([
                                        Forms\Components\TextInput::make('note')
                                            ->maxLength(255),
                                    ])->columnSpanFull()
                            ]),
                        Select::make('company.id')
                            ->label('Company')
                            ->relationship('companies','name')
                            ->searchable()
                            ->preload(),
                        Select::make('contact.id')
                            ->label('Contact name')
                            ->relationship('contacts','full_name')
                            ->searchable()
                            ->preload()
                            ->required(),
                        Select::make('task.id')
                            ->label('Task')
                            ->relationship('tasks','subject')
                            ->searchable()
                            ->preload()
                            ->createOptionForm([
                                Section::make()
                                    ->schema([
                                        Forms\Components\TextInput::make('subject')
                                            ->required()
                                            ->maxLength(255),
                                        Forms\Components\Select::make('solver')
                                            ->label('Solver')
                                            ->required()
                                            ->relationship('employees','full_name')
                                            ->required(),
                                        Forms\Components\DatePicker::make('start_task')
                                            ->required(),
                                        Forms\Components\DatePicker::make('end_task')
                                            ->required(),
                                        Forms\Components\Select::make('project.id')
                                            ->label('Parent project')
                                            ->relationship('projects','name')
                                            ->searchable()
                                            ->preload(),
                                        Forms\Components\Select::make('company.id')
                                            ->label('Company')
                                            ->relationship('companies','name')
                                            ->searchable()
                                            ->preload(),Forms\Components\Select::make('contact.id')
                                            ->label('Contact')
                                            ->relationship('contacts','full_name')
                                            ->searchable()
                                            ->preload()
                                            ->required()
                                    ])->columns(2)
                            ])
                    ])->columns(2),
                Section::make('Date of attendance')
                    ->schema([
                        DatePicker::make('date')
                            ->date()
                            ->required(),
                        TimePicker::make('start')
                            ->format('H:i')
                            ->seconds(false)
                            ->required(),
                        TimePicker::make('end')
                            ->time()
                            ->seconds(false)
                            ->required(),
                        TextInput::make('total')
                            ->maxLength(255),
                    ])->columns(2),
                Section::make('Employees and Owners')
                    ->schema([
                        Select::make('employee.id')
                            ->label('Employee')
                            ->relationship('employees','full_name')
                            ->searchable()
                            ->preload()
                            ->required(),
                        Select::make('user.id')
                            ->label('Owner')
                            ->relationship('owner','name')
                            ->searchable()
                            ->preload()
                            ->required()
                    ])->columns(2)
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('subject')
                    ->searchable(),
                Tables\Columns\TextColumn::make('date')
                    ->date()
                    ->sortable(),
                Tables\Columns\TextColumn::make('start'),
                Tables\Columns\TextColumn::make('end'),
                Tables\Columns\TextColumn::make('total')
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
            ->headerActions([
                ExportAction::make()
                    ->exports([
                        ExcelExport::make()
                            ->askForFilename()
                            ->askForWriterType()
                            ->fromModel()
                    ])
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
//                Tables\Actions\EditAction::make(),
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\EditAction::make(),
                    Tables\Actions\DeleteAction::make(),
                ])
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
            'index' => Pages\ListAttendances::route('/'),
            'create' => Pages\CreateAttendance::route('/create'),
            'edit' => Pages\EditAttendance::route('/{record}/edit'),
        ];
    }
}
