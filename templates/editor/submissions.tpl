{**
 * submissions.tpl
 *
 * Copyright (c) 2003-2004 The Public Knowledge Project
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Editor submissions page(s).
 *
 * $Id$
 *}

{assign var="pageTitle" value="editor.submissions.$pageToDisplay"}
{assign var="thisUrl" value=$currentUrl}
{assign var="currentUrl" value="$pageUrl/editor"}
{include file="common/header.tpl"}

<ul class="menu">
	<li{if $pageToDisplay == "submissionsUnassigned"} class="current"{/if}><a href="{$pageUrl}/editor/submissions/submissionsUnassigned">{translate key="editor.navigation.unassigned"}</a></li>
	<li{if $pageToDisplay == "submissionsInReview"} class="current"{/if}><a href="{$pageUrl}/editor/submissions/submissionsInReview">{translate key="editor.navigation.submissionsInReview"}</a></li>
	<li{if $pageToDisplay == "submissionsInEditing"} class="current"{/if}><a href="{$pageUrl}/editor/submissions/submissionsInEditing">{translate key="editor.navigation.submissionsInEditing"}</a></li>
	<li{if $pageToDisplay == "submissionsArchives"} class="current"{/if}><a href="{$pageUrl}/editor/submissions/submissionsArchives">{translate key="editor.navigation.submissionsArchives"}</a></li>
</ul>

<br />

{include file="editor/$pageToDisplay.tpl"}
<form>
{translate key="section.section"}: <select name="section" onchange="location.href='{$thisUrl}?section='+this.options[this.selectedIndex].value" size="1" class="selectMenu">{html_options options=$sectionOptions selected=$section}</select>
</form>

{include file="common/footer.tpl"}
