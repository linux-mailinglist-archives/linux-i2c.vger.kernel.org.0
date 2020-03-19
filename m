Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E69D018C242
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Mar 2020 22:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgCSV0E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Mar 2020 17:26:04 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37935 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgCSV0D (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Mar 2020 17:26:03 -0400
Received: by mail-lj1-f193.google.com with SMTP id w1so4224891ljh.5;
        Thu, 19 Mar 2020 14:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W81z2712/lsE16oa/wUCtdkr9O7SpuC8HdK7sVnpBuA=;
        b=YCr4LtsXbY+j9Mu+UKGLAVyheYWc4A9sf4TyM+53RvhgsOefh2kAWLATvFt2Qs5DJC
         E9eDCxi6ePlc6W6wmzqwgUnUtK9XMzVcsZvuen46kWIre39h29FqmzOj2lzoQPPVciVM
         TE5Nv4sw/ZA6CltouBy29rOPWYqHnWk3Bx5R1UYko9a1HUxM6sek084H8L12iyRqJo22
         bRuwkzttpgwBcO83lPBJnhFf/Ru76LdQBwgldsdyCtfvDorHKAIHp7csPhLutxaLiTOE
         JCKO4a+QFM21qSVyacJ+nctMYM5tgI0iMHQIW3qoknkQVYazbO3/Thf9uF6H6N1KLZDg
         0Usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W81z2712/lsE16oa/wUCtdkr9O7SpuC8HdK7sVnpBuA=;
        b=jP9t0707TG6dj+iNdC5atFAjAKZRqoTnuwalI/Z+YwqG4hGyvIJfbnqt1cglYGKQdW
         O8My2s4kt2g0JcrupmI8gHK1JoWFAUr6elaPfpLRMhcBp6nNpSX9gaKm13meGSGYEhzq
         qa/QKb6AtkJgzdLOSM0Ma0SKEY/aRPf7GDEID0sUDJ7X3tqEr79tuL/5H6j94WYRX8MR
         nvkvWFsWDZwois9sELhglMtSb55geLSpMu95nj867e/gaEOccGYScNFthSHLpupXgJqa
         ZWcQx+gSkjV89ERfzplpXLXXLI4rPTRq0MAZ/wjJ/CaB1uOPUfuxlaFYfc3Z1QU8WjWv
         1vTQ==
X-Gm-Message-State: ANhLgQ3lHqrsej747mWdEbpErd77F4/1VGG/fkVYdlYyelnDzq4LUqSa
        /bAqKeWrLpxOgLjI8I+F898=
X-Google-Smtp-Source: ADFU+vvuZ11n+CSlzYp2aiIGYP25euKNdsnajGEsOijGFD2PWVpYzI0izyM9RuLR1ARTBSOg3MsC1Q==
X-Received: by 2002:a05:651c:10e:: with SMTP id a14mr3385178ljb.134.1584653161240;
        Thu, 19 Mar 2020 14:26:01 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.gmail.com with ESMTPSA id c20sm2284868lfb.60.2020.03.19.14.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 14:26:00 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Vinod Koul <vkoul@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dmaengine: tegra-apb: Improve DMA synchronization
Date:   Fri, 20 Mar 2020 00:23:21 +0300
Message-Id: <20200319212321.3297-2-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200319212321.3297-1-digetx@gmail.com>
References: <20200319212321.3297-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Boot CPU0 always handles DMA interrupts and under some rare circumstances
it could stuck in uninterruptible state for a significant time (like in a
case of KASAN + NFS root). In this case sibling CPU, which waits for DMA
transfer completion, will get a DMA transfer timeout. In order to handle
this rare condition, interrupt status needs to be polled until interrupt
is handled.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: Added forgotten wake_up_all() to tegra_dma_terminate_all(), which
    will wake up waiting threads after transfer's abortion.

 drivers/dma/tegra20-apb-dma.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 26f427e02369..733fda4e7e45 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -24,6 +24,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/wait.h>
 
 #include "dmaengine.h"
 
@@ -202,6 +203,8 @@ struct tegra_dma_channel {
 	unsigned int slave_id;
 	struct dma_slave_config dma_sconfig;
 	struct tegra_dma_channel_regs channel_reg;
+
+	struct wait_queue_head wq;
 };
 
 /* tegra_dma: Tegra DMA specific information */
@@ -682,6 +685,7 @@ static irqreturn_t tegra_dma_isr(int irq, void *dev_id)
 		tdc_write(tdc, TEGRA_APBDMA_CHAN_STATUS, status);
 		tdc->isr_handler(tdc, false);
 		tasklet_schedule(&tdc->tasklet);
+		wake_up_all(&tdc->wq);
 		spin_unlock(&tdc->lock);
 		return IRQ_HANDLED;
 	}
@@ -783,6 +787,7 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
 	tegra_dma_resume(tdc);
 
 	pm_runtime_put(tdc->tdma->dev);
+	wake_up_all(&tdc->wq);
 
 skip_dma_stop:
 	tegra_dma_abort_all(tdc);
@@ -798,10 +803,29 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
 	return 0;
 }
 
+static bool tegra_dma_eoc_interrupt_deasserted(struct tegra_dma_channel *tdc)
+{
+	unsigned long flags;
+	u32 status;
+
+	spin_lock_irqsave(&tdc->lock, flags);
+	status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
+	spin_unlock_irqrestore(&tdc->lock, flags);
+
+	return !(status & TEGRA_APBDMA_STATUS_ISE_EOC);
+}
+
 static void tegra_dma_synchronize(struct dma_chan *dc)
 {
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
 
+	/*
+	 * CPU, which handles interrupt, could be busy in
+	 * uninterruptible state, in this case sibling CPU
+	 * should wait until interrupt is handled.
+	 */
+	wait_event(tdc->wq, tegra_dma_eoc_interrupt_deasserted(tdc));
+
 	tasklet_kill(&tdc->tasklet);
 }
 
@@ -1495,6 +1519,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 		tasklet_init(&tdc->tasklet, tegra_dma_tasklet,
 			     (unsigned long)tdc);
 		spin_lock_init(&tdc->lock);
+		init_waitqueue_head(&tdc->wq);
 
 		INIT_LIST_HEAD(&tdc->pending_sg_req);
 		INIT_LIST_HEAD(&tdc->free_sg_req);
-- 
2.25.1

