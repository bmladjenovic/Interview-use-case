import pandas as pd
import random
import faker

# Initialize Faker to generate random data
fake = faker.Faker()

# Define how many records to generate
num_records = 50

# Generate mock data for Leads/Contacts
contact_data = []

# Existing listing IDs to match Listings data for ref integrity
existing_listing_ids = [i for i in range(1, 51)] 

# Loop contacts to generate random column values
for i in range(1, num_records + 1):
    contact_id = i
    listing_id = random.choice(existing_listing_ids)  
    contact_source = random.choice(["organic", "paid", "partner"])  
    contact_timestamp = fake.date_time_this_year()  
    contact_timestamp_ms = contact_timestamp.strftime('%Y-%m-%d %H:%M:%S.') + str(contact_timestamp.microsecond // 1000).zfill(3) 

    # Add created contact to the list
    contact_data.append([contact_id, listing_id, contact_source, contact_timestamp_ms])

# Create DataFrame from the list
columns = ["contact_id", "listing_id", "contact_source", "contact_timestamp"]
df_contacts = pd.DataFrame(contact_data, columns=columns)

# Save DataFrame to csv file
csv_file_path_contacts = r"C:\Users\bmlad\Documents\AVIV\contacts_leads.csv" 
df_contacts.to_csv(csv_file_path_contacts, index=False)

print(f"CSV file created: {csv_file_path_contacts}")

