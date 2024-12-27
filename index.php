<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ictassetmanagement";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_POST['form-type'])) {
    $formType = $_POST['form-type'];

    switch ($formType) {
        case 'asset-registration':
            $asset_type = $_POST['asset-type'];
            $asset_name = $_POST['asset-name'];
            $asset_description = $_POST['asset-description'];
            $serial_number = $_POST['serial-number'];
            $purchase_date = $_POST['purchase-date'];

            $sql = "INSERT INTO assetregistration (asset_type, asset_name, asset_description, serial_number, purchase_date)
                    VALUES ('$asset_type', '$asset_name', '$asset_description', '$serial_number', '$purchase_date')";

            if ($conn->query($sql) === TRUE) {
                echo "<span style='color: blue;'>New asset registered successfully</span>";
            } else {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
            break;

        case 'maintenance-scheduling':
            $asset_id = $_POST['asset-id'];
            $maintenance_date = $_POST['maintenance-date'];
            $maintenance_details = $_POST['maintenance-details'];

            $sql = "INSERT INTO maintenancescheduling (asset_id, maintenance_date, maintenance_details)
                    VALUES ('$asset_id', '$maintenance_date', '$maintenance_details')";

            if ($conn->query($sql) === TRUE) {
                echo "<span style='color: blue;'>Maintenance scheduled successfully</span>";
            } else {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
            break;

        case 'user-management':
            $user_role = $_POST['user-role'];
            $username = $_POST['username'];
            $password = password_hash($_POST['password'], PASSWORD_BCRYPT);

            $sql = "INSERT INTO usermanagement (user_role, username, password)
                    VALUES ('$user_role', '$username', '$password')";

            if ($conn->query($sql) === TRUE) {
                echo "<span style='color: blue;'>New user registered successfully</span>";
            } else {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
            break;

        default:
            echo "Invalid form submission.";
            break;
    }
} else {
    echo "No form submitted.";
}

$conn->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ICT Asset Management System</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>ICT Asset Management System</h1>
        <nav>
            <ul>
                <li><a href="#dashboard">Dashboard</a></li>
                <li><a href="#asset-registration">Asset Registration</a></li>
                <li><a href="#asset-tracking">Asset Tracking</a></li>
                <li><a href="#maintenance-scheduling">Maintenance Scheduling</a></li>
                <li><a href="#reporting">Reporting</a></li>
                <li><a href="#user-management">User Management</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section id="dashboard">
            <h2>Dashboard</h2>
            <p>Welcome to the ICT Asset Management System. Navigate through the sections to manage your assets efficiently.</p>
        </section>

        <section id="asset-registration">
            <h2>Asset Registration</h2>
            <form method="post" action="index.php">
                <input type="hidden" name="form-type" value="asset-registration">
                <label for="asset-type">Asset Type:</label>
                <select id="asset-type" name="asset-type">
                    <option value="hardware">Hardware</option>
                    <option value="software">Software</option>
                    <option value="peripherals">Peripherals</option>
                </select>

                <label for="asset-name">Asset Name:</label>
                <input type="text" id="asset-name" name="asset-name" required>

                <label for="asset-description">Description:</label>
                <textarea id="asset-description" name="asset-description" required></textarea>

                <label for="serial-number">Serial Number:</label>
                <input type="text" id="serial-number" name="serial-number" required>

                <label for="purchase-date">Purchase Date:</label>
                <input type="date" id="purchase-date" name="purchase-date" required>

                <button type="submit">Register Asset</button>
            </form>
        </section>

        <section id="maintenance-scheduling">
            <h2>Maintenance Scheduling</h2>
            <form method="post" action="index.php">
                <input type="hidden" name="form-type" value="maintenance-scheduling">
                <label for="asset-id">Asset ID:</label>
                <input type="text" id="asset-id" name="asset-id" required>

                <label for="maintenance-date">Maintenance Date:</label>
                <input type="date" id="maintenance-date" name="maintenance-date" required>

                <label for="maintenance-details">Details:</label>
                <textarea id="maintenance-details" name="maintenance-details" required></textarea>

                <button type="submit">Schedule Maintenance</button>
            </form>
        </section>

        <section id="user-management">
            <h2>User Management</h2>
            <form method="post" action="index.php">
                <input type="hidden" name="form-type" value="user-management">
                <label for="user-role">User Role:</label>
                <select id="user-role" name="user-role">
                    <option value="admin">Admin</option>
                    <option value="manager">Manager</option>
                    <option value="staff">Staff</option>
                </select>

                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <button type="submit">Add User</button>
            </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 ICT Asset Management System. All rights reserved.</p>
    </footer>
</body>
</html>
