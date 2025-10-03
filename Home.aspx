<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aurangabad Bank – The Future of Secure, Dynamic Banking</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Google Fonts - Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" xintegrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0V4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Chart.js for interactive graphs -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        /* Custom CSS for Aurangabad Bank */
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

        /* Hero Section */
        .hero-section {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: var(--light-text);
            padding: 12rem 0;
            position: relative;
            overflow: hidden;
            text-align: center;
            animation: gradient-rotate 20s ease infinite; /* Rotating background gradient */
        }

        @keyframes gradient-rotate {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .hero-content {
            position: relative;
            z-index: 2;
            max-width: 1000px;
            margin: 0 auto;
            animation: fadeInText 1.5s ease-out forwards; /* Fade-in text */
            opacity: 0;
        }

        @keyframes fadeInText {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        #hero-canvas {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1;
            opacity: 0.1;
        }

        .hero-section h1 {
            font-size: 4.8rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
            text-shadow: 3px 3px 10px rgba(0, 0, 0, 0.5);
            line-height: 1.1;
        }

        .hero-section p.lead {
            font-size: 2rem;
            margin-bottom: 3rem;
            font-weight: 300;
        }

        /* Section Styling */
        section {
            padding: 8rem 0; /* More generous padding */
            position: relative;
            overflow: hidden;
        }

        section:nth-of-type(even) {
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

        /* Feature Cards (Why Choose Us) */
        .feature-card {
            background-color: var(--light-text);
            border-radius: 25px;
            padding: 3.5rem;
            box-shadow: 0 20px 40px var(--card-shadow);
            transition: all 0.5s cubic-bezier(0.25, 0.8, 0.25, 1);
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            position: relative;
            z-index: 1;
            overflow: hidden;
            border: 1px solid rgba(0, 0, 0, 0.05); /* Subtle border for definition */
        }

        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(0, 200, 150, 0.08) 0%, rgba(10, 25, 47, 0.08) 100%);
            opacity: 0;
            transition: opacity 0.4s ease;
            z-index: -1;
        }

        .feature-card:hover::before {
            opacity: 1;
        }

        .feature-card:hover {
            transform: translateY(-18px) scale(1.03);
            box-shadow: 0 30px 60px rgba(0, 0, 0, 0.25);
        }

        .feature-card i {
            font-size: 5rem; /* Even larger, more prominent icons */
            color: var(--accent-color);
            margin-bottom: 2.5rem;
            animation: pulse 2.5s infinite ease-in-out;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .feature-card h3 {
            font-size: 2.4rem;
            font-weight: 700;
            color: var(--secondary-color);
            margin-bottom: 1.5rem;
            line-height: 1.3;
        }

        .feature-card p {
            font-size: 1.15rem;
            line-height: 1.8;
            color: var(--dark-text);
        }

        /* Card Sections (ATM, Credit, Debit) */
        .card-module {
            perspective: 1000px; /* For 3D flip effect */
            height: 350px; /* Fixed height for cards */
            margin-bottom: 3rem;
        }

        .card-inner {
            position: relative;
            width: 100%;
            height: 100%;
            text-align: center;
            transition: transform 0.8s;
            transform-style: preserve-3d;
            border-radius: 25px;
            box-shadow: 0 15px 30px var(--card-shadow);
        }

        .card-module:hover .card-inner {
            transform: rotateY(180deg);
        }

        .card-front, .card-back {
            position: absolute;
            width: 100%;
            height: 100%;
            -webkit-backface-visibility: hidden; /* Safari */
            backface-visibility: hidden;
            border-radius: 25px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 2rem;
            color: var(--light-text);
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
        }

        .card-back {
            transform: rotateY(180deg);
            background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
        }

        .card-front i {
            font-size: 4rem;
            margin-bottom: 1.5rem;
            color: var(--accent-color);
        }

        .card-front h3 {
            font-size: 2.2rem;
            font-weight: 700;
        }

        .card-back p {
            font-size: 1.1rem;
            line-height: 1.6;
        }

        /* Silver Card Feature Section */
        .silver-card-section {
            background-color: var(--primary-color);
            color: var(--light-text);
            padding: 8rem 0;
            position: relative;
            overflow: hidden;
            text-align: center;
        }

        .silver-card-content {
            z-index: 2;
            position: relative;
        }

        .silver-card-visual {
            position: relative;
            width: 350px;
            height: 220px;
            background: linear-gradient(135deg, #A7A7A7, #C0C0C0); /* Silver gradient */
            border-radius: 20px;
            margin: 0 auto 3rem auto;
            box-shadow: 0 0 30px rgba(0, 200, 150, 0.7); /* Glowing outline */
            transition: transform 0.4s ease-out, box-shadow 0.4s ease-out;
            transform-style: preserve-3d;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary-color);
            text-shadow: 1px 1px 3px rgba(0,0,0,0.2);
        }

        .silver-card-visual::before {
            content: 'AURANGABAD';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 1.5rem;
            color: rgba(0,0,0,0.3);
            font-weight: 800;
            letter-spacing: 2px;
        }

        .silver-card-visual:hover {
            transform: translateY(-15px) rotateX(5deg) rotateY(5deg); /* Hover-lift effect */
            box-shadow: 0 0 50px rgba(0, 200, 150, 1), 0 20px 40px rgba(0, 0, 0, 0.4);
        }

        .spark-icon {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 2rem;
            color: #FFD700; /* Gold color for spark */
            animation: rotateSpark 3s linear infinite;
        }

        @keyframes rotateSpark {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .silver-card-cta .btn-primary-custom {
            animation: pulsating-shadow 2s infinite ease-in-out, radial-gradient-anim 4s infinite linear;
            background-size: 200% 200%;
        }

        @keyframes pulsating-shadow {
            0% { box-shadow: 0 0 10px rgba(0, 200, 150, 0.4); }
            50% { box-shadow: 0 0 25px rgba(0, 200, 150, 0.8); }
            100% { box-shadow: 0 0 10px rgba(0, 200, 150, 0.4); }
        }

        @keyframes radial-gradient-anim {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Locker Services */
        .locker-plan-card {
            background-color: var(--light-text);
            border-radius: 20px;
            padding: 2.5rem;
            box-shadow: 0 10px 25px var(--card-shadow);
            transition: all 0.4s ease;
            text-align: center;
            height: 100%;
            border: 1px solid rgba(0,0,0,0.05);
        }

        .locker-plan-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }

        .locker-plan-card i {
            font-size: 4rem;
            color: var(--accent-color);
            margin-bottom: 1.5rem;
        }

        .locker-plan-card h4 {
            font-size: 2rem;
            font-weight: 700;
            color: var(--secondary-color);
            margin-bottom: 1rem;
        }

        .locker-plan-card ul {
            list-style: none;
            padding: 0;
            text-align: left;
            margin-top: 1.5rem;
        }

        .locker-plan-card ul li {
            margin-bottom: 0.8rem;
            font-size: 1.1rem;
            color: var(--dark-text);
            display: flex;
            align-items: center;
            animation: slideInLeft 0.8s ease-out forwards; /* Animated list items */
            opacity: 0;
        }

        .locker-plan-card ul li:nth-child(1) { animation-delay: 0.1s; }
        .locker-plan-card ul li:nth-child(2) { animation-delay: 0.2s; }
        .locker-plan-card ul li:nth-child(3) { animation-delay: 0.3s; }
        .locker-plan-card ul li:nth-child(4) { animation-delay: 0.4s; }

        @keyframes slideInLeft {
            0% { opacity: 0; transform: translateX(-20px); }
            100% { opacity: 1; transform: translateX(0); }
        }

        .locker-plan-card ul li i {
            font-size: 1.2rem;
            margin-right: 0.8rem;
            color: var(--accent-color);
        }

        /* Modal Pop-up Styling */
        .modal-content {
            border-radius: 25px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.4); /* Layered shadow */
            animation: zoomIn 0.5s ease-out forwards;
            background: var(--light-bg);
            border: none;
        }

        @keyframes zoomIn {
            0% { opacity: 0; transform: scale(0.8); }
            100% { opacity: 1; transform: scale(1); }
        }

        .modal-header {
            border-bottom: none;
            padding: 1.5rem 2rem;
            background-color: var(--primary-color);
            color: var(--light-text);
            border-top-left-radius: 25px;
            border-top-right-radius: 25px;
        }

        .modal-body {
            padding: 2rem;
            color: var(--dark-text);
        }

        .modal-footer {
            border-top: none;
            padding: 1.5rem 2rem;
        }

        /* Banking Core Features - Interactive Graphs */
        .chart-container {
            background-color: var(--light-text);
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 15px 30px var(--card-shadow);
            margin-bottom: 3rem;
            transition: all 0.4s ease;
            border: 1px solid rgba(0,0,0,0.05);
        }

        .chart-container:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
        }

        /* Parallax Section */
        .parallax-section {
            background-image: url('https://placehold.co/1920x800/1F3B5D/FFFFFF?text=Financial+Growth+Background');
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            padding: 10rem 0;
            color: var(--light-text);
            text-align: center;
            position: relative;
        }

        .parallax-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(10, 25, 47, 0.6); /* Dark overlay */
            z-index: 1;
        }

        .parallax-content {
            position: relative;
            z-index: 2;
        }

        .parallax-content h3 {
            font-size: 3.5rem;
            font-weight: 700;
            text-shadow: 2px 2px 8px rgba(0,0,0,0.5);
        }

        /* Footer Design */
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

        /* Social Media Icon Hover Glow */
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

        /* Newsletter Sign-up */
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

        /* Button Wave Animation */
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

        /* Copyright Auto-Year (handled by JS) */
        .copyright-text {
            margin-top: 2rem;
            font-size: 0.85rem;
            color: rgba(255, 255, 255, 0.7);
        }

        /* Extra Interactive Features - Chatbot */
        .chatbot-toggle {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background-color: var(--accent-color);
            color: var(--light-text);
            border-radius: 50%;
            width: 60px;
            height: 60px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 2rem;
            box-shadow: 0 5px 15px rgba(0, 200, 150, 0.4);
            cursor: pointer;
            transition: all 0.3s ease;
            z-index: 1000;
            animation: float 2s ease-in-out infinite;
        }

        .chatbot-toggle:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 8px 20px rgba(0, 200, 150, 0.6);
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }

        .chatbot-modal .modal-content {
            background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
            color: var(--light-text);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 30px rgba(0,0,0,0.5);
        }

        .chatbot-modal .modal-header {
            background-color: var(--primary-color);
            border-bottom: 1px solid rgba(255,255,255,0.1);
            color: var(--light-text);
            font-weight: 600;
            font-size: 1.2rem;
        }

        .chatbot-modal .modal-body {
            height: 350px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            padding: 1.5rem;
            background-color: rgba(255,255,255,0.05);
        }

        .chatbot-message {
            background-color: rgba(255,255,255,0.1);
            padding: 10px 15px;
            border-radius: 15px;
            margin-bottom: 10px;
            max-width: 80%;
            align-self: flex-start;
            animation: fadeIn 0.5s ease-out forwards;
            opacity: 0;
        }

        .chatbot-message.user {
            background-color: var(--accent-color);
            align-self: flex-end;
            color: var(--primary-color);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .chatbot-modal .modal-footer {
            border-top: 1px solid rgba(255,255,255,0.1);
            background-color: var(--primary-color);
        }

        /* Countdown Timer */
        .countdown-timer {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--accent-color);
            text-shadow: 0 0 10px rgba(0, 200, 150, 0.5);
            margin-top: 2rem;
            animation: scalePulse 1.5s infinite ease-in-out;
        }

        @keyframes scalePulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.03); }
            100% { transform: scale(1); }
        }


        /* Scroll-based animations */
        .animated-section {
            opacity: 0;
            transform: translateY(80px);
            transition: opacity 1.2s ease-out, transform 1.2s ease-out;
        }

        .animated-section.is-visible {
            opacity: 1;
            transform: translateY(0);
        }

        .feature-card, .info-card, .testimonial-card, .news-card, .chart-container, .locker-plan-card, .card-module {
            opacity: 0;
            transform: scale(0.85);
            transition: opacity 1s ease-out, transform 1s ease-out;
        }

        .feature-card.is-visible, .info-card.is-visible, .testimonial-card.is-visible, .news-card.is-visible, .chart-container.is-visible, .locker-plan-card.is-visible, .card-module.is-visible {
            opacity: 1;
            transform: scale(1);
        }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .hero-section h1 {
                font-size: 3.5rem;
            }
            .hero-section p.lead {
                font-size: 1.5rem;
            }
            section h2 {
                font-size: 2.8rem;
            }
            .feature-card, .info-card, .locker-plan-card, .news-card {
                padding: 2.5rem;
            }
            .feature-card i {
                font-size: 4rem;
            }
            .feature-card h3 {
                font-size: 2rem;
            }
            .info-card h3 {
                font-size: 2.2rem;
            }
            .card-module {
                height: 300px;
            }
            .card-front i {
                font-size: 3rem;
            }
            .card-front h3 {
                font-size: 1.8rem;
            }
            .silver-card-visual {
                width: 300px;
                height: 190px;
            }
        }

        @media (max-width: 768px) {
            .hero-section {
                padding: 8rem 0;
            }
            .hero-section h1 {
                font-size: 2.8rem;
            }
            .hero-section p.lead {
                font-size: 1.2rem;
            }
            section {
                padding: 5rem 0;
            }
            section h2 {
                font-size: 2.2rem;
                margin-bottom: 3rem;
            }
            .feature-card, .info-card, .testimonial-card, .news-card, .locker-plan-card {
                padding: 2rem;
                margin-bottom: 2rem;
            }
            .feature-card i {
                font-size: 3.5rem;
            }
            .feature-card h3 {
                font-size: 1.8rem;
            }
            .info-card h3 {
                font-size: 1.8rem;
            }
            .card-module {
                height: 280px;
            }
            .card-front i {
                font-size: 2.5rem;
            }
            .card-front h3 {
                font-size: 1.6rem;
            }
            .silver-card-visual {
                width: 280px;
                height: 170px;
            }
            .newsletter-form .btn-primary-custom {
                margin-left: 0;
                margin-top: 1rem;
                width: 100%;
            }
            .chatbot-toggle {
                width: 50px;
                height: 50px;
                font-size: 1.8rem;
                bottom: 20px;
                right: 20px;
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
            <a class="navbar-brand" href="#">
                <i class="fas fa-gem me-2"></i> Aurangabad Bank
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#home">Home</a>
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

    <!-- Hero Section -->
    <section id="home" class="hero-section d-flex align-items-center">
        <canvas id="hero-canvas"></canvas>
        <div class="container hero-content text-center">
            <h1 class="display-4 mb-3">Elevate Your Financial Journey with Aurangabad Bank</h1>
            <p class="lead mb-4">The Future of Secure, Dynamic Banking is Here.</p>
            <p class="fs-5 mb-5">At Aurangabad Bank, we blend cutting-edge technology with personalized service to provide a banking experience that is both secure and empowering. Join us to discover innovative solutions tailored for your growth.</p>
            <a href="#core-features" class="btn btn-primary-custom btn-lg">Explore Core Features</a>
        </div>
    </section>

    <!-- Why Choose Us Section -->
    <section id="why-us" class="py-5 animated-section">
        <div class="container">
            <h2 class="mb-5">💡 Why Choose Aurangabad Bank?</h2>
            <div class="row align-items-center mb-5">
                <div class="col-lg-6 mb-4 mb-lg-0">
                    <img src="images/img1.png" alt="Seamless Digital Banking" class="img-fluid rounded-3 shadow">
                </div>
                <div class="col-lg-6">
                    <h3 class="display-6 fw-bold text-primary mb-4">Seamless & Secure Digital Experience</h3>
                    <p class="fs-5 lh-lg">Experience the future of banking with our state-of-the-art digital platforms. From instant fund transfers to bill payments and account management, everything is encrypted and accessible 24/7. Our robust security measures ensure your financial data is always protected.</p>
                </div>
            </div>
            <div class="row align-items-center flex-row-reverse">
                <div class="col-lg-6 mb-4 mb-lg-0">
                    <img src="images/img2.png" alt="Personalized Customer Support" class="img-fluid rounded-3 shadow">
                </div>
                <div class="col-lg-6">
                    <h3 class="display-6 fw-bold text-primary mb-4">Your Financial Journey, Our Priority</h3>
                    <p class="fs-5 lh-lg">We believe in building relationships, not just accounts. Our dedicated team is always ready to provide personalized support, whether you're planning for retirement, expanding your business, or navigating complex financial decisions. Your goals are our mission.</p>
                </div>
            </div>

            <div class="row g-4 mt-5">
                <div class="col-md-6 col-lg-3">
                    <div class="feature-card animated-section">
                        <i class="fas fa-shield-alt"></i>
                        <h3>Secure Digital Banking</h3>
                        <p>Experience seamless online banking with end-to-end encryption, fast transactions, and 24/7 account access.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="feature-card animated-section">
                        <i class="fas fa-handshake"></i>
                        <h3>Customer-Centric Approach</h3>
                        <p>Every customer matters. We're here to support your journey with personalized service and care.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="feature-card animated-section">
                        <i class="fas fa-receipt"></i>
                        <h3>Transparent Services</h3>
                        <p>Clarity in every transaction. No hidden charges, full accountability, and fair banking for all.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="feature-card animated-section">
                        <i class="fas fa-lock"></i>
                        <h3>Advanced Locker Facilities</h3>
                        <p>Protect your valuables with our highly secure and fully monitored bank locker system.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Card Sections -->
    <section id="cards" class="py-5 bg-light animated-section">
        <div class="container">
            <h2 class="mb-5">Your Aurangabad Bank Cards</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card-module animated-section">
                        <div class="card-inner">
                            <div class="card-front">
                                <i class="fas fa-credit-card"></i>
                                <h3>Credit Card</h3>
                            </div>
                            <div class="card-back">
                                <p>Unlock spending power with flexible limits, reward points, and exclusive benefits. Apply now!</p>
                                <button class="btn btn-sm btn-outline-light mt-3">Learn More</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card-module animated-section">
                        <div class="card-inner">
                            <div class="card-front">
                                <i class="fas fa-wallet"></i>
                                <h3>Debit Card</h3>
                            </div>
                            <div class="card-back">
                                <p>Direct access to your funds for easy payments, ATM withdrawals, and online shopping. Secure and convenient.</p>
                                <button class="btn btn-sm btn-outline-light mt-3">Learn More</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card-module animated-section">
                        <div class="card-inner">
                            <div class="card-front">
                                <i class="fas fa-money-check-alt"></i>
                                <h3>ATM Card</h3>
                            </div>
                            <div class="card-back">
                                <p>Quick and easy cash access at ATMs worldwide. Manage your finances on the go.</p>
                                <button class="btn btn-sm btn-outline-light mt-3">Learn More</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Silver Card Feature Section -->
            <div class="silver-card-section animated-section mt-5">
                <div class="container silver-card-content">
                    <h2 class="text-light mb-5">✨ Aurangabad Bank Silver Card: Exclusivity Redefined</h2>
                    <div class="row align-items-center">
                        <div class="col-lg-6 mb-4 mb-lg-0">
                            <div class="silver-card-visual">
                                <i class="fas fa-star spark-icon"></i>
                                <!-- Card design elements can go here -->
                            </div>
                            <div class="countdown-timer text-light mt-4" id="silverCardCountdown"></div>
                        </div>
                        <div class="col-lg-6 text-start">
                            <p class="fs-4 fw-light mb-4">Experience unparalleled luxury and convenience with the Aurangabad Bank Silver Card, designed for our most discerning clients.</p>
                            <ul class="list-unstyled">
                                <li class="fs-5 mb-3"><i class="fas fa-plane-departure me-3 text-accent"></i> Exclusive Travel Perks & Lounge Access</li>
                                <li class="fs-5 mb-3"><i class="fas fa-tags me-3 text-accent"></i> Premium Deals & Discounts Worldwide</li>
                                <li class="fs-5 mb-3"><i class="fas fa-cash-register me-3 text-accent"></i> Accelerated Cashback Rewards Program</li>
                                <li class="fs-5 mb-3"><i class="fas fa-concierge-bell me-3 text-accent"></i> Dedicated 24/7 Concierge Service</li>
                            </ul>
                            <div class="silver-card-cta mt-5">
                                <button class="btn btn-primary-custom btn-lg">Apply for Silver Card</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Locker Services Section -->
    <section id="locker-services" class="py-5 animated-section">
        <div class="container">
            <h2 class="mb-5">🔐 Secure Locker Services</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="locker-plan-card animated-section">
                        <i class="fas fa-box-open"></i>
                        <h4>Small Locker</h4>
                        <p class="text-muted">Ideal for documents & small valuables.</p>
                        <ul class="list-unstyled">
                            <li><i class="fas fa-check-circle"></i> Compact & Secure</li>
                            <li><i class="fas fa-check-circle"></i> Biometric Access</li>
                            <li><i class="fas fa-check-circle"></i> Affordable Annual Fee</li>
                        </ul>
                        <button class="btn btn-primary-custom mt-3" data-bs-toggle="modal" data-bs-target="#lockerModal" data-locker-plan="Small">View Details</button>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="locker-plan-card animated-section">
                        <i class="fas fa-boxes"></i>
                        <h4>Medium Locker</h4>
                        <p class="text-muted">Perfect for jewelry & important papers.</p>
                        <ul class="list-unstyled">
                            <li><i class="fas fa-check-circle"></i> Spacious & Robust</li>
                            <li><i class="fas fa-check-circle"></i> 24/7 Surveillance</li>
                            <li><i class="fas fa-check-circle"></i> Insurance Options</li>
                        </ul>
                        <button class="btn btn-primary-custom mt-3" data-bs-toggle="modal" data-bs-target="#lockerModal" data-locker-plan="Medium">View Details</button>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="locker-plan-card animated-section">
                        <i class="fas fa-warehouse"></i>
                        <h4>Large Locker</h4>
                        <p class="text-muted">For larger items & extensive collections.</p>
                        <ul class="list-unstyled">
                            <li><i class="fas fa-check-circle"></i> Maximum Capacity</li>
                            <li><i class="fas fa-check-circle"></i> Climate Controlled</li>
                            <li><i class="fas fa-check-circle"></i> Priority Access</li>
                        </ul>
                        <button class="btn btn-primary-custom mt-3" data-bs-toggle="modal" data-bs-target="#lockerModal" data-locker-plan="Large">View Details</button>
                    </div>
                </div>
            </div>
            <div class="row mt-5">
                <div class="col-12 text-center">
                    <h3 class="text-primary mb-4">Locker Security Tips:</h3>
                    <ul class="list-unstyled d-inline-block text-start">
                        <li class="service-item animated-list-item"><i class="fas fa-shield-check"></i> Always ensure the locker is properly locked after use.</li>
                        <li class="service-item animated-list-item"><i class="fas fa-key"></i> Keep your locker key in a secure and confidential location.</li>
                        <li class="service-item animated-list-item"><i class="fas fa-eye"></i> Report any suspicious activity around the locker area immediately.</li>
                        <li class="service-item animated-list-item"><i class="fas fa-file-invoice"></i> Maintain an inventory of items stored in your locker for insurance purposes.</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Locker Modal -->
    <div class="modal fade" id="lockerModal" tabindex="-1" aria-labelledby="lockerModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="lockerModalLabel">Locker Details</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p id="lockerModalContent"></p>
                    <p class="mt-3">To apply, please visit your nearest Aurangabad Bank branch or contact our customer support.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary-custom">Apply Now</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Banking Core Features Section -->
    <section id="core-features" class="py-5 animated-section">
        <div class="container">
            <h2 class="mb-5">⚙️ Banking Core Features</h2>
            <div class="row g-4 mb-5">
                <div class="col-md-6 col-lg-3">
                    <div class="feature-card animated-section">
                        <i class="fas fa-user-plus"></i>
                        <h3>Account Creation</h3>
                        <p>Open a new account online in minutes with our streamlined process.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="feature-card animated-section">
                        <i class="fas fa-exchange-alt"></i>
                        <h3>Fund Transfers</h3>
                        <p>Send and receive money instantly with secure and real-time transactions.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="feature-card animated-section">
                        <i class="fas fa-hand-holding-usd"></i>
                        <h3>Loan Applications</h3>
                        <p>Apply for personal, home, or business loans with competitive rates.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="feature-card animated-section">
                        <i class="fas fa-comment-dots"></i>
                        <h3>Secure Messaging</h3>
                        <p>Communicate directly with our support team through encrypted channels.</p>
                    </div>
                </div>
            </div>

            <h3 class="text-center text-primary mb-4">Financial Overview</h3>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="chart-container animated-section">
                        <canvas id="myFinancialChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Parallax Section -->
    <section class="parallax-section">
        <div class="parallax-overlay"></div>
        <div class="container parallax-content animated-section">
            <h3 class="display-4 fw-bold">"Your Financial Future, Elevated by Aurangabad Bank."</h3>
            <p class="lead mt-4">We are dedicated to empowering your financial aspirations with innovative solutions and unwavering support.</p>
        </div>
    </section>

    <!-- Customer Testimonials Section -->
    <section id="testimonials" class="py-5 animated-section">
        <div class="container">
            <h2 class="mb-5">Hear From Our Valued Customers</h2>
            <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="row justify-content-center">
                            <div class="col-md-8">
                                <div class="testimonial-card animated-section">
                                    <img src="images/img2_amaan.jpg" alt="Customer Photo" class="img-fluid" width="200">
                                    <p>"Aurangabad Bank has transformed my banking experience. The online portal is incredibly user-friendly, and their customer service is top-notch. Highly recommended!"</p>
                                    <div class="author">- Shaikh Amaan, Small Business Owner</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="row justify-content-center">
                            <div class="col-md-8">
                                <div class="testimonial-card animated-section">
                                    <img src="images/img3_Sejal Agrawaal, Investor.png" alt="Customer Photo" class="img-fluid" width="150">
                                    <p>"I've been with Aurangabad Bank for years, and their commitment to transparency and security is truly commendable. My investments feel safe here."</p>
                                    <div class="author">- Sejal Agrawaal, Investor</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="row justify-content-center">
                            <div class="col-md-8">
                                <div class="testimonial-card animated-section">
                                    <img src="images/img4.jpg" alt="Customer Photo" class="img-fluid" width="150">
                                    <p>"Applying for a loan was seamless, and the staff was incredibly helpful throughout the process. Aurangabad Bank truly cares about its customers."</p>
                                    <div class="author">- Sania Khan, Homeowner</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </section>

    <!-- Latest News/Blog Section -->
    <section id="news" class="py-5 bg-light animated-section">
        <div class="container">
            <h2 class="mb-5">Latest News & Insights</h2>
            <div class="row g-4">
                <div class="col-md-6 col-lg-4">
                    <div class="news-card animated-section">
                        <img src="https://placehold.co/600x400/1A2E44/FFFFFF?text=Digital+Banking+Update" alt="Digital Banking Update">
                        <div class="card-body">
                            <h4>Revolutionizing Your Digital Banking Experience</h4>
                            <p class="text-muted">July 1, 2025</p>
                            <p>Discover the latest updates to our mobile and internet banking platforms, designed for even greater convenience and security.</p>
                            <a href="#" class="btn btn-sm btn-outline-primary">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="news-card animated-section">
                        <img src="https://placehold.co/600x400/00C896/FFFFFF?text=Financial+Tips" alt="Financial Tips">
                        <div class="card-body">
                            <h4>5 Tips for Smart Financial Planning in 2025</h4>
                            <p class="text-muted">June 20, 2025</p>
                            <p>Our experts share essential advice to help you manage your finances, save effectively, and plan for a secure future.</p>
                            <a href="#" class="btn btn-sm btn-outline-primary">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="news-card animated-section">
                        <img src="https://placehold.co/600x400/2D4059/FFFFFF?text=Community+Event" alt="Community Event">
                        <div class="card-body">
                            <h4>Aurangabad Bank's Community Outreach Program</h4>
                            <p class="text-muted">June 5, 2025</p>
                            <p>Learn about our latest initiatives to support local communities and promote financial literacy across the region.</p>
                            <a href="#" class="btn btn-sm btn-outline-primary">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
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

    <!-- Footer -->
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
                        <li><a href="#cards">Cards</a></li>
                        <li><a href="#locker-services">Locker Services</a></li>
                        <li><a href="#core-features">Loans</a></li>
                        <li><a href="#core-features">Accounts</a></li>
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
    <!-- Three.js for 3D animation -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
    <script>
        // Dynamic Current Year for Footer
        document.getElementById('currentYear').textContent = new Date().getFullYear();

        // Navbar Shrink/Expand on Scroll
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            const navbarBrand = document.querySelector('.navbar-brand');
            if (window.scrollY > 50) {
                navbar.style.backgroundColor = 'rgba(10, 25, 47, 0.95)'; /* Slightly transparent on scroll */
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
        const animatedElements = document.querySelectorAll('.animated-section, .feature-card, .info-card, .testimonial-card, .news-card, .chart-container, .locker-plan-card, .card-module');

        const observerOptions = {
            root: null,
            rootMargin: '0px',
            threshold: 0.1
        };

        const observer = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('is-visible');
        // Stop observing once visible, unless it's a continuously animated element
        if (!entry.target.classList.contains('continuous-animation')) {
            observer.unobserve(entry.target);
        }
        }
        });
        }, observerOptions);

        animatedElements.forEach(element => {
            observer.observe(element);
        });

        // 3D Animation (Three.js) for Hero Section Background
        window.onload = function() {
            const scene = new THREE.Scene();
            const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
            const renderer = new THREE.WebGLRenderer({ canvas: document.getElementById('hero-canvas'), alpha: true });

            const canvas = document.getElementById('hero-canvas');
            renderer.setSize(canvas.clientWidth, canvas.clientHeight);
            renderer.setPixelRatio(window.devicePixelRatio);

            const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);
            scene.add(ambientLight);
            const directionalLight = new THREE.DirectionalLight(0xffffff, 0.5);
            directionalLight.position.set(0, 1, 0);
            scene.add(directionalLight);

            const geometry = new THREE.OctahedronGeometry(1.5, 0);
            const material = new THREE.MeshPhongMaterial({
                color: 0x00C896, /* Accent color */
                specular: 0x00C896,
                shininess: 80, /* More shininess */
                transparent: true,
                opacity: 0.5 /* More transparent */
            });
            const shape = new THREE.Mesh(geometry, material);
            scene.add(shape);

            const particleCount = 1000; /* More particles */
            const particlesGeometry = new THREE.BufferGeometry();
            const positions = new Float32Array(particleCount * 3);
            const colors = new Float32Array(particleCount * 3);
            const color = new THREE.Color();

            for (let i = 0; i < particleCount; i++) {
                const radius = 20; /* Larger radius for particle distribution */
                const theta = Math.random() * Math.PI * 2;
                const phi = Math.random() * Math.PI;
                positions[i * 3] = radius * Math.sin(phi) * Math.cos(theta);
                positions[i * 3 + 1] = radius * Math.sin(phi) * Math.sin(theta);
                positions[i * 3 + 2] = radius * Math.cos(phi);

                color.setHSL(Math.random() * 0.1 + 0.5, 0.5, Math.random() * 0.5 + 0.5);
                colors[i * 3] = color.r;
                colors[i * 3 + 1] = color.g;
                colors[i * 3 + 2] = color.b;
            }

            particlesGeometry.setAttribute('position', new THREE.BufferAttribute(positions, 3));
            particlesGeometry.setAttribute('color', new THREE.BufferAttribute(colors, 3));

            const particlesMaterial = new THREE.PointsMaterial({
                size: 0.1, /* Slightly larger particles */
                vertexColors: true,
                transparent: true,
                opacity: 0.6 /* More transparent */
            });
            const particles = new THREE.Points(particlesGeometry, particlesMaterial);
            scene.add(particles);

            camera.position.z = 5;

            const animate = () => {
                requestAnimationFrame(animate);

            shape.rotation.x += 0.001; /* Slower rotation */
            shape.rotation.y += 0.001;

            particles.rotation.y += 0.0005; /* Slower particle rotation */
            particles.rotation.x += 0.0002;

            renderer.render(scene, camera);
        };

        animate();

        window.addEventListener('resize', () => {
            const newWidth = canvas.clientWidth;
        const newHeight = canvas.clientHeight;
        camera.aspect = newWidth / newHeight;
        camera.updateProjectionMatrix();
        renderer.setSize(newWidth, newHeight);
        });
        };

        // Locker Modal Content Logic
        const lockerModal = document.getElementById('lockerModal');
        lockerModal.addEventListener('show.bs.modal', event => {
            const button = event.relatedTarget;
        const lockerPlan = button.getAttribute('data-locker-plan');
        const modalTitle = lockerModal.querySelector('.modal-title');
        const modalBodyInput = lockerModal.querySelector('#lockerModalContent');

        modalTitle.textContent = `${lockerPlan} Locker Details`;
        let content = '';
        switch (lockerPlan) {
            case 'Small':
                content = 'Our Small Locker is perfect for essential documents, passports, and small jewelry. It offers secure storage at an economical price.';
                break;
            case 'Medium':
                content = 'The Medium Locker provides ample space for valuable jewelry, important legal papers, and small electronic devices. Enjoy enhanced security features.';
                break;
            case 'Large':
                content = 'Our Large Locker is designed for bulkier items, extensive collections, or multiple family valuables. It comes with premium security and accessibility.';
                break;
            default:
                content = 'Details for this locker plan are not available.';
        }
        modalBodyInput.textContent = content;
        });

        // Chart.js Integration
        document.addEventListener('DOMContentLoaded', function() {
            const ctx = document.getElementById('myFinancialChart');
            if (ctx) {
                new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
                        datasets: [{
                            label: 'Monthly Growth (in thousands)',
                            data: [12, 19, 3, 5, 2, 3, 15],
                            backgroundColor: 'rgba(0, 200, 150, 0.2)',
                            borderColor: 'var(--accent-color)',
                            borderWidth: 2,
                            tension: 0.4, /* Smooth lines */
                            fill: true,
                            pointBackgroundColor: 'var(--accent-color)',
                            pointBorderColor: 'var(--light-text)',
                            pointRadius: 5,
                            pointHoverRadius: 7
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            legend: {
                                display: true,
                                labels: {
                                    color: 'var(--dark-text)',
                                    font: {
                                        size: 14,
                                        family: 'Inter'
                                    }
                                }
                            },
                            tooltip: {
                                backgroundColor: 'var(--primary-color)',
                                titleColor: 'var(--light-text)',
                                bodyColor: 'var(--light-text)',
                                borderColor: 'var(--accent-color)',
                                borderWidth: 1,
                                displayColors: false
                            }
                        },
                        scales: {
                            x: {
                                ticks: {
                                    color: 'var(--dark-text)',
                                    font: { family: 'Inter' }
                                },
                                grid: {
                                    color: 'rgba(0, 0, 0, 0.05)'
                                }
                            },
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    color: 'var(--dark-text)',
                                    font: { family: 'Inter' }
                                },
                                grid: {
                                    color: 'rgba(0, 0, 0, 0.05)'
                                }
                            }
                        },
                        animation: {
                            duration: 1500, /* Animated loading transition */
                            easing: 'easeOutQuart'
                        }
                    }
                });
            }
        });

        // Silver Card Countdown Timer
        const silverCardOfferDate = new Date();
        silverCardOfferDate.setDate(silverCardOfferDate.getDate() + 7); // Offer valid for 7 days from now

        const countdownElement = document.getElementById('silverCardCountdown');

        function updateCountdown() {
            const now = new Date().getTime();
            const distance = silverCardOfferDate.getTime() - now;

            const days = Math.floor(distance / (1000 * 60 * 60 * 24));
            const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((distance % (1000 * 60)) / 1000);

            if (countdownElement) {
                if (distance < 0) {
                    clearInterval(countdownInterval);
                    countdownElement.innerHTML = "OFFER EXPIRED!";
                } else {
                    countdownElement.innerHTML = `Offer Ends in: ${days}d ${hours}h ${minutes}m ${seconds}s`;
                }
            }
        }

        const countdownInterval = setInterval(updateCountdown, 1000);
        updateCountdown(); // Initial call to display immediately

        // Simple Chatbot Toggle (visual only)
        document.addEventListener('DOMContentLoaded', function() {
            const chatbotToggle = document.createElement('div');
            chatbotToggle.classList.add('chatbot-toggle');
            chatbotToggle.innerHTML = '<i class="fas fa-comments"></i>';
            document.body.appendChild(chatbotToggle);

            const chatbotModal = new bootstrap.Modal(document.getElementById('chatbotModal'));

            chatbotToggle.addEventListener('click', () => {
                chatbotModal.show();
        });
        });
    </script>

    <!-- Chatbot Modal Structure -->
    <div class="modal fade chatbot-modal" id="chatbotModal" tabindex="-1" aria-labelledby="chatbotModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="chatbotModalLabel">AurangabadBot</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="chatbot-message">Hello! How can I assist you today?</div>
                    <div class="chatbot-message">I can help with account inquiries, loan information, or general banking questions.</div>
                    <!-- More messages can be dynamically added here -->
                </div>
                <div class="modal-footer">
                    <input type="text" class="form-control me-2" placeholder="Type your message...">
                    <button class="btn btn-primary-custom">Send</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
