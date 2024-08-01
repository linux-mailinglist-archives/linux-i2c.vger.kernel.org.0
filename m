Return-Path: <linux-i2c+bounces-5098-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C16089448B3
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2024 11:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77F81283BAD
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2024 09:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6268E170A32;
	Thu,  1 Aug 2024 09:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="laq23D7c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2085.outbound.protection.outlook.com [40.107.101.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB4C171064;
	Thu,  1 Aug 2024 09:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722505488; cv=fail; b=Hw/NIosth7gYFG3h4sGZbQQR0B38RSZsenPWX61cswAn0rrOhG9Lek0TVm5jqFQsZP4Qz9RdF83SvvWORgW4LQ6dsr/sWxGBR+G6IpJffc5Aabv7aLNAGlv88dLNpl7wwMLrFpq3r9WWBGDZrnFImF3BKRU2JIfzhyUO5nD8I0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722505488; c=relaxed/simple;
	bh=XBTrhhXXFvt2iW+2Y8q/oPKsHqjQ36Qxazg7MlxnqCo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gjwivnP9zOmqRNeAkc9YHQNAmFuWnuQGtYHC+mQ9bXM8CTHXqnUxrg7G+UNvydFKHQS4AfCJDVhkV2bXxC8ow4UXspu7UWr376Fjnw7eed1d8U5f0qSYtObqGJn5dVcQKYnsCDfzYi0CIDlTiwRkDawbPfqOxkTHYiueZbBiNYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=laq23D7c; arc=fail smtp.client-ip=40.107.101.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jmur/qC/iLQG+6U2tPjJ6bOSkjW8jVSRPIVq1GSRyo2UBCd0qCDAyVbIcBbKkzB8wGkCDDurBcgMAnZquxfyXkMz5hx4MB6Ii98kSZVeOp8a8W1Jr9f3n7zB1WZqR0B2ohOF3mvPzFHiKWilnEmHRwEI3QFPeLxRKVf9fC1pgFpvtM3hEMWGWz2U+/u2+K75UHRmIwRDw8VTQ32UD4x7mnL+t9NP9CgslRsdP7eFo/ZBm2gnmUKMUGVR+TbzWZCNLNIwjwpJTEoT7Jsvpid3CEN8tecoeP+oEgAM668O1qR/WqrvvP25Tvmd+DU/DwahEshLy4FhXONqh4rR9HNYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giiw7thtg0RWaqNT8pREJ2RKq059p0IDmXwhkxJC2QE=;
 b=MKpK0fmRhduPjpQLzU1Spd42Zp1JXHO7OHd0LPBljzgTJ01bVNJLiGH/qhpn/vlYiH1tBokIixLFabjYR+5HWlzSV+Ha+UxGWRffJaOtItWAeJT+sTRatO0+djY4HFfehmv6D0NoHx4VmVYkklMCNf+pRw7/WWiCipe0SUAgxGn/Gjt+Y7ewJz7RWuh+3LJ45IBtqQM55HeBOCbTTuMJmeVUmIB/QQ0gmxeKcVZkyiFwcYKPC9Ccnzw3YAmhksmb7rQc/tlpzM/n0Nne8qLJpM4lla2xseh2aXRPjkEjqD4clAIt9qLt5jsiNbrIvc3cafm7KT1GFfeY2OGsShTK/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giiw7thtg0RWaqNT8pREJ2RKq059p0IDmXwhkxJC2QE=;
 b=laq23D7cy9lrd6+C/GbdTyJdYvaTKV+D+aotrg3zUQ8CIjYtvoAoBN1p/w+YzD4dzVuTNZ5j0DiMM68ktdAg1nnB3LdRBAtWOgfkAqMLx6cX4pYJmRUW//BCq8yNj+q+2L2Yx633ouFEIaz8ogORu0jCFH2Bod2LiAZ4IxvyZSk=
Received: from MW4PR04CA0094.namprd04.prod.outlook.com (2603:10b6:303:83::9)
 by PH7PR12MB5686.namprd12.prod.outlook.com (2603:10b6:510:13d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 09:44:42 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:303:83:cafe::29) by MW4PR04CA0094.outlook.office365.com
 (2603:10b6:303:83::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 09:44:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:44:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:44:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:44:40 -0500
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 1 Aug 2024 04:44:37 -0500
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <michal.simek@amd.com>, <radhey.shyam.pandey@amd.com>,
	<srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
	<manion05gk@gmail.com>, Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Subject: [PATCH 3/3] i2c: cadence: Add atomic transfer support for controller version 1.4
Date: Thu, 1 Aug 2024 15:14:08 +0530
Message-ID: <20240801094408.2004460-4-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240801094408.2004460-1-manikanta.guntupalli@amd.com>
References: <20240801094408.2004460-1-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: manikanta.guntupalli@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|PH7PR12MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c926ec-aac8-443c-ec27-08dcb20e914c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T0tg3Fc2CVlvC9Dp8M/hF8SdizUbAJQ3vXXBmAQrxppiLRdoTmFHhvlLcyXZ?=
 =?us-ascii?Q?X8WsVy0d1qecVoT/QhuSSQnlNtY0awQY7sBVFwyr8Rm2wPMWso+7SWQqpob9?=
 =?us-ascii?Q?JB+t52yCbfXc3PQD/9PLQPb9gLt50gKc0MboijYe+Qb0WvZHqLCkXK0TFSwv?=
 =?us-ascii?Q?N139VFEdlqRhyGYYCTBChcrrrNDF8lzoHKV7uGzj+fLU4XUfCoWsSblM//pT?=
 =?us-ascii?Q?4VNX3kiznE9oxXIMtLjR4St1jnPNSmlPlmwqJkYHcVkimEJf107OlhrgAqIY?=
 =?us-ascii?Q?Zm72AWNlN6PowzGPKIIGzutR31VfG8T92ORgJ0fwlDoO40CRXE2ST2ZMs2Bi?=
 =?us-ascii?Q?43SmmJE4UYWMJZSV5/C4QG+kXQm/yAuRbxg18T6Z+GOIeZKodh+4kfqh2mTJ?=
 =?us-ascii?Q?/rJsxBE+fDTMW/TtGmEZ8pxi4AY5bHpIV0vyWa0JLRjFuoyHDjuYsLf3sCJc?=
 =?us-ascii?Q?1ZNXQwNjC+rBTcwYZEBWZyR4aLKDUkKa3kMlbgzcrojFoCMl3puaxaUWISQb?=
 =?us-ascii?Q?VbgBqmWooPTWFyDgAdJE2JKwyUfa5iFk6cqaiLkqhxSNdwNoF/QSVYbxbn5P?=
 =?us-ascii?Q?GirIomY/y38SJ80AtUGxZQKvH8E7mnl/QtWmBObfLkJuqVDB3TpjstG00Osj?=
 =?us-ascii?Q?wWxaY3n36lQZldBWU8UwfobuKsnwco+CVKfMR4ZDxxGv9V0WiojeGmj5lAbM?=
 =?us-ascii?Q?7zHDrX0urAC/uCZVqSkOVb1L2VpYK3Gx9xMxRKNGFTBSdjWR8ysIeJ8LDbmt?=
 =?us-ascii?Q?Db4kx4J+Vv66tsFRXe3c7DZs9N4SwbrjD0dN9Dp01p0lGBNM33sD+quUNTU+?=
 =?us-ascii?Q?KjYXG62gQCa/QNjqssq9DHbQ8STPIzaBfItIqvZStoYtP9XobICycRwFE/Ho?=
 =?us-ascii?Q?ppvPOnV2FgE9+MFcr+V7ojLKcK3QOjApaSeRRaxg3hc3/6+Bfzr7LCelcoUA?=
 =?us-ascii?Q?aTZpgVEV83RlsWjW40tl7xWL8JwqAddYO5RuwlyBHel48cstPxJMYpM94S2e?=
 =?us-ascii?Q?enEcTONBqdgJNBbENTc7er6oAdeXJ713QVKN/t5yQmgUvM0pmiwwUevXBXIs?=
 =?us-ascii?Q?Y0Sf5MOSwRvows1TqKSxFtDp0g74Pktz/v9mRgET1XZJhXOXazL+LZ7f/+VI?=
 =?us-ascii?Q?zEpajmkrFD2YjHUMBbpJil2P1phSXQYE3AN9fN5bP5xhWTIo0ArhIKQB3EY0?=
 =?us-ascii?Q?zjwvA1oVM8RnTRvZjGAy+QVhfv3y1dMM84Ka/Y8JeDHMvZi13L9DljWtCx4v?=
 =?us-ascii?Q?lAetbGrmlFF8tEVYLxx54oYwm5dwb8nN7wov63DHZVjSixpA6n+j5zdn1W3t?=
 =?us-ascii?Q?W5krkZeAQmIwxwjjrJ9/LscrUyAqZJfh7QbdKQ5J51QOOmof7aFfymoUDyVT?=
 =?us-ascii?Q?GL2+6r93VCqDlW8t/2e+BIS4kRcCxXt5nUlv42TshY/G0Aa0b6D0Oay80C5U?=
 =?us-ascii?Q?cTQnEEFzrY1bg0wrfJSPIjGZf3mep7H0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:44:41.5385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c926ec-aac8-443c-ec27-08dcb20e914c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5686

Rework the read and write code paths in the driver to support operation
in atomic contexts in master mode. This change does not apply to slave
mode because there is no way to handle interruptions in that context.

Adjust the message timeout to include some extra time. For non-atomic
contexts, 500 ms is added to the timeout. For atomic contexts,
2000 ms is added because transfers happen in polled mode, requiring
more time to account for the polling overhead.

Similar changes have been implemented in other drivers, including:
commit 3a5ee18d2a32 ("i2c: imx: implement master_xfer_atomic callback")
commit 445094c8a9fb ("i2c: exynos5: add support for atomic transfers")
commit ede2299f7101 ("i2c: tegra: Support atomic transfers")
commit fe402bd09049 ("i2c: meson: implement the master_xfer_atomic
callback")

Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
---
 drivers/i2c/busses/i2c-cadence.c | 202 ++++++++++++++++++++++++++++---
 1 file changed, 188 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index e689448d229f..8b8433faf959 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -129,6 +129,7 @@
 
 #define CDNS_I2C_BROKEN_HOLD_BIT	BIT(0)
 #define CDNS_I2C_POLL_US	100000
+#define CDNS_I2C_POLL_US_ATOMIC	10
 #define CDNS_I2C_TIMEOUT_US	500000
 
 #define cdns_i2c_readreg(offset)       readl_relaxed(id->membase + offset)
@@ -189,6 +190,8 @@ enum cdns_i2c_slave_state {
  * @slave_state:	I2C Slave state(idle/read/write).
  * @fifo_depth:		The depth of the transfer FIFO
  * @transfer_size:	The maximum number of bytes in one transfer
+ * @atomic:		Mode of transfer
+ * @err_status_atomic:	Error status in atomic mode
  */
 struct cdns_i2c {
 	struct device		*dev;
@@ -219,6 +222,8 @@ struct cdns_i2c {
 #endif
 	u32 fifo_depth;
 	unsigned int transfer_size;
+	bool atomic;
+	int err_status_atomic;
 };
 
 struct cdns_platform_data {
@@ -256,7 +261,7 @@ static void cdns_i2c_init(struct cdns_i2c *id)
  *
  * Return: 0 always
  */
-static int __maybe_unused cdns_i2c_runtime_suspend(struct device *dev)
+static int cdns_i2c_runtime_suspend(struct device *dev)
 {
 	struct cdns_i2c *xi2c = dev_get_drvdata(dev);
 
@@ -273,7 +278,7 @@ static int __maybe_unused cdns_i2c_runtime_suspend(struct device *dev)
  *
  * Return: 0 on success and error value on error
  */
-static int __maybe_unused cdns_i2c_runtime_resume(struct device *dev)
+static int cdns_i2c_runtime_resume(struct device *dev)
 {
 	struct cdns_i2c *xi2c = dev_get_drvdata(dev);
 	int ret;
@@ -621,6 +626,90 @@ static irqreturn_t cdns_i2c_isr(int irq, void *ptr)
 	return cdns_i2c_master_isr(ptr);
 }
 
+static bool cdns_i2c_error_check(struct cdns_i2c *id)
+{
+	unsigned int isr_status;
+
+	id->err_status = 0;
+
+	isr_status = cdns_i2c_readreg(CDNS_I2C_ISR_OFFSET);
+	cdns_i2c_writereg(isr_status & CDNS_I2C_IXR_ERR_INTR_MASK, CDNS_I2C_ISR_OFFSET);
+
+	id->err_status = isr_status & CDNS_I2C_IXR_ERR_INTR_MASK;
+	if (id->err_status)
+		return true;
+
+	return false;
+}
+
+static void cdns_i2c_mrecv_atomic(struct cdns_i2c *id)
+{
+	bool updatetx;
+
+	while (id->recv_count > 0) {
+		/*
+		 * Check if transfer size register needs to be updated again for a
+		 * large data receive operation.
+		 */
+		updatetx = id->recv_count > id->curr_recv_count;
+
+		while (id->curr_recv_count > 0) {
+			if (cdns_i2c_readreg(CDNS_I2C_SR_OFFSET) & CDNS_I2C_SR_RXDV) {
+				*id->p_recv_buf++ = cdns_i2c_readreg(CDNS_I2C_DATA_OFFSET);
+				id->recv_count--;
+				id->curr_recv_count--;
+
+				/*
+				 * Clear hold bit that was set for FIFO control
+				 * if RX data left is less than or equal to
+				 * FIFO DEPTH unless repeated start is selected
+				 */
+				if (id->recv_count <= id->fifo_depth && !id->bus_hold_flag)
+					cdns_i2c_clear_bus_hold(id);
+			}
+			if (cdns_i2c_error_check(id))
+				return;
+			if (cdns_is_holdquirk(id, updatetx))
+				break;
+		}
+
+		/*
+		 * The controller sends NACK to the slave when transfer size
+		 * register reaches zero without considering the HOLD bit.
+		 * This workaround is implemented for large data transfers to
+		 * maintain transfer size non-zero while performing a large
+		 * receive operation.
+		 */
+		if (cdns_is_holdquirk(id, updatetx)) {
+			/* wait while fifo is full */
+			while (cdns_i2c_readreg(CDNS_I2C_XFER_SIZE_OFFSET) !=
+			       (id->curr_recv_count - id->fifo_depth))
+				;
+
+			/*
+			 * Check number of bytes to be received against maximum
+			 * transfer size and update register accordingly.
+			 */
+			if (((int)(id->recv_count) - id->fifo_depth) >
+			    id->transfer_size) {
+				cdns_i2c_writereg(id->transfer_size,
+						  CDNS_I2C_XFER_SIZE_OFFSET);
+				id->curr_recv_count = id->transfer_size +
+						      id->fifo_depth;
+			} else {
+				cdns_i2c_writereg(id->recv_count -
+						  id->fifo_depth,
+						  CDNS_I2C_XFER_SIZE_OFFSET);
+				id->curr_recv_count = id->recv_count;
+			}
+		}
+	}
+
+	/* Clear hold (if not repeated start) */
+	if (!id->recv_count && !id->bus_hold_flag)
+		cdns_i2c_clear_bus_hold(id);
+}
+
 /**
  * cdns_i2c_mrecv - Prepare and start a master receive operation
  * @id:		pointer to the i2c device structure
@@ -715,7 +804,34 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
 		cdns_i2c_writereg(addr, CDNS_I2C_ADDR_OFFSET);
 	}
 
-	cdns_i2c_writereg(CDNS_I2C_ENABLED_INTR_MASK, CDNS_I2C_IER_OFFSET);
+	if (!id->atomic)
+		cdns_i2c_writereg(CDNS_I2C_ENABLED_INTR_MASK, CDNS_I2C_IER_OFFSET);
+	else
+		cdns_i2c_mrecv_atomic(id);
+}
+
+static void cdns_i2c_msend_rem_atomic(struct cdns_i2c *id)
+{
+	unsigned int avail_bytes;
+	unsigned int bytes_to_send;
+
+	while (id->send_count) {
+		avail_bytes = id->fifo_depth - cdns_i2c_readreg(CDNS_I2C_XFER_SIZE_OFFSET);
+		if (id->send_count > avail_bytes)
+			bytes_to_send = avail_bytes;
+		else
+			bytes_to_send = id->send_count;
+
+		while (bytes_to_send--) {
+			cdns_i2c_writereg((*id->p_send_buf++), CDNS_I2C_DATA_OFFSET);
+			id->send_count--;
+		}
+		if (cdns_i2c_error_check(id))
+			return;
+	}
+
+	if (!id->send_count && !id->bus_hold_flag)
+		cdns_i2c_clear_bus_hold(id);
 }
 
 /**
@@ -778,7 +894,12 @@ static void cdns_i2c_msend(struct cdns_i2c *id)
 	cdns_i2c_writereg(id->p_msg->addr & CDNS_I2C_ADDR_MASK,
 						CDNS_I2C_ADDR_OFFSET);
 
-	cdns_i2c_writereg(CDNS_I2C_ENABLED_INTR_MASK, CDNS_I2C_IER_OFFSET);
+	if (!id->atomic) {
+		cdns_i2c_writereg(CDNS_I2C_ENABLED_INTR_MASK, CDNS_I2C_IER_OFFSET);
+	} else {
+		if (id->send_count > 0)
+			cdns_i2c_msend_rem_atomic(id);
+	}
 }
 
 /**
@@ -818,7 +939,8 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
 
 	id->p_msg = msg;
 	id->err_status = 0;
-	reinit_completion(&id->xfer_done);
+	if (!id->atomic)
+		reinit_completion(&id->xfer_done);
 
 	/* Check for the TEN Bit mode on each msg */
 	reg = cdns_i2c_readreg(CDNS_I2C_CR_OFFSET);
@@ -841,13 +963,24 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
 	/* Minimal time to execute this message */
 	msg_timeout = msecs_to_jiffies((1000 * msg->len * BITS_PER_BYTE) / id->i2c_clk);
 	/* Plus some wiggle room */
-	msg_timeout += msecs_to_jiffies(500);
+	if (!id->atomic)
+		msg_timeout += msecs_to_jiffies(500);
+	else
+		msg_timeout += msecs_to_jiffies(2000);
 
 	if (msg_timeout < adap->timeout)
 		msg_timeout = adap->timeout;
 
-	/* Wait for the signal of completion */
-	time_left = wait_for_completion_timeout(&id->xfer_done, msg_timeout);
+	if (!id->atomic) {
+		/* Wait for the signal of completion */
+		time_left = wait_for_completion_timeout(&id->xfer_done, msg_timeout);
+	} else {
+		/* 0 is success, -ETIMEDOUT is error */
+		time_left = !readl_poll_timeout_atomic(id->membase + CDNS_I2C_ISR_OFFSET,
+						       reg, (reg & CDNS_I2C_IXR_COMP),
+						       CDNS_I2C_POLL_US_ATOMIC, msg_timeout);
+	}
+
 	if (time_left == 0) {
 		cdns_i2c_master_reset(adap);
 		return -ETIMEDOUT;
@@ -876,11 +1009,16 @@ static int cdns_i2c_master_common_xfer(struct i2c_adapter *adap,
 	bool hold_quirk;
 
 	/* Check if the bus is free */
-
-	ret = readl_relaxed_poll_timeout(id->membase + CDNS_I2C_SR_OFFSET,
-					 reg,
-					 !(reg & CDNS_I2C_SR_BA),
-					 CDNS_I2C_POLL_US, CDNS_I2C_TIMEOUT_US);
+	if (!id->atomic)
+		ret = readl_relaxed_poll_timeout(id->membase + CDNS_I2C_SR_OFFSET,
+						 reg,
+						 !(reg & CDNS_I2C_SR_BA),
+						 CDNS_I2C_POLL_US, CDNS_I2C_TIMEOUT_US);
+	else
+		ret = readl_poll_timeout_atomic(id->membase + CDNS_I2C_SR_OFFSET,
+						reg,
+						!(reg & CDNS_I2C_SR_BA),
+						CDNS_I2C_POLL_US_ATOMIC, CDNS_I2C_TIMEOUT_US);
 	if (ret) {
 		ret = -EAGAIN;
 		if (id->adap.bus_recovery_info)
@@ -926,7 +1064,7 @@ static int cdns_i2c_master_common_xfer(struct i2c_adapter *adap,
 			return ret;
 
 		/* Report the other error interrupts to application */
-		if (id->err_status) {
+		if (id->err_status || id->err_status_atomic) {
 			cdns_i2c_master_reset(adap);
 
 			if (id->err_status & CDNS_I2C_IXR_NACK)
@@ -992,6 +1130,41 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	return ret;
 }
 
+/**
+ * cdns_i2c_master_xfer_atomic - The i2c transfer function in atomic mode
+ * @adap:	pointer to the i2c adapter driver instance
+ * @msgs:	pointer to the i2c message structure
+ * @num:	the number of messages to transfer
+ *
+ * Return: number of msgs processed on success, negative error otherwise
+ */
+static int cdns_i2c_master_xfer_atomic(struct i2c_adapter *adap, struct i2c_msg *msgs,
+				       int num)
+{
+	int ret;
+	struct cdns_i2c *id = adap->algo_data;
+
+	ret = cdns_i2c_runtime_resume(id->dev);
+	if (ret)
+		return ret;
+
+	if (id->quirks & CDNS_I2C_BROKEN_HOLD_BIT) {
+		dev_warn(id->adap.dev.parent,
+			 "Atomic xfer not supported for version 1.0\n");
+		return 0;
+	}
+
+	id->atomic = true;
+	ret = cdns_i2c_master_common_xfer(adap, msgs, num);
+	if (!ret)
+		ret = num;
+
+	id->atomic = false;
+	cdns_i2c_runtime_suspend(id->dev);
+
+	return ret;
+}
+
 /**
  * cdns_i2c_func - Returns the supported features of the I2C driver
  * @adap:	pointer to the i2c adapter structure
@@ -1056,6 +1229,7 @@ static int cdns_unreg_slave(struct i2c_client *slave)
 
 static const struct i2c_algorithm cdns_i2c_algo = {
 	.master_xfer	= cdns_i2c_master_xfer,
+	.master_xfer_atomic = cdns_i2c_master_xfer_atomic,
 	.functionality	= cdns_i2c_func,
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	.reg_slave	= cdns_reg_slave,
-- 
2.25.1


