Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE72E6C4B5C
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Mar 2023 14:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjCVNLP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Mar 2023 09:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbjCVNLN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Mar 2023 09:11:13 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4544362320;
        Wed, 22 Mar 2023 06:11:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/u8BLaEXf3hIwx9/e+11ifjORv7iiUD5OYUSNDMnOM89GeYXEIjZhRkWxrGq+5XQkjO8Evz/8+YuJZOeOq4ezyVNYO7PMYq2UkDe1FgwHfTkWN7R4yUoPUhvCt/L70rsHjhQU0UWh2ub3gBHX0XQp37VHPotLECXueqvYt2Uh8hBcR1jVfCJXczWdCm7pD6ZKQOuuI/gsRdndc4/EyTuyTw+sZl3R2Rt2skSDmHx/QBMKFUcLzSXF5PqcFL93AO9+UiijhX7F1wMem0XtbdKNJ/vQsPgpaYa8ce5CiDdquF/SHLNq4VlOThxzLyu2IL1+nqmEc/i6ZTHzr+Xqqo9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9Ke/mLiGoKMJHldSaKyc1jeY0hffx3Sfic4jeUe4IY=;
 b=IOrwMOApWe1s18V0HQdG+l/A1rMq3jqQcHVvmPbjgpvz5jLsdOcb2OFCMit4B/bWFWrOGcn4qFwigx5v68fFjpTojpXRn8wJg5PsX1ngxryNjV3dbO6H3ZUVwafB4QNfq47XOj8lSv8mcgZEvdw+qgepJ7uWVGcjkBlFsP36wY1XNjqqxbcnJqMYCG/uFD8fLFtP3jkVvBtfOkjo+G2O19zmj60oi+PeCUhS2Cv4N6fVfivIELF0dJXQS1DrR5q/+ijYRUqZsusEWAJioOOqP22I6vaEzGnCC34lolEAI7oXXaR7SZM7CyEbnKpfRUW1mRHyOKYU868n2V+tPO4Neg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9Ke/mLiGoKMJHldSaKyc1jeY0hffx3Sfic4jeUe4IY=;
 b=O39CSUOwpjYAJKzrlE8upLylg33or7mvqTJr18YZ7Z5tn84Xn+sr8HgJhpkXnsJKP0F75jZkM8TC3ahvMwM+6/mGlw2ycdUr4OWQJzFektpaT5aAhRFfEXHDgzIkG28q8JW/tjW20rOITpPWBmr2TEO1wmukbN3ee6uWnW5Y7WabQARC5WSrW+bJDYjV5UfaPnI4Cmotg3T6tyOmKOQRaf5SMrxcTdlI3mzclibQ951ROzyyxA0vXJj1H5GQDMZAP3uZnZyATzoPfFMYJ2MHWMVzssA5PPRhHJ63yjnvlgUoKYzKnlbrgketezz37P03Nc01heD1faquDJJTLTjxQA==
Received: from BN9PR03CA0248.namprd03.prod.outlook.com (2603:10b6:408:ff::13)
 by MN2PR12MB4501.namprd12.prod.outlook.com (2603:10b6:208:269::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 13:11:08 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::90) by BN9PR03CA0248.outlook.office365.com
 (2603:10b6:408:ff::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Wed, 22 Mar 2023 13:11:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.17 via Frontend Transport; Wed, 22 Mar 2023 13:11:08 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 22 Mar 2023
 06:10:59 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Wed, 22 Mar 2023 06:10:58 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.5 via Frontend
 Transport; Wed, 22 Mar 2023 06:10:55 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v2] i2c: tegra: Fix PEC support for SMBUS block read
Date:   Wed, 22 Mar 2023 18:40:37 +0530
Message-ID: <20230322131037.53805-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT066:EE_|MN2PR12MB4501:EE_
X-MS-Office365-Filtering-Correlation-Id: 9548262f-b26c-4d72-e0ec-08db2ad6e6d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Tp8IAjFP+PARRbntKYTxi3F+ezRSk3sUheEb5MXteaGr9Wdl2YYpwhiRWf0CtwC+4V2OdQpafwe5LGsMBPF8otnO9yi8C+tMtALXvMiFit0lZ4o9WjyFkAeSg2c53oNdRJ1ryZm7CIdVpBat8s78qryzjbOsuPP149/0s1RF1LBOHEGzG7rtagdRvP+fCNyNN6SogF65vnm4mN4vuQleHVvB6Y9oXuqOizL2qwUg6KMoEtv92/9ezzkdRRIGv3mGuDDUAxrqgNuVJjse6xN2ORDe4JBS7izKbyqx2pMEFfURDmvR3pKIX85enw5dhadCA+YShi2LXLPWDf1mVkcgiWIp5PnbvHOzsDNgh+gQO0fx3D+O19PhIcXb4upaIWgQcvX6GxkyfvMEpkXX0J9Wd/imZkZfrE+ud3CHdx4p8duZMkmVsLGA+KhODBR6Zup06bTdnWPKFSWV0hrgh0axf9zzmAyvFWuBhVkuM4Yff2P7jR4SxMfuGkteihXil+8Jp7cFH8rovsAp7eWaLv1qTDEjxbcZmcIq5LL3hfiUj2Vs/6o/RqUF72/c0FVxyLg+Oyfizrrp/sT4JXGfqVUV/V8sQtV+oBNMhNknSAse7Qdm+YvUaC1IqHtXwcPuO1srVMrPzhbMpIMbBJI0wTzjuvD5mFixR67ivU6PcuYK70aoF3uJ0m3wTZdT08P+N0b1FsrbUtqSBsmJYPswzciHbgAW1VPqyqrZUNoaSaWAMNg6B7KHHHI+e+q1EchSHqVygIiSQ1o1MwKGa1EbC8BumGRRNuZ0pEIIaXkztO/p9XwnFgpFpT6WxZMW6KxHFcO
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199018)(46966006)(40470700004)(36840700001)(356005)(2616005)(921005)(336012)(107886003)(6666004)(26005)(186003)(1076003)(7696005)(47076005)(426003)(7636003)(2906002)(478600001)(82740400003)(83380400001)(86362001)(82310400005)(316002)(110136005)(8676002)(5660300002)(4326008)(8936002)(70206006)(41300700001)(40460700003)(36756003)(70586007)(36860700001)(40480700001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 13:11:08.5064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9548262f-b26c-4d72-e0ec-08db2ad6e6d1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4501
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
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
v1->v2: Add description for additional struct variable.

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

