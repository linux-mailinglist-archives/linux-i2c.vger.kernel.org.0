Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 187AE18C240
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Mar 2020 22:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgCSV0C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Mar 2020 17:26:02 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37867 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgCSV0C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Mar 2020 17:26:02 -0400
Received: by mail-lj1-f194.google.com with SMTP id r24so4243079ljd.4;
        Thu, 19 Mar 2020 14:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z4IO8ENXk0KjsRmj8QLceInBq65YCsGmqnDAFXJ2Hh8=;
        b=tmJBnID9vtNbTyoAAqXu80oYzkmLTydbgebWsotIjSYo/0/UsdJGsOF2IDJg+lNllf
         3wb4xCK3eJqX2Y033fizTnWXDuvshOJ1WaLP6Cj/wV+QPcEJw9dICHeLjTnVgt4VNyIu
         g4wUBUwclI8UQpRfJ1t9XdKbakUbWzFty0r76VFk3krYNK81cy8cdSyRxwzrZvs9yQKb
         UjEponR2OKngLfzHyLKj/AdX7z0MG/mT5OETY+U8O2iEtITDGYVmpPBxn9vAxEFdQv6e
         B+i4+4ZxFVt4t98h1HLo4qGNRfpBwhrlQC18U59coDKtjB4WR6LfOijTVQHElaE2SQCc
         DQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z4IO8ENXk0KjsRmj8QLceInBq65YCsGmqnDAFXJ2Hh8=;
        b=bi7j8iy8fl6r/mo5Od3RHwHJpCjD8TjdMSl9+G5osmoiuxuSO9cUyk7fBx19kXul4P
         J/E7lGloNZnqfd/DgIPeD5LpCeAvLrZOqvZZZrqj+3e9Lui6gP+uhmkF+nYVOxRlEnPI
         pYV1TG8CRRughush+vNORNyMY/zJf0Zotqe6wfx1IxuSeReP5kBjb6USvHR4oCFNsZUn
         ugwwrwdUNRdudl81j3JD01ByimPkDLoK9mpiK3vUy3FXEEd65kVFIi+8Ws2LX4+mPoSh
         kA5oSgp5dH0kO6zmCiKeKXCoq9o/xn867zHcH+L3ohry/JbDn4Zmg4tRsCOuT8Wvpg7g
         b0Cg==
X-Gm-Message-State: ANhLgQ3LYjaanr1GJNZz4ar0e3L1MvuBG9HYnznkLFvgOSGLH2/QN+LN
        e88cemf98rnQx9ntuExq8bNfqudL
X-Google-Smtp-Source: ADFU+vvrVJQK0Fka9AApNbfI/VDFR8kqhvnBWF7NEmsH9E1AeQhDIOySkk2Hg8ZEFnDGCtsQmRh53w==
X-Received: by 2002:a2e:86c6:: with SMTP id n6mr3437331ljj.46.1584653160213;
        Thu, 19 Mar 2020 14:26:00 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.gmail.com with ESMTPSA id c20sm2284868lfb.60.2020.03.19.14.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 14:25:59 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Vinod Koul <vkoul@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dmaengine: tegra-apb: Don't save/restore IRQ flags in interrupt handler
Date:   Fri, 20 Mar 2020 00:23:20 +0300
Message-Id: <20200319212321.3297-1-digetx@gmail.com>
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

Changelog:

v2: No change.

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

