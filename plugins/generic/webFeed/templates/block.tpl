{**
 * links.tpl
 *
 * Copyright (c) 2003-2007 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Feed plugin navigation sidebar.
 *
 * $Id$
 *}
<div class="block" id="sidebarWebFeed">
{if ( $displayPage eq "all" ) || ($displayPage eq "issue" && $issue) }
	<a href="{url page="gateway" op="plugin" path="WebFeedGatewayPlugin"|to_array:"atom"}">
	<img src="{$baseUrl}/plugins/generic/webFeed/templates/images/atom10_logo.gif" order="0" alt="" border="0" /></a>
	<br/>
	<a href="{url page="feed" op="rss2"}">
	<img src="{$baseUrl}/plugins/generic/webFeed/templates/images/rss20_logo.gif" order="0" alt="" border="0" /></a>
	<br/>
	<a href="{url page="feed" op="rss"}">
	<img src="{$baseUrl}/plugins/generic/webFeed/templates/images/rss10_logo.gif" order="0" alt="" border="0" /></a>
{/if}
</div>