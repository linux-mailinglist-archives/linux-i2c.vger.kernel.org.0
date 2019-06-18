Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98F754985A
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2019 06:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbfFRE3y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jun 2019 00:29:54 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:19557 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfFRE3y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jun 2019 00:29:54 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0868c00001>; Mon, 17 Jun 2019 21:29:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 17 Jun 2019 21:29:53 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 17 Jun 2019 21:29:53 -0700
Received: from HQMAIL102.nvidia.com (172.18.146.10) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 04:29:52 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL102.nvidia.com
 (172.18.146.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 04:29:52 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 18 Jun 2019 04:29:52 +0000
Received: from dhcp-10-19-65-14.client.nvidia.com (Not Verified[10.19.65.14]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d0868bd0002>; Mon, 17 Jun 2019 21:29:52 -0700
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
Subject: [PATCH V8] i2c: tegra: remove BUG() macro
Date:   Mon, 17 Jun 2019 21:29:45 -0700
Message-ID: <1560832186-17001-1-git-send-email-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560832193; bh=LNX4mUvxRDqPABzr8Kuwd0X8X0sezQ+Py3Qmzev6Wh8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=hlj4MWPUK9U5cPzh4dO2OnqEgfa2VabZhQLlIO0HX7koXzBnUI5LIP5fUNcGN8c6r
         9nlWCAByn9F+5lyeealO6pvsyUxh0KPOZ8cax/yeE1GrZhmMZqfgXut63maMLRoRDn
         ZDWfIunjifPMOLHxTSqPi7Zz57v+XOlWkohxn/Ay3rUNFGK+9BW3nVesvA2LyYPxui
         Spzb/3Rtm7yEo5VxNpmcUL50c5STMgewVJbP1sq15zKIDIPobqCegRqiAGZTuykVDU
         qbalHzlFn18kaGkswFVYe52KUVne6LfE8vvWMBvvPR7CBTkKzg0DPBOjvxUx/zRcUg
         C7Ec6mQOy4sRg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The usage of BUG() macro is generally discouraged in kernel, unless
it's a problem that results in a physical damage or loss of data.
This patch removes unnecessary BUG() macros and replaces the rest
with warning.

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 49 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4dfb4c1..6fb545e 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -73,6 +73,7 @@
 #define I2C_ERR_NO_ACK				BIT(0)
 #define I2C_ERR_ARBITRATION_LOST		BIT(1)
 #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
+#define I2C_ERR_RX_BUFFER_OVERFLOW		BIT(3)
 
 #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
 #define PACKET_HEADER0_PACKET_ID_SHIFT		16
@@ -489,6 +490,13 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 	size_t buf_remaining = i2c_dev->msg_buf_remaining;
 	int words_to_transfer;
 
+	/*
+	 * Catch overflow due to message fully sent before
+	 * check for RX FIFO availability.
+	 */
+	if (WARN_ON_ONCE(!(i2c_dev->msg_buf_remaining)))
+		return -EINVAL;
+
 	if (i2c_dev->hw->has_mst_fifo) {
 		val = i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
 		rx_fifo_avail = (val & I2C_MST_FIFO_STATUS_RX_MASK) >>
@@ -515,7 +523,11 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 	 * prevent overwriting past the end of buf
 	 */
 	if (rx_fifo_avail > 0 && buf_remaining > 0) {
-		BUG_ON(buf_remaining > 3);
+		/*
+		 * buf_remaining > 3 check not needed as rx_fifo_avail == 0
+		 * when (words_to_transfer was > rx_fifo_avail) earlier
+		 * in this function.
+		 */
 		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
 		val = cpu_to_le32(val);
 		memcpy(buf, &val, buf_remaining);
@@ -523,7 +535,12 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 		rx_fifo_avail--;
 	}
 
-	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
+	/*
+	 * RX FIFO must be drained in Overflow case.
+	 */
+	if (WARN_ON_ONCE(rx_fifo_avail))
+		return -EINVAL;
+
 	i2c_dev->msg_buf_remaining = buf_remaining;
 	i2c_dev->msg_buf = buf;
 
@@ -581,7 +598,11 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 	 * boundary and fault.
 	 */
 	if (tx_fifo_avail > 0 && buf_remaining > 0) {
-		BUG_ON(buf_remaining > 3);
+		/*
+		 * buf_remaining > 3 check not needed as tx_fifo_avail == 0
+		 * when (words_to_transfer was > tx_fifo_avail) earlier
+		 * in this function for non-zero words_to_transfer.
+		 */
 		memcpy(&val, buf, buf_remaining);
 		val = le32_to_cpu(val);
 
@@ -847,10 +868,15 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 
 	if (!i2c_dev->is_curr_dma_xfer) {
 		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
-			if (i2c_dev->msg_buf_remaining)
-				tegra_i2c_empty_rx_fifo(i2c_dev);
-			else
-				BUG();
+			if (tegra_i2c_empty_rx_fifo(i2c_dev)) {
+				/*
+				 * Overflow error condition: message fully sent,
+				 * with no XFER_COMPLETE interrupt but hardware
+				 * asks to transfer more.
+				 */
+				i2c_dev->msg_err |= I2C_ERR_RX_BUFFER_OVERFLOW;
+				goto err;
+			}
 		}
 
 		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
@@ -876,7 +902,14 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
 		if (i2c_dev->is_curr_dma_xfer)
 			i2c_dev->msg_buf_remaining = 0;
-		BUG_ON(i2c_dev->msg_buf_remaining);
+		/*
+		 * Underflow error condition: XFER_COMPLETE before message
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

