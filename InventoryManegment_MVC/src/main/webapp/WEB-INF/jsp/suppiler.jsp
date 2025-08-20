<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="module/header.jsp" />

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!--start page wrapper -->
<div class="page-wrapper">
  <div class="page-content d-flex justify-content-center align-items-center min-vh-100 bg-light">

    <div class="card shadow-sm" style="max-width: 450px; width: 100%;">
      <div class="card-body">
        <h2 class="text-center mb-4">Add New Supplier</h2>

        <form action="/supplierform" method="post" onsubmit="return validateForm();">

          <!-- Supplier Name -->
          <div class="mb-3">
            <label for="name" class="form-label">Supplier Name</label>
            <input type="text" class="form-control" name="name" id="name" required>
            <div id="nameError" class="text-danger small"></div>
          </div>

          <!-- Contact Info -->
          <div class="mb-3">
            <label for="contactInfo" class="form-label">Contact Info</label>
            <input type="text" class="form-control" name="contactInfo" id="contactInfo">
            <div id="contactError" class="text-danger small"></div>
          </div>

          <!-- Address -->
          <div class="mb-3">
            <label for="address" class="form-label">Address</label>
            <input type="text" class="form-control" name="address" id="address">
            <div id="addressError" class="text-danger small"></div>
          </div>

          <!-- Submit Button -->
          <div class="d-grid">
            <button type="submit" class="btn btn-success">Save Supplier</button>
          </div>
        </form>
      </div>
    </div>

  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
  function validateForm() {
    const name = document.getElementById("name").value.trim();
    const contactInfo = document.getElementById("contactInfo").value.trim();
    const address = document.getElementById("address").value.trim();

    let isValid = true;

    // Clear errors
    document.getElementById("nameError").textContent = "";
    document.getElementById("contactError").textContent = "";
    document.getElementById("addressError").textContent = "";

    // Name validation
    const nameRegex = /^[A-Za-z\s]+$/;
    if (!nameRegex.test(name)) {
      document.getElementById("nameError").textContent = "Name must contain only letters.";
      isValid = false;
    }

    // Contact validation
    if (contactInfo !== "") {
      const phoneRegex = /^[0-9]{10}$/;
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!phoneRegex.test(contactInfo) && !emailRegex.test(contactInfo)) {
        document.getElementById("contactError").textContent = "Enter a valid 10-digit phone or email.";
        isValid = false;
      }
    }

    // Address validation
    const addressRegex = /^[A-Za-z0-9\s,.-]{5,}$/;
    if (address !== "" && !addressRegex.test(address)) {
      document.getElementById("addressError").textContent = "Address must be at least 5 characters.";
      isValid = false;
    }

    return isValid;
  }
</script>

<jsp:include page="module/footer.jsp" />
