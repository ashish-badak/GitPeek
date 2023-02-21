# GitPeek

A demo application to list closed pull requests from [Swift Repo](https://github.com/apple/swift)

## NOTE:
Without auth key this app can make limited API requests to Github servers.
In order to test or use this code without rate-limiting, you will need a auth key. You can get your key [here](https://github.com/settings/tokens).

## Implementation Details:

- API Reference: [Github Pull Requests API](https://docs.github.com/en/rest/pulls/pulls?apiVersion=2022-11-28#list-pull-requests)
- **Architecture:** VIPER
- **UI:** Programmatic UI
- **Unit tests:** Added

## Notable Features:

### UI:
- Entire UI layer is written in programmatic UI style.
- Created generic [TableViewCell](./GitPeek/Common/Views/TableViewCell.swift) which can be reused across any project with programmatically created views. This offers better flexibility.
- Uses Generic cell registration and dueueing. See more [here](./GitPeek/Utils/View%20Reusability).

### Networking:
- Implemented network layer without using any third-party library
- Entire networking layer is highly modular.
- With use of generics and protocols, it is very flexible to scale, tweak and test.
- Some of the entities are unit tested.

### Pagination:
- Pagination is implemented in a generic way using [PaginatedContentProvider](./GitPeek/Networking/Request%20Performers/PaginatedContentProvider.swift)
- This can be drag dropped to any pagination call in any project.
- Supports footer loader view to indicate paginated request.

### Image Store:
- Implemented image caching without any third party library.
- Created separate entities to download and cache to allow better flexibility.

### Image Resizing:
- Github CDN supports image resizing to cater specific user needs
- In this project, I am loading pixel-perfect-sized images. This helps to 
  - save network data
  - improve downloading speed
  - improve performance
- To learn more see the [URLExtension.swift](/GitPeek/Utils/Extensions/URLExtension.swift#L15) file.

### Other ones:
- Supports image placeholder
- Network request logging
