Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15FFF678FA9
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 06:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232698AbjAXFH3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 00:07:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbjAXFH1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 00:07:27 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982AC3B654;
        Mon, 23 Jan 2023 21:06:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oP77QmJXZRl80WfwnteEVi/BygRros+YPx7ld9l/ZnUNZA5JX9L4RR8AKzcRKHWj80QI4esYUXynkspb4/uJ6LKqOLLLxcMiiuBMACdew7TN4z0xExl4ZXy4erz7kdVBYyqxLvVSFMq0/JZjTOPxeW/KDbH4SNpjYngBFdYsxPoLnjJBpNjI9zfJxM5ZUEctAEvB1mT0C/F19oIobngvUMOcI8prqPjowky7mpc6CGdn8E42Xxbewjex3fjH/SIXdNv2Cjca0k4v3YBXYl8DDcOX5W3rXgMxjYxqf2xTJX+juT3TraFBdaMGoOepC4wCckISwKehF5rIp1usnYsOew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBsX1+pRlI42Vjnyt7QG1jZNA26/1AjE4ooPk5i3+qE=;
 b=F1ppQux9ePhRqoyTWs9XEt8sjUYW8lDJCaoKAuKILPuK9Q/buxhW2mTH5dZTUwcKg0VMA/MwJy/ngI77mP+gpamKKXRnqOG03s131P4LminuCsMR5wUfxQ99aBx0bchBqGwSe01fDT28i5BPpeLfp/WE7EyBHTuvb4bVAgd0ZqDux992oqDMFIqpiK1qfkJ6tgCQ2JDp3c/UpWKq+nTt0RxXfT0WbLG8xqBEjJzD/vbuCcXgkzDwryQMWIf1gyQTwWkGfIUnEgu6Xiz8el31BeudWqteQTzRVa2VMnfSsJhDZED7ZdKTGEGOfUylaUmfPspvWAZT9Z+cJmUyPbqxyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBsX1+pRlI42Vjnyt7QG1jZNA26/1AjE4ooPk5i3+qE=;
 b=FG7/IH/quTI6aayP6Dihgk8uO/H0Rhmy3fz97XV9g9aNJxkz6U8xKaXkhkgLx3XtFJPeX5dHu2vAkag0peR41P8xzATR4HZNXYX58PKmBLXkzSZKB3P3kXxQr+0Jr7u/LHN5ka8aVFj6h8AkXY49t1uB1lIzbZ54QuFImTajP9E=
Received: from DS7PR03CA0225.namprd03.prod.outlook.com (2603:10b6:5:3ba::20)
 by PH0PR02MB7639.namprd02.prod.outlook.com (2603:10b6:510:5c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 05:06:48 +0000
Received: from DM3NAM02FT030.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::20) by DS7PR03CA0225.outlook.office365.com
 (2603:10b6:5:3ba::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 05:06:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT030.mail.protection.outlook.com (10.13.4.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Tue, 24 Jan 2023 05:06:48 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 21:06:45 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 21:06:45 -0800
Envelope-to: git@amd.com,
 manikanta.guntupalli@amd.com,
 michal.simek@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 manion05gk@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.3] (port=57542 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pKBW8-0001V6-WC; Mon, 23 Jan 2023 21:06:45 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id 7791A1055B5; Tue, 24 Jan 2023 10:34:57 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <git@amd.com>, <manikanta.guntupalli@amd.com>,
        <srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
        <manion05gk@gmail.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH V3 9/9] i2c: xiic: Add SCL frequency configuration support
Date:   Tue, 24 Jan 2023 10:34:42 +0530
Message-ID: <1674536682-25278-10-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1674536682-25278-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1674536682-25278-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3NAM02FT030:EE_|PH0PR02MB7639:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a25e2a2-1d42-4eb6-9185-08dafdc8cbfe
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aZxAOtt6F42gfHwSP3JwLGRpiXOvq1/rjYXFHuuieLlVVp+yhHZsob5MNMBNLH5rBCCaorSCjbLEQ1KyML5E7RcYhds9wKXWgB7dlpwuvL7t94jjzL16PpqPsqMzGtoYgOsWcXVebHe3TeqCnONBVsZuP9K1fno1nTeyQglnNIWcDqwo/Pti/9tiOZcD9VsaAFjE8H0h4lZ69fJ35MgOTqoDbqBZIDDHuUQXvQ5ObKxLYUqaEIMSY5sU8AlSY4/eVlLexiKYJzOt+5kVZsFchG7dCo04/9EoO6qOUtfz1ruO5ZrOi32SEknggPZk1wc92aXqS+nCWJeTLWWrf9UBrY+u39LutucO3IBOTU/+Jq18LU74kdrOpdwr676onLJ+17vf8QXL24WS23RGae+dXTrBIJ1sKEP5wlIMEv7iamTyWh6PCZyz8WgAD9G0Z/Izu/k3rTDFpc87G3SnHW0AvUSzRkyBI2RbqtzdPvHW7VVG1fKteocFv3BEyPnQB/WrieIbve/VRQcvRgymHCyOUDVXJ2Vpx+SW3mNZpEkdFkAwfIJPohSQ9FLFbOGpqwmD7tUxB6QBnMe83Dnbb+yh1g0NPzJJntyPq6D3iyI0mf8LFS5CgxQlaeQoQi/B4Ou3Ghucsr3fPW4fnB7WuEir2s52tFL/NBKwS5wZv474P+rsBStbE1q9Cde/Vva2SHv93jpZHCrlpw0Syvsd6rpD8BAsptO5WxzwJuxYV+HeXHod2wn0Ddc9rRTu9qthhjE3
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(7636003)(83170400001)(82740400003)(40460700003)(40140700001)(36756003)(40480700001)(356005)(82310400005)(316002)(336012)(42882007)(478600001)(110136005)(54906003)(42186006)(8676002)(70206006)(70586007)(4326008)(47076005)(2616005)(2906002)(44832011)(83380400001)(36860700001)(26005)(6666004)(5660300002)(6266002)(41300700001)(107886003)(186003)(8936002)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 05:06:48.3153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a25e2a2-1d42-4eb6-9185-08dafdc8cbfe
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT030.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7639
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

From 'clock-frequency' device tree property, configure I2C SCL
frequency by calculating the timing register values according to
input clock.

After soft reset in reinit function, the timing registers are set
to default values (configured in design tool). So, setting SCL
frequency is done inside reinit function after the soft reset.
This allows configuration of SCL frequency exclusively through
software via device tree property, overriding the design.
If the clock-frequency parameter is not specified in DT, driver
doesn't configure frequency, making it backward compatible.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Acked-by: Michal Simek <michal.simek@amd.com>
---
 drivers/i2c/busses/i2c-xiic.c | 148 ++++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 682b3567e83e..1e89e8270749 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -46,6 +46,12 @@ enum xiic_endian {
 	BIG
 };
 
+enum i2c_scl_freq {
+	REG_VALUES_100KHZ = 0,
+	REG_VALUES_400KHZ = 1,
+	REG_VALUES_1MHZ = 2
+};
+
 /**
  * struct xiic_i2c - Internal representation of the XIIC I2C bus
  * @dev: Pointer to device structure
@@ -66,6 +72,8 @@ enum xiic_endian {
  * @prev_msg_tx: Previous message is Tx
  * @quirks: To hold platform specific bug info
  * @smbus_block_read: Flag to handle block read
+ * @input_clk: Input clock to I2C controller
+ * @i2c_clk: I2C SCL frequency
  */
 struct xiic_i2c {
 	struct device *dev;
@@ -86,12 +94,37 @@ struct xiic_i2c {
 	bool prev_msg_tx;
 	u32 quirks;
 	bool smbus_block_read;
+	unsigned long input_clk;
+	unsigned int i2c_clk;
 };
 
 struct xiic_version_data {
 	u32 quirks;
 };
 
+/**
+ * struct timing_regs - AXI I2C timing registers that depend on I2C spec
+ * @tsusta: setup time for a repeated START condition
+ * @tsusto: setup time for a STOP condition
+ * @thdsta: hold time for a repeated START condition
+ * @tsudat: setup time for data
+ * @tbuf: bus free time between STOP and START
+ */
+struct timing_regs {
+	unsigned int tsusta;
+	unsigned int tsusto;
+	unsigned int thdsta;
+	unsigned int tsudat;
+	unsigned int tbuf;
+};
+
+/* Reg values in ns derived from I2C spec and AXI I2C PG for different frequencies */
+static const struct timing_regs timing_reg_values[] = {
+	{ 5700, 5000, 4300, 550, 5000 }, /* Reg values for 100KHz */
+	{ 900, 900, 900, 400, 1600 },    /* Reg values for 400KHz */
+	{ 380, 380, 380, 170, 620 },     /* Reg values for 1MHz   */
+};
+
 #define XIIC_MSB_OFFSET 0
 #define XIIC_REG_OFFSET (0x100 + XIIC_MSB_OFFSET)
 
@@ -110,6 +143,19 @@ struct xiic_version_data {
 #define XIIC_RFD_REG_OFFSET  (0x20 + XIIC_REG_OFFSET)	/* Rx FIFO Depth reg  */
 #define XIIC_GPO_REG_OFFSET  (0x24 + XIIC_REG_OFFSET)	/* Output Register    */
 
+/*
+ * Timing register offsets from RegisterBase. These are used only for
+ * setting i2c clock frequency for the line.
+ */
+#define XIIC_TSUSTA_REG_OFFSET (0x28 + XIIC_REG_OFFSET) /* TSUSTA Register */
+#define XIIC_TSUSTO_REG_OFFSET (0x2C + XIIC_REG_OFFSET) /* TSUSTO Register */
+#define XIIC_THDSTA_REG_OFFSET (0x30 + XIIC_REG_OFFSET) /* THDSTA Register */
+#define XIIC_TSUDAT_REG_OFFSET (0x34 + XIIC_REG_OFFSET) /* TSUDAT Register */
+#define XIIC_TBUF_REG_OFFSET   (0x38 + XIIC_REG_OFFSET) /* TBUF Register */
+#define XIIC_THIGH_REG_OFFSET  (0x3C + XIIC_REG_OFFSET) /* THIGH Register */
+#define XIIC_TLOW_REG_OFFSET   (0x40 + XIIC_REG_OFFSET) /* TLOW Register */
+#define XIIC_THDDAT_REG_OFFSET (0x44 + XIIC_REG_OFFSET) /* THDDAT Register */
+
 /* Control Register masks */
 #define XIIC_CR_ENABLE_DEVICE_MASK        0x01	/* Device enable = 1      */
 #define XIIC_CR_TX_FIFO_RESET_MASK        0x02	/* Transmit FIFO reset=1  */
@@ -310,12 +356,102 @@ static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
 	return 0;
 }
 
+/**
+ * xiic_setclk - Sets the configured clock rate
+ * @i2c: Pointer to the xiic device structure
+ *
+ * The timing register values are calculated according to the input clock
+ * frequency and configured scl frequency. For details, please refer the
+ * AXI I2C PG and NXP I2C Spec.
+ * Supported frequencies are 100KHz, 400KHz and 1MHz.
+ *
+ * Return: 0 on success (Supported frequency selected or not configurable in SW)
+ *        -EINVAL on failure (scl frequency not supported or THIGH is 0)
+ */
+static int xiic_setclk(struct xiic_i2c *i2c)
+{
+	unsigned int clk_in_mhz;
+	unsigned int index = 0;
+	u32 reg_val;
+
+	dev_dbg(i2c->adap.dev.parent,
+		"%s entry, i2c->input_clk: %ld, i2c->i2c_clk: %d\n",
+		__func__, i2c->input_clk, i2c->i2c_clk);
+
+	/* If not specified in DT, do not configure in SW. Rely only on Vivado design */
+	if (!i2c->i2c_clk || !i2c->input_clk)
+		return 0;
+
+	clk_in_mhz = DIV_ROUND_UP(i2c->input_clk, 1000000);
+
+	switch (i2c->i2c_clk) {
+	case I2C_MAX_FAST_MODE_PLUS_FREQ:
+		index = REG_VALUES_1MHZ;
+		break;
+	case I2C_MAX_FAST_MODE_FREQ:
+		index = REG_VALUES_400KHZ;
+		break;
+	case I2C_MAX_STANDARD_MODE_FREQ:
+		index = REG_VALUES_100KHZ;
+		break;
+	default:
+		dev_warn(i2c->adap.dev.parent, "Unsupported scl frequency\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * Value to be stored in a register is the number of clock cycles required
+	 * for the time duration. So the time is divided by the input clock time
+	 * period to get the number of clock cycles required. Refer Xilinx AXI I2C
+	 * PG document and I2C specification for further details.
+	 */
+
+	/* THIGH - Depends on SCL clock frequency(i2c_clk) as below */
+	reg_val = (DIV_ROUND_UP(i2c->input_clk, 2 * i2c->i2c_clk)) - 7;
+	if (reg_val == 0)
+		return -EINVAL;
+
+	xiic_setreg32(i2c, XIIC_THIGH_REG_OFFSET, reg_val - 1);
+
+	/* TLOW - Value same as THIGH */
+	xiic_setreg32(i2c, XIIC_TLOW_REG_OFFSET, reg_val - 1);
+
+	/* TSUSTA */
+	reg_val = (timing_reg_values[index].tsusta * clk_in_mhz) / 1000;
+	xiic_setreg32(i2c, XIIC_TSUSTA_REG_OFFSET, reg_val - 1);
+
+	/* TSUSTO */
+	reg_val = (timing_reg_values[index].tsusto * clk_in_mhz) / 1000;
+	xiic_setreg32(i2c, XIIC_TSUSTO_REG_OFFSET, reg_val - 1);
+
+	/* THDSTA */
+	reg_val = (timing_reg_values[index].thdsta * clk_in_mhz) / 1000;
+	xiic_setreg32(i2c, XIIC_THDSTA_REG_OFFSET, reg_val - 1);
+
+	/* TSUDAT */
+	reg_val = (timing_reg_values[index].tsudat * clk_in_mhz) / 1000;
+	xiic_setreg32(i2c, XIIC_TSUDAT_REG_OFFSET, reg_val - 1);
+
+	/* TBUF */
+	reg_val = (timing_reg_values[index].tbuf * clk_in_mhz) / 1000;
+	xiic_setreg32(i2c, XIIC_TBUF_REG_OFFSET, reg_val - 1);
+
+	/* THDDAT */
+	xiic_setreg32(i2c, XIIC_THDDAT_REG_OFFSET, 1);
+
+	return 0;
+}
+
 static int xiic_reinit(struct xiic_i2c *i2c)
 {
 	int ret;
 
 	xiic_setreg32(i2c, XIIC_RESETR_OFFSET, XIIC_RESET_MASK);
 
+	ret = xiic_setclk(i2c);
+	if (ret)
+		return ret;
+
 	/* Set receive Fifo depth to maximum (zero based). */
 	xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, IIC_RX_FIFO_DEPTH - 1);
 
@@ -1138,6 +1274,15 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(i2c->dev);
 	pm_runtime_set_active(i2c->dev);
 	pm_runtime_enable(i2c->dev);
+
+	/* SCL frequency configuration */
+	i2c->input_clk = clk_get_rate(i2c->clk);
+	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
+				   &i2c->i2c_clk);
+	/* If clock-frequency not specified in DT, do not configure in SW */
+	if (ret || i2c->i2c_clk > I2C_MAX_FAST_MODE_PLUS_FREQ)
+		i2c->i2c_clk = 0;
+
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					xiic_process, IRQF_ONESHOT,
 					pdev->name, i2c);
@@ -1181,6 +1326,9 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 			i2c_new_client_device(&i2c->adap, pdata->devices + i);
 	}
 
+	dev_dbg(&pdev->dev, "mmio %08lx irq %d scl clock frequency %d\n",
+		(unsigned long)res->start, irq, i2c->i2c_clk);
+
 	return 0;
 
 err_clk_dis:
-- 
2.25.1

