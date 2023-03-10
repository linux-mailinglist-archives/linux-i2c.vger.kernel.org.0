Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1FC6B4BC9
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Mar 2023 16:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbjCJP6S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Mar 2023 10:58:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbjCJP5l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Mar 2023 10:57:41 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C138D7A95;
        Fri, 10 Mar 2023 07:52:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUpqxIv4McvKpUxm9zVSwc2BkQ/zQa/5ahbkXoZTnJ/Zqp3ailXDdQiN1l7uG+wcePABDoRujrmH9xkqIZzAWVIUhcMmJmC8+4fhx543/O96ODPBydIPJz81xt3jCbE+HFVlKpmlrN+BgU75Z1KGvhdOfoHRr6/YN3gOsjh4E22gjPn7kL4JqigabH0MhMhovmvvSyZIBf3nZUJrurazlZN5HbrR4EoKcJFJakTG1kGHYEC009oWcqrAnb2kWN8NlOd6o+Lzqbey6bz3poTlBI78V/SdJa9Z1xpTUObCQlgN2YEeac8efwJEa3XEdtjBjcMb0HOp8q1AW+Q2hIMgUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jtn5xgU92dXdxPrVv6HgqsyKhfJIQsak61N/j4HyXhc=;
 b=jaKXl+acReDivHmlndUSH0qe2JfTpHXxvy3hvyf9zUSXwxw1vlQzvjgswGiL+UoQECY4hH+tpL7DVxy2PVWzzOb2O6pQcUjLVJDpiZhIzx/bp0ZG3HZFPrYOijbEYA2Pb7Dyh/iPxqM8fLFzI1jfOobmvhfBOHeOlMfPVdBeNTBBDt4s/uaLTzfA7GvkpZM/229c/eyvz19FpcFbismdMn3w7ZbgXMWbvHK+A3wR0E3JQ8YypjjFwo0OULnr/yzaI+Vd6yPKz4SNBgkuDJ0bCu4wu1wRr92DN90O+QhyvuxUa5SFWxhSLw+Rwqaa5CPRD3/sH5eVCooZqFJV8IAEfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jtn5xgU92dXdxPrVv6HgqsyKhfJIQsak61N/j4HyXhc=;
 b=Lm9U/4jceYFczvP5kzPCrmwp2DISnNXSaI22BWxbPH1xysJnqrpIpSxQEbo4IpaKXJN9yqOWkVo8fVJsIbuS6rl5Sy/1nLnQRJns93bqb+12VyetfEEu12vi2iFKtjcnT5kpsLkn6KVIigKjzQ3U8eYyYKE6YEcDmHNvr8QMm+H5y9iUZBd4cLGkOhUdJcWDaK2b8Zg5tRk4qT/8XzRGo9fJjFK64/0ZTPlVpYCNs5Ssc7SR18NQ1kL9IZQBIni7wlgD1bHRnMax63Y5WK0ko2O1Kpdak5UZ2gZirymAl+k+vgim5HCEXRea6mQJ8667Bf1R5nc0I70cFSsBjVN40g==
Received: from BN9PR03CA0132.namprd03.prod.outlook.com (2603:10b6:408:fe::17)
 by DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 15:52:45 +0000
Received: from BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::b0) by BN9PR03CA0132.outlook.office365.com
 (2603:10b6:408:fe::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Fri, 10 Mar 2023 15:52:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT007.mail.protection.outlook.com (10.13.177.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19 via Frontend Transport; Fri, 10 Mar 2023 15:52:45 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Fri, 10 Mar 2023
 07:52:34 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Fri, 10 Mar
 2023 07:52:34 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.5 via Frontend
 Transport; Fri, 10 Mar 2023 07:52:30 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH] i2c: tegra: Fix PEC support for SMBUS block read
Date:   Fri, 10 Mar 2023 21:22:17 +0530
Message-ID: <20230310155217.11993-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT007:EE_|DM4PR12MB6280:EE_
X-MS-Office365-Filtering-Correlation-Id: d1df0166-a831-4063-9eba-08db217f7dc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gNDygaGFIIQp+ZVuVN56MgE5JCcxX2g5Y6RSRyLK2XEYWjtBKTOpo2AT9+Wt9vtYh6UQgiAMK7jGrdkBZ0nVvDP2zBuKOGZiDtk+HWUIFda+x2vQww0gSAkQvZJU5SanGNUT49AEbakTg/tfB2CBbLjofqOH/mQSWlZbW8oskK2l+yilqu+Fs+W2UjOv+bkXob3j8NjxBKkVlbP/CDk+hnnJMPP7XsCl0jGPFXBKtef9ViRGe6/qIoE1TkcOAIhjzcFrSOsmr4CojR2JyKUS/D9W912dF7HX1SgbWh9hTGvA244y0gA306IjsiNy3uS/HQ/JERv5MEJA92KrLus1KiIUbZUpXclEw1jsOy4m96waX1enE9Uvcyf3ycKlVmeTvP5jqrQqnO962qkKY5o/8d3xi/qoXNmWBZjizvNrmudtwW+uDY+/FEIY3N7r61zH+0K0PzvTk0Mhi0N27YZcKODBr00b1gh844gKEOGpBkRvgWkwCL/LCM8XhBJc7BXvjTHuXabtmCNdyZlo4u1XaNEA/1DAWYaKa9Ks8WLiRntahrPJujy+BHqZ6bExjyAYhQh40EBpLIAGA4L1b9hV2PN2oU2Z4eIqbVQ+uTFfeox1Af/fp7cnL/nqnv5UuM95wBxFo1Iq1MQjzc2B8O4LWLZ+bRt+yy/r7sp6GnOoVpII24QARTyKLYLZ2zD+09JWPNgM+xrNGhzraRz/JRJlCQyJBhiR9VPpw+LrgBVKPq9sHrYlbH47wJPE9APZuJGR9cYiCE0dOSDtLwIhNsrZssa7mdyUwcNO2PlmkYmCXQLkcwW6d4N+rG5ze9+G5TYF
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199018)(40470700004)(46966006)(36840700001)(47076005)(426003)(336012)(110136005)(40460700003)(36756003)(356005)(86362001)(83380400001)(7636003)(82740400003)(36860700001)(26005)(1076003)(82310400005)(186003)(6666004)(2616005)(316002)(7696005)(5660300002)(478600001)(921005)(40480700001)(107886003)(4326008)(8936002)(2906002)(70206006)(8676002)(41300700001)(70586007)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 15:52:45.5692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1df0166-a831-4063-9eba-08db217f7dc5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6280
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Update the msg->len value correctly for SMBUS block read. The discrepancy
went unnoticed as msg->len is used in SMBUS transfers only when a PEC
byte is added.

Fixes: d7583c8a5748 ("i2c: tegra: Add SMBus block read function")
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 37 +++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6aab84c8d22b..75250a46cf71 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -279,6 +279,7 @@ struct tegra_i2c_dev {
 	size_t msg_buf_remaining;
 	int msg_err;
 	u8 *msg_buf;
+	__u16 msg_len;
 
 	struct completion dma_complete;
 	struct dma_chan *tx_dma_chan;
@@ -1169,7 +1170,7 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	else
 		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
 
-	packet_header = msg->len - 1;
+	packet_header = i2c_dev->msg_len - 1;
 
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
@@ -1242,20 +1243,32 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		return err;
 
 	i2c_dev->msg_buf = msg->buf;
+	i2c_dev->msg_len = msg->len;
 
-	/* The condition true implies smbus block read and len is already read */
-	if (msg->flags & I2C_M_RECV_LEN && end_state != MSG_END_CONTINUE)
-		i2c_dev->msg_buf = msg->buf + 1;
-
-	i2c_dev->msg_buf_remaining = msg->len;
 	i2c_dev->msg_err = I2C_ERR_NONE;
 	i2c_dev->msg_read = !!(msg->flags & I2C_M_RD);
 	reinit_completion(&i2c_dev->msg_complete);
 
+	/* *
+	 * For SMBUS block read command, read only 1 byte in the first transfer.
+	 * Adjust that 1 byte for the next transfer in the msg buffer and msg
+	 * length.
+	 */
+	if (msg->flags & I2C_M_RECV_LEN) {
+		if (end_state == MSG_END_CONTINUE) {
+			i2c_dev->msg_len = 1;
+		} else {
+			i2c_dev->msg_buf += 1;
+			i2c_dev->msg_len -= 1;
+		}
+	}
+
+	i2c_dev->msg_buf_remaining = i2c_dev->msg_len;
+
 	if (i2c_dev->msg_read)
-		xfer_size = msg->len;
+		xfer_size = i2c_dev->msg_len;
 	else
-		xfer_size = msg->len + I2C_PACKET_HEADER_SIZE;
+		xfer_size = i2c_dev->msg_len + I2C_PACKET_HEADER_SIZE;
 
 	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
 
@@ -1295,7 +1308,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	if (!i2c_dev->msg_read) {
 		if (i2c_dev->dma_mode) {
 			memcpy(i2c_dev->dma_buf + I2C_PACKET_HEADER_SIZE,
-			       msg->buf, msg->len);
+			       msg->buf, i2c_dev->msg_len);
 
 			dma_sync_single_for_device(i2c_dev->dma_dev,
 						   i2c_dev->dma_phys,
@@ -1352,7 +1365,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						i2c_dev->dma_phys,
 						xfer_size, DMA_FROM_DEVICE);
 
-			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf, msg->len);
+			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf, i2c_dev->msg_len);
 		}
 	}
 
@@ -1408,8 +1421,8 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i], MSG_END_CONTINUE);
 			if (ret)
 				break;
-			/* Set the read byte as msg len */
-			msgs[i].len = msgs[i].buf[0];
+			/* Set the msg length from first byte */
+			msgs[i].len += msgs[i].buf[0];
 			dev_dbg(i2c_dev->dev, "reading %d bytes\n", msgs[i].len);
 		}
 		ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i], end_type);
-- 
2.17.1

