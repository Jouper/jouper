{**
 * lostPassword.tpl
 *
 * Copyright (c) 2003-2004 The Public Knowledge Project
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Password reset form.
 *
 * $Id$
 *}

{assign var="pageTitle" value="user.login.resetPassword"}
{include file="common/header.tpl"}

<form name="reset" action="{$pageUrl}/login/requestResetPassword" method="post">
<p><span class="instruct">{translate key="user.login.resetPasswordInstructions"}</span></p>

{if $error}
	<p><span class="formError">{translate key="$error"}</span></p>
{/if}

<table class="data" width="100%">
<tr valign="top">
	<td class="label" width="20%">{translate key="user.email"}</td>
	<td class="value" width="80%"><input type="text" name="email" value="{$username|escape}" size="30" maxlength="90" class="textField" /></td>
</tr>
</table>

<p><input type="submit" value="{translate key="user.login.resetPassword"}" class="button defaultButton" /></p>

&#187; <a href="{$pageUrl}/user/register">{translate key="user.login.registerNewAccount"}</a><br />
&#187; <a href="{$pageUrl}/user/lostPassword">{translate key="user.login.forgotPassword"}</a>

<script type="text/javascript">document.reset.email.focus();</script>
</form>

{include file="common/footer.tpl"}
