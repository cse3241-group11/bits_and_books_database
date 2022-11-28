""" For generating fake customer data """
# IMPORTS SECTION #

# for random data generation seeding
import time
from typing import Final
# pip install Faker - for generating realistic fake data
from faker import Faker
# for declaring variables as non-modifiable

# relative filepath of file to output generated customer table to.
OUTPUT_CUSTOMER_TABLE_FILE: Final = "customer_data.csv"
# write-only file mode indicator string for "open" function
WRITE_ONLY_MODE: Final = "w"
# Encoding used for file
FILE_ENCODING: Final = "ascii"
# Num rows per table
NUM_ROWS_PER_TABLE: Final = 20
# US only
US_ONLY: Final = 'en_US'
STR_FMT: Final = '{{random_letter}}'
UPP_CASES: Final = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
PHONE_NUM_MAX_LEN: Final = 10
PASS_LEN: Final = 24
CREDIT_CARD_DATE_FORMAT: Final = '%Y-%m-%d'

# https://www.geeksforgeeks.org/context-manager-in-python/, because
#     file descriptor leakage is never a good thing.


class FileManager():
    """ For managing files """
    # Parameters:
    #
    # - filename - path of file to be opened for file IO by an instance of this
    #              class.
    #
    # - mode - what kind of file IO operation an instance of this class will be
    #          performing on the file specified by "filename"; e.g. reading,
    #          writing, appending, etc.
    #
    def __init__(self, filename, mode):
        self.filename = filename
        self.mode = mode
        self.file = None

    def __enter__(self):
        self.file = open(self.filename, self.mode, encoding=FILE_ENCODING)
        return self.file

    def __exit__(self, exception_type, exception_value, exception_traceback):
        self.file.close()
        # if an exception was caught, display to user associated stacktrace
        if exception_type is not None:
            print(exception_traceback)


# pylint: disable=too-many-locals
def main():
    """main function"""
    # create new fake data generator and seed with current time
    fake_data_gen = Faker(US_ONLY)
    Faker.seed(time.time_ns())
    print(f"\nGenerating customer table with "
          f"{NUM_ROWS_PER_TABLE} random records")
    # Generate customer table data and write to appropriately pre-defined file.
    with FileManager(OUTPUT_CUSTOMER_TABLE_FILE, WRITE_ONLY_MODE) as \
            customer_table_file:
        # Write header first to file
        for customer_id in range(NUM_ROWS_PER_TABLE):
            first_name = fake_data_gen.first_name()
            m_init = fake_data_gen.pystr_format(string_format=STR_FMT,
                                                letters=UPP_CASES)
            last_name = fake_data_gen.last_name()
            phone_number = fake_data_gen.phone_number()
            while len(phone_number) > PHONE_NUM_MAX_LEN:
                phone_number = fake_data_gen.phone_number()
            billing_street = fake_data_gen.street_address()
            billing_city = fake_data_gen.city()
            billing_state = fake_data_gen.state_abbr()
            billing_zip = fake_data_gen.postcode_in_state(billing_state)
            shipping_street = fake_data_gen.street_address()
            shipping_city = fake_data_gen.city()
            shipping_state = fake_data_gen.state_abbr()
            shipping_zip = fake_data_gen.postcode_in_state(shipping_state)
            email = fake_data_gen.ascii_free_email()
            password = fake_data_gen.password(length=PASS_LEN)
            card_number = fake_data_gen.credit_card_number()
            card_sec_code = fake_data_gen.credit_card_security_code()
            card_expiration_date = fake_data_gen.\
                credit_card_expire(date_format=CREDIT_CARD_DATE_FORMAT)
            card_owner_name = fake_data_gen.name()
            customer_table_file.write((str(customer_id) + "," +
                                      first_name + "," +
                                      m_init.upper() + "," +
                                      last_name + "," +
                                      phone_number + "," +
                                      billing_street + "," +
                                      billing_city + "," +
                                      billing_state + "," +
                                      billing_zip + "," +
                                      shipping_street + "," +
                                      shipping_city + "," +
                                      shipping_state + "," +
                                      shipping_zip + "," +
                                      email + "," +
                                      password + "," +
                                      card_number + "," +
                                      card_sec_code + "," +
                                      str(card_expiration_date) + "," +
                                      card_owner_name +
                                      "\n"))
        # Notify user filepath of generated customer table upon
        # table generation completion
        print(f"\nCustomer data table has been written to "
              f"'{OUTPUT_CUSTOMER_TABLE_FILE}'.\n")


# END FUNCTION DECLARATIONS SECTION ##


if __name__ == "__main__":
    main()
