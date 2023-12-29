# 🛒 Store App

A Flutter Store App that allows users to manage products, retrieve various categories, fetch products by category name, update existing products using HTTP PUT requests, and add new products using HTTP POST requests.

## Features

- **Product Management:** Enables users to manage products (Create, Read, Update) operations.
- **Category Retrieval:** Fetches all available categories of products.
- **Fetch Products by Category:** Retrieve products based on a specific category name.
- **Update Products:** Allows updating existing products using HTTP PUT requests.
- **Add New Products:** Enables the addition of new products via HTTP POST requests.

## Dependencies Used:

- `http` package for making HTTP requests to communicate with the API endpoints.
- `model_progress_hud` package for displaying progress indicators while performing operations.

### How to Use:

1. **Get All Products:** Use the appropriate API endpoint to retrieve all available products.
2. **Get Categories:** Fetch a list of all categories offered by the store.
3. **Get Products by Category:** Provide the category name to fetch products falling under that category.
4. **Update Product:** Utilize HTTP PUT request by providing necessary details to update an existing product.
5. **Add New Product:** Make an HTTP POST request to add a new product, supplying required product information.

### APIs and Endpoints:

- **GET `/products`:** Retrieve all products.
- **GET `/categories`:** Get a list of available categories.
- **GET `/products/{categoryName}`:** Fetch products based on a specific category.
- **PUT `/products/{productId}`:** Update a product by its ID.
- **POST `/products`:** Add a new product.
