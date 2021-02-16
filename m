Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CEDC31CBB0
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 15:19:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbhBPOTL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 09:19:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhBPOTG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Feb 2021 09:19:06 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC63C06174A;
        Tue, 16 Feb 2021 06:18:25 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id a4so4713337pgc.11;
        Tue, 16 Feb 2021 06:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0/8Il2KLbNbOGHiJUWvZA0jL3sPtcEjc8WP9wNcAlZk=;
        b=i+8yGkvyXnFawzBJaQeJeNLyHN8GPMWrnL/qrcpTbvyuFL4dXw0DH0G3ZRr4gOfdbJ
         76M5vxFU1yMcdqXWnq4St58S/C+uiSG4RP5ycpK7Av2XMfH8xT+IfvOfxd+eqJlJmFKi
         R0z2n4fvcNzTPj5hJk0O4P+h4H4hRyRTFZLejB/YMKDTOJYhZrV4iSwekemaKd93bOF+
         af4eusqQHAJtyrZv3NRtkEJrreF1y/mAUFyc95LD3iGMAX76roSarih1Py7XuDcjYYz2
         ZDViGoJ6akNmUIEHZH+5pVkHVKiFqVWMiCi8svMQK+4WPuAhi9065UnHLqqTYau/LHOq
         0XaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0/8Il2KLbNbOGHiJUWvZA0jL3sPtcEjc8WP9wNcAlZk=;
        b=g4ebU2avDxlsHlfOCLp9IzAfwitlfYqYanDPDsvqFO3ZnC3P7scWl9yQixGeJMcrLa
         qXVvBzT5eisHpETArJ2d6hevbNqmOM+5+jSSeqjuJFZ5MHmL0A8PzAL5FVyBYkOwZ0y8
         TelB9+gzcWq+xedWILzcnpizcQcOCNKUxRn21f31blexu9g/0uX6ibk4HyxJNoxegIhy
         nyOfxQj7bIN5SdRWdGJzETXqinet0R6XJnSMXFGo31uPUAHlonUdf7SXrEi7qOEiMLt5
         kMhZOdczgRvrRl03XkdZwpT70QLieTpmGev5ifGInNTX+kR5EAHvUJnQ++63T2wA2W8S
         XOEA==
X-Gm-Message-State: AOAM533lCblvEtMDLlnZRg2IMk35wLO8Vz3bZCjQL7I14IepCqPP4kI0
        zqBb7OVPbag5OKsTmsq+c3I=
X-Google-Smtp-Source: ABdhPJw5hP7I6Z9nf+GdtLNCzGLx5XXOmW3OybnlqHSriIRJehMfbKYJ1DrzUCrr3U1CQBrfB9YW8g==
X-Received: by 2002:aa7:9293:0:b029:1df:4e2:c981 with SMTP id j19-20020aa792930000b02901df04e2c981mr20041589pfa.41.1613485105342;
        Tue, 16 Feb 2021 06:18:25 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id p12sm3003259pjz.34.2021.02.16.06.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 06:18:25 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, kw@linux.com
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v2 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Date:   Tue, 16 Feb 2021 22:18:07 +0800
Message-Id: <20210216141810.747678-2-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210216141810.747678-1-zhengdejin5@gmail.com>
References: <20210216141810.747678-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Introduce pcim_alloc_irq_vectors(), a device-managed version of
pci_alloc_irq_vectors(). Introducing this function can simplify
the error handling path in many drivers.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
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

