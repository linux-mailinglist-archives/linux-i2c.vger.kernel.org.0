Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B39553264E9
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Feb 2021 16:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhBZPvu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Feb 2021 10:51:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbhBZPvs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Feb 2021 10:51:48 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4AFC061756;
        Fri, 26 Feb 2021 07:51:06 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id o63so6447644pgo.6;
        Fri, 26 Feb 2021 07:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3cnyege2lkvyTzpBpEwQIGSU7jGEQIJcUXr0wZfuG3I=;
        b=ki2ojrFhidCe/PlzX1H75NNXpwP9+iOjCBi9L1PLXFjIMfsblWfmQsOlF0WyO36Fc2
         BEG1lRGXSh5AKHpasU6Anb81z20P1QCGzJ/GZNzZcxSxD6jH7aBvpJEhf3ed3lgKuMCM
         eVRej7hI7Jyu2fUKWo9pyilS8vLMfwvhPnuCDN5y8axt1vezG5A/8eN1LaeGlzfXPK1x
         u3sZobWgM3S6VsS6UTXQwrrZdu1Z7bKM9fMryYXY4U/DAsywAs/dQHqIA3UBywnVi/R8
         Xa5TP74rNN45cllVfXmF6eEduQsaEoq1p4Lfg76bIGUa4kR9gLeYw2xN3Lrv+wHFEBQE
         CKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3cnyege2lkvyTzpBpEwQIGSU7jGEQIJcUXr0wZfuG3I=;
        b=jgxQjWv1MRbXjLzNNH/gVNtZfea47e2+5IGwwobUp0YJEiaPc/W1JoImwM2FECDjNS
         NWtCIRarxEGm+cDOLxBe90Tj3PslnTMFYsKayHNPgTPotLXCNZ5wVuiMOY25npz3N30f
         R8dc+TBMYZxa8pJwgg8gRgQfKfDYQIJ6lnRHMCFYdKo6eCcmDWghyxm/Siw9SjbnKJPi
         gUdiNS7teQgBhoaG1AyJ1QsqBbHVUnwTrxdgUnG8s9QqMFQK+sAGx2EMQsZwMkBD7OvQ
         gQGdjODG5TXYor72/+QyiDQ8+CVxJd8rGYaKJ2Z5Ovfjdxd06wAech7DtCGIj49nzqvH
         F6Sg==
X-Gm-Message-State: AOAM532F8HQzSjgpJhBviTf5PSkaCm3Dw77Ib9PZ80uLjUgWwug8Q5W1
        WjKpvnUb7XtcoiQVWNjepXQ=
X-Google-Smtp-Source: ABdhPJyXELNZNnHM/+p7yBNowPhVbez2cDEd/pjFAK70wtiUKpzKsa2DwkLEhn/kYIJz/jQVsgFPbg==
X-Received: by 2002:a65:6289:: with SMTP id f9mr3321403pgv.373.1614354665951;
        Fri, 26 Feb 2021 07:51:05 -0800 (PST)
Received: from localhost (89.208.244.53.16clouds.com. [89.208.244.53])
        by smtp.gmail.com with ESMTPSA id v123sm9463899pfc.63.2021.02.26.07.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 07:51:05 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v5 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Date:   Fri, 26 Feb 2021 23:50:53 +0800
Message-Id: <20210226155056.1068534-2-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210226155056.1068534-1-zhengdejin5@gmail.com>
References: <20210226155056.1068534-1-zhengdejin5@gmail.com>
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
index 16a17215f633..fecfdc0add2f 100644
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
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 86c799c97b77..5cafd7d65fd7 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1818,6 +1818,30 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
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
2.25.0

