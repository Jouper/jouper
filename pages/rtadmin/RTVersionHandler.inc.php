<?php

/**
 * RTVersionHandler.inc.php
 *
 * Copyright (c) 2003-2005 The Public Knowledge Project
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @package pages.rtadmin
 *
 * Handle Reading Tools administration requests -- setup section. 
 *
 * $Id$
 */

import('rt.ojs.JournalRTAdmin');

class RTVersionHandler extends RTAdminHandler {
	function createVersion($args) {
		RTAdminHandler::validate();

		$rtDao = &DAORegistry::getDAO('RTDAO');

		$journal = Request::getJournal();

		import('rt.ojs.form.VersionForm');
		$versionForm = new VersionForm(null, $journal->getJournalId());

		if (isset($args[0]) && $args[0]=='save') {
			$versionForm->readInputData();
			$versionForm->execute();
			Request::redirect('rtadmin/versions');
		} else {
			RTAdminHandler::setupTemplate(true);
			$versionForm->display();
		}
	}

	function exportVersion($args) {
		RTAdminHandler::validate();

		$rtDao = &DAORegistry::getDAO('RTDAO');

		$journal = Request::getJournal();
		$versionId = isset($args[0])?$args[0]:0;
		$version = &$rtDao->getVersion($versionId, $journal->getJournalId());

		if ($version) {
			$templateMgr = &TemplateManager::getManager();
			$templateMgr->assign('version', &$version);

			$templateMgr->display('rtadmin/exportXml.tpl', 'application/xml');
		}
		else Request::redirect('rtadmin/versions');
	}

	function importVersion() {
		$journal = &Request::getJournal();

		$fileField = 'versionFile';
		if (isset($_FILES[$fileField]['tmp_name']) && is_uploaded_file($_FILES[$fileField]['tmp_name'])) {
			$rtAdmin = &new JournalRTAdmin($journal->getJournalId());
			$rtAdmin->importVersion($_FILES[$fileField]['tmp_name']);
		}
		Request::redirect('rtadmin/versions');
	}

	function restoreVersions() {
		RTAdminHandler::validate();

		$journal = &Request::getJournal();
		$rtAdmin = &new JournalRTAdmin($journal->getJournalId());
		$rtAdmin->restoreVersions();

		Request::redirect('rtadmin/versions');
	}

	function versions() {
		RTAdminHandler::validate();
		RTAdminHandler::setupTemplate(true);

		$journal = Request::getJournal();

		$rtDao = &DAORegistry::getDAO('RTDAO');
		$templateMgr = &TemplateManager::getManager();

		$templateMgr->assign('versions', $rtDao->getVersions($journal->getJournalId()));
		$templateMgr->display('rtadmin/versions.tpl');
	}

	function editVersion($args) {
		RTAdminHandler::validate();

		$rtDao = &DAORegistry::getDAO('RTDAO');

		$journal = Request::getJournal();
		$versionId = isset($args[0])?$args[0]:0;
		$version = &$rtDao->getVersion($versionId, $journal->getJournalId());

		if (isset($version)) {
			import('rt.ojs.form.VersionForm');
			RTAdminHandler::setupTemplate(true);
			$versionForm = new VersionForm($versionId, $journal->getJournalId());
			$versionForm->initData();
			$versionForm->display();
		}
		else Request::redirect('rtadmin/versions');
	}

	function deleteVersion($args) {
		RTAdminHandler::validate();

		$rtDao = &DAORegistry::getDAO('RTDAO');

		$journal = Request::getJournal();
		$versionId = isset($args[0])?$args[0]:0;

		$rtDao->deleteVersion($versionId, $journal->getJournalId());

		Request::redirect('rtadmin/versions');
	}

	function saveVersion($args) {
		RTAdminHandler::validate();

		$rtDao = &DAORegistry::getDAO('RTDAO');

		$journal = Request::getJournal();
		$versionId = isset($args[0])?$args[0]:0;
		$version = &$rtDao->getVersion($versionId, $journal->getJournalId());

		if (isset($version)) {
			import('rt.ojs.form.VersionForm');
			$versionForm = new VersionForm($versionId, $journal->getJournalId());
			$versionForm->readInputData();
			$versionForm->execute();
		}

		Request::redirect('rtadmin/versions');
	}
}

?>