import pandas as pd
import random
import faker

# Initialize Faker to generate random data
fake = faker.Faker()

# Define how many records to generate
num_records = 50

# Generate mock data for Listings
listing_data = []

# Loop listings and generate random values
for i in range(1, num_records + 1):
    listing_id = i
    property_type = random.choice(["Apartment", "House", "Parking"])
    city = random.choice(["Paris", "London", "Berlin", "Rome", "Madrid", "Zurich", "Amsterdam", "Vienna", "Brussels", "Lisbon"])
    region = random.choice(["France", "United Kingdom", "Germany", "Italy", "Spain", "Switzerland", "Netherlands", "Austria", "Belgium", "Portugal"])
    price = random.randint(300000, 2000000)  
    created_at = fake.date_time_this_year()  
    updated_at = fake.date_time_this_year()  
    
    created_at_ms = created_at.strftime('%Y-%m-%d %H:%M:%S.') + str(created_at.microsecond // 1000).zfill(3)
    updated_at_ms = updated_at.strftime('%Y-%m-%d %H:%M:%S.') + str(updated_at.microsecond // 1000).zfill(3)
    
    agent_id = random.randint(202, 250)

    # Add created listing to the list
    listing_data.append([listing_id, property_type, city, region, price, created_at_ms, updated_at_ms, agent_id])

# Create DataFrame from the generated listing data
columns = ["listing_id", "property_type", "city", "region", "price", "created_at", "updated_at", "Agent_id"]
df = pd.DataFrame(listing_data, columns=columns)

# Save DataFrame to csv file
csv_file_path = r"C:\Users\bmlad\Documents\AVIV\property_listings.csv"   # Adjust path as needed
df.to_csv(csv_file_path, index=False)

