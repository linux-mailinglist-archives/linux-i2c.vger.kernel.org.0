Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB6BD3501E3
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 16:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235865AbhCaOID (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 10:08:03 -0400
Received: from mail-bn8nam12on2077.outbound.protection.outlook.com ([40.107.237.77]:3809
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235114AbhCaOH4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 10:07:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RydrpjngSc0638xfLzupZepgXwKo1JTCJnm3wM0t4MMq4Q9DGbx+5Fnk9C9Y4Q3KMwSnKvoLgueH5kyv+JlTXxAel2KsXvNZlBOhkBwaPeEXrd4T5tgnnv8PZb9GoOkvLE800Vg0eN/rgGBtzmV2phY8cRd0C7hZ7Eg/N/nb3K5W+SBRxB/hSaXZkT4Mo983E3k7dDJ4+L55ljKO3Wju9Cv72Nb6UeU4rJG5tcuZ0Q8fSq6Hl4wPinwJw5Zu61kH9Kws35sVKjd88yRfI38hOSVfEEW6PPJfr2Fcb7wuAmp9pYxJoCfXcqRffPNUNkLqSepx2Py4VHKDkPzcxbGnXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bs0y7KpYLqaR51avhpg4vFOO6lzCp6keNPs26rtIRQ=;
 b=LMD0oZE97AbNvgzDj+eYG6DnG54UKR71h3J9jZXdC9jj5/dmD6eAcLdF/CWd7R5cTv19uzINUci9x05Gs1C4fZQgDRp8fv5Ax+Ktqy/pXQbKoT3UAc2IkDg1zkldQLO28PUdMQvtHDuXr9zPV+GpaHuX5U5expmQWvGj6hLax0z8rXKCQaJLqQEldRTIZKLxPiduYeru5hxsSkklPOhrHl4eFS2M0ydPMubqUrYiBwswV9f19RzUhYVYmTpVJnp4WBqDKS3gL7yFJpXoyhJvGMxQBD0DyjFa8y6qAXeNeyh7Cfk6EYnGSH7EtqKiY8URkXCETrst6WJpWGFHeDefdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bs0y7KpYLqaR51avhpg4vFOO6lzCp6keNPs26rtIRQ=;
 b=aBY2mvzsDQ7cC0B7PkyuOzL/Ryl8z3LeJjjG9TQj9I8jfwMqqtn4A6YwYIw4RPrU+sPMLPGc/GDhFoP87l4cqV60DPTtoRX+oyEhW8H+dLdrtdHhSbb7+o4qoAGwNGeJG0W4+ql+1i/ixVz8i2KxoGnRb1HbJUocPV5LIDGfBP8=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1835.namprd12.prod.outlook.com (2603:10b6:3:10c::9) by
 DM6PR12MB4700.namprd12.prod.outlook.com (2603:10b6:5:35::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.29; Wed, 31 Mar 2021 14:07:54 +0000
Received: from DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052]) by DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052%10]) with mapi id 15.20.3977.033; Wed, 31 Mar
 2021 14:07:54 +0000
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sanket Goswami <Sanket.Goswami@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Subject: [PATCH v4] i2c: designware: Add driver support for AMD NAVI GPU
Date:   Wed, 31 Mar 2021 19:37:30 +0530
Message-Id: <20210331140730.2058967-1-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR01CA0087.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::27)
 To DM5PR12MB1835.namprd12.prod.outlook.com (2603:10b6:3:10c::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jatayu.amd.com (165.204.156.251) by MA1PR01CA0087.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend Transport; Wed, 31 Mar 2021 14:07:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d23063a4-97a8-4e77-29a7-08d8f44e60d3
X-MS-TrafficTypeDiagnostic: DM6PR12MB4700:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4700D4615C98E1615DB0D41B9C7C9@DM6PR12MB4700.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MZuLKz+xPLVJ2sEJrc44QTZQhlQvAbV435FqT0f7lD+7NCt0SHAF+FJLgzBbpASX6rfmPv5E5lYIXWidB0WbOD7hcLig6VlrGr+Tfkk4ZPHhr5JQ1TfXRXkKGng8tuSn3ADdArRmOFmqTU4ZEPqCvQyo/SctWFP13/cv+brYCr4iIrEdSkRPsMuvjnGQY076fkbOnew/a06ADj1RV+Cnxu1hiWLF2AIRfoAVXb3gNK+0vBGP5sY/7jzjRORCF751z2UQMncZyqUkEiJN9onWfjA4RXBJ4iSmf1ieWwPxW1QgjOB479yiaedaXQBiGdBFyYE05JCuEjKiYb3tpgPQghyQ8TT0LKBPhIdaIFZzOScFf+S/lDMz/fm0Uge9aaDujNMbNUIBpB+BSFyM71swkY751EXDZT7b4dA4lvzlFYOHHaPh1RH9RvCMytm26n69fjdPnr800IwlgIVJTqMlyE5siTBPMh3VXXJpctpWyauUdhVl+lPjHDnTc3HWfYllF5P2CPlmDuMImfRuAVSuWrQHozfP4lOwktAHIP7yZn3SF/FfliuXSXNwkX1S7kubz/8tdk/lHyQnlkorcmfVX8MIY0Yo98f7gf2f5qGtLKctg3mVSsly/4U4JaP4EiCnlZoMvrZbrBZUvTtmHLSJ4mPD2yePb20GNRt9sP5n5cg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(8936002)(38100700001)(186003)(6486002)(16526019)(52116002)(83380400001)(66946007)(316002)(478600001)(54906003)(4326008)(956004)(2616005)(8676002)(1076003)(66476007)(2906002)(6666004)(7696005)(26005)(36756003)(86362001)(66556008)(30864003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QSWEdgCZhfalaWeMGf5Qs8mo3euBaH/SG0u7fufJ8GmjQG04dtqRIvh9HfU6?=
 =?us-ascii?Q?0+iwfdJ470mqdbtQlNGwzJMOCh9jHIjobVzq0gwXEqd8txz1ptc1uS7m0tHl?=
 =?us-ascii?Q?LppL1fR+K4gqrh1xH9PJ0DShlMxj+x2T2trNn9lsaJ6V4VUl1l9FGLcdR/vU?=
 =?us-ascii?Q?QQZ5O1HIFZ/RFG/eyvb1jMqsGUmkl+QX8YCR8ZLlPWbvy3atuF/b6L2veOR9?=
 =?us-ascii?Q?fjUV/f/LeS0PnYVznRcsMokDrRHlGt402DShKh773XWxDQeueDJqrzyFDMVu?=
 =?us-ascii?Q?YXnfoDhwocLxyroIRWsdc8jF5OWUGqBA6Q9KLEgmyfRB5hWGsPX8DSBcI9lV?=
 =?us-ascii?Q?msG4sDehZW/P2k1XC0ja4Z7WgAkVXmx75Yjoxn8DCsSKwKa9c0ep/IJdHuQg?=
 =?us-ascii?Q?lkv2m64VfwvsyAxKfgNdZuAwC1EGw6OIzvYTqy9xqL8VIga6h9AUYsQ+tzL3?=
 =?us-ascii?Q?w3gOLX+YopVhhGMw5BrMHdux4T3B3oz3q2pNQDJ2rAaqYEmUl1TQqAfmAkKm?=
 =?us-ascii?Q?QcJRxbuxMw/ddbRyBCuFYT1JWH8pygL2GpDMFn386O5DgCyXSrGLilU669Z8?=
 =?us-ascii?Q?UFIn7LYLpl+cm1A1yTsyarCLxlR3ZTpAXSQLo3ZOsjDo+5ciJMvHTribu3uc?=
 =?us-ascii?Q?LyGj4vzlTmcnjdwvjZ9cDWbDiA6pgfYbYaDoWoi8HcAVXBzqKpM2zLgqVQMH?=
 =?us-ascii?Q?K4CJ/XItyc0tfCkyE/7w4kF58ms+JXYaHeECwVdkycgILUzxJGNzDVG5Hk+K?=
 =?us-ascii?Q?L2D9yGCAOQKm35tCCZcOU1vbNkYFKT5mvsrACzQzWYTBtHmXRRrNk1hm4SK6?=
 =?us-ascii?Q?vER0jduCrAhkcd4OWyIoWrcmnvdi5qhU6gwXiDYcRH8uSGyVhmK13byn+AwU?=
 =?us-ascii?Q?uAZiG05JouwUWQsXg5OQruk2wZVQD1bNSmk+gMUPrt244hi81rsYaA9VLcgc?=
 =?us-ascii?Q?+I9YsxhK58PTBRByOKzX5AAhBwIEiVUamxYuw8FtflQFNXDFHkBVYbowx+Jp?=
 =?us-ascii?Q?MA10E5zgl93lAMaTN+cAKNCodctRy33UrWwkjDr5RwcF838PWvohHOEdk1sk?=
 =?us-ascii?Q?VoOXfpGawyoGdqG8tKNBGX+z0lMg5Bb1eKhaXCDDOTQg0q3JXHK8dHp2vUZw?=
 =?us-ascii?Q?EoVZtZWG6yOYMFEFUpjFmt9hFN4I6WW+kg/WR5VWC7C+hQ2zTVNz6TYgyqBA?=
 =?us-ascii?Q?5VPqsz79l7lC7yWvlWBhf/1cNysZKIvpy19GOFjBpgTxk7nNVs1wlKB55RU9?=
 =?us-ascii?Q?Btc4VKFq4mALK+Jg2yJtjq/mB9u/b/+2RbdWbnMi/OfriiD97bXvj5Bb5dSx?=
 =?us-ascii?Q?IHI4HR0gBF8neSTtNQUxqe2a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d23063a4-97a8-4e77-29a7-08d8f44e60d3
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 14:07:54.3242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1ZpUQSDHQzl0n4lhHM5aoMimE6Nni8nFR0SQNMVZLARGwUgB85+vL4BY5gbJIYc5Wn31hEd/mVkQA2hL8tHWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4700
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The Latest AMD NAVI GPU card has an integrated Type-C controller and
Designware I2C with PCI Interface. The PD controller for USB Type-C can
be accessed over I2C. The client driver is part of the USB Type-C UCSI
driver.

Also, there exists a couple of notable IP limitations that are dealt as
workarounds:
- I2C transaction work on a polling mode as IP does not generate
interrupt.
- I2C read command sent twice to address the IP issues.
- AMD NAVI GPU based products are already in the commercial market,
  hence some of the I2C parameters are statically programmed as they
  can not be part of the ACPI table.

Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Co-developed-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
Changes in v4:
- Fixes review comments given by Andy. 

Changes in v3:
- Fixes runtime PM issue.
- Addressed review comments were given by Jarkko and Andy.

Changes in v2:
- Utilized existing functionality of i2c_dw_xfer_init to configure I2C
  bus.
- Removed i2c_dw_populate_client and rewrrient navi_amd_register_client
  to deduplicate from existing drivers.
- Addressed review comments were given by Andy.

 drivers/i2c/busses/i2c-designware-common.c |   3 +
 drivers/i2c/busses/i2c-designware-core.h   |   8 ++
 drivers/i2c/busses/i2c-designware-master.c | 133 +++++++++++++++++++++
 drivers/i2c/busses/i2c-designware-pcidrv.c |  61 ++++++++++
 4 files changed, 205 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 3c19aada4b30..fdc34d9e3702 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -150,6 +150,9 @@ int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
 	reg = readl(dev->base + DW_IC_COMP_TYPE);
 	i2c_dw_release_lock(dev);
 
+	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU)
+		map_cfg.max_register = AMD_UCSI_INTR_REG;
+
 	if (reg == swab32(DW_IC_COMP_TYPE_VALUE)) {
 		map_cfg.reg_read = dw_reg_read_swab;
 		map_cfg.reg_write = dw_reg_write_swab;
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 5392b82f68a4..6a53f75abf7c 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -295,8 +295,16 @@ struct dw_i2c_dev {
 
 #define MODEL_MSCC_OCELOT	BIT(8)
 #define MODEL_BAIKAL_BT1	BIT(9)
+#define MODEL_AMD_NAVI_GPU	BIT(10)
 #define MODEL_MASK		GENMASK(11, 8)
 
+/*
+ * Enable UCSI interrupt by writing 0xd at register
+ * offset 0x474 specified in hardware specification.
+ */
+#define AMD_UCSI_INTR_REG	0x474
+#define AMD_UCSI_INTR_EN	0xd
+
 int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
 u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
 u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index dd27b9dbe931..e288b654cb47 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -23,6 +23,10 @@
 
 #include "i2c-designware-core.h"
 
+#define AMD_TIMEOUT_MIN_US	25
+#define AMD_TIMEOUT_MAX_US	250
+#define AMD_MASTERCFG_MASK	GENMASK(15, 0)
+
 static void i2c_dw_configure_fifo_master(struct dw_i2c_dev *dev)
 {
 	/* Configure Tx/Rx FIFO threshold levels */
@@ -259,6 +263,108 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
 	regmap_write(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_MASTER_MASK);
 }
 
+static int i2c_dw_check_stopbit(struct dw_i2c_dev *dev)
+{
+	u32 val;
+	int ret;
+
+	ret = regmap_read_poll_timeout(dev->map, DW_IC_INTR_STAT, val,
+				       !(val & DW_IC_INTR_STOP_DET),
+					1100, 20000);
+	if (ret)
+		dev_err(dev->dev, "i2c timeout error %d\n", ret);
+
+	return ret;
+}
+
+static int i2c_dw_status(struct dw_i2c_dev *dev)
+{
+	int status;
+
+	status = i2c_dw_wait_bus_not_busy(dev);
+	if (status)
+		return status;
+
+	return i2c_dw_check_stopbit(dev);
+}
+
+/*
+ * Initiate and continue master read/write transaction with polling
+ * based transfer routine afterward write messages into the Tx buffer.
+ */
+static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs)
+{
+	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
+	int msg_wrt_idx, msg_itr_lmt, buf_len, data_idx;
+	int cmd = 0, status;
+	u8 *tx_buf;
+	u32 val;
+
+	/*
+	 * In order to enable the interrupt for UCSI i.e. AMD NAVI GPU card,
+	 * it is mandatory to set the right value in specific register
+	 * (offset:0x474) as per the hardware IP specification.
+	 */
+	regmap_write(dev->map, AMD_UCSI_INTR_REG, AMD_UCSI_INTR_EN);
+
+	dev->msgs = msgs;
+	dev->msgs_num = num_msgs;
+	i2c_dw_xfer_init(dev);
+	i2c_dw_disable_int(dev);
+
+	/* Initiate messages read/write transaction */
+	for (msg_wrt_idx = 0; msg_wrt_idx < num_msgs; msg_wrt_idx++) {
+		tx_buf = msgs[msg_wrt_idx].buf;
+		buf_len = msgs[msg_wrt_idx].len;
+
+		if (!(msgs[msg_wrt_idx].flags & I2C_M_RD))
+			regmap_write(dev->map, DW_IC_TX_TL, buf_len - 1);
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
+				regmap_write(dev->map, DW_IC_DATA_CMD, 0x100);
+				regmap_write(dev->map, DW_IC_DATA_CMD, 0x100 | cmd);
+				if (cmd) {
+					regmap_write(dev->map, DW_IC_TX_TL, 2 * (buf_len - 1));
+					regmap_write(dev->map, DW_IC_RX_TL, 2 * (buf_len - 1));
+					/*
+					 * Need to check the stop bit. However, it cannot be
+					 * detected from the registers so we check it always
+					 * when read/write the last byte.
+					 */
+					status = i2c_dw_status(dev);
+					if (status)
+						return status;
+
+					for (data_idx = 0; data_idx < buf_len; data_idx++) {
+						regmap_read(dev->map, DW_IC_DATA_CMD, &val);
+						tx_buf[data_idx] = val;
+					}
+					status = i2c_dw_check_stopbit(dev);
+					if (status)
+						return status;
+				}
+			} else {
+				regmap_write(dev->map, DW_IC_DATA_CMD, *tx_buf++ | cmd);
+				usleep_range(AMD_TIMEOUT_MIN_US, AMD_TIMEOUT_MAX_US);
+			}
+		}
+		status = i2c_dw_check_stopbit(dev);
+		if (status)
+			return status;
+	}
+
+	return 0;
+}
+
 /*
  * Initiate (and continue) low level master read/write transaction.
  * This function is only called from i2c_dw_isr, and pumping i2c_msg
@@ -462,6 +568,16 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 	pm_runtime_get_sync(dev->dev);
 
+	/*
+	 * Initiate I2C message transfer when AMD NAVI GPU card is enabled,
+	 * As it is polling based transfer mechanism, which does not support
+	 * interrupt based functionalities of existing DesignWare driver.
+	 */
+	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
+		ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
+		goto done_nolock;
+	}
+
 	if (dev_WARN_ONCE(dev->dev, dev->suspended, "Transfer while suspended\n")) {
 		ret = -ESHUTDOWN;
 		goto done_nolock;
@@ -738,6 +854,20 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 	return 0;
 }
 
+static int amd_i2c_adap_quirk(struct dw_i2c_dev *dev)
+{
+	struct i2c_adapter *adap = &dev->adapter;
+	int ret;
+
+	pm_runtime_get_noresume(dev->dev);
+	ret = i2c_add_numbered_adapter(adap);
+	if (ret)
+		dev_err(dev->dev, "Failed to add adapter: %d\n", ret);
+	pm_runtime_put_noidle(dev->dev);
+
+	return ret;
+}
+
 int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 {
 	struct i2c_adapter *adap = &dev->adapter;
@@ -774,6 +904,9 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	adap->dev.parent = dev->dev;
 	i2c_set_adapdata(adap, dev);
 
+	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU)
+		return amd_i2c_adap_quirk(dev);
+
 	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
 		irq_flags = IRQF_NO_SUSPEND;
 	} else {
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 55c83a7a24f3..7ca0017883a6 100644
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
@@ -104,6 +118,35 @@ static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 	return -ENODEV;
 }
 
+ /*
+  * TODO find a better way how to deduplicate instantiation
+  * of USB PD slave device from nVidia GPU driver.
+  */
+static int navi_amd_register_client(struct dw_i2c_dev *dev)
+{
+	struct i2c_board_info	info;
+
+	memset(&info, 0, sizeof(struct i2c_board_info));
+	strscpy(info.type, "ccgx-ucsi", I2C_NAME_SIZE);
+	info.addr = 0x08;
+	info.irq = dev->irq;
+
+	dev->slave = i2c_new_client_device(&dev->adapter, &info);
+	if (!dev->slave)
+		return -ENODEV;
+
+	return 0;
+}
+
+static int navi_amd_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
+{
+	struct dw_i2c_dev *dev = dev_get_drvdata(&pdev->dev);
+
+	dev->flags |= MODEL_AMD_NAVI_GPU;
+	dev->timings.bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
+	return 0;
+}
+
 static int mrfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 {
 	/*
@@ -155,6 +198,12 @@ static struct dw_pci_controller dw_pci_controllers[] = {
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
@@ -274,6 +323,14 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		return r;
 	}
 
+	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
+		r = navi_amd_register_client(dev);
+		if (r) {
+			dev_err(dev->dev, "register client failed with %d\n", r);
+			return r;
+		}
+	}
+
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
@@ -337,6 +394,10 @@ static const struct pci_device_id i2_designware_pci_ids[] = {
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

