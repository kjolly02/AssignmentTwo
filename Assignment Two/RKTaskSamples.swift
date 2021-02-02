//
//  StudyTasks.swift
//
//  Created for Biodesign's CS342
//  Copyright © 2019 Stanford University.
//  All rights reserved.
//

import ResearchKit

/**
 This file contains some sample `ResearchKit` tasks
 that you can modify and use throughout your project!
*/
struct RKTaskSamples {
    /**
        A2 Steps - Kabir
            Credit to Apple's ORKCatalogSample app as a reference for the code used to create the survey below
     */
    static let onboardingSurveyTask: ORKOrderedTask = {
        var steps = [ORKStep]()
        
//        let booleanAnswer = ORKBooleanAnswerFormat(yesString: "Yes", noString: "Not now")
//        let booleanStep = ORKQuestionStep(identifier: "AreYouReady-Boolean", title: "Before we get started...", question: "Are you ready to start the test?", answer: booleanAnswer)
//
//        steps += [booleanStep]
        
        // About you
        // Age
        let numberAnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: nil, minimum: 0 as NSNumber, maximum: 120 as NSNumber)
        let ageFormItem = ORKFormItem(identifier: "OnboardingForm-Age", text: "How old are you?", answerFormat: numberAnswerFormat, optional: false)
        ageFormItem.placeholder = NSLocalizedString("Enter your age here", comment: "")
        
        // Gender
        let genderChoiceOneText = NSLocalizedString("Male", comment: "")
        let genderChoiceTwoText = NSLocalizedString("Female", comment: "")
        let genderChoiceThreeText = NSLocalizedString("Non-conforming", comment: "")
        let genderChoiceFourText = NSLocalizedString("Male Transgender", comment: "")
        let genderChoiceFiveText = NSLocalizedString("Female Transgender", comment: "")
        let genderChoiceSixText = NSLocalizedString("Other", comment: "")
        let genderChoices = [
            ORKTextChoice(text: genderChoiceOneText, value: "male" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: genderChoiceTwoText, value: "female" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: genderChoiceThreeText, value: "non-conforming" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: genderChoiceFourText, value: "male-transgender" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: genderChoiceFiveText, value: "female-transgender" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoiceOther.choice(withText: genderChoiceSixText, detailText: nil, value: "other" as NSCoding & NSCopying & NSObjectProtocol, exclusive: true, textViewPlaceholderText: "Enter text here")
        ]
        let genderAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: genderChoices)
        let genderFormItem = ORKFormItem(identifier: "OnboardingForm-Gender", text: "What is your preferred gender: ", answerFormat: genderAnswerFormat, optional: false)
        
        // Ethnicity
        let ethnicityChoiceOneText = NSLocalizedString("White", comment: "")
        let ethnicityChoiceTwoText = NSLocalizedString("Hispanic or Latino", comment: "")
        let ethnicityChoiceThreeText = NSLocalizedString("Black or African American", comment: "")
        let ethnicityChoiceFourText = NSLocalizedString("Native American or American Indian", comment: "")
        let ethnicityChoiceFiveText = NSLocalizedString("Asian/Pacific Islander", comment: "")
        let ethnicityChoiceSixText = NSLocalizedString("Other", comment: "")
        let ethnicityChoices = [
            ORKTextChoice(text: ethnicityChoiceOneText, value: "white" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: ethnicityChoiceTwoText, value: "hispanic-latino" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: ethnicityChoiceThreeText, value: "black-african-american" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: ethnicityChoiceFourText, value: "native-american-american-indian" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: ethnicityChoiceFiveText, value: "asian-pacific-islander" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoiceOther.choice(withText: ethnicityChoiceSixText, detailText: nil, value: "other" as NSCoding & NSCopying & NSObjectProtocol, exclusive: true, textViewPlaceholderText: "Enter text here")
        ]
        let ethnicityAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: ethnicityChoices)
        let ethnicityFormItem = ORKFormItem(identifier: "OnboardingForm-Ethnicity", text: "Ethnicity", answerFormat: ethnicityAnswerFormat, optional: false)
        
        let onboardingFormStep = ORKFormStep(identifier: "OnboardingForm", title: "About You", text: "")
        onboardingFormStep.formItems = [ageFormItem, genderFormItem, ethnicityFormItem]
        steps += [onboardingFormStep]
        
        // Medical Onboarding Questions
        let dateAnswerFormat = ORKDateAnswerFormat(style: .date)
        let dateFormItem = ORKFormItem(identifier: "RegistrationForm-DateQuestion", text: "When did you have the surgery?", answerFormat: dateAnswerFormat)
        
        let diseaseCauseChoiceOneText = NSLocalizedString("Diabetes", comment: "")
        let diseaseCauseChoiceTwoText = NSLocalizedString("High Blood Pressure", comment: "")
        let diseaseCauseChoiceThreeText = NSLocalizedString("Glomerulonephritis", comment: "")
        let diseaseCauseChoiceFourText = NSLocalizedString("Polycystic Kidney Disease", comment: "")
        let diseaseCauseChoiceFiveText = NSLocalizedString("Obstruction", comment: "")
        let diseaseCauseChoiceSixText = NSLocalizedString("Unknown", comment: "")
        let diseaseCauseChoiceSevenText = NSLocalizedString("I do not know", comment: "")
        let diseaseCauseChoiceEightText = NSLocalizedString("Other", comment: "")
        let diseaseCauseChoices = [
            ORKTextChoice(text: diseaseCauseChoiceOneText, value: "diabetes" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: diseaseCauseChoiceTwoText, value: "high-blood-pressure" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: diseaseCauseChoiceThreeText, value: "glomerulonephritis" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: diseaseCauseChoiceFourText, value: "polycystic-kidney-disease" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: diseaseCauseChoiceFiveText, value: "obstruction" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: diseaseCauseChoiceSixText, value: "unknown" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: diseaseCauseChoiceSevenText, value: "dont-know" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoiceOther.choice(withText: diseaseCauseChoiceEightText, detailText: nil, value: "other" as NSCoding & NSCopying & NSObjectProtocol, exclusive: true, textViewPlaceholderText: "Enter text here")
        ]
        let diseaseCauseAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: diseaseCauseChoices)
        let diseaseCauseFormItem = ORKFormItem(identifier: "MedicalOnboardingForm-Cause", text: "Cause of kidney disease?", answerFormat: diseaseCauseAnswerFormat, optional: false)
        
        let comorbidities = ["Diabetes", "Hypertension", "Congestive Heart Failure", "COPD", "Other"]
        var comorbiditiesChoices = [ORKTextChoice]()
        for comorbidity in comorbidities {
            let comorbiditiesChoiceText = NSLocalizedString(comorbidity, comment: "")
            if comorbidity != "Other" {
                let comorbiditiesChoice = ORKTextChoice(text: comorbiditiesChoiceText, value: comorbidity.lowercased().filter {!$0.isWhitespace} as NSCoding & NSCopying & NSObjectProtocol)
                comorbiditiesChoices.append(comorbiditiesChoice)
            } else {
                let comorbiditiesChoice = ORKTextChoiceOther.choice(withText: comorbiditiesChoiceText, detailText: nil, value: comorbidity.lowercased().filter {!$0.isWhitespace} as NSCoding & NSCopying & NSObjectProtocol, exclusive: true, textViewPlaceholderText: "Enter text here")
                comorbiditiesChoices.append(comorbiditiesChoice)
            }
        }
//        let comorbiditiesChoiceOneText = NSLocalizedString("Diabetes", comment: "")
//        let comorbiditiesChoiceTwoText = NSLocalizedString("Hypertension", comment: "")
//        let comorbiditiesChoiceThreeText = NSLocalizedString("Congestive Heart Failure", comment: "")
//        let comorbiditiesChoiceFourText = NSLocalizedString("COPD", comment: "")
//        let comorbiditiesChoiceFiveText = NSLocalizedString("Other", comment: "")
//        let comorbiditiesChoices = [
//            ORKTextChoice(text: comorbiditiesChoiceOneText, value: "diabetes" as NSCoding & NSCopying & NSObjectProtocol),
//            ORKTextChoice(text: comorbiditiesChoiceTwoText, value: "choice_2" as NSCoding & NSCopying & NSObjectProtocol),
//            ORKTextChoice(text: comorbiditiesChoiceThreeText, value: "choice_3" as NSCoding & NSCopying & NSObjectProtocol),
//            ORKTextChoice(text: comorbiditiesChoiceFourText, value: "choice_4" as NSCoding & NSCopying & NSObjectProtocol),
//            ORKTextChoiceOther.choice(withText: comorbiditiesChoiceFiveText, detailText: nil, value: "choice_5" as NSCoding & NSCopying & NSObjectProtocol, exclusive: true, textViewPlaceholderText: "Enter text here")
//        ]
        let comorbiditiesAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: comorbiditiesChoices)
        let comorbiditiesFormItem = ORKFormItem(identifier: "MedicalOnboardingForm-Comorbidities", text: "What related conditions (comorbidities) do you have?", answerFormat: comorbiditiesAnswerFormat, optional: false)
        
        let medicalOnboardingFormStep = ORKFormStep(identifier: "MedicalOnboardingForm", title: "Kidney-Related Medical Questions", text: "")
        medicalOnboardingFormStep.formItems = [dateFormItem, diseaseCauseFormItem, comorbiditiesFormItem]
        steps += [medicalOnboardingFormStep]

        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Thank you."
        summaryStep.text = "All done!"
        steps += [summaryStep]

        let task = ORKNavigableOrderedTask(identifier: "SurveyTask-Assessment", steps: steps)

        let resultBooleanSelector = ORKResultSelector(resultIdentifier: onboardingFormStep.identifier)
        let predicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: resultBooleanSelector, expectedAnswer: true)
        let navigableRule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(predicate, summaryStep.identifier)])
        task.setNavigationRule(navigableRule, forTriggerStepIdentifier: onboardingFormStep.identifier)

        return task
    }()
    
    /**
     Sample task template!
    */
    static let sampleSurveyTask: ORKOrderedTask = {
        var steps = [ORKStep]()
        
        /*
            CS342 -- ASSIGNMENT 2
            Add steps to the array above to create a survey!
         */
        
        let booleanAnswer = ORKBooleanAnswerFormat(yesString: "YES!", noString: "Not now")
        let booleanStep = ORKQuestionStep(identifier: "AreYouReady-Boolean", title: "Before we get started...", question: "Are you ready to start the test?", answer: booleanAnswer)

        steps += [booleanStep]

        let dateAnswerFormat = ORKDateAnswerFormat(style: .date)
        let numberAnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: nil, minimum: 0 as NSNumber, maximum: 100 as NSNumber)

        let ageFormItem = ORKFormItem(identifier: "RegistrationForm-Age", text: "How old are you?", answerFormat: numberAnswerFormat, optional: true)
        let dateFormItem = ORKFormItem(identifier: "RegistrationForm-DateQuestion", text: "When did you have surgery?", answerFormat: dateAnswerFormat)

        let formStep = ORKFormStep(identifier: "RegistrationForm", title: "About you", text: "Please take a moment to answer some (very) quick questions!")
        formStep.formItems = [dateFormItem, ageFormItem]
        steps += [formStep]

        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Thank you."
        summaryStep.text = "All done!"
        steps += [summaryStep]

        let task = ORKNavigableOrderedTask(identifier: "SurveyTask-Assessment", steps: steps)

        let resultBooleanSelector = ORKResultSelector(resultIdentifier: booleanStep.identifier)
        let predicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: resultBooleanSelector, expectedAnswer: false)
        let navigableRule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(predicate, summaryStep.identifier)])
        task.setNavigationRule(navigableRule, forTriggerStepIdentifier: booleanStep.identifier)

        return task
    }()

    /**
     Sample task template!
    */
    static let sampleTappingTask: ORKOrderedTask = {
        var steps = [ORKStep]()

        /*
            CS342 -- ASSIGNMENT 2
            Add steps to the array above to create a survey!
         */

        let booleanAnswer = ORKBooleanAnswerFormat(yesString: "YES!", noString: "Not now")
        let booleanStep = ORKQuestionStep(identifier: "AreYouReady-Boolean", title: "Before we get started...", question: "Are you ready to start the test?", answer: booleanAnswer)

        steps += [booleanStep]

        // add an active task here
        let tappingTask = ORKOrderedTask.twoFingerTappingIntervalTask(withIdentifier: "TappingTask", intendedUseDescription: "Finger tapping is a universal way to communicate.", duration: 5, handOptions: .right, options: ORKPredefinedTaskOption())
        steps += tappingTask.steps

        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Thank you."
        summaryStep.text = "All done!"
        steps += [summaryStep]

        let task = ORKNavigableOrderedTask(identifier: "SurveyTappingTask-Assessment", steps: steps)

        let resultBooleanSelector = ORKResultSelector(resultIdentifier: booleanStep.identifier)
        let predicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: resultBooleanSelector, expectedAnswer: false)
        let navigableRule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(predicate, summaryStep.identifier)])
        task.setNavigationRule(navigableRule, forTriggerStepIdentifier: booleanStep.identifier)

        return task
    }()
}
