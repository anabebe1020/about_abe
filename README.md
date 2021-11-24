# Description

This is an application for the producer to introduce himself.
It is used for portfolio and other purposes.

1. Page structure

- Home: Shows the latest items of each SNS created by the creator.
  The items are retrieved from the API of each SNS.
- Account: This corresponds to the profile of the creator. The information is mainly obtained from GitHub API.
- Brief history: Shows the work history of the creator. Information is obtained from FireStore.

2. Functions

- Multi-language support: Switches the display language. Currently, only Japanese and English are available.
- Color theme: Switch the theme to either light or dark. Default is light.

3. Technical Elements

- Dart/Flutter/Provider
- FireStore
- API: GitHub/Qiita.
