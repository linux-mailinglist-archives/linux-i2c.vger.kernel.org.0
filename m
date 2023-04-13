Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82DBB6E0E20
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 15:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbjDMNKA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 09:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbjDMNJ7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 09:09:59 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12hn2245.outbound.protection.outlook.com [52.100.166.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052588689;
        Thu, 13 Apr 2023 06:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLdJQwtJVETHaAk0rbGkCzR8DQ29cXGD3XPkD+POH4+ZyisMSeCfpl+1pDSp9AU4sIGUHJSHyks7n+H37UyWAutLa0Dc4tfPQyCJf/+cutVcGxCTt1nSyh04eoxwvItitVYLaj/IyCCpE4JQPQoUTes9jPrJM0+N2nD26YKLBZpUq3LoHe/DEp05Fzu7yZxHnDMqYaHWJ3qOZid25DPHLuJj4C0UJ5KWp5aNrYtN52ekaxILr3Ozq3bORHRUa0ORvjlRKI0qPugw96dtDsZFYXMd51TZxvnWPs67I+q254xN/LzHoEBKv2Mdk4jnKrXKM2/GcxumFjEKeby3jzpUjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5/daGqqjqW61FXu69Jxi8xnOIDple7gGAEwmVmcGe0=;
 b=UTOBP/an2CW7TFbxqDwg/aiGlZ3efonXhzQ988GWYFFXn9oZYZD45G7ISaWsmYrNsyyCqF/50MukahJZROCv1Lx/+GmW1W4/NNUwtH4TzdNMqLrqD1ipdGhmxDsF+iri2iINmwJ5rywy9xCbkpesTW7YZupBCqPL0iXKNKnnGQ8mK7uIVt89djFUWirJMAVQJhQ1gBXgSgqVPqaSxPg3KM9VwvDpnRYEWzc5zdKXZvonc87rPKswvBTiGBDzPNhUfnYdwO2hdxJwsyUsHau830g7TSw8r6H6S/TWg28P1ReUi4jHjhbT2PHYpRjTTqgaCywq0VfWDXowz0/KQ8GtHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5/daGqqjqW61FXu69Jxi8xnOIDple7gGAEwmVmcGe0=;
 b=Y2yrMv60PsogQWG9hLT2JMzOpYWBBnKgNzIivj0AACleRG4wWu7RtUuk1jPcyGblm989b3d3/vZ3Rru2M2X+fFxyr2BNiaUeNBUtNYmKughL/oHQw8IH1YQF4Nhkuceg2wt8n1LFnvRy7/AsvdCNMYnhCRKYdHlivyF+PNOIs40eIxmXotwe+gYAFZtAbqIEalonylxaOY7AWa2dI35lqVV5oi0FHV66KBCtPdhbOEsqUBPk+u4mYcUT6CHrlEbxNGqyErO9/kI5mZ11zBG0NYJp+b/rND7t7i8u6S5PT5cpx7z1tN0lf9lGWjG785gqfUl6gqAO7NTww3aLXKBqaQ==
Received: from DM6PR14CA0065.namprd14.prod.outlook.com (2603:10b6:5:18f::42)
 by SJ0PR12MB6878.namprd12.prod.outlook.com (2603:10b6:a03:483::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 13:09:56 +0000
Received: from DM6NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::f6) by DM6PR14CA0065.outlook.office365.com
 (2603:10b6:5:18f::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 13:09:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM6NAM11FT087.mail.protection.outlook.com (10.13.172.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 13:09:55 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 13 Apr 2023
 06:09:52 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Thu, 13 Apr 2023 06:09:51 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Thu, 13 Apr 2023 06:09:48 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v5 1/2] i2c: tegra: Fix PEC support for SMBUS block read
Date:   Thu, 13 Apr 2023 18:38:48 +0530
Message-ID: <20230413130849.2894-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230413130849.2894-1-akhilrajeev@nvidia.com>
References: <20230413130849.2894-1-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT087:EE_|SJ0PR12MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: 80c3e93b-054d-4e5b-a45d-08db3c20605c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aUcrz6+tWCU2pcfLUVVW1DTPPVbTO7ddWBmOdtEWGbEE5yAj6ueWSWMqsKScin44wr6RGQrsdAJxnui5YcXh82Wpv6qAgkYQtGFSZKn3xU25tssLPmYzJt6jIVVFQae/Xs/UdHVp1zoJhm3aqufBzRHrs8roXk1fP08Xmjz5lHWGC4RXOMaIdKzJPKK0hgbMFsCpDm9s1FBTAJjHxdHmwGX75l5n7sgaawy7rDHKCLbSbgF7hnXmye6Pc0KiPvTWVcq/L9JQd/MGsxSknQFqCQ1we0MByXC5Mh82Ha8Jg9+/K5vO2Na0mtv0gaCMXhPWIwOQWY5itLmU9kUQaUDfLXcdK00Yz8TLXqBwTDKNg9VEwTro10m67N+Uv78vJMyQndH6r9mV5j1agm+8p+6M42nAl6j/fDEUBAYLOXz114MC6pYp1ixTbrvNlxSoc4KsfDreFlGWdC99Yv+TlWel+yy7P065UK14oZiUh7b7dhqBM/Dye8+cLNotKWKN9x+7Lo4QMgpFQts1C46CTHILAer9wbikw8rkJPp+Mk2NftBr5Q7wf89TxaSrLd3EzI7m6FnSKqhaiKfRiY9kczG/VKL1XyRKV6Eeaf0uWJk6tuWWil6xI9NRQKz6WiRJI26IIl5Xy6JdyXGhxyIPaAyLPxJUkE3udt2G+LmeAm+AEfIMBdgle/meTHS6VcA3LcGf7aiJ9QXlDskTKWcGxlLHryjeqYsaG13vVuITC4yQRJTOWd0SBON9brtWnN4XEK019SVBVHDlzczW3B3nnCGrNL42cDGXaCXcba7hW/6ognHRRmU4qaIBj1UBrPQxwavLBPe62cnehEYoEbjpy5eANwej3yOnpDWXcSgFgGlGmv/D8lbjuMXcSzMQGBtMVY6R
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199021)(5400799015)(46966006)(36840700001)(40470700004)(110136005)(86362001)(107886003)(82310400005)(478600001)(1076003)(26005)(186003)(7696005)(40480700001)(426003)(921005)(4326008)(70206006)(7636003)(70586007)(356005)(82740400003)(316002)(40460700003)(5660300002)(336012)(2616005)(41300700001)(36756003)(47076005)(83380400001)(2906002)(8676002)(36860700001)(34020700004)(8936002)(2101003)(83996005)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 13:09:55.4955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c3e93b-054d-4e5b-a45d-08db3c20605c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6878
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
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
 drivers/i2c/busses/i2c-tegra.c | 38 +++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6aab84c8d22b..c1e1e1c2b8d9 100644
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

