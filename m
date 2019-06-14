Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93E8E4635E
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 17:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbfFNPus (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 11:50:48 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:7989 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfFNPur (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jun 2019 11:50:47 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d03c2550000>; Fri, 14 Jun 2019 08:50:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 14 Jun 2019 08:50:45 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 14 Jun 2019 08:50:45 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 15:50:44 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 15:50:44 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 14 Jun 2019 15:50:44 +0000
Received: from dhcp-10-19-65-14.client.nvidia.com (Not Verified[10.19.65.14]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d03c2510004>; Fri, 14 Jun 2019 08:50:44 -0700
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
        "Bitan Biswas" <bbiswas@nvidia.com>
Subject: [PATCH V6] i2c: tegra: remove BUG, BUG_ON
Date:   Fri, 14 Jun 2019 08:50:38 -0700
Message-ID: <1560527438-30150-1-git-send-email-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560527445; bh=k0/FGNhaiuQT5uSJnlKbfm8ntLZBEkYD5mjmowbcmhs=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=L940xIttGTR88qLZX/7zwora/nJJ5LqctM4jkPX9fs0rndxmogIcUidCL0JxXThB9
         EjEgcxDwvv6v2PeXYI5/kOCE9xIpAflqqYEvRmu+43oYnaWyWTPSbGNE+fIiOcaKSR
         l2MC4IkquN4Rw1ABBYICteQUGV86g0K6nuh4xhG7qAwkOrTZtXBPdi4qXsvebG3wAo
         moJCaTwp0R7z6iittCZPQ9+Ce9sfNWmUFrzbYtcqwUhqjXGiQOqWmSbSlznK8iFvyx
         KNiBqJUTpOOW5ytRhIJxo9vZas/C+flKAeHO/65W2SArXd7ys3bdIRBpJSTu9tCuC8
         XjGRiOCatzqFQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
as needed. Remove BUG() and mask Rx interrupt similar as Tx
for message fully sent case. Add WARN_ON_ONCE check
for non-zero rx_fifo_avail in tegra_i2c_empty_rx_fifo()
after all processing. Error handling in tegra_i2c_empty_rx_fifo
caller is also added.

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 46 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4dfb4c1..26a7c8c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -73,6 +73,7 @@
 #define I2C_ERR_NO_ACK				BIT(0)
 #define I2C_ERR_ARBITRATION_LOST		BIT(1)
 #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
+#define I2C_ERR_UNEXPECTED_STATUS		BIT(3)
 
 #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
 #define PACKET_HEADER0_PACKET_ID_SHIFT		16
@@ -515,15 +516,23 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 	 * prevent overwriting past the end of buf
 	 */
 	if (rx_fifo_avail > 0 && buf_remaining > 0) {
-		BUG_ON(buf_remaining > 3);
+		/* buf_remaining > 3 check not needed as rx_fifo_avail == 0
+		 * when (words_to_transfer was > rx_fifo_avail) earlier
+		 * in this function
+		 */
 		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
 		val = cpu_to_le32(val);
 		memcpy(buf, &val, buf_remaining);
 		buf_remaining = 0;
 		rx_fifo_avail--;
 	}
+	if (WARN_ON_ONCE(rx_fifo_avail))
+		return -EINVAL;
 
-	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
+	/* buf_remaining > 0 at this point can only have rx_fifo_avail == 0
+	 * as this corresponds to (words_to_transfer was > rx_fifo_avail)
+	 * case earlier in this function
+	 */
 	i2c_dev->msg_buf_remaining = buf_remaining;
 	i2c_dev->msg_buf = buf;
 
@@ -581,7 +590,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 	 * boundary and fault.
 	 */
 	if (tx_fifo_avail > 0 && buf_remaining > 0) {
-		BUG_ON(buf_remaining > 3);
+		/* buf_remaining > 3 check not needed as tx_fifo_avail == 0
+		 * when (words_to_transfer was > tx_fifo_avail) earlier
+		 * in this function for non-zero words_to_transfer
+		 */
 		memcpy(&val, buf, buf_remaining);
 		val = le32_to_cpu(val);
 
@@ -811,6 +823,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	u32 status;
 	const u32 status_err = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	struct tegra_i2c_dev *i2c_dev = dev_id;
+	int err_val;
 
 	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
@@ -847,10 +860,21 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 
 	if (!i2c_dev->is_curr_dma_xfer) {
 		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
-			if (i2c_dev->msg_buf_remaining)
-				tegra_i2c_empty_rx_fifo(i2c_dev);
-			else
-				BUG();
+			err_val = tegra_i2c_empty_rx_fifo(i2c_dev);
+			if ((!(i2c_dev->msg_buf_remaining)) &&
+			    (!(status & I2C_INT_PACKET_XFER_COMPLETE)) &&
+			    err_val) {
+				/*
+				 * Overflow error condition: message fully sent,
+				 * with no XFER_COMPLETE interrupt but hardware
+				 * asks to transfer more.
+				 */
+				tegra_i2c_mask_irq(i2c_dev,
+						   I2C_INT_RX_FIFO_DATA_REQ);
+				i2c_dev->msg_err |=
+					I2C_ERR_UNEXPECTED_STATUS;
+				goto err;
+			}
 		}
 
 		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
@@ -876,7 +900,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
 		if (i2c_dev->is_curr_dma_xfer)
 			i2c_dev->msg_buf_remaining = 0;
-		BUG_ON(i2c_dev->msg_buf_remaining);
+		/* Underflow error condition: XFER_COMPLETE before message
+		 * fully sent.
+		 */
+		if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) {
+			i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
+			goto err;
+		}
 		complete(&i2c_dev->msg_complete);
 	}
 	goto done;
-- 
2.7.4

