Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0C831ECFA
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Feb 2021 18:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233285AbhBRRLh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Feb 2021 12:11:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbhBRPHo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Feb 2021 10:07:44 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5246BC061794;
        Thu, 18 Feb 2021 07:05:23 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id f8so1404906plg.5;
        Thu, 18 Feb 2021 07:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gDQw0/8Ah6DAAnuC4tfOgLweLZLFJgkJo+lUVRcWr0E=;
        b=Zv8n1hO18ESYeeNpkWMIeO5GfC37Hd0xxnknbLELMqPld1g4ShosdhA9NaHeVRBo/W
         IGeBD0Pw9B2IrrPmx52WDU6ZRVk72wF1Mw3SCKcyfMxFXO0JR4IHhc/w9zNdgBw1c+D4
         nzkCkr7kE/y9NLUQwoS9sw7ILMwIx3FvaxWYx+2iwSs3Au2tMFY2PeDV+1XMtQZCFru7
         t0HgmyWttTPdo5PWNWV9RGHsLf/jRGQ01p4qs0cj2CBHJm02epfXxRy2PA4jZwE6qW01
         L56YkK7X7e8UUNG/bxvmU3L5IuLEeuZgilPaSnWm5HvWAVeoOicFjy2jKQ3biVgfPAh3
         L0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gDQw0/8Ah6DAAnuC4tfOgLweLZLFJgkJo+lUVRcWr0E=;
        b=luCR9hW837uwSppcTbPd8zE8WSkNR/ifPzdUoJ9ML2Nw2o8zDrKmwpGYB8gIIJGEEX
         3wWlCQ/AKj1qtMvY9WLie7PueAqOpz8je1WAo1guKhaSPAZ1bI5cVpUml7PjGImNJ5J5
         4PJUSxsO1PVqO/5H94Ndtiy2gADNXNfr8FeMabY/bSldeRWBGTr2JDCW9GODeesMNO+/
         kFfj4wNmOQB7+xMuW8bTKZlb5LWA/7AqaPkRcZrZ1wQEV2w5GL6Jyk8cZt2NxbnmyKi3
         ZrTDUUQyJX+QjoDMn2Xh8FUUcoPyKGgkckwcedhqN9TKvTBDrVKJazmbD9GanrQ/Zvvv
         sLiA==
X-Gm-Message-State: AOAM530i/d0PzCF8wZKaZiaeoxkGeOB63iad0VT5MknxTNud1kOvlH7Q
        kHNDcQHW9v7PHMJvZbQ98IVcaRX/qjsMUw==
X-Google-Smtp-Source: ABdhPJwUO3eNJCDhvCLC2wCC0wRPdXTo3dJMQFKQLX7vnOmE/k5gLgpZ+kSWFP3L5VsY02JJyi+syA==
X-Received: by 2002:a17:90a:aa0d:: with SMTP id k13mr4609841pjq.210.1613660722893;
        Thu, 18 Feb 2021 07:05:22 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id i1sm6638269pfq.158.2021.02.18.07.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 07:05:22 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v4 4/4] i2c: thunderx: Use the correct name of device-managed function
Date:   Thu, 18 Feb 2021 23:04:58 +0800
Message-Id: <20210218150458.798347-5-zhengdejin5@gmail.com>
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
with pcim_alloc_irq_vectors().

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v3 -> v4:
	- No change.
v2 -> v3:
	- No change.
v1 -> v2:
	- Modify some commit messages.
 drivers/i2c/busses/i2c-thunderx-pcidrv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
index 12c90aa0900e..63354e9fb726 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -192,7 +192,7 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 	i2c->hlc_int_enable = thunder_i2c_hlc_int_enable;
 	i2c->hlc_int_disable = thunder_i2c_hlc_int_disable;
 
-	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSIX);
+	ret = pcim_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSIX);
 	if (ret < 0)
 		goto error;
 
-- 
2.25.0

