{**
 * localeFile.tpl
 *
 * Copyright (c) 2003-2006 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Edit a specific locale file.
 *
 * $Id$
 *}

{translate|assign:"pageTitleTranslated" key="plugins.generic.translator.locale" locale=$locale}
{include file="common/header.tpl"}

{assign var=filenameEscaped value=$filename|escape:"url"}

<form name="reference">
{foreach from=referenceLocaleContents key=key item=value}<input type="hidden" name="{$key|escape:"quotes"}" value="{$key|escape:"quotes"}"/>{/foreach}
</form>

<form name="locale" action="{url op="saveLocaleFile" path=$locale|to_array:$filenameEscaped}" method="post">
<input type="hidden" name="redirectUrl" value="" />

<a name="localeContents"></a>

<h3>{translate key="plugins.generic.translator.file.edit" filename=$filename}</h3>
<table class="listing" width="100%">
	<tr><td colspan="2" class="headseparator">&nbsp;</td></tr>
	<tr class="heading" valign="bottom">
		<td width="40%">{translate key="plugins.generic.translator.localeKey"}</td>
		<td width="60%">{translate key="plugins.generic.translator.localeKeyValue"}</td>
	</tr>
	<tr><td colspan="2" class="headseparator">&nbsp;</td></tr>

{iterate from=localeContents key=key item=value}
{assign var=filenameEscaped value=$filename|escape:"url"}
	<tr valign="top">
		<td>{$key|escape}</td>
		<td>
			<input type="hidden" name="changes[]" value="{$key|escape:"quotes"}" />
			{assign var=referenceValue value=$referenceLocaleContents.$key}
			{if ($value|explode:"\n"|@count > 1) || (strlen($value) > 80) || ($referenceValue|explode:"\n"|@count > 1) || (strlen($referenceValue) > 80)}
				<textarea name="changes[]" class="textArea" rows="5" cols="50">
{$value|escape}
</textarea>
			{else}
				<input name="changes[]" class="textField" class="textField" type="text" size="50" value="{$value|escape:"quotes"}" />
			{/if}
		</td>
	</tr>
	<tr>
		<td colspan="2" class="{if $localeContents->eof()}end{/if}separator">&nbsp;</td>
	</tr>
{/iterate}

{if $localeContents->wasEmpty()}
	<tr>
		<td colspan="2" class="nodata">{translate key="common.none"}</td>
	</tr>
	<tr>
		<td colspan="2" class="endseparator">&nbsp;</td>
	</tr>
{else}
	<tr>
		<td align="left">{page_info iterator=$localeContents}</td>
		<td align="right">{page_links all_extra="onclick=\"document.locale.redirectUrl.value=this.href;this.href='javascript:document.locale.submit()';return true;\"" anchor="localeContents" name="localeContents" iterator=$localeContents}</td>
	</tr>
{/if}

</table>

{if $localeContents->getPage() < $localeContents->getPageCount()}
	<input type="submit" onclick="document.locale.redirectUrl.value='{url op="editLocaleFile" path=$locale|to_array:$filenameEscaped localeContentsPage=$localeContents->getPage()+1 escape="false"}';return true;" class="button defaultButton" value="{translate key="common.saveAndContinue"}" />
{else}
	<input type="submit" onclick="document.locale.redirectUrl.value='{url op="editLocaleFile" path=$locale|to_array:$filenameEscaped localeContentsPage=$localeContents->getPage() escape="false"}';return true;" class="button defaultButton" value="{translate key="common.save"}" />
{/if}

<input type="submit" onclick="document.locale.redirectUrl.value='{url op="edit" path=$locale escape="false"}';return true;" class="button" value="{translate key="common.done"}" />

<input type="button" onclick="document.location.href='{url op="edit" path=$locale escape="false"}';" class="button" value="{translate key="common.cancel"}" />

</form>

{include file="common/footer.tpl"}