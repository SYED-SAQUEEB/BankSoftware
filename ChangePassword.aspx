<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>🔐 Change Password - Aurangabad Bank</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap & Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Three.js for 3D background -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>

    <style>
        /* Base styles for body and overall layout */
        body {
            font-family: 'Inter', sans-serif; /* Changed to Inter for a modern look */
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364); /* Dark, sophisticated gradient */
            color: white;
            min-height: 100vh; /* Ensure full viewport height */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            position: relative; /* For absolute positioning of 3D canvas */
            overflow: hidden; /* Hide overflow from 3D canvas */
        }

        /* 3D Canvas Background */
        #three-bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1; /* Place behind content */
            opacity: 0.3; /* Subtle background */
        }

        /* Container for the form */
        .container-box {
            background-color: rgba(255, 255, 255, 0.08); /* More subtle transparency */
            padding: 40px; /* Increased padding */
            border-radius: 20px; /* More rounded corners */
            max-width: 550px;
            margin: 50px auto;
            box-shadow: 0 0 30px rgba(0, 230, 230, 0.4), 0 0 60px rgba(0, 230, 230, 0.2); /* Enhanced glow effect */
            backdrop-filter: blur(8px); /* Frosted glass effect */
            border: 1px solid rgba(255, 255, 255, 0.15); /* Subtle border */
            position: relative; /* For z-index stacking */
            z-index: 1; /* Ensure it's above the 3D canvas */
            animation: fadeIn 1s ease-out; /* Fade-in animation for the form */
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            text-align: center;
            color: #00e6e6; /* Cyan color for heading */
            margin-bottom: 30px; /* Increased margin */
            font-weight: 700; /* Bolder heading */
            text-shadow: 0 0 10px rgba(0, 230, 230, 0.6); /* Text glow */
        }

        label {
            color: #e0e0e0; /* Slightly lighter white for labels */
            font-weight: 600; /* Semi-bold */
            margin-bottom: 8px; /* Space below label */
            display: block; /* Ensure label takes full width */
        }

        .input-group-text {
            background-color: #f0f0f0; /* Light grey */
            border: 1px solid #ced4da;
            border-left: 0;
            border-radius: 0 10px 10px 0;
            transition: all 0.3s ease; /* Smooth transitions */
        }

        .form-control {
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.9); /* Slightly opaque white */
            border: 1px solid #ced4da;
            color: #333; /* Dark text for input */
            padding: 10px 15px; /* Better padding */
            transition: all 0.3s ease; /* Smooth transitions */
        }

        .form-control:focus {
            border-color: #00e6e6; /* Cyan border on focus */
            box-shadow: 0 0 0 0.25rem rgba(0, 230, 230, 0.25); /* Cyan glow on focus */
            background-color: #fff; /* White background on focus */
        }

        /* Button styling */
        .btn {
            width: 100%;
            border-radius: 10px;
            padding: 12px 20px; /* Larger buttons */
            font-weight: bold;
            letter-spacing: 0.5px;
            transition: all 0.3s ease; /* Smooth transitions for all buttons */
            position: relative;
            overflow: hidden; /* For ripple effect */
            z-index: 1;
        }

        .btn::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 5px;
            height: 5px;
            background: rgba(255, 255, 255, 0.5);
            opacity: 0;
            border-radius: 100%;
            transform: scale(1) translate(-50%, -50%);
            transition: all 0.5s ease-out;
            z-index: -1;
        }

        .btn:hover::after {
            transform: scale(20) translate(-50%, -50%);
            opacity: 1;
        }

        .btn-primary {
            background: linear-gradient(45deg, #007bff, #0056b3); /* Blue gradient */
            border: none;
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.3);
        }

        .btn-primary:hover {
            background: linear-gradient(45deg, #0056b3, #007bff);
            box-shadow: 0 8px 20px rgba(0, 123, 255, 0.5);
            transform: translateY(-2px); /* Slight lift on hover */
        }

        .btn-success {
            background: linear-gradient(45deg, #28a745, #1e7e34); /* Green gradient */
            border: none;
            box-shadow: 0 5px 15px rgba(40, 167, 69, 0.3);
        }

        .btn-success:hover {
            background: linear-gradient(45deg, #1e7e34, #28a745);
            box-shadow: 0 8px 20px rgba(40, 167, 69, 0.5);
            transform: translateY(-2px); /* Slight lift on hover */
        }

        .back-btn {
            position: absolute;
            top: 30px; /* Adjusted position */
            left: 30px; /* Adjusted position */
            background: rgba(0, 123, 255, 0.8); /* Semi-transparent blue */
            color: white;
            border-radius: 25px; /* More rounded */
            padding: 8px 18px; /* Better padding */
            border: none;
            font-size: 1rem;
            box-shadow: 0 4px 10px rgba(0, 123, 255, 0.3);
            transition: all 0.3s ease;
            z-index: 2; /* Ensure it's above other elements */
        }

        .back-btn:hover {
            background: #007bff;
            box-shadow: 0 6px 15px rgba(0, 123, 255, 0.5);
            transform: translateY(-1px);
        }

        .footer {
            text-align: center;
            padding: 20px;
            color: #999; /* Lighter grey for footer */
            margin-top: 40px; /* Increased margin */
            font-size: 0.9rem;
            z-index: 1; /* Ensure it's above the 3D canvas */
        }

        /* Message and OTP info styling */
        .text-info {
            color: #00e6e6 !important; /* Ensure cyan for info messages */
            font-weight: 500;
            margin-top: 15px;
            margin-bottom: 15px;
        }

        .text-warning {
            color: #ffc107 !important; /* Standard warning yellow */
            font-weight: 500;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container-box {
                margin: 30px 15px;
                padding: 25px;
            }

            .back-btn {
                top: 15px;
                left: 15px;
                padding: 6px 12px;
                font-size: 0.9rem;
            }

            h2 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
    <!-- 3D Background Canvas -->
    <canvas id="three-bg"></canvas>

    <form id="form1" runat="server">
        <!-- Back Button -->
        <asp:Button ID="btnBack" runat="server" CssClass="back-btn" Text="← Back" OnClick="btnBack_Click" />

        <div class="container-box">
            <h2>🔐 Change Your Password</h2>

            <!-- Username -->
            <div class="mb-3">
                <label>Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter your username" />
            </div>

            <!-- Generate OTP Button -->
            <div class="mb-3 d-grid">
                <asp:Button ID="btnGenerateOTP" runat="server" CssClass="btn btn-success" Text="Generate OTP" OnClick="btnGenerateOTP_Click" />
            </div>

            <!-- Display OTP -->
            <div class="mb-3 text-info text-center">
                <asp:Label ID="lblOTPInfo" runat="server" Text=""></asp:Label>
            </div>

            <!-- OTP -->
            <div class="mb-3">
                <label>Enter OTP</label>
                <asp:TextBox ID="txtOTP" runat="server" CssClass="form-control" placeholder="Enter the OTP" />
            </div>

            <!-- New Password -->
            <div class="mb-3">
                <label>New Password</label>
                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="New Password" />
            </div>

            <!-- Confirm New Password -->
            <div class="mb-3">
                <label>Confirm Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm Password" />
            </div>

            <!-- Change Button -->
            <div class="mb-3 d-grid">
                <asp:Button ID="btnChangePassword" runat="server" CssClass="btn btn-primary" Text="Change Password" OnClick="btnChangePassword_Click" />
            </div>

            <!-- Message -->
            <asp:Label ID="lblMessage" runat="server" CssClass="text-warning d-block text-center mt-2"></asp:Label>
        </div>

        <div class="footer">
            &copy; 2025 Aurangabad Bank. All rights reserved.
        </div>
    </form>

    <script>
        // SweetAlert2 example for success message (can be triggered by server-side logic)
        function showSuccessAlert(message) {
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: message,
                confirmButtonColor: '#00e6e6',
                background: '#2c5364',
                color: '#fff',
                backdrop: `
                    rgba(0,0,0,0.4)
                    url("https://sweetalert2.github.io/images/nyan-cat.gif")
            left top
            no-repeat
                `
        });
        }

        // Three.js Background Animation
        window.onload = function () {
            const canvas = document.getElementById('three-bg');
            const scene = new THREE.Scene();
            const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
            const renderer = new THREE.WebGLRenderer({ canvas: canvas, alpha: true }); // alpha: true for transparent background

            renderer.setSize(window.innerWidth, window.innerHeight);
            renderer.setPixelRatio(window.devicePixelRatio);

            // Create particles
            const particlesGeometry = new THREE.BufferGeometry();
            const particlesCount = 5000;
            const posArray = new Float32Array(particlesCount * 3);

            for (let i = 0; i < particlesCount * 3; i++) {
                posArray[i] = (Math.random() - 0.5) * 10; // Spread particles in a cube
            }

            particlesGeometry.setAttribute('position', new THREE.BufferAttribute(posArray, 3));

            const particlesMaterial = new THREE.PointsMaterial({
                size: 0.02,
                color: 0x00e6e6, // Cyan color for particles
                transparent: true,
                blending: THREE.AdditiveBlending,
                depthWrite: false
            });

            const particlesMesh = new THREE.Points(particlesGeometry, particlesMaterial);
            scene.add(particlesMesh);

            camera.position.z = 2;

            // Animation loop
            const animate = () => {
                requestAnimationFrame(animate);

            // Rotate particles slightly
            particlesMesh.rotation.x += 0.0005;
            particlesMesh.rotation.y += 0.0008;

            renderer.render(scene, camera);
        };

        animate();

        // Handle window resize
        window.addEventListener('resize', () => {
            camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();
        renderer.setSize(window.innerWidth, window.innerHeight);
        renderer.setPixelRatio(window.devicePixelRatio);
        });

        // Check for success message in URL parameters
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.get('status') === 'success') {
            showSuccessAlert('Your password has been changed successfully!');
        }
        };
    </script>
</body>
</html>
