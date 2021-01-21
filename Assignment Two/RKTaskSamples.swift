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
struct TaskSamples {
    
    /**
     Sample task template!
    */
    static let sampleSurveyTask: ORKOrderedTask = {
        var steps = [ORKStep]()
        
        /*
            CS342 -- ASSIGNMENT 2
            Add steps to the array above to create a survey!
         */
        
        return ORKOrderedTask(identifier: "SurveyTask-Assessment", steps: steps)
    }()
}
