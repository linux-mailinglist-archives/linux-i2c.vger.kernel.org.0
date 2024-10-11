Return-Path: <linux-i2c+bounces-7338-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A67E799A1A9
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 12:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06EE2B2358C
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 10:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FE9212EF0;
	Fri, 11 Oct 2024 10:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dBvlpSWG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53653212D14;
	Fri, 11 Oct 2024 10:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728643321; cv=fail; b=ktwTe4MwTUaxsmeNtKaStgJrZ0i7YmwWalxEUCCO9XF2GeRifRvxy2Gnbt5+aIO8qqvd61axtL2Fs4KxI0+lfO6V4jSvPdioaRab0dsFrKeDWd/34B2aqM4QkJdV0VJyetYbihUl5hDlUbtb2e10Wj1vQ6FGecvRPhGc3pgkbxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728643321; c=relaxed/simple;
	bh=WsHWd61tSCCoGt0aRUV+MRjXunQmbkOTZDUX4ePmuRA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gXr1vHCddMUJnNjDxXDCukkcwf/ULf61rd53n+3rf3dqKOX+f4/OAQv036GRNPeW4IWOU3+KS+KdTKpUWI+qFZUVMrevUQiW0OGtHmH8Qt6UNv2b7VA6uO0WS0DUy2+e+DxwwJYEtIgyRnpgpJmGnzS+HQACu5DsWKIZ7tQQNCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dBvlpSWG; arc=fail smtp.client-ip=40.107.92.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDiOu59q6odR4Ra07NSiTjdKkgpizjADv4leDn3QS4F/A3ZANzTF/AlqQQpLZc9wwupqHF3k0Wi5OGcr/EpIR2BWVRjYYxchVAj8wnUV+/a1QvSj2JfDjWMP8lJhjsx4f6AhYE1Acer9T0OP3TmAu3l3rSLBBdDYwOB7fSLJXTGwdIJq8tfrpfo8HnnMTI4asiNH2oaeuB2aGvTK+EEByD9K4RQML5pRCJCef35BO69ake7NPZMJCl1EhV4nPGCv2+DGJvX83n63EO5FOzEP4wIst/pKg6nIko98T8FZtklPUDfdEOlDoKy/tOTg5fao8w+peGilNjg5oRXJdZGiHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVNo8QOozvhqN4UeiFjhiBn7vrww10qJWK76pwdRQMw=;
 b=bNRsGGjlnRr4r/Ml8vDFi+r5Cpus7EqSSurUM1LJjwtxESQ2YkMiUBZfT6FGAMqqvdEYekc73Dh6DpwjYUzU2QIe8oTJAl34/DsCnkxsV/dm/iH89Sb/CSmpUSkIIjd+sC4UEHA+nNucDv2634dgkFiXTH6XQI2LTEcGSI7xzFoZKs6SjhiUTVjkC+FwZhAonAVJ/XalxSAHg/Of/4pDJZvRD9WSVQP0C1inycF6jpUPPQCfxgAn8Tke388xdYNpWv1rLcBKD4ZxK00Cm6KtO0Rh/Rerbl0m0/nKNIT4ITyNS9bPyll/4P9ULye7Uv/pWqLem7vJvZx3z4lAPpkWYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVNo8QOozvhqN4UeiFjhiBn7vrww10qJWK76pwdRQMw=;
 b=dBvlpSWGaatyqcxTOWZP01jmsXInSZERAzLz7la/4go39H8LnO6x0ECe89UDQPECE7mu0KAr3SVFr/NBc93E4B5p6VYssEJJvry8FmyzsxSmtDgDxQMJxuIY+aeCeMdHITk2zxvLkklNYiKZ+yrlZo+q8O9oCnaPrSg5caWTuWQ=
Received: from MW4PR04CA0366.namprd04.prod.outlook.com (2603:10b6:303:81::11)
 by SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 10:41:50 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::65) by MW4PR04CA0366.outlook.office365.com
 (2603:10b6:303:81::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18 via Frontend
 Transport; Fri, 11 Oct 2024 10:41:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 10:41:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 05:41:48 -0500
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 11 Oct 2024 05:41:45 -0500
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manion05gk@gmail.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>
Subject: [PATCH 2/2] i2c: xiic: Add atomic transfer support
Date: Fri, 11 Oct 2024 16:11:31 +0530
Message-ID: <20241011104131.733736-3-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011104131.733736-1-manikanta.guntupalli@amd.com>
References: <20241011104131.733736-1-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: manikanta.guntupalli@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|SA0PR12MB4413:EE_
X-MS-Office365-Filtering-Correlation-Id: eea50a99-878d-4e39-6b78-08dce9e15079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PCpmGV6z08KI7tgWKUMHD09qQOAyiMgiGzm2q5bNRwjz6SW2PQrF+LMUodHO?=
 =?us-ascii?Q?9iasVF9K+rUk+velApfkHm8hL1dxln6kiF/wrYH38EKzdvbe2h2P/tcg4nCO?=
 =?us-ascii?Q?/txopIwylOp8DOjGDs5CLZeSh+6TXk6BsVWVLZJP3zKKdsf5/BAS4IPmrODH?=
 =?us-ascii?Q?vxMwauZfljjLM3/KxUzdNlIvkSKhZVIdOs218bAt6WTWpWYAv4Z8gkGoMlZ7?=
 =?us-ascii?Q?I9x6aSH0GifpnRocDmbAixEtkIxSb1FQuJacwhy8CJEgrXdYq0Za7bqgdsZ3?=
 =?us-ascii?Q?Oh8tv22dda5CoZ1zy9g5OQx39gdQnHAZYWRJLT7x8LeKfBTygr7wfE5MkM49?=
 =?us-ascii?Q?uDXgqy6m93JBA+4sXOEpFDWLMK6sRINw/YM4Q14CJ0t1WcLtNf8UpqA3aLME?=
 =?us-ascii?Q?nNw7MLFJ2l/05Dt1nRwIJ/BTxLFM+5nTzirU5Pr7f/HVsQRcZrj/wi90oUXZ?=
 =?us-ascii?Q?P3gIh2LMk6DiFxmvm7keQu6iyfH/tdlz9TUzDivyyHYOgIlZ7sgOVzJxk50h?=
 =?us-ascii?Q?3Wm+3y0oDZ0jwwXgyeufV4ZsDffUCCOob/mLMrv0F8YfqCtTBddPrIX3fDJl?=
 =?us-ascii?Q?yKKQabnJeAj2zp1lff9ky5MKAHpattGleYJ13UTqAQaU1BuQ4YVHOOPoa3Kj?=
 =?us-ascii?Q?Jk2xm3kfe1J6znvxiptvlCCPnWHbS5nM+r9ZjumS+L+2x++j2QbWAB6N/fgh?=
 =?us-ascii?Q?DcMpNo11qRi86nD4flBRGiWxIL3SjJ2U0sKVk/rvjofmARRtERcbEafH74B5?=
 =?us-ascii?Q?QGSnmVSYFbLOFB9RbKVIHeeXCadJ/u+cMKqAUJpPeUR0l/piTKHI67qkuZ1m?=
 =?us-ascii?Q?JX3MLfTRYDvH+/qg3t91jvA4l2cJfuGSInVJ0bI+Fe01UX+EsOsPxaVb8MvX?=
 =?us-ascii?Q?SwVjmga7JlCd9lBIyJkIyZyB7xO7hF0j60RoxFwAaD0chb1HbSJ0w/V1+1F6?=
 =?us-ascii?Q?pmW3NK2d+tAOtmEDRFt6jgGaLdZoYhKT5ZNVxR3PxtCgckO8PCtHyj4aWxKE?=
 =?us-ascii?Q?A0Tq4OltSyUhzPWyZVZIZ3ZyI0lNdQqhd+5MI21zGpfRSKe3WNCCmXxpsRTG?=
 =?us-ascii?Q?ZJDPBwl6BFes2hMGamatHhGA7dEe3Ko9Y3YSW3r2HfgiVp3HuOruPSUFpJAE?=
 =?us-ascii?Q?rSkDbLg4DxU8HYPmPd26lfM+UyHaaF44YlEHS/4dUo5Yrmftge8k2jxfzlop?=
 =?us-ascii?Q?RKtmdv/fJNzS/BQlJWp8ibbNSsFugAvNLoMlxdlpx15OCNxXGM4aeeTPRbU8?=
 =?us-ascii?Q?Jg08J3AE132Kn9eT0VW7ZIJAfp8+DEG5HdSxt1ba3RFG2XdRPbjIhuK4vYYy?=
 =?us-ascii?Q?6uZAnWIE3a8RsSgYmuVOm0AZr3rJS/B30KMhnnToLjGkm2G11jszTE0J23r3?=
 =?us-ascii?Q?HwHceh0fFwIRo2zr3sP0OKYgrOJv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 10:41:50.5409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eea50a99-878d-4e39-6b78-08dce9e15079
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4413

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
 drivers/i2c/busses/i2c-xiic.c | 245 +++++++++++++++++++++++++++++-----
 1 file changed, 212 insertions(+), 33 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 052bae4fc664..e5e9a4993bd4 100644
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
 
@@ -877,22 +915,55 @@ static int xiic_wait_not_busy(struct xiic_i2c *i2c)
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
+			if (!i2c->rx_msg) {
+				xiic_clear_rx_fifo(i2c);
+				break;
+			}
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
@@ -990,9 +1061,10 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
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
@@ -1002,10 +1074,57 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
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
+	if (!i2c->tx_msg)
+		goto send_atomic_out;
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
+send_atomic_out:
+	if (i2c->nmsgs > 1) {
+		i2c->nmsgs--;
+		i2c->tx_msg++;
+		__xiic_start_xfer(i2c);
+	} else {
+		xiic_irq_dis(i2c, XIIC_INTR_TX_HALF_MASK);
+	}
 }
 
 static void xiic_start_send(struct xiic_i2c *i2c)
@@ -1014,11 +1133,13 @@ static void xiic_start_send(struct xiic_i2c *i2c)
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
@@ -1083,19 +1204,27 @@ static void xiic_start_send(struct xiic_i2c *i2c)
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
@@ -1112,7 +1241,10 @@ static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
 	bool broken_read, max_read_len, smbus_blk_read;
 	int ret, count;
 
-	mutex_lock(&i2c->lock);
+	if (i2c->atomic)
+		spin_lock(&i2c->atomic_lock);
+	else
+		mutex_lock(&i2c->lock);
 
 	if (i2c->tx_msg || i2c->rx_msg) {
 		dev_err(i2c->adap.dev.parent,
@@ -1121,6 +1253,8 @@ static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
 		goto out;
 	}
 
+	i2c->atomic_xfer_state = STATE_DONE;
+
 	/* In single master mode bus can only be busy, when in use by this
 	 * driver. If the register indicates bus being busy for some reason we
 	 * should ignore it, since bus will never be released and i2c will be
@@ -1147,7 +1281,9 @@ static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
 	i2c->tx_msg = msgs;
 	i2c->rx_msg = NULL;
 	i2c->nmsgs = num;
-	init_completion(&i2c->completion);
+
+	if (!i2c->atomic)
+		init_completion(&i2c->completion);
 
 	/* Decide standard mode or Dynamic mode */
 	i2c->dynamic = true;
@@ -1182,7 +1318,10 @@ static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
 		__xiic_start_xfer(i2c);
 
 out:
-	mutex_unlock(&i2c->lock);
+	if (i2c->atomic)
+		spin_unlock(&i2c->atomic_lock);
+	else
+		mutex_unlock(&i2c->lock);
 
 	return ret;
 }
@@ -1221,6 +1360,44 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
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
@@ -1228,6 +1405,7 @@ static u32 xiic_func(struct i2c_adapter *adap)
 
 static const struct i2c_algorithm xiic_algorithm = {
 	.master_xfer = xiic_xfer,
+	.master_xfer_atomic = xiic_xfer_atomic,
 	.functionality = xiic_func,
 };
 
@@ -1291,6 +1469,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		 DRIVER_NAME " %s", pdev->name);
 
 	mutex_init(&i2c->lock);
+	spin_lock_init(&i2c->atomic_lock);
 
 	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(i2c->clk))
-- 
2.34.1


