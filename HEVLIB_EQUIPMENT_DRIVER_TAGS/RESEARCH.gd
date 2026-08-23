# [license]
# 3-Clause BSD NON-AI License
# 
# Copyright 2026 __hev (Benjamin Buckhurst)
# 
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
# 
# 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer
# in the documentation and/or other materials provided with the distribution.
# 
# 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products
# derived from this software without specific prior written permission.
# 
# 4. The source code and the binary form, and any modifications made to them may not be used for the purpose of input data, the training of, or improvement of machine learning algorithms,
# including but not limited to artificial intelligence, natural language processing, or data mining. This condition applies to any derivatives,
# modifications, or updates based on the Software code. Any usage of the source code or the binary form in an AI-training dataset is considered a breach of this License.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS “AS IS” AND ANY EXPRESS OR IMPLIED WARRANTIES,
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
# OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
# EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# [/license]

const STORY_ONLY = {
	"name":"SYSTEM_PDT",
	"description":"SYSTEM_PDT_TOOLTIP",
	"story_flag":"hardware.nakamura",
	"story_min":0,
	"story_max":5,
	"mode":"story_only",
	"progress_zero":0,
	"progress_complete":5
}

const STORY_PROGRESS = {
	"name":"RESEARCH_NAME_TEMPLATE",
	"description":"RESEARCH_TOOLTIP_TEMPLATE",
	"story_flag":"example.story",
	"story_min":0,
	"story_max":-1,
	"tooltip_text":"STORY_EXAMPLE_TEXT",
	"mode":"story_progress",
	"progress_zero":0,
	"progress_complete":5,
	"unlock_story":"example.story.complete",
	"unlock_set":5,
}

const ISOLATED = {
	"name":"RESEARCH_NAME_TEMPLATE2",
	"description":"RESEARCH_TOOLTIP_TEMPLATE",
	"mode":"isolated",
	"initiation_price":100000,
	"tasks":[
		{
			"mode":"story",
			"story_flag":"example.story",
			"story_min":0,
			"story_max":10,
			"tooltip_text":"STORY_EXAMPLE_TEXT",
			"reset_on_halt":false,
		},
		{
			"mode":"payment",
			"story_flag":"example.payment",
			"amount":1000000,
			"tooltip_text":"STORY_EXAMPLE_TEXT",
			"reset_on_halt":false,
		},
		{
			"mode":"time",
			"story_flag":"example.time",
			"minutes":5,
			"hours":5,
			"days":3,
			"months":1,
			"years":0,
			"tooltip_text":"STORY_EXAMPLE_TEXT",
			"reset_on_halt":false,
		},
	],
	"unlock_story":"example.story.complete",
	"unlock_set":5,
	"show_when":{
		
	}
}



