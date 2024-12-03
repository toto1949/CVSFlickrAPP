# Flickr Image Search App

A SwiftUI-based iOS application that allows users to search and view images from Flickr's public feed.

## Features

- Real-time image search using Flickr's public feed API
- Grid layout displaying thumbnail images
- Image detail view with metadata
- Progress indicator during searches
- Continuous search updates on each keystroke

## Technical Requirements

- iOS (latest version)
- Swift
- SwiftUI
- Xcode (latest version)

## API

The app uses Flickr's public feed API: https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags={searchTerm}

No API key required.

## Core Functionality

### Search View
- Search bar for entering search terms
- Grid layout for displaying image thumbnails
- Non-blocking progress indicator during searches
- Support for single word or comma-separated search terms

### Detail View
- Full-size image display
- Title
- Description
- Author information
- Formatted publication date

## Testing

Includes unit tests covering core functionality.

## Development Guidelines

- Written in Swift using SwiftUI
- Follows Apple's Human Interface Guidelines
- Implements proper error handling
- Ensures thread safety for API calls
- Maintains memory management best practices
- Uses clean coding practices and consistent formatting

## Getting Started

1. Clone the repository
2. Open the project in Xcode
3. Build and run on simulator or device

## Time Allocation

Project is designed to be completed within 3 hours.
