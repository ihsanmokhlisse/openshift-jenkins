<?xml version='1.0' encoding='UTF-8'?>
<com.cloudbees.plugins.credentials.SystemCredentialsProvider plugin="credentials@2.1.0">
  <domainCredentialsMap class="hudson.util.CopyOnWriteMap$Hash">${KUBERNETES_CREDENTIALS}<entry>
      <com.cloudbees.plugins.credentials.domains.Domain>
        <name>schiphol</name>
        <description>schipholdesc</description>
        <specifications/>
      </com.cloudbees.plugins.credentials.domains.Domain>
      <list>
        <com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey plugin="ssh-credentials@1.12">
          <id>ci_user_ssh</id>
	  <scope>GLOBAL</scope>
          <description></description>
          <username>ci_user</username>
          <passphrase>pMO8ImxpXQqd8tpWo31ixA==</passphrase>
	  <privateKeySource class='com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey$DirectEntryPrivateKeySource'>
            <privateKey>UH6d/A==</privateKey>
          </privateKeySource>
        </com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey>
      </list>
    </entry>
  </domainCredentialsMap>
</com.cloudbees.plugins.credentials.SystemCredentialsProvider>
