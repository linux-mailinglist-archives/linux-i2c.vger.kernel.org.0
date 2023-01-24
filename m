Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1330678F9B
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 06:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232547AbjAXFFr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 00:05:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232517AbjAXFFq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 00:05:46 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B1939B94;
        Mon, 23 Jan 2023 21:05:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4EmV8/7gyZ+EDu649eSibef8qM6t2oQRoQwbjA3p4D9V1wzOTTuo9zxS9089Fj0AVBbgTeF1WAFrMuDABH26CWkdwDVKVLYA1yq2vZ/YHSFtXWVXSZTUEkYkYRCBj4eycdmzyIQM3UCIjkJ9rFFcnhslUG4yPWyQk0Di+Bri/1wZqR+Jep5O9WFM4SBQ0n28NlbqoWuX/Qax9GdzOHPF/Za4q2zhn8eI19Ahy/T9Y8c0JFkCp0cFFnXjdXmdZi1s92lhn/zcMex/309u5XMDriOj+COZjm7LhN3g5CTY9RGuHbyaCrX8dJtV7U8AfPvUmaSBUQBGVYhf2f4GP0QYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsyUwEc5NXppls5c9t0BMvF/KAxjebhTOEd9VuxXDJE=;
 b=P3AfdtiYPvj/FzCJc3iIb1QAeGoSwdW5OdRtvsU+c5QMHiPyGLqafND5pQjaf9jLE8ByuYrHxYmrZI0iMa7qibYU5A3+R+IM7Kchice1JOxuE0Lgm6CqCN0kq5MYbB+c/hjUCLNJMrYETWueBp1gBKHpWCIh4n0cl6SGYriS7XrWeuJ+AzEMANYQh/aw5Kw9xA/65TsgxH5FtsUsJs7oYd1C3kG+BhnZ3513hrOecqbt++YFAHE/bxFDhn0oAtMQLQ1Pb9kMFzaGhku3kpMcrI8SHof9jk+UqA9w5RlAwznwIvqnllBd3Zv3kqruat6i4akNWAuAMqhqBX59yLivNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsyUwEc5NXppls5c9t0BMvF/KAxjebhTOEd9VuxXDJE=;
 b=DHCcgvhlMoPo8k9pEpcrwoxlGEJ3sSj2tUU+JStc2n05FS1e6mbGl5Ovz2LbdDpUo9s6kCmBXD7LV2QTLA16NcHlS4koOWulKAt37qTPMRgwvkdIxYlU38HbC4cwxapnJSi9dIByyEuiSepX5r6tXYYZgfn9Ngs2b9REqamzfyA=
Received: from DS7PR03CA0329.namprd03.prod.outlook.com (2603:10b6:8:2b::33) by
 SN7PR02MB9303.namprd02.prod.outlook.com (2603:10b6:806:328::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 05:05:30 +0000
Received: from DM3NAM02FT058.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:2b:cafe::78) by DS7PR03CA0329.outlook.office365.com
 (2603:10b6:8:2b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 05:05:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT058.mail.protection.outlook.com (10.13.5.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Tue, 24 Jan 2023 05:05:30 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 21:05:26 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 21:05:26 -0800
Envelope-to: git@amd.com,
 manikanta.guntupalli@amd.com,
 michal.simek@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 manion05gk@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.3] (port=57528 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pKBUs-0003CS-0y; Mon, 23 Jan 2023 21:05:26 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id CBEF91055AF; Tue, 24 Jan 2023 10:34:48 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <git@amd.com>, <manikanta.guntupalli@amd.com>,
        <srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
        <manion05gk@gmail.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH V3 3/9] i2c: xiic: Switch to Xiic standard mode for i2c-read
Date:   Tue, 24 Jan 2023 10:34:36 +0530
Message-ID: <1674536682-25278-4-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1674536682-25278-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1674536682-25278-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3NAM02FT058:EE_|SN7PR02MB9303:EE_
X-MS-Office365-Filtering-Correlation-Id: 49d17aaf-9d00-4d87-7fe5-08dafdc89d82
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LU79PWL+/bAjatp+bxPWuomMTv4XbhFfHN4dYaNRoaslyR9PVyW2uBVtsjM9hQ1hD/WKMqldBoFmVTMp3dSyD+3ghXomS+R3dyIU5aQkN7LHHDPnuc65SyCOHj2sWZFug3miSaomEJj6qL0IKu4LS4Ib9eTbHmEMlrYX/0Quhu/xQJwA0ENPOeqYkDu+CYJoegJNxe5sKFR4PELtFuuyLgxtZVqlXyWEWQxtngfPxFAQYb0lKn74sOFukkvDu0E+yWIwRm26gKNUSrjB9Sqbhgk2VISMMH5ssUrn0ZvjXOZKnPZzhrenoXlKoDrVZGC/olQkXw3l46ZB7Hlh+iJjh+9K/8Dmxp2/GZkXMD8kpgH8QSuvNoQ2zlm/Sw7P0G0dDdmsx5p9GK9OT2xKCblnimnsbogL7Wxfg7zpb2IBnxqKkmOaCq8oD5Xbt/Magt1YLQ8uyBKPZvznSF8rRL9bqiv9oczT0HjvPd+Vt2ExN8PoFFTcC9EYmWwfyJdpjCDR/sZLRO28mGhtDW6eBqbaN4O5Og3FHT4NGxYPEdxlDPNu/VjvXmqfCVJsQMGkx23omjAsqQZhe46/JMXrvAJ/Z9Yhq56eg3OtXIE6p80OUoCdDYp68hMd4zgCxnX8oVWyo7avUEWhUioYl3PuzlYzIe/nPWskP0mN6+IltNjZtJ446czCQfZ76GLyqY+zmxR0c53K3UegFegUuu/aewP62S4zKH5ikVFn40j+Z+9Ut28jR8Jf3kd5lxsnhOor4rII
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(83380400001)(36860700001)(83170400001)(82740400003)(41300700001)(356005)(7636003)(82310400005)(44832011)(2906002)(5660300002)(8936002)(4326008)(40460700003)(40480700001)(26005)(6266002)(186003)(8676002)(316002)(6666004)(42882007)(107886003)(47076005)(336012)(70586007)(70206006)(54906003)(2616005)(42186006)(110136005)(478600001)(36756003)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 05:05:30.3270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d17aaf-9d00-4d87-7fe5-08dafdc89d82
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT058.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR02MB9303
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
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
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Acked-by: Michal Simek <michal.simek@amd.com>
---
 drivers/i2c/busses/i2c-xiic.c | 96 +++++++++++++++++++++--------------
 1 file changed, 57 insertions(+), 39 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 86da622e060c..edc64b79e293 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -32,6 +32,7 @@
 #include <linux/pm_runtime.h>
 
 #define DRIVER_NAME "xiic-i2c"
+#define DYNAMIC_MODE_READ_BROKEN_BIT	BIT(0)
 
 enum xilinx_i2c_state {
 	STATE_DONE,
@@ -62,6 +63,7 @@ enum xiic_endian {
  * @singlemaster: Indicates bus is single master
  * @dynamic: Mode of controller
  * @prev_msg_tx: Previous message is Tx
+ * @quirks: To hold platform specific bug info
  */
 struct xiic_i2c {
 	struct device *dev;
@@ -80,6 +82,11 @@ struct xiic_i2c {
 	bool singlemaster;
 	bool dynamic;
 	bool prev_msg_tx;
+	u32 quirks;
+};
+
+struct xiic_version_data {
+	u32 quirks;
 };
 
 #define XIIC_MSB_OFFSET 0
@@ -878,7 +885,8 @@ static void __xiic_start_xfer(struct xiic_i2c *i2c)
 
 static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
 {
-	int ret;
+	bool broken_read, max_read_len, smbus_blk_read;
+	int ret, count;
 
 	mutex_lock(&i2c->lock);
 
@@ -891,6 +899,34 @@ static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
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
@@ -913,36 +949,6 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	if (err < 0)
 		return err;
 
-	/* Decide standard mode or Dynamic mode */
-	i2c->dynamic = true;
-
-	/* Initialize prev message type */
-	i2c->prev_msg_tx = false;
-
-	/*
-	 * If number of messages is 1 and read length is > 255 bytes,
-	 * enter standard mode
-	 */
-
-	if (i2c->nmsgs == 1 && (i2c->tx_msg->flags & I2C_M_RD) &&
-	    i2c->tx_msg->len > MAX_READ_LENGTH_DYNAMIC) {
-		i2c->dynamic = false;
-	} else if (i2c->nmsgs > 1) {
-		int count;
-
-		/*
-		 * If number of messages is more than 1 and one of them is
-		 * a read message, enter standard mode. Since repeated start
-		 * operation in dynamic mode read is not happenning
-		 */
-		for (count = 0; count < i2c->nmsgs; count++) {
-			if (i2c->tx_msg[count].flags & I2C_M_RD) {
-				i2c->dynamic = false;
-				break;
-			}
-		}
-	}
-
 	err = xiic_start_xfer(i2c, msgs, num);
 	if (err < 0) {
 		dev_err(adap->dev.parent, "Error xiic_start_xfer\n");
@@ -985,10 +991,23 @@ static const struct i2c_adapter xiic_adapter = {
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
@@ -998,6 +1017,13 @@ static int xiic_i2c_probe(struct platform_device *pdev)
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
@@ -1112,14 +1138,6 @@ static int xiic_i2c_remove(struct platform_device *pdev)
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

