Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2757B395BD2
	for <lists+linux-i2c@lfdr.de>; Mon, 31 May 2021 15:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232243AbhEaNZD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 May 2021 09:25:03 -0400
Received: from mail-mw2nam10on2051.outbound.protection.outlook.com ([40.107.94.51]:5409
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232321AbhEaNXC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 May 2021 09:23:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqXOoskScU7DL1myMJ/FJDIGDjEnSE3lR73o8ovqLkPtxayAqO54mdwNcO0jOX0ITmYVLWnavPyGlWa2TGYwg85MuI8gm8+YnZ16gEJvdp0wbWDOXFZh93DHgh1Z4bvoorljn8RJxFriAKYRgoN6LJqz2QhjJwyOg0TTD+BocEYG3GHlIM4MoouauA9fnWA+P6cUcHX3MOF3ngGDtkmDgXHp7u/jBUNdGLWRGdIvLaZuoRkwi7CAUyYGw6VXJI1h4Rv7hffEQg/c5WguiQfy2FGWFiClsF5QVsdgyjDSg27d+RL3Ttci4fGJQDkqcjHaNyK+Db++NZjVSAPMqL8l6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwntOM4arWjrrTTBU/PsgkpjojDk5S2QwRFtIJeaNXQ=;
 b=DeQdG04n2n13rrZNlV4Sru1dGFIVr0rHoBngYEm4r+AwE1H7gZKRft5Usex3ik52SiE/SY9JUXiNJ6y0mRthSBcs6Y7YyOGztzQPA0Hte7jsHWwEz1nX2SIOTASo2eCannrtIFBtUPwIGaT0oULU0BhGeA8dbFi+E/0JCnDWpAAXvlMXRRx8yj4oKCti8/kagYW1ScBIvljSTXtcNNeI5o0v1BoZSwwFBG6j5b9jGvaeTYvanslAPk8zYDP8fTu/nD+7nZq3B1z0WXPDXWEXQH2wvnfIVjtGhQ85+awMz2CjvqUt8UZYQWZPzjQn+KUa/ADW4lxOQdNDdFML8N7ctA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwntOM4arWjrrTTBU/PsgkpjojDk5S2QwRFtIJeaNXQ=;
 b=XHIGJ95S5WKgShKxpmb2pmQWWXE+bKvBHl9TIxeZ3TXjpOv5Aa1Jw980q8I4tGsf9VcsRPFc4HKDOJDjjeZs8NkC7jgPR2gV8IPKQ7OFKJdO7C6QtfWKau1EcWowkD/c3TsfkpMaa32oEz7zSBrpK0rr03Y2CmRYoSMZNbOCKqk=
Received: from SN6PR2101CA0022.namprd21.prod.outlook.com
 (2603:10b6:805:106::32) by DM6PR02MB5627.namprd02.prod.outlook.com
 (2603:10b6:5:36::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Mon, 31 May
 2021 13:21:21 +0000
Received: from SN1NAM02FT0060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:106:cafe::77) by SN6PR2101CA0022.outlook.office365.com
 (2603:10b6:805:106::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.3 via Frontend
 Transport; Mon, 31 May 2021 13:21:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0060.mail.protection.outlook.com (10.97.4.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Mon, 31 May 2021 13:21:20 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 06:20:55 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 31 May 2021 06:20:55 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de
Received: from [10.140.6.25] (port=53014 helo=xhdnagasure40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lnhqf-0004GE-Nq; Mon, 31 May 2021 06:20:54 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH 07/10] i2c: xiic: Switch to Xiic standard mode for i2c-read
Date:   Mon, 31 May 2021 07:19:45 -0600
Message-ID: <20210531131948.19477-8-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
References: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db401ed1-4153-43b8-dfe4-08d92436fb18
X-MS-TrafficTypeDiagnostic: DM6PR02MB5627:
X-Microsoft-Antispam-PRVS: <DM6PR02MB5627416D8B0F3E6F2D5A20DCCA3F9@DM6PR02MB5627.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TvjS478+vhI5KVnf0FqTwiHnlS7SOzm7CyPLRg1A6jy6PJQ2hsFUYOWxwGSFDSLWxDPw78X5MGMptzlLMRRR0aC6bJUrwrE28yLzcaIe44BKiQNcuGD6/MlRRJZUwS+w1G4XFDarr3dCotCBoqd8nIa7JRPthepfSOLvniHwKpAXDARE4P9Q9G1NB+txFoba0cAqsVboPxKLLJ4qTtY7ARLV5i4Lt0EglWQFj7OJNf7ma4PI3ay3ctKIen4r3unzObuIe/D7yyrDBAK8I7BfTfXWROPTN8vOi49X0Rxe4UjhlI26zBOihon/SxqtwxumJnhyryqmv+ieaRaiRz6fx9WJgVWxBgK0mOsf2NfvNJvRhMiSy96n0yV7RGQYDZvfQDbmK5HnOPlcQ2nfZMwmpF2ZnFm/m2BQtUMnYowHhI8XE7h44wpDbVohFUvKUuw/jElmvydEn64hoWnQ+fWZ6GRZhUsHMTIbxh/zNNqt4nOJZCEFqOcK0LicWA295xTAQ93Y+ifpkc7+vWjLdaaiI8KAdKRYwmqhl425iJSetLd0PO4nw8nEKxQxVs/Q0sFjV3TIe50lbC4vL40jjXrGdahcGeVL7ILWfloiH6p3s1OCaCYopWoYKxbaupvF79ft1o8d0rx7/fD4p1MxNysR6viEbE0x20RPFNA2KTUuK7ckXzeKKGkyo/ErZlIYtrPd
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(36840700001)(46966006)(478600001)(7636003)(9786002)(83380400001)(4326008)(54906003)(110136005)(36756003)(336012)(356005)(1076003)(2906002)(2616005)(5660300002)(6636002)(36906005)(426003)(44832011)(70206006)(70586007)(6666004)(82310400003)(47076005)(107886003)(7696005)(36860700001)(82740400003)(26005)(316002)(8936002)(186003)(8676002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 13:21:20.8381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db401ed1-4153-43b8-dfe4-08d92436fb18
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5627
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
 drivers/i2c/busses/i2c-xiic.c | 58 +++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 1a26e5ebfc6c..2f0808249ceb 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -33,6 +33,8 @@
 
 #define DRIVER_NAME "xiic-i2c"
 
+#define DYNAMIC_MODE_READ_BROKEN_BIT	BIT(0)
+
 enum xilinx_i2c_state {
 	STATE_DONE,
 	STATE_ERROR,
@@ -63,6 +65,7 @@ enum xiic_endian {
  * @dynamic: Mode of controller
  * @prev_msg_tx: Previous message is Tx
  * @smbus_block_read: Flag to handle block read
+ * @quirks: To hold platform specific bug info
  */
 struct xiic_i2c {
 	struct device *dev;
@@ -82,6 +85,11 @@ struct xiic_i2c {
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
@@ -1032,6 +1040,7 @@ static int xiic_start_xfer(struct xiic_i2c *i2c)
 
 static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 {
+	bool broken_read, max_read_len, smbus_blk_read;
 	struct xiic_i2c *i2c = i2c_get_adapdata(adap);
 	int err, count;
 
@@ -1056,13 +1065,22 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	i2c->prev_msg_tx = false;
 
 	/*
-	 * Enter standard mode only when read length is > 255 bytes or
-	 * for smbus_block_read transaction
+	 * Scan through nmsgs, use dynamic mode when none of the below three
+	 * conditions occur. We need standard mode even if one condition holds
+	 * true in the entire array of messages in a single transfer.
+	 * If read transaction as dynamic mode is broken for delayed reads
+	 * in xlnx,axi-iic-2.0 / xlnx,xps-iic-2.00.a IP versions.
+	 * If read length is > 255 bytes.
+	 * If smbus_block_read transaction.
 	 */
 	for (count = 0; count < i2c->nmsgs; count++) {
-		if (((i2c->tx_msg[count].flags & I2C_M_RD) &&
-		     i2c->tx_msg[count].len > MAX_READ_LENGTH_DYNAMIC) ||
-		    (i2c->tx_msg[count].flags & I2C_M_RECV_LEN)) {
+		broken_read = (i2c->quirks & DYNAMIC_MODE_READ_BROKEN_BIT) &&
+			       (i2c->tx_msg[count].flags & I2C_M_RD);
+		max_read_len = (i2c->tx_msg[count].flags & I2C_M_RD) &&
+				(i2c->tx_msg[count].len > MAX_READ_LENGTH_DYNAMIC);
+		smbus_blk_read = (i2c->tx_msg[count].flags & I2C_M_RECV_LEN);
+
+		if (broken_read || max_read_len || smbus_blk_read) {
 			i2c->dynamic = false;
 			break;
 		}
@@ -1108,10 +1126,23 @@ static const struct i2c_adapter xiic_adapter = {
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
@@ -1121,6 +1152,13 @@ static int xiic_i2c_probe(struct platform_device *pdev)
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
@@ -1201,6 +1239,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 			i2c_new_client_device(&i2c->adap, pdata->devices + i);
 	}
 
+	dev_info(&pdev->dev, "mmio %08lx irq %d\n", (unsigned long)res->start, irq);
+
 	return 0;
 
 err_clk_dis:
@@ -1232,14 +1272,6 @@ static int xiic_i2c_remove(struct platform_device *pdev)
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
2.17.1

