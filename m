Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A461E6796F9
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 12:48:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233780AbjAXLsR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 06:48:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232951AbjAXLsQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 06:48:16 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8D940BE8
        for <linux-i2c@vger.kernel.org>; Tue, 24 Jan 2023 03:48:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlPVNqd2dbxtxInDXnQvd5XJltf3a+pN0I6jenrc8DH8bNDjEGCJhAyUXcHWgb8AuKhsa/BCITLGj6doXeR/BXhl2zYTk8HQ8xdpoCkQjS05RvWu1RdSnl0BjCqy76GoydeGO3HXDS74Uzdx8pursRZTnTRWtB8C8JdwcXgZVXGQUSavn7rSUzn2koGtarHQSln0AcPlwkJtpKqmXCGLJNCjm8GKigTVppZI2hT3adsg4nZ1uMGG4/zIIhDS5oJHeX3XA77+2HayvsSXdTv1TAEM/ezKz+zn2OTx3NoN9Y6cuxbvB+0p4T7vur11FlS1T0dNQ6genwGWDCqmdQ+mrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g04pMLpTU7xnGgMneCQG48GxCKOoyy/bWlpwkJ6ZEoo=;
 b=c0dlcD218cL8kaePqkAt4CRkpOCgmkT0qbGSOq0i1rbRh+x/dY2TQBEZiDHzEAN/sBJxm6vZwZhYwK2zNzy9Y+CGvhPZHhaKZ1KbckLUOOoK2to2UsWizQWiivDzwMp649kCUmzZy4/oO/ljBvH5+1H/59Pos4vfg34z2tMc40CjEtMgGtKHD49N8pNlZiV/B3yLoqUoA1j4Ttrp32Agr0419Vx+EwqJYLTDVqCk62tlHZJZM4DTF/JWUMAbMximixmlTX1EB9xPykQheWEOJBuq3OTOYCGIafDV6qNd400zguJrEGPbL6ZyVbPDmkJ6vG3lrVt3xe+K82qj0Topvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g04pMLpTU7xnGgMneCQG48GxCKOoyy/bWlpwkJ6ZEoo=;
 b=rav0NuAapDkweOLSwDDMiK+/Az8MROzs0EkvJ14py/ruSbCnQ0QqouT2g1M8cJioHzp7O0xp80Ry6j0xB22wMg2sAl+Zly7P0t/1vKWA9P7wUUexz60wAcrQR7v0mGEwXg5naL7cNxE6J2CzWDeng0PV36zKn74FxZZrrVQAdKw=
Received: from DS7PR03CA0283.namprd03.prod.outlook.com (2603:10b6:5:3ad::18)
 by DS7PR12MB6096.namprd12.prod.outlook.com (2603:10b6:8:9b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Tue, 24 Jan 2023 11:48:12 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::8d) by DS7PR03CA0283.outlook.office365.com
 (2603:10b6:5:3ad::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 11:48:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Tue, 24 Jan 2023 11:48:12 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 24 Jan
 2023 05:48:09 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
CC:     <linux-i2c@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v1] i2c: designware: Change from u32 to unsigned int for regmap_read() calls
Date:   Tue, 24 Jan 2023 17:17:32 +0530
Message-ID: <20230124114732.1387997-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT027:EE_|DS7PR12MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: bc3b23fc-ff3f-4d81-cd81-08dafe00df24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qqzsqw2pa8Szo1i0AwOaG500xn7L4vAWUv2Ae4Bz4jwMevEDCxucXued6tlSCwhgkkz+ccpnUw5knDCEZN9y0u6Bg6czpvJp5uT3LKuV/1BYQrIqlFMVEUMT2XK2+8xonOah+yRfEhR5kZkXXZhFiZWXypkY+ayPyDclqjiQcS7StD6kWJ6o8h+lflBWw5G7+Sh89FoAO3l7fQt4nIMnxH1gvsQjTcAJIePWB9dCs4Brq+YoTrTOUPoCyumkE0/7vZIgj4odd8TfIW3viG4SS45kHzjwQYcq69zuuZGop5XyYm+z0ZROtVc/5MuHtdQ2w3UcbtvQZ/cVDWowZ2U5VujZpbAPGgpIacEu5wiMQt5FjR790MCcmZ4SclYOO46HrsrGYHR3+WHTaMenhkYNRc8gbvzmPPopiPtEZsjEeGxD5ogZvYF61wgRGh/yQfkDneQzPpxCwjQs4j0e2hKEwWkdHlVJ/o+zrwqaUX0GstZIfh/SUprazhs+o89EB4G+cqYfnThQjEkV4cxUbeOLUSJVaLcyu4Y/FEzNPIHr9IvAraYLsLVqkgkx/M8wqcy3vaYBTGLtTDKSRKnGOB+7ulcIMjDZpza6nJ4cLlc+jJfQsYZA9if5bRliYfVBXgNlero0b76yYTmtEt4UaWLnUU6KiTjabJYuA8+kHVZ0I3IOtVdcQ9gvN42/ESqTeDxGznmz9ovLlk0IdMwC1+J6WG80uPdIWezm4fNuaV57TpQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(81166007)(336012)(426003)(47076005)(316002)(6666004)(40460700003)(26005)(110136005)(54906003)(16526019)(186003)(356005)(70206006)(4326008)(1076003)(70586007)(8676002)(86362001)(36756003)(2616005)(82310400005)(7696005)(40480700001)(36860700001)(83380400001)(478600001)(2906002)(41300700001)(5660300002)(8936002)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 11:48:12.2751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc3b23fc-ff3f-4d81-cd81-08dafe00df24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6096
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

regmap_read() API signature expects the caller to send "unsigned int"
type to return back the read value, but there are some occurrences of 'u32'
across i2c-designware-* files.

Change them to match the regmap_read() signature.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 11 ++++++-----
 drivers/i2c/busses/i2c-designware-core.h   |  2 +-
 drivers/i2c/busses/i2c-designware-master.c | 13 +++++++------
 drivers/i2c/busses/i2c-designware-slave.c  |  4 ++--
 4 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index a3240ece55b2..ae808e91b17f 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -388,7 +388,7 @@ u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset)
 
 int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
 {
-	u32 reg;
+	unsigned int reg;
 	int ret;
 
 	ret = i2c_dw_acquire_lock(dev);
@@ -439,7 +439,7 @@ int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
 void __i2c_dw_disable(struct dw_i2c_dev *dev)
 {
 	int timeout = 100;
-	u32 status;
+	unsigned int status;
 
 	do {
 		__i2c_dw_disable_nowait(dev);
@@ -524,7 +524,7 @@ void i2c_dw_release_lock(struct dw_i2c_dev *dev)
  */
 int i2c_dw_wait_bus_not_busy(struct dw_i2c_dev *dev)
 {
-	u32 status;
+	unsigned int status;
 	int ret;
 
 	ret = regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
@@ -568,7 +568,8 @@ int i2c_dw_handle_tx_abort(struct dw_i2c_dev *dev)
 
 int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
 {
-	u32 param, tx_fifo_depth, rx_fifo_depth;
+	u32 tx_fifo_depth, rx_fifo_depth;
+	unsigned int param;
 	int ret;
 
 	/*
@@ -608,7 +609,7 @@ u32 i2c_dw_func(struct i2c_adapter *adap)
 
 void i2c_dw_disable(struct dw_i2c_dev *dev)
 {
-	u32 dummy;
+	unsigned int dummy;
 	int ret;
 
 	ret = i2c_dw_acquire_lock(dev);
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index a7ec8d5d0e72..903d5928e230 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -265,7 +265,7 @@ struct dw_i2c_dev {
 	u8			*rx_buf;
 	int			msg_err;
 	unsigned int		status;
-	u32			abort_source;
+	unsigned int		abort_source;
 	int			irq;
 	u32			flags;
 	struct i2c_adapter	adapter;
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 3be7581ee3fb..55ea91a63382 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -39,7 +39,7 @@ static void i2c_dw_configure_fifo_master(struct dw_i2c_dev *dev)
 
 static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 {
-	u32 comp_param1;
+	unsigned int comp_param1;
 	u32 sda_falling_time, scl_falling_time;
 	struct i2c_timings *t = &dev->timings;
 	const char *fp_str = "";
@@ -211,7 +211,7 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
 {
 	struct i2c_msg *msgs = dev->msgs;
 	u32 ic_con = 0, ic_tar = 0;
-	u32 dummy;
+	unsigned int dummy;
 
 	/* Disable the adapter */
 	__i2c_dw_disable(dev);
@@ -287,7 +287,7 @@ static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	int msg_wrt_idx, msg_itr_lmt, buf_len, data_idx;
 	int cmd = 0, status;
 	u8 *tx_buf;
-	u32 val;
+	unsigned int val;
 
 	/*
 	 * In order to enable the interrupt for UCSI i.e. AMD NAVI GPU card,
@@ -505,7 +505,8 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 	unsigned int rx_valid;
 
 	for (; dev->msg_read_idx < dev->msgs_num; dev->msg_read_idx++) {
-		u32 len, tmp;
+		unsigned int tmp;
+		u32 len;
 		u8 *buf;
 
 		if (!(msgs[dev->msg_read_idx].flags & I2C_M_RD))
@@ -653,7 +654,7 @@ static const struct i2c_adapter_quirks i2c_dw_quirks = {
 
 static u32 i2c_dw_read_clear_intrbits(struct dw_i2c_dev *dev)
 {
-	u32 stat, dummy;
+	unsigned int stat, dummy;
 
 	/*
 	 * The IC_INTR_STAT register just indicates "enabled" interrupts.
@@ -714,7 +715,7 @@ static u32 i2c_dw_read_clear_intrbits(struct dw_i2c_dev *dev)
 static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
 {
 	struct dw_i2c_dev *dev = dev_id;
-	u32 stat, enabled;
+	unsigned int stat, enabled;
 
 	regmap_read(dev->map, DW_IC_ENABLE, &enabled);
 	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &stat);
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index c6d2e4c2ac23..cec25054bb24 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -98,7 +98,7 @@ static int i2c_dw_unreg_slave(struct i2c_client *slave)
 
 static u32 i2c_dw_read_clear_intrbits_slave(struct dw_i2c_dev *dev)
 {
-	u32 stat, dummy;
+	unsigned int stat, dummy;
 
 	/*
 	 * The IC_INTR_STAT register just indicates "enabled" interrupts.
@@ -150,7 +150,7 @@ static u32 i2c_dw_read_clear_intrbits_slave(struct dw_i2c_dev *dev)
 static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
 {
 	struct dw_i2c_dev *dev = dev_id;
-	u32 raw_stat, stat, enabled, tmp;
+	unsigned int raw_stat, stat, enabled, tmp;
 	u8 val = 0, slave_activity;
 
 	regmap_read(dev->map, DW_IC_ENABLE, &enabled);
-- 
2.25.1

