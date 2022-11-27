//
//  ProjectsViewModelTests.swift
//  OpenSourceJetBrainsProjectTests
//
//  Created by Trimeche Hassen on 27/11/2022.
//

import XCTest
@testable import OpenSourceJetBrainsProject

final class ProjectsViewModelTests: XCTestCase {
    
    var model: ProjectsModel!
    var viewModel: ProjectsViewModel!
    var page: Int = 1
    
    override func setUp() {
        super.setUp()
        let projectsService: ProjectsServiceInterface = MockedProjectsService()
        model = ProjectsModel(projectsService: projectsService)
        viewModel = ProjectsViewModel(model: model)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    @MainActor
    func testInit() async {
        Task {
            let projects = try await viewModel.model.fetchProjects(page: page)
            XCTAssertNil(projects)
        }

    }
    @MainActor
    func testFetchProjects() {
        XCTAssertEqual(viewModel.lastCount, 0)
        Task {
            let projects = try await viewModel.model.fetchProjects(page: page)
            XCTAssertNil(projects)
            XCTAssertEqual(page, 1)
            XCTAssertNotNil(viewModel.allProjects.first)
            XCTAssertEqual(viewModel.allProjects.first?.fullName, "JetBrains/JPS")

        }
    }
    
    @MainActor
    func testShouldLoadNextPage() {
        Task {
            _ = try await viewModel.model.fetchProjects(page: page)
            var index = 10
            XCTAssertFalse(viewModel.shouldLoadNextPage(index: index))
            index = 29
            XCTAssertTrue(viewModel.shouldLoadNextPage(index: index))
            
            _ = try await viewModel.model.fetchProjects(page: 2)
            index = 59
            XCTAssertTrue(viewModel.shouldLoadNextPage(index: index))

        }
    }

}
