Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDF483BA6B
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 19:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728278AbfFJRJD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 13:09:03 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:16633 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727679AbfFJRJC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 13:09:02 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cfe8eae0000>; Mon, 10 Jun 2019 10:09:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 10 Jun 2019 10:09:01 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 10 Jun 2019 10:09:01 -0700
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Jun
 2019 17:09:01 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 10 Jun 2019 17:09:01 +0000
Received: from dhcp-10-19-65-14.client.nvidia.com (Not Verified[10.19.65.14]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cfe8ea90008>; Mon, 10 Jun 2019 10:09:00 -0700
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
Subject: [PATCH V4 6/6] i2c: tegra: remove BUG, BUG_ON
Date:   Mon, 10 Jun 2019 10:08:35 -0700
Message-ID: <1560186515-30797-6-git-send-email-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560186515-30797-1-git-send-email-bbiswas@nvidia.com>
References: <1560186515-30797-1-git-send-email-bbiswas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560186542; bh=Gfzngx0clR6d9UOZuOxpnc3aAu0Ti7qqGyhmjCpt1n4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=CnZ9KZRSzFQr/Nh/EZ7I2TECnVjGCnyvPuX3xtQ5DQ/hp4HafifFDPi3l/NMdcFtq
         n/K0+d2icjKpWl0UyD3G/jVymPoF6Dfb79eUZ+ET1ZYvGIM2rBML9y3jqV6ugFkYgs
         nDtWPxrciogvVLsDXQn9kCesh12z036RkYhUvHk1WYrPOWmMvBivA3bQ8iiqituen9
         3XBjTtBtotpS/cBfwVOMP//rBkO5XuHjQac6jw0SEGTTDBB5Fd6FU8YELpdr4cK9SP
         SVuUtrxQg7EqnSVbDKL1Wq3EYN6rpvyoxSBMiKoW2ElS35I5QgawBE1eEOo9WmEkzy
         xC87pccMwpl8w==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
as needed. Remove BUG() and make Rx and Tx case handling
similar.

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4dfb4c1..30619d6 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -515,7 +515,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 	 * prevent overwriting past the end of buf
 	 */
 	if (rx_fifo_avail > 0 && buf_remaining > 0) {
-		BUG_ON(buf_remaining > 3);
 		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
 		val = cpu_to_le32(val);
 		memcpy(buf, &val, buf_remaining);
@@ -523,7 +522,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 		rx_fifo_avail--;
 	}
 
-	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
 	i2c_dev->msg_buf_remaining = buf_remaining;
 	i2c_dev->msg_buf = buf;
 
@@ -581,7 +579,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 	 * boundary and fault.
 	 */
 	if (tx_fifo_avail > 0 && buf_remaining > 0) {
-		BUG_ON(buf_remaining > 3);
 		memcpy(&val, buf, buf_remaining);
 		val = le32_to_cpu(val);
 
@@ -850,7 +847,8 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 			if (i2c_dev->msg_buf_remaining)
 				tegra_i2c_empty_rx_fifo(i2c_dev);
 			else
-				BUG();
+				tegra_i2c_mask_irq(i2c_dev,
+						   I2C_INT_RX_FIFO_DATA_REQ);
 		}
 
 		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
@@ -876,7 +874,10 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
 		if (i2c_dev->is_curr_dma_xfer)
 			i2c_dev->msg_buf_remaining = 0;
-		BUG_ON(i2c_dev->msg_buf_remaining);
+		if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) {
+			i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
+			goto err;
+		}
 		complete(&i2c_dev->msg_complete);
 	}
 	goto done;
-- 
2.7.4

