Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B9039E0B3
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 17:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbhFGPlT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 11:41:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhFGPlQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Jun 2021 11:41:16 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C64C061766;
        Mon,  7 Jun 2021 08:39:25 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id q25so13370577pfh.7;
        Mon, 07 Jun 2021 08:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1qWmsBn3DHLWFicfHvWSdPqQJ4x1w0Cu4gQfUXued6o=;
        b=sOkr7iBNjE+vz91eEF/rhlqAaOH6eyHAGwjf//QS+VLNukkUUC9vTtZsyYLP2SDFGt
         7H+N3IGdudDHIiBwaBBO+nSA7HO47sgYJmg/hhAmrfgqspauPTQDhMb3LpZszlZ5MwGo
         1hJdZiC5BA8riPfLwKgyv/UxUzhKwcGXm/J6zki8JkeGJJKQqT1BpROhJMK04jmPwVOy
         K4MzHMv4AU/6TqS/ICGb/Cv+3v62HS+AN3CbM0xpAiSp1Indk0qarLKipPbgHXDkn4yy
         rNyUOJnxLxZ7bL7QFf/CCYQE8tdXQepv4huenrxH+pSlI56nRF9ikd+cikC5I5B8Dvow
         VHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1qWmsBn3DHLWFicfHvWSdPqQJ4x1w0Cu4gQfUXued6o=;
        b=lkK/ztMMihDtpkksjTs7F+4WAg79ESyXXrtCXbRdtz+GYEnaBGkawMkZZ2a983Ecp9
         I8Y3kvhWboEJ+u7ckIrrhtRaQXq4y2e9oopp05qLYWib111LeLGTIzKCoI6wM0VNoQqC
         2rctj4UbOHx4N+mvV/y1VJQx1HW0Ue7JK6yK1rRO1TryWP0oqjAOq00a7VQ6tuytDMEg
         xeMYBBrUmgABHoFep7UgQSCJ6vrVdqNwIm8EyNKR0gz8XJCK2JCpNiP4NIfHPJfKzBQN
         J4+uTAMPLC56qBoNjPJSTHEPJhyAfMf3L3Ssdcmt7oDCcwtu+w+CQqXGbJk7m1obMt7s
         E7JA==
X-Gm-Message-State: AOAM533mkgvjJ6XclybePZlYsk4eWgCt++HPqJoiFz9fsr23JOa6SvbY
        ZFhuzK4vvCtZcdU+jXIQi3s=
X-Google-Smtp-Source: ABdhPJywk0ki2Mf7M8gkjyeC+mZH2KJFnVW7YhWrUtaPbwW8nSbJaNWHUR3mGoGsw7F4R69wIEg6fg==
X-Received: by 2002:a63:d452:: with SMTP id i18mr18584942pgj.0.1623080365259;
        Mon, 07 Jun 2021 08:39:25 -0700 (PDT)
Received: from localhost (185.212.56.112.16clouds.com. [185.212.56.112])
        by smtp.gmail.com with ESMTPSA id u10sm2292154pfh.123.2021.06.07.08.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 08:39:24 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     helgaas@kernel.org, corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        Sanket.Goswami@amd.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v7 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Date:   Mon,  7 Jun 2021 23:39:13 +0800
Message-Id: <20210607153916.1021016-2-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210607153916.1021016-1-zhengdejin5@gmail.com>
References: <20210607153916.1021016-1-zhengdejin5@gmail.com>
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

When CONFIG_PCI=n, there is no stub for pci_is_managed(), but
pcim_alloc_irq_vectors() will use it, so add one like other similar stubs.
Otherwise there can be build errors, as here by kernel test robot
reported:
include/linux/pci.h: In function 'pcim_alloc_irq_vectors':
>> include/linux/pci.h:1847:7: error: implicit declaration of function 'pci_is_managed' [-Werror=implicit-function-declaration]
    1847 |  if (!pci_is_managed(dev))
         |       ^~~~~~~~~~~~~~

Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Robert Richter <rric@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v6 -> v7:
	- rebase to PCI next branch
	- add a stub for pci_is_managed() when disable PCI for
	  fix build error in sparc architecture.
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
 include/linux/pci.h | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 452351025a09..e3b3fc59bd35 100644
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
index c20211e59a57..5783262c4643 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1730,6 +1730,7 @@ static inline struct pci_dev *pci_get_class(unsigned int class,
 
 static inline void pci_set_master(struct pci_dev *dev) { }
 static inline int pci_enable_device(struct pci_dev *dev) { return -EIO; }
+static inline int pci_is_managed(struct pci_dev *pdev) { return 0; }
 static inline void pci_disable_device(struct pci_dev *dev) { }
 static inline int pcim_enable_device(struct pci_dev *pdev) { return -EIO; }
 static inline int pci_assign_resource(struct pci_dev *dev, int i)
@@ -1825,6 +1826,30 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
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

