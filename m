Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD126C7D92
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Mar 2023 13:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbjCXMAX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Mar 2023 08:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjCXMAW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Mar 2023 08:00:22 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142AD23C7A;
        Fri, 24 Mar 2023 05:00:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpXdk/Ae8SOnXBO9dXk2DrPIkyg62oNyOgra1JDkpP814jd3WI58ZTlkaSA3av2tWKl1Zgj9lTcrYk0S9a5+ULZ5vWN/A0FFfS3Ja3sNw/SMwxeXxh/yjvl+Fxe9WaFKJUw0WiUebIO3rDN0ZLVVE8vGWCB28IxrG51XqxPINStFXh2wI2oFSFQn5AhiTn5LyRMcO/tTPEvevx20rw0HuJHdNyy2ri+EXla/VMdz180EsuCEBPXW+jGSKkzRaO8mSuuxh35lJUVlpmUxDJTQWQ+/pa/KRuoXV+fVdcObvm6h0hdoq2jlFi1By2ri+HjmLuyYcrOaPh9ehKrnQG1u+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O82n6XWKvjvB0l5JEtlrKR8xTMij2GiLFGl7BIXztU8=;
 b=ZViacho+0dKcX5eTgL7vlAy+2ZY45q2wKSWpk1kxBg8tBYY12BgeZTJfCaIdI5LhCdBjwfJNFUjgNFIaXopJgPxjWU9jCFrgiLJHTmPtJP/PdOnugjoGpMIoxMSLRUcTxc5MCcrzuMnP5+gYCjN0MrMvr13GfCpIGkQJFxTZ1cNjTG9ZX1jNGG8X5NQV002VU0Cpzck+bZvyJsDjLFQ6QE0S8cAQIlrb6fslDG29ojWsbp0QWbSlQbh/TrlZWrKYtv4B+72pMePL8XOvd9ETP8lJcb+55hfHHY6/3KukR4O3TbybPFJp1EiL9xtB96C1/6TWTcsbuNhfA8MOZgMbng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O82n6XWKvjvB0l5JEtlrKR8xTMij2GiLFGl7BIXztU8=;
 b=tsUccnNvWVEFJRfzDcrELBvHIgzqXgyryJl2+tw5/deBXkt9guuNA/6H13rtIS3ZoJpe8B1nCYet2wK1+yyucyxfVlKGQaKhJL2oD/PLKHeUQOOuQ5sFkeAPL7cqUIfD8Uc22Gu2Dk/7ByEfjjTeO+ayk1PnG+C6XNJcp9Tg1exMuqEpfKvWqGz19R8G3WBfvMcBr/x+PHZcmWVKW0yb+W7YKFlxkHGQwsivvSyIdBpplryES/zz6JXS3vKtWkFxNt3W6gUEnNmJU89QeJINc4xfiNeJk+hQsR0rLHqDeTXGCry/dkmqaU8m//swTayc1LqbbIZJ/tr0jmtHprCK9w==
Received: from MW2PR2101CA0030.namprd21.prod.outlook.com (2603:10b6:302:1::43)
 by SN7PR12MB7955.namprd12.prod.outlook.com (2603:10b6:806:34d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 12:00:12 +0000
Received: from CO1NAM11FT071.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::8e) by MW2PR2101CA0030.outlook.office365.com
 (2603:10b6:302:1::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.7 via Frontend
 Transport; Fri, 24 Mar 2023 12:00:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1NAM11FT071.mail.protection.outlook.com (10.13.175.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.9 via Frontend Transport; Fri, 24 Mar 2023 12:00:11 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Fri, 24 Mar 2023
 05:00:05 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Fri, 24 Mar 2023 05:00:04 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Fri, 24 Mar 2023 05:00:01 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v4 1/2] i2c: tegra: Fix PEC support for SMBUS block read
Date:   Fri, 24 Mar 2023 17:29:23 +0530
Message-ID: <20230324115924.64218-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230324115924.64218-1-akhilrajeev@nvidia.com>
References: <20230324115924.64218-1-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT071:EE_|SN7PR12MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 29285520-2bb9-4bdc-605d-08db2c5f5242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EP9p3RsbDWeHO+TyD/o12D8UG20wUSC6zPskssxlsVQ4vcsiGyoblLsQjO5805TgbcLl+HzfduP8Sn4HiCG7Q4k6OaNhdthZ6W/X2IDjiXuj0KheZMYaMcvFzrB0A3xIrnccztHEURB9ixXXYgRFZqYBZFKe7IsWQs8PlSv49Gx1L/9UF7zJTt5lJeypghxi7cVkS1JKrzbYSLtITKZqka9OulxSabaNoes3GRo12fINpiSx+xsUSl85BJDQ65/HlyM8eT+Do/eALDJ2qXtKxrmMiMD4U/gmz3LSjgXEp7zcvjMqAsdN7zWZoOaziMS6eyL+MZ1AzeFdWFKp1YQ3NXur343+AHQ7YMfH/zKv8lUGawDLC9/Usuo9tFlDwftmeURvHyqUlOAAkl5JIeL8TbkcqAhIa3xPEzvhHwsE4SgGMO0Qy3bJgMqNbJvgqQ3YFFHdMYrog5wTPJcR0ec8Wfqx7HDQseRP/9vR+Q+E8F4lwqBbC/8IqKMyA9yp+TqOJqKMapsMJKyNkvu93DDfgz8z0ufBFbLsD1t5uVtqIcxmjDmcruVD91Am3OK4CxQmndBAW0jYq5eMwNyw1F+cyMjSi3Sj9HwHqCs/9Bsdig0OgJBTCgT/YtMC1o1JiR+eCz54VYxMatNDRmgiLSSWS26RJeEMUZVZmtw4cBX8qgxrZgYwkSVZdcwK20oj5InnI0xiv1oWDRoRNcx2OS6PIwAIEmY0R6YU2rqUtWx45AelTRVfDzTeARjVOSClpmXl6fnv48wEi7RS021ZUB9ObN5J7KMj59T7Ab9/4QE6mUQ+44hLu/nxhJl4iEHeY6rl
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199018)(40470700004)(36840700001)(46966006)(110136005)(316002)(70586007)(5660300002)(70206006)(8936002)(478600001)(7696005)(4326008)(8676002)(41300700001)(2906002)(6666004)(107886003)(1076003)(186003)(26005)(2616005)(40460700003)(82740400003)(7636003)(336012)(426003)(47076005)(83380400001)(36756003)(36860700001)(40480700001)(921005)(356005)(82310400005)(86362001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 12:00:11.5560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29285520-2bb9-4bdc-605d-08db2c5f5242
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT071.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7955
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
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
 drivers/i2c/busses/i2c-tegra.c | 38 +++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6aab84c8d22b..83e74b8baf67 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -245,6 +245,7 @@ struct tegra_i2c_hw_feature {
  * @msg_err: error code for completed message
  * @msg_buf: pointer to current message data
  * @msg_buf_remaining: size of unsent data in the message buffer
+ * @msg_len: length of message in current transfer
  * @msg_read: indicates that the transfer is a read access
  * @timings: i2c timings information like bus frequency
  * @multimaster_mode: indicates that I2C controller is in multi-master mode
@@ -279,6 +280,7 @@ struct tegra_i2c_dev {
 	size_t msg_buf_remaining;
 	int msg_err;
 	u8 *msg_buf;
+	__u16 msg_len;
 
 	struct completion dma_complete;
 	struct dma_chan *tx_dma_chan;
@@ -1169,7 +1171,7 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	else
 		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
 
-	packet_header = msg->len - 1;
+	packet_header = i2c_dev->msg_len - 1;
 
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
@@ -1242,20 +1244,32 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
 
@@ -1295,7 +1309,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	if (!i2c_dev->msg_read) {
 		if (i2c_dev->dma_mode) {
 			memcpy(i2c_dev->dma_buf + I2C_PACKET_HEADER_SIZE,
-			       msg->buf, msg->len);
+			       msg->buf, i2c_dev->msg_len);
 
 			dma_sync_single_for_device(i2c_dev->dma_dev,
 						   i2c_dev->dma_phys,
@@ -1352,7 +1366,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						i2c_dev->dma_phys,
 						xfer_size, DMA_FROM_DEVICE);
 
-			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf, msg->len);
+			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf, i2c_dev->msg_len);
 		}
 	}
 
@@ -1408,8 +1422,8 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
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

