{**
 * step2.tpl
 *
 * Copyright (c) 2003-2004 The Public Knowledge Project
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Step 2 of journal setup.
 *
 * $Id$
 *}

{assign var="pageTitle" value="manager.setup.journalSetup"}
{assign var="currentUrl" value="$pageUrl/manager/setup"}
{include file="common/header.tpl"}

<div><a href="{$pageUrl}/manager/setup/1">&lt;&lt; {translate key="navigation.previousStep"}</a> | <a href="{$pageUrl}/manager/setup/3">{translate key="navigation.nextStep"} &gt;&gt;</a></div>

<br />

<div class="subTitle">{translate key="navigation.stepNumber" step=2}: {translate key="manager.setup.journalPolicies"}</div>

<br />

<form method="post" action="{$pageUrl}/manager/saveSetup/2">
{include file="common/formErrors.tpl"}

<span class="formRequired">{translate key="form.required"}</span>
<br /><br />

<div class="formSectionTitle">2.1 {translate key="manager.setup.focusAndScopeOfJournal"}</div>
<div class="formSection">
<table class="form">
<tr>
	<td class="formLabel">{formLabel name="focusScopeDesc"}{translate key="manager.setup.focusAndScope"}:{/formLabel}</td>
	<td class="formField"><textarea name="focusScopeDesc" rows="12" cols="60" class="textArea">{$focusScopeDesc|escape}</textarea></td>
</tr>
<tr>
	<td></td>
	<td class="formInstructions">{translate key="manager.setup.htmlSetupInstructions"}</td>
</tr>
</table>
</div>

<br />

<div class="formSectionTitle">2.2 {translate key="manager.setup.peerReviewPolicy"}</div>
<div class="formSection">
<div class="formSectionDesc">{translate key="manager.setup.peerReviewDescription"}</div>

<script type="text/javascript">
{literal}
function toggleAllowSetInviteReminder(form) {
	form.numDaysBeforeInviteReminder.disabled = !form.numDaysBeforeInviteReminder.disabled;
}
function toggleAllowSetSubmitReminder(form) {
	form.numDaysBeforeSubmitReminder.disabled = !form.numDaysBeforeSubmitReminder.disabled;
}
{/literal}
</script>

<table class="form">
<tr>
	<td class="formLabelRight" colspan="2">
		{formLabel name="numWeeksPerReview"}{translate key="manager.setup.numWeeksPerReview"}:{/formLabel} 
		<input type="text" name="numWeeksPerReview" value="{$numWeeksPerReview|escape}" size="2" maxlength="8" class="textField" /> 
		{translate key="common.weeks"}
		<p class="note">{translate key="common.note"}: {translate key="manager.setup.noteOnModification"}</p>
	</td>
</tr>
<tr>
	<td class="formLabelRight" colspan="2">
		{formLabel name="automatedReminders"}{translate key="manager.setup.automatedReminders"}:{/formLabel}
	</td>
</tr>
<tr>
        <td class="formFieldLeft"><input type="checkbox" name="remindForInvite" value="1" onclick="toggleAllowSetInviteReminder(this.form)"{if $remindForInvite} checked="checked"{/if} /></td>
        <td class="formLabelRightPlain">
		{translate key="manager.setup.remindForInvite1"}
		<select name="numDaysBeforeInviteReminder" size="1"{if not $remindForInvite} disabled=DISABLED{/if}>
			{section name="inviteDayOptions" start=3 loop=11}
			<option value="{$smarty.section.inviteDayOptions.index}"{if $numDaysBeforeInviteReminder eq $smarty.section.inviteDayOptions.index or ($smarty.section.inviteDayOptions.index eq 5 and not $remindForInvite)} selected="SELECTED"{/if}>{$smarty.section.inviteDayOptions.index}</option>
			{/section}
		</select>
	<!--	<input type="text" name="numDaysBeforeInviteReminder" value="{if not $remindForInvite}5{else}{$numDaysBeforeInviteReminder|escape}{/if}" size="2" maxlength="8" class="textField"{if not $remindForInvite} disabled=DISABLED{/if} />
	-->
		{translate key="manager.setup.remindForInvite2"}.
	</td>
</tr>
<tr>
	<td class="formFieldLeft"><input type="checkbox" name="remindForSubmit" value="1" onclick="toggleAllowSetSubmitReminder(this.form)"{if $remindForSubmit} checked="checked"{/if} /></td>
	<td class="formLabelRightPlain">
		{translate key="manager.setup.remindForSubmit1"}
		<select name="numDaysBeforeSubmitReminder" size="1"{if not $remindForSubmit} disabled=DISABLED{/if}>
			{section name="submitDayOptions" start=0 loop=11}
				<option value="{$smarty.section.submitDayOptions.index}"{if $numDaysBeforeSubmitReminder eq $smarty.section.submitDayOptions.index} selected="SELECTED"{/if}>{$smarty.section.submitDayOptions.index}</option>
			{/section}
		</select>		
	<!--	<input type="text" name="numDaysBeforeSubmitReminder" value="{$numDaysBeforeSubmitReminder|escape}" size="2" maxlength="8" class="textField"{if not $remindForSubmit} disabled=DISABLED{/if} />
	-->
		{translate key="manager.setup.remindForSubmit2"}.
	</td>
</tr>
<tr>
	<td class="formLabelRight" colspan="2">
		<p class="note">{translate key="common.note"}: {translate key="manager.setup.noteOnEmailWording"}.</p>
	</td>
</tr>
<tr>
	<td class="formLabelRight" colspan="2">
		{formLabel name="ratingReviewers"}{translate key="manager.setup.ratingReviewers"}:{/formLabel}		
	</td>
</tr>
<tr>
	<td class="formFieldLeft"><input type="checkbox" name="rateReviewerOnTimeliness" value="1"{if $rateReviewerOnTimeliness} checked="checked"{/if} /></td>
	<td class="formLabelRightPlain">{translate key="manager.setup.onTimeliness"}.</td>
</tr>
<tr>
        <td class="formFieldLeft"><input type="checkbox" name="rateReviewerOnQuality" value="1"{if $rateReviewerOnQuality} checked="checked"{/if} /></td>
        <td class="formLabelRightPlain">{translate key="manager.setup.onQuality"}.</td>
</tr>
<tr>
	<td class="formLabelRight" colspan="2"><input type="checkbox" name="restrictReviewerFileAccess" value="1"{if $restrictReviewerFileAccess} checked="checked"{/if} />
	
		{formLabel name="restrictReviewerFileAccess"}{translate key="manager.setup.restrictReviewerFileAccess"}.{/formLabel}
	</td>
</tr>
<tr>
	<td class="formLabel">{formLabel name="reviewPolicy"}{translate key="manager.setup.peerReviewPolicy2"}:{/formLabel}</td>
	<td class="formField"><textarea name="reviewPolicy" rows="12" cols="60" class="textArea">{$reviewPolicy|escape}</textarea></td>
</tr>
</table>
</div>

<br />

<div class="formSectionTitle">2.3 {translate key="manager.setup.guidelinesForReviewers"}</div>
<div class="formSection">
<div class="formSectionDesc">{translate key="manager.setup.guidelinesForReviewersDescription"}:</div>

<table class="form">
<tr>
	<td class="formFieldLeft"><input type="radio" name="mailSubmissionsToReviewers" value="0"{if not $mailSubmissionsToReviewers} checked="checked"{/if} /></td>
	<td class="formLabelRightPlain">{translate key="manager.setup.submissionsToReviewersDescription"}</td>
</tr>

<tr>
	<td class="formFieldLeft"><input type="radio" name="mailSubmissionsToReviewers" value="1"{if $mailSubmissionsToReviewers} checked="checked"{/if} /></td>
	<td class="formLabelRightPlain">{translate key="manager.setup.submissionsToReviewersDescription2"}</td>
</tr>

<tr>
	<td class="formLabel">{formLabel name="reviewGuidelines"}{translate key="manager.setup.guidelines"}:{/formLabel}</td>
	<td class="formField"><textarea name="reviewGuidelines" rows="12" cols="60" class="textArea">{$reviewGuidelines|escape}</textarea></td>
</tr>
</table>
</div>

<br />

<div class="formSectionTitle">2.4 {translate key="section.sections"}</div>
<div class="formSection">
<div class="formSectionDesc">{translate key="manager.setup.sectionsDescription"}</div>

<table class="form">
<tr>
	<td class="formFieldLeft"><input type="radio" name="authorSelectsEditor" value="0"{if not $authorSelectsEditor} checked="checked"{/if} /></td>
	<td class="formLabelRightPlain">{translate key="manager.setup.selectSectionDescription"}</td>
</tr>

<tr>
	<td class="formFieldLeft"><input type="radio" name="authorSelectsEditor" value="1"{if $authorSelectsEditor} checked="checked"{/if} /></td>
	<td class="formLabelRightPlain">{translate key="manager.setup.selectEditorDescription"}</td>
</tr>

<tr>
	<td></td>
	<td class="formInstructions">{translate key="manager.setup.sectionsDefaultSectionDescription"}</td>
</tr>
</table>
</div>

<br />

<div class="formSectionTitle">2.5 {translate key="manager.setup.privacyStatement"}</div>
<div class="formSection">
<div class="formSectionDesc">{translate key="manager.setup.privacyStatementDescription"}</div>

<table class="form">
<tr>
	<td class="formLabel">{formLabel name="privacyStatement"}{translate key="manager.setup.privacyStatement2"}:{/formLabel}</td>
	<td class="formField"><textarea name="privacyStatement" rows="12" cols="60" class="textArea">{$privacyStatement|escape}</textarea></td>
</tr>
</table>
</div>

<br />

<div class="formSectionTitle">2.6 {translate key="manager.setup.openAccessPolicy"}</div>
<div class="formSection">
<div class="formSectionDesc">{translate key="manager.setup.openAccessPolicyDescription"}</div>

<table class="form">
<tr>
	<td class="formLabel">{formLabel name="openAccessPolicy"}{translate key="manager.setup.openAccessPolicy2"}:{/formLabel}</td>
	<td class="formField"><textarea name="openAccessPolicy" rows="12" cols="60" class="textArea">{$openAccessPolicy|escape}</textarea></td>
</tr>
</table>
</div>

<br />

<script type="text/javascript">
{literal}
function toggleRegAllowOpts(form) {
	form.allowRegReader.disabled=!form.allowRegReader.disabled;
	form.allowRegAuthor.disabled=!form.allowRegAuthor.disabled;
	form.allowRegReviewer.disabled=!form.allowRegReviewer.disabled;
}
{/literal}
</script>

<div class="formSectionTitle">2.7 {translate key="manager.setup.securitySettings"}</div>
<div class="formSection">
<div class="formSectionDesc">{translate key="manager.setup.securitySettingsDescription"}</div>

<div class="formSubSectionTitle">{translate key="manager.setup.userRegistration"}</div>
<table class="form">
<tr>
	<td class="formFieldLeft"><input type="radio" name="disableUserReg" value="0" onclick="toggleRegAllowOpts(this.form)"{if !$disableUserReg} checked="checked"{/if} /></td>
	<td class="formLabelRightPlain">{translate key="manager.setup.enableUserRegistration"}</td>
</tr>
<tr>
	<td></td>
	<td class="formLabelRightPlain"><input type="checkbox" name="allowRegReader" value="1"{if $allowRegReader || $allowRegReader === null} checked="checked"{/if}{if $disableUserReg} disabled="disabled"{/if} /> {translate key="user.role.readers"}<br />
		<input type="checkbox" name="allowRegAuthor" value="1"{if $allowRegAuthor || $allowRegAuthor === null} checked="checked"{/if}{if $disableUserReg} disabled="disabled"{/if} /> {translate key="user.role.authors"}<br />
		<input type="checkbox" name="allowRegReviewer" value="1"{if $allowRegReviewer || $allowRegReviewer === null} checked="checked"{/if}{if $disableUserReg} disabled="disabled"{/if} /> {translate key="user.role.reviewers"}</td>
</tr>
<tr>
	<td class="formFieldLeft"><input type="radio" name="disableUserReg" value="1" onclick="toggleRegAllowOpts(this.form)"{if $disableUserReg} checked="checked"{/if} /></td>
	<td class="formLabelRightPlain">{translate key="manager.setup.disableUserRegistration"}</td>
</tr>
</table>

<br />

<div class="formSubSectionTitle">{translate key="manager.setup.siteAccess"}</div>
<table class="form">
<tr>
	<td class="formFieldLeft"><input type="radio" name="restrictSiteAccess" value="0"{if !$restrictSiteAccess} checked="checked"{/if} /></td>
	<td class="formLabelRightPlain">{translate key="manager.setup.noRestrictSiteAccess"}</td>
</tr>
<tr>
	<td class="formFieldLeft"><input type="radio" name="restrictSiteAccess" value="1"{if $restrictSiteAccess} checked="checked"{/if} /></td>
	<td class="formLabelRightPlain">{translate key="manager.setup.restrictSiteAccess"}</td>
</tr>
</table>

<br />

<div class="formSubSectionTitle">{translate key="manager.setup.articleAccess"}</div>
<table class="form">
<tr>
	<td class="formFieldLeft"><input type="radio" name="restrictArticleAccess" value="0"{if !$restrictArticleAccess} checked="checked"{/if} /></td>
	<td class="formLabelRightPlain">{translate key="manager.setup.noRestrictArticleAccess"}</td>
</tr>
<tr>
	<td class="formFieldLeft"><input type="radio" name="restrictArticleAccess" value="1"{if $restrictArticleAccess} checked="checked"{/if} /></td>
	<td class="formLabelRightPlain">{translate key="manager.setup.restrictArticleAccess"}</td>
</tr>
</table>

<br />

<div class="formSubSectionTitle">{translate key="manager.setup.loggingAndAuditing"}</div>
<table class="form">
<tr>
	<td class="formFieldLeft"><input type="checkbox" name="articleEventLog" value="1"{if $articleEventLog} checked="checked"{/if} /></td>
	<td class="formLabelRightPlain">{translate key="manager.setup.submissionEventLogging"}</td>
</tr>
<tr>
	<td class="formFieldLeft"><input type="checkbox" name="articleEmailLog" value="1"{if $articleEmailLog} checked="checked"{/if} /></td>
	<td class="formLabelRightPlain">{translate key="manager.setup.submissionEmailLogging"}</td>
</tr>
</table>
</div>

<br />

<div class="formSectionTitle">2.8 {translate key="manager.setup.addItemtoAboutJournal"}</div>
<div class="formSection">
{foreach name=customAboutItems from=$customAboutItems key=aboutId item=aboutItem}
<table class="form">
<tr>
	<td class="formLabel">{translate key="common.title"}:</td>
	<td class="formField"><input type="text" name="customAboutItems[{$aboutId}][title]" value="{$aboutItem.title|escape}" size="40" maxlength="210" class="textField" />{if $smarty.foreach.customAboutItems.total > 1}<input type="submit" name="delCustomAboutItem[{$aboutId}]" value="{translate key="common.delete"}" class="formButtonPlain" />{/if}</td>
</tr>
	
<tr>
	<td class="formLabel">{translate key="manager.setup.aboutItemContent"}:</td>
	<td class="formField"><textarea name="customAboutItems[{$aboutId}][content]" rows="12" cols="60" class="textArea">{$aboutItem.content|escape}</textarea></td>
</tr>
</table>
{foreachelse}
<table class="form">
<tr>
	<td class="formLabel">{translate key="common.title"}:</td>
	<td class="formField"><input type="text" name="customAboutItems[0][title]" size="40" maxlength="120" class="textField" /></td>
</tr>
	
<tr>
	<td class="formLabel">{translate key="manager.setup.aboutItemContent"}:</td>
	<td class="formField"><textarea name="customAboutItems[0][content]" rows="12" cols="60" class="textArea"></textarea></td>
</tr>
</table>
{/foreach}

<div align="center"><input type="submit" class="formButtonPlain" name="addCustomAboutItem" value="{translate key="manager.setup.addAboutItem"}" /></div>
<br />
</div>

<br />

<table class="form">
<tr>
	<td></td>
	<td class="formField"><input type="submit" value="{translate key="common.save"}" class="formButton" /> <input type="button" value="{translate key="common.cancel"}" class="formButtonPlain" onclick="document.location.href='{$pageUrl}/manager/setup'" /></td>
</tr>
</table>

</form>

{include file="common/footer.tpl"}
