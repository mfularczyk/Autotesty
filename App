data_types = (int, float, complex)
import unittest


class CalcApp:

    @staticmethod
    def validate(a, b):
        if not isinstance(a, data_types) and not isinstance(b, data_types):
            raise ValueError

    def add(self, a, b):
        self.validate(a, b)
        return a + b

    def sub(self, a, b):
        self.validate(a, b)
        return a - b

    def multiply(self, a, b):
        self.validate(a, b)
        return a * b

    def div(self, a, b):
        self.validate(a, b)
        return a / b



class CalcTests(unittest.TestCase):

    def setUp(self):
        self.method = CalcApp()

    def test_add(self):
        result = self.method.add(1, 3)
        self.assertEqual(4, result)

    def test_add_fail(self):
            result = self.method.add(1, 3)
            self.assertEqual(7, result)

    def test_add_invalid_value(self):
        self.assertRaises(ValueError, self.method.add, "one", "two")

    def test_multiply(self):
        result = self.method.multiply(5, 3)
        self.assertEqual(15, result)

    def test_multiply_invalid_value(self):
        self.assertRaises(ValueError, self.method.multiply, "two", "one")

    def test_sub_invalid_value(self):
        self.assertRaises(ValueError, self.method.sub, "one", "two")

    def test_sub(self):
        result = self.method.sub(6, 4)
        self.assertEqual(2, result)

    def test_div_invalid_value(self):
        self.assertRaises(ValueError, self.method.div, "four", "six")

    def test_div(self):
        result = self.method.div(6, 2)
        self.assertEqual(3, result)

    def test_div_zero(self):
        self.assertRaises(ZeroDivisionError, self.method.div, 3, 0)


if __name__ == '__main__':
    unittest.main()