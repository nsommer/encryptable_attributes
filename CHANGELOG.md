## EncryptableAttributes 0.2.2 (May 20, 2018)
* *FIX*: Don't try to encrypt and decrypt blank values (nil)

## EncryptableAttributes 0.2.1 (May 13, 2018)
* *FIX*: Rotate `ActiveSupport::MessageEncryptor` keys to ensure they are kept in case new configs are added
* Added active_record as runtime dependency

## EncryptableAttributes 0.2.0 (May 12, 2018)
* Added `CHANGELOG.md`
* Speficy dependency versions
* Reduce loaded dependencies
* Support reading the encryption key at runtime via method call

## EncryptableAttributes 0.1.0 (May 12, 2018)

* Initial release