Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 985B434E179
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 08:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbhC3Grq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 02:47:46 -0400
Received: from mail-dm6nam12on2086.outbound.protection.outlook.com ([40.107.243.86]:9249
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231267AbhC3Gro (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Mar 2021 02:47:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jc0Oa4z6McRUiMl+vCNp78FbtgevpAKPlj30+VrysB3jTdMGQDvxq8sYbiVyy3TcQ+3J7zU1xJ1ym9/mNzAp92cEvMH2/PQHyLo6LOiQT87Wkpu3xkbSLm+D3o7TA0MJpZtegEPT3pw5C/dPIToQnp10RL+uvI4h2ru0iFsiKfUXCOH2UztstHolSkuqcEtNf5byrj9w0UdRlKdvEfs4eoHFnpKovnyHD0OjzusG12C/3gRGCt9LVkxmOGgFBaU9dBp9hTAVxoui3WXw8PaPKurL7cPMsI8tqRyGmu4ZhsAse9YANoMlUc6exCwFNhfPEMer66esaMyNescX95iu4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUoDYx/oObjTLonU3sg1xvVg6CMZmWgFKieAsgXNjYc=;
 b=bMGDR1A5VN0ZpeobQ8VSBGFjxOMuvZNvx3WgPYOad4Tkgw4lsctyH6PBZ0pr4n/aNZbDKgesxHpqA9jg4tSdpfxzmMUQk4Vy3lf7CkvERsE2klJ/BYg7k95Ye3dxLjH7XFNU9TtgufpHL5UU7rBTc4PZ6vEP0z6b+DoOsjgxbseoxPtUP1h/zOEuOk6Wh/R7TVUvmZNtno6eZtUwnZtHDt26RkfngWTl45Fdy17JrOTEv4mq3tF45BfdySeoep4mfpHYwbw/+7RayM3sUgjDP7rDv2sLrzG6pFFvFHZ72ih5oKHHmStuf5IkrGmnUJ/OoDuHdBoXGJqeR5UJYEDkJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUoDYx/oObjTLonU3sg1xvVg6CMZmWgFKieAsgXNjYc=;
 b=WZMrhERlGr7I/jdq47CfUNXfLRBzhNLN4KxkWgsFGwnGAo67RMZn1g/XUaILxwabSvRqK3VLBSPuw0kJSZOnUtScNvzZz+0M/hSUyC4MCmgFKEe+yKVt1o/CJ5uHIYCRjC6Mv13WyVCt38BATIkm1OPP74sqTCDCxyhC6NuDcBk=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1835.namprd12.prod.outlook.com (2603:10b6:3:10c::9) by
 DM6PR12MB2794.namprd12.prod.outlook.com (2603:10b6:5:48::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24; Tue, 30 Mar 2021 06:47:42 +0000
Received: from DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052]) by DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052%10]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 06:47:42 +0000
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sanket Goswami <Sanket.Goswami@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Subject: [PATCH v3] i2c: designware: Add driver support for AMD NAVI GPU
Date:   Tue, 30 Mar 2021 12:17:15 +0530
Message-Id: <20210330064715.3620864-1-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::19) To DM5PR12MB1835.namprd12.prod.outlook.com
 (2603:10b6:3:10c::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jatayu.amd.com (165.204.156.251) by MA1PR01CA0149.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Tue, 30 Mar 2021 06:47:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ab4e6eb0-f89a-46e1-e267-08d8f347b75a
X-MS-TrafficTypeDiagnostic: DM6PR12MB2794:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2794AFDFD2C29074A3EA962B9C7D9@DM6PR12MB2794.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XL1TvykvSiq9Zyr7nBvNr4W3aKVVU1KECxmJlH7RsAghafbkOraFu5R5ddGNuyi6lRGoKrHQpwzWTXdtEa5I0WX68rUsw+1p/qKOcxTt3ue/CWmytHRrGRfCt+zQ2PI3sKGyAQZMfOlJhWIuCWUT+9IKhsTBrPlaWvnu3AlXSNMrhOSyychJ/hwZvdtbrV1Q8UCclXXm2V8uG53B9Vpv04CWYYR6KRZtrWlDNhV04+du6WAnC2AGqnzmcUun065u8ieRu/gsgGxJDZoJtNsyEqNrmhcHXLr2SzcgyofV8nQUjltU7CRL4sAIAqyWV6hOZ6qIC81MLfdj2Gtxos+2DBnFhIdV83TcqW9Fbt5gOUcki+YIIvN+jDwymj/pqG/RcAEJJuhccw0Z1tWn4PARkBnnRmXedELrzOoAVz4L+Megq/1JG71MfEmoZgu01RHNGSimb6l69AXyoD8OSCUiq5qXGJUwaYXWBNg54pLcdtfGp2uZOgLfzCHsNV7/LbtXKFi5M46LgKNsvKyWsHAgyu7mTjIBFu/5J48vETNhAg5x4FpZ7Qvl/CmjeH6p9hW69AA0ky3nTUc3gqOxZLsjW2KfkS+lMVem6IbwI652O8U5kx/DduUmwETNN9ExaHGzRfb/dYJcQQMq/OGWAx9tog==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(8936002)(478600001)(66556008)(2906002)(66476007)(83380400001)(6666004)(54906003)(4326008)(36756003)(26005)(316002)(186003)(8676002)(38100700001)(956004)(1076003)(52116002)(6486002)(5660300002)(2616005)(86362001)(66946007)(30864003)(7696005)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?19cOOmta+b1iwhSWv+ApAKkDH077RjeKduApdBBODvcwzJpsze3TNfi1fgpB?=
 =?us-ascii?Q?EuLTz0GGtnmLDvY+UG3Np4NbLDvOfatlFI4bug+fnKb23j2JsUudP2jsb76w?=
 =?us-ascii?Q?nRZsOpXaNP7lkZTvfV4tM8jMDQi7tvTEj4vuKnymgIm3JS36RSulpwxRGkmm?=
 =?us-ascii?Q?rv0uHrBYYlk5znVtN2rcvZpwS9CteHK4eBGpG3Nh9/9v8bOzvqVnc/6S6+tr?=
 =?us-ascii?Q?MQJw6QnPOlyWAAfahgkCyZS/WQZwGq0TbFk2IBB/wrGaDi8VIVlvRPJZA0m4?=
 =?us-ascii?Q?RJ/FwLvZjrFr3z6kXoDWPtuujP2aEFR9hGoqeboKEF88K8+KNTbNjo33RtNG?=
 =?us-ascii?Q?6krttRWAbZ6HqynnC2xC1GxgeKl9u1d35RLLaH6yCbZ9wG4FLvf1eNLztyfe?=
 =?us-ascii?Q?f051yXQ2r2BmuSb8WtPbe4cWj2XBsOLKbPV8wpxWHnm9rAcIqNxFJ0aiw9nl?=
 =?us-ascii?Q?51m8hjV86Lpo3Cub+alGTCjynXBEoMOK1pzsJoH6FGFh9sP5gLnilGIXV5wy?=
 =?us-ascii?Q?yJHnj82G8SvmwWIhnoxHUIS06ttlVMv9tWbfrbpU0cjwY0tp10/gQbIDnTWg?=
 =?us-ascii?Q?a/0MCyodncPMgPFp+FHUXe89GkYh+PMuCTmn6CM8YruV7ar9EUAk/ipZ0v9H?=
 =?us-ascii?Q?8v7fcxcEHtjq444JaI0QUp3tcoop+YpQLyu4RrFmHA8BDpCL+P6vcpEKajMO?=
 =?us-ascii?Q?Uz3x+25qKS1pRQ4ku3lJarUUuDnGu+nR7HjXcgdnLon4nUNYd3jXWd0Vp/qe?=
 =?us-ascii?Q?FVIWL/CsZHWf4+mvGxyp/9KxbvOyJtS0Vtd/yJ1+EnSzQdXBqCaeUXrPEIJS?=
 =?us-ascii?Q?p1uqUp/vpQ+SJ4A0VVGM7Be+B8dnaJXcJWm6tyeO4SM6s+HMM6WgQ4rS5h+d?=
 =?us-ascii?Q?eYmo5CN6WzWV/DA0z+mIZSUaMn7R53sh9sQIgduiZnVL0xJJ5QW+WXHQn6si?=
 =?us-ascii?Q?1qssZ5jYwuTuS+AluONlbtsSLm6AQB6Qd94S7lDF3nVQ4LqzZHNjpRzOfxhj?=
 =?us-ascii?Q?9GXfLZiaKjQBAk7t54Q0luwbgMkvNU8EANqHpjmv/WW2IJz8sLrAkBJ4R6Si?=
 =?us-ascii?Q?v9Bb4PXK5yzCp+LaoEs8RPBn5Ukt5Mn+nSSJL4lRd3GlllBvKqpIHTULJjI7?=
 =?us-ascii?Q?c0vfgr93wRvjbTxgGmX14ljYVOD5Ep0EDntmMzGGszOCgFMW+sMbCyIbqT82?=
 =?us-ascii?Q?MIDHb5zoeZH4PuyTtBxAY8cQP3YOLQ0OeCNAHP4BhMFLj0o2F3uluWP1+mrP?=
 =?us-ascii?Q?scPVz4YXo9m9bEGF+DkART3ZoVGrOypLB0SrMqH144Y88PdQsDYELG3b2VUN?=
 =?us-ascii?Q?ymKQ8iRNbln0Wm+66/NJ8Cg5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4e6eb0-f89a-46e1-e267-08d8f347b75a
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 06:47:41.8978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8MTurS8ZxDJvmyCMOWtqwqVUTyGH6ePiv8s79F1/qcQ+XGwjq4iNpYdYvufytoHqg54B2Zumz9I/l+5KLSzmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2794
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
- AMD NAVI GPU based products are already in the commercial market,
  hence some of the I2C parameters are statically programmed as it can
  not be part of ACPI table.

Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Co-developed-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
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
 drivers/i2c/busses/i2c-designware-core.h   |   3 +
 drivers/i2c/busses/i2c-designware-master.c | 151 +++++++++++++++++++++
 drivers/i2c/busses/i2c-designware-pcidrv.c |  57 ++++++++
 4 files changed, 214 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 3c19aada4b30..d14ab2d2f23b 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -150,6 +150,9 @@ int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
 	reg = readl(dev->base + DW_IC_COMP_TYPE);
 	i2c_dw_release_lock(dev);
 
+	if (dev->flags & MODEL_AMD_NAVI_GPU)
+		map_cfg.max_register = AMD_UCSI_INTR_REG;
+
 	if (reg == swab32(DW_IC_COMP_TYPE_VALUE)) {
 		map_cfg.reg_read = dw_reg_read_swab;
 		map_cfg.reg_write = dw_reg_write_swab;
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 5392b82f68a4..f65a15bac862 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -293,9 +293,12 @@ struct dw_i2c_dev {
 #define ACCESS_INTR_MASK	BIT(0)
 #define ACCESS_NO_IRQ_SUSPEND	BIT(1)
 
+#define MODEL_AMD_NAVI_GPU	BIT(2)
 #define MODEL_MSCC_OCELOT	BIT(8)
 #define MODEL_BAIKAL_BT1	BIT(9)
 #define MODEL_MASK		GENMASK(11, 8)
+#define AMD_UCSI_INTR_EN	0xd
+#define AMD_UCSI_INTR_REG	0x474
 
 int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
 u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index dd27b9dbe931..60d9eae9df51 100644
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
@@ -259,6 +263,127 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
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
+	if (ret) {
+		dev_err(dev->dev, "i2c timeout error %d\n", ret);
+		return -ETIMEDOUT;
+	}
+
+	regmap_read(dev->map, DW_IC_CLR_INTR, &val);
+	if (val & DW_IC_INTR_STOP_DET)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static int i2c_dw_status(struct dw_i2c_dev *dev)
+{
+	int status;
+
+	status = i2c_dw_wait_bus_not_busy(dev);
+	if (status)
+		return -ETIMEDOUT;
+
+	return i2c_dw_check_stopbit(dev);
+}
+
+/*
+ * Initiate and continue master read/write transaction with polling
+ * based transfer routine afterward write messages into the tx buffer.
+ */
+static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs)
+{
+	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
+	int msg_wrt_idx, msg_itr_lmt, buf_len, data_idx;
+	int cmd = 0, ret, status;
+	u8 *tx_buf;
+	u32 val;
+	/*
+	 * In order to enable the interrupt for UCSI i.e. AMD NAVI GPU card,
+	 * it is mandatory to set the right value in specific register
+	 * (offset:0x474) as per the hardware IP specification.
+	 */
+	regmap_write(dev->map, AMD_UCSI_INTR_REG, AMD_UCSI_INTR_EN);
+
+	ret = i2c_dw_acquire_lock(dev);
+	if (ret) {
+		dev_err(dev->dev, "Failed to get bus ownership\n");
+		return ret;
+	}
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
+					if (status) {
+						ret = -ETIMEDOUT;
+						goto lock_release;
+					}
+					for (data_idx = 0; data_idx < buf_len; data_idx++) {
+						regmap_read(dev->map, DW_IC_DATA_CMD, &val);
+						tx_buf[data_idx] = val;
+					}
+					status = i2c_dw_check_stopbit(dev);
+					if (status) {
+						ret = -ETIMEDOUT;
+						goto lock_release;
+					}
+				}
+			} else {
+				regmap_write(dev->map, DW_IC_DATA_CMD, *tx_buf++ | cmd);
+				usleep_range(AMD_TIMEOUT_MIN_MSEC, AMD_TIMEOUT_MAX_MSEC);
+			}
+		}
+		status = i2c_dw_check_stopbit(dev);
+		if (status) {
+			ret = -ETIMEDOUT;
+			goto lock_release;
+		}
+	}
+
+lock_release:
+	i2c_dw_release_lock(dev);
+
+	return ret;
+}
+
 /*
  * Initiate (and continue) low level master read/write transaction.
  * This function is only called from i2c_dw_isr, and pumping i2c_msg
@@ -461,6 +586,15 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
 
 	pm_runtime_get_sync(dev->dev);
+	/*
+	 * Initiate I2C message transfer when AMD NAVI GPU card is enabled,
+	 * As it is polling based transfer mechanism, which does not support
+	 * interrupt based functionalities of existing DesignWare driver.
+	 */
+	if (dev->flags & MODEL_AMD_NAVI_GPU) {
+		ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
+		goto done_nolock;
+	}
 
 	if (dev_WARN_ONCE(dev->dev, dev->suspended, "Transfer while suspended\n")) {
 		ret = -ESHUTDOWN;
@@ -738,6 +872,20 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
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
+		dev_err(dev->dev, "Failed to add adapter : %d\n", ret);
+	pm_runtime_put_noidle(dev->dev);
+
+	return ret;
+}
+
 int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 {
 	struct i2c_adapter *adap = &dev->adapter;
@@ -774,6 +922,9 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	adap->dev.parent = dev->dev;
 	i2c_set_adapdata(adap, dev);
 
+	if (dev->flags & MODEL_AMD_NAVI_GPU)
+		return amd_i2c_adap_quirk(dev);
+
 	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
 		irq_flags = IRQF_NO_SUSPEND;
 	} else {
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 55c83a7a24f3..e237e9ac1eef 100644
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
 
+	if (dev->flags & MODEL_AMD_NAVI_GPU)
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

