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

<!--{strip}-->
    <div class="block_outer">
        <div id="news_area">
            <div class="page-header">
                <h2>
                    新着情報
                    <div class="pull-right">
                        <a href="<!--{$smarty.const.ROOT_URLPATH}-->rss/<!--{$smarty.const.DIR_INDEX_PATH}-->" class="btn btn-xs btn-warning"><span class="fa fa-rss"></span> RSS</a>
                    </div>
                </h2>
            </div>
            <div class="block_body">
                <div class="panel-group" id="news-area-accordion">
                    <div class="panel panel-default">
                <!--{section name=data loop=$arrNews}-->
                <!--{assign var="date_array" value="-"|explode:$arrNews[data].cast_news_date}-->
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <small class="show margin-bottom-sm"><!--{$date_array[0]}-->年<!--{$date_array[1]}-->月<!--{$date_array[2]}-->日</small>
                                <a href="#news-collapse<!--{$smarty.section.data.index}-->" data-toggle="collapse" data-parent="#news-area-accordion">
                                    <!--{$arrNews[data].news_title|h|nl2br}-->
                                </a>
                            </h4>
                        </div>
                        <div id="news-collapse<!--{$smarty.section.data.index}-->" class="panel-collapse collapse <!--{if $smarty.section.data.index == 0}-->in<!--{/if}-->">
                            <div class="panel-body">
                                <p>
                                    <!--{$arrNews[data].news_comment|h|nl2br}-->
                                </p>
                                <!--{if $arrNews[data].news_url}-->
                                <p>
                                    <a href="<!--{$arrNews[data].news_url}-->"<!--{if $arrNews[data].link_method eq "2"}--> target="_blank"<!--{/if}-->
                                    >詳しくはこちら<!--{if $arrNews[data].link_method eq "2"}--><span class="glyphicon glyphicon-new-window"></span><!--{/if}--></a>

                                </p>
                                <!--{/if}-->
                            </div>
                        </div>
                <!--{/section}-->
                    </div>
                </div>
            </div>
        </div>
    </div>
<!--{/strip}-->
