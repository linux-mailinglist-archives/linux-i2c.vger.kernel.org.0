Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A822939CDCF
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Jun 2021 09:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhFFHIT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Jun 2021 03:08:19 -0400
Received: from mail-pj1-f41.google.com ([209.85.216.41]:43524 "EHLO
        mail-pj1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbhFFHIT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Jun 2021 03:08:19 -0400
Received: by mail-pj1-f41.google.com with SMTP id l10-20020a17090a150ab0290162974722f2so8452113pja.2;
        Sun, 06 Jun 2021 00:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ameoA/1J9JC1e+hvEKFvbOF1rkxU/AqC4eK5zMBiLI8=;
        b=I4SEo+19gR7uX9BiDaAf3R15E3yDqb+EV6ziZYDIJXRO07fB9OD6xDdqpFPin5sVEL
         tIHCOyHpLzWuwGTxtlnPH+c8Vln56msa0lcNYx1XVIUbUQTKxVDN9yNGQGOWJyRl9oWo
         c/YJ3OlSHtio7SxHwij4mojXn4NZQ1ckrP4TvhQbrv5+VjDLE+p0jt3q2FmY0XTB82/M
         NAlr8bvLOdlkwxGr+/EXaRiEytlwOzqbrF3jYJTHq5liAKUdMQZkle23XkOtPIh24gaA
         mJLML7Ja8HCNywIBONrFEQFsOQYNUPNz0v9sSjOWhowyz29KIGfxxuZVkvDHNTSjctD0
         oTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ameoA/1J9JC1e+hvEKFvbOF1rkxU/AqC4eK5zMBiLI8=;
        b=UHu4QxpFQb0QBHYvrWscIysbAqsQEkwdxaSivgc+DoLP5MaLgRXN8zBCXhWWDsQuHi
         kCUv8nNwmmOPstH1gU4CNevHgcQq6H2qN6FwK2FC6LDbv/LWUIr92y9R2fV11Oh7To2j
         a8vgaPjjDnmuvWYBXC79AxkC/x8XZNE69OGI0UPW95YHnGUrcaRJQeDzNHNUL6je6gpV
         N4VqahZOeo0YzSmr1qVqUBj3R5/WQeP+6NuH4W88krudOgOHlR8YSFZaC7TKRmdEso41
         2ZDBZ8mS5Poi5/nKPfVz5Qf/IiaWerWH5RCj0HVCLf1VrhM0CXXH/PLpnecyJUTG7JK4
         qSoQ==
X-Gm-Message-State: AOAM533JnUWkYt42co784n6eDSKFhQVDyyJc80YVi4B7IzjPqPRDGiyN
        xOR8oP1zuGweDyXS8fDR12Y=
X-Google-Smtp-Source: ABdhPJwHe+fu6+k3PJUxr4V+xmq/fCR4yxqhySIErvOeE6x3nKsV0UU04/QFYOxirG7MAqOrgzdInA==
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr26334023pja.181.1622963120512;
        Sun, 06 Jun 2021 00:05:20 -0700 (PDT)
Received: from localhost (185.212.56.112.16clouds.com. [185.212.56.112])
        by smtp.gmail.com with ESMTPSA id 21sm5081227pfh.103.2021.06.06.00.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 00:05:20 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     helgaas@kernel.org, corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v6 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Date:   Sun,  6 Jun 2021 15:05:08 +0800
Message-Id: <20210606070511.778487-2-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210606070511.778487-1-zhengdejin5@gmail.com>
References: <20210606070511.778487-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Introduce pcim_alloc_irq_vectors(), a device-managed version of
pci_alloc_irq_vectors(). Introducing this function can simplify
the error handling path in many drivers.

And use pci_free_irq_vectors() to replace some code in pcim_release(),
they are equivalent, and no functional change. It is more explicit
that pcim_alloc_irq_vectors() is a device-managed function.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Robert Richter <rric@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v5 -> v6:
	- rebase to 5.13-rc4
v4 -> v5:
	- Remove the check of enable device in pcim_alloc_irq_vectors()
	  and make it as a static line function.
v3 -> v4:
	- No change
v2 -> v3:
	- Add some commit comments for replace some codes in
	  pcim_release() by pci_free_irq_vectors().
v1 -> v2:
	- Use pci_free_irq_vectors() to replace some code in
	  pcim_release().
	- Modify some commit messages.

 drivers/pci/pci.c   |  5 +----
 include/linux/pci.h | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b717680377a9..6319e5889688 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1989,10 +1989,7 @@ static void pcim_release(struct device *gendev, void *res)
 	struct pci_devres *this = res;
 	int i;
 
-	if (dev->msi_enabled)
-		pci_disable_msi(dev);
-	if (dev->msix_enabled)
-		pci_disable_msix(dev);
+	pci_free_irq_vectors(dev);
 
 	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++)
 		if (this->region_mask & (1 << i))
diff --git a/include/linux/pci.h b/include/linux/pci.h
index c20211e59a57..e9c95cab2540 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1825,6 +1825,30 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
 					      NULL);
 }
 
+/**
+ * pcim_alloc_irq_vectors - a device-managed pci_alloc_irq_vectors()
+ * @dev:		PCI device to operate on
+ * @min_vecs:		minimum number of vectors required (must be >= 1)
+ * @max_vecs:		maximum (desired) number of vectors
+ * @flags:		flags or quirks for the allocation
+ *
+ * Return the number of vectors allocated, (which might be smaller than
+ * @max_vecs) if successful, or a negative error code on error. If less
+ * than @min_vecs interrupt vectors are available for @dev the function
+ * will fail with -ENOSPC.
+ *
+ * It depends on calling pcim_enable_device() to make IRQ resources
+ * manageable.
+ */
+static inline int
+pcim_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
+			unsigned int max_vecs, unsigned int flags)
+{
+	if (!pci_is_managed(dev))
+		return -EINVAL;
+	return pci_alloc_irq_vectors(dev, min_vecs, max_vecs, flags);
+}
+
 /* Include architecture-dependent settings and functions */
 
 #include <asm/pci.h>
-- 
2.30.1

