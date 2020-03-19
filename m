Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77A8418C1E5
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Mar 2020 21:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbgCSUx0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Mar 2020 16:53:26 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39242 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbgCSUx0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Mar 2020 16:53:26 -0400
Received: by mail-lf1-f67.google.com with SMTP id j15so2821956lfk.6;
        Thu, 19 Mar 2020 13:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VQOqpNHGnRKqa1sVk84jtgEeheH2BERwpE6r8gHxAwI=;
        b=Sl3qviOGUGcq21NwxmkMyha+skQwAVSa5SALUzxn2Ds40Mk6CdYbDlTvxemxMzyYPR
         ZzvqoF4kMign3pl2qO27q9vskJPFCdExM0ue7Vp9LBaDchDttasy3hF5bHSvzLGikWQD
         BpNIJvCyVd3k7ofcml0LcAHRjrI7Sq+aHGfskNVweF2Kz+a5Cxb+teB6sF/Avz9S9IhO
         USm2BIWEo+bUtGHnpdHJ5sBncpsMREt+XKjbDhkuYHHhfgWrtAuTc62Z82FozlEuVBRr
         Fp1tAF5pNDchv8w6+S3hKfldDZ4u6+sCIRxFofm1imtW0N6aA3T0PxMHJOnRs672qIY3
         wbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VQOqpNHGnRKqa1sVk84jtgEeheH2BERwpE6r8gHxAwI=;
        b=txomMYu7FKuQeMXd1y7bawoY3HuDmuwsWcEY8I3ShVH7usri+Xsp4AKlmIbsQyfFp/
         mRlhOrK3Izj7UOro1byL0v65gFY6HA9jfliURVMJazy3IT3hUawDhcJ0NQwyIPJL8Zto
         yNRyImD4Y8ONdSeQ2iYDfLQM4DO+cuHGPUaMBodY4/KkZ1LnTWwMTPQumcq4kF1fgpr+
         OMYNNd/ckNbWThgyw2e99qvWLf1mi3nc//X/+YV6oj3s6gSNDDIM8y9tOgZ7qMAionem
         mSCaRiutcLi+W5BjYDPV0uelD5dEBQ4bts233Ih36AejDsng3Cyzcs78oBBX0jMWulFO
         HT0Q==
X-Gm-Message-State: ANhLgQ23PvSnd9JRerXYUKz4XwBJJ/TQtOszqGc3gI9840AUyon8gcGD
        XyxA2w92fh8JQj5DQn6YToQ=
X-Google-Smtp-Source: ADFU+vsc3c/MwtGCczXQuWkx6DHW6qLqYcGdD+uVtu8ONWi4VFFUYKaZpRo12NRQRiDoVSOqOON5gA==
X-Received: by 2002:a19:5008:: with SMTP id e8mr2181030lfb.32.1584651202774;
        Thu, 19 Mar 2020 13:53:22 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.gmail.com with ESMTPSA id u10sm2108661ljk.56.2020.03.19.13.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 13:53:22 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Vinod Koul <vkoul@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dmaengine: tegra-apb: Don't save/restore IRQ flags in interrupt handler
Date:   Thu, 19 Mar 2020 23:52:27 +0300
Message-Id: <20200319205228.8883-1-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The interrupt is already disabled while interrupt handler is running, and
thus, there is no need to save/restore the IRQ flags within the spinlock.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/dma/tegra20-apb-dma.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 4e295d121be6..26f427e02369 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -672,10 +672,9 @@ static void tegra_dma_tasklet(unsigned long data)
 static irqreturn_t tegra_dma_isr(int irq, void *dev_id)
 {
 	struct tegra_dma_channel *tdc = dev_id;
-	unsigned long flags;
 	u32 status;
 
-	spin_lock_irqsave(&tdc->lock, flags);
+	spin_lock(&tdc->lock);
 
 	trace_tegra_dma_isr(&tdc->dma_chan, irq);
 	status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
@@ -683,11 +682,11 @@ static irqreturn_t tegra_dma_isr(int irq, void *dev_id)
 		tdc_write(tdc, TEGRA_APBDMA_CHAN_STATUS, status);
 		tdc->isr_handler(tdc, false);
 		tasklet_schedule(&tdc->tasklet);
-		spin_unlock_irqrestore(&tdc->lock, flags);
+		spin_unlock(&tdc->lock);
 		return IRQ_HANDLED;
 	}
 
-	spin_unlock_irqrestore(&tdc->lock, flags);
+	spin_unlock(&tdc->lock);
 	dev_info(tdc2dev(tdc), "Interrupt already served status 0x%08x\n",
 		 status);
 
-- 
2.25.1

