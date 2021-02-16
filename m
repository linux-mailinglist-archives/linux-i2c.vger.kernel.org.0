Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87E431CD76
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 17:04:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbhBPQDq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 11:03:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbhBPQDn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Feb 2021 11:03:43 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58347C06174A;
        Tue, 16 Feb 2021 08:03:03 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id fa16so5950209pjb.1;
        Tue, 16 Feb 2021 08:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SEY8lEZGS42JtvMA8omGE4HeCsllkcm6O1GjxwD/puQ=;
        b=SLvnWcWyt22Sv0apOdq4AeyyVojvsiukA1JWoFTxBpGP9pYnwlfKd56wAtUoQXKaRD
         x8U6cdxLWUhcM2NwoFeVTCeAJeSLeF9tQOB0faHRbJlo0QSEljEEW6gpJI3+q+HidTue
         ewgOzp996mf5MBgkcBkv6JvxpsJN+TceSkhkN02kLadcefpJraqa0ujZ0XwvuvknhWFC
         Xr+Oi6M1/Nj9M5nUJSdvc558ClRis1NDTPQV076NNxU+w8RPuMih9NasR+nvJ7uEVrg6
         aoDeJBpYDe4RlK8DOIqvIsk5moiNk+fTv6u38oT6BqkDsFadgGSsKUhXWYduSxdMWKZF
         Inqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SEY8lEZGS42JtvMA8omGE4HeCsllkcm6O1GjxwD/puQ=;
        b=CwIU1bVqr5OoRiwOtDnUfsnnrERNmxC+St/SvhIdN81+5avysvqfAU3OGm4bb8tYGH
         3B7qlF2GTobuOFfLeBW03dMhgtOffsMZMh9/zkvo5AE+oaG4fbZEBiayvUCDD6NkTzFq
         CoxNPX3HxE8qHLWMtU7VDIdl1lKHT32X45xXSowtjcwlYvPbMSdGlMd0Cpo5JkntFwPD
         A/TjiqFcfJm7Vr71+Nc/D1qm+t1PTZiZ0EkCCIM3u8jtdFsJB/9ZKbSf7xmlQVpSqwXt
         K86hGtmkmVfyMisssLHRvhtSgK9uNQE2Qow7/08s0t58rtHBH2A23FHihaMmUhkcFgpJ
         dp5w==
X-Gm-Message-State: AOAM531j2wNFeoeh3x+T/VuDqmogaRB8RaK+d7pz9vCk7SKJdnLctzhK
        VUid2oURvkNb+91NOT+sjxYTdGuBX/6qBA==
X-Google-Smtp-Source: ABdhPJydthKBcD4fnX26mG7IXBsRFXO2WwBSkkinI0zQGvCd03M34HB9dEF9WYTQGa0Z6NnDliSktQ==
X-Received: by 2002:a17:90a:8c87:: with SMTP id b7mr5024018pjo.158.1613491382978;
        Tue, 16 Feb 2021 08:03:02 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id z16sm2949472pgk.13.2021.02.16.08.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 08:03:02 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, kw@linux.com
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v3 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Date:   Wed, 17 Feb 2021 00:02:46 +0800
Message-Id: <20210216160249.749799-2-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210216160249.749799-1-zhengdejin5@gmail.com>
References: <20210216160249.749799-1-zhengdejin5@gmail.com>
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

