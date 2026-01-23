<% if $SiteConfig.LoginFooterContent %>
    <div class="login-footer-content">
        $SiteConfig.LoginFooterContent
    </div>
<% end_if %>

<script>
document.addEventListener('DOMContentLoaded', () => {
  const tabList = document.querySelector('.login-form > ul');
  const formTabs = document.querySelectorAll('.form-tab');
  const tabLinks = tabList.querySelectorAll('li a');

  const showTab = (targetId, doSwap = false) => {
    if (!targetId) return;

    // hide all tabs
    formTabs.forEach(tab => (tab.style.display = 'none'));

    // show the active tab
    const activeTab = document.getElementById(targetId);
    if (!activeTab) return;
    activeTab.style.display = 'block';

    // remove all active classes
    tabLinks.forEach(link => link.classList.remove('active'));

    // set active link
    const activeLink = [...tabLinks].find(link => {
      const href = link.getAttribute('href') || '';
      return href.endsWith(`#${targetId}`);
    });

    if (activeLink) {
      activeLink.classList.add('active');

      if (doSwap) {
        const li = activeLink.closest('li');
        if (li && tabList && tabList.firstElementChild !== li) {
          tabList.insertBefore(li, tabList.firstElementChild);
        }
      }
    }
  };

  const getHashTargetId = () => {
    const hash = window.location.hash || '';
    const targetId = hash.replace(/^#/, '').trim();
    if (!targetId) return null;

    const matchingTab = [...formTabs].find(tab => tab.id === targetId);
    return matchingTab ? targetId : null;
  };

  tabLinks.forEach(link => {
    link.addEventListener('click', (e) => {
      e.preventDefault();

      const href = link.getAttribute('href') || '';
      const targetId = href.split('#')[1] || '';

      showTab(targetId);

      if (targetId) {
        history.replaceState(null, '', `#${targetId}`);
      }
    });
  });

  // 1) Prefer hash if it matches a tab id
  const hashTargetId = getHashTargetId();
  if (hashTargetId) {
    showTab(hashTargetId, true);
    return;
  }

  // 2) Otherwise show the first tab that contains a message
  const tabWithMessage = [...formTabs].find(tab =>
    tab.querySelector('p.message')?.textContent.trim()
  );

  if (tabWithMessage) {
    showTab(tabWithMessage.id, true);
  } else {
    showTab(formTabs[0]?.id || formTabs[1]?.id, true);
  }
});


</script>
