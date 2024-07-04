# Patient Drug Allergy Recording System

Developed a comprehensive website and mobile application for recording patient drug allergies at Puskesmas Karangkobar using Laravel, Vue.js, and Flutter frameworks. This project ensures accurate and accessible medical records, enhancing patient safety and care. The platform allows healthcare professionals to efficiently manage and update allergy information, providing real-time access across both web and mobile interfaces.

## Key Features

### Modern and Responsive Admin Panel
- An intuitive and user-friendly admin panel designed for efficient data management and seamless navigation across devices.

### NFC Identification
- Allows for quick and accurate patient identification using NFC technology with KTP (Indonesian identity cards).

### Barcode Identification
- Supports patient identification using barcodes on BPJS cards, ensuring quick access to patient records.

This project significantly enhances patient safety by providing healthcare professionals with reliable and up-to-date allergy information, streamlining the process of patient identification and medical record management.

## Technologies Used

- **Backend Framework**: Laravel
- **Frontend Framework**: Vue.js
- **Mobile Framework**: Flutter

## Installation

### Prerequisites

- PHP 7.4 or higher
- Composer
- Node.js
- Flutter SDK
- Android Studio or Xcode for mobile development

### Admin Panel (Laravel + Vue)

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/your-repo-name.git](https://github.com/jeriken/Sistem-Pencatatan-Alergi-Obat
    cd website
    ```

2. Install dependencies:
    ```bash
    composer install
    ```

3. Create a `.env` file:
    ```bash
    cp .env.example .env
    ```

4. Generate an application key:
    ```bash
    php artisan key:generate
    ```

5. Configure your database in the `.env` file.

6. Run migrations:
    ```bash
    php artisan migrate
    ```

7. Serve the application:
    ```bash
    php artisan serve
    ```

8. Install dependencies:
    ```bash
    npm install
    ```

9. Serve the application:
    ```bash
    npm run serve
    ```

### Mobile Application (Flutter)

1. Navigate to the mobile directory:
    ```bash
    cd mobile
    ```

2. Install dependencies:
    ```bash
    flutter pub get
    ```

3. Run the application:
    ```bash
    flutter run
    ```

## Usage

- Access the admin panel through the web interface to manage patient allergy records.
- Use NFC-enabled devices to quickly identify patients using their KTP.
- Scan BPJS card barcodes to access patient records swiftly.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any inquiries or questions, please contact us at [mrazin311@gmail.com](mailto:mrazin311@gmail.com).
