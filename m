Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6ACE344C8E
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Mar 2021 18:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbhCVRAt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Mar 2021 13:00:49 -0400
Received: from mail-dm6nam11on2074.outbound.protection.outlook.com ([40.107.223.74]:51627
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231631AbhCVRAS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Mar 2021 13:00:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+bgzL3A6eqNz+cWoURCycoFusX1Gm6bGcCAloO1ZfQDYqDA04dbLav51+vgV+pMWAkQHfnAoT73SyymtYN/S/XXHE6uykfiB5L1YnVpZBnxxnPRu/pU7+Pa1qITEZj48peA8Wu2A3wufjMq32UzXsNSDKI66DS7WharZ1+qV1TLEvLePnOqhwFxz32MLroslyULA3Pt742LjjY+D9hW+TA6BzbEZwN8Bz6sEctsBZV1MjJqcepriY0LInKcEDDpxm66AQMdC7whq29vmbaXCqfpNXXPv0ee2D5//MVyAdmyq0lMic4K5ojo6gehmopwQj+GPHAY/2lyM/rEaJ5WcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1xBsbPUpjiiTdutp+M4EluB4pTYPwz/aISejdlao/g=;
 b=i8hldcH+HMb+ygOkyrMChfzygOWPOl9T8n3wna9cW6KBKr2/R9U98f+IcwENFTPeLi9FgPqsahNUuWsOiPjXaE+l0+p2gXIWW+huq+g/xV6XkQ9asvoJEIDvPaSWXDkZoB+CP2KpRqqmjvy5XEJeOxPGjzixOxVquUkFWM46wJdOa97va5hg3eGTvkPsBrf13Blr1Ak1ndUQ3C77tEIn44FeSPFsCG/SbaykpbpjQqnpUx4BtAsSjhfWGmzDDgTHeP/QzeWFzaWOfr15nEnQ3eqmqtvJ0PjaJcXmnYymrDVyOp9BsppfaI98YdIB5DmW25ImBDiVmhjWvoAPvkb8Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1xBsbPUpjiiTdutp+M4EluB4pTYPwz/aISejdlao/g=;
 b=T/opZti+IhUS2t1ShZXlR8vHzAWYby9s5mgYIWhhYWA3A/X2qkY5jYUkEg196+KflizgvzIkI/zbiecGKfstXOqHccybJMQMuzd6PU/3tyFHfgtyEvoLK0ApSBL8RMiDyriKIle9bspF5EcaQ2TXkz0duvJdp4jrifDbeceVXhA=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1835.namprd12.prod.outlook.com (2603:10b6:3:10c::9) by
 DM5PR12MB1835.namprd12.prod.outlook.com (2603:10b6:3:10c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24; Mon, 22 Mar 2021 17:00:13 +0000
Received: from DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052]) by DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052%10]) with mapi id 15.20.3955.027; Mon, 22 Mar
 2021 17:00:13 +0000
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sanket Goswami <Sanket.Goswami@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Subject: [PATCH v2] i2c: designware: Add driver support for AMD NAVI GPU
Date:   Mon, 22 Mar 2021 22:29:47 +0530
Message-Id: <20210322165947.1921770-1-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR0101CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::14) To DM5PR12MB1835.namprd12.prod.outlook.com
 (2603:10b6:3:10c::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jatayu.amd.com (165.204.156.251) by MA1PR0101CA0028.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 17:00:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c56b566e-ec02-4cf8-f634-08d8ed53f5bc
X-MS-TrafficTypeDiagnostic: DM5PR12MB1835:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1835B847DB4824624AE9D1709C659@DM5PR12MB1835.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zLI7fIodAwVgWqTx1uYrdYzoEXj6WvCZezgqpiWJWfk3NW3D9tseUf5Fof7xEQ7iOBRKrdOO3mWkC+m6wteSwYhmZgvdlrBwVfErLDX9/iMUQw3fQ4u70ES8ECf3iVv0BLrUfB4KHldgLw0ID8PVKiw9+FFrze89V0ZVV7Hifngz93rVNC1tEqpy4QsBpncPzkTBiK6tT+7mxjXK+4W64scAFTrlyzOonEgqw8TNNzAlrIXRJj7IF48guOKM5BBKtgisPst40My/aC/g40uQArWvVigeBNRe+Mwpzhus4TFUMqcdxeZRODKaYFGbaVuxWbefTgELkYRdGCR0b5AD2TjJQFjZRkAhj7/vooLh/VFRFwav0bgnwVtIwDg16uh4sQHIQR36Hq/b3s6jZeNxMFXD2G4ZKCdscQE0ucZCokho8P+YDKqKe6OyiR+rzH/YDkHg/nFUoQF75Q9Z+v00xTf+7kJcZqjv92042wTFvrPGV6+0nrv7l+eMCj2c72XbAGVgFd+0P0vQUCFE5KD/e58yJWFDfMp7tRWT2Us6FZPaz+2HxNI7++ehkDKEh61WC6/X1iNHWbGaEnQDhU6xYogjgM34PtAwMv58A/erkHoo/FVAFlFaLsuT+2GxL5QArs7jZ+uIgO7lkKgOmmSTFuQuCAzoah4SFovmQLgzU+s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(16526019)(186003)(7696005)(52116002)(83380400001)(6486002)(66556008)(4326008)(36756003)(2616005)(66946007)(66476007)(956004)(26005)(478600001)(2906002)(1076003)(6666004)(8676002)(86362001)(54906003)(30864003)(8936002)(5660300002)(38100700001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?p0SCJhBSqmiBZLImp9ZU9Sv6wMzBQ15spHwXY4bWFIx4Aj1phPvwkpl0h6f6?=
 =?us-ascii?Q?BGhSeV/5TpHt7UjTj4WBt8PEF1RpW7x/jf9yu1zbp3DV15FhyOWEYu9xMTie?=
 =?us-ascii?Q?LzM/qt1bE3nwm4qBe9mFaDUsJHHVB3pZGmSWBsSZqBB/rl+T6sqXrgKOfHDh?=
 =?us-ascii?Q?A/4hFcrve9y2DW8N7N0pLYO3YCg1l7FrXwdBu89O4Ltx89kefDRZT3Bz/Nd+?=
 =?us-ascii?Q?5Clmp+cbHb+sWyXr4rzw00duN2ElX0BpteEp6sJrXoZERVvHLEdPY0eibOim?=
 =?us-ascii?Q?EA817SIeYNbPWT/vMJnk7zCzGKqk64qDHXw5AT0uzhAHedqmPUWtISlXf+K8?=
 =?us-ascii?Q?FQNO4W/L4n35gHDI93mHCccacsz/L7R+3wLNw9dfyKI2zfPML6bZcRmwsYvq?=
 =?us-ascii?Q?ImtVt36Uz/OrF2Oy9MCzoXxkSEH7wHjIbxAk+E+QtOo1gIDmGTVdHJIvRAg7?=
 =?us-ascii?Q?VOKFFL5TArLF56E7cZ9m7VdSIZQrsE2ZUfkYxlfgSgwqh2l2HRAn5LkOhVKC?=
 =?us-ascii?Q?5dM3QM0AH4egKwy9S1FK7jIa4OOq1IgGUIdi71AV0jNRmWl5GveGhBaVP7AA?=
 =?us-ascii?Q?urpT56XjC5Chh740G8rKmZ3JYsl2dHZM3VUIlw+sYNJQKf7PfUdAAQ3eiNCL?=
 =?us-ascii?Q?G/Un6DUthWjSdT6v0wkptsGhiAywSJXQ8JYNuQj14Pdr++2AQsLtwFE0Uxoa?=
 =?us-ascii?Q?3AR1GxBTCdyUubaWlAGzHIISB+oYtSVoVTt2cYIk/RX4LWm8Go1IzfG0g+J6?=
 =?us-ascii?Q?zSgxBLdtV7GBtnyE0MEplQ08IEU8BikwXd0ahA5p/C3N/crw9Grgu+KBQz+F?=
 =?us-ascii?Q?G22E5WdghW9gahZ5E2hGZZRBq77fly3KqttXT1Cpk1IT+RzN78Lkump4V+6u?=
 =?us-ascii?Q?JoeSl6udykr0SR6ItF0rVsfc5Lvw0iEM7u2cXlNIUIwoaXXXoA3PoBM2i/qU?=
 =?us-ascii?Q?X5L9aYUe9EzmW17vptzw2zsuvbaFOMwzrlPWE4/iW3FG7erK2jwAUtcm8EZ6?=
 =?us-ascii?Q?TNOkskCjl6oXTNGwWITe0ZMcnyfiUgceSB3MJEhM8YqeaKpd8b8i3v9Gc/fp?=
 =?us-ascii?Q?g5G/q9H7Ck/E0hGV41nuN5A8rAAIrfk6JgqpH/lfU6OXD2wU4ozDPTMLr2Nk?=
 =?us-ascii?Q?XRC3TTG2XxDjrKYwhCIV4gaxWPa23paQS0LkAYbXiu/e4c9by8bE8BTsfl10?=
 =?us-ascii?Q?Hc5c2lGnnlf/ha937SlUwD+sdGqKmeMA2t0TzH9whiLRuNsjFkcK4W7gN/Qa?=
 =?us-ascii?Q?V1orpNDWVGU1BnvE+2/UnxQKFeKfQ93ZWR+iQmLBraZLHr2sN5OZueuO2sSS?=
 =?us-ascii?Q?MF65S7aWkJ/NC6u6Brh1Dp8z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c56b566e-ec02-4cf8-f634-08d8ed53f5bc
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 17:00:13.5544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOalRnRkRWUn6+qnMujLfX4T0wn1I4m3Q01knTLCW+nZs6gHao+aSoXxNdKGrlbHc3vydHD7VU/IWXr9Hmd3QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1835
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The Latest AMD NAVI GPU card has an integrated Type-C controller and
Designware I2C with PCI Interface. The Type-C controller can be
accessed over I2C. The client driver is part of the USB Type-C UCSI
driver.

Also, there exists a couple of notable IP limitations that are dealt as
workarounds:
- I2C transaction work on a polling mode as IP does not generate
interrupt.
- I2C read command sent twice to address the IP issues.

Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Co-developed-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
Changes in v2:
- Utilized existing functionality of i2c_dw_xfer_init to configure I2C
  bus.
- Removed i2c_dw_populate_client and rewrrient navi_amd_register_client
  to deduplicate from existing drivers.
- Addressed review comments from Andy.
 
drivers/i2c/busses/i2c-designware-common.c |   3 +
 drivers/i2c/busses/i2c-designware-core.h   |   3 +
 drivers/i2c/busses/i2c-designware-master.c | 136 +++++++++++++++++++++
 drivers/i2c/busses/i2c-designware-pcidrv.c |  57 +++++++++
 4 files changed, 199 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 3c19aada4b30..50883a70b482 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -150,6 +150,9 @@ int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
 	reg = readl(dev->base + DW_IC_COMP_TYPE);
 	i2c_dw_release_lock(dev);
 
+	if (dev->flags & AMD_NON_INTR_MODE)
+		map_cfg.max_register = AMD_UCSI_INTR_REG;
+
 	if (reg == swab32(DW_IC_COMP_TYPE_VALUE)) {
 		map_cfg.reg_read = dw_reg_read_swab;
 		map_cfg.reg_write = dw_reg_write_swab;
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 5392b82f68a4..f29923c452ac 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -293,9 +293,12 @@ struct dw_i2c_dev {
 #define ACCESS_INTR_MASK	BIT(0)
 #define ACCESS_NO_IRQ_SUSPEND	BIT(1)
 
+#define AMD_NON_INTR_MODE	BIT(2)
 #define MODEL_MSCC_OCELOT	BIT(8)
 #define MODEL_BAIKAL_BT1	BIT(9)
 #define MODEL_MASK		GENMASK(11, 8)
+#define AMD_UCSI_INTR_EN	0xd
+#define AMD_UCSI_INTR_REG	0x474
 
 int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
 u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index dd27b9dbe931..a76e1f992850 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -23,6 +23,10 @@
 
 #include "i2c-designware-core.h"
 
+#define AMD_TIMEOUT_MIN_MSEC	10000
+#define AMD_TIMEOUT_MAX_MSEC	11000
+#define AMD_MASTERCFG_MASK	GENMASK(15, 0)
+
 static void i2c_dw_configure_fifo_master(struct dw_i2c_dev *dev)
 {
 	/* Configure Tx/Rx FIFO threshold levels */
@@ -208,6 +212,13 @@ static int i2c_dw_init_master(struct dw_i2c_dev *dev)
 	if (dev->sda_hold_time)
 		regmap_write(dev->map, DW_IC_SDA_HOLD, dev->sda_hold_time);
 
+	/*
+	 * In order to enable the interrupt for UCSI i.e. AMD NAVI GPU card,
+	 * it is mandatory to set the right value in specific register
+	 * (offset:0x474) as per the hardware IP specification.
+	 */
+	if (dev->flags & AMD_NON_INTR_MODE)
+		regmap_write(dev->map, AMD_UCSI_INTR_REG, AMD_UCSI_INTR_EN);
 	i2c_dw_configure_fifo_master(dev);
 	i2c_dw_release_lock(dev);
 
@@ -259,6 +270,121 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
 	regmap_write(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_MASTER_MASK);
 }
 
+static int i2c_dw_check_stopbit(struct dw_i2c_dev *i2cd)
+{
+	u32 val;
+	int ret;
+
+	ret = regmap_read_poll_timeout(i2cd->map, DW_IC_INTR_STAT, val,
+				       !(val & DW_IC_INTR_STOP_DET),
+					1100, 20000);
+	if (ret) {
+		dev_err(i2cd->dev, "i2c timeout error %d\n", ret);
+		return -ETIMEDOUT;
+	}
+
+	regmap_read(i2cd->map, DW_IC_CLR_INTR, &val);
+	if (val & DW_IC_INTR_STOP_DET)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static int i2c_dw_status(struct dw_i2c_dev *i2cd)
+{
+	int status;
+
+	status = i2c_dw_wait_bus_not_busy(i2cd);
+	if (status)
+		return -ETIMEDOUT;
+
+	return i2c_dw_check_stopbit(i2cd);
+}
+
+/*
+ * Initiate and continue master read/write transaction with polling
+ * based transfer routine afterward write messages into the tx buffer.
+ */
+static int amd_i2c_dw_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs)
+{
+	struct dw_i2c_dev *i2cd = i2c_get_adapdata(adap);
+	int msg_wrt_idx, msg_itr_lmt, buf_len, data_idx;
+	int cmd = 0, ret, status;
+	u8 *tx_buf;
+	u32 val;
+
+	ret = i2c_dw_acquire_lock(i2cd);
+	if (ret) {
+		dev_err(i2cd->dev, "Failed to get bus ownership\n");
+		return ret;
+	}
+
+	i2cd->msgs = msgs;
+	i2cd->msgs_num = num_msgs;
+	i2c_dw_xfer_init(i2cd);
+	i2c_dw_disable_int(i2cd);
+
+	/* Initiate messages read/write transaction */
+	for (msg_wrt_idx = 0; msg_wrt_idx < num_msgs; msg_wrt_idx++) {
+		tx_buf = msgs[msg_wrt_idx].buf;
+		buf_len = msgs[msg_wrt_idx].len;
+
+		if (!(msgs[msg_wrt_idx].flags & I2C_M_RD))
+			regmap_write(i2cd->map, DW_IC_TX_TL, buf_len - 1);
+		/*
+		 * Initiate the i2c read/write transaction of buffer length,
+		 * and poll for bus busy status. For the last message transfer,
+		 * update the command with stopbit enable.
+		 */
+		for (msg_itr_lmt = buf_len; msg_itr_lmt > 0; msg_itr_lmt--) {
+			if (msg_wrt_idx == num_msgs - 1 && msg_itr_lmt == 1)
+				cmd |= BIT(9);
+
+			if (msgs[msg_wrt_idx].flags & I2C_M_RD) {
+				/* Due to hardware bug, need to write the same command twice. */
+				regmap_write(i2cd->map, DW_IC_DATA_CMD, 0x100);
+				regmap_write(i2cd->map, DW_IC_DATA_CMD, 0x100 | cmd);
+				if (cmd) {
+					regmap_write(i2cd->map, DW_IC_TX_TL, 2 * (buf_len - 1));
+					regmap_write(i2cd->map, DW_IC_RX_TL, 2 * (buf_len - 1));
+					/*
+					 * Need to check the stop bit. However, it cannot be
+					 * detected from the registers so we check it always
+					 * when read/write the last byte.
+					 */
+					status = i2c_dw_status(i2cd);
+					if (status) {
+						ret = -ETIMEDOUT;
+						goto lock_release;
+					}
+					for (data_idx = 0; data_idx < buf_len; data_idx++) {
+						regmap_read(i2cd->map, DW_IC_DATA_CMD, &val);
+						tx_buf[data_idx] = val;
+					}
+					status = i2c_dw_check_stopbit(i2cd);
+					if (status) {
+						ret = -ETIMEDOUT;
+						goto lock_release;
+					}
+				}
+			} else {
+				regmap_write(i2cd->map, DW_IC_DATA_CMD, *tx_buf++ | cmd);
+				usleep_range(AMD_TIMEOUT_MIN_MSEC, AMD_TIMEOUT_MAX_MSEC);
+			}
+		}
+		status = i2c_dw_check_stopbit(i2cd);
+		if (status) {
+			ret = -ETIMEDOUT;
+			goto lock_release;
+		}
+	}
+
+lock_release:
+	i2c_dw_release_lock(i2cd);
+
+	return ret;
+}
+
 /*
  * Initiate (and continue) low level master read/write transaction.
  * This function is only called from i2c_dw_isr, and pumping i2c_msg
@@ -461,6 +587,13 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
 
 	pm_runtime_get_sync(dev->dev);
+	/*
+	 * Initiate I2C message transfer when AMD NAVI GPU card is enabled,
+	 * As it is polling based transfer mechanism, which does not support
+	 * interrupt based functionalities of existing DesignWare driver.
+	 */
+	if (dev->flags & AMD_NON_INTR_MODE)
+		return amd_i2c_dw_master_xfer(adap, msgs, num);
 
 	if (dev_WARN_ONCE(dev->dev, dev->suspended, "Transfer while suspended\n")) {
 		ret = -ESHUTDOWN;
@@ -774,6 +907,9 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	adap->dev.parent = dev->dev;
 	i2c_set_adapdata(adap, dev);
 
+	if (dev->flags & AMD_NON_INTR_MODE)
+		return i2c_add_numbered_adapter(adap);
+
 	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
 		irq_flags = IRQF_NO_SUSPEND;
 	} else {
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 55c83a7a24f3..9673e8d52eee 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -26,6 +26,7 @@
 #include "i2c-designware-core.h"
 
 #define DRIVER_NAME "i2c-designware-pci"
+#define AMD_CLK_RATE_HZ	100000
 
 enum dw_pci_ctl_id_t {
 	medfield,
@@ -34,6 +35,7 @@ enum dw_pci_ctl_id_t {
 	cherrytrail,
 	haswell,
 	elkhartlake,
+	navi_amd,
 };
 
 struct dw_scl_sda_cfg {
@@ -78,11 +80,23 @@ static struct dw_scl_sda_cfg hsw_config = {
 	.sda_hold = 0x9,
 };
 
+/* NAVI-AMD HCNT/LCNT/SDA hold time */
+static struct dw_scl_sda_cfg navi_amd_config = {
+	.ss_hcnt = 0x1ae,
+	.ss_lcnt = 0x23a,
+	.sda_hold = 0x9,
+};
+
 static u32 mfld_get_clk_rate_khz(struct dw_i2c_dev *dev)
 {
 	return 25000;
 }
 
+static u32 navi_amd_get_clk_rate_khz(struct dw_i2c_dev *dev)
+{
+	return AMD_CLK_RATE_HZ;
+}
+
 static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 {
 	struct dw_i2c_dev *dev = dev_get_drvdata(&pdev->dev);
@@ -104,6 +118,31 @@ static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 	return -ENODEV;
 }
 
+static int navi_amd_register_client(struct dw_i2c_dev *i2cd)
+{
+	struct i2c_board_info	info;
+
+	memset(&info, 0, sizeof(struct i2c_board_info));
+	strscpy(info.type, "ccgx-ucsi", I2C_NAME_SIZE);
+	info.addr = 0x08;
+	info.irq = i2cd->irq;
+
+	i2cd->slave = i2c_new_client_device(&i2cd->adapter, &info);
+	if (!i2cd->slave)
+		return -ENODEV;
+
+	return 0;
+}
+
+static int navi_amd_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
+{
+	struct dw_i2c_dev *dev = dev_get_drvdata(&pdev->dev);
+
+	dev->flags |= AMD_NON_INTR_MODE;
+	dev->timings.bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
+	return 0;
+}
+
 static int mrfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 {
 	/*
@@ -155,6 +194,12 @@ static struct dw_pci_controller dw_pci_controllers[] = {
 		.bus_num = -1,
 		.get_clk_rate_khz = ehl_get_clk_rate_khz,
 	},
+	[navi_amd] = {
+		.bus_num = -1,
+		.scl_sda_cfg = &navi_amd_config,
+		.setup =  navi_amd_setup,
+		.get_clk_rate_khz = navi_amd_get_clk_rate_khz,
+	},
 };
 
 #ifdef CONFIG_PM
@@ -274,6 +319,14 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		return r;
 	}
 
+	if (dev->flags & AMD_NON_INTR_MODE)
+		r = navi_amd_register_client(dev);
+
+	if (r) {
+		dev_err(dev->dev, "register client failed with %d\n", r);
+		return r;
+	}
+
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
@@ -337,6 +390,10 @@ static const struct pci_device_id i2_designware_pci_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0x4bbe), elkhartlake },
 	{ PCI_VDEVICE(INTEL, 0x4bbf), elkhartlake },
 	{ PCI_VDEVICE(INTEL, 0x4bc0), elkhartlake },
+	{ PCI_VDEVICE(ATI,  0x7314), navi_amd },
+	{ PCI_VDEVICE(ATI,  0x73a4), navi_amd },
+	{ PCI_VDEVICE(ATI,  0x73e4), navi_amd },
+	{ PCI_VDEVICE(ATI,  0x73c4), navi_amd },
 	{ 0,}
 };
 MODULE_DEVICE_TABLE(pci, i2_designware_pci_ids);
-- 
2.25.1

