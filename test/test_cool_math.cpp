#include "gtest/gtest.h"
#include "cool_math.h"

TEST(CoolMathTest, Basic) {
  EXPECT_EQ(7, Add(3, 4));
}

// int main (int argc, char** argv) {
//     ::testing::InitGoogleTest(&argc, argv);

//     int returnValue;

//     //Do whatever setup here you will need for your tests here
//     //
//     //

//     returnValue =  RUN_ALL_TESTS();

//     //Do Your teardown here if required
//     //
//     //

//     return returnValue;
// }
