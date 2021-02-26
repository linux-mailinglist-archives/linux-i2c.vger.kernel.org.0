Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 964A83264F4
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Feb 2021 16:52:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbhBZPvz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Feb 2021 10:51:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhBZPvx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Feb 2021 10:51:53 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF3FCC061788;
        Fri, 26 Feb 2021 07:51:10 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id o63so6447789pgo.6;
        Fri, 26 Feb 2021 07:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=za8eu1JYR+W6Qrs53oiJmSIh8L3ByYlyVjAb99OLBoQ=;
        b=oXpVpXZHvj/d5U6nx2W8ZVQtECAzv/YPcuOckMQgSBfZOfzTlxbkr31+yp90Mw/SLY
         /5LE13WfnBs6IKlwdEesM3RX4ZmGneMolw8bOJesCX8EY90P43DZZwpENnkXU/xSqOnT
         Yv+NPWFW8xkswNwEFj8KfHze+PrFgX7HUPOBqumEjFsTYn7euXGYVxraUf7Xl4XEtFb5
         PLwLbOJSgW6CGxjaDHsQKtz2X42PwnQyE7patUXIVh4Y1cQ9oXassFHOQNOSlvKNnpe9
         4IvkiV7Y7DxJ56c/BmJfQSv0M+7RpkBnbVdviZoRRgkMtP0JryKp8FdzMhviLfskbl3F
         Aojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=za8eu1JYR+W6Qrs53oiJmSIh8L3ByYlyVjAb99OLBoQ=;
        b=J5F/JPLrKNGnuasYMDXshr8Qqcx3wqVApe8y6rsM5Lqgz+kVxdE4xUTiS0QgelDmpL
         AbvxaCCJoYVP8DA0F0ckdaWWe8lYxo5PtbiPDIw6qBCTqEn8pUjPPfQsW0Cimp5BZ91p
         7IMwcinjHiM443n1Vpcgl45dQO1S82DO3S2S4CvvUs383HQEqfXyCCZae0I86Dy5p17e
         bvg5fBTeqXTOtiskm9R7+Puz4SKLZW6YbUX9tH1LeK7bbayfMQTi+5AGjZLFNt5exqkk
         83K2ocNGTGvrvXYtvxKCMpwFb0KWwNm8v4VIbJwaQlIqUX9lH7nFeqYi6WBDM5gXkf5p
         LjHQ==
X-Gm-Message-State: AOAM530KaQxOnIrAH10GfEamPUOokUj5wD6LWuNS6d68ceXjq/NmhQLD
        wFoJ3iRij+S163uLgEnx4sI=
X-Google-Smtp-Source: ABdhPJxPAy/kl27Stu1V4S5SDw52GK+PhDfQ2S+4w1MT/G5gNvJmzHadZEYnpAadC3SAuivyqwOPwg==
X-Received: by 2002:a63:5b0e:: with SMTP id p14mr3424782pgb.110.1614354670560;
        Fri, 26 Feb 2021 07:51:10 -0800 (PST)
Received: from localhost (89.208.244.53.16clouds.com. [89.208.244.53])
        by smtp.gmail.com with ESMTPSA id d26sm10103662pfq.175.2021.02.26.07.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 07:51:10 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v5 3/4] i2c: designware: Use pcim_alloc_irq_vectors() to allocate IRQ vectors
Date:   Fri, 26 Feb 2021 23:50:55 +0800
Message-Id: <20210226155056.1068534-4-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210226155056.1068534-1-zhengdejin5@gmail.com>
References: <20210226155056.1068534-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pcim_alloc_irq_vectors() function, an explicit device-managed version
of pci_alloc_irq_vectors(). If pcim_enable_device() has been called
before, then pci_alloc_irq_vectors() is actually a device-managed
function. It is used here as a device-managed function, So replace it
with pcim_alloc_irq_vectors(). At the same time, Remove the
pci_free_irq_vectors() function to simplify the error handling path.
the freeing resources will take automatically when device is gone.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v4 -> v5:
	- Modify the subject name.
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

