Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9B331ECF7
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Feb 2021 18:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233213AbhBRRLS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Feb 2021 12:11:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbhBRPFv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Feb 2021 10:05:51 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4017FC06178B;
        Thu, 18 Feb 2021 07:05:10 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d13so1418566plg.0;
        Thu, 18 Feb 2021 07:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3kxktRBQIqSj+zk0vpHumiALZ+/o4VB4EHXXMPvQP28=;
        b=VkyxtNlZFEFNJAJ2P7dvFxXF5cdrKagWkdNp00zMAe7xvwcy7QLp/ItC2mDv0lC8OY
         XH4N9yenVOAbgqili73tXxSHi04SqObxU6qV/OXk6rMr+sduYqqNEzcfL/ZgaL2kdTjg
         1sqodPYesCJGitUehcpG3znLgNYrnDzM+uCYSDUW6OM7QTpaX5rtdn38oaENS3ZYmF2J
         ctdssGafWxHRplxtqzKuiz1VngDDcrQ6w6gzWCzbKIC7km39bJm+Tc85It+mzwwew605
         l/ltfNUzdfkDfNuqWKxlEscTVJ7s4em9FHznVqrPxRlG3/QvtQPcJd/Se4YQKqL1WZ6D
         UvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3kxktRBQIqSj+zk0vpHumiALZ+/o4VB4EHXXMPvQP28=;
        b=DBTvKg25JpdmoBe+249FZgzu6vHJplOWZcl35ycTtZdL3Duv+zBPYEcNEVVLpFO8SJ
         yA8OCMzkeVBtFj3d1dg6cm8R4A9g7p7musZDXV24lTVNGgme70aazjVVto+R0n6l55+0
         TcQofQ3MCFoyOlTQeQ62PvC/fhMGg73Ukyy//9gTL5uwKptOWD2kBisEQ70F9LeYSZCp
         Lp5b7CkDA3SCX9kkcx3XMRB99sDuKkJfzS0SYkncRKyCtvUYC484tkQmQr/cdU13Usri
         bY8lB2MrhTF7hIZlP8RdsTU2qm1x2vkowVjV8s0d2fcDEb4JxUvbu/S/N+f2lxSwPAiu
         FISQ==
X-Gm-Message-State: AOAM5303g9VVT3i4Q6MLVQwQ8prIjGmwBflufm5Ugz6Qdni15jAxA2lD
        oZOHJVr50X3nsXec6OC335I=
X-Google-Smtp-Source: ABdhPJz67CEpLNTi6csSIEuiUHR+RSd5h99nFYYbnki5U2w+Redsdux23GwnqeHG2F/meyHYSvMjYA==
X-Received: by 2002:a17:90a:1f41:: with SMTP id y1mr4517759pjy.90.1613660709799;
        Thu, 18 Feb 2021 07:05:09 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id lx1sm5362175pjb.8.2021.02.18.07.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 07:05:09 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v4 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Date:   Thu, 18 Feb 2021 23:04:55 +0800
Message-Id: <20210218150458.798347-2-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210218150458.798347-1-zhengdejin5@gmail.com>
References: <20210218150458.798347-1-zhengdejin5@gmail.com>
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
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v3 -> v4:
	- No change
v2 -> v3:
	- Add some commit comments for replace some codes in
	  pcim_release() by pci_free_irq_vectors().
v1 -> v2:
	- Use pci_free_irq_vectors() to replace some code in
	  pcim_release().
	- Modify some commit messages.

 drivers/pci/pci.c   | 33 +++++++++++++++++++++++++++++----
 include/linux/pci.h |  3 +++
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b67c4327d307..db799d089c85 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1969,10 +1969,7 @@ static void pcim_release(struct device *gendev, void *res)
 	struct pci_devres *this = res;
 	int i;
 
-	if (dev->msi_enabled)
-		pci_disable_msi(dev);
-	if (dev->msix_enabled)
-		pci_disable_msix(dev);
+	pci_free_irq_vectors(dev);
 
 	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++)
 		if (this->region_mask & (1 << i))
@@ -2054,6 +2051,34 @@ void pcim_pin_device(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcim_pin_device);
 
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
+int pcim_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
+				unsigned int max_vecs, unsigned int flags)
+{
+	struct pci_devres *dr;
+
+	dr = find_pci_dr(dev);
+	if (!dr || !dr->enabled)
+		return -EINVAL;
+
+	return pci_alloc_irq_vectors(dev, min_vecs, max_vecs, flags);
+}
+EXPORT_SYMBOL(pcim_alloc_irq_vectors);
+
 /*
  * pcibios_add_device - provide arch specific hooks when adding device dev
  * @dev: the PCI device being added
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 86c799c97b77..d75ba85ddfc5 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1818,6 +1818,9 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
 					      NULL);
 }
 
+int pcim_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
+				unsigned int max_vecs, unsigned int flags);
+
 /* Include architecture-dependent settings and functions */
 
 #include <asm/pci.h>
-- 
2.25.0

