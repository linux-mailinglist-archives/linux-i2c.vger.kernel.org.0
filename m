Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB6CA33273D
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Mar 2021 14:33:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhCINcp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Mar 2021 08:32:45 -0500
Received: from mail-mw2nam10on2049.outbound.protection.outlook.com ([40.107.94.49]:35776
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231451AbhCINcO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Mar 2021 08:32:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKI2UqUVjI9I2r51MWB8oA1kC0vW3LYZYIuBCJnBGYjAQVW0qLxL24RCe74Gq0Ppq9Q2amcc+eiv5bnljZ7rpALlv4y0Nt/8A6Y4x6ZenjGPp6eQXH2SGT9zqlLUxiddTyrksMJ35qkFX213212Vc4PiLHffuhuvGl+fYpXt3KT+Nl/pVrndd7golb9c+tRH9Qsx2PgLTH30nN9AuExOE0aoNi+YuyzPn3Fw4GBqrMQOeUz+0/qBZr4qEo6KnBCYT0MVEyyQFvL7UarBWTklzWO5JIslSVQfxNxoS0+6ea23WciJWI4PLkGhhnDF1qzm1G5hN36jbE7vgKBWoGHzTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeMKb4uZAVq4Y7yzQcPtkgaS28hV/6R0k1wAB3+FkAA=;
 b=ZdQlX02frLD/oyd0BgEQvcKHtHOk8yo4s1MdhHkapxHCCTQ7iouSxf/ZUzQ+wbMSe5zv1AoXeNbA7vpiYEIB42A8u1F4og8L0eDSSCIRDzogGfFJf1DR2GLRmZCkCtBBdu8n/gHSDX7cT9jGVyV7LBAR9LP6TmPhGmxGUeHKRuOGEJsdOp15jn8cRVfDi60Jnvldgm+1n4QJ8/zfFTTsVKCclcgQaot9VKLfKHLuOD33hGK0V4Wsro49wvoXsA+V0/3EwKrBC7th9w3qp6IaRZ9G0/PcyYwDgGEsaKWM489Xz9iGLVuBnlG7PU/s6RAkojrqI6fviM9X6AKVq2Qazw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeMKb4uZAVq4Y7yzQcPtkgaS28hV/6R0k1wAB3+FkAA=;
 b=ritazMPIoIlD+LxbGpZnCgRAi3AoU2Yu6mveHZNcXvuItYKazumDB1ID+mLR0onyKxQ+z7WQm9mdUKszKmvPBMQHa0pC7/ZaX2pK4ntHNiMwBQqwwUe4uyDwujLWqHvt1pmATVWHYILhoTQ/iEkIY1gaBVEY9wEJ8AWOK+tJfJE=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1835.namprd12.prod.outlook.com (2603:10b6:3:10c::9) by
 DM5PR12MB1707.namprd12.prod.outlook.com (2603:10b6:3:108::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.28; Tue, 9 Mar 2021 13:32:12 +0000
Received: from DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052]) by DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052%10]) with mapi id 15.20.3912.028; Tue, 9 Mar 2021
 13:32:11 +0000
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sanket Goswami <Sanket.Goswami@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Subject: [PATCH] i2c: add i2c bus driver for amd navi gpu
Date:   Tue,  9 Mar 2021 19:01:47 +0530
Message-Id: <20210309133147.1042775-1-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR01CA0076.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::16)
 To DM5PR12MB1835.namprd12.prod.outlook.com (2603:10b6:3:10c::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jatayu.amd.com (165.204.156.251) by MA1PR01CA0076.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 13:32:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1459b8eb-50c4-451c-dd3b-08d8e2ffbe99
X-MS-TrafficTypeDiagnostic: DM5PR12MB1707:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB170776E3A4F3C8A7BF5E7F569C929@DM5PR12MB1707.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NKMLq/nSNYp0UC1eXfBpdYSXZvWpNVsym1yO9JusWMdc/tHrqio2TX/7ZcXiLgFsKJjExaKX1Re4vr/tmV4JI2uKjEoaU+sX1CnS7TeNHy/GnrbK64CW3eKX0z2wtO4iQWXP/9Y5HCqlgI2gjmubdbd1sBg1AB+gcVZ4vkMmfdwYmZv7XCcIaB+iYwboQs7cZ2U9kX4g414Ah9pWrHAwLxgoy0eJiAA6ewI0i/Fzt+fnTpS+8bNTBOaGHJp2mwAOQ4A03ifNolpedcNTeRqC7nRR6HKle8mWnp1OkS9EVULY9/Xm6M7JdxVMm6Oi9tyqrjhkO+P8N68mMjxaAZQLX9OWR1sSewWeS5javjrgjzW0t09dIBBW3kN//1SJuy2Qyjlx9xiPlnXqGcu+xyBfAvw/uRqUgRMXaHGSBUaqpFY+sgexLH+7elxSJvWRrQ+eBY8utK5xVuH3VW3BrBhf94fmjSph+FktWkHexIWX3PVGuTL9BQf+TRpHWqAXnjw9WPMp8VS+o2wfWhorC7E6MA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(186003)(478600001)(1076003)(2906002)(66556008)(52116002)(66946007)(86362001)(36756003)(66476007)(54906003)(8936002)(16526019)(7696005)(4326008)(6666004)(26005)(316002)(2616005)(6486002)(5660300002)(30864003)(83380400001)(8676002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xFPEDNGR8V2pLJf4PNBrCOVr6HOnfpc32M61VriHSBrhfhhtUVnE4jJ8+YQT?=
 =?us-ascii?Q?97Y4rhZF/RqbWVZsPG0ykH+IjbS01k1uw3kjBuhbiEDrQAlclq5P5xjB/tBP?=
 =?us-ascii?Q?AA3qkNcZ+XqUQtQXyPtZu4N6f6NiQxXx8FaATh3CzGMoYXtWljCAc7HjWydN?=
 =?us-ascii?Q?5f9VYTEFvP+7c21DN3klhzWrfiDcSmxIsxKcWx+LqPrRamfk+18JERVDOZMf?=
 =?us-ascii?Q?26IUykX4rQIg86I62XVhl1kFcRgucRvtdZwe/p3qA84kxUGKedoz4NsB3RKb?=
 =?us-ascii?Q?RwHooihFTyNxs8eD2P82tMAESDszuXBtS78wsmYmX6TIyEXZgydRkbJNVhrK?=
 =?us-ascii?Q?EG4ddzyu/GORTtNL460eo4LAni7/QB+rsvRf6ovuxZzS7ohoxDwlaxhvHLjP?=
 =?us-ascii?Q?l9drPNu+v2hE46eg/EMv4FqfLAvjCzgw7ITOoXzMwKvv9gM6I6+82VlolVfg?=
 =?us-ascii?Q?srq44h9uqj5Gry89YPI+v3iELW38xNmZwPUouwXrbxJUSjoSTwIBv59bE7hc?=
 =?us-ascii?Q?2n4qOiLoS2BpWSrzW6Ju0GbAr1LxqydU7qTk9JEVZP7utsB7WHUsnFCGrtZ2?=
 =?us-ascii?Q?gUKV0RviqwJFcm2e2qO4CF5Y/wNxg4lfQbJw9aD5pabmwRfJEGkw2b7SM5ff?=
 =?us-ascii?Q?YiAGUs91VPUbk8JfmELDXMBlnSEn1wSYkuEy+VRJIfIWvwOgCFL8C/os45X6?=
 =?us-ascii?Q?8J5dZBJebX03iuFUAP/bR5gcqd87QgRTMgucj4Gk2LcDjoMh+F4fn4kU9xgI?=
 =?us-ascii?Q?wRewW8tAVpAVUpMyotmf+UPccDNvnrnQHhgXrogdZrlFOQLUFHKkA/PIv7FY?=
 =?us-ascii?Q?aoVcUpP+NDRl3NcRBEWmWhYX8StF3q6kF10Jkc7xYT6lWRKEx00HGTY3fYKt?=
 =?us-ascii?Q?hJmwF1CZpE6gcOVQSZ+vgENM/kz0Ia242qgn6sLuXxBVfIN5QtFDoVQlF8N1?=
 =?us-ascii?Q?FquwAsb8jnUFe3lWpHnRnRQCg6QJm7ajCZo5YhK+npRiyYg9UAhpvymKxkEA?=
 =?us-ascii?Q?XCoHgKFyh8pbWIoE0f1l5ibUm2tKLdFSl1uLLprrLQxMywL4LLfvMHDWdwNv?=
 =?us-ascii?Q?FKR57gFhHHN2f7rFLwciui594EzEGMstfDMkTGc/ziRdzi7/gDMvgr3KfAMy?=
 =?us-ascii?Q?FK6ODzJ2qUBOA2V5d63x8PpsaCenItzuKleQKai1O2ad4zqURXotpZjHAb2P?=
 =?us-ascii?Q?bl4UZUGCHtx1RQlg5BKLJUbdp9O8vJd+JqQQ8FsODsoSw7KiWqU0Yq/RLGn1?=
 =?us-ascii?Q?4EARftlGYiDk1quio2qhwvf/fQ6lvt1YeAxb5vlOXuBCsuRwk0UOrVkj4cx0?=
 =?us-ascii?Q?PtMKYBdzDiIFSu4DYMqsoebU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1459b8eb-50c4-451c-dd3b-08d8e2ffbe99
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 13:32:11.8796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZ5mxbORhO7ybfnzmw1DwaVXxyoRce3d5j4sJ3cGWfDwIK+H/sEJfyP3sDakhnFfuJURigKtfhmzt0qX6/Ywqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1707
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Latest AMDGPU NAVI cards have USB Type-C interface which can be accessed
over I2C. The Type-C controller has integrated designware i2c which is
exposed as a PCI device to the AMD platform.

Also there exists couple of notable IP problems that are dealt as a
workaround:
- I2C transactions work on a polling mode as IP does not generate
interrupt.

- I2C reads commands are sent twice to address the IP issues.

Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Co-developed-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
 drivers/i2c/busses/i2c-designware-common.c |   3 +
 drivers/i2c/busses/i2c-designware-core.h   |   3 +
 drivers/i2c/busses/i2c-designware-master.c | 175 +++++++++++++++++++++
 drivers/i2c/busses/i2c-designware-pcidrv.c |  56 +++++++
 4 files changed, 237 insertions(+)

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
index 85307cfa7109..0cce4144b9ac 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -291,9 +291,12 @@ struct dw_i2c_dev {
 #define ACCESS_INTR_MASK	BIT(0)
 #define ACCESS_NO_IRQ_SUSPEND	BIT(1)
 
+#define AMD_NON_INTR_MODE	BIT(2)
 #define MODEL_MSCC_OCELOT	BIT(8)
 #define MODEL_BAIKAL_BT1	BIT(9)
 #define MODEL_MASK		GENMASK(11, 8)
+#define AMD_UCSI_INTR_EN	0xD
+#define AMD_UCSI_INTR_REG	0x474
 
 int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
 u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index d6425ad6e6a3..35c894a01381 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -22,6 +22,10 @@
 #include <linux/reset.h>
 
 #include "i2c-designware-core.h"
+#define AMD_TIMEOUT_MSEC_MIN	10000
+#define AMD_TIMEOUT_MSEC_MAX	11000
+#define AMD_FIFO_SIZE		0x20
+#define AMD_MASTERCFG_MASK	GENMASK(15, 0)
 
 static void i2c_dw_configure_fifo_master(struct dw_i2c_dev *dev)
 {
@@ -33,6 +37,154 @@ static void i2c_dw_configure_fifo_master(struct dw_i2c_dev *dev)
 	regmap_write(dev->map, DW_IC_CON, dev->master_cfg);
 }
 
+static void i2c_dw_configure_bus(struct dw_i2c_dev *i2cd)
+{
+	int master_cfg;
+	u16 icon;
+	u32 reg;
+
+	/* First disable the controller */
+	__i2c_dw_disable_nowait(i2cd);
+	master_cfg = DW_IC_CON_MASTER | DW_IC_CON_SLAVE_DISABLE | DW_IC_CON_SPEED_STD;
+
+	/* Clear all the interrupts */
+	regmap_read(i2cd->map, DW_IC_CLR_INTR, &reg);
+	regmap_write(i2cd->map, DW_IC_INTR_MASK, STATUS_IDLE);
+
+	icon = master_cfg & AMD_MASTERCFG_MASK;
+	icon &= ~DW_IC_CON_10BITADDR_MASTER;
+	icon = icon | DW_IC_CON_SPEED_STD;
+
+	/* Configure the master */
+	regmap_write(i2cd->map, DW_IC_CON, icon);
+	/* Configure the FIFO */
+	regmap_write(i2cd->map, DW_IC_TX_TL, AMD_FIFO_SIZE);
+	regmap_write(i2cd->map, DW_IC_RX_TL, AMD_FIFO_SIZE);
+
+	/* Setup 100k Speed */
+	regmap_write(i2cd->map, DW_IC_SS_SCL_HCNT, i2cd->ss_hcnt);
+	regmap_write(i2cd->map, DW_IC_SS_SCL_LCNT, i2cd->ss_lcnt);
+	regmap_write(i2cd->map, DW_IC_TAR, 0x08);
+
+	/* Now enable the controller */
+	__i2c_dw_enable(i2cd);
+}
+
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
+	status = i2c_dw_check_stopbit(i2cd);
+	if (status)
+		return -ETIMEDOUT;
+
+	return status;
+}
+
+/* Initiate and continue master read/write transaction with polling
+ * based transfer routine and write messages into the tx buffer.
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
+	i2c_dw_configure_bus(i2cd);
+
+	/* Initiate messages read/write transaction */
+	for (msg_wrt_idx = 0; msg_wrt_idx < num_msgs; msg_wrt_idx++) {
+		tx_buf = msgs[msg_wrt_idx].buf;
+		buf_len = msgs[msg_wrt_idx].len;
+
+		if (!(msgs[msg_wrt_idx].flags & I2C_M_RD))
+			regmap_write(i2cd->map, DW_IC_TX_TL, buf_len - 1);
+
+		/* Initiate the i2c read/write transition of buffer length,
+		 * and poll for bus busy status. For the last message transfer,
+		 * update the command with stopbit enable.
+		 */
+		for (msg_itr_lmt = buf_len; msg_itr_lmt > 0; msg_itr_lmt--) {
+			if (msg_wrt_idx == num_msgs - 1 && msg_itr_lmt == 1)
+				cmd |= BIT(9);
+
+			if (msgs[msg_wrt_idx].flags & I2C_M_RD) {
+				/* Due to hardware bug, need to write command two times. */
+				regmap_write(i2cd->map, DW_IC_DATA_CMD, 0x100);
+				regmap_write(i2cd->map, DW_IC_DATA_CMD, 0x100 | cmd);
+				if (cmd) {
+					regmap_write(i2cd->map, DW_IC_TX_TL, 2 * (buf_len - 1));
+					regmap_write(i2cd->map, DW_IC_RX_TL, 2 * (buf_len - 1));
+
+					/* Need to check the stop bit. However, it cannot be
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
+				usleep_range(AMD_TIMEOUT_MSEC_MIN, AMD_TIMEOUT_MSEC_MAX);
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
 static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 {
 	const char *mode_str, *fp_str = "";
@@ -208,6 +360,9 @@ static int i2c_dw_init_master(struct dw_i2c_dev *dev)
 	if (dev->sda_hold_time)
 		regmap_write(dev->map, DW_IC_SDA_HOLD, dev->sda_hold_time);
 
+	/* Enable ucsi interrupt */
+	if (dev->flags & AMD_NON_INTR_MODE)
+		regmap_write(dev->map, AMD_UCSI_INTR_REG, AMD_UCSI_INTR_EN);
 	i2c_dw_configure_fifo_master(dev);
 	i2c_dw_release_lock(dev);
 
@@ -462,6 +617,9 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 	pm_runtime_get_sync(dev->dev);
 
+	if (dev->flags & AMD_NON_INTR_MODE)
+		return amd_i2c_dw_master_xfer(adap, msgs, num);
+
 	if (dev_WARN_ONCE(dev->dev, dev->suspended, "Transfer while suspended\n")) {
 		ret = -ESHUTDOWN;
 		goto done_nolock;
@@ -738,6 +896,19 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 	return 0;
 }
 
+int amd_i2c_adap_quirk(struct dw_i2c_dev *amdev)
+{
+	struct i2c_adapter *amdap = &amdev->adapter;
+	int ret;
+
+	if (!(amdev->flags & AMD_NON_INTR_MODE))
+		return -ENODEV;
+
+	return i2c_add_numbered_adapter(amdap);
+
+	return ret;
+}
+
 int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 {
 	struct i2c_adapter *adap = &dev->adapter;
@@ -774,6 +945,10 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	adap->dev.parent = dev->dev;
 	i2c_set_adapdata(adap, dev);
 
+	ret = amd_i2c_adap_quirk(dev);
+	if (ret != -ENODEV)
+		return ret;
+
 	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
 		irq_flags = IRQF_NO_SUSPEND;
 	} else {
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 55c83a7a24f3..69ea6f206ab2 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -26,6 +26,7 @@
 #include "i2c-designware-core.h"
 
 #define DRIVER_NAME "i2c-designware-pci"
+#define AMD_CLK_RATE	100000
 
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
+	return AMD_CLK_RATE;
+}
+
 static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 {
 	struct dw_i2c_dev *dev = dev_get_drvdata(&pdev->dev);
@@ -104,6 +118,35 @@ static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 	return -ENODEV;
 }
 
+static int i2c_dw_populate_client(struct dw_i2c_dev *i2cd)
+{
+	struct i2c_board_info	*i2c_dw_ccgx_ucsi;
+	struct i2c_client	*ccgx_client;
+
+	i2c_dw_ccgx_ucsi = devm_kzalloc(i2cd->dev, sizeof(*i2c_dw_ccgx_ucsi), GFP_KERNEL);
+	if (!i2c_dw_ccgx_ucsi)
+		return -ENOMEM;
+
+	strscpy(i2c_dw_ccgx_ucsi->type, "ccgx-ucsi", sizeof(i2c_dw_ccgx_ucsi->type));
+	i2c_dw_ccgx_ucsi->addr = 0x08;
+	i2c_dw_ccgx_ucsi->irq = i2cd->irq;
+
+	ccgx_client = i2c_new_client_device(&i2cd->adapter, i2c_dw_ccgx_ucsi);
+	if (!ccgx_client)
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
@@ -274,6 +323,9 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		return r;
 	}
 
+	if (dev->flags & AMD_NON_INTR_MODE)
+		i2c_dw_populate_client(dev);
+
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
@@ -337,6 +389,10 @@ static const struct pci_device_id i2_designware_pci_ids[] = {
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

