<% if $SiteConfig.LoginFooterContent %>
    <div class="login-footer-content">
        $SiteConfig.LoginFooterContent
    </div>
<% end_if %>

<script>
document.addEventListener('DOMContentLoaded', () => {
  const tabLinks = document.querySelectorAll('.login-form > ul li a');
  const formTabs = document.querySelectorAll('.form-tab');
  const tabList = document.querySelector('.login-form > ul');

  const showTab = (targetId, doSwap = false) => {
    // hide all tabs
    formTabs.forEach(tab => tab.style.display = 'none');
    // show the active tab
    const activeTab = document.getElementById(targetId);
    if (activeTab) activeTab.style.display = 'block';

    // remove all active classes
    tabLinks.forEach(link => link.classList.remove('active'));
    // set active link
    const activeLink = [...tabLinks].find(link => link.getAttribute('href').endsWith(`#${targetId}`));
    if (activeLink) {
      activeLink.classList.add('active');

      if (doSwap) {
        // move the <li> of the active link to the front of the list
        const li = activeLink.closest('li');
        if (li && tabList.firstChild !== li) {
          tabList.insertBefore(li, tabList.firstChild);
        }
      }
    }
  };

  tabLinks.forEach(link => {
    link.addEventListener('click', (e) => {
      e.preventDefault();
      const targetId = link.getAttribute('href').split('#')[1];
      showTab(targetId); // no swap after first load
    });
  });

  // Check for messages and show the first tab that contains one
  const tabWithMessage = [...formTabs].find(tab =>
    tab.querySelector('p.message')?.textContent.trim()
  );

  if (tabWithMessage) {
    showTab(tabWithMessage.id, true); // do the swap once
  } else {
    showTab(formTabs[0]?.id || formTabs[1]?.id, true); // do the swap once
  }
});

</script>
