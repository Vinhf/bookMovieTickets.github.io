<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/cssSignup.css">
        <title>Registration Form</title>

    </head>
    <style>
        /* ?ây ch? là ví d? c? b?n, b?n c?n ?i?u ch?nh nó theo thi?t k? c?a mình */
        .error-message {
            color: red;
            display: none; /* M?c ??nh ?n ?i */
            font-size: 0.8em;
            margin-top: 5px;
        }
        input.error, select.error {
            border: 1px solid red;
        }

        /* Thêm các ki?u CSS c?a b?n ? ?ây */

    </style>
    <body>
        <form action="SignUp" method="post">
            <div class="form-container">
                <div class="form-title">REGISTER</div>
                <h3 style="color: red">${requestScope.wrong}</h3>
                <label for="name">User Name*</label>
                <input type="text" id="name" name="name">
                <div class="error-message" id="name-error"></div>

                <label for="password">Password*</label>
                <input type="password" id="password" name="password">
                <div class="error-message" id="password-error"></div>

                <label for="phone">Phone Number*</label>
                <input type="text" id="phone" name="phone">
                <div class="error-message" id="phone-error"></div>

                <label for="email">Email*</label>
                <input type="text" id="email" name="email">
                <div class="error-message" id="email-error"></div>

                <label for="dob">Birthday*</label>
                <div class="flex-container">
                    <div class="flex-item">
                        <select id="dob-day" name="dob-day">
                            <!-- Dynamically populated days 1-31 will be inserted here -->
                        </select>
                    </div>
                    <div class="flex-item">
                        <select id="dob-month" name="dob-month">
                            <!-- Dynamically populated months January-December will be inserted here -->
                        </select>
                    </div>
                    <div class="flex-item">
                        <select id="dob-year" name="dob-year">
                            <!-- Dynamically populated years, e.g., 1923-2023 will be inserted here -->
                        </select>
                    </div>
                </div>
                <div class="error-message" id="birthday-error"></div>

                <div class="flex-container">
                    <div class="flex-item">
                        <input type="radio" id="male" name="gender" value="male">
                        <label for="male">Male</label>
                    </div>
                    <div class="flex-item">
                        <input type="radio" id="female" name="gender" value="female">
                        <label for="female">Female</label>
                    </div>
                </div>
                <div class="error-message" id="gender-error"></div>
                <label for="region">Region*</label>
                <select id="region" name="region">
                    <option value="hcm">Thanh pho Ho Chi Minh</option>
                    <option value="cantho">Can Tho</option>
                </select>

                <label for="favCinema">Favorite Cinema*</label>
                <select id="favCinema" name="favCinema">
                    <!-- For HCM -->
                    <option value="cgv-vincom-thaodien">CGV Vincom Thao vien</option>
                    <option value="cgv-vivocity">CGV VivoCity</option>
                    <option value="cgv-crescentmall">CGV Crescent Mall</option>
                    <option value="cgv-liberty-citypoint">CGV Liberty CityPoint</option>
                    <!-- For C?n Th? -->
                    <option value="cgv-vincom-can-tho">CGV Vincom Can Tho</option>
                    <option value="cgv-sense-city-can-tho">CGV Sense City Can Tho</option>
                </select>

                <input type="checkbox" id="terms" name="terms">
                <label for="terms">I agree to the Terms of Use of VH</label>
                <div class="error-message" id="terms-error"></div>
                <button type="submit" id="submit-button" disabled>REGISTER</button>
            </div>
        </form>
        <script>
            function updateDays(year, month) {
                let dayDropdown = document.getElementById('dob-day');
                let selectedDay = dayDropdown.value;
                dayDropdown.innerHTML = '';

                let daysInMonth;
                if (month === '02') { // Check for February
                    // Check for leap year
                    const isLeapYear = (year % 4 === 0 && year % 100 !== 0) || year % 400 === 0;
                    daysInMonth = isLeapYear ? 29 : 28;
                } else if (['01', '03', '05', '07', '08', '10', '12'].includes(month)) {
                    daysInMonth = 31;
                } else {
                    daysInMonth = 30;
                }

                for (let i = 1; i <= daysInMonth; i++) {
                    let option = document.createElement('option');
                    option.value = i.toString().padStart(2, '0');
                    option.innerText = i.toString().padStart(2, '0');
                    if (selectedDay === option.value)
                        option.selected = true;
                    dayDropdown.appendChild(option);
                }
            }

// Get references to the month and year dropdowns
            let monthDropdown = document.getElementById('dob-month');
            let yearDropdown = document.getElementById('dob-year');

// Populate the month dropdown
            let months = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
            months.forEach(month => {
                let option = document.createElement('option');
                option.value = month;
                option.innerText = month;
                monthDropdown.appendChild(option);
            });

// Populate the year dropdown and attach an event listener to update the days
            let currentYear = new Date().getFullYear();
            for (let i = currentYear; i >= 1923; i--) {
                let option = document.createElement('option');
                option.value = i;
                option.innerText = i;
                yearDropdown.appendChild(option);
            }

// Attach event listeners to the month and year dropdowns to update the days
            monthDropdown.addEventListener('change', function () {
                updateDays(yearDropdown.value, this.value);
            });

            yearDropdown.addEventListener('change', function () {
                updateDays(this.value, monthDropdown.value);
            });

// Initialize the days for the current month and year
            updateDays(currentYear, months[new Date().getMonth()]);

            document.getElementById("region").addEventListener("change", function () {
                const cinemaDropdown = document.getElementById("favCinema");
                // Clear current options
                cinemaDropdown.innerHTML = "";
                if (this.value === "hcm") {
                    // Options for TP.HCM
                    let cinemasHCM = [
                        {value: "cgv-vincom-thaodien", name: "CGV Vincom Thao vien"},
                        {value: "cgv-vivocity", name: "CGV VivoCity"},
                        {value: "cgv-crescentmall", name: "CGV Crescent Mall"},
                        {value: "cgv-liberty-citypoint", name: "CGV Liberty CityPoint"}
                    ];
                    cinemasHCM.forEach(cinema => {
                        let option = document.createElement("option");
                        option.value = cinema.value;
                        option.text = cinema.name;
                        cinemaDropdown.add(option);
                    });
                } else if (this.value === "cantho") {
                    // Options for C?n Th?
                    let cinemasCanTho = [
                        {value: "cgv-vincom-can-tho", name: "CGV Vincom Can Tho"},
                        {value: "cgv-sense-city-can-tho", name: "CGV Sense City Can Tho"}
                    ];
                    cinemasCanTho.forEach(cinema => {
                        let option = document.createElement("option");
                        option.value = cinema.value;
                        option.text = cinema.name;
                        cinemaDropdown.add(option);
                    });
                }
            });
            //check l?i 

            document.addEventListener('DOMContentLoaded', function () {
                const usernameInput = document.getElementById('name');
                const passwordInput = document.getElementById('password');
                const phoneInput = document.getElementById('phone');
                const emailInput = document.getElementById('email');
                const genderInputs = document.querySelectorAll('input[name="gender"]');
                const termsInput = document.getElementById('terms');
                const submitButton = document.getElementById('submit-button');

                function validateUsername() {
                    const username = usernameInput.value.trim();
                    if (username.length < 3) {
                        displayError('name', 'Username must be at least 3 characters.');
                        return false;
                    }
                    displayError('name', '');
                    return true;
                }

                function validatePassword() {
                    const password = passwordInput.value;
                    if (password.length < 6) {
                        displayError('password', 'Password must be at least 6 characters.');
                        return false;
                    }
                    displayError('password', '');
                    return true;
                }

                function validatePhone() {
                    const phone = phoneInput.value;
                    if (!/^\d{10}$/.test(phone)) {
                        displayError('phone', 'Phone number must be 10 digits.');
                        return false;
                    }
                    displayError('phone', '');
                    return true;
                }

                function validateEmail() {
                    const email = emailInput.value.trim();
                    if (!/^\S+@\S+\.\S+$/.test(email)) {
                        displayError('email', 'Email is invalid.');
                        return false;
                    }
                    displayError('email', '');
                    return true;
                }

                function validateGender() {
                    let selectedGender = false;
                    for (const genderInput of genderInputs) {
                        if (genderInput.checked) {
                            selectedGender = true;
                            break;
                        }
                    }
                    if (!selectedGender) {
                        displayError('gender', 'Please select your gender.');
                        return false;
                    }
                    displayError('gender', '');
                    return true;
                }

                function validateTerms() {
                    if (!termsInput.checked) {
                        displayError('terms', 'You must agree to the terms.');
                        return false;
                    }
                    displayError('terms', '');
                    return true;
                }

                function displayError(inputId, message) {
                    const errorDiv = document.getElementById(inputId + '-error');
                    errorDiv.innerText = message;
                    errorDiv.style.display = message ? 'block' : 'none';
                }

                function updateSubmitButtonState() {
                    submitButton.disabled = !(validateUsername() && validatePassword() && validatePhone() && validateEmail() && validateGender() && validateTerms());
                }

                // Attach event listeners to input elements
                usernameInput.addEventListener('input', function () {
                    validateUsername();
                    updateSubmitButtonState();
                });

                passwordInput.addEventListener('input', function () {
                    validatePassword();
                    updateSubmitButtonState();
                });

                phoneInput.addEventListener('input', function () {
                    validatePhone();
                    updateSubmitButtonState();
                });

                emailInput.addEventListener('input', function () {
                    validateEmail();
                    updateSubmitButtonState();
                });

                genderInputs.forEach(function (input) {
                    input.addEventListener('change', function () {
                        validateGender();
                        updateSubmitButtonState();
                    });
                });

                termsInput.addEventListener('change', function () {
                    validateTerms();
                    updateSubmitButtonState();
                });

                // Initial update on page load
                updateSubmitButtonState();
            });

        </script>
    </body>
</html>
