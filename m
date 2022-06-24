Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC53455993B
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jun 2022 14:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbiFXMH0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jun 2022 08:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231912AbiFXMHX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jun 2022 08:07:23 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC3EE7FD1D;
        Fri, 24 Jun 2022 05:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfah1Na+KULQFj1kFmXC0+zoXwTkgVEfN4ebs8hJcBcAcTf+uxhFxJ/X7NyiY1cEwJEuGludvt65bxIHM1/jQZwEZAhv24G2EpJUmuhhBoqEdsmgqZCJc8p/kGve+X49VKFIdlzopWnxJYctarfpRX2XVPoYsyBMzaN60LOay2DICMqfGyuGm5wwV3OLkePWkgMFahktZG1W8nHRsvRf4NVJAqm9HOISYdhhd17htQdL3E8TEBH00nBZdUBgkKG2gK7nNgpwkv13I5Ail+ge9GOgTofPRovqaXSCVHalKaPEPxX2t3Zyc6AeXavhGqUHy9VnaeLf2P6MsBxtCFnRoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHMFMQ9G+R2QUl1qoYxbcynk0N7f3QD1ec1BupioQmQ=;
 b=fuUGlA0KvIeZfgnj2d4orp4yDLO29wIzYoEckejqFy3WJdHnpvx+inGhwOf1D0J+Z54bpJTq5XxxFScObpbS52HWPv4oCu5zBiKiCfwn6Z73Xw0+YSqJ6BuVHc4ivs9jpEP1IXmV5m5+G0t9fvX3Lix132b3FOFeXts3tY3G86rrk0AhIIC3N9JCb/vd6LKiljtCCWPVbdmpEWxulMbW5Yui6fPQ8h3zPiut3eigry8HcVSTsfRSW6B1fFD+v7bTx3j5u2+6Kt5zI+KUMJhd3dth7Cvhj4OiU3LINX+qm1kk1FkpcEOcxZ0+IDGtTMzshTXGG31/gErFy3E0508jxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHMFMQ9G+R2QUl1qoYxbcynk0N7f3QD1ec1BupioQmQ=;
 b=NuhnzxL8FELcXU1DQHYxkrrsmEa9+787hNAy8TV3usCG5sS1h/rQmnMDUW+NBHsS0uDN55K2tslakHen2rNhRwJOxjRUSmeT477/KVIiGHXtSVq7DGztpal9Rl1XJCcDZxkD37EeCWUoUapfUXw5n9gIjdAuRRhbVrk2YB4zrFI=
Received: from BN6PR22CA0051.namprd22.prod.outlook.com (2603:10b6:404:ca::13)
 by PH0PR02MB8389.namprd02.prod.outlook.com (2603:10b6:510:107::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Fri, 24 Jun
 2022 12:07:20 +0000
Received: from BN1NAM02FT062.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:ca:cafe::52) by BN6PR22CA0051.outlook.office365.com
 (2603:10b6:404:ca::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18 via Frontend
 Transport; Fri, 24 Jun 2022 12:07:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT062.mail.protection.outlook.com (10.13.2.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 12:07:19 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 24 Jun 2022 05:07:05 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 24 Jun 2022 05:07:05 -0700
Envelope-to: git@amd.com,
 michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.2] (port=47736 helo=xhdvnc102.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1o4i5Z-000BXd-17; Fri, 24 Jun 2022 05:07:05 -0700
Received: by xhdvnc102.xilinx.com (Postfix, from userid 90444)
        id 60FA110454A; Fri, 24 Jun 2022 17:35:50 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <git@amd.com>
CC:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH 07/12] i2c: xiic: Switch to Xiic standard mode for i2c-read
Date:   Fri, 24 Jun 2022 17:35:22 +0530
Message-ID: <1656072327-13628-8-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7402fd42-74e0-4585-15a1-08da55da16d9
X-MS-TrafficTypeDiagnostic: PH0PR02MB8389:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3D6WwgkBXogBrFTEeTAojVCV2pmwOY4M2d96wmD0cYxsnDKETFGKsceRKmXUTp1/uBmWonuitPLsDUhJhL6+7NtNuVILX3D+EK/WgdJTeDIM+JPHTch6CVaeiMn8XK0ByeEtebI5hbbDWprBzr1Y+VMT/Kv5nhe0ARrceYGLKOu2ftynvE9DxS5T7Oym3JFIleKNLCAFnhbh54GBlkRxetWGPB1Q4YhOQ6VEqC1iYgwocbJPYEhL2UGmlieWpDaeM8X3jpIP2Gnhs9/yzumyoJ1ZS0lvLPkd+MZDHhCpdkYfMyqTTOxvEYZjpV6oGAZimXtLilgewSFOXrRwZtTd5RrFCFnY87muQHirhX2QdiCFEXzRd0Xeve72WJNEa+MMCZRfI4Hk8UhACVhWMavSWHdxFduM3sOD6MIMQo2W6RM4uZ6ILzpl2PxRmNoMqVa/q/cKZe8ylhyHAJ2yT9JpF/8rW8H5XCeY3J+HYZm3w+2r/+7nqmoh208bIK2hG0oEYA+VpgmzcNSlauX7Gv/SY72GGVJMO9mEcsZvlpEc8P4UXFbHTdJVk8aLGN6UK0HSSyxxNpuOwsrJLcOw5nODWCo2GbP1WOOUcdM9bMz4IUUMERmZ5W+eELHh1wvVqMudaGMeQY6G1NeSC/FWNTP5UnVXnvrzQK+cOVGR3cF7b7Th8cU4S5jIFSREasAoMcC1pEGBTvI0Ebpv7u6RvJjQCUN7yGcTRFOQzaLa58fgUpLjtaVULgMeNU/JQY1k7W8M2m5/AtAbOQSfvv19kjSWC0pWjNB+dp9RSqMqsy3LnpK5wHQPLjDAdr+Mjtv9J5Utxgwu9FfUyPllcSNPsCaitcRz6Wjzv2yXDx7M7smRV30=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39860400002)(36840700001)(40470700004)(46966006)(70206006)(4326008)(70586007)(8676002)(316002)(41300700001)(82310400005)(44832011)(36860700001)(7636003)(42186006)(336012)(110136005)(356005)(36756003)(47076005)(54906003)(426003)(5660300002)(82740400003)(40480700001)(478600001)(26005)(6266002)(186003)(83380400001)(40460700003)(2906002)(8936002)(107886003)(6666004)(2616005)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 12:07:19.9497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7402fd42-74e0-4585-15a1-08da55da16d9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT062.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8389
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

Xilinx I2C IP has two modes of operation, both of which implement
I2C transactions. The only difference from sw perspective is the
programming sequence for these modes.
Dynamic mode  -> Simple to program, less number of steps in sequence.
Standard mode -> Gives flexibility, more number of steps in sequence.

In dynamic mode, during the i2c-read transactions, if there is a
delay(> 200us) between the register writes (address & byte count),
read transaction fails. On a system with load, this scenario is
occurring frequently.
To avoid this, switch to standard mode if there is a read request.

Added a quirk to identify the IP version effected by this and follow
the standard mode.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 87 +++++++++++++++++++++++------------
 1 file changed, 58 insertions(+), 29 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 57ede62de67d..74cd50478694 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -32,6 +32,7 @@
 #include <linux/pm_runtime.h>
 
 #define DRIVER_NAME "xiic-i2c"
+#define DYNAMIC_MODE_READ_BROKEN_BIT	BIT(0)
 
 enum xilinx_i2c_state {
 	STATE_DONE,
@@ -63,6 +64,7 @@ enum xiic_endian {
  * @dynamic: Mode of controller
  * @prev_msg_tx: Previous message is Tx
  * @smbus_block_read: Flag to handle block read
+ * @quirks: To hold platform specific bug info
  */
 struct xiic_i2c {
 	struct device *dev;
@@ -82,6 +84,11 @@ struct xiic_i2c {
 	bool dynamic;
 	bool prev_msg_tx;
 	bool smbus_block_read;
+	u32 quirks;
+};
+
+struct xiic_version_data {
+	u32 quirks;
 };
 
 #define XIIC_MSB_OFFSET 0
@@ -995,7 +1002,8 @@ static void __xiic_start_xfer(struct xiic_i2c *i2c)
 
 static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
 {
-	int ret;
+	bool broken_read, max_read_len, smbus_blk_read;
+	int ret, count;
 
 	mutex_lock(&i2c->lock);
 
@@ -1008,6 +1016,34 @@ static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
 	i2c->nmsgs = num;
 	init_completion(&i2c->completion);
 
+	/* Decide standard mode or Dynamic mode */
+	i2c->dynamic = true;
+
+	/* Initialize prev message type */
+	i2c->prev_msg_tx = false;
+
+	/*
+	 * Scan through nmsgs, use dynamic mode when none of the below three
+	 * conditions occur. We need standard mode even if one condition holds
+	 * true in the entire array of messages in a single transfer.
+	 * If read transaction as dynamic mode is broken for delayed reads
+	 * in xlnx,axi-iic-2.0 / xlnx,xps-iic-2.00.a IP versions.
+	 * If read length is > 255 bytes.
+	 * If smbus_block_read transaction.
+	 */
+	for (count = 0; count < i2c->nmsgs; count++) {
+		broken_read = (i2c->quirks & DYNAMIC_MODE_READ_BROKEN_BIT) &&
+				(i2c->tx_msg[count].flags & I2C_M_RD);
+		max_read_len = (i2c->tx_msg[count].flags & I2C_M_RD) &&
+				(i2c->tx_msg[count].len > MAX_READ_LENGTH_DYNAMIC);
+		smbus_blk_read = (i2c->tx_msg[count].flags & I2C_M_RECV_LEN);
+
+		if (broken_read || max_read_len || smbus_blk_read) {
+			i2c->dynamic = false;
+			break;
+		}
+	}
+
 	ret = xiic_reinit(i2c);
 	if (!ret)
 		__xiic_start_xfer(i2c);
@@ -1021,7 +1057,7 @@ static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
 static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 {
 	struct xiic_i2c *i2c = i2c_get_adapdata(adap);
-	int err, count;
+	int err;
 
 	dev_dbg(adap->dev.parent, "%s entry SR: 0x%x\n", __func__,
 		xiic_getreg8(i2c, XIIC_SR_REG_OFFSET));
@@ -1030,25 +1066,6 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	if (err < 0)
 		return err;
 
-	/* Decide standard mode or Dynamic mode */
-	i2c->dynamic = true;
-
-	/* Initialize prev message type */
-	i2c->prev_msg_tx = false;
-
-	/*
-	 * Enter standard mode only when read length is > 255 bytes or
-	 * for smbus_block_read transaction
-	 */
-	for (count = 0; count < i2c->nmsgs; count++) {
-		if (((i2c->tx_msg[count].flags & I2C_M_RD) &&
-		     i2c->tx_msg[count].len > MAX_READ_LENGTH_DYNAMIC) ||
-		    (i2c->tx_msg[count].flags & I2C_M_RECV_LEN)) {
-			i2c->dynamic = false;
-			break;
-		}
-	}
-
 	err = xiic_start_xfer(i2c, msgs, num);
 	if (err < 0) {
 		dev_err(adap->dev.parent, "Error xiic_start_xfer\n");
@@ -1091,10 +1108,23 @@ static const struct i2c_adapter xiic_adapter = {
 	.algo = &xiic_algorithm,
 };
 
+static const struct xiic_version_data xiic_2_00 = {
+	.quirks = DYNAMIC_MODE_READ_BROKEN_BIT,
+};
+
+#if defined(CONFIG_OF)
+static const struct of_device_id xiic_of_match[] = {
+	{ .compatible = "xlnx,xps-iic-2.00.a", .data = &xiic_2_00 },
+	{},
+};
+MODULE_DEVICE_TABLE(of, xiic_of_match);
+#endif
+
 static int xiic_i2c_probe(struct platform_device *pdev)
 {
 	struct xiic_i2c *i2c;
 	struct xiic_i2c_platform_data *pdata;
+	const struct of_device_id *match;
 	struct resource *res;
 	int ret, irq;
 	u8 i;
@@ -1104,6 +1134,13 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (!i2c)
 		return -ENOMEM;
 
+	match = of_match_node(xiic_of_match, pdev->dev.of_node);
+	if (match && match->data) {
+		const struct xiic_version_data *data = match->data;
+
+		i2c->quirks = data->quirks;
+	}
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	i2c->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(i2c->base))
@@ -1215,14 +1252,6 @@ static int xiic_i2c_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#if defined(CONFIG_OF)
-static const struct of_device_id xiic_of_match[] = {
-	{ .compatible = "xlnx,xps-iic-2.00.a", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, xiic_of_match);
-#endif
-
 static int __maybe_unused xiic_i2c_runtime_suspend(struct device *dev)
 {
 	struct xiic_i2c *i2c = dev_get_drvdata(dev);
-- 
2.25.1

