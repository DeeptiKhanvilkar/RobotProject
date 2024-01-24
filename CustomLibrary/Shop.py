from robot.api.deco import library, keyword


@library
class Shop:
    def __int__(self):
        print("Hi")


    @keyword
    def hello_world(self):
        print("Hello")

    @keyword
    def add_items_to_cart_and_checkout(self):
        print("hey")

