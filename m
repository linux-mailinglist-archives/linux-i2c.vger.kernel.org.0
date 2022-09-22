Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85D945E5DD2
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 10:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbiIVIqZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 04:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbiIVIqL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 04:46:11 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BFBAB4EB7;
        Thu, 22 Sep 2022 01:46:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9COJqNHTwUYUGchW93X/Fl/d+WHhMXfPeuBEtNJQOMQ+NOgSAHKEfnY1mv4kAh/WgYzhszY7XYaQ5zXP/oMKYfWuT1nymtsDtDYau3QzMdHz/9zvb2SHeS14OFX1NheSC0cFpuvL8BYzjkKCzxm1lYvNT69xQLBPe4OZ2h2dZiNPExNC9byyWqZFACcyeKoufqatquGCLzkh4FqCkmAEFQARshFzx61szzufVKn2vPNHmoa0IYwAZaTdIWUk4N/H4VPoD9WMejFulAubgD2JPPT3AOin/mRy7A5GuyQsr9xF0gwgX7itM29Tx0mL2bYnZZhBGGSSiAIJEQdN04aXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsHUS3C1n7T3b+RL+BYY69eanxK8oXIrB2rvQchod08=;
 b=ls0YSZfR28X4ic4WIcaXXwxHnT/ahbEQg4kzikR8ZUAO4xSMsPt6w5K0k3h1unDD0QYD2bGiwVZT2h77N3eHct4evoClzQ4QIkOlz1DGgut7G6aQB6+MLOcy3sZyVKt7Wr2oLW/Ha9IM32LX8187zKW2AzSGebrhoFGeMfJBvSgDFbKRXHagziMeQlMdYkrkulJDfgjIMpQcMsTsqad0Q29QU8zQ7BY0GVERln2HzrqQPICYybCubCYzvf532dECBanAOZf18qdWU6XDUf/W8t1v7J4SghP0Lpk8s3whl3Dc6TSpmcH6KwhfH8qI5iMd7eXPS2U4B1GQ5snpTKsBhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsHUS3C1n7T3b+RL+BYY69eanxK8oXIrB2rvQchod08=;
 b=c4Xw2booZ2MT0HI4O6cqUnpR6YWoHB2nbBDWKOW7Nn8LEjPlSsyWRDnLYAeTVsnytQncrI+Gc+8ZFqhAIu1XEOMG68PxwRiRihQjY9FfvGVNKpzLhzNvIMLqcd6VYbfAvaYnErn77ayAtOy5ccId6E+yOxxB9H4dZmI9Q+A9NtI=
Received: from BN8PR12CA0031.namprd12.prod.outlook.com (2603:10b6:408:60::44)
 by BL0PR02MB6513.namprd02.prod.outlook.com (2603:10b6:208:1c3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.18; Thu, 22 Sep
 2022 08:46:02 +0000
Received: from BN1NAM02FT033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::46) by BN8PR12CA0031.outlook.office365.com
 (2603:10b6:408:60::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18 via Frontend
 Transport; Thu, 22 Sep 2022 08:46:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT033.mail.protection.outlook.com (10.13.3.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 08:46:02 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 22 Sep 2022 01:45:43 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.9 via Frontend Transport; Thu, 22 Sep 2022 01:45:43 -0700
Envelope-to: michal.simek@amd.com,
 radhey.shyam.pandey@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.6] (port=54841 helo=xhdvnc106.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1obHq3-0005Xy-6z; Thu, 22 Sep 2022 01:45:43 -0700
Received: by xhdvnc106.xilinx.com (Postfix, from userid 90444)
        id E007C610BF; Thu, 22 Sep 2022 14:15:07 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
        <shubhrajyoti.datta@amd.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH V2 3/9] i2c: xiic: Switch to Xiic standard mode for i2c-read
Date:   Thu, 22 Sep 2022 14:14:48 +0530
Message-ID: <1663836294-5698-4-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1NAM02FT033:EE_|BL0PR02MB6513:EE_
X-MS-Office365-Filtering-Correlation-Id: f45eeda3-6450-4a71-e7d2-08da9c76e156
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GZ1aUBe2kaFr00fZYLms5QTa3xtz1xIE0A0cVN+LdANzoG/zU7pzmrXMhZLMPTot7NS9yKTe8l+If0GQ3LcHz5tLMsi5r5h5c1KvjCur6PQku18p5KOxYbRu0HgFFS65kno5W8IEbbl3/ErB/SxAGyecgmajVUbygaK5hoSPowNQ6vHPfAdbS4hn1H8u33TSbwwJVoplJ/I9RJ6pImwyFKsEMmyoZ+BPjT3Gr/POEEfdl31BWz8o32x32AGQ7irG+mXbYKxe2I4ADlzBJWNOu4CD6o3hwg8clnvQ/UEv46VWCy1QupbI3upV+L0amk0Fjo7hhXByyL7QBSIVHf/00NhuT1bbfYptNBRapUKSL9dQHEXQy9i3pGtiThCsBJMyInFv91rrShdCd+lXm5GC5PmrctDCT4CqwX4vZN2e9n5oI2Avdos2oBjL9Vvl9Iy+PepE8oPALvhYFZKO5z92c1dntrsyiGS7lIy5pUQRpw20ayPn8V+r58863fQFoXT3XIeh7FxzgW+IkATk9NUZhxTwYdCM4ctGudg1CLMp/LhQbVAyVKeKLGRKtqLPwzj0PDn35UeZBcYGO1Aao7rmuLTighXVcIepq/A/ojAzaz5E5IAih7YBu7PDCpIilGlKig7YtLPRL3GqOY00kIWmJmTJK3QhC27ntCOaL4uuaamj1s2oW4ZRQ/kS7+VnOcdyPcibImfsA1NbcIFJIarsC22v0TEOXeS8/s/YkKa1H8Vu4ojgdBNdBDwpuY1vK84/oX6luGb/5Rl4N2eYjvLok3ENrzT9FbHGI3EV/Ec+vD9QL9EXZZrnktibkAbotno/
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(36756003)(40460700003)(336012)(5660300002)(8936002)(40480700001)(54906003)(2906002)(316002)(6266002)(83380400001)(42186006)(426003)(47076005)(110136005)(26005)(356005)(7636003)(6666004)(107886003)(41300700001)(2616005)(186003)(44832011)(36860700001)(478600001)(82740400003)(82310400005)(70206006)(70586007)(4326008)(8676002)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 08:46:02.5270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f45eeda3-6450-4a71-e7d2-08da9c76e156
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6513
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/i2c/busses/i2c-xiic.c | 96 +++++++++++++++++++++--------------
 1 file changed, 57 insertions(+), 39 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 79802fffa26c..10e0fafb25f1 100644
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
@@ -1109,14 +1135,6 @@ static int xiic_i2c_remove(struct platform_device *pdev)
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

