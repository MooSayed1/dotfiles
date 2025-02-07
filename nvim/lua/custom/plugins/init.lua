-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- CompetiTest Plugin
  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    keys = {
      { ' rc', '<cmd>CompetiTest receive contest <CR>', { desc = 'receive contest' } },
      { ' rp', '<cmd>CompetiTest receive problem <CR>', { desc = 'receive problem' } },
      { ' ra', '<cmd>CompetiTest add_testcase <CR>', { desc = 'add testcase' } },
      { ' re', '<cmd>CompetiTest edit_testcase <CR>', { desc = 'edit testcase' } },
      { ' rr', '<cmd>CompetiTest run <CR>', { desc = 'run code' } },
      { ' rd', '<cmd>CompetiTest delete_testcase <CR>', { desc = 'delete testcase' } },
    },
    config = function()
      require('competitest').setup {
        compile_command = {
          c = { exec = 'gcc', args = { '-DMOHAMED', '-Wall', '$(FNAME)', '-o', '$(FNOEXT)' } },
          cpp = {
            exec = 'g++',
            args = { '-std=c++20', '-DMOHAMED', '-Wall', '$(FNAME)', '-o', '$(FNOEXT)', '-g' },
          },
          py = { exec = 'python', args = { '$(FNAME)' } },
          rust = { exec = 'rustc', args = { '$(FNAME)' } },
          java = { exec = 'javac', args = { '$(FNAME)' } },
        },
        received_problems_path = '$(HOME)/Competitive Programming/$(JUDGE)/$(CONTEST)/$(PROBLEM).$(FEXT)',
        received_contests_directory = '$(HOME)/Competitive Programming/$(JUDGE)/$(CONTEST)',
        received_contests_problems_path = '$(PROBLEM).$(FEXT)',
        received_problems_prompt_path = false,
        testcases_use_single_file = true,
        evaluate_template_modifiers = true,
        received_contests_prompt_directory = false,
        received_contests_prompt_extension = false,
        open_received_contests = false,
        received_files_extension = 'cpp',
        template_file = {
          cpp = '~/.config/nvim/template/CPP.cpp',
        },
      }
    end,
  },

  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
      'TmuxNavigatorProcessList',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
  {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup {
        style = 'darker', -- Options: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer'
      }
      require('onedark').load()
    end,
  },

  -- END OF MY PLUGINS
}
