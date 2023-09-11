---
description: September, 12 2023
---

# What's New With 4.0.0

### Changes
* Changes build to use Gradle
* Updates Couchbase Java Client to 3.4.9

### Added
* Adds support for using environment variables to provide license information
* Adds support for providing username authentication ( defaults to bucketname )
* Added support for an optional `kvPort` configuration setting.  Not present in the admin to prevent confusion from regular/management port configuration.

### Removed
* Removed `socketConnectTimeout` configuration setting, as it was undocumented, not present in the admin and not necessary with updated driver