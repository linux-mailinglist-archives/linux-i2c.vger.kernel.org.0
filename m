Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F57E3B4E01
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jun 2021 12:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbhFZKbG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Jun 2021 06:31:06 -0400
Received: from mail-dm6nam08on2043.outbound.protection.outlook.com ([40.107.102.43]:27552
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229999AbhFZKbE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 26 Jun 2021 06:31:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxsMmjOm7TkpApjJYDicRTYwJoXFP6IieoYdJ2L0p1WhhNE5erDGFvYyirqaKjKQWJV53qufe1tLqauPuCbnq5Mgu+YXdVgeZH5Sb9S+xGkWL2HTvpqBfVnLpcfWkiDoRAmM7E899qw+BOwJ17duFvlD4PZ6tjfd0pSCSjHoLxi4Nvq0giDlgk5+3VeicAsuL1NuYFX55zldGEXzpgMNUpdqxtGU3b6MAWivSumMfAVIRqPQoBMbW/EEqz31I5ufuMTS6Kc7Sl/TyOw8nI1fHMz+418LFXcNrS29FDvZELU8LdkHp0B8OihLY9/suj9E3hDwtQ8V7/EEcOr/mEni8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXKCqVaK3KBPFimqqPK6oUy9SddBtUFw0eGUpOZA+WQ=;
 b=al8/SQmWhUXo+9xlj+oy6x6ZJH47LRmgaApNXhH5BP3BAh0OjMuj+4sYJW0sawdgNM4mPBWKpHNyYP6WX/BnvzO8U0aD0s1bCjUPlHveXpQLKGVPzwDImccl3PNdDEgUQcBhRYa92ukwYb/7bFStCQ4Oe7zAQbG2WUREmLHOlfH6hbsT09RrouXkQ7GHHRXum4Ffpe6pvruHlwPFfrZ+90Hxbd8QrFMYwR7lzbTGJM5jQOSEljAcwxDMeUvK2xrpSpThPqrWXqgdYgepSsiSZCBGlKAZGSL5bqvz4frUH7wtWkwG4vI2Jawabnanfks1rH0rh6ryaHBaoN/EXPQnMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXKCqVaK3KBPFimqqPK6oUy9SddBtUFw0eGUpOZA+WQ=;
 b=n3k0M/MdS/zedNjLYU1Wb2Tsj6Px4kGTpt8TqxsswGK4cGT5X3UJBzJKICQnc7CiaGTh2cG9fwAwsDTvNU35cEm0FjoU3raztIMwMXQrbG1YP+rGGOj6SxYtLfJWwoHYPyoBZX73bUDfQgoQ6HKL7kEbJgMot1LRyvdz8im6DFQ=
Received: from SA0PR11CA0163.namprd11.prod.outlook.com (2603:10b6:806:1bb::18)
 by CO6PR02MB7745.namprd02.prod.outlook.com (2603:10b6:303:a3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Sat, 26 Jun
 2021 10:28:41 +0000
Received: from SN1NAM02FT0061.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:1bb:cafe::40) by SA0PR11CA0163.outlook.office365.com
 (2603:10b6:806:1bb::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Sat, 26 Jun 2021 10:28:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0061.mail.protection.outlook.com (10.97.4.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Sat, 26 Jun 2021 10:28:40 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 26 Jun 2021 03:28:24 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sat, 26 Jun 2021 03:28:24 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de,
 joe@perches.com
Received: from [10.140.6.6] (port=55646 helo=xhdappanad40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lx5Xz-000AWJ-4c; Sat, 26 Jun 2021 03:28:23 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        <joe@perches.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH v2 03/10] i2c: xiic: Switch to Xiic standard mode for i2c-read
Date:   Sat, 26 Jun 2021 15:57:59 +0530
Message-ID: <20210626102806.15402-4-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1586486-46d5-4f96-519c-08d9388d2adc
X-MS-TrafficTypeDiagnostic: CO6PR02MB7745:
X-Microsoft-Antispam-PRVS: <CO6PR02MB77456FA87DA2D504AA5D3046CA059@CO6PR02MB7745.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H96C24umzG5x57pIUHrbQ34YYTVHZGbK+uagK4F7qa0ZOV7igbJIkiAzbFvJ3lV2oSWIIRj0GKnrC6qqVkhKqQ5cXkm0T+wBWGDjumns8V0Sg/wUASWLAqiZimt1Z4i9DcZ2Utkqz8xO0nzN6jgysagB2OSQifRlRuxNMR7sigjZ+KeeXE1gWZ6V8LHC1sVu2hHgst89e0W6IHhAIJjW6n/+OqBky6c3IUht5izQ7XeIcQlJVHgB63/uhV3uI6HWZi2DLY9sTzRjRjBN6hJuAnLEdvHsMWqo/nt3IwRp7aBxxg1xS9UX7NVoJb4uGcOhUMLHIMxTuwqQThBFmqSxoQhvI7Bvb/QhATRwCxmP9ocDS046oy5nikpSj07qHAeKWuac/1Lsw2MPTWr3CumUaoWdBCW+d4RaBkUE+crY1DjtfCd3zdhIvN+1Ug+kuYbVn1ax6IpbE4S+J5S9i9HkWEZXNkQTz/8sQ2xmJi5wQ4TNCqQnCUPowUIx+tQwZEeVyvDh98DVIOaGBnHCxRicDwN3rT++sr44L6lw90HXDugL4Vz1TRZBxPDm0rq3uIysYCDS4FB/c8TW67BHzBHFP6WJK7W+zxR+zSBSqbOgeqza4WcekziWMIm8+Dn4KmHYJVYnBU06eGIPnTvnY4CB/SM/ymoAjMRR5FYj0Zw/9yipSHcO0aas0oEBXdkEWPHAYQboRSt2AJsvr3N1LJlULQXxdw5WyE3/oSAxzurGS18=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(36840700001)(46966006)(8936002)(4326008)(1076003)(6666004)(36756003)(44832011)(2616005)(356005)(426003)(316002)(36906005)(47076005)(82310400003)(9786002)(83380400001)(8676002)(82740400003)(5660300002)(107886003)(7696005)(6636002)(336012)(36860700001)(478600001)(2906002)(26005)(186003)(70206006)(70586007)(7636003)(110136005)(54906003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2021 10:28:40.9462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1586486-46d5-4f96-519c-08d9388d2adc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0061.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7745
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

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
---
 drivers/i2c/busses/i2c-xiic.c | 54 ++++++++++++++++++++++++++++-------
 1 file changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 004103267e9c..c31d0d0a8384 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -33,6 +33,8 @@
 
 #define DRIVER_NAME "xiic-i2c"
 
+#define DYNAMIC_MODE_READ_BROKEN_BIT	BIT(0)
+
 enum xilinx_i2c_state {
 	STATE_DONE,
 	STATE_ERROR,
@@ -62,6 +64,7 @@ enum xiic_endian {
  * @singlemaster: Indicates bus is single master
  * @dynamic: Mode of controller
  * @prev_msg_tx: Previous message is Tx
+ * @quirks: To hold platform specific bug info
  */
 struct xiic_i2c {
 	struct device *dev;
@@ -80,8 +83,12 @@ struct xiic_i2c {
 	bool singlemaster;
 	bool dynamic;
 	bool prev_msg_tx;
+	u32 quirks;
 };
 
+struct xiic_version_data {
+	u32 quirks;
+};
 
 #define XIIC_MSB_OFFSET 0
 #define XIIC_REG_OFFSET (0x100+XIIC_MSB_OFFSET)
@@ -963,6 +970,7 @@ static int xiic_start_xfer(struct xiic_i2c *i2c)
 
 static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 {
+	bool broken_read, max_read_len;
 	struct xiic_i2c *i2c = i2c_get_adapdata(adap);
 	int err, count;
 
@@ -986,10 +994,21 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	/* Initialize prev message type */
 	i2c->prev_msg_tx = false;
 
-	/* Enter standard mode only when read length is > 255 bytes */
+	/*
+	 * Scan through nmsgs, use dynamic mode when none of the below two
+	 * conditions occur. We need standard mode even if one condition holds
+	 * true in the entire array of messages in a single transfer.
+	 * If read transaction as dynamic mode is broken for delayed reads
+	 * in xlnx,axi-iic-2.0 / xlnx,xps-iic-2.00.a IP versions.
+	 * If read length is > 255 bytes.
+	 */
 	for (count = 0; count < i2c->nmsgs; count++) {
-		if ((i2c->tx_msg[count].flags & I2C_M_RD) &&
-		    i2c->tx_msg[count].len > MAX_READ_LENGTH_DYNAMIC) {
+		broken_read = (i2c->quirks & DYNAMIC_MODE_READ_BROKEN_BIT) &&
+			       (i2c->tx_msg[count].flags & I2C_M_RD);
+		max_read_len = (i2c->tx_msg[count].flags & I2C_M_RD) &&
+				(i2c->tx_msg[count].len > MAX_READ_LENGTH_DYNAMIC);
+
+		if (broken_read || max_read_len) {
 			i2c->dynamic = false;
 			break;
 		}
@@ -1035,11 +1054,23 @@ static const struct i2c_adapter xiic_adapter = {
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
 
 static int xiic_i2c_probe(struct platform_device *pdev)
 {
 	struct xiic_i2c *i2c;
 	struct xiic_i2c_platform_data *pdata;
+	const struct of_device_id *match;
 	struct resource *res;
 	int ret, irq;
 	u8 i;
@@ -1049,6 +1080,13 @@ static int xiic_i2c_probe(struct platform_device *pdev)
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
@@ -1129,6 +1167,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 			i2c_new_client_device(&i2c->adap, pdata->devices + i);
 	}
 
+	dev_info(&pdev->dev, "mmio %08lx irq %d\n", (unsigned long)res->start, irq);
+
 	return 0;
 
 err_clk_dis:
@@ -1160,14 +1200,6 @@ static int xiic_i2c_remove(struct platform_device *pdev)
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

