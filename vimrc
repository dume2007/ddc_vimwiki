if has("win32")
  let $VIMFILES = $VIM.'/vimfiles'
else
  let $VIMFILES = $HOME.'/.vim'
endif

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" 多个维基项目的配置
let g:vimwiki_list = [{'path': '/home/wwwroot/default/ddc_vimwiki/wiki/index/',
      \ 'path_html': '/home/wwwroot/default/ddc_vimwiki/',
      \ 'template_path': '/home/wwwroot/default/ddc_vimwiki/wiki/vimwiki_template/',
      \ 'template_default': 'def_template',
      \ 'template_ext': '.html',
      \ 'diary_link_count': 5},
      \ {'path': '/home/wwwroot/default/ddc_vimwiki/wiki/php/',
      \ 'path_html': '/home/wwwroot/default/ddc_vimwiki/php/',
      \ 'template_path': '/home/wwwroot/default/ddc_vimwiki/wiki/vimwiki_template/',
      \ 'template_default': 'def_sub_template',
      \ 'template_ext': '.html',
      \ 'diary_link_count': 5},
      \ {'path': '/home/wwwroot/default/ddc_vimwiki/wiki/linux/',
      \ 'path_html': '/home/wwwroot/default/ddc_vimwiki/linux/',
      \ 'template_path': '/home/wwwroot/default/ddc_vimwiki/wiki/vimwiki_template/',
      \ 'template_default': 'def_sub_template',
      \ 'template_ext': '.html',
      \ 'diary_link_count': 5},
      \ {'path': '/home/wwwroot/default/ddc_vimwiki/wiki/note/',
      \ 'path_html': '/home/wwwroot/default/ddc_vimwiki/note/',
      \ 'template_path': '/home/wwwroot/default/ddc_vimwiki/wiki/vimwiki_template/',
      \ 'template_default': 'def_sub_template',
      \ 'template_ext': '.html',
      \ 'diary_link_count': 5},
      \ {'path': '/home/wwwroot/default/ddc_vimwiki/wiki/daily/',
      \ 'path_html': '/home/wwwroot/default/ddc_vimwiki/daily/',
      \ 'template_path': '/home/wwwroot/default/ddc_vimwiki/wiki/vimwiki_template/',
      \ 'template_default': 'def_sub_template',
      \ 'template_ext': '.html',
      \ 'diary_link_count': 5}]
 
" 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
let g:vimwiki_camel_case = 0
 
" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 1
 
" 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
let g:vimwiki_menu = ''
 
" 是否开启按语法折叠  会让文件比较慢
"let g:vimwiki_folding = 1
 
" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1
 
" 详见下文...
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'

