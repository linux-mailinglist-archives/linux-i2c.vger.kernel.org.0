Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7D2FF08D
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Nov 2019 17:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731093AbfKPQG2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Nov 2019 11:06:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:59158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730625AbfKPPut (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 16 Nov 2019 10:50:49 -0500
Received: from sasha-vm.mshome.net (unknown [50.234.116.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 76AFC21826;
        Sat, 16 Nov 2019 15:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573919448;
        bh=vBFYOrfj1IE1io4Th6lrRDVblv4ioYm1LhZ/3QjbwXI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QDjgWBGjDjiT8pQN0bIj08BqOXQlRlGns4YaOjGmit/SeFgrZiDF/6jVJiOxxZrCg
         jelsM9pQL6Eqpu8ZPIIEsB8DSkoNuiqTxFKIfQStsRFbS9Q1DFZ4YMv+sJLpL8ZYYU
         WqR3k8PMR+Twxw6LrOjxVyVWaWIr1dohm2vPVL+0=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sasha Levin <sashal@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 147/150] i2c: uniphier-f: fix timeout error after reading 8 bytes
Date:   Sat, 16 Nov 2019 10:47:25 -0500
Message-Id: <20191116154729.9573-147-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191116154729.9573-1-sashal@kernel.org>
References: <20191116154729.9573-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Masahiro Yamada <yamada.masahiro@socionext.com>

[ Upstream commit c2a653deaa81f5a750c0dfcbaf9f8e5195cbe4a5 ]

I was totally screwed up in commit eaba68785c2d ("i2c: uniphier-f:
fix race condition when IRQ is cleared"). Since that commit, if the
number of read bytes is multiple of the FIFO size (8, 16, 24... bytes),
the STOP condition could be issued twice, depending on the timing.
If this happens, the controller will go wrong, resulting in the timeout
error.

It was more than 3 years ago when I wrote this driver, so my memory
about this hardware was vague. Please let me correct the description
in the commit log of eaba68785c2d.

Clearing the IRQ status on exiting the IRQ handler is absolutely
fine. This controller makes a pause while any IRQ status is asserted.
If the IRQ status is cleared first, the hardware may start the next
transaction before the IRQ handler finishes what it supposed to do.

This partially reverts the bad commit with clear comments so that I
will never repeat this mistake.

I also investigated what is happening at the last moment of the read
mode. The UNIPHIER_FI2C_INT_RF interrupt is asserted a bit earlier
(by half a period of the clock cycle) than UNIPHIER_FI2C_INT_RB.

I consulted a hardware engineer, and I got the following information:

UNIPHIER_FI2C_INT_RF
    asserted at the falling edge of SCL at the 8th bit.

UNIPHIER_FI2C_INT_RB
    asserted at the rising edge of SCL at the 9th (ACK) bit.

In order to avoid calling uniphier_fi2c_stop() twice, check the latter
interrupt. I also commented this because it is obscure hardware internal.

Fixes: eaba68785c2d ("i2c: uniphier-f: fix race condition when IRQ is cleared")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-uniphier-f.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-uniphier-f.c b/drivers/i2c/busses/i2c-uniphier-f.c
index 928ea9930d17e..dd0687e36a47b 100644
--- a/drivers/i2c/busses/i2c-uniphier-f.c
+++ b/drivers/i2c/busses/i2c-uniphier-f.c
@@ -173,8 +173,6 @@ static irqreturn_t uniphier_fi2c_interrupt(int irq, void *dev_id)
 		"interrupt: enabled_irqs=%04x, irq_status=%04x\n",
 		priv->enabled_irqs, irq_status);
 
-	uniphier_fi2c_clear_irqs(priv, irq_status);
-
 	if (irq_status & UNIPHIER_FI2C_INT_STOP)
 		goto complete;
 
@@ -214,7 +212,13 @@ static irqreturn_t uniphier_fi2c_interrupt(int irq, void *dev_id)
 
 	if (irq_status & (UNIPHIER_FI2C_INT_RF | UNIPHIER_FI2C_INT_RB)) {
 		uniphier_fi2c_drain_rxfifo(priv);
-		if (!priv->len)
+		/*
+		 * If the number of bytes to read is multiple of the FIFO size
+		 * (msg->len == 8, 16, 24, ...), the INT_RF bit is set a little
+		 * earlier than INT_RB. We wait for INT_RB to confirm the
+		 * completion of the current message.
+		 */
+		if (!priv->len && (irq_status & UNIPHIER_FI2C_INT_RB))
 			goto data_done;
 
 		if (unlikely(priv->flags & UNIPHIER_FI2C_MANUAL_NACK)) {
@@ -253,6 +257,13 @@ static irqreturn_t uniphier_fi2c_interrupt(int irq, void *dev_id)
 	}
 
 handled:
+	/*
+	 * This controller makes a pause while any bit of the IRQ status is
+	 * asserted. Clear the asserted bit to kick the controller just before
+	 * exiting the handler.
+	 */
+	uniphier_fi2c_clear_irqs(priv, irq_status);
+
 	spin_unlock(&priv->lock);
 
 	return IRQ_HANDLED;
-- 
2.20.1

