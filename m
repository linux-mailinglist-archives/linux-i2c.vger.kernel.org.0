Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFCF839E0C4
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 17:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbhFGPm1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 11:42:27 -0400
Received: from mail-pg1-f180.google.com ([209.85.215.180]:43816 "EHLO
        mail-pg1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbhFGPmY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Jun 2021 11:42:24 -0400
Received: by mail-pg1-f180.google.com with SMTP id e22so14073276pgv.10;
        Mon, 07 Jun 2021 08:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z5R1tQR+LCn1Yz4++ikaigGAZJL9L+hwgmejnmiO7PY=;
        b=alkJhnxL5hO4h5FBS9dCnaIPR54BPfnhzzLzIVfRDNCMwVMx78kQMtxEy4hd4OjaaX
         Pkmdme/7oY5wytyjwc8FGhwVNV+cQX1FZIqjBV0N/c/2VYJvzG2ac98Dwr0I7Nx0+rEv
         qK8lhLi/h1gO20wO2Dtr0+Z9JzhUhnreZUdzoXi+lYizuKpmgPlNQJZZYGlDLuHZWnBM
         ezvD12IDtdT4BaMD1/ZYpSooRMBVDFSsrAFZ6+b0HQWycDDWbR1hled2tNAnVq/+FCgN
         xdEAj7vCEOTfDrriwV2m+lIqs5V+P6LCH79Y74KQx+QccjflAVbKtCnIUkNP11wSznce
         /xhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z5R1tQR+LCn1Yz4++ikaigGAZJL9L+hwgmejnmiO7PY=;
        b=WEYFPr8rAHtR8IAEvVExeWEQEy2cZaTf7MrhqK+V0p+KJxHYwGlFKjhO1SJIwGPlIO
         SxC0XNfrm5EoJ8Whn9kDWFRifTNbfQ/WDKMy/b70jxIoUj8FORRHFeTb8lIp/4tuLiqT
         QfIEqWC3JqsvOScsfxj1bVOSBYcySbW8TomkvpZ3dqY1YHFAWAGcrn8JLyk9zxNF/urs
         z3CSzBygfs5o3sSDKMyU9TcPUYQS3omvlgE9ZEh525khoDEhppQIsj2BJLRmoVpOeCra
         dR2J7OAUXLkDoVR9FuXT/JNbB+gsymKM9xl6l2pqc/DJY3F/dpfzXRxsTkIFIW5Haa3W
         HRzQ==
X-Gm-Message-State: AOAM530HtHhcHS34THpYqq8NYICU615hsg4KMT135LzBY4lzmhst+Q35
        N2g6zH98OQRzDW0wzFx9gGM=
X-Google-Smtp-Source: ABdhPJyuLpvzy90YwTzlJ2Sv2qCtEINPz1Dpk1pb0oEfLEomcaAl6+CvAu+J7QnwjSM0fx2CFU2n4Q==
X-Received: by 2002:aa7:92c6:0:b029:2f1:3fbb:3171 with SMTP id k6-20020aa792c60000b02902f13fbb3171mr2968517pfa.0.1623080373547;
        Mon, 07 Jun 2021 08:39:33 -0700 (PDT)
Received: from localhost (185.212.56.112.16clouds.com. [185.212.56.112])
        by smtp.gmail.com with ESMTPSA id y138sm8955071pfc.11.2021.06.07.08.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 08:39:33 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     helgaas@kernel.org, corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        Sanket.Goswami@amd.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v7 3/4] i2c: designware: Use pcim_alloc_irq_vectors() to allocate IRQ vectors
Date:   Mon,  7 Jun 2021 23:39:15 +0800
Message-Id: <20210607153916.1021016-4-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210607153916.1021016-1-zhengdejin5@gmail.com>
References: <20210607153916.1021016-1-zhengdejin5@gmail.com>
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

Reviewed-by: Robert Richter <rric@kernel.org>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v6 -> v7:
	- rebase to PCI next branch
v5 -> v6:
	- rebase to 5.13-rc4
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
index 0f409a4c2da0..2b1ef0934445 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -268,7 +268,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	if (!dev)
 		return -ENOMEM;
 
-	r = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
+	r = pcim_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
 	if (r < 0)
 		return r;
 
@@ -283,10 +283,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 
 	if (controller->setup) {
 		r = controller->setup(pdev, controller);
-		if (r) {
-			pci_free_irq_vectors(pdev);
+		if (r)
 			return r;
-		}
 	}
 
 	i2c_dw_adjust_bus_speed(dev);
@@ -295,10 +293,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		i2c_dw_acpi_configure(&pdev->dev);
 
 	r = i2c_dw_validate_speed(dev);
-	if (r) {
-		pci_free_irq_vectors(pdev);
+	if (r)
 		return r;
-	}
 
 	i2c_dw_configure(dev);
 
@@ -318,10 +314,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	adap->nr = controller->bus_num;
 
 	r = i2c_dw_probe(dev);
-	if (r) {
-		pci_free_irq_vectors(pdev);
+	if (r)
 		return r;
-	}
 
 	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
 		r = navi_amd_register_client(dev);
@@ -349,7 +343,6 @@ static void i2c_dw_pci_remove(struct pci_dev *pdev)
 
 	i2c_del_adapter(&dev->adapter);
 	devm_free_irq(&pdev->dev, dev->irq, dev);
-	pci_free_irq_vectors(pdev);
 }
 
 /* work with hotplug and coldplug */
-- 
2.30.1

