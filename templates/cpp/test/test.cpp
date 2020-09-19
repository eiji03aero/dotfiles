#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <iostream>
#include <unistd.h>
#include <spawn.h>
#include <sys/wait.h>

#include "gtest/gtest.h"

extern char **environ;

TEST(ExampleTest, Test) {
  EXPECT_TRUE(true);
};
