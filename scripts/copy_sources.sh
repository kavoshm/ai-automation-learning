#!/usr/bin/env bash
# copy_sources.sh -- One-time script used to populate this repo from phase directories.
# Kept for reference only. Run generate_figures.py to regenerate visualizations.
set -euo pipefail

DEST="/home/k1/projects/Kavosh/repos/ai-automation-learning"
P1="/home/k1/projects/Kavosh/phase-1-llm-foundations"
P2="/home/k1/projects/Kavosh/phase-2-rag-pipelines"
P3="/home/k1/projects/Kavosh/phase-3-evaluation"
P4="/home/k1/projects/Kavosh/phase-4-agentic"
P5="/home/k1/projects/Kavosh/phase-5-llmops"
P6="/home/k1/projects/Kavosh/phase-6-portfolio"

# Helper: copy files excluding __pycache__
copy_dir() {
    local src="$1"
    local dst="$2"
    mkdir -p "$dst"
    rsync -av --exclude='__pycache__' "$src/" "$dst/"
}

# 01-prompt-engineering
mkdir -p "$DEST/01-prompt-engineering/examples"
cp "$P1/1-1-prompt-engineering/README.md" "$DEST/01-prompt-engineering/"
cp "$P1/1-1-prompt-engineering/notes.md" "$DEST/01-prompt-engineering/"
cp "$P1/1-1-prompt-engineering/examples/few_shot_classification.py" "$DEST/01-prompt-engineering/examples/"
cp "$P1/1-1-prompt-engineering/examples/chain_of_thought.py" "$DEST/01-prompt-engineering/examples/"
cp "$P1/1-1-prompt-engineering/examples/system_prompt_patterns.py" "$DEST/01-prompt-engineering/examples/"

# 02-building-systems
mkdir -p "$DEST/02-building-systems/examples"
cp "$P1/1-2-building-systems/README.md" "$DEST/02-building-systems/"
cp "$P1/1-2-building-systems/notes.md" "$DEST/02-building-systems/"
cp "$P1/1-2-building-systems/examples/chained_prompts.py" "$DEST/02-building-systems/examples/"
cp "$P1/1-2-building-systems/examples/classification_pipeline.py" "$DEST/02-building-systems/examples/"
cp "$P1/1-2-building-systems/examples/moderation_layer.py" "$DEST/02-building-systems/examples/"

# 03-langchain
mkdir -p "$DEST/03-langchain/examples"
cp "$P1/1-4-langchain-dev/README.md" "$DEST/03-langchain/"
cp "$P1/1-4-langchain-dev/notes.md" "$DEST/03-langchain/"
cp "$P1/1-4-langchain-dev/examples/basic_chain.py" "$DEST/03-langchain/examples/"
cp "$P1/1-4-langchain-dev/examples/memory_chain.py" "$DEST/03-langchain/examples/"
cp "$P1/1-4-langchain-dev/examples/simple_agent.py" "$DEST/03-langchain/examples/"

# 04-lcel
mkdir -p "$DEST/04-lcel/examples"
cp "$P1/1-5-lcel-docs/README.md" "$DEST/04-lcel/"
cp "$P1/1-5-lcel-docs/notes.md" "$DEST/04-lcel/"
cp "$P1/1-5-lcel-docs/examples/lcel_basics.py" "$DEST/04-lcel/examples/"
cp "$P1/1-5-lcel-docs/examples/parallel_chains.py" "$DEST/04-lcel/examples/"
cp "$P1/1-5-lcel-docs/examples/streaming_example.py" "$DEST/04-lcel/examples/"

# 05-rag-fundamentals
mkdir -p "$DEST/05-rag-fundamentals/examples"
cp "$P2/2-1-chat-with-data/README.md" "$DEST/05-rag-fundamentals/"
cp "$P2/2-1-chat-with-data/notes.md" "$DEST/05-rag-fundamentals/"
cp "$P2/2-1-chat-with-data/examples/document_loader.py" "$DEST/05-rag-fundamentals/examples/"
cp "$P2/2-1-chat-with-data/examples/text_splitter_comparison.py" "$DEST/05-rag-fundamentals/examples/"
cp "$P2/2-1-chat-with-data/examples/vector_store_basics.py" "$DEST/05-rag-fundamentals/examples/"

# 06-advanced-rag
mkdir -p "$DEST/06-advanced-rag/examples"
cp "$P2/2-2-advanced-rag/README.md" "$DEST/06-advanced-rag/"
cp "$P2/2-2-advanced-rag/notes.md" "$DEST/06-advanced-rag/"
cp "$P2/2-2-advanced-rag/examples/sentence_window_retrieval.py" "$DEST/06-advanced-rag/examples/"
cp "$P2/2-2-advanced-rag/examples/auto_merge_retrieval.py" "$DEST/06-advanced-rag/examples/"
cp "$P2/2-2-advanced-rag/examples/rag_triad_eval.py" "$DEST/06-advanced-rag/examples/"

# 07-fhir-r4
mkdir -p "$DEST/07-fhir-r4/src" "$DEST/07-fhir-r4/examples"
cp "$P2/2-4-fhir-r4/README.md" "$DEST/07-fhir-r4/"
cp "$P2/2-4-fhir-r4/notes.md" "$DEST/07-fhir-r4/"
cp "$P2/2-4-fhir-r4/src/__init__.py" "$DEST/07-fhir-r4/src/"
cp "$P2/2-4-fhir-r4/src/fhir_mapper.py" "$DEST/07-fhir-r4/src/"
cp "$P2/2-4-fhir-r4/src/fhir_validator.py" "$DEST/07-fhir-r4/src/"
cp "$P2/2-4-fhir-r4/examples/sample_patient.json" "$DEST/07-fhir-r4/examples/"
cp "$P2/2-4-fhir-r4/examples/sample_condition.json" "$DEST/07-fhir-r4/examples/"
cp "$P2/2-4-fhir-r4/examples/sample_observation.json" "$DEST/07-fhir-r4/examples/"
cp "$P2/2-4-fhir-r4/examples/sample_bundle.json" "$DEST/07-fhir-r4/examples/"
cp "$P2/2-4-fhir-r4/examples/llm_to_fhir.py" "$DEST/07-fhir-r4/examples/"

# 08-eval-debugging
mkdir -p "$DEST/08-eval-debugging/examples"
cp "$P3/3-1-eval-debugging/README.md" "$DEST/08-eval-debugging/"
cp "$P3/3-1-eval-debugging/notes.md" "$DEST/08-eval-debugging/"
cp "$P3/3-1-eval-debugging/examples/eval_patterns.py" "$DEST/08-eval-debugging/examples/"
cp "$P3/3-1-eval-debugging/examples/tracing_example.py" "$DEST/08-eval-debugging/examples/"
cp "$P3/3-1-eval-debugging/examples/systematic_debug.py" "$DEST/08-eval-debugging/examples/"

# 09-g-eval
mkdir -p "$DEST/09-g-eval/implementation"
cp "$P3/3-2-g-eval-paper/README.md" "$DEST/09-g-eval/"
cp "$P3/3-2-g-eval-paper/notes.md" "$DEST/09-g-eval/"
cp "$P3/3-2-g-eval-paper/implementation/g_eval.py" "$DEST/09-g-eval/implementation/"
cp "$P3/3-2-g-eval-paper/implementation/clinical_criteria.py" "$DEST/09-g-eval/implementation/"
cp "$P3/3-2-g-eval-paper/implementation/example_scoring.py" "$DEST/09-g-eval/implementation/"

# 10-ragas
mkdir -p "$DEST/10-ragas/src" "$DEST/10-ragas/examples"
cp "$P3/3-3-ragas/README.md" "$DEST/10-ragas/"
cp "$P3/3-3-ragas/notes.md" "$DEST/10-ragas/"
cp "$P3/3-3-ragas/src/ragas_eval.py" "$DEST/10-ragas/src/"
cp "$P3/3-3-ragas/src/custom_metrics.py" "$DEST/10-ragas/src/"
cp "$P3/3-3-ragas/examples/sample_eval_results.json" "$DEST/10-ragas/examples/"
cp "$P3/3-3-ragas/examples/metric_comparison.py" "$DEST/10-ragas/examples/"

# 11-prompt-versioning
mkdir -p "$DEST/11-prompt-versioning/src" "$DEST/11-prompt-versioning/prompts" "$DEST/11-prompt-versioning/outputs"
cp "$P3/3-5-prompt-versioning/README.md" "$DEST/11-prompt-versioning/"
cp "$P3/3-5-prompt-versioning/src/prompt_manager.py" "$DEST/11-prompt-versioning/src/"
cp "$P3/3-5-prompt-versioning/src/diff_tool.py" "$DEST/11-prompt-versioning/src/"
cp "$P3/3-5-prompt-versioning/prompts/clinical_classifier_v1.txt" "$DEST/11-prompt-versioning/prompts/"
cp "$P3/3-5-prompt-versioning/prompts/clinical_classifier_v2.txt" "$DEST/11-prompt-versioning/prompts/"
cp "$P3/3-5-prompt-versioning/prompts/session_summarizer_v1.txt" "$DEST/11-prompt-versioning/prompts/"
cp "$P3/3-5-prompt-versioning/prompts/session_summarizer_v2.txt" "$DEST/11-prompt-versioning/prompts/"
cp "$P3/3-5-prompt-versioning/outputs/prompt_comparison_report.md" "$DEST/11-prompt-versioning/outputs/"

# 12-agentic-fundamentals
mkdir -p "$DEST/12-agentic-fundamentals/examples"
cp "$P4/4-1-functions-tools-agents/README.md" "$DEST/12-agentic-fundamentals/"
cp "$P4/4-1-functions-tools-agents/notes.md" "$DEST/12-agentic-fundamentals/"
cp "$P4/4-1-functions-tools-agents/examples/function_calling.py" "$DEST/12-agentic-fundamentals/examples/"
cp "$P4/4-1-functions-tools-agents/examples/custom_tools.py" "$DEST/12-agentic-fundamentals/examples/"
cp "$P4/4-1-functions-tools-agents/examples/react_agent.py" "$DEST/12-agentic-fundamentals/examples/"

# 13-langgraph
mkdir -p "$DEST/13-langgraph/examples"
cp "$P4/4-2-langgraph/README.md" "$DEST/13-langgraph/"
cp "$P4/4-2-langgraph/notes.md" "$DEST/13-langgraph/"
cp "$P4/4-2-langgraph/examples/basic_graph.py" "$DEST/13-langgraph/examples/"
cp "$P4/4-2-langgraph/examples/conditional_routing.py" "$DEST/13-langgraph/examples/"
cp "$P4/4-2-langgraph/examples/human_in_loop.py" "$DEST/13-langgraph/examples/"
cp "$P4/4-2-langgraph/examples/stateful_workflow.py" "$DEST/13-langgraph/examples/"

# 14-ollama-benchmark
mkdir -p "$DEST/14-ollama-benchmark/src" "$DEST/14-ollama-benchmark/results"
cp "$P4/4-4-ollama-benchmark/README.md" "$DEST/14-ollama-benchmark/"
cp "$P4/4-4-ollama-benchmark/src/benchmark.py" "$DEST/14-ollama-benchmark/src/"
cp "$P4/4-4-ollama-benchmark/src/run_local.py" "$DEST/14-ollama-benchmark/src/"
cp "$P4/4-4-ollama-benchmark/results/comparison_report.md" "$DEST/14-ollama-benchmark/results/"
cp "$P4/4-4-ollama-benchmark/results/benchmark_results.json" "$DEST/14-ollama-benchmark/results/"
cp "$P4/4-4-ollama-benchmark/results/latency_chart_data.csv" "$DEST/14-ollama-benchmark/results/"

# 15-llmops-course
mkdir -p "$DEST/15-llmops-course/examples"
cp "$P5/5-1-llmops-course/README.md" "$DEST/15-llmops-course/"
cp "$P5/5-1-llmops-course/notes.md" "$DEST/15-llmops-course/"
cp "$P5/5-1-llmops-course/examples/pipeline_versioning.py" "$DEST/15-llmops-course/examples/"
cp "$P5/5-1-llmops-course/examples/automated_testing.py" "$DEST/15-llmops-course/examples/"
cp "$P5/5-1-llmops-course/examples/deployment_patterns.py" "$DEST/15-llmops-course/examples/"

# 16-langsmith-tracing
mkdir -p "$DEST/16-langsmith-tracing/src" "$DEST/16-langsmith-tracing/examples"
cp "$P5/5-2-langsmith-tracing/README.md" "$DEST/16-langsmith-tracing/"
cp "$P5/5-2-langsmith-tracing/notes.md" "$DEST/16-langsmith-tracing/"
cp "$P5/5-2-langsmith-tracing/src/__init__.py" "$DEST/16-langsmith-tracing/src/"
cp "$P5/5-2-langsmith-tracing/src/trace_decorator.py" "$DEST/16-langsmith-tracing/src/"
cp "$P5/5-2-langsmith-tracing/src/trace_analyzer.py" "$DEST/16-langsmith-tracing/src/"
cp "$P5/5-2-langsmith-tracing/examples/__init__.py" "$DEST/16-langsmith-tracing/examples/"
cp "$P5/5-2-langsmith-tracing/examples/instrumented_chain.py" "$DEST/16-langsmith-tracing/examples/"
cp "$P5/5-2-langsmith-tracing/examples/debug_workflow.py" "$DEST/16-langsmith-tracing/examples/"
cp "$P5/5-2-langsmith-tracing/examples/sample_trace.json" "$DEST/16-langsmith-tracing/examples/"

# 17-cost-tracking
mkdir -p "$DEST/17-cost-tracking/src" "$DEST/17-cost-tracking/dashboards"
cp "$P5/5-4-cost-latency-tracking/README.md" "$DEST/17-cost-tracking/"
cp "$P5/5-4-cost-latency-tracking/src/__init__.py" "$DEST/17-cost-tracking/src/"
cp "$P5/5-4-cost-latency-tracking/src/tracker.py" "$DEST/17-cost-tracking/src/"
cp "$P5/5-4-cost-latency-tracking/src/cost_calculator.py" "$DEST/17-cost-tracking/src/"
cp "$P5/5-4-cost-latency-tracking/src/dashboard.py" "$DEST/17-cost-tracking/src/"
cp "$P5/5-4-cost-latency-tracking/dashboards/cost_report.md" "$DEST/17-cost-tracking/dashboards/"
cp "$P5/5-4-cost-latency-tracking/dashboards/latency_summary.csv" "$DEST/17-cost-tracking/dashboards/"
cp "$P5/5-4-cost-latency-tracking/dashboards/model_comparison.md" "$DEST/17-cost-tracking/dashboards/"

# 18-provider-framework
mkdir -p "$DEST/18-provider-framework/data"
cp "$P5/5-5-provider-framework/README.md" "$DEST/18-provider-framework/"
cp "$P5/5-5-provider-framework/data/benchmark_data.json" "$DEST/18-provider-framework/data/"
cp "$P5/5-5-provider-framework/data/cost_analysis.csv" "$DEST/18-provider-framework/data/"

# 19-portfolio
mkdir -p "$DEST/19-portfolio/blog-post"
mkdir -p "$DEST/19-portfolio/project-readmes/templates"
mkdir -p "$DEST/19-portfolio/project-readmes/examples"
mkdir -p "$DEST/19-portfolio/cert-study-notes/llmops-cert"
mkdir -p "$DEST/19-portfolio/cert-study-notes/rag-cert"
mkdir -p "$DEST/19-portfolio/github-profile"

cp "$P6/6-4-blog-post/post.md" "$DEST/19-portfolio/blog-post/"
cp "$P6/6-4-blog-post/outline.md" "$DEST/19-portfolio/blog-post/"
cp "$P6/6-4-blog-post/social_posts.md" "$DEST/19-portfolio/blog-post/"
cp "$P6/6-4-blog-post/README.md" "$DEST/19-portfolio/blog-post/"

cp "$P6/6-1-github-readmes/README.md" "$DEST/19-portfolio/project-readmes/"
cp "$P6/6-1-github-readmes/portfolio_profile_readme.md" "$DEST/19-portfolio/project-readmes/"
cp "$P6/6-1-github-readmes/templates/project_readme_template.md" "$DEST/19-portfolio/project-readmes/templates/"
cp "$P6/6-1-github-readmes/examples/project1_readme.md" "$DEST/19-portfolio/project-readmes/examples/"
cp "$P6/6-1-github-readmes/examples/project2_readme.md" "$DEST/19-portfolio/project-readmes/examples/"
cp "$P6/6-1-github-readmes/examples/project3_readme.md" "$DEST/19-portfolio/project-readmes/examples/"
cp "$P6/6-1-github-readmes/examples/project4_readme.md" "$DEST/19-portfolio/project-readmes/examples/"
cp "$P6/6-1-github-readmes/examples/project5_readme.md" "$DEST/19-portfolio/project-readmes/examples/"

cp "$P6/6-2-llmops-cert/README.md" "$DEST/19-portfolio/cert-study-notes/llmops-cert/"
cp "$P6/6-2-llmops-cert/study_notes.md" "$DEST/19-portfolio/cert-study-notes/llmops-cert/"
cp "$P6/6-2-llmops-cert/practice_questions.md" "$DEST/19-portfolio/cert-study-notes/llmops-cert/"
cp "$P6/6-3-rag-cert/README.md" "$DEST/19-portfolio/cert-study-notes/rag-cert/"
cp "$P6/6-3-rag-cert/study_notes.md" "$DEST/19-portfolio/cert-study-notes/rag-cert/"
cp "$P6/6-3-rag-cert/practice_questions.md" "$DEST/19-portfolio/cert-study-notes/rag-cert/"

cp "$P6/6-1-github-readmes/portfolio_profile_readme.md" "$DEST/19-portfolio/github-profile/"

# 20-interview-prep
cp "$P6/6-5-interview-prep/README.md" "$DEST/20-interview-prep/"
cp "$P6/6-5-interview-prep/resume_claims.md" "$DEST/20-interview-prep/"
cp "$P6/6-5-interview-prep/technical_questions.md" "$DEST/20-interview-prep/"
cp "$P6/6-5-interview-prep/behavioral_questions.md" "$DEST/20-interview-prep/"
cp "$P6/6-5-interview-prep/system_design.md" "$DEST/20-interview-prep/"

echo "ALL COPIES COMPLETE"
