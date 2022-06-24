Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24DF5559931
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jun 2022 14:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231963AbiFXMIH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jun 2022 08:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231968AbiFXMIF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jun 2022 08:08:05 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CECAD10EB;
        Fri, 24 Jun 2022 05:08:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SS37MsWcqrivLJ21Wfasdadub3NTszv2PbQwXlumMg8qQaJHr6CSq9BM6kVwy09D5b0Me24GMK2OBsuqwXjtgCdB6mpRv4fCs7qMGe2P6n5BuNuhQ8riLKWD539440O1INp0eFPCPZjQ6leD8iE7vRgZiCqVOc39um5bBHsglxtsjpxrTNeK+xyvEX29s0YACvUWqX83S9i8p4m0KGrnZI3vX3timxP0CBiXCXl5+Cd4bofcouzVPyeS0mBf7rjS9TpIB8nSsh3HH6cSbSahCzUFu92tlWJphrhsAefWoby7hkT6FqzdcZBNCTWvoEEgkz8ey7yttKWWlOjqZgwE0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xD5FK3/R7laeDT8Ts5J63UVmyLmY5cn5Zjuujg0tTLI=;
 b=bd3qhjvW1RuMf7UmwN6fQqrMmrmTPwzcYGRCQDo3o7xaN68fcGmagh4yQI0jN4C42wZTR09PRJdxJprmAT8pbyNdHE7tz8p7wL0WEsMSL/tm2Mz/Z6OwNiHTpWZXHpGqItOVO+iqHUCO9Rn3synCWocnSWwRMQD8lDCo4mghdXZmZDnLXrmoLkWhkqBipcfgaMddNqskjoiQciFe0Vv/9Wsw21PcedASrom192MKHAzSuGwKqNhdnd4nZ6MKuX9L/PQPeddpFKvw+3Ia5bu5GkptwOqc7e4vPPgZAa/9DewCaLASvvV/+yb6Jddj171PAez74pdOcRY3YTVZlCRYfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xD5FK3/R7laeDT8Ts5J63UVmyLmY5cn5Zjuujg0tTLI=;
 b=hm5PsnsjFFi7IHgOJOU8BmYhSV9RuHW4Sttlk5ZgxkuhxdMLUN4gWZnFynIcV42Mcshgyt4oe9JjDkjMbLEsD9zji0XZYWYbbLNzpFJbR7ICYc6Ws2nMcWCFNPCQOnrZJ1mRpj4WJyuLqTUgP6P4wgPeGfgMccd+KU0qiDyDAKI=
Received: from SA0PR11CA0004.namprd11.prod.outlook.com (2603:10b6:806:d3::9)
 by BY5PR02MB6609.namprd02.prod.outlook.com (2603:10b6:a03:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 24 Jun
 2022 12:08:01 +0000
Received: from SN1NAM02FT0030.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d3:cafe::1e) by SA0PR11CA0004.outlook.office365.com
 (2603:10b6:806:d3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Fri, 24 Jun 2022 12:08:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0030.mail.protection.outlook.com (10.97.5.194) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 12:08:00 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 24 Jun 2022 05:07:58 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 24 Jun 2022 05:07:58 -0700
Envelope-to: git@amd.com,
 michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.2] (port=47740 helo=xhdvnc102.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1o4i6P-000BZb-Me; Fri, 24 Jun 2022 05:07:58 -0700
Received: by xhdvnc102.xilinx.com (Postfix, from userid 90444)
        id 646B910454F; Fri, 24 Jun 2022 17:35:58 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <git@amd.com>
CC:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH 11/12] i2c: xiic: Add SCL frequency configuration support
Date:   Fri, 24 Jun 2022 17:35:26 +0530
Message-ID: <1656072327-13628-12-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7c96803-6ce3-4c27-2abb-08da55da2f1d
X-MS-TrafficTypeDiagnostic: BY5PR02MB6609:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dDs9kYoP2a7z6YQU5Mzqrjp6QP5x2tBQ8T0Y64garhoOXzSxh0goYE3gE3lmW7Yiy1m+2Jq8XMOdPyi3DAvhSjSBFCtWrL3SQZDQEQmnp/Vk/Ty6UVATSWprpw13diokSriPg45xLaGuT76MvuLMCvCopse7cdB/MuI+K6DPdN0VZ7d6I3TGziCUxNMjXFhoAGyFQdA/8BUsVG0oI3XSHhDEhqJGMocv2uJLakP4EW2dvZXqUTu799SC51sz77nmJp6rOJ6mtYMOhpfxjE5vdGRAnjakQ+mo1LZS9+PBIR0ZHX3zrYXT64JR0vWVTW/bFZmLHaa42z8PTYloyHmTzpojD5u8NtlDs5Wv2omKesEFVj7eyeFof2OouyscLuuGG/0lF2+GSvFa9MEpJ/HUodql/xW0q390z9YNGMA2wpRNuW1kgWW0JLSwMClLnx+Nuz3thkwC4lwPwzJNXKG2HzlVl1kfyXKtbAJWvqs7JG1kc84/SwlKiMQSDIE3NQ45V4gtV0HriSKtgQ1v4qBrfTYoEJ7WS/WDDEf0SXVvDbk8gvlU+Na/vL2mX8OLMRwAPDoHJ1yC8cmW0lmODW7K99IyXCIQgUz2oc0hlMB56m77EiMbiuFfwp2DzCfsTrWT20M2H/DN3UYryZNKwelWUfP/ld69GTO1aX5OqZuqn5XXuPgWHSYCzMyR7Ta2zYeUOgx3FW28jUODRhEQK7I13Im/XFIiX+cWeGpvnuvP8HqUYLph3AwYZ7ppDVPtPQlh9sDQUKTw6sGlciduuessXspz/r4hN/H6lOebWcwFt0KqawRNr+VMUUdFy8Xhp6N9Pe8UAX4GpeL0WpYdleUrVUN5pxtqHeQDkGvNzr+E2mk=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39860400002)(40470700004)(46966006)(36840700001)(83380400001)(426003)(47076005)(110136005)(336012)(40480700001)(8936002)(36860700001)(44832011)(42186006)(2616005)(186003)(26005)(54906003)(4326008)(107886003)(40460700003)(6266002)(478600001)(41300700001)(8676002)(2906002)(40140700001)(6666004)(356005)(82310400005)(70206006)(316002)(36756003)(5660300002)(70586007)(82740400003)(7636003)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 12:08:00.7237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c96803-6ce3-4c27-2abb-08da55da2f1d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0030.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6609
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
to default values (configured in vivado design). So, setting SCL
frequency is done inside reinit function after the soft reset.
This allows configuration of SCL frequency exclusively through
software via device tree property, overriding the vivado design.
If the clock-frequency parameter is not specified in DT, driver
doesn't configure frequency, making it backward compatible.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 149 ++++++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index f9492c39d3c7..f29acabba5e7 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -65,6 +65,8 @@ enum xiic_endian {
  * @prev_msg_tx: Previous message is Tx
  * @smbus_block_read: Flag to handle block read
  * @quirks: To hold platform specific bug info
+ * @input_clk: Input clock to I2C controller
+ * @i2c_clk: I2C SCL frequency
  */
 struct xiic_i2c {
 	struct device *dev;
@@ -85,12 +87,30 @@ struct xiic_i2c {
 	bool prev_msg_tx;
 	bool smbus_block_read;
 	u32 quirks;
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
 #define XIIC_MSB_OFFSET 0
 #define XIIC_REG_OFFSET (0x100 + XIIC_MSB_OFFSET)
 
@@ -109,6 +129,19 @@ struct xiic_version_data {
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
@@ -190,6 +223,7 @@ struct xiic_version_data {
 
 static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num);
 static void __xiic_start_xfer(struct xiic_i2c *i2c);
+static int xiic_setclk(struct xiic_i2c *i2c);
 
 /*
  * For the register read and write functions, a little-endian and big-endian
@@ -315,6 +349,10 @@ static int xiic_reinit(struct xiic_i2c *i2c)
 
 	xiic_setreg32(i2c, XIIC_RESETR_OFFSET, XIIC_RESET_MASK);
 
+	ret = xiic_setclk(i2c);
+	if (ret)
+		return ret;
+
 	/* Set receive Fifo depth to maximum (zero based). */
 	xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, IIC_RX_FIFO_DEPTH - 1);
 
@@ -1118,6 +1156,105 @@ static const struct of_device_id xiic_of_match[] = {
 MODULE_DEVICE_TABLE(of, xiic_of_match);
 #endif
 
+enum i2c_scl_freq {
+	REG_VALUES_100KHZ = 0,
+	REG_VALUES_400KHZ = 1,
+	REG_VALUES_1MHZ = 2
+};
+
+/* Reg values in ns derived from I2C spec and AXI I2C PG for different frequencies */
+static const struct timing_regs timing_reg_values[] = {
+	{ 5700, 5000, 4300, 550, 5000 }, /* Reg values for 100KHz */
+	{ 900, 900, 900, 400, 1600 },    /* Reg values for 400KHz */
+	{ 380, 380, 380, 170, 620 },     /* Reg values for 1MHz   */
+};
+
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
+ *	   -EINVAL on failure (scl frequency not supported or THIGH is 0)
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
+	if (!i2c->i2c_clk)
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
 static int xiic_i2c_probe(struct platform_device *pdev)
 {
 	struct xiic_i2c *i2c;
@@ -1176,6 +1313,15 @@ static int xiic_i2c_probe(struct platform_device *pdev)
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
@@ -1219,6 +1365,9 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 			i2c_new_client_device(&i2c->adap, pdata->devices + i);
 	}
 
+	dev_dbg(&pdev->dev, "mmio %08lx irq %d scl clock frequency %d\n",
+		(unsigned long)res->start, irq, i2c->i2c_clk);
+
 	return 0;
 
 err_clk_dis:
-- 
2.25.1

