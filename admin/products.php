<?php
session_start();
include '../components/connect.php';

if (!isset($_SESSION['admin_id'])) {
    header('location: admin_login.php');
    exit; // Ensure the script stops execution after the redirect.
}

$message = array(); // Initialize an empty array for error messages.

if (isset($_POST['add_product'])) {
    // Input validation and sanitation
    $name = filter_input(INPUT_POST, 'name', FILTER_SANITIZE_STRING);
    $price = filter_input(INPUT_POST, 'price', FILTER_VALIDATE_FLOAT);
    $details = filter_input(INPUT_POST, 'details', FILTER_SANITIZE_STRING);
    $category = filter_input(INPUT_POST, 'category', FILTER_SANITIZE_STRING);

    // Check if the input is valid
    if (!$name || !$price || !$details || !$category) {
        $message[] = 'Invalid input. Please check your input fields.';
    } else {
        // Handle file uploads
        $image_folder = '../uploaded_img/';
        $image_01 = $_FILES['image_01']['name'];
        $image_tmp_name_01 = $_FILES['image_01']['tmp_name'];
        $image_size_01 = $_FILES['image_01']['size'];

        $allowed_extensions = array('jpg', 'jpeg', 'png', 'webp');
        $image_extension_01 = strtolower(pathinfo($image_01, PATHINFO_EXTENSION));

        if (!in_array($image_extension_01, $allowed_extensions)) {
            $message[] = 'Invalid file format. Please upload an image in JPG, JPEG, PNG, or WEBP format.';
        } elseif ($image_size_01 > 5000000) {
            $message[] = 'Image size is too large (maximum size: 5MB).';
        } else {
            // Generate a unique filename for the uploaded image
            $unique_image_name_01 = uniqid('product_image_') . '.' . $image_extension_01;
            $image_path_01 = $image_folder . $unique_image_name_01;

            if (move_uploaded_file($image_tmp_name_01, $image_path_01)) {
                // Insert product into the database using prepared statements
                $insert_products = $conn->prepare("INSERT INTO `products` (name, details, price, category, image_01) VALUES (?, ?, ?, ?, ?)");
                if ($insert_products->execute([$name, $details, $price, $category, $unique_image_name_01])) {
                    $message[] = 'New product added!';
                } else {
                    $message[] = 'Error inserting product into the database.';
                }
            } else {
                $message[] = 'Error uploading the image.';
            }
        }
    }
}

if (isset($_GET['delete'])) {

    $delete_id = $_GET['delete'];
    $delete_product_image = $conn->prepare("SELECT * FROM `products` WHERE id = ?");
    $delete_product_image->execute([$delete_id]);
    $fetch_delete_image = $delete_product_image->fetch(PDO::FETCH_ASSOC);
    unlink('../uploaded_img/' . $fetch_delete_image['image_01']);
    $delete_product = $conn->prepare("DELETE FROM `products` WHERE id = ?");
    $delete_product->execute([$delete_id]);
    $delete_cart = $conn->prepare("DELETE FROM `cart` WHERE pid = ?");
    $delete_cart->execute([$delete_id]);
    $delete_wishlist = $conn->prepare("DELETE FROM `wishlist` WHERE pid = ?");
    $delete_wishlist->execute([$delete_id]);
    header('location:products.php');
 }
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>products</title>

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <link rel="stylesheet" href="../css/admin_style.css">

</head>
<body>

<?php include '../components/admin_header.php'; ?>

<section class="add-products">

   <h1 class="heading">add product</h1>

   <form action="" method="post" enctype="multipart/form-data">
      <div class="flex">
         <div class="inputBox">
            <span>Product name </span>
            <input type="text" class="box" required maxlength="100" placeholder="Enter product name" name="name">
         </div>
         <div class="inputBox">
            <span>Product price </span>
            <input type="number" min="0" class="box" required max="9999999999" placeholder="Enter product price" onkeypress="if(this.value.length == 10) return false;" name="price">
         </div>
         <div class="inputBox">
            <label for="category"><span>Category</span></label>
            <select id="category" name="category" class="box">
               <option value="YEAR AROUND">YEAR AROUND</option>
               <option value="CHOCOLATE">CHOCOLATE</option>
               <option value="FEST SPECIAL">FEST SPECIAL</option>
               <option value="POPSICLES">POPSICLES</option>
               <option value="FRIDAY FUNDAY">FRIDAY FUNDAY</option>
               <option value="SORBET">SORBET</option>
               <option value="SEASONAL">SEASONAL</option>
            </select>
         </div>

        <div class="inputBox">
            <span>Image</span>
            <input type="file" name="image_01" accept="image/jpg, image/jpeg, image/png, image/webp" class="box" required>
        </div>
         <div class="inputBox">
            <span>Product details </span>
            <textarea name="details" placeholder="Enter product details" class="box" required maxlength="500" cols="30" rows="10"></textarea>
         </div>
      </div>
      
      <input type="submit" value="add product" class="btn" name="add_product">
   </form>

</section>

<section class="show-products">

   <h1 class="heading">Products added</h1>

   <div class="box-container">

   <?php
      $select_products = $conn->prepare("SELECT * FROM `products`");
      $select_products->execute();
      if($select_products->rowCount() > 0){
         while($fetch_products = $select_products->fetch(PDO::FETCH_ASSOC)){ 
   ?>
   <div class="box">
      <img src="../uploaded_img/<?= $fetch_products['image_01']; ?>" alt="">
      <div class="name"><?= $fetch_products['name']; ?></div>
      <div class="price">₹<span><?= $fetch_products['price']; ?></span>/-</div>
      <div class="details"><span><?= $fetch_products['details']; ?></span></div>
      <div class="category"><span><?= $fetch_products['category']; ?></span></div>
      <div class="flex-btn">
         <a href="update_product.php?update=<?= $fetch_products['id']; ?>" class="option-btn">update</a>
         <a href="products.php?delete=<?= $fetch_products['id']; ?>" class="delete-btn" onclick="return confirm('delete this product?');">delete</a>
      </div>
   </div>
   <?php
         }
      }else{
         echo '<p class="empty">no products added yet!</p>';
      }
   ?>
   
   </div>

</section>








<script src="../js/admin_script.js"></script>
   
</body>
</html>