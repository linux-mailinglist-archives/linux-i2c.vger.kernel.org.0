Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62B6939CDCC
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Jun 2021 09:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhFFHHT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Jun 2021 03:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbhFFHHT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Jun 2021 03:07:19 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A13C061766;
        Sun,  6 Jun 2021 00:05:30 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id n12so11321785pgs.13;
        Sun, 06 Jun 2021 00:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wu9gAwlAOwgKiPmTDPbi3wWguWilh1MHvLSLhPDONu4=;
        b=Oef098bUXUmCFjfJdLdw3CRK0xzTkHa7Xwq8DgY7PtmZYyaDguYw22UNe/f7dJmmVd
         XtF/lMEmL1M3tB+XFuctn/HFVfirB5JS94/45WzcvUrouktg6lGp8yz0ryeKs/z50cwY
         W6r5MHozgBDCYYzCDb55tQk6UIuqU5imqjA21yCSVwEYydlQFXdtYGC4GULATkFloCxo
         kgx8Atfzl0GPHAWcPOoeEJoPU+6j3XWqWx7eIHid4nAgyw6/Tb3UWoz4/k0QbBVCEbq2
         fcSZL053MlwOO7L+EFqNbfOfAyja7WfhAjrc3j19m59sBhG+C1Z8ofHIT8S/ijDY8131
         hV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wu9gAwlAOwgKiPmTDPbi3wWguWilh1MHvLSLhPDONu4=;
        b=VtN9yi7HBZqlKBuWlekcYc07FTZAH6cNhB0tX4l7dhdLAzNcmiD8CXT8VZYlmB62h4
         m04BWZbtokwRP/ztEfak+VtmL5DS1RdxOyKprEM9C6LCqD0w/ky4s2T9XIzjxRcrHyiP
         nYMKxxHGOe8SeeKtWUZ+Yk/4QxMUBPMJVP5kxDHCxgasPntAqpToblK6xXng74a9vrVP
         ZMwIYx/I1BqoipH08VOyWuc1tS8RR9ravCtfG5mG8v9bqonK/uwb3zIISAZRZiOZ+rNB
         BwN/mb7TL2F6kBLTqmfXLgdENgRiTPAWAYMLmsPbWkxs3d3n5hSkqhJLcy9Qp1GhxmdA
         EhMQ==
X-Gm-Message-State: AOAM532SEJLi3eWLcQseqitl8ZGkNobIhDi6luDJAJVhDxFAIb1Vknec
        Z1JyOO8uSZTLFPH9znIV4zw=
X-Google-Smtp-Source: ABdhPJx8MzSJB7AjQGaenY8cmsSrTjG4AD6oVrcO5Gg4F+DIdVlxhFKTTN0ZeCD4WSIMHimnZFayhw==
X-Received: by 2002:a62:5288:0:b029:2e3:fd7d:267a with SMTP id g130-20020a6252880000b02902e3fd7d267amr12260409pfb.21.1622963128174;
        Sun, 06 Jun 2021 00:05:28 -0700 (PDT)
Received: from localhost (185.212.56.112.16clouds.com. [185.212.56.112])
        by smtp.gmail.com with ESMTPSA id s13sm207808pgi.36.2021.06.06.00.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 00:05:27 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     helgaas@kernel.org, corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v6 3/4] i2c: designware: Use pcim_alloc_irq_vectors() to allocate IRQ vectors
Date:   Sun,  6 Jun 2021 15:05:10 +0800
Message-Id: <20210606070511.778487-4-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210606070511.778487-1-zhengdejin5@gmail.com>
References: <20210606070511.778487-1-zhengdejin5@gmail.com>
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

