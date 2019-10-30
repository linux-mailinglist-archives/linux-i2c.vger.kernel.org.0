Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D720EA058
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Oct 2019 16:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbfJ3Pzo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Oct 2019 11:55:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:57288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728645AbfJ3Pzm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 30 Oct 2019 11:55:42 -0400
Received: from sasha-vm.mshome.net (100.50.158.77.rev.sfr.net [77.158.50.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C07A92173E;
        Wed, 30 Oct 2019 15:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572450941;
        bh=ajrQFUpHfoZrFxmZ57IP0Y32djqaiWekFynq+8+EYS8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xikIvcNKjV59W4m+PWW+O/Crf4wBCAQfMtc9qb894kpXhEThH9iruisqhzMH4/wjn
         mJmz2w3r3ypuBP5Nm2gIH+8ar+OzOaLu9lAl2y2LFordD4d9JvZCpfc9GpoRUEWiZF
         Wh3HJLdo1U05VnPn/5ok1u35IVixU0PftjOpNTZc=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Fabrice Gasnier <fabrice.gasnier@st.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sasha Levin <sashal@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 33/38] i2c: stm32f7: fix a race in slave mode with arbitration loss irq
Date:   Wed, 30 Oct 2019 11:54:01 -0400
Message-Id: <20191030155406.10109-33-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191030155406.10109-1-sashal@kernel.org>
References: <20191030155406.10109-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Fabrice Gasnier <fabrice.gasnier@st.com>

[ Upstream commit 6d6b0d0d5afc8c4c84b08261260ba11dfa5206f2 ]

When in slave mode, an arbitration loss (ARLO) may be detected before the
slave had a chance to detect the stop condition (STOPF in ISR).
This is seen when two master + slave adapters switch their roles. It
provokes the i2c bus to be stuck, busy as SCL line is stretched.
- the I2C_SLAVE_STOP event is never generated due to STOPF flag is set but
  don't generate an irq (race with ARLO irq, STOPIE is masked). STOPF flag
  remains set until next master xfer (e.g. when STOPIE irq get unmasked).
  In this case, completion is generated too early: immediately upon new
  transfer request (then it doesn't send all data).
- Some data get stuck in TXDR register. As a consequence, the controller
  stretches the SCL line: the bus gets busy until a future master transfer
  triggers the bus busy / recovery mechanism (this can take time... and
  may never happen at all)

So choice is to let the STOPF being detected by the slave isr handler,
to properly handle this stop condition. E.g. don't mask IRQs in error
handler, when the slave is running.

Fixes: 60d609f30de2 ("i2c: i2c-stm32f7: Add slave support")
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-stm32f7.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 48521bc8a4d23..362b23505f214 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1488,7 +1488,7 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
 	void __iomem *base = i2c_dev->base;
 	struct device *dev = i2c_dev->dev;
 	struct stm32_i2c_dma *dma = i2c_dev->dma;
-	u32 mask, status;
+	u32 status;
 
 	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);
 
@@ -1513,12 +1513,15 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
 		f7_msg->result = -EINVAL;
 	}
 
-	/* Disable interrupts */
-	if (stm32f7_i2c_is_slave_registered(i2c_dev))
-		mask = STM32F7_I2C_XFER_IRQ_MASK;
-	else
-		mask = STM32F7_I2C_ALL_IRQ_MASK;
-	stm32f7_i2c_disable_irq(i2c_dev, mask);
+	if (!i2c_dev->slave_running) {
+		u32 mask;
+		/* Disable interrupts */
+		if (stm32f7_i2c_is_slave_registered(i2c_dev))
+			mask = STM32F7_I2C_XFER_IRQ_MASK;
+		else
+			mask = STM32F7_I2C_ALL_IRQ_MASK;
+		stm32f7_i2c_disable_irq(i2c_dev, mask);
+	}
 
 	/* Disable dma */
 	if (i2c_dev->use_dma) {
-- 
2.20.1

