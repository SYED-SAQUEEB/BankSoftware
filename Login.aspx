<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aurangabad Bank – Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Google Fonts - Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" xintegrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0V4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        /* Custom CSS for Aurangabad Bank - Replicated from Main Page */
        :root {
            --primary-color: #0A192F; /* Deep Navy Blue */
            --secondary-color: #1F3B5D; /* Slightly Lighter Navy */
            --accent-color: #00C896; /* Vibrant Teal Green */
            --light-bg: #E0E7EB; /* Very Light Grayish Blue */
            --dark-text: #334155; /* Soft Dark Gray */
            --light-text: #FFFFFF;
            --card-shadow: rgba(0, 0, 0, 0.15); /* Moderate shadow */
            --glass-bg: rgba(255, 255, 255, 0.15); /* Glassmorphism background */
            --glass-border: rgba(255, 255, 255, 0.2); /* Glassmorphism border */
        }

        body {
            font-family: 'Inter', sans-serif;
            color: var(--dark-text);
            background-color: var(--light-bg);
            overflow-x: hidden; /* Prevent horizontal scroll */
            line-height: 1.7; /* Improved readability */
        }

        /* Navbar Styling */
        .navbar {
            background-color: var(--primary-color);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            transition: background-color 0.4s ease-in-out;
        }

        .navbar-brand {
            color: var(--light-text) !important;
            font-weight: 700;
            font-size: 1.8rem;
            letter-spacing: 1px;
            animation: fadeInDown 0.8s ease-out;
            position: relative;
            overflow: hidden;
        }

        .navbar-brand i {
            color: var(--accent-color);
        }

        /* Logo Shimmer Effect */
        .navbar-brand::after {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.8s ease-in-out;
            animation: shimmer 3s infinite;
        }

        @keyframes shimmer {
            0% { left: -100%; }
            50% { left: 100%; }
            100% { left: -100%; }
        }

        /* Dynamic Scaling on Scroll (handled by JS) */
        .navbar-brand.scrolled {
            font-size: 1.5rem;
        }

        .nav-link {
            color: var(--light-text) !important;
            font-weight: 500;
            padding: 0.8rem 1.2rem;
            position: relative;
            transition: all 0.3s ease;
        }

        /* Navigation Underline Animation */
        .nav-link::after {
            content: '';
            position: absolute;
            bottom: 5px;
            left: 50%;
            width: 0;
            height: 2px;
            background-color: var(--accent-color);
            transition: all 0.3s ease;
            transform: translateX(-50%);
        }

        .nav-link:hover::after {
            width: 80%;
        }

        /* Glassmorphism Buttons */
        .btn-glass {
            background: var(--glass-bg);
            border: 1px solid var(--glass-border);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            color: var(--light-text);
            padding: 0.8rem 1.8rem;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            animation: bounceIn 1s ease-out forwards;
            opacity: 0;
        }

        .btn-glass:hover {
            background: rgba(255, 255, 255, 0.25);
            border-color: rgba(255, 255, 255, 0.3);
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
        }

        @keyframes bounceIn {
            0% { opacity: 0; transform: translateY(-50px) scale(0.8); }
            60% { opacity: 1; transform: translateY(10px) scale(1.05); }
            80% { transform: translateY(-5px) scale(0.95); }
            100% { opacity: 1; transform: translateY(0) scale(1); }
        }

        /* Main Content Area for Login Page */
        .login-container {
            min-height: calc(100vh - 160px); /* Adjust based on navbar/footer height */
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 4rem 0;
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%); /* Background similar to hero */
        }

        .login-card {
            background-color: var(--light-text);
            border-radius: 25px;
            padding: 3.5rem;
            box-shadow: 0 20px 40px var(--card-shadow);
            transition: all 0.5s cubic-bezier(0.25, 0.8, 0.25, 1);
            max-width: 500px;
            width: 100%;
            text-align: center;
            border: 1px solid rgba(0,0,0,0.05);
            animation: fadeInScale 1s ease-out forwards; /* Entrance animation */
            opacity: 0;
            transform: scale(0.9);
        }

        @keyframes fadeInScale {
            0% { opacity: 0; transform: scale(0.9); }
            100% { opacity: 1; transform: scale(1); }
        }

        .login-card h2 {
            font-size: 2.8rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 2.5rem;
            position: relative;
        }

        .login-card h2::after {
            content: '';
            display: block;
            width: 80px;
            height: 5px;
            background-color: var(--accent-color);
            margin: 1rem auto 0;
            border-radius: 3px;
        }

        .login-card .form-control {
            border-radius: 10px;
            padding: 0.9rem 1.2rem;
            border: 1px solid rgba(0, 0, 0, 0.1);
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }

        .login-card .form-control:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(0, 200, 150, 0.25);
        }

        .login-card .btn-primary-custom {
            padding: 0.9rem 2.2rem;
            border-radius: 30px;
            font-weight: 600;
            letter-spacing: 0.5px;
            box-shadow: 0 5px 15px rgba(52, 211, 153, 0.3);
        }

        .login-card .forgot-password {
            margin-top: 1.5rem;
            font-size: 1rem;
        }

        .login-card .forgot-password a {
            color: var(--secondary-color);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .login-card .forgot-password a:hover {
            color: var(--accent-color);
            text-decoration: underline;
        }

        /* Footer Design - Replicated from Main Page */
        footer {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: rgba(255, 255, 255, 0.9);
            padding: 5rem 0;
            font-size: 0.95rem;
            text-align: center;
            box-shadow: 0 -4px 20px rgba(0, 0, 0, 0.3);
        }

        footer a {
            color: rgba(255, 255, 255, 0.95);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        footer a:hover {
            color: var(--accent-color);
        }

        .footer-heading {
            color: var(--accent-color);
            font-weight: 600;
            margin-bottom: 1.5rem;
            font-size: 1.3rem;
        }

        .social-icons a {
            font-size: 1.8rem;
            margin: 0 1rem;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
        }

        .social-icons a::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background-color: var(--accent-color);
            border-radius: 50%;
            opacity: 0;
            transform: translate(-50%, -50%);
            transition: all 0.3s ease;
            z-index: -1;
        }

        .social-icons a:hover::before {
            width: 120%;
            height: 120%;
            opacity: 0.3;
        }

        .social-icons a:hover {
            transform: translateY(-5px) scale(1.1);
            color: var(--light-text) !important;
            text-shadow: 0 0 15px var(--accent-color);
        }

        .newsletter-form .form-control {
            border-radius: 30px;
            padding: 0.75rem 1.5rem;
            border: 1px solid rgba(255, 255, 255, 0.3);
            background-color: rgba(255, 255, 255, 0.1);
            color: var(--light-text);
            transition: all 0.3s ease;
        }

        .newsletter-form .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        .newsletter-form .form-control:focus {
            background-color: rgba(255, 255, 255, 0.2);
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(0, 200, 150, 0.25);
        }

        .newsletter-form .btn-primary-custom {
            border-radius: 30px;
            margin-left: 1rem;
            padding: 0.75rem 2rem;
            position: relative;
            overflow: hidden;
        }

        .newsletter-form .btn-primary-custom::after {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.2);
            transition: all 0.5s ease;
            transform: skewX(-20deg);
        }

        .newsletter-form .btn-primary-custom:hover::after {
            left: 100%;
        }

        .copyright-text {
            margin-top: 2rem;
            font-size: 0.85rem;
            color: rgba(255, 255, 255, 0.7);
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .login-card {
                padding: 2.5rem;
            }
            .login-card h2 {
                font-size: 2.2rem;
                margin-bottom: 2rem;
            }
            .navbar-brand {
                font-size: 1.5rem;
            }
            .nav-link {
                padding: 0.6rem 1rem;
            }
            .btn-glass {
                padding: 0.6rem 1.2rem;
            }
            footer {
                padding: 3rem 0;
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">
            <a class="navbar-brand" href="Home.aspx">
                <i class="fas fa-gem me-2"></i> Aurangabad Bank
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="Home.aspx">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AboutUs.aspx">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Contact.aspx">Contact</a>
                    </li>
                    <li class="nav-item ms-lg-3">
                        <button class="btn btn-glass" style="animation-delay: 0.5s;" onclick="location.href='Login.aspx'">Login</button>
                    </li>
                    <li class="nav-item ms-lg-2">
                        <button class="btn btn-glass" style="animation-delay: 0.7s;">Open Acct</button>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Login Content Section -->
    <section class="login-container">
        <div class="login-card">
            <h2><i class="fas fa-user-circle me-2"></i> Member Login</h2>
            <form id="form1" runat="server">
                <div class="mb-4">
                    <asp:Label ID="lblUsername" runat="server" Text="Username" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter your username" />
                </div>
                <div class="mb-4">
                    <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your password" />
                </div>
             <div class="d-grid gap-2 mb-3">
    <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary-custom btn-lg" Text="Login" OnClick="btnLogin_Click" />
</div>

<!-- 🔴 Show login error/success message here -->
<asp:Label ID="lblMsg" runat="server" ForeColor="Red" CssClass="mt-3 d-block"></asp:Label>

<div class="forgot-password">
    <a href="#">Forgot Password?</a>
</div>

            </form>
        </div>
    </section>

    <!-- Footer - Replicated from Main Page -->
    <footer class="text-center">
        <div class="container">
            <div class="row">
                <div class="col-md-3 mb-4 mb-md-0">
                    <h5 class="footer-heading">About Us</h5>
                    <ul class="list-unstyled">
                        <li><a href="AboutUs.aspx#mission-vision">Our Story</a></li>
                        <li><a href="AboutUs.aspx#leadership">Careers</a></li>
                        <li><a href="AboutUs.aspx#history">Press</a></li>
                        <li><a href="#">Partnerships</a></li>
                    </ul>
                </div>
                <div class="col-md-3 mb-4 mb-md-0">
                    <h5 class="footer-heading">Services</h5>
                    <ul class="list-unstyled">
                        <li><a href="Home.aspx#cards">Cards</a></li>
                        <li><a href="Home.aspx#locker-services">Locker Services</a></li>
                        <li><a href="Home.aspx#core-features">Loans</a></li>
                        <li><a href="Home.aspx#core-features">Accounts</a></li>
                    </ul>
                </div>
                <div class="col-md-3 mb-4 mb-md-0">
                    <h5 class="footer-heading">Support</h5>
                    <ul class="list-unstyled">
                        <li><a href="Contact.aspx">Contact Us</a></li>
                        <li><a href="#">FAQs</a></li>
                        <li><a href="#">Security</a></li>
                        <li><a href="#">Site Map</a></li>
                    </ul>
                </div>
                <div class="col-md-3 mb-4 mb-md-0">
                    <h5 class="footer-heading">Stay Connected</h5>
                    <p>Subscribe to our newsletter for the latest updates.</p>
                    <form class="newsletter-form d-flex justify-content-center">
                        <input type="email" class="form-control me-2" placeholder="Your email" required>
                        <button type="submit" class="btn btn-primary-custom">Subscribe</button>
                    </form>
                    <div class="social-icons mt-4">
                        <a href="#" class="text-light"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="text-light"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="text-light"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#" class="text-light"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <p class="copyright-text mt-5">&copy; <span id="currentYear"></span> Aurangabad Bank. All rights reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" xintegrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        // Dynamic Current Year for Footer
        document.getElementById('currentYear').textContent = new Date().getFullYear();

        // Navbar Shrink/Expand on Scroll
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            const navbarBrand = document.querySelector('.navbar-brand');
            if (window.scrollY > 50) {
                navbar.style.backgroundColor = 'rgba(10, 25, 47, 0.95)';
                navbar.style.padding = '0.5rem 0';
                navbarBrand.classList.add('scrolled');
            } else {
                navbar.style.backgroundColor = 'var(--primary-color)';
                navbar.style.padding = '1rem 0';
                navbarBrand.classList.remove('scrolled');
            }
        });

        // Smooth scrolling for navigation links (if any internal to this page)
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });
    </script>
</body>
</html>
