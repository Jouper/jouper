{**
 * archive.tpl
 *
 * Copyright (c) 2003-2004 The Public Knowledge Project
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Issue Archive.
 *
 * $Id$
 *}

{assign var="pageTitle" value="archive.archives"} 
{include file="common/header.tpl"}

{iterate from=issueGroups item=issues key=key}
	<div>
	<h3>{$key}</h3>

	{foreach from=$issues item=issue}
		<h4><a href="{$requestPageUrl}/view/{$issue->getIssueId()}">{$issue->getIssueIdentification()}</a></h4>
	{/foreach}

	</div>

	{if !$issueGroups->eof()}
	<div class="separator"></div>
	{/if}
{/iterate}
{if !$issueGroups->wasEmpty()}
	{page_links name="issues" page=$issueGroups->getPage() pageCount=$issueGroups->getPageCount()}
{/if}

{include file="common/footer.tpl"}
