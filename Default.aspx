<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Aurangabad Central Bank</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="CSS/style.css" />
</head>
<body>
    <form id="form1" runat="server">

        <!-- HEADER -->
        <div class="header text-center py-4 shadow-sm">
            <img src="Images/logo.png" alt="Bank Logo" class="bank-logo" />
            <h1 class="bank-title">Aurangabad Central Bank</h1>
            <p class="intro-text" id="introText">Securing Your Future, Today</p>
        </div>

        <!-- ABOUT SECTION -->
        <section class="about-us container my-5">
            <h2 class="text-center">About Us</h2>
            <p class="text-center">
                Welcome to Aurangabad Central Bank – Your Trusted Partner in Financial Growth. 
                We are committed to delivering safe, modern, and customer-first banking experiences 
                for individuals and businesses alike.
            </p>
        </section>

        <!-- SERVICES SECTION -->
        <section class="services container my-5">
            <h2 class="text-center mb-4">Our Services</h2>
            <div class="row text-center">
                <div class="col-md-3 mb-4">
                    <div class="service-box shadow p-3 rounded bg-white h-100">
                        <h5>💳 Card Services</h5>
                        <p>We offer Debit & Credit Cards with great features and easy applications.</p>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="service-box shadow p-3 rounded bg-white h-100">
                        <h5>🏡 Loans</h5>
                        <p>Personal, Home & Auto Loans at competitive rates with quick approvals.</p>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="service-box shadow p-3 rounded bg-white h-100">
                        <h5>📈 Investments</h5>
                        <p>Grow your money with savings accounts and fixed deposits.</p>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="service-box shadow p-3 rounded bg-white h-100">
                        <h5>💻 Digital Banking</h5>
                        <p>24/7 secure online access to your banking services.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- CTA SECTION -->
        <section class="cta-section text-center my-5">
            <a href="Account/Login.aspx" class="btn btn-primary mx-2">User Login</a>
            <a href="Account/Register.aspx" class="btn btn-success mx-2">New Bank Account</a>
            <a href="Account/ManagerLogin.aspx" class="btn btn-dark mx-2">Manager Login</a>
        </section>

        <!-- CONTACT -->
        <section class="contact-section container text-center my-5">
            <h4>Contact Us</h4>
            <p>Email: contact@aurangabadbank.com | Phone: +91-99999-88888</p>
            <p>Address: 123 Bank Street, Aurangabad, Maharashtra, India</p>
        </section>

        <!-- FOOTER -->
        <footer class="footer text-center text-white py-3 bg-dark">
            &copy; 2025 Aurangabad Central Bank | <a href="#" class="text-light">Privacy Policy</a>
        </footer>

    </form>

    <!-- Script for intro animation -->
    <script>
        setTimeout(() => {
            document.getElementById("introText").style.display = "none";
        }, 3000);
    </script>
</body>
</html>
