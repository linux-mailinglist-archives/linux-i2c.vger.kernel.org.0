Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE0B39CDD3
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Jun 2021 09:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbhFFHIj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Jun 2021 03:08:39 -0400
Received: from mail-pf1-f170.google.com ([209.85.210.170]:34539 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbhFFHIi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Jun 2021 03:08:38 -0400
Received: by mail-pf1-f170.google.com with SMTP id g6so10732378pfq.1;
        Sun, 06 Jun 2021 00:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J66R96VtW8mDJcT/ONY8la0SES4Mp5OfgngGRV1e+uk=;
        b=ltrbs7IsuU4rxW0IuBq8ZcSDmgXcvj6QkaagoafdrzFvzuunQ546pBuc4JU1gJGyOZ
         /bbDkmXHzMlZhE8neVmq0/T5o27L9UkrvZCagQEtrJyGtpJ3tPZOqTYQ90pFxgrQ42iU
         4ibBiG3yumJmfZbBSTUooG0seI1RIVLo5Ci7Klpm0IxlIbengCS7ZrTvlcNQqd+gKNNO
         inOWm6zANk+GJ8zwgFziPS/eh7HTHFBBS4iIctNnbQMqviPgFnUNKluD4r9oxGPZqjuc
         aVDTYjoGtgB3+6IIuyllodJtjRrQp+4UaznGaqmQSgbT2wgKFWhsNg2GJ5h/ZB9TCE4C
         sQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J66R96VtW8mDJcT/ONY8la0SES4Mp5OfgngGRV1e+uk=;
        b=QTkNLVQ/de+VvsVMloUevdxnivMxVKpLp+DINOpEwffP0hSECsWvUV/BcAHqzTQYP1
         Oxksxm+UTq/AjN6bnXtQvXoPZxG1T96FUEtPMCs/p0dxNXYnUbJCfmAzyXuY+/dxyqzr
         GKtBdl+4F17V0AShP7mDR6xr7U1nIgozBbfrcMd+JBBO5Ni/Lazgt8PRPTJtdY3/8nX9
         PM+Cy0+Xg7sSQKOTpkdW+xtDTkK2APhKsLIw230zAsMHjxS/j2fbvuasXC0BgGSeYfHj
         B9i4xdu4KcQAADZY1zezHrPgf5HAEvpDo+kxfuHGOciXVZA57IzGUaW6y9fvOVwm0S3G
         kZpw==
X-Gm-Message-State: AOAM530GWK/4k5/XQkwb6U/S7/4FJnJeixxcArR+8VwHXFzwfESn8vBA
        gmDMuXZ+4SnzeWzgBk1KcPA=
X-Google-Smtp-Source: ABdhPJx7OClakPR3VGNnt9/EOTYx/4ErJNqw79iJSYkGFxZ20rHXgLaRwkw1G7FKE/PNubW2gD18pQ==
X-Received: by 2002:a62:1743:0:b029:2ef:6014:62d5 with SMTP id 64-20020a6217430000b02902ef601462d5mr1375817pfx.63.1622963133427;
        Sun, 06 Jun 2021 00:05:33 -0700 (PDT)
Received: from localhost (185.212.56.112.16clouds.com. [185.212.56.112])
        by smtp.gmail.com with ESMTPSA id k9sm5735976pgq.27.2021.06.06.00.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 00:05:33 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     helgaas@kernel.org, corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v6 4/4] i2c: thunderx: Use pcim_alloc_irq_vectors() to allocate IRQ vectors
Date:   Sun,  6 Jun 2021 15:05:11 +0800
Message-Id: <20210606070511.778487-5-zhengdejin5@gmail.com>
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
with pcim_alloc_irq_vectors().

Acked-by: Robert Richter <rric@kernel.org>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v5 -> v6:
	- rebase to 5.13-rc4
v4 -> v5:
	- Modify the subject name.
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
2.30.1

