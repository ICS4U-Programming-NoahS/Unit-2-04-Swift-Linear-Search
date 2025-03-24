//
// LinearSearch.swift
//
// Created by Noah Smith
// Created on 2025-03-20
// Version 1.0
// Copyright (c) 2025 Noah Smith. All rights reserved.
//
// TThe Linear Search program will populate an array of 10 random numbers.
// Then it will sort it from smallest to largest.
// Then it will ask the user for a number to search for.
// If the number is found, it will display the index of the number.
// It will keep asking the user for a number to search for until the user enters "q".
// If the user enters "q", the program will display "Goodbye!"
// If the user enters a number that is not an integer, the program will display "Try again."

// Import foundation library
import Foundation

// Declare constants
let arrayLength = 10
let maxNum = 100

// Define the different possible error types
enum InputError: Error {
    case invalidInput
}

// Function to generate an array of random numbers
func populatingArrays() -> [Int] {
    // Create an array of numbers
    var arrayNum = [Int](repeating: 0, count: arrayLength)

    // Generate random numbers between 0 and 100
    for counter in 0..<arrayLength {
        arrayNum[counter] = Int.random(in: 0...maxNum)
    }

    // Sort and return the array
    return arrayNum.sorted()
}

// Greeting
print("Welcome to the linear search program!")

// Initialize user input outside the loop
var userNum = ""

// Initialize userNumInt
var userNumInt = 0

// Keep looping until the user enters "q"
repeat {
    // Get the sorted array by calling the populating arrays function
    let arrayNumber = populatingArrays()

    // Instructions
    print("What number are you searching for in the list below? Enter 'q' to quit.")

    // Display the array
    for num in arrayNumber {

        // Terminator makes it so that all 10 numbers are all on one line
        print(num, terminator: " ")
    }

    // Ask the user for a number to search
    print("Number: ", terminator: "")

    // Get the user's number as a string
    // Got an error that said to force unwrap the readLine using '??'
    // If userNum is nil, it will default to an empty string
    userNum = readLine() ?? ""

    // If the user enters 'q'
    if userNum == "q" {
        print("Goodbye!")
    } else {
        // try to catch invalid input
        do {
            // Attempt to convert the user's input to an integer
            if let userNumInt = Int(userNum) {
                // Search for the user's number in the array
                for index in 0..<arrayLength {
                    // If the number is found in the array
                    if arrayNumber[index] == userNumInt {
                        print("The number \(userNumInt) is found at index \(index).")
                        // Break out of the loop
                        break
                    }
                    // If the number is not found in the array
                    if index == (arrayLength - 1) && arrayNumber[index] != userNumInt {
                        print("\(userNumInt) is not found.")
                    }
                }
            } else {
                // If user does not enter an integer
                throw InputError.invalidInput
            }
        } catch InputError.invalidInput {
            // If user does not enter an integer
            print("Please enter an integer.")
        }
    }

// Keep looping until the user enters "q"
} while userNum != "q"
