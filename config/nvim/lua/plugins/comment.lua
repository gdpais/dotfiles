return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup {
            mappings = {
                ---Operator-pending mapping:
                --  `gcc`               -> line-comment  the current line
                --  `gcb`               -> block-comment the current line
                --  `gc[count]{motion}` -> line-comment  the region contained in {motion}
                --  `gb[count]{motion}` -> block-comment the region contained in {motion}
                basic = true,
                ---Extra mapping:
                --  `gcO`               -> Add comment on the line above
                --  `gco`               -> Add comment on the line below
                --  `gcA`               -> Add comment at the end of line
                extra = true,
            },
        }
        -- For not supported languages
        --local ft = require "Comment.ft"
        --ft.set("javascript", { "//%s", "/*%s*/" })
        --ft.javascript = { "//%s", "/*%s*/" }
    end
}
