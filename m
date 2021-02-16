Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A00D431CD7E
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 17:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbhBPQDy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 11:03:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbhBPQDs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Feb 2021 11:03:48 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F79AC0613D6;
        Tue, 16 Feb 2021 08:03:08 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id s16so1806623plr.9;
        Tue, 16 Feb 2021 08:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VG6dKCG2ODrov9EapJ5ufxyScu+BNsG2De21xAJ5VII=;
        b=pYmnxO75ygukI3bZfYQlhKS4QVfSjfAFSgKoEEKv3Cz0rCb+CG3gp/Z8Wi2NDUd7lU
         icWFzdJnJc7tpkPk0vN16bCJtYwB4jSAztRO+iMm4XVawgAnHJ6eue+4C4d5g1GryRNV
         6GvxDDImKiOpqgqjlMDpc97OUj8exidRyPDVMp6gCOP1xfDVTFWOWCfz29ZbHiko59mt
         BC8EUOJTcm0xxfTnxFGt/4xdFZEMBT5pu8xuZ992LSXpX/My+0a6zh2h8IUzHW59UhTE
         Im6oBmR4par5vYFdfb1T2i91GtFA0QBudyJ4dHxm4r04hdqM+pHHG5y2bl6fFEbtht+1
         azcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VG6dKCG2ODrov9EapJ5ufxyScu+BNsG2De21xAJ5VII=;
        b=YY7kD1a6BoPiS3o+mrGFoi4GV9rP6YAVx26BMnPpdMpP4rIZxJzes2x/dx05mmEsDB
         l5DrSoOUTXrCGwMTFc2WeZumknLK1cEObfUlVUKdlfYvEc+QfOYwOapUUZg+a7hx0UgS
         YdZogdECDdaya4WCwOmKu14dtzZ9sC7+uhLemFnqZFUYLDuhHRC+/3g6e5RAfLiYelIn
         cPwgVb7Lca3UF+LTxNX5b3fRvU0PTZHY0yBItw/kU83nrrVHOPyRmhHKlFr7KnDD/1Qz
         wWaQ2pWtZtrkrd62rFj1OFO50wB0j2kuQlv2Yqjsnunga53J/m1aWYzjJZ+j6NuZMCJb
         cfNQ==
X-Gm-Message-State: AOAM533RZ8Sy4Cr3lb/X920Hy8028lTl8LaSQyjrOkbfFqzkPc/x07l5
        fE41/a6T/sXwNjNoq0OZ3FM=
X-Google-Smtp-Source: ABdhPJzEPaIyEQLYsXmdZAkNzBYfMzCW1L4BaD4xF/8z8sioVcNFm6B/ACj69VqAJMO0x+kgsLqPEw==
X-Received: by 2002:a17:90a:a585:: with SMTP id b5mr4876912pjq.110.1613491388153;
        Tue, 16 Feb 2021 08:03:08 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id u15sm5446404pfm.130.2021.02.16.08.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 08:03:07 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, kw@linux.com
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v3 3/4] i2c: designware: Use the correct name of device-managed function
Date:   Wed, 17 Feb 2021 00:02:48 +0800
Message-Id: <20210216160249.749799-4-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210216160249.749799-1-zhengdejin5@gmail.com>
References: <20210216160249.749799-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the new function pcim_alloc_irq_vectors() to allocate IRQ vectors,
the pcim_alloc_irq_vectors() function, an explicit device-managed version
of pci_alloc_irq_vectors(). If pcim_enable_device() has been called
before, then pci_alloc_irq_vectors() is actually a device-managed
function. It is used here as a device-managed function, So replace it
with pcim_alloc_irq_vectors(). At the same time, simplify the error
handling path.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v2 -> v3:
	- simplify the error handling path.
v1 -> v2:
	- Modify some commit messages.
 drivers/i2c/busses/i2c-designware-pcidrv.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 55c83a7a24f3..620b41e373b6 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -219,7 +219,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	if (!dev)
 		return -ENOMEM;
 
-	r = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
+	r = pcim_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
 	if (r < 0)
 		return r;
 
@@ -234,10 +234,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 
 	if (controller->setup) {
 		r = controller->setup(pdev, controller);
-		if (r) {
-			pci_free_irq_vectors(pdev);
+		if (r)
 			return r;
-		}
 	}
 
 	i2c_dw_adjust_bus_speed(dev);
@@ -246,10 +244,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		i2c_dw_acpi_configure(&pdev->dev);
 
 	r = i2c_dw_validate_speed(dev);
-	if (r) {
-		pci_free_irq_vectors(pdev);
+	if (r)
 		return r;
-	}
 
 	i2c_dw_configure(dev);
 
@@ -269,10 +265,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	adap->nr = controller->bus_num;
 
 	r = i2c_dw_probe(dev);
-	if (r) {
-		pci_free_irq_vectors(pdev);
+	if (r)
 		return r;
-	}
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -292,7 +286,6 @@ static void i2c_dw_pci_remove(struct pci_dev *pdev)
 
 	i2c_del_adapter(&dev->adapter);
 	devm_free_irq(&pdev->dev, dev->irq, dev);
-	pci_free_irq_vectors(pdev);
 }
 
 /* work with hotplug and coldplug */
-- 
2.25.0

