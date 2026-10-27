# RecurrenceUi Dummy Application

This is a test and development dummy application for the **[recurrence_ui](https://github.com/assoly/recurrence_ui)** Ruby gem. 

It demonstrates how to integrate flexible recurring schedules (powered by [IceCube](https://github.com/ice_cube-ruby/ice_cube)), custom form components, and localized date/time formatting into a Ruby on Rails application.

## Features Demonstrated

- **Flexible Recurrence Picker Component**: Visual rule builder for daily, weekly, monthly, and yearly recurrences.
- **Advanced Localization**: Fully localized summaries and custom month declensions (e.g., Russian grammatical cases).
- **Time Zone Support**: Robust handling of event time zones and daylight saving changes.
- **Calendar Integration**: FullCalendar integration displaying recurring events, tasks, and webinars.

## Prerequisites

- Ruby (matching your development environment)
- Bundler
- SQLite3 (or your preferred database)

## Getting Started

To run this dummy app locally, follow these steps:

1. Clone the repository and navigate to the project directory:
   ```bash
   cd recurrence_project
   
2. Install dependencies:
    ```bash
    bundle install

3. Set up the database:
    ```bash

    rails db:create db:migrate

4. Start the Rails development server:
    ```bash

    rails server

5. Open your browser and navigate to:
    ```Plaintext

    http://localhost:3000

## License

The dummy application is available as open source under the terms of the [MIT License].