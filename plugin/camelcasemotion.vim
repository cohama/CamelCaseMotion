
" Avoid installing twice or when in compatible mode
if exists('g:loaded_camelcasemotion') || (v:version < 700)
  finish
endif
let g:loaded_camelcasemotion = 1


function! s:CreateMotionMappings()

  for l:mode in ['n', 'o', 'v']
    for l:motion in ['w', 'b', 'e']
      let l:targetMapping = '<Plug>CamelCaseMotion_' . l:motion
      execute l:mode . 'noremap ' . l:targetMapping . ' :<C-U>call camelcasemotion#Motion(''' . l:motion . ''',v:count1,''' . l:mode . ''')<CR>'
    endfor
  endfor
endfunction

function! s:CreateInnerMotionMappings()

  for l:mode in ['o', 'v']
    for l:motion in ['w', 'b', 'e']
      let l:targetMapping = '<Plug>CamelCaseMotion_i' . l:motion
      execute l:mode . 'noremap ' . l:targetMapping . ' :<C-U>call camelcasemotion#InnerMotion(''' . l:motion . ''',v:count1)<CR>'
    endfor
  endfor
endfunction

call s:CreateMotionMappings()
call s:CreateInnerMotionMappings()

delfunction s:CreateMotionMappings
delfunction s:CreateInnerMotionMappings

