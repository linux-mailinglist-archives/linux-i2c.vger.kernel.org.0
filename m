Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71C5D6F05F8
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Apr 2023 14:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243924AbjD0MkL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Apr 2023 08:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243891AbjD0MkK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Apr 2023 08:40:10 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A816526F;
        Thu, 27 Apr 2023 05:39:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHAL0aCcnCZW1CjlH6V7JYU6k4t/t8epDHPRNqcjJdeCo2w4Uoi0E0Bbs5RvzzpUCFwtfvLrkiSrLvPgcj7WsprxiDezdcbYWo8P0QjCgl5o7RyjBnUww7qe7IHsq39Q+eWVKS2VK3aFNZDPhFS5vBx2RcO9ZLRP9MMk0Ha6b5BpvGuh8DHAU2GabcqRtL8s0JCFSRudv6+iKipF4yZp9WO6qmjO1PFXpVI2bxFk/l4mqdSHeeNHcMf6Frzqb5bvfEJqkkoQJ7r7eEexP7kQcDPiOMfbpKenmgqduw2m+Gv5K8oHINaaDMB5044/6CIqWypo9Z10eNQp7HxukZ8TFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpYEGtwQDDYJiOsncTk+df3Oh+ydk+jCBnxFDmtMXZk=;
 b=Jpa0px3tWEdooFsRmbfRydC9murOZXNXQPv5pqe2aTXPgoEsLGDzuOsIQz3owWOrsRYZw+x+WkPt+KF2WVNoGHxs56Msl0OTimLU5RhwswTiUJkFBmT08et9F7LRo+XtB9qPHqQh2bz/QrP0jgqCyu7f1lIqCQzzALn0LWvqQ019l7OBTQllBrSzv2a1wCSG9GpD6z587PFlHSXgnEKyHUTxKFikQhRvJNmSgZRVv6VuxocEiMLGbXrJFszH/txrIX5FLmXyRWEgnhGZTtvqAvjHqeGvmQUN4T29SCZ2IlBj1l9vHGCCyvLjY9iQ2o1ewFBdEJ3419ZinSed/vtxrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpYEGtwQDDYJiOsncTk+df3Oh+ydk+jCBnxFDmtMXZk=;
 b=hXInFsbEvC5L1cPrv9oRKokew0jk4oqhS27YhUqfAlqcu3Nkob4PvOCvi8hME8rSVNZxta9CVubxaxmzTY8PQa1ndGjzrTslMH6E7FDVD4VLX4hhIFQha8dYgdfGm/4A5OFm6rmZ36l1nJ5EroM6Q8XJ/psBlA3/5hszmNznfgs1v4e6DfFV43q6UaoshfVguXEIMWGrb5vlXHBlG9rUjw5r4zbdqtIeF5fBsP/CCxpJSytEyf0XsRuf/xAf+/ZNquj+moyBqGE0pZmBoJVnXOGG4iXpbgS1icJM+JgQ8Iu6+AZm1rHNXIVbU23QJyMZPrWXhtlfhUljr/xu/gYY9w==
Received: from DM6PR07CA0084.namprd07.prod.outlook.com (2603:10b6:5:337::17)
 by PH8PR12MB7280.namprd12.prod.outlook.com (2603:10b6:510:220::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 12:39:54 +0000
Received: from CY4PEPF0000B8EC.namprd05.prod.outlook.com
 (2603:10b6:5:337:cafe::c8) by DM6PR07CA0084.outlook.office365.com
 (2603:10b6:5:337::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22 via Frontend
 Transport; Thu, 27 Apr 2023 12:39:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000B8EC.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.5 via Frontend Transport; Thu, 27 Apr 2023 12:39:54 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 27 Apr 2023
 05:39:40 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Thu, 27 Apr
 2023 05:39:39 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Thu, 27 Apr 2023 05:39:36 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v6 RESEND 1/2] i2c: tegra: Fix PEC support for SMBUS block read
Date:   Thu, 27 Apr 2023 18:09:14 +0530
Message-ID: <20230427123915.38199-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230427123915.38199-1-akhilrajeev@nvidia.com>
References: <20230427123915.38199-1-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EC:EE_|PH8PR12MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: 5110b532-ddfc-4de4-c278-08db471c8066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QSTKEMuiYnk7EmYs5UHhvFAE2N9WX/xNB4ehMnGivSOWeZ3rf3RGduazGXt2JFZbsgMm5qiQsVqkXBlp4J71KMvCZ3HqB7goLzIIp2q/627wfcHOcDoa0NJ9ZjkkW5Wd9H7YW0zSOU7Na+KBJtyTBRUtyOOPN9anVmRAiemn5sdp75NujwkBjU3CmYagg12hRkhMqnJyQY64PxEEycjWrE8wh13qGK43199NKRQT8a2Pidhl9DcCx5Wmlh+K1dglG3ZCHIYHIUlmJJ8lEVBrnbXjHiZ9gPrkcSDgUwe7CqhvPArc6qOzGEp/+SKnkxe5FWVSoYJu4djMeLLPB2c2/qw9ZcTaEsFTD+uIBxHmyhpMo8v80difNAf5KDXa0je7IDswH9OvgIMN1r0YgRgpMkZvsEo7lR11UvDYK4mYcBZqktC1r+7No3f/4xeIa1uwc+B8bp4pB6rJBt99MsicdARpCodPWoCppAuWq73cwnGuLBzNrlgSago6vJHDFMcPN/0mQEBPYUb59mRdDNT7rujLQg5I5C4QqOEqIk7athJsbs86XUEsLQuhDRQ8ug2tQ9WM2tXuVBeMwHYAXmB63S6hHQqOvwfdOs5b4StKbg1vFliOh7BtBDAQdY8Cl0sRHJEeA6Xgg5qRE20MawXZHOatsE5nEMO7z/knvW6T+DOtB/HI/6qAoawQWQiTULvStSZah+CnrqxAaN2Vb8vCUEFzAPAUcphLYC5N2tQD5iYeeO3TCPYyEjI+fTFh0T1dc8Y51z8hyCwDNa0JAdT9og==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199021)(40470700004)(46966006)(36840700001)(2616005)(356005)(7636003)(5660300002)(2906002)(36860700001)(47076005)(1076003)(921005)(26005)(41300700001)(82740400003)(426003)(83380400001)(8676002)(8936002)(336012)(4326008)(316002)(70206006)(40460700003)(70586007)(36756003)(478600001)(40480700001)(86362001)(186003)(107886003)(110136005)(82310400005)(6666004)(7696005)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 12:39:54.0207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5110b532-ddfc-4de4-c278-08db471c8066
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7280
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
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
Acked-by: Thierry Reding <treding@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 40 +++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6aab84c8d22b..157066f06a32 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -242,9 +242,10 @@ struct tegra_i2c_hw_feature {
  * @is_dvc: identifies the DVC I2C controller, has a different register layout
  * @is_vi: identifies the VI I2C controller, has a different register layout
  * @msg_complete: transfer completion notifier
+ * @msg_buf_remaining: size of unsent data in the message buffer
+ * @msg_len: length of message in current transfer
  * @msg_err: error code for completed message
  * @msg_buf: pointer to current message data
- * @msg_buf_remaining: size of unsent data in the message buffer
  * @msg_read: indicates that the transfer is a read access
  * @timings: i2c timings information like bus frequency
  * @multimaster_mode: indicates that I2C controller is in multi-master mode
@@ -277,6 +278,7 @@ struct tegra_i2c_dev {
 
 	struct completion msg_complete;
 	size_t msg_buf_remaining;
+	unsigned int msg_len;
 	int msg_err;
 	u8 *msg_buf;
 
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
 
+	/*
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

