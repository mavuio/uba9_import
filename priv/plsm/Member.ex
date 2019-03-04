defmodule DI.Member do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "Member" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :FirstName, :text
    field :Surname, :text
    field :Email, :text
    field :TempIDHash, :text
    field :TempIDExpired, :naive_datetime
    field :Password, :text
    field :AutoLoginHash, :text
    field :AutoLoginExpired, :naive_datetime
    field :PasswordEncryption, :text
    field :Salt, :text
    field :PasswordExpiry, :naive_datetime
    field :LockedOutUntil, :naive_datetime
    field :Locale, :text
    field :FailedLoginCount, :integer
    field :Username, :text
    field :EmailValidated, :text
    field :PageRoots4BE, :text
    field :CrmID, :text
    field :PartnerID, :integer
    field :PreTitle, :text
    field :PostTitle, :text
    field :Position, :text
    field :Department, :text
    field :FonBusiness, :text
    field :FonMobile, :text
    field :Fax, :text
    field :Street, :text
    field :Zip, :text
    field :City, :text
    field :Country, :text
    field :KennenlernCode, :text

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :FirstName, :Surname, :Email, :TempIDHash, :TempIDExpired, :Password, :AutoLoginHash, :AutoLoginExpired, :PasswordEncryption, :Salt, :PasswordExpiry, :LockedOutUntil, :Locale, :FailedLoginCount, :Username, :EmailValidated, :isFEUser, :PageRoots4BE, :ConfigData, :CrmID, :PartnerID, :Sex, :PreTitle, :PostTitle, :Position, :Department, :FonBusiness, :FonMobile, :Fax, :Street, :Zip, :City, :Country, :KennenlernCode)
  end
end
