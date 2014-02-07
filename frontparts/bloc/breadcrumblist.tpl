<!--{*
 * 2.13系対応パンくずプラグイン
 * パンくずリストを生成する
 * Copyright (C) 2013 Nobuhiko Kimoto
 * info@nob-log.info
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 *}-->

<!--{if $current_name != ''}-->
<!--{foreach from=$arrBreadcrumb item=i}-->
<div class="breadcrumb">
  <div itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
    <a href="<!--{$smarty.const.HTTP_URL}-->" itemprop="url">
      <span itemprop="title">Home</span>
    </a> &gt;
  </div>
  <!--{foreach from=$i item=content}-->
  <!--{if $content.category_name}-->
  <div itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
    <a href="<!--{$smarty.const.ROOT_URLPATH}-->products/list.php?category_id=<!--{$content.category_id|h}-->" itemprop="url">
      <span itemprop="title"><!--{$content.category_name|h}--></span>
    </a> &gt;
  </div>
  <!--{/if}-->
  <!--{/foreach}-->
  <div itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
    <span itemprop="title"><!--{$current_name|h}--></span>
  </div>
</div>
<!--{/foreach}-->
<!--{/if}-->
