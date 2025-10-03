<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aurangabad Bank – Contact Us</title>
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

        /* Hero Section for Contact Us */
        .contact-hero-section {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: var(--light-text);
            padding: 8rem 0 6rem; /* Adjusted padding for a sub-page hero */
            position: relative;
            overflow: hidden;
            text-align: center;
            animation: gradient-rotate 20s ease infinite;
        }

        .contact-hero-content {
            position: relative;
            z-index: 2;
            max-width: 800px;
            margin: 0 auto;
            animation: fadeInText 1.5s ease-out forwards;
            opacity: 0;
        }

        .contact-hero-section h1 {
            font-size: 3.8rem; /* Slightly smaller for sub-page */
            font-weight: 800;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.4);
            line-height: 1.1;
        }

        .contact-hero-section p.lead {
            font-size: 1.5rem;
            margin-bottom: 2rem;
            font-weight: 300;
        }

        /* Section Styling - Replicated from Main Page */
        section {
            padding: 8rem 0;
            position: relative;
            overflow: hidden;
        }

        section:nth-of-type(odd) {
            background-color: var(--light-bg);
        }

        section h2 {
            font-size: 3.5rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 5rem;
            text-align: center;
            position: relative;
            line-height: 1.2;
        }

        section h2::after {
            content: '';
            display: block;
            width: 140px;
            height: 6px;
            background-color: var(--accent-color);
            margin: 1.8rem auto 0;
            border-radius: 3px;
        }

        /* Contact Info Cards */
        .contact-info-card {
            background-color: var(--light-text);
            border-radius: 25px;
            padding: 3rem;
            box-shadow: 0 15px 30px var(--card-shadow);
            transition: all 0.5s cubic-bezier(0.25, 0.8, 0.25, 1);
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            border: 1px solid rgba(0,0,0,0.05);
        }

        .contact-info-card:hover {
            transform: translateY(-10px) scale(1.01);
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
        }

        .contact-info-card i {
            font-size: 4rem;
            color: var(--accent-color);
            margin-bottom: 1.5rem;
        }

        .contact-info-card h3 {
            font-size: 2.2rem;
            font-weight: 700;
            color: var(--secondary-color);
            margin-bottom: 1rem;
        }

        .contact-info-card p {
            font-size: 1.1rem;
            line-height: 1.8;
            color: var(--dark-text);
        }

        .contact-info-card a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .contact-info-card a:hover {
            color: var(--accent-color);
        }

        /* Contact Form */
        .contact-form-card {
            background-color: var(--light-text);
            border-radius: 25px;
            padding: 3rem;
            box-shadow: 0 15px 30px var(--card-shadow);
            transition: all 0.5s cubic-bezier(0.25, 0.8, 0.25, 1);
            border: 1px solid rgba(0,0,0,0.05);
        }

        .contact-form-card:hover {
            transform: translateY(-10px) scale(1.01);
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
        }

        .contact-form-card .form-control {
            border-radius: 10px;
            padding: 0.8rem 1.2rem;
            border: 1px solid rgba(0, 0, 0, 0.1);
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }

        .contact-form-card .form-control:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(0, 200, 150, 0.25);
        }

        .contact-form-card textarea.form-control {
            min-height: 150px;
            resize: vertical;
        }

        /* Map Section */
        .map-section {
            background-color: var(--light-bg);
            padding: 0; /* No padding as iframe takes full space */
        }

        .map-container {
            border-radius: 25px;
            overflow: hidden;
            box-shadow: 0 15px 30px var(--card-shadow);
            margin: 0 auto;
            max-width: 1200px; /* Constrain map width */
            height: 500px; /* Fixed height for the map */
            transition: all 0.5s ease;
        }

        .map-container:hover {
            transform: scale(1.005);
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
        }

        .map-container iframe {
            width: 100%;
            height: 100%;
            border: none;
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

        /* Scroll-based animations - Replicated from Main Page */
        .animated-section {
            opacity: 0;
            transform: translateY(80px);
            transition: opacity 1.2s ease-out, transform 1.2s ease-out;
        }

        .animated-section.is-visible {
            opacity: 1;
            transform: translateY(0);
        }

        .contact-info-card, .contact-form-card, .map-container {
            opacity: 0;
            transform: scale(0.85);
            transition: opacity 1s ease-out, transform 1s ease-out;
        }

        .contact-info-card.is-visible, .contact-form-card.is-visible, .map-container.is-visible {
            opacity: 1;
            transform: scale(1);
        }

        /* Responsive Adjustments - Replicated from Main Page */
        @media (max-width: 992px) {
            .contact-hero-section h1 {
                font-size: 3rem;
            }
            .contact-hero-section p.lead {
                font-size: 1.3rem;
            }
            section h2 {
                font-size: 2.8rem;
            }
            .contact-info-card, .contact-form-card {
                padding: 2.5rem;
            }
            .contact-info-card i {
                font-size: 3.5rem;
            }
            .contact-info-card h3 {
                font-size: 2rem;
            }
        }

        @media (max-width: 768px) {
            .contact-hero-section {
                padding: 6rem 0 4rem;
            }
            .contact-hero-section h1 {
                font-size: 2.5rem;
            }
            .contact-hero-section p.lead {
                font-size: 1.1rem;
            }
            section {
                padding: 5rem 0;
            }
            section h2 {
                font-size: 2.2rem;
                margin-bottom: 3rem;
            }
            .contact-info-card, .contact-form-card {
                padding: 2rem;
                margin-bottom: 2rem;
            }
            .newsletter-form .btn-primary-custom {
                margin-left: 0;
                margin-top: 1rem;
                width: 100%;
            }
            .map-container {
                height: 350px; /* Adjust height for mobile */
            }
        }

        /* Smooth Scroll */
        html {
            scroll-behavior: smooth;
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
                        <a class="nav-link" href="#contact-hero">Contact</a>
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

    <!-- Contact Us Hero Section -->
    <section id="contact-hero" class="contact-hero-section d-flex align-items-center">
        <div class="container contact-hero-content text-center animated-section">
            <h1 class="display-4 mb-3">Get in Touch with Aurangabad Bank</h1>
            <p class="lead mb-4">We're here to help you with all your banking needs.</p>
            <p class="fs-5">Whether you have a question, need support, or want to provide feedback, our team is ready to assist you.</p>
        </div>
    </section>

    <!-- Contact Information Section -->
    <section id="contact-info" class="py-5 animated-section">
        <div class="container">
            <h2 class="mb-5">📍 Our Contact Information</h2>
            <div class="row g-4 justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <div class="contact-info-card animated-section">
                        <i class="fas fa-map-marker-alt"></i>
                        <h3>Our Main Branch</h3>
                        <p>123 Bank Street, Financial District,</p>
                        <p>Aurangabad, Maharashtra, India - 431001</p>
                        <a href="https://www.google.com/maps/search/Aurangabad+Bank+near+me" target="_blank" class="mt-2">Get Directions</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="contact-info-card animated-section">
                        <i class="fas fa-phone-alt"></i>
                        <h3>Call Us</h3>
                        <p>Toll-Free: <a href="tel:18001234567">1800-123-4567</a></p>
                        <p>Local: <a href="tel:+912402345678">+91-240-2345678</a></p>
                        <p class="text-muted">Available 24/7</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="contact-info-card animated-section">
                        <i class="fas fa-envelope"></i>
                        <h3>Email Us</h3>
                        <p>General Inquiries: <a href="mailto:info@aurangabadbank.com">info@aurangabadbank.com</a></p>
                        <p>Support: <a href="mailto:support@aurangabadbank.com">support@aurangabadbank.com</a></p>
                        <p class="text-muted">We aim to respond within 24 hours</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Form Section -->
    <section id="contact-form" class="py-5 bg-light animated-section">
        <div class="container">
            <h2 class="mb-5">✉️ Send Us a Message</h2>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="contact-form-card animated-section">
                        <form id="form1" runat="server">
                            <%-- Removed asp:ScriptManager as it's a server-side control and causes errors in client-side rendering environments like Canvas --%>

                            <div class="mb-4">
                                <asp:Label ID="lblFullName" runat="server" Text="Full Name" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter your full name" />
                            </div>
                            <div class="mb-4">
                                <asp:Label ID="lblEmail" runat="server" Text="Email Address" CssClass="form-label"></asp:Label>
                               <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="SingleLine" />

                            </div>
                            <div class="mb-4">
                                <asp:Label ID="lblSubject" runat="server" Text="Subject" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Subject of your inquiry" />
                            </div>
                            <div class="mb-4">
                                <asp:Label ID="lblMessage" runat="server" runat="server" Text="Your Message" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="6" CssClass="form-control" placeholder="Type your message here..." />
                            </div>
                            <div class="d-grid gap-2">
                                <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary-custom btn-lg" Text="Send Message" OnClick="btnSend_Click" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Map Section -->
    <section id="our-location" class="map-section animated-section">
        <div class="container">
            <h2 class="mb-5">🗺️ Find Us on the Map</h2>
            <div class="map-container animated-section">
                <!-- Google Maps Embed - Placeholder -->
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15000.000000000002!2d75.32000000000001!3d19.870000000000005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bd910f1b2d7d23d%3A0x7d0e4c6c2e3d4f8!2sAurangabad%2C%20Maharashtra!5e0!3m2!1sen!2sin!4v1700000000000!5m2!1sen!2sin"
                    allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
                </iframe>
            </div>
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
                        <li><a href="#contact-hero">Contact Us</a></li>
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

        // Smooth scrolling for navigation links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });

        // Scroll-based animations (Intersection Observer)
        const animatedElements = document.querySelectorAll('.animated-section, .contact-info-card, .contact-form-card, .map-container');

        const observerOptions = {
            root: null,
            rootMargin: '0px',
            threshold: 0.1
        };

        const observer = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('is-visible');
        if (!entry.target.classList.contains('continuous-animation')) {
            observer.unobserve(entry.target);
        }
        }
        });
        }, observerOptions);

        animatedElements.forEach(element => {
            observer.observe(element);
        });
    </script>
</body>
</html>
