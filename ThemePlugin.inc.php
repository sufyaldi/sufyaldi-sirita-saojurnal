<?php
/**
 * @file plugins/themes/sao-iain-pare/ThemePlugin.inc.php
 */

import('lib.pkp.classes.plugins.ThemePlugin');

class SaoIainPareThemePlugin extends ThemePlugin
{
    public function init()
    {
        $this->setParent('defaultthemeplugin');
        $this->addScript('tailwind', 'https://cdn.tailwindcss.com', array('baseUrl' => ''));
        $this->addStyle('google-fonts', 'https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap', array('baseUrl' => ''));
        $this->addScript('lucide-icons', 'https://unpkg.com/lucide@latest', array('baseUrl' => ''));
        $this->addStyle('full-page', 'styles/full-page.css');

        HookRegistry::register('TemplateManager::display', array($this, 'loadDashboardData'));
    }

    public function loadDashboardData($hookName, $args)
    {
        $templateMgr = $args[0];
        $template = $args[1];

        if ($template !== 'frontend/pages/indexSite.tpl') return false;

        $this->_assignRecentArticles($templateMgr);
        $this->_assignTopAuthors($templateMgr);

        return false;
    }

    private function _assignRecentArticles($templateMgr)
    {
        try {
            $submissionDao = DAORegistry::getDAO('SubmissionDAO');
            // Dibatasi menjadi 5 artikel untuk simetri
            $result = $submissionDao->retrieve(
                'SELECT s.submission_id, s.context_id, p.date_published 
                 FROM submissions s 
                 JOIN publications p ON s.current_publication_id = p.publication_id 
                 WHERE s.status = 3 
                 ORDER BY p.date_published DESC LIMIT 5'
            );

            $articles = [];
            foreach ($result as $row) {
                $data = (array) $row;
                $submission = Services::get('submission')->get($data['submission_id']);
                $journal = Services::get('context')->get($data['context_id']);
                
                if ($submission && $journal) {
                    $articles[] = [
                        'id' => $submission->getId(),
                        'title' => $submission->getLocalizedFullTitle(),
                        'author' => $submission->getShortAuthorString(),
                        'date' => date('d M Y', strtotime($data['date_published'])),
                        'journalName' => $journal->getLocalizedName(),
                        'journalPath' => $journal->getPath(),
                    ];
                }
            }
            $templateMgr->assign('recentArticles', $articles);
        } catch (\Exception $e) {
            error_log("SAO_THEME_ERR_ARTICLES: " . $e->getMessage());
        }
    }

    private function _assignTopAuthors($templateMgr)
    {
        try {
            $authorDao = DAORegistry::getDAO('AuthorDAO');
            // Dibatasi menjadi 5 penulis untuk simetri
            $result = $authorDao->retrieve(
                'SELECT 
                    a.email, 
                    MAX(asg.setting_value) as given_name, 
                    MAX(asf.setting_value) as family_name, 
                    COUNT(*) as count 
                 FROM authors a 
                 LEFT JOIN author_settings asg ON a.author_id = asg.author_id AND asg.setting_name = "givenName" 
                 LEFT JOIN author_settings asf ON a.author_id = asf.author_id AND asf.setting_name = "familyName" 
                 JOIN publications p ON a.publication_id = p.publication_id 
                 JOIN submissions s ON p.submission_id = s.submission_id 
                 WHERE s.status = 3 
                 GROUP BY a.email 
                 ORDER BY count DESC LIMIT 5'
            );

            $authors = [];
            foreach ($result as $row) {
                $data = (array) $row;
                $fullName = trim($data['given_name'] . ' ' . ($data['family_name'] ?? ''));
                $authors[] = (object) [
                    'name' => $fullName,
                    'count' => $data['count']
                ];
            }
            $templateMgr->assign('topAuthors', $authors);
        } catch (\Exception $e) {
            error_log("SAO_THEME_ERR_AUTHORS: " . $e->getMessage());
        }
    }

    public function getDisplayName() { return 'Sao Jurnal OJS Theme'; }
    public function getDescription() { return 'Tema OJS 3 modern dengan desain premium, responsif, dan performa tinggi oleh SufyAldi.'; }
}
?>