Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24A01697D7D
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Feb 2023 14:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbjBONdU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Feb 2023 08:33:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbjBONdS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Feb 2023 08:33:18 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB3ED4492;
        Wed, 15 Feb 2023 05:33:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sk+qXGwsWflKAsVIRBDNNQJTRVuLfRge2MIoqLD+TYIy7tppIkz7iISr3q1vyyCsqAlPqRPJ80YKlPTQMzXAgd+G7Lo9c8hNdRkHA0IwB5/IZTrErPdLaAh77zleEmSzRx8L7jhrnXNQCmwV41kRQgQ73XPVYfUcf8Ks4kohwQHyNU3vPsGgsEo7lTyNJ+ZDrUoxNi4U7evsX7h+FdEHPAL6y/ZIZsezSrppK6wzFV/Ee8EeewMfuxbgLLU2rRwi2+zCYosbRQcJ3cG69NyZPeoFGIOYCGzl8LWMVwHLBjXnk1jVcFbcysckZVlQvlud/gAx4scbM+XcX1wcjvxfcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkFQFhPEhbNHgoFvcD+RjSqYj5J6yFkMBsYk4+w1lbk=;
 b=D/waJyvpKNQMQfBHOt2vszzXV7Ef3R34WG2Os477PBJMR1HeIWjt7xijPbn83KL9TweZWXLOuVezd3Dkzscf4bfMDwaObjvUZIQrWuWW6yZ+Fc+qv2WKqmlD0SzYOAxtCQVT1JAPqWaBjDd0dFpmgjdTVCYKglUWrtft0/8afFqguKFTCKxjrI5muZ33zONcuR3ioZPp+2ib1r8cFr5/YnMJkB3fbFjNGNFTmlnqTMlSdy7DypujxKZDD89lH/lJ09BgQdF61zRgHYsmFnw9oEhuH9STue4uJB0MzxrHpWK9vvKUwAfk+XlX4+ZIv/wgCs/HiA/ZJF4EnCjMPzzXsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkFQFhPEhbNHgoFvcD+RjSqYj5J6yFkMBsYk4+w1lbk=;
 b=cFXyXst4DkOOwIIpD6WwFkbMHl6JWcaHo/lk2kNeLjNkX1K3UYXrGDSE/jGKf0mfY0zUc3mMMT04EXVfN7x6ubFAmf6GaVYU30zp28gB/QLlG3LFFd0qRhsEuVZd3jAqZydaxlOWG0CTpQHzaBE6nAQWkC9QlOf1P8YA8yRZrpY=
Received: from SN4PR0501CA0129.namprd05.prod.outlook.com
 (2603:10b6:803:42::46) by DM8PR02MB8139.namprd02.prod.outlook.com
 (2603:10b6:8:1c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 13:33:14 +0000
Received: from SN1NAM02FT0046.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:42:cafe::de) by SN4PR0501CA0129.outlook.office365.com
 (2603:10b6:803:42::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12 via Frontend
 Transport; Wed, 15 Feb 2023 13:33:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0046.mail.protection.outlook.com (10.97.5.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.12 via Frontend Transport; Wed, 15 Feb 2023 13:33:14 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 15 Feb 2023 05:33:07 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 15 Feb 2023 05:33:07 -0800
Envelope-to: git@amd.com,
 manikanta.guntupalli@amd.com,
 michal.simek@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 manion05gk@gmail.com,
 robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org,
 andrew@lunn.ch,
 devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.3] (port=42322 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pSHuF-0002p2-3v; Wed, 15 Feb 2023 05:33:07 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id E47A81055BC; Wed, 15 Feb 2023 19:02:29 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <devicetree@vger.kernel.org>, <andrew@lunn.ch>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <git@amd.com>, <manikanta.guntupalli@amd.com>,
        <srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
        <manion05gk@gmail.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH V6 3/3] i2c: xiic: Add SCL frequency configuration support
Date:   Wed, 15 Feb 2023 19:02:24 +0530
Message-ID: <1676467944-17426-4-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1676467944-17426-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1676467944-17426-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1NAM02FT0046:EE_|DM8PR02MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: f512936d-7fda-4f1d-8b56-08db0f5930a7
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WNS3UdzDB7R3F0ZMZ9ZASjXaQxbhPaXCaIZq3wI3QMBQokA2BT+JzzNfPAtwUkl+psWpXFBuOL1BbXEXzPl9SDIPYoDIVCinD7fNyVkgD7qWy0N+p3ptzy65NrZJi5REnoDZgC/uYWSkjVHkqK07XcHyvtrixw2WslH/GqRvLpiH1qXx6Lw6w2WwOGkHYsoYEKZ0Jy82VEYVmJKVuTBsrtxdSbMffhdrro6bHJNhfzYKi74KjKVWIhqbxz5beANoD7LG34W36NAsEczlXPdas1waLYegjBbr+tUu2Vhz4fLJrc8QaHLWgoWlj5yVrFnSYaPxPGVI3iBBoI7DY3yMBJLzGxwFS501m0L6gUvMDIugDbA8c/ob2EMxYLLZv+G1EMMIQFilch+T2cE2U7GiajYKih6YJSiZdzF+Rgex7QYKV8yAaewM328CzxQDXLxXcL7xxXEUjOTI2kJoXndD5MSjhSKDXMPsPW/bpkhzEBSCTbqo3nVITfe51mYh2f0eplFTEqmXHGFsfk4KBsbVoqbmXEFZt9oczuAZ4tskmnmKoGQbjm28JbMJHHL50j75DmcffT22VikAziSHvIsvBjRfTrL0tJqEvr0oQGN/knFDJVuk/XcfRUGZ9G3/BA2FYIyn2T38BWRMmEp/iJdpaNMJUllNk383fiygaSjLVkXuo2XmGUKaE07rXBf6MSCUFr7xmefR2hAJrB2Z+TpitDv3DkFySMAJPyhNhyeEI8Nvq8oV4NginMwpCBphV7Y0
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230025)(396003)(136003)(39860400002)(346002)(376002)(451199018)(40470700004)(36840700001)(46966006)(40480700001)(83380400001)(36860700001)(47076005)(40140700001)(83170400001)(356005)(82310400005)(7636003)(82740400003)(42882007)(478600001)(6666004)(107886003)(6266002)(186003)(26005)(2616005)(336012)(36756003)(40460700003)(41300700001)(8676002)(2906002)(70586007)(70206006)(4326008)(5660300002)(8936002)(7416002)(44832011)(54906003)(110136005)(42186006)(316002)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 13:33:14.5068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f512936d-7fda-4f1d-8b56-08db0f5930a7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0046.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8139
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
Changes since v1: none
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

