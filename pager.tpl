<!--{*
 * EC-CUBE on Bootstrap3. This file is part of EC-CUBE
 *
 * Copyright(c) 2014 clicktx. All Rights Reserved.
 *
 * http://perl.no-tubo.net/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *}-->
        <!--{* $max_pageが取得できないので作成 *}-->
        <!--{if $disp_number}-->
            <!--{assign var=page_max value=$disp_number}-->
            <!--{else}-->
            <!--{assign var=page_max value=$smarty.const.SEARCH_PMAX}-->
        <!--{/if}-->
        <!--{math equation=ceil(a/b) a=$tpl_linemax b=$page_max assign=max_page}-->

        <!--{if !$tpl_pageno}--><!--{assign var=tpl_pageno value=1}--><!--{/if}-->
        <!--{* class=disabledの条件 *}-->
        <!--{if $tpl_pageno ==1 or $max_page == 1}-->
            <!--{* prev disabled 最初のページ 最大数1ページ *}-->
            <!--{assign var=prev_disabled value=" disabled"}-->
        <!--{/if}-->
        <!--{if $tpl_pageno == $max_page or $max_page == 1}-->
            <!--{* next disabled 最後のページ 最大数1ページ *}-->
            <!--{assign var=next_disabled value=" disabled"}-->
        <!--{/if}-->

        <!--{* リンクするページ番号 *}-->
        <!--{assign var=prev_pageno value=$tpl_pageno}-->
        <!--{assign var=next_pageno value=$tpl_pageno}-->
        <!--{if $max_page > 1 and $tpl_pageno != $max_page}-->
            <!--{assign var=next_pageno value=$next_pageno+1}-->
        <!--{/if}-->
        <!--{if $max_page > 1 and $tpl_pageno != 1 }-->
            <!--{assign var=prev_pageno value=$prev_pageno-1}-->
        <!--{/if}-->

        <ul class="pager padding-top-lg visible-xs">
            <li class="previous<!--{$prev_disabled}-->"><a href="?category_id=<!--{$arrSearchData.category_id}-->&pageno=<!--{$prev_pageno}-->" onclick="eccube.movePage('<!--{$prev_pageno}-->'); return false;"><span class="fa fa-angle-double-left"> 前のページ</span></a></li>
            <li class="next<!--{$next_disabled}-->"><a href="?category_id=<!--{$arrSearchData.category_id}-->&pageno=<!--{$next_pageno}-->" onclick="eccube.movePage('<!--{$next_pageno}-->'); return false;">次のページ <span class="fa fa-angle-double-right"></span></a></li>
        </ul>
