Return-Path: <linux-i2c+bounces-8401-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3CD9EAD45
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 10:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DC7816B633
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 09:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CAC223C77;
	Tue, 10 Dec 2024 09:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="okKMPqa8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB915212D86;
	Tue, 10 Dec 2024 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733824393; cv=fail; b=Za+fmzVsrfym6dHGqaxWcHdlBDCJCgjIlBJlG3en0jYb04pQlEkTM/lA7NCpok488FBM+fGqrPLEU8ykZq93p/+S0d0+P+toll19Nofk4ePp9drac5ZFOZ6IPeinH4ByrdOUXcevZzw/ORgjT4vwrNvfGsXBNQbjplMXB0BJz3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733824393; c=relaxed/simple;
	bh=cE7LKWJdhb9PB11GJ2K7sqLRC5lga9377cPKpIdJYvY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SHDw60svf9nlrmLWh511AOQkTvO0BdzfdHw2z/70+c6WXmI+7uvYPG9BtstlLUJ0lTJn9QDGXv2QDeeSAR8JoT8/l5IsR3BE+g+r1xxiwq/ue2QSTh15rVuuwaV9vomECsjVt4fvsZgGgK9Fhe2q9TP+PbwQriDFlAew/1dvV0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=okKMPqa8; arc=fail smtp.client-ip=40.107.223.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=td3oiW71Z63RS8d14RdFJdUFZ2SLx8tPMNVNVXYIslK98Pd5VJFru+YjVqgnj9IYuO+AKJ3/hMFuaS0+u7FPvdASKuNL7W1nKTcJNRfg3n9Vsl53PHeDoDozeSfxLBSgzfAS4W7fe0i1WIA3vE+063ucIySjp6n/RMcEPe8SKcGoKWItVMhgkfU53QS7CZRVxGBQZHQVF+1T3CiMuBbkFacOuhHbyB5OzAvbVKT1ntpwGmmeuagwpv3l+o2C89K6Q64KHY9arKDdKGumYO/YU4U9tMVd7uF+Nk9gICAOxVnGDzAFSaSV0wsUqZ9dQQCm6HbTITBU6PHuM8aQcsQacw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Io3Zi2+bbYpE3+z11P34zH12IQjDdap4mZbfRO4ydmI=;
 b=T8Oq+5Bv7osLBk0JPN5v2W1B1tNgfD8KP8v5EJRacv91meeOSqoppkhU8VFZ/p484V3WaRgXp6d/IrMDScvby2KFjExC3D8TTAnSXdn3TnDmstj0kBVDg8QojH96i+lTfCTU/b6L4DVKmugejaQkDwOz/qS+Ji3SzAM/QI3Is8Pe/exE2z6/LsXyVLon2YtkG5HpGFc/Az33IfOxL60iuzJMG2tpjVfVMofFxbGzJW8WD/zE5fzShKBphroDxxforEVeq6cED0fUJqRoiA3BHFF2dIYx2yFjNDDbUnI49qFQUoC6p8WKwscRwDMwhpCCSjGNoeXsvFxgJbgYK9aOiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Io3Zi2+bbYpE3+z11P34zH12IQjDdap4mZbfRO4ydmI=;
 b=okKMPqa8og72p41cJ+KV7LxQJYEJlxvoAo5Uduu76CPjc5v0n185y7iy9WQFVoSBGe6g4EJi/ulk1T/IwqkmFaQfNc4FhxRbGLVlxyh4qS19tze1iCS5MMLOje/vqMPs+AfdVi3TkPlAdBoAlynUTwZD3o2/FVdIFCK10s+fAB8=
Received: from MW4PR04CA0059.namprd04.prod.outlook.com (2603:10b6:303:6a::34)
 by MN0PR12MB6003.namprd12.prod.outlook.com (2603:10b6:208:37f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 09:53:06 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:303:6a:cafe::b3) by MW4PR04CA0059.outlook.office365.com
 (2603:10b6:303:6a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.15 via Frontend Transport; Tue,
 10 Dec 2024 09:53:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Tue, 10 Dec 2024 09:53:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 03:53:05 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 03:53:04 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Dec 2024 03:53:01 -0600
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manikantaguntupalli09@gmail.com>, "Manikanta
 Guntupalli" <manikanta.guntupalli@amd.com>
Subject: [PATCH V2 2/2] i2c: xiic: Add atomic transfer support
Date: Tue, 10 Dec 2024 15:22:42 +0530
Message-ID: <20241210095242.1982770-3-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210095242.1982770-1-manikanta.guntupalli@amd.com>
References: <20241210095242.1982770-1-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|MN0PR12MB6003:EE_
X-MS-Office365-Filtering-Correlation-Id: 32eb6ced-5a4a-4bcc-47a4-08dd19007234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DGFWzcB+55ESwm2WfjOIbW6rWXPWjEUJLSk4lEVh2iFOkv4ehM6tNOIG4c+l?=
 =?us-ascii?Q?W5eEHwpbICd4TtslVXS7a6bven22T9mZYSkm4kkpTehFt/UG4YYEReJ/0tvW?=
 =?us-ascii?Q?f7U8edGLJmOb1IeYOF77eXi88m4eUkfx5N+IeoReXt/MsPpizSI2JsM4VHRf?=
 =?us-ascii?Q?qp17+ajpty2Fh7fB9sFPrIySl0WDpEoms7JVwmEwCYoamWnDzFFELzoPjeQU?=
 =?us-ascii?Q?tsYWlq8x3KJ6cGPT+RxwSExlpPes6KUE1/CMJ6tjNWN56ubaUD/f6WqPoXDF?=
 =?us-ascii?Q?kvRgLLAL7SB/udbVGvzojGnCXnXIzehVT7cRWtv4ynJVhorEpgMch6v3ZCJl?=
 =?us-ascii?Q?D6MPHYmqbBlzjqUmlm3m/qcLsyMRKWI6yBtxf+Jf3gpUdnPtyflWDnf702lH?=
 =?us-ascii?Q?p+Fp6qqu17mH8YcRWGjyEPVQlhFrd9BeyUmHDP0WIYKlDSYn+gVA1DX+TvAK?=
 =?us-ascii?Q?HY0mRjaXhcyg901QtkdQJ35JFteVlh5lcBHRs1LYXTBJB1SjGiOvk1+WNUJI?=
 =?us-ascii?Q?3wu9DC9F9WW1hJCGJLp7EVW1BnFnHz+Nkds3P1tyo98QEPmdBdtwL5nUVTrC?=
 =?us-ascii?Q?ehmTl5xnMXCQW4E3c00KKbsz0n6CbRm7DgkLqTSEVFutF/wbEYVrRKZclH7G?=
 =?us-ascii?Q?kGBkThI6Cyb4llO+J2znYwClUoR90J+xA0HtwOZO/rqWgrtOmtg4TnmevfJH?=
 =?us-ascii?Q?gZjSHBugJGW4sTY/nU2kzPSVzNpyNzsBSLtq0ehdPqu2GBjVTigkuYD5pl3s?=
 =?us-ascii?Q?ayaQV0f3kIkwIYpsyTtEukL0k7eKBdKhdT1kZh+dpHKasnAgiuFzbIxiJvNG?=
 =?us-ascii?Q?23PfnBIKg3xzrmZkvmauXkOGbnwLw8ld/ZiYixwtDR7h9Fuj9iyqRUFGH+OA?=
 =?us-ascii?Q?Iq1MDQ/myNUNOBME5nzekReTz/fQl1q/pnySpZopZgpw44yctxWk9bIlYlOz?=
 =?us-ascii?Q?RYs1+GIU/liyF5DSZfoqI0WtrB/v1ubXZzLiLMAclYkUfE2/5kIezesDH/EG?=
 =?us-ascii?Q?IGowU46vTOYpYVrieAMEyL1W/+mb7hajng4hh5lr3yiHvkqVqOIVpkzmZ9qZ?=
 =?us-ascii?Q?bF9mDM9qHS0o9hxF4FdX69jVdACnGP1PbP+7zsHo8ReWHk6IRBc32L031Dw0?=
 =?us-ascii?Q?u8UaGHu1Jgae5Xcd24wE+CeYt1E7zZz7glS6dh2gO5tHcZwMrpCKeEmLc096?=
 =?us-ascii?Q?gw1+/IR+VJU0q8sSc6VUGSmq8g58RAXWJ11unOp6Lk3Zz0qJQx/zFchfEw0N?=
 =?us-ascii?Q?gIZfQh+eFjlevclrtlf+NIHnHv/EWK37u9/uTKWpt4Cs0RFXoY+0LBWZkN2S?=
 =?us-ascii?Q?3HhSv1XQGNHEtmYT9IG/oNcqp46hKZDQyqz5MgL3le94XMfqJmzZiuaHH181?=
 =?us-ascii?Q?3q9N76RBoV4OCN3LVKCA7kk1xi78FKs1Z6zoK+5wpHXwQ+ILVsVJwaiIZXSB?=
 =?us-ascii?Q?0znZjjvRAhL8Y26rGJ2aYSmq5Qtw9t5c?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 09:53:06.1639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32eb6ced-5a4a-4bcc-47a4-08dd19007234
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6003

Rework the read and write code paths in the driver to support operation
in atomic contexts.

Similar changes have been implemented in other drivers, including:
commit 3a5ee18d2a32 ("i2c: imx: implement master_xfer_atomic callback")
commit 445094c8a9fb ("i2c: exynos5: add support for atomic transfers")
commit ede2299f7101 ("i2c: tegra: Support atomic transfers")
commit fe402bd09049 ("i2c: meson: implement the master_xfer_atomic
callback")

Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
---
Changes for V2:
Remove NULL checks for tx_msg and rx_msg, as __xiic_start_xfer() already
has checks.
---
 drivers/i2c/busses/i2c-xiic.c | 239 +++++++++++++++++++++++++++++-----
 1 file changed, 206 insertions(+), 33 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index f48e73f905e5..dc1e46d834dc 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -30,6 +30,8 @@
 #include <linux/of.h>
 #include <linux/clk.h>
 #include <linux/pm_runtime.h>
+#include <linux/iopoll.h>
+#include <linux/spinlock.h>
 
 #define DRIVER_NAME "xiic-i2c"
 #define DYNAMIC_MODE_READ_BROKEN_BIT	BIT(0)
@@ -74,6 +76,9 @@ enum i2c_scl_freq {
  * @smbus_block_read: Flag to handle block read
  * @input_clk: Input clock to I2C controller
  * @i2c_clk: I2C SCL frequency
+ * @atomic: Mode of transfer
+ * @atomic_lock: Lock for atomic transfer mode
+ * @atomic_xfer_state: See STATE_
  */
 struct xiic_i2c {
 	struct device *dev;
@@ -96,6 +101,9 @@ struct xiic_i2c {
 	bool smbus_block_read;
 	unsigned long input_clk;
 	unsigned int i2c_clk;
+	bool atomic;
+	spinlock_t atomic_lock;		/* Lock for atomic transfer mode */
+	enum xilinx_i2c_state atomic_xfer_state;
 };
 
 struct xiic_version_data {
@@ -224,6 +232,8 @@ static const struct timing_regs timing_reg_values[] = {
 #define XIIC_I2C_TIMEOUT	(msecs_to_jiffies(1000))
 /* timeout waiting for the controller finish transfers */
 #define XIIC_XFER_TIMEOUT	(msecs_to_jiffies(10000))
+/* timeout waiting for the controller finish transfers in micro seconds */
+#define XIIC_XFER_TIMEOUT_US	10000000
 
 /*
  * The following constant is used for the device global interrupt enable
@@ -238,7 +248,7 @@ static const struct timing_regs timing_reg_values[] = {
 static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num);
 static void __xiic_start_xfer(struct xiic_i2c *i2c);
 
-static int __maybe_unused xiic_i2c_runtime_suspend(struct device *dev)
+static int xiic_i2c_runtime_suspend(struct device *dev)
 {
 	struct xiic_i2c *i2c = dev_get_drvdata(dev);
 
@@ -247,7 +257,7 @@ static int __maybe_unused xiic_i2c_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused xiic_i2c_runtime_resume(struct device *dev)
+static int xiic_i2c_runtime_resume(struct device *dev)
 {
 	struct xiic_i2c *i2c = dev_get_drvdata(dev);
 	int ret;
@@ -397,9 +407,10 @@ static int xiic_setclk(struct xiic_i2c *i2c)
 	unsigned int index = 0;
 	u32 reg_val;
 
-	dev_dbg(i2c->adap.dev.parent,
-		"%s entry, i2c->input_clk: %ld, i2c->i2c_clk: %d\n",
-		__func__, i2c->input_clk, i2c->i2c_clk);
+	if (!i2c->atomic)
+		dev_dbg(i2c->adap.dev.parent,
+			"%s entry, i2c->input_clk: %ld, i2c->i2c_clk: %d\n",
+			__func__, i2c->input_clk, i2c->i2c_clk);
 
 	/* If not specified in DT, do not configure in SW. Rely only on Vivado design */
 	if (!i2c->i2c_clk || !i2c->input_clk)
@@ -490,7 +501,8 @@ static int xiic_reinit(struct xiic_i2c *i2c)
 		return ret;
 
 	/* Enable interrupts */
-	xiic_setreg32(i2c, XIIC_DGIER_OFFSET, XIIC_GINTR_ENABLE_MASK);
+	if (!i2c->atomic)
+		xiic_setreg32(i2c, XIIC_DGIER_OFFSET, XIIC_GINTR_ENABLE_MASK);
 
 	xiic_irq_clr_en(i2c, XIIC_INTR_ARB_LOST_MASK);
 
@@ -572,11 +584,12 @@ static void xiic_read_rx(struct xiic_i2c *i2c)
 
 	bytes_in_fifo = xiic_getreg8(i2c, XIIC_RFO_REG_OFFSET) + 1;
 
-	dev_dbg(i2c->adap.dev.parent,
-		"%s entry, bytes in fifo: %d, rem: %d, SR: 0x%x, CR: 0x%x\n",
-		__func__, bytes_in_fifo, xiic_rx_space(i2c),
-		xiic_getreg8(i2c, XIIC_SR_REG_OFFSET),
-		xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
+	if (!i2c->atomic)
+		dev_dbg(i2c->adap.dev.parent,
+			"%s entry, bytes in fifo: %d, rem: %d, SR: 0x%x, CR: 0x%x\n",
+			__func__, bytes_in_fifo, xiic_rx_space(i2c),
+			xiic_getreg8(i2c, XIIC_SR_REG_OFFSET),
+			xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
 
 	if (bytes_in_fifo > xiic_rx_space(i2c))
 		bytes_in_fifo = xiic_rx_space(i2c);
@@ -635,6 +648,26 @@ static void xiic_read_rx(struct xiic_i2c *i2c)
 	}
 }
 
+static bool xiic_error_check(struct xiic_i2c *i2c)
+{
+	bool status = false;
+	u32 pend, isr, ier;
+
+	isr = xiic_getreg32(i2c, XIIC_IISR_OFFSET);
+	ier = xiic_getreg32(i2c, XIIC_IIER_OFFSET);
+	pend = isr & ier;
+
+	if ((pend & XIIC_INTR_ARB_LOST_MASK) ||
+	    ((pend & XIIC_INTR_TX_ERROR_MASK) &&
+	    !(pend & XIIC_INTR_RX_FULL_MASK))) {
+		xiic_reinit(i2c);
+		status = true;
+		if (i2c->tx_msg || i2c->rx_msg)
+			i2c->atomic_xfer_state = STATE_ERROR;
+	}
+	return status;
+}
+
 static int xiic_tx_fifo_space(struct xiic_i2c *i2c)
 {
 	/* return the actual space left in the FIFO */
@@ -648,8 +681,9 @@ static void xiic_fill_tx_fifo(struct xiic_i2c *i2c)
 
 	len = (len > fifo_space) ? fifo_space : len;
 
-	dev_dbg(i2c->adap.dev.parent, "%s entry, len: %d, fifo space: %d\n",
-		__func__, len, fifo_space);
+	if (!i2c->atomic)
+		dev_dbg(i2c->adap.dev.parent, "%s entry, len: %d, fifo space: %d\n",
+			__func__, len, fifo_space);
 
 	while (len--) {
 		u16 data = i2c->tx_msg->buf[i2c->tx_pos++];
@@ -672,9 +706,13 @@ static void xiic_fill_tx_fifo(struct xiic_i2c *i2c)
 				xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr &
 					     ~XIIC_CR_MSMS_MASK);
 			}
-			dev_dbg(i2c->adap.dev.parent, "%s TX STOP\n", __func__);
+			if (!i2c->atomic)
+				dev_dbg(i2c->adap.dev.parent, "%s TX STOP\n", __func__);
 		}
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, data);
+
+		if (i2c->atomic && xiic_error_check(i2c))
+			return;
 	}
 }
 
@@ -877,22 +915,51 @@ static int xiic_wait_not_busy(struct xiic_i2c *i2c)
 	 */
 	err = xiic_bus_busy(i2c);
 	while (err && tries--) {
-		msleep(1);
+		if (i2c->atomic)
+			udelay(1000);
+		else
+			usleep_range(1000, 1100);
 		err = xiic_bus_busy(i2c);
 	}
 
 	return err;
 }
 
+static void xiic_recv_atomic(struct xiic_i2c *i2c)
+{
+	while (xiic_rx_space(i2c)) {
+		if (xiic_getreg32(i2c, XIIC_IISR_OFFSET) & XIIC_INTR_RX_FULL_MASK) {
+			xiic_read_rx(i2c);
+
+			/* Clear Rx full and Tx error interrupts. */
+			xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK |
+					XIIC_INTR_TX_ERROR_MASK);
+		}
+		if (xiic_error_check(i2c))
+			return;
+	}
+
+	i2c->rx_msg = NULL;
+	xiic_irq_clr_en(i2c, XIIC_INTR_TX_ERROR_MASK);
+
+	/* send next message if this wasn't the last. */
+	if (i2c->nmsgs > 1) {
+		i2c->nmsgs--;
+		i2c->tx_msg++;
+		__xiic_start_xfer(i2c);
+	}
+}
+
 static void xiic_start_recv(struct xiic_i2c *i2c)
 {
 	u16 rx_watermark;
 	u8 cr = 0, rfd_set = 0;
 	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
 
-	dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n",
-		__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
-		xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
+	if (!i2c->atomic)
+		dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n",
+			__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
+			xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
 
 	/* Disable Tx interrupts */
 	xiic_irq_dis(i2c, XIIC_INTR_TX_HALF_MASK | XIIC_INTR_TX_EMPTY_MASK);
@@ -990,9 +1057,10 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 					XIIC_CR_MSMS_MASK)
 					& ~(XIIC_CR_DIR_IS_TX_MASK));
 		}
-		dev_dbg(i2c->adap.dev.parent, "%s end, ISR: 0x%x, CR: 0x%x\n",
-			__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
-			xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
+		if (!i2c->atomic)
+			dev_dbg(i2c->adap.dev.parent, "%s end, ISR: 0x%x, CR: 0x%x\n",
+				__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
+				xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
 	}
 
 	if (i2c->nmsgs == 1)
@@ -1002,10 +1070,55 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 	/* the message is tx:ed */
 	i2c->tx_pos = msg->len;
 
+	i2c->prev_msg_tx = false;
+
 	/* Enable interrupts */
-	xiic_setreg32(i2c, XIIC_DGIER_OFFSET, XIIC_GINTR_ENABLE_MASK);
+	if (!i2c->atomic)
+		xiic_setreg32(i2c, XIIC_DGIER_OFFSET, XIIC_GINTR_ENABLE_MASK);
+	else
+		xiic_recv_atomic(i2c);
+}
 
-	i2c->prev_msg_tx = false;
+static void xiic_send_rem_atomic(struct xiic_i2c *i2c)
+{
+	while (xiic_tx_space(i2c)) {
+		if (xiic_tx_fifo_space(i2c)) {
+			u16 data;
+
+			data = i2c->tx_msg->buf[i2c->tx_pos];
+			i2c->tx_pos++;
+			if (!xiic_tx_space(i2c) && i2c->nmsgs == 1) {
+				/* last message in transfer -> STOP */
+				if (i2c->dynamic) {
+					data |= XIIC_TX_DYN_STOP_MASK;
+				} else {
+					u8 cr;
+					int status;
+
+					/* Wait till FIFO is empty so STOP is sent last */
+					status = xiic_wait_tx_empty(i2c);
+					if (status)
+						return;
+
+					/* Write to CR to stop */
+					cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
+					xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr &
+						     ~XIIC_CR_MSMS_MASK);
+				}
+			}
+			xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, data);
+		}
+		if (xiic_error_check(i2c))
+			return;
+	}
+
+	if (i2c->nmsgs > 1) {
+		i2c->nmsgs--;
+		i2c->tx_msg++;
+		__xiic_start_xfer(i2c);
+	} else {
+		xiic_irq_dis(i2c, XIIC_INTR_TX_HALF_MASK);
+	}
 }
 
 static void xiic_start_send(struct xiic_i2c *i2c)
@@ -1014,11 +1127,13 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 	u16 data;
 	struct i2c_msg *msg = i2c->tx_msg;
 
-	dev_dbg(i2c->adap.dev.parent, "%s entry, msg: %p, len: %d",
-		__func__, msg, msg->len);
-	dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n",
-		__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
-		xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
+	if (!i2c->atomic) {
+		dev_dbg(i2c->adap.dev.parent, "%s entry, msg: %p, len: %d",
+			__func__, msg, msg->len);
+		dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n",
+			__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
+			xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
+	}
 
 	if (i2c->dynamic) {
 		/* write the address */
@@ -1083,19 +1198,27 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 				XIIC_INTR_TX_ERROR_MASK |
 				XIIC_INTR_BNB_MASK);
 	}
+
 	i2c->prev_msg_tx = true;
+
+	if (i2c->atomic && !i2c->atomic_xfer_state)
+		xiic_send_rem_atomic(i2c);
 }
 
 static void __xiic_start_xfer(struct xiic_i2c *i2c)
 {
 	int fifo_space = xiic_tx_fifo_space(i2c);
 
-	dev_dbg(i2c->adap.dev.parent, "%s entry, msg: %p, fifos space: %d\n",
-		__func__, i2c->tx_msg, fifo_space);
+	if (!i2c->atomic)
+		dev_dbg(i2c->adap.dev.parent, "%s entry, msg: %p, fifos space: %d\n",
+			__func__, i2c->tx_msg, fifo_space);
 
 	if (!i2c->tx_msg)
 		return;
 
+	if (i2c->atomic && xiic_error_check(i2c))
+		return;
+
 	i2c->rx_pos = 0;
 	i2c->tx_pos = 0;
 	i2c->state = STATE_START;
@@ -1112,7 +1235,10 @@ static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
 	bool broken_read, max_read_len, smbus_blk_read;
 	int ret, count;
 
-	mutex_lock(&i2c->lock);
+	if (i2c->atomic)
+		spin_lock(&i2c->atomic_lock);
+	else
+		mutex_lock(&i2c->lock);
 
 	if (i2c->tx_msg || i2c->rx_msg) {
 		dev_err(i2c->adap.dev.parent,
@@ -1121,6 +1247,8 @@ static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
 		goto out;
 	}
 
+	i2c->atomic_xfer_state = STATE_DONE;
+
 	/* In single master mode bus can only be busy, when in use by this
 	 * driver. If the register indicates bus being busy for some reason we
 	 * should ignore it, since bus will never be released and i2c will be
@@ -1147,7 +1275,9 @@ static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
 	i2c->tx_msg = msgs;
 	i2c->rx_msg = NULL;
 	i2c->nmsgs = num;
-	init_completion(&i2c->completion);
+
+	if (!i2c->atomic)
+		init_completion(&i2c->completion);
 
 	/* Decide standard mode or Dynamic mode */
 	i2c->dynamic = true;
@@ -1182,7 +1312,10 @@ static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
 		__xiic_start_xfer(i2c);
 
 out:
-	mutex_unlock(&i2c->lock);
+	if (i2c->atomic)
+		spin_unlock(&i2c->atomic_lock);
+	else
+		mutex_unlock(&i2c->lock);
 
 	return ret;
 }
@@ -1221,6 +1354,44 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	return err;
 }
 
+static int xiic_xfer_atomic(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	struct xiic_i2c *i2c = i2c_get_adapdata(adap);
+	u32 status_reg;
+	int err;
+
+	err = xiic_i2c_runtime_resume(i2c->dev);
+	if (err)
+		return err;
+
+	i2c->atomic = true;
+	err = xiic_start_xfer(i2c, msgs, num);
+	if (err < 0)
+		return err;
+
+	err = readl_poll_timeout_atomic(i2c->base + XIIC_SR_REG_OFFSET,
+					status_reg, !(status_reg & XIIC_SR_BUS_BUSY_MASK),
+					1, XIIC_XFER_TIMEOUT_US);
+
+	if (err) /* Timeout */
+		err = -ETIMEDOUT;
+
+	spin_lock(&i2c->atomic_lock);
+	if (err || i2c->state) {
+		i2c->tx_msg = NULL;
+		i2c->rx_msg = NULL;
+		i2c->nmsgs = 0;
+	}
+
+	err = (i2c->atomic_xfer_state == STATE_DONE) ? num : -EIO;
+	spin_unlock(&i2c->atomic_lock);
+
+	i2c->atomic = false;
+	xiic_i2c_runtime_suspend(i2c->dev);
+
+	return err;
+}
+
 static u32 xiic_func(struct i2c_adapter *adap)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
@@ -1228,6 +1399,7 @@ static u32 xiic_func(struct i2c_adapter *adap)
 
 static const struct i2c_algorithm xiic_algorithm = {
 	.master_xfer = xiic_xfer,
+	.master_xfer_atomic = xiic_xfer_atomic,
 	.functionality = xiic_func,
 };
 
@@ -1291,6 +1463,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		 DRIVER_NAME " %s", pdev->name);
 
 	mutex_init(&i2c->lock);
+	spin_lock_init(&i2c->atomic_lock);
 
 	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(i2c->clk))
-- 
2.25.1


