```json
{
  "project_metadata": {
    "project_id": "{{project_id=PRJ-001}}",
    "project_name": "{{project_name=CalcMaster}}",
    "project_manager": "{{project_manager=Alex Chen}}",
    "creation_date": "{{creation_date=2023-10-26}}",
    "last_modified_date": "{{last_modified_date=2023-10-26}}",
    "version": "{{version=1.0}}"
  },
  "allow_inference": true,
  "Software_Development_Life_Cycle": {
    "feedback_loops": {
      "stakeholder_feedback": ["{{stake_feedback_1=Initial requirements approved during kickoff.}}"],
      "user_feedback": ["{{user_feedback_1=Beta testers requested a more visible history panel.}}"],
      "iteration_planning": ["{{iteration_plan_1=Scope for Sprint 3 finalized, focusing on memory functions.}}"]
    },
    "model": {
      "primary_development_methodology": "{{primary_methodology=Agile}}",
      "is_hybrid_model": "{{is_hybrid=false}}",
      "hybrid_description": "{{hybrid_desc=}}"
    },
    "phase1": {
      "requirements": {
        "software_name": "{{project_name}}",
        "type_of_software": "{{software_type=Desktop Utility Application}}",
        "target": "{{target_audience=Students, engineers, accountants, and general professionals}}",
        "goal": "{{project_goal=To provide a user-friendly, reliable, and efficient calculator with essential and extended mathematical functions.}}",
        "problem": "{{problem_statement=Existing OS calculators lack advanced functions and features like a persistent history.}}",
        "solution": "{{solution_description=A dedicated software calculator focused on usability and powerful features.}}",
        "features": [
          {
            "id": "F-01",
            "description": "{{feature_1_desc=Basic Arithmetic Operations (+, -, *, /)}}",
            "priority": "{{feature_1_priority=High}}",
            "status": "{{feature_1_status=Approved}}"
          },
          {
            "id": "F-02",
            "description": "{{feature_2_desc=Advanced Functions (√, x², %, π)}}",
            "priority": "{{feature_2_priority=High}}",
            "status": "{{feature_2_status=Approved}}"
          },
          {
            "id": "F-03",
            "description": "{{feature_3_desc=Memory Functions (MC, MR, M+, M-)}}",
            "priority": "{{feature_3_priority=Medium}}",
            "status": "{{feature_3_status=Approved}}"
          },
          {
            "id": "F-04",
            "description": "{{feature_4_desc=Calculation History Log}}",
            "priority": "{{feature_4_priority=Medium}}",
            "status": "{{feature_4_status=In Progress}}"
          }
        ],
        "technologies": ["{{tech_1=Python}}", "{{tech_2=PyQt}}"],
        "stakeholders": ["{{stakeholder_1=Project Sponsor}}", "{{stakeholder_2=Project Manager}}", "{{stakeholder_3=Lead Developer}}", "{{stakeholder_4=End Users}}"],
        "success_criteria": ["{{success_criteria_1=95% of UAT test cases pass}}", "{{success_criteria_2=Zero critical bugs at launch}}", "{{success_criteria_3=Launch before Jan 15, 2024}}"],
        "security_privacy_requirements": {
          "data_encryption_requirements": ["{{encryption_req=N/A - No sensitive user data stored}}"],
          "authentication_authorization_requirements": ["{{auth_req=N/A - No user accounts in v1.0}}"],
          "compliance_standards": ["{{compliance_std=WCAG 2.1 AA}}"]
        }
      },
      "planning": {
        "platform": ["{{platform_1=Windows 10+}}", "{{platform_2=macOS 10.15+}}"],
        "timeline": {
          "start_date": "{{timeline_start=2023-10-30}}",
          "estimated_end_date": "{{timeline_end=2024-01-15}}",
          "sprint_cycle_days": "{{sprint_days=14}}"
        },
        "milestones": [
          {
            "name": "{{milestone_1_name=Requirements Sign-off}}",
            "date": "{{milestone_1_date=2023-11-10}}",
            "status": "{{milestone_1_status=Completed}}"
          },
          {
            "name": "{{milestone_2_name=UI/UX Design Approval}}",
            "date": "{{milestone_2_date=2023-11-17}}",
            "status": "{{milestone_2_status=Pending}}"
          }
        ],
        "budget": {
          "currency": "{{budget_currency=USD}}",
          "amount": "{{budget_amount=15000}}"
        },
        "resources": ["{{resource_1=Developer Laptop}}", "{{resource_2=Design Software License}}", "{{resource_3=Testing Devices}}"],
        "team_roles": ["{{role_1=Project Manager}}", "{{role_2=UI/UX Designer}}", "{{role_3=Backend Developer}}", "{{role_4=QA Tester}}"],
        "risk_management": {
          "identified_risks": [
            {
              "id": "R-01",
              "description": "{{risk_1_desc=Scope creep from adding too many advanced features}}",
              "probability": "{{risk_1_prob=Medium}}",
              "impact": "{{risk_1_impact=High}}",
              "status": "{{risk_1_status=Monitoring}}"
            }
          ],
          "mitigation_strategies": [
            {
              "risk_id": "R-01",
              "strategy": "{{mitigation_1_strat=Strict adherence to the prioritized product backlog. New features will be deferred to Version 2.0.}}"
            }
          ],
          "contingency_plans": []
        }
      }
    },
    "phase2": {
      "analysis": {
        "functional_requirements": [
          {
            "id": "FR-01",
            "description": "{{fr_1_desc=The system shall correctly perform addition, subtraction, multiplication, and division.}}",
            "source": "{{fr_1_source=US-01}}"
          }
        ],
        "non_functional_requirements": [
          {
            "id": "NFR-01",
            "description": "{{nfr_1_desc=All operations must execute and display a result in < 100ms.}}",
            "category": "{{nfr_1_category=Performance}}"
          }
        ],
        "use_cases": [],
        "user_stories": [
          {
            "id": "US-01",
            "description": "{{us_1_desc=As a student, I want to perform basic arithmetic so that I can check my homework.}}",
            "priority": "{{us_1_priority=High}}"
          }
        ],
        "compliance_requirements": ["{{compliance_req_1=WCAG 2.1 Level AA}}"]
      },
      "system_design": {
        "system_architecture": "{{sys_arch=Monolithic Desktop Application}}",
        "data_flow_diagrams": ["{{dfd_location=}}"],
        "entity_relationship_diagrams": ["{{erd_location=}}"],
        "technical_specifications": "{{tech_spec_doc=}}"
      }
    },
    "phase3": {
      "architecture": {
        "architecture_style": "{{arch_style=Model-View-Controller (MVC)}}",
        "components": ["{{component_1=Calculation Engine (Model)}}", "{{component_2=GUI (View)}}", "{{component_3=Controller}}"],
        "interactions": [],
        "scalability": "{{scalability_note=Vertical scaling only; not designed for distributed systems.}}"
      },
      "ui_ux_design": {
        "wireframes": ["{{wireframe_link=}}"],
        "mockups": ["{{mockup_link=}}"],
        "prototypes": ["{{prototype_link=}}"],
        "user_journeys": ["{{user_journey_desc=}}"]
      }
    },
    "phase4": {
      "development": {
        "programming_languages": ["{{prog_lang_1=Python}}"],
        "frameworks": ["{{framework_1=PyQt}}"],
        "libraries": ["{{library_1=}}"],
        "version_control": "{{version_control_system=Git}}",
        "dependencies": {
          "external_dependencies": ["{{ext_dep_1=PyQt6}}"],
          "internal_dependencies": ["{{int_dep_1=}}"]
        }
      },
      "integration": {
        "api_integration": ["{{api_integration_1=N/A}}"],
        "third_party_services": ["{{third_party_1=N/A}}"],
        "data_integration": "{{data_integration_plan=N/A}}",
        "continuous_integration_tools": ["{{ci_tool_1=Jenkins}}"]
      }
    },
    "phase5": {
      "testing": {
        "test_plans": ["{{test_plan_link=}}"],
        "unit_testing": {
          "tools": ["{{unit_test_tool_1=pytest}}"],
          "coverage_goal": "{{unit_test_cov_goal=80%}}"
        },
        "integration_testing": {
          "strategy": "{{integration_test_strat=Big Bang}}"
        },
        "system_testing": ["{{system_test_plan=}}"],
        "user_acceptance_testing": ["{{uat_plan=}}"]
      },
      "quality_assurance": {
        "code_reviews": ["{{code_review_policy=Yes}}"],
        "automated_testing_tools": ["{{automated_test_tool_1=Selenium}}"],
        "performance_testing": ["{{perf_test_type=Response Time Testing}}"],
        "security_testing": ["{{sec_test_type=Static Application Security Testing (SAST)}}", "{{sec_test_type_2=Manual Code Review}}"],
        "performance_metrics": ["{{perf_metric_1=Operation Execution Time}}"],
        "acceptance_criteria": ["{{acceptance_criteria_1=All test cases pass}}", "{{acceptance_criteria_2=No open critical bugs}}"]
      }
    },
    "phase6": {
      "deployment": {
        "deployment_strategies": ["{{deployment_strat_1=Simple Package Deployment}}"],
        "environments": ["{{env_1=Development}}", "{{env_2=Staging}}", "{{env_3=Production}}"],
        "monitoring_tools": ["{{monitoring_tool_1=N/A}}"],
        "rollback_plans": ["{{rollback_plan_1=Versioned installers allow for rollback to previous version.}}"],
        "post_deployment_evaluation": {
          "metrics": ["{{post_deploy_metric_1=User Downloads}}", "{{post_deploy_metric_2=Crash Reports}}"],
          "user_adoption": "{{user_adoption_metric=TBD}}",
          "performance_monitoring": ["{{perf_monitor_1=Start-up Time}}", "{{perf_monitor_2=Response Time}}"]
        }
      }
    },
    "phase7": {
      "maintenance": {
        "bug_fixes": ["{{bug_fix_log=}}"],
        "updates": ["{{update_log=}}"],
        "performance_optimization": ["{{perf_optimization_log=}}"],
        "user_support": ["{{support_channel_1=Email Support}}", "{{support_channel_2=Documentation}}"]
      },
      "documentation": {
        "user_manuals": ["{{user_manual_link=In-Application Help Guide}}"],
        "technical_documentation": ["{{tech_doc_link=Code Comments}}", "{{tech_doc_link_2=Architecture Decision Record}}"],
        "api_documentation": ["{{api_doc_link=N/A}}"],
        "release_notes": ["{{release_notes_link=}}"]
      },
      "version_management": {
        "versioning_strategy": "{{version_strat=Semantic Versioning}}",
        "update_frequency": "{{update_freq=As needed for bug fixes; quarterly for feature updates}}",
        "deprecation_policy": "{{deprecation_policy=Features will be deprecated for one major version before removal.}}"
      }
    }
  }
}
```