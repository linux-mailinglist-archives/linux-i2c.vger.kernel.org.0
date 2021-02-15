Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E20B31C14F
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Feb 2021 19:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbhBOSQ3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Feb 2021 13:16:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbhBOSQO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Feb 2021 13:16:14 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50DECC061574;
        Mon, 15 Feb 2021 10:15:58 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id o38so4651047pgm.9;
        Mon, 15 Feb 2021 10:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NWxmyj7Bp5pN/aMN4QfyoKCmw5EEMRBvUVT5cqlYd+I=;
        b=js6qKmr0DTmFPRdODmv5PsTpD17vhd0Cou4+q9nPUOS+/w3/vpzYalMzk0sFpqJO/n
         LTLPmu6XdlAoDjwNT7+WauXcbOVeuxcBczfuKn011MKhxJumr1PvWQJ1NkOMXIpX9PwI
         +2Zq/lMyAtUWT1Zr5bzbW7VT5rzY+SdZf63pjh0vFRplg75yo1eX8d6YGg3HmUHyeL0g
         Em9Qj1v9hUfUkHladIypOvoEM9TGJXA794IQuJ0UUnjtxabWBq3f61egr80SabAzpqAw
         7m+M/UYxtBKU/bWqQTyhTZVX5JygZKqDsg9qcz2SkSZ26UwQVNQxSd+PdOCau8F4ZGrN
         FUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NWxmyj7Bp5pN/aMN4QfyoKCmw5EEMRBvUVT5cqlYd+I=;
        b=a5tHS2bS4c55SiVh/5DPJH4yhXEfEk3R/SpHLicUI5JoI5BuXJsSm2oWMkADevQ8G1
         PYSD2CJ+xlcTLfAl4c+FxGO0A295rMkUDjWQQlZOOv/he+fjkQZglDLrknM/E85tVWB6
         XmiOOUG6X9529jZ/jPxBXywLmXRkSzGEhqEWUX+x21EWbLo5yWs5RmMH73zlIgXgbPTh
         uIgIh8/7qD4V5Z/HG2zPmhA9d5BisXbTz2TeeOM7J8E1+2F/ilaDbd3ypFAtexsCfEhZ
         fA7YJg+LG42vEx64BCNM56aHchf3iyobM1IjpAsFdlSdzI9Ti3oALmCWiuMcMuMZ0Du5
         wWsQ==
X-Gm-Message-State: AOAM531TG1GrRhLZVKUn2zElmJ/E8h9RkZsInKpQSxIY7A+F1ldbigDd
        fnpgVhuxxY5uTg2UNZLE6hc=
X-Google-Smtp-Source: ABdhPJx25nMxKuNSa5VtGFgNGMfvjiwD6lDEpI4+RHvbnmAbV16UsBWcFKpIBE+QWWSqvTlM4eULGw==
X-Received: by 2002:a62:6304:0:b029:1c0:d62d:d213 with SMTP id x4-20020a6263040000b02901c0d62dd213mr16203137pfb.79.1613412957932;
        Mon, 15 Feb 2021 10:15:57 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id z2sm19202572pfj.100.2021.02.15.10.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 10:15:57 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v1 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Date:   Tue, 16 Feb 2021 02:15:47 +0800
Message-Id: <20210215181550.714101-2-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210215181550.714101-1-zhengdejin5@gmail.com>
References: <20210215181550.714101-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Introduce pcim_alloc_irq_vectors(), a explicit device-managed version of
pci_alloc_irq_vectors().

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/pci/pci.c   | 19 +++++++++++++++++++
 include/linux/pci.h |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b67c4327d307..33244b512057 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2054,6 +2054,25 @@ void pcim_pin_device(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcim_pin_device);
 
+/**
+ * pcim_alloc_irq_vectors - a device-managed pci_alloc_irq_vectors()
+ *
+ * It depends on calling pcim_enable_device() to make irq resources manageable.
+ */
+int pcim_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
+				unsigned int max_vecs, unsigned int flags)
+{
+	struct pci_devres *dr;
+
+       /*Ensure that the pcim_enable_device() function has been called*/
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

