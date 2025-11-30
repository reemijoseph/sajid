# -*- coding: utf-8 -*-
import streamlit as st
import datetime

# --- Configuration & Styling ---
st.set_page_config(
    page_title="The Grandview Hotel",
    layout="wide",
    initial_sidebar_state="auto" 
)

# --- Define Image URLs (NEW WORKING LINKS) ---
# Replacing with stable, high-quality links
HERO_IMAGE = 'https://images.unsplash.com/photo-1563911302283-d2bc129e7570?ixlib=rb-4.0.3&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=2070'
STANDARD_ROOM_IMG = 'https://images.unsplash.com/photo-1560447330-9d93699b61d4?ixlib=rb-4.0.3&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1770'
DELUXE_SUITE_IMG = 'https://images.unsplash.com/photo-1590439493913-c35d944111be?ixlib=rb-4.0.3&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1770'
FAMILY_ROOM_IMG = 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?ixlib=rb-4.0.3&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1770'


# --- Custom CSS for Styling ---
st.markdown(
    f"""
    <style>
    /* Global Styles */
    .stApp {{
        background-color: #f8f8f8; /* Very light gray background for depth */
        color: #333;
        font-family: 'Roboto', 'Helvetica Neue', Arial, sans-serif;
    }}
    
    /* HIDE the default Streamlit header/footer */
    .stApp > header {{ display: none; }}
    #MainMenu {{ visibility: hidden; }}
    footer {{ visibility: hidden; }}

    /* Streamlit Sidebar Customization */
    .st-emotion-cache-vk3wpn {{ /* Sidebar background color */
        background-color: #004c4c; 
        color: white;
    }}
    .st-emotion-cache-vk3wpn .stRadio > label, 
    .st-emotion-cache-vk3wpn .stMarkdown p {{
        color: white !important;
    }}
    .st-emotion-cache-vk3wpn .stRadio [data-baseweb="radio"] span:last-child {{
        color: white !important;
    }}
    .st-emotion-cache-vk3wpn .stRadio [data-baseweb="radio"] span:first-child {{
        border-color: #ffcc00 !important;
    }}
    .st-emotion-cache-vk3wpn .stAlert {{ /* Info box in sidebar */
        background-color: #1a6f6f !important;
        color: white !important;
    }}
    
    /* --- Hero Section --- */
    .hero-section {{
        background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url('{HERO_IMAGE}') no-repeat center center/cover;
        height: 70vh;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #ffffff;
        text-align: center;
        border-radius: 12px;
        margin-bottom: 40px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    }}

    .hero-content {{
        background: rgba(0, 0, 0, 0.6);
        padding: 40px 60px;
        border-radius: 12px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
    }}
    .hero-content h2 {{
        font-size: 3.5em;
        margin-bottom: 15px;
        font-weight: 700;
        color: white;
    }}
    .hero-content p {{
        font-size: 1.4em;
        font-weight: 300;
        color: white;
    }}

    /* Primary Button (To style the Streamlit button) */
    .stButton>button {{
        display: inline-block;
        background: #ffcc00;
        color: #004c4c !important;
        padding: 15px 30px;
        text-decoration: none;
        border-radius: 8px;
        margin-top: 25px;
        font-size: 18px;
        font-weight: bold;
        transition: background 0.3s, box-shadow 0.3s;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        border: none; /* Remove default Streamlit border */
    }}
    .stButton>button:hover {{
        background: #e6b800;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
    }}
    /* Center the button inside the hero content */
    .hero-button-container {{
        text-align: center;
        margin-top: 25px;
    }}
    
    /* Section Headers */
    h2 {{
        font-size: 3em;
        color: #004c4c;
        margin-bottom: 50px;
        font-weight: 600;
        text-align: center;
    }}
    
    /* Room Card Styling */
    .room-card {{
        background: #ffffff;
        border-radius: 10px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        overflow: hidden;
        transition: transform 0.3s, box-shadow 0.3s;
        height: 100%; /* Important for column alignment */
        margin-bottom: 20px;
    }}
    .room-card:hover {{
        transform: translateY(-8px);
        box-shadow: 0 12px 25px rgba(0, 0, 0, 0.25);
    }}
    .room-card h3 {{
        padding: 0 20px;
        font-size: 1.5em;
        color: #004c4c;
    }}
    .room-card p {{
        padding: 0 20px 20px 20px;
    }}

    /* --- Amenities Section --- */
    .amenities-list {{
        list-style: none;
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        padding-top: 20px;
    }}
    .amenities-list li {{
        background: #ffffff;
        color: #004c4c;
        padding: 18px 30px; 
        margin: 12px;
        border-radius: 30px;
        font-weight: 600;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: background 0.3s;
    }}
    .amenities-list li:hover {{
        background: #ffcc00;
        color: #333;
    }}
    .icon {{
        margin-right: 10px;
        color: #ffcc00;
        font-size: 1.4em;
        line-height: 1;
    }}
    
    /* --- Contact Info Styling --- */
    .contact-info {{
        text-align: left;
        padding: 20px;
        border-radius: 8px;
    }}
    .contact-info p {{
        font-size: 1.1em;
        margin-bottom: 10px;
    }}
    .contact-info b {{
        color: #004c4c;
    }}
    
    /* --- Footer --- */
    .custom-footer {{
        background: #1c1c1c; 
        color: #ccc;
        padding: 20px 0;
        text-align: center;
        width: 100%;
        margin-top: 40px;
    }}

    </style>
    """,
    unsafe_allow_html=True
)

# --- Initialize Session State for Navigation ---
if 'page' not in st.session_state:
    st.session_state['page'] = "Home"

# Function to navigate (Used for the button's on_click)
def navigate_to(page_name):
    st.session_state['page'] = page_name
    
# Function to handle booking form submission
def submit_booking():
    # Example validation: Check if required fields are filled
    if not st.session_state.get('guest_name') or not st.session_state.get('guest_email'):
        st.error("Please fill in your Full Name and Email Address.")
        return

    # Check if check-out is after check-in
    if st.session_state['check_in'] >= st.session_state['check_out']:
        st.error("Check-out date must be after Check-in date.")
        return
        
    st.success(f"**Reservation Successful!** We've sent a confirmation email to {st.session_state['guest_email']}.")
    st.balloons()
    st.info(f"""
        **Details:**
        - **Guest Name:** {st.session_state['guest_name']}
        - **Room Type:** {st.session_state['room_type']}
        - **Dates:** {st.session_state['check_in'].strftime('%Y-%m-%d')} to {st.session_state['check_out'].strftime('%Y-%m-%d')}
    """)

# Function to handle contact form submission
def submit_contact_form():
    if not st.session_state.get('contact_name') or not st.session_state.get('contact_email') or not st.session_state.get('contact_message'):
        st.error("Please fill in your Name, Email, and Message.")
        return
        
    st.success(f"**Thank you, {st.session_state['contact_name']}!** Your message has been received.")
    st.info(f"""
        **We received the following inquiry:**
        - **Topic:** {st.session_state['contact_topic']}
        - **Message:** "{st.session_state['contact_message'][:100]}..." (Summary)
    """)
    # Reset form fields after submission (requires keys for widgets)
    st.session_state['contact_name'] = ""
    st.session_state['contact_email'] = ""
    st.session_state['contact_topic'] = "General Inquiry"
    st.session_state['contact_message'] = ""


# --- 1. Functional Navigation (Streamlit Sidebar) ---
st.sidebar.title("The Grandview Hotel 🏨")
st.sidebar.markdown("---") 

# Use the session state variable to control the radio button
st.sidebar.radio(
    "Explore our hotel:",
    ["Home", "Rooms & Suites", "Book a Room", "Amenities", "Contact Us"],
    key="page" # Link radio to session state
)

st.sidebar.markdown("---")
st.sidebar.info("Experience luxury with seamless web deployment!")

# --- 2. Page Rendering Logic (Uses st.session_state['page']) ---

if st.session_state['page'] == "Home":
    # Hero Section with embedded image URL from CSS
    st.markdown('<div class="hero-section">', unsafe_allow_html=True)
    
    st.markdown(
        """
        <div class="hero-content">
            <h2>Your Luxurious Escape Awaits</h2>
            <p>Experience world-class hospitality in the heart of the city.</p>
        </div>
        """,
        unsafe_allow_html=True
    )
    
    # Place the button inside a container for styling control
    with st.container():
        st.button(
            "Explore Rooms",
            on_click=navigate_to, 
            args=("Rooms & Suites",),
            key="explore_rooms_btn"
        )

    st.markdown('</div>', unsafe_allow_html=True)
    
    # Text content for Home
    st.markdown("<h2>Why Choose The Grandview?</h2>", unsafe_allow_html=True)
    st.write("With unparalleled service, breathtaking views, and modern amenities, your stay with us will be an unforgettable experience. We pride ourselves on exceptional hospitality and a tranquil environment.")

# --- Rooms Section with st.image() ---
elif st.session_state['page'] == "Rooms & Suites":
    st.markdown("<h2>Our Luxurious Accommodations</h2>", unsafe_allow_html=True)
    st.write("Each room and suite is designed with your comfort in mind, blending elegant decor with modern conveniences.")

    col1, col2, col3 = st.columns(3) # Create three columns

    # Room Card 1: Standard Double
    with col1:
        st.markdown('<div class="room-card">', unsafe_allow_html=True)
        # Using st.image() for easy image loading
        st.image(STANDARD_ROOM_IMG, caption="A cozy retreat for two.", use_column_width="always")
        st.markdown("<h3>Standard Double</h3>", unsafe_allow_html=True)
        st.markdown("<p>Comfortable and elegantly designed for a restful stay, featuring a plush queen-sized bed and city views.</p>", unsafe_allow_html=True)
        st.markdown("</div>", unsafe_allow_html=True)

    # Room Card 2: Deluxe Suite
    with col2:
        st.markdown('<div class="room-card">', unsafe_allow_html=True)
        st.image(DELUXE_SUITE_IMG, caption="Indulge in extra space and luxury.", use_column_width="always")
        st.markdown("<h3>Deluxe Suite</h3>", unsafe_allow_html=True)
        st.markdown("<p>Spacious living area, premium views, and exclusive services for an elevated experience. Perfect for extended stays.</p>", unsafe_allow_html=True)
        st.markdown("</div>", unsafe_allow_html=True)
    
    # Room Card 3: Family Room
    with col3:
        st.markdown('<div class="room-card">', unsafe_allow_html=True)
        st.image(FAMILY_ROOM_IMG, caption="Comfort for the whole family.", use_column_width="always")
        st.markdown("<h3>Family Room</h3>", unsafe_allow_html=True)
        st.markdown("<p>Ideal for families, offering extra space, multiple beds, and amenities tailored for a comfortable group stay.</p>", unsafe_allow_html=True)
        st.markdown("</div>", unsafe_allow_html=True)
    
    st.markdown("<br>", unsafe_allow_html=True)
    
    # Button to navigate to Book a Room
    st.button("Ready to Book Your Stay?", on_click=navigate_to, args=("Book a Room",))

# --- Booking Page: Interactive Form (Retained from previous step) ---
elif st.session_state['page'] == "Book a Room":
    st.markdown("<h2>Secure Your Reservation 📝</h2>", unsafe_allow_html=True)
    st.markdown("Please fill out the details below to complete your booking.")

    # Start the form
    with st.form(key="booking_form"):
        # 1. Date Selection
        st.subheader("Stay Details 📅")
        
        date_col1, date_col2 = st.columns(2)
        with date_col1:
            check_in = st.date_input(
                "Check-in Date", 
                min_value=datetime.date.today(), 
                value=datetime.date.today(),
                key="check_in"
            )
        with date_col2:
            check_out = st.date_input(
                "Check-out Date", 
                min_value=datetime.date.today() + datetime.timedelta(days=1), 
                value=datetime.date.today() + datetime.timedelta(days=2),
                key="check_out"
            )

        # 2. Room & Guest Selection
        st.subheader("Room & Guest Preferences 🛏️")

        room_col, guest_col = st.columns(2)
        with room_col:
            room_type = st.selectbox(
                "Select Room Type",
                ["Standard Double", "Deluxe Suite", "Family Room"],
                key="room_type"
            )
        with guest_col:
            num_guests = st.slider(
                "Number of Guests", 
                min_value=1, 
                max_value=6, 
                value=2,
                key="num_guests"
            )
        
        # 3. Guest Information
        st.subheader("Your Contact Information 📧")
        
        name_col, email_col = st.columns(2)
        with name_col:
            guest_name = st.text_input("Full Name", key="guest_name")
        with email_col:
            guest_email = st.text_input("Email Address", key="guest_email")

        # Submit button
        st.markdown("---")
        submitted = st.form_submit_button("Confirm Booking", on_click=submit_booking)
        

# --- Amenities Page ---
elif st.session_state['page'] == "Amenities":
    st.markdown("<h2>Luxury Amenities ✨</h2>", unsafe_allow_html=True)
    st.write("We offer a range of premium amenities to ensure your stay is comfortable.")
    st.markdown(
        """
        <div class="amenities-list">
            <li><i class="icon">★</i> Complimentary High-Speed Wi-Fi</li>
            <li><i class="icon">★</i> Rooftop Pool & Lounge</li>
            <li><i class="icon">★</i> Fine Dining Restaurant</li>
            <li><i class="icon">★</i> 24-Hour Room Service</li>
            <li><i class="icon">★</i> Fitness Center & Spa</li>
        </div>
        """,
        unsafe_allow_html=True
    )
    
# --- Contact Us Page: Contact Info and Form ---
elif st.session_state['page'] == "Contact Us":
    st.markdown("<h2>Contact The Grandview Hotel 📞</h2>", unsafe_allow_html=True)
    st.write("We're here to assist you with any inquiries, bookings, or special requests.")

    contact_col, form_col = st.columns([1, 2]) # Split into 1/3 for info, 2/3 for form

    with contact_col:
        st.subheader("Our Information 📍")
        st.markdown('<div class="contact-info">', unsafe_allow_html=True)
        st.markdown("<p><b>Address:</b> 42 Grandview Blvd, City Center, 10001</p>", unsafe_allow_html=True)
        st.markdown("<p><b>Phone:</b> +1 (555) 123-4567</p>", unsafe_allow_html=True)
        st.markdown("<p><b>Email:</b> info@grandviewhotel.com</p>", unsafe_allow_html=True)
        st.markdown("<p><b>Hours:</b> 24/7 Concierge Service</p>", unsafe_allow_html=True)
        st.markdown('</div>', unsafe_allow_html=True)

    with form_col:
        st.subheader("Send Us a Message 📧")
        with st.form(key="contact_form"):
            name_col, email_col = st.columns(2)
            with name_col:
                contact_name = st.text_input("Your Name*", key="contact_name")
            with email_col:
                contact_email = st.text_input("Your Email*", key="contact_email")
            
            contact_topic = st.selectbox(
                "Topic", 
                ["General Inquiry", "Reservation Change", "Group Booking", "Feedback"],
                key="contact_topic"
            )
            
            contact_message = st.text_area("Your Message*", height=150, key="contact_message")
            
            st.form_submit_button("Submit Inquiry", on_click=submit_contact_form)


# --- Footer ---
st.markdown(
    """
    <div class="custom-footer">
        <p>&copy; 2025 The Grandview Hotel. All rights reserved.</p>
    </div>
    """,
    unsafe_allow_html=True
)
