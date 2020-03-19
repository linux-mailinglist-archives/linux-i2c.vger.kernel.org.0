Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E08318C1EC
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Mar 2020 21:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbgCSUxa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Mar 2020 16:53:30 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45128 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbgCSUx0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Mar 2020 16:53:26 -0400
Received: by mail-lj1-f193.google.com with SMTP id y17so4093271ljk.12;
        Thu, 19 Mar 2020 13:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AelAVnWjO2TZDh03p+etTscv6DSsKzERqQaVm4gt5ak=;
        b=O+b78U1nfcIo1RS1tvMDBcfw1TAWJl8cxp7U9EG18YFYrNj7rFftCLsGv4vGoD16zl
         ERlENrw0DZMt3OUEb1k6c34ZnFMcOKPaHRYJO8GTE1Frw8v2cA2AJ7nYnBKpMm8KhYIJ
         SAjwQAH6oEW0U3cymxr3mJ+cwLxJxps9uprqBTARG5DC7H2l6oV8kmtXP+UIkHKbhTD4
         1Fds2SHR+Z8DSOQoRzmbJ80lvmU8YzQWck6/k7EXk7fLFMVqSK+reJc1+m+FjbWFM/qg
         NJhS7p5w5UBqatUgUpYq3/te5vE3OMofX9UCpIWAJuiaWVENiyDY/4OI0RCkMvLwkdZY
         e7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AelAVnWjO2TZDh03p+etTscv6DSsKzERqQaVm4gt5ak=;
        b=k6JJsixkdarXG3C5qYxXLEZlsJBoa5jFrv6qf4uDc8+JQ0Kr74BsGAAtkLeTlMyggy
         WzFzowI4HVPyl4BrrQ5tih+24nQ+ITu9SIapW9phXtujBWKcEEolM3/UAexMl4K6CNd5
         t87UjMSsSqLHHEpD54UaizYr7PhvNCLTcWozHCgaddBahgyHAv/Rb0XLtM24aHFrdWul
         /Wfo5+kNsBEw2eGNbpctlWChbLUejl9XzePi0lG/hvJ7Yg24pmjP28PORfJ3C+tWVQaB
         haOIuIlKgjM8tk/AjD23jV5JaVNT1GkbC8qs8VGX7i20+lsSgBE0M/P/yaqJLmxpMjo/
         S1fg==
X-Gm-Message-State: ANhLgQ1Q6uJ2DG5RCID2Bfq5t9q4rDWEdKjDZDpjayCCtPq8O3MQXWVB
        oOso5FEDzsVBvl0m/RRa7d7KvfP4
X-Google-Smtp-Source: ADFU+vuGqzrmTu64yAZAiLe/kEBKHX3Qo3ZT2sTmWEcuAJe02y1rfzDVWSVrc6EH+nC+CGhU7inpjA==
X-Received: by 2002:a2e:9886:: with SMTP id b6mr3416833ljj.266.1584651203890;
        Thu, 19 Mar 2020 13:53:23 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.gmail.com with ESMTPSA id u10sm2108661ljk.56.2020.03.19.13.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 13:53:23 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Vinod Koul <vkoul@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] dmaengine: tegra-apb: Improve DMA synchronization
Date:   Thu, 19 Mar 2020 23:52:28 +0300
Message-Id: <20200319205228.8883-2-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200319205228.8883-1-digetx@gmail.com>
References: <20200319205228.8883-1-digetx@gmail.com>
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
 drivers/dma/tegra20-apb-dma.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 26f427e02369..d4a92714740c 100644
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
@@ -798,10 +802,29 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
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
 
@@ -1495,6 +1518,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 		tasklet_init(&tdc->tasklet, tegra_dma_tasklet,
 			     (unsigned long)tdc);
 		spin_lock_init(&tdc->lock);
+		init_waitqueue_head(&tdc->wq);
 
 		INIT_LIST_HEAD(&tdc->pending_sg_req);
 		INIT_LIST_HEAD(&tdc->free_sg_req);
-- 
2.25.1

