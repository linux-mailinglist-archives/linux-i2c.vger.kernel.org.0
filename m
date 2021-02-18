Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08C8E31ECFC
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Feb 2021 18:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233344AbhBRRLp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Feb 2021 12:11:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbhBRPHo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Feb 2021 10:07:44 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2926BC061793;
        Thu, 18 Feb 2021 07:05:19 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id gx20so1644382pjb.1;
        Thu, 18 Feb 2021 07:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qt3K9mg5dH0QQuZEd/KaPTOjklJDp5psAssg/8BuCoQ=;
        b=WT03oCVlXeCKVt9UKMFYjRxffZva2juISnIS6uhe2UoIF77jScIwyqm2ITTc9iujJ5
         GZy6vR+60yczwFsFup/MjQCAxJfZfCmlR7CE3OoM/5hZMIU3VN1qUKIS7cH7zwJGzoMj
         lTL5va5ImLeXyLaLKG0IsoO78kM/JDV6KFJaerwBCRvod80hIEWntI0VrB1lUDY7ujJ6
         Dn3HzaN7+k8uuuuQ6zThiHfM8frfKDI5l0Z07cjTDAh1pmDV9eM2tt2EukUM7INtqeZG
         IkehWD0E9U2N2EJBVsPR2NizbAFkHiK419NdxeXmwLzMVFQ3w32QcoTFGVO66sqYAGMa
         ExTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qt3K9mg5dH0QQuZEd/KaPTOjklJDp5psAssg/8BuCoQ=;
        b=pRlqobnz7/TWMlPUuG81PjkbWnwbVojSo+JUxUQYtpIiRV8U2XC2ok1Cnqcc7p/imE
         o520pNwFX71myexTsAPPeijI3mhrcJJAD7RLcnLuIq7drJtxmtpn8snM1rtNPgHlKyhu
         NURhUSqHGUpDSb7clTu1gQvDTU9w/4VIA6TlUESSgRHgl5ncM/jn+pjWIMfvAsP8NE25
         WjVqzAW70jbUHWsjY1Ea+fBhRVkJu08ydcPcHAbGJmEzyblmNslQyyPplzxMN4nZpeOu
         E9fn6lWv7kI/DSnXLew0rkDxjBqdQOA+gcOeMNyVqgHXDKvR/0pbkhF/H2lA3Sezj7Mm
         CYqg==
X-Gm-Message-State: AOAM530ANQahZED2T5CJa69GsZQO5ELqa2Fn5e+57ySyavSrmswtRUfo
        OkQgP3/lXWVmsxB3rtgPvAq4+O71R5QalQ==
X-Google-Smtp-Source: ABdhPJxZpd590tAK+mrCR9YzjUxRQ+P1CDlfHivgAwxiLSGY6tDc++YdKJruv/cjCf8PYFbXKjaxig==
X-Received: by 2002:a17:902:8ec1:b029:dc:8ae1:7a22 with SMTP id x1-20020a1709028ec1b02900dc8ae17a22mr4493022plo.6.1613660718787;
        Thu, 18 Feb 2021 07:05:18 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id c12sm5915484pjq.48.2021.02.18.07.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 07:05:18 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v4 3/4] i2c: designware: Use the correct name of device-managed function
Date:   Thu, 18 Feb 2021 23:04:57 +0800
Message-Id: <20210218150458.798347-4-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210218150458.798347-1-zhengdejin5@gmail.com>
References: <20210218150458.798347-1-zhengdejin5@gmail.com>
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
with pcim_alloc_irq_vectors(). At the same time, Remove the
pci_free_irq_vectors() function to simplify the error handling path.
the freeing resources will take automatically when device is gone.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v3 -> v4:
	- add some commit comments.
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

