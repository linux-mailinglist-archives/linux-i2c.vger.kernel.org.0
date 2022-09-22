Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CEEE5E5DE4
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 10:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbiIVIsN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 04:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbiIVIrp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 04:47:45 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224756AEA0;
        Thu, 22 Sep 2022 01:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A210HiNUuVVZ9jeu+r8zp0I4VYpsYnDek4Rrxx9DkLbmePPKk2wC6BcyqUe8vUUN3Plad2mS+FBgh+3QACdOszp/QoykQhQLbGgIiiagyGWj9bPFsT4gLDdCnvUo/YMdeD9anR4xbio5A1Kl09bPQzia/2t4GD/oSJhW8FJmBlsFK6R5sU4ptIKTJs7183sJaKi6NuJr0JviUMwV5QYESQF8W/GM46icrnyZGlBn5Try5on0D7B5puqKQsgdZiYE1Ahh3vXrgoJz0uqATuMMy7a1a78JG05Z28Nr/uMUKFkndeRSQxln/f9fnOoriMSooKcXDl4qZq8ny8QwlNA9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9ivYnQSEFuNK8ROpP65cQYM5OHbRqOr4h+0L2bvtA8=;
 b=Blqmfd3sjfLP28RSxpIa4Kk4yL1FFmgMZvwUiYtZWe87QKAJS0NaXMB7sH/X4MWeCllRbUfu/Dhv7nm9m4NjJxAKFu/wEEB53S+q1uQzxvEsj+wsfXwlgepOXzdlDsSw/Z0KeChJolb+gh4QOuJ+K3JE4txx0OvzFZEzAjgIq/JNGJlDs23zwC6blLJaXiXtZ7RU6P2pChSQhgkZUm+xd2hGu2RP3RIZ1SITJtErcgs1RJs27UcVH6sxRZfQ0qdb2VzB+feLby0EipTW1tp+rXQR87rdcVFNbfLXmReG17AeZfp9F1HvmV7YMP4nxRJG+g8vfLPlI85vb6SLvnTZNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9ivYnQSEFuNK8ROpP65cQYM5OHbRqOr4h+0L2bvtA8=;
 b=YRePnNGWLAh3y4fr5rP0+/TbfSArXveJfBhihCaXWfJ5Pey1KjYyZFIw8D8N115S2uqanobA23sWkfKpkS4iDytylgxnitFhY/84ZidCNl9qvakxrSBlyxvHPuMxglPVKzG+nxUZQ0LrOKNMSG9Eom86MHRQolKWBuektYCEuDo=
Received: from BN9PR03CA0536.namprd03.prod.outlook.com (2603:10b6:408:131::31)
 by SN4PR0201MB8821.namprd02.prod.outlook.com (2603:10b6:806:201::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Thu, 22 Sep
 2022 08:47:21 +0000
Received: from BN1NAM02FT019.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::6b) by BN9PR03CA0536.outlook.office365.com
 (2603:10b6:408:131::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19 via Frontend
 Transport; Thu, 22 Sep 2022 08:47:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT019.mail.protection.outlook.com (10.13.3.187) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 08:47:21 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 22 Sep 2022 01:47:03 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.9 via Frontend Transport; Thu, 22 Sep 2022 01:47:03 -0700
Envelope-to: michal.simek@amd.com,
 radhey.shyam.pandey@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.6] (port=54848 helo=xhdvnc106.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1obHrK-0001w3-CH; Thu, 22 Sep 2022 01:47:03 -0700
Received: by xhdvnc106.xilinx.com (Postfix, from userid 90444)
        id 1C248610BC; Thu, 22 Sep 2022 14:15:21 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
        <shubhrajyoti.datta@amd.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH V2 9/9] i2c: xiic: Add SCL frequency configuration support
Date:   Thu, 22 Sep 2022 14:14:54 +0530
Message-ID: <1663836294-5698-10-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1NAM02FT019:EE_|SN4PR0201MB8821:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f499798-2154-4e1e-fcd2-08da9c771037
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dPlwK6d0RdRcHI6irhnXsyLUeMgjX54u1F/FNU/dx9ifZQqcfrHY13j30il4O5QBSRDSFbLd5h8fM0s6wtsBqvLZDub0ST61CtwAvrnE1zeObnyXRQlNxMLfIEFBmOS3npiuC8An4M0ImJQOsMoTlWT8cdmPIuTajNWN6wJsk9xRf6HiK8/EfhGavsbllmnsT7xOZ+kym3WSAoNM5ALj1vj7RfCi+PsylJKAhXNL7/Fba5CgjAdNLChk3wXlN9HcJTbBpfKoo8KmCTm0UzV1/DjuzP5C8zyP2otNLRSvI68rWGTKfKb/D9DsyQcI8B47hIkiBbEePqbTp/TnBuGXgPLrLUUGYxWNvklcZc7xoi1Rb+fvA3f1rrNkcmD3OxnsY3JBX4w3sP7UhJzXmRTxGB6OGNyQ7AiyZfN19Y83LF2t6Q5qZCvsy2gKZWSLV72dAWYa7j6rAxUVuWDhtFWJbtDeX4uT6PWAUXWbuPfG8SxrHW2RZ8RUWLSaeBhJ0igW9bGzO3QXD9sxuWn4BriztVnbZX4E5kZN7IPVbSlvegfxJSdyGU0bZwD9S8kf9S5GmOz8F1v8wDu1Hz/ntnnCb+Yr3rVIYFLz/mIaAe/r1up56i3RsTQHkfW1uWFvGcqX0xYeqLRTvqD7zlOiAkIGf0GHAvBp+mj8119OkjQFp4DdqUToHhWkePVF/la5lQadgkzENgAJUR8OLqZD5mjtEqpxTB65wovIbsg0wedMm9osLGdqNj+G6LjVdsa97zJDMnF64qWtGZps85Icc7ftKEPU9TKXuqkY0kPyWF1NiRrlv7NHZN2WOg0/L0wTBzB/
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(46966006)(36840700001)(40470700004)(8676002)(6266002)(186003)(2616005)(2906002)(40140700001)(36756003)(8936002)(26005)(5660300002)(70586007)(4326008)(70206006)(44832011)(41300700001)(6666004)(107886003)(82740400003)(36860700001)(82310400005)(7636003)(356005)(47076005)(426003)(336012)(83380400001)(40460700003)(40480700001)(316002)(42186006)(54906003)(110136005)(478600001)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 08:47:21.1930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f499798-2154-4e1e-fcd2-08da9c771037
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT019.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8821
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 148 ++++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 0f03feb2ff78..d079aa7868c4 100644
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

