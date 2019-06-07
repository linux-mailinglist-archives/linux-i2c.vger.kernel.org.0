Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55DFB3897E
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 13:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728946AbfFGLzg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 07:55:36 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:16089 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728964AbfFGLzf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 07:55:35 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cfa50b40001>; Fri, 07 Jun 2019 04:55:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 07 Jun 2019 04:55:34 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 07 Jun 2019 04:55:34 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 11:55:34 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 7 Jun 2019 11:55:34 +0000
Received: from dhcp-10-19-65-14.client.nvidia.com (Not Verified[10.19.65.14]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cfa50b30000>; Fri, 07 Jun 2019 04:55:34 -0700
From:   Bitan Biswas <bbiswas@nvidia.com>
To:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Osipenko <digetx@gmail.com>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V1 6/6] i2c: tegra: remove BUG, BUG_ON
Date:   Fri, 7 Jun 2019 04:55:07 -0700
Message-ID: <1559908507-31192-6-git-send-email-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559908507-31192-1-git-send-email-bbiswas@nvidia.com>
References: <1559908507-31192-1-git-send-email-bbiswas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559908532; bh=1KF7I2XxeE4S46ZIJpD3Hl231pnB7gPNBtrprmStcHo=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=Acl8jG+6slfPJzF8dGXiItn/+BSRY57JZe0SQCT4sWyE6atwi7yfcBlcQQYxgZ09t
         dr/CRa36lmRb7GJ835olJrm4FIRBczWh0is5HE4Xf28Q3rv8d71/7WEJzFtGU1HdZR
         WX4zxd+dWWoXcLJNXY46Xpv5UPMd6XP/4VM0zZ6v8ze/PNsyib/XT3omB23Ok8sIW6
         BNjHt6OFlztHCvm4WWyECgyUfySkROCC7HEwdg7RBdiBtRqI77vxq2gzLdxb+f9Ipo
         88ZfQ2VMwaR3JIbJqBW5GdpuEBfCT7cizFCHt7MfqyWwAcnXC+soLrEqfKwBYLRMi9
         PmH5ZQbY8Eljw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
as needed. Replace BUG() with error handling code.
Define I2C_ERR_UNEXPECTED_STATUS for error handling.

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4dfb4c1..c407bd7 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -73,6 +73,7 @@
 #define I2C_ERR_NO_ACK				BIT(0)
 #define I2C_ERR_ARBITRATION_LOST		BIT(1)
 #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
+#define I2C_ERR_UNEXPECTED_STATUS		BIT(3)
 
 #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
 #define PACKET_HEADER0_PACKET_ID_SHIFT		16
@@ -515,7 +516,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 	 * prevent overwriting past the end of buf
 	 */
 	if (rx_fifo_avail > 0 && buf_remaining > 0) {
-		BUG_ON(buf_remaining > 3);
 		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
 		val = cpu_to_le32(val);
 		memcpy(buf, &val, buf_remaining);
@@ -523,7 +523,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 		rx_fifo_avail--;
 	}
 
-	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
 	i2c_dev->msg_buf_remaining = buf_remaining;
 	i2c_dev->msg_buf = buf;
 
@@ -581,7 +580,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 	 * boundary and fault.
 	 */
 	if (tx_fifo_avail > 0 && buf_remaining > 0) {
-		BUG_ON(buf_remaining > 3);
 		memcpy(&val, buf, buf_remaining);
 		val = le32_to_cpu(val);
 
@@ -847,10 +845,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 
 	if (!i2c_dev->is_curr_dma_xfer) {
 		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
-			if (i2c_dev->msg_buf_remaining)
+			if (i2c_dev->msg_buf_remaining) {
 				tegra_i2c_empty_rx_fifo(i2c_dev);
-			else
-				BUG();
+			} else {
+				dev_err(i2c_dev->dev, "unexpected rx data request\n");
+				i2c_dev->msg_err |= I2C_ERR_UNEXPECTED_STATUS;
+				goto err;
+			}
 		}
 
 		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
@@ -876,7 +877,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
 		if (i2c_dev->is_curr_dma_xfer)
 			i2c_dev->msg_buf_remaining = 0;
-		BUG_ON(i2c_dev->msg_buf_remaining);
+		WARN_ON_ONCE(i2c_dev->msg_buf_remaining);
 		complete(&i2c_dev->msg_complete);
 	}
 	goto done;
-- 
2.7.4

