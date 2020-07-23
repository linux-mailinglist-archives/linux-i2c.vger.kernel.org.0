Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 774B522AEE6
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 14:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbgGWMT1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 08:19:27 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:19183 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728806AbgGWMT1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jul 2020 08:19:27 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f197fd40000>; Thu, 23 Jul 2020 05:17:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 23 Jul 2020 05:19:26 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 23 Jul 2020 05:19:26 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jul
 2020 12:19:26 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 23 Jul 2020 12:19:26 +0000
Received: from kyarlagadda-linux.nvidia.com (Not Verified[10.19.64.169]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f19804b0001>; Thu, 23 Jul 2020 05:19:25 -0700
From:   Krishna Yarlagadda <kyarlagadda@nvidia.com>
To:     <digetx@gmail.com>, <linux-i2c@vger.kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ldewangan@nvidia.com>,
        <smohammed@nvidia.com>, <rgumasta@nvidia.com>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: [PATCH 7/7] i2c: tegra: dump I2C registers on timeout
Date:   Thu, 23 Jul 2020 17:48:53 +0530
Message-ID: <1595506733-10307-7-git-send-email-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595506644; bh=R11Ga9WFE2Eiv4ttDZrrlRWyR6LeF2U8LlGpsShfusY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:Content-Type;
        b=c5DauvVDYBkxNG6Rd4TruvpOuOmBI8mIup3ch/VzXJrwnYN42hMmTlkhxAAAVI14r
         H4rj/QBSFxt1N8zSYsr5Z6MiMam+697tDp4rC5I2fIO+y7ZEU8m4ZTDqw3nhRuKFU3
         RBRNeAb/DUbSvpMrLRTRwRVRKgmnhgocj9h4kM3zmQN92mOvtKyOpdk0rme32WqM0i
         um0MCis4U5obZd9e5NP2xBle1rZ7qFheseow3ljjDvAntcATOEjtbZyT+gqm8VtDcb
         bLLM0azOwzw1PeYq9LE6RrpaRSkMWu1Qzc41sjPfl9tqOu9B3hucLMUSrVnzn3DfA9
         uvUQ1qyWjP+oA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Rajesh Gumasta <rgumasta@nvidia.com>

Dump I2C regsiters for debug when transfer timeout occurs.

Signed-off-by: Rajesh Gumasta <rgumasta@nvidia.com>
Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 77198fc..cdc8664 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -126,6 +126,8 @@
 #define  I2C_HS_INTERFACE_TIMING_THD_STA	GENMASK(13, 8)
 #define  I2C_HS_INTERFACE_TIMING_TSU_STA	GENMASK(5, 0)
 
+#define I2C_MST_PACKET_TRANSFER_CNT_STATUS	0x0b0
+
 #define I2C_MST_FIFO_CONTROL			0x0b4
 #define I2C_MST_FIFO_CONTROL_RX_FLUSH		BIT(0)
 #define I2C_MST_FIFO_CONTROL_TX_FLUSH		BIT(1)
@@ -1178,6 +1180,33 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	return -EAGAIN;
 }
 
+static void tegra_i2c_reg_dump(struct tegra_i2c_dev *i2c_dev)
+{
+	dev_dbg(i2c_dev->dev, "--- register dump for debugging ----\n");
+	dev_dbg(i2c_dev->dev, "I2C_CNFG - 0x%x\n",
+		i2c_readl(i2c_dev, I2C_CNFG));
+	dev_dbg(i2c_dev->dev, "I2C_PACKET_TRANSFER_STATUS - 0x%x\n",
+		i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS));
+	dev_dbg(i2c_dev->dev, "I2C_FIFO_CONTROL - 0x%x\n",
+		i2c_readl(i2c_dev, I2C_FIFO_CONTROL));
+	dev_dbg(i2c_dev->dev, "I2C_FIFO_STATUS - 0x%x\n",
+		i2c_readl(i2c_dev, I2C_FIFO_STATUS));
+
+	if (i2c_dev->hw->has_mst_fifo) {
+		dev_dbg(i2c_dev->dev, "I2C_MST_FIFO_CONTROL - 0x%x\n",
+			i2c_readl(i2c_dev, I2C_MST_FIFO_CONTROL));
+		dev_dbg(i2c_dev->dev, "I2C_MST_FIFO_STATUS - 0x%x\n",
+			i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS));
+		dev_dbg(i2c_dev->dev, "I2C_MST_PACKET_TRANSFER_CNT - 0x%x\n",
+			i2c_readl(i2c_dev,
+				  I2C_MST_PACKET_TRANSFER_CNT_STATUS));
+	}
+	dev_dbg(i2c_dev->dev, "I2C_INT_MASK - 0x%x\n",
+		i2c_readl(i2c_dev, I2C_INT_MASK));
+	dev_dbg(i2c_dev->dev, "I2C_INT_STATUS - 0x%x\n",
+		i2c_readl(i2c_dev, I2C_INT_STATUS));
+}
+
 static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			      struct i2c_msg *msg,
 			      enum msg_end_type end_state)
@@ -1331,6 +1360,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 		if (!time_left && !completion_done(&i2c_dev->dma_complete)) {
 			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
+			tegra_i2c_reg_dump(i2c_dev);
 			tegra_i2c_init(i2c_dev, true);
 			return -ETIMEDOUT;
 		}
@@ -1352,6 +1382,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
+		tegra_i2c_reg_dump(i2c_dev);
 		tegra_i2c_init(i2c_dev, true);
 		return -ETIMEDOUT;
 	}
-- 
2.7.4

