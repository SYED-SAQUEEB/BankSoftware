<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aurangabad Bank – About Us</title>
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
            100% { transform: translateY(0) scale(1); opacity: 1;}
        }

        /* Hero Section for About Us */
        .about-hero-section {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: var(--light-text);
            padding: 8rem 0 6rem; /* Adjusted padding for a sub-page hero */
            position: relative;
            overflow: hidden;
            text-align: center;
            animation: gradient-rotate 20s ease infinite;
        }

        .about-hero-content {
            position: relative;
            z-index: 2;
            max-width: 800px;
            margin: 0 auto;
            animation: fadeInText 1.5s ease-out forwards;
            opacity: 0;
        }

        .about-hero-section h1 {
            font-size: 3.8rem; /* Slightly smaller for sub-page */
            font-weight: 800;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.4);
            line-height: 1.1;
        }

        .about-hero-section p.lead {
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

        /* Specific About Us Section Styles */
        .about-card {
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

        .about-card:hover {
            transform: translateY(-10px) scale(1.01);
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
        }

        .about-card i {
            font-size: 4rem;
            color: var(--accent-color);
            margin-bottom: 1.5rem;
        }

        .about-card h3 {
            font-size: 2.2rem;
            font-weight: 700;
            color: var(--secondary-color);
            margin-bottom: 1rem;
        }

        .about-card p {
            font-size: 1.1rem;
            line-height: 1.8;
            color: var(--dark-text);
        }

        /* History/Milestones */
        .milestone-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 2rem;
        }

        .milestone-year {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--accent-color);
            flex-shrink: 0;
            width: 100px;
            text-align: right;
            padding-right: 1.5rem;
            position: relative;
        }

        .milestone-year::after {
            content: '';
            position: absolute;
            right: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 10px;
            height: 10px;
            background-color: var(--accent-color);
            border-radius: 50%;
            border: 2px solid var(--primary-color);
        }

        .milestone-content {
            padding-left: 1.5rem;
            border-left: 2px solid var(--secondary-color);
        }

        .milestone-content h4 {
            font-size: 1.6rem;
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
        }

        .milestone-content p {
            font-size: 1.05rem;
            color: var(--dark-text);
        }

        /* Leadership Team */
        .team-member-card {
            background-color: var(--light-text);
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 10px 25px var(--card-shadow);
            text-align: center;
            transition: all 0.3s ease;
            height: 100%;
            border: 1px solid rgba(0,0,0,0.05);
        }

        .team-member-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }

        .team-member-card img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 1.5rem;
            border: 4px solid var(--accent-color);
            box-shadow: 0 0 0 6px rgba(0, 200, 150, 0.2);
        }

        .team-member-card h4 {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
        }

        .team-member-card p.title {
            font-size: 1.1rem;
            color: var(--secondary-color);
            margin-bottom: 1rem;
            font-weight: 500;
        }

        .team-member-card p.bio {
            font-size: 0.95rem;
            color: var(--dark-text);
            line-height: 1.6;
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

        .about-card, .team-member-card {
            opacity: 0;
            transform: scale(0.85);
            transition: opacity 1s ease-out, transform 1s ease-out;
        }

        .about-card.is-visible, .team-member-card.is-visible {
            opacity: 1;
            transform: scale(1);
        }

        /* Responsive Adjustments - Replicated from Main Page */
        @media (max-width: 992px) {
            .about-hero-section h1 {
                font-size: 3rem;
            }
            .about-hero-section p.lead {
                font-size: 1.3rem;
            }
            section h2 {
                font-size: 2.8rem;
            }
            .about-card, .team-member-card {
                padding: 2.5rem;
            }
            .about-card i {
                font-size: 3.5rem;
            }
            .about-card h3 {
                font-size: 2rem;
            }
            .team-member-card img {
                width: 120px;
                height: 120px;
            }
            .team-member-card h4 {
                font-size: 1.6rem;
            }
        }

        @media (max-width: 768px) {
            .about-hero-section {
                padding: 6rem 0 4rem;
            }
            .about-hero-section h1 {
                font-size: 2.5rem;
            }
            .about-hero-section p.lead {
                font-size: 1.1rem;
            }
            section {
                padding: 5rem 0;
            }
            section h2 {
                font-size: 2.2rem;
                margin-bottom: 3rem;
            }
            .about-card, .team-member-card {
                padding: 2rem;
                margin-bottom: 2rem;
            }
            .milestone-item {
                flex-direction: column;
                align-items: flex-start;
            }
            .milestone-year {
                text-align: left;
                width: auto;
                padding-right: 0;
                margin-bottom: 0.5rem;
            }
            .milestone-year::after {
                display: none;
            }
            .milestone-content {
                padding-left: 0;
                border-left: none;
            }
            .newsletter-form .btn-primary-custom {
                margin-left: 0;
                margin-top: 1rem;
                width: 100%;
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
                        <a class="nav-link" href="#about-us-hero">About Us</a>
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

    <!-- About Us Hero Section -->
    <section id="about-us-hero" class="about-hero-section d-flex align-items-center">
        <div class="container about-hero-content text-center animated-section">
            <h1 class="display-4 mb-3">About Aurangabad Bank</h1>
            <p class="lead mb-4">Your Trusted Partner in Financial Growth Since [Year Founded]</p>
            <p class="fs-5">At Aurangabad Bank, we are more than just a financial institution; we are a cornerstone of the community, dedicated to fostering economic prosperity and individual well-being.</p>
        </div>
    </section>

    <!-- Mission and Vision Section -->
    <section id="mission-vision" class="py-5 animated-section">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="about-card animated-section">
                        <i class="fas fa-bullseye"></i>
                        <h3>Our Mission</h3>
                        <p>To empower individuals and businesses with secure, innovative, and accessible financial solutions, contributing to the sustainable growth and prosperity of our communities.</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="about-card animated-section">
                        <i class="fas fa-eye"></i>
                        <h3>Our Vision</h3>
                        <p>To be the leading bank in the region, recognized for our unwavering commitment to customer trust, technological excellence, and community development.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Our History/Milestones Section -->
    <section id="history" class="py-5 bg-light animated-section">
        <div class="container">
            <h2 class="mb-5">📜 Our Journey: Key Milestones</h2>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="milestone-item animated-section">
                        <div class="milestone-year">19XX</div>
                        <div class="milestone-content">
                            <h4>Founding of Aurangabad Bank</h4>
                            <p>Established with a vision to serve the local community and provide essential banking services.</p>
                        </div>
                    </div>
                    <div class="milestone-item animated-section">
                        <div class="milestone-year">20XX</div>
                        <div class="milestone-content">
                            <h4>Introduction of Digital Banking</h4>
                            <p>Launched our first online banking platform, bringing convenience and accessibility to our customers.</p>
                        </div>
                    </div>
                    <div class="milestone-item animated-section">
                        <div class="milestone-year">20XX</div>
                        <div class="milestone-content">
                            <h4>Expansion to New Branches</h4>
                            <p>Opened several new branches across the region, extending our reach and service capabilities.</p>
                        </div>
                    </div>
                    <div class="milestone-item animated-section">
                        <div class="milestone-year">20XX</div>
                        <div class="milestone-content">
                            <h4>Launch of Mobile Banking App</h4>
                            <p>Introduced our state-of-the-art mobile banking application for banking on the go.</p>
                        </div>
                    </div>
                    <div class="milestone-item animated-section">
                        <div class="milestone-year">Today</div>
                        <div class="milestone-content">
                            <h4>Continuous Innovation & Growth</h4>
                            <p>We continue to innovate and grow, adapting to the evolving financial landscape while staying true to our core values.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Leadership Team Section -->
    <section id="leadership" class="py-5 animated-section">
        <div class="container">
            <h2 class="mb-5">🤝 Our Leadership Team</h2>
            <div class="row g-4 justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <div class="team-member-card animated-section">
                        <img src="https://placehold.co/150x150/1F3B5D/FFFFFF?text=CEO" alt="CEO Photo">
                        <h4>Johnathan Doe</h4>
                        <p class="title">Chief Executive Officer</p>
                        <p class="bio">With over 25 years of experience in the banking sector, Johnathan leads our strategic vision and growth initiatives.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="team-member-card animated-section">
                        <img src="https://placehold.co/150x150/00C896/FFFFFF?text=COO" alt="COO Photo">
                        <h4>Maria Rodriguez</h4>
                        <p class="title">Chief Operating Officer</p>
                        <p class="bio">Maria oversees the bank's daily operations, ensuring efficiency and excellence in all our services.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="team-member-card animated-section">
                        <img src="https://placehold.co/150x150/0A192F/FFFFFF?text=CFO" alt="CFO Photo">
                        <h4>Ahmed Khan</h4>
                        <p class="title">Chief Financial Officer</p>
                        <p class="bio">Ahmed is responsible for the bank's financial health, managing investments and ensuring fiscal responsibility.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Our Values Section -->
    <section id="values" class="py-5 bg-light animated-section">
        <div class="container">
            <h2 class="mb-5">💖 Our Core Values</h2>
            <div class="row g-4">
                <div class="col-md-6 col-lg-3">
                    <div class="about-card animated-section">
                        <i class="fas fa-hand-holding-heart"></i>
                        <h3>Integrity</h3>
                        <p>Upholding the highest ethical standards in all our interactions and operations.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="about-card animated-section">
                        <i class="fas fa-lightbulb"></i>
                        <h3>Innovation</h3>
                        <p>Continuously seeking new and better ways to serve our customers and adapt to change.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="about-card animated-section">
                        <i class="fas fa-users"></i>
                        <h3>Customer Focus</h3>
                        <p>Placing our customers at the center of everything we do, striving to exceed their expectations.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="about-card animated-section">
                        <i class="fas fa-seedling"></i>
                        <h3>Community</h3>
                        <p>Committed to contributing positively to the communities we serve and fostering local growth.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section - Replicated from Main Page -->
    <section id="contact" class="contact-section animated-section">
        <div class="container">
            <h2 class="mb-4">📞 Get In Touch</h2>
            <p class="lead mb-4">Have questions or need help? Our dedicated support team is ready to assist you anytime.</p>
            <div class="contact-info">
                <p><i class="fas fa-envelope me-2"></i> Email: <a href="mailto:support@aurangabadbank.com">support@aurangabadbank.com</a></p>
                <p><i class="fas fa-phone-alt me-2"></i> Call: <a href="tel:18001234567">1800-123-4567</a> (Toll-Free)</p>
            </div>
            <p class="tagline mt-5 fs-4">Aurangabad Bank – Where Innovation Meets Trust.</p>
        </div>
    </section>

    <!-- Footer - Replicated from Main Page -->
    <footer class="text-center">
        <div class="container">
            <div class="row">
                <div class="col-md-3 mb-4 mb-md-0">
                    <h5 class="footer-heading">About Us</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Our Story</a></li>
                        <li><a href="#">Careers</a></li>
                        <li><a href="#">Press</a></li>
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
                        <li><a href="#contact">Contact Us</a></li>
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
        const animatedElements = document.querySelectorAll('.animated-section, .about-card, .team-member-card');

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
