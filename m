Return-Path: <linux-i2c+bounces-6542-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC84974FD3
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 12:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DD7C1F217DB
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 10:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7638E186E50;
	Wed, 11 Sep 2024 10:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="R+Si6XT5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2077.outbound.protection.outlook.com [40.107.102.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546281802DD;
	Wed, 11 Sep 2024 10:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726051163; cv=fail; b=cqYGqlOQBgbSENtNrehYONoQqVvQM3odt+27ja7mDncnOg1hhH1BbunfPqwxHt1t4QKhK+sX7C4zqP1S6WUIpTl7V9X+ibfIV7A9rOibSWUzD0bHLQELrXXDJXIsGmoNqhptaKhWBQ2lEv5ZM7uCJGAhqnom8K/mLkskoYdBEC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726051163; c=relaxed/simple;
	bh=+wkzh+NtJWiOS0/VMQLr5fNvPZYwb9AiyIiHahxhMGg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ql6s2RIefxoga0Uh+I7YWrht9TaS+qBAKO4Z+6ZwYBYzrJrJh7nPOsQ9Eoai9azyJdOwJ91OACi4O9LTd+pAAaIqJoEr1suOjypPfa8RHquhqtAkaz48zQGtai8M1mgy9EHBdT7stH0FjMDGW7voKxhFFNnc9ATBM/xuhPQbDLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=R+Si6XT5; arc=fail smtp.client-ip=40.107.102.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csApQnEHh9NYypbkSB8lL3YNCas/WxW2frvotqzCYJ5/hJFNqp0Pg1zhcU/27pUK42EPIZ9pPqg9XAqtbm8SD3/YArl7z+K/9fGGkDmRsFHJVtt5ZbKnGZIqEKjGMSgegFixpwJ5mM4j8NaCpPYaSLeN+dEwX5OEB+eDGUmocIqBtV/MBS2fgOqjrkQ/C/kCBduSsJaOiREqhResos0RiVx05TkN0Z5EkoPhHxtqjkTCubgVqVtqp/wSVHSEKUUK0Thez67Y3RnVaU46dBgjWIRYoPzYgyBY8yfr8NRXxBezbZCQRdiXAYnbWvUidfw6FIZhcbrP/iIftUL+V6qWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lieyS3zhN+2TrfPn0LCyk9zmNfPncEGKS4E6VL1Lcw=;
 b=S2ta88dDUHn1XiizEZgTzunS3F4mPeF4t+MBb+VTyGImtB8z8hjQI1aeg5ibpKnda79JQ2anuZInA12qWlaYp2+NfDYR9QJQ3Ukc6ES2/TSTnRM8Q0tJAVimcQBypytuYmm20lLR2cqQbQF0FRvdTMn6l3ZpwmgzptZuD/0+sHVCeBqc8crdin9jzSfLa1v9XfYSqVaiH2qBNr4MXgxE8q9UIpeAyZuutB2LKgfFSbea5BzI0CrITuNwTDRlwG7Z5eMNYLs2i05PGfXH+8t6ITQvzqJlGVBOpRwKndNSbAbybCBIU9FR6X1rPSG3ER9XsL1o1+zHYDhSM1gxWaYGCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lieyS3zhN+2TrfPn0LCyk9zmNfPncEGKS4E6VL1Lcw=;
 b=R+Si6XT5ulCIMf7yvou8qos/74IojWPHEvPAsFjktn7AsXGD9hbfOUbsLF3zfzuamVieYCmSpkh8dy6XDnrZxSQw6jD3DQP6eC8cVnrw98rkvWAClKnXrrMqJZKwaS7pfdp8eEnneg0GGAOYgeATIix4/903G3HkSAv5kVXyXUQ=
Received: from BYAPR07CA0007.namprd07.prod.outlook.com (2603:10b6:a02:bc::20)
 by SJ1PR12MB6361.namprd12.prod.outlook.com (2603:10b6:a03:455::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Wed, 11 Sep
 2024 10:39:16 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a02:bc:cafe::f2) by BYAPR07CA0007.outlook.office365.com
 (2603:10b6:a02:bc::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32 via Frontend
 Transport; Wed, 11 Sep 2024 10:39:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 10:39:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 05:39:14 -0500
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Sep 2024 05:39:11 -0500
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manion05gk@gmail.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>
Subject: [PATCH V2 3/3] i2c: cadence: Add atomic transfer support for controller version 1.4
Date: Wed, 11 Sep 2024 16:08:52 +0530
Message-ID: <20240911103852.162234-4-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240911103852.162234-1-manikanta.guntupalli@amd.com>
References: <20240911103852.162234-1-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: manikanta.guntupalli@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|SJ1PR12MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: 501ef58d-c553-44a5-94e1-08dcd24dfbff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z5V/OAlk/nAFtcAgeRriST/eY5hhSEWQRA6vNn+kP7Jk2UqwqHImtB0JXrkr?=
 =?us-ascii?Q?dONhzabTcoE5s7AzxmuMs4xomuoyCsjsDKIjXqtvXgVY9pClrAgcx+5vXWra?=
 =?us-ascii?Q?S4kZ+0RsXdAFMSuzoGxBfPBp+L4y1FzQ5GR+u6zedzZCNhW0I/h9db1n6dKN?=
 =?us-ascii?Q?07DDVZILo301FQl3TOB3RegMSHPKlJQGhBGjlz1JCfbzeo24iUsDkU3Ax6tt?=
 =?us-ascii?Q?GBbwUhTrVETYlNP6pBH4SYwZHlHVStZWxeYdCIprQqcJULiOeTN3GLsltp/M?=
 =?us-ascii?Q?iXAsLToLek4OaH+6bEeZlSI4I549Z+dy3lY/Ws/+iS0qq4lhre0BIGmJx3iN?=
 =?us-ascii?Q?Sw8a9ZAfF7VcBTRRJkldiWxRP6M8zfiuUvknHVvGYYRnijm/9mNKsZYv/01O?=
 =?us-ascii?Q?DGlKqAKGmlBl9ykY7NljOE8Buy7+LpKZdQsjtuDvCL7p/YDI80N0OnU7MP4z?=
 =?us-ascii?Q?hUBwcALr893Dz+beYG/9agBWqx4Bz5XniAU8vzx/s+Vifx1CLgAyHMmZEcHt?=
 =?us-ascii?Q?k41x4/nKfazapuedB4H5Zvt9lFeYmPFDJ26SpDh087+65I371zQX1Qja2H3d?=
 =?us-ascii?Q?Jko1JnIBf00sUhhgLO6JOwuotiLWwt3IBDdakcchQ7dyTChfnLGZBbLITvGB?=
 =?us-ascii?Q?JKnRaA+fnRmBNyyEPmTl5dD3Aji+h6OJE+A061brv3zmvYlEEkxTQZ4nPFuU?=
 =?us-ascii?Q?np9JIsQgcwGufoONz5mcpOa1WwqO/4BTEAoMxGZ3NwWwv29t6pH+R5fquII8?=
 =?us-ascii?Q?iTsw9fz3mMbFMAfLSFoyDnxMVG1iKAI8GaWgwB4JZ4tqCLvp/rDfkmGt1Qh8?=
 =?us-ascii?Q?53NwvnDOH9Y5oOYMZ5pKyzElnXPdTLr0dtNBqFOpRjp9jRntUV0+YplSVZzg?=
 =?us-ascii?Q?6czKzbVDpz+HosahCZ8YsAXwfwZreMTEiIiUAbVLWnHY2PCxN+H5DopQ+XuU?=
 =?us-ascii?Q?C4tosKx71c8ONlRHm7jQsqHwpHICfUKGUsSsG9Bgrf7U/s1I/CW1KDyN3NXO?=
 =?us-ascii?Q?qh2yE1A8LxwUB5R9LWCeqwnGll6sZxBThW+gVVaKtK+yRe3r7SWJwnnx6M21?=
 =?us-ascii?Q?1zqHobS+sCtV/CIGWsr7tyJXjg8H/SGz3eFK5R6h3+fnqgyX/9Kr96QBM8T3?=
 =?us-ascii?Q?4Upzqv/hS5F/4xFHPhY6Y/D3kiLVH9P8st+4dWhP3I8jelx9L8RZNBN/U8OZ?=
 =?us-ascii?Q?NUxyDgm3GzZRyuiRVEm65g3pNk/O4NST63T9Ce4zfzu++uFXDgIVIUS8YV3H?=
 =?us-ascii?Q?dWh8p2NwDiR0eEL41gSz4TLOkOOTOQvHkHvplKcV6ze0p5qIkYMHNkgwfW6S?=
 =?us-ascii?Q?HXqQz3QSMjP1jbDsS3c2GcGQtu8zGxjUO5DnA1+i66HeLAhFSn003/ZjvX4g?=
 =?us-ascii?Q?JM4hFHiTzG5oO2AGucsIMunLjlFh9hl2/7pS9iamDRmmkVorasH/JfiCxe3j?=
 =?us-ascii?Q?fpkI0AgJ9orMDIL1yuheePUIMC5h9g7G?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 10:39:16.0351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 501ef58d-c553-44a5-94e1-08dcd24dfbff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6361

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
Changes for V2:
Simplify the return statement of cdns_i2c_error_check().
Update description.
Remove unnecessary typecast.
Update if-else to reduce a level of indentation.
Expand *id->p_recv_buf++ to have clear operation precedence.
Move variables to inside while block in cdns_i2c_mrecv_atomic()
and cdns_i2c_msend_rem_atomic().
---
 drivers/i2c/busses/i2c-cadence.c | 207 ++++++++++++++++++++++++++++---
 1 file changed, 192 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index e689448d229f..ee2f32cd54ce 100644
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
@@ -621,6 +626,89 @@ static irqreturn_t cdns_i2c_isr(int irq, void *ptr)
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
+
+	return !!id->err_status;
+}
+
+static void cdns_i2c_mrecv_atomic(struct cdns_i2c *id)
+{
+	while (id->recv_count > 0) {
+		bool updatetx;
+
+		/*
+		 * Check if transfer size register needs to be updated again for a
+		 * large data receive operation.
+		 */
+		updatetx = id->recv_count > id->curr_recv_count;
+
+		while (id->curr_recv_count > 0) {
+			if (cdns_i2c_readreg(CDNS_I2C_SR_OFFSET) & CDNS_I2C_SR_RXDV) {
+				*id->p_recv_buf = cdns_i2c_readreg(CDNS_I2C_DATA_OFFSET);
+				id->p_recv_buf++;
+				id->recv_count--;
+				id->curr_recv_count--;
+
+				/*
+				 * Clear the hold bit that was set for FIFO control,
+				 * if the remaining RX data is less than or equal to
+				 * the FIFO depth, unless a repeated start is selected.
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
+		 * The controller sends NACK to the slave/target when transfer size
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
+			if ((id->recv_count - id->fifo_depth) >
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
@@ -715,7 +803,34 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
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
+	while (id->send_count) {
+		unsigned int avail_bytes;
+		unsigned int bytes_to_send;
+
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
@@ -778,7 +893,10 @@ static void cdns_i2c_msend(struct cdns_i2c *id)
 	cdns_i2c_writereg(id->p_msg->addr & CDNS_I2C_ADDR_MASK,
 						CDNS_I2C_ADDR_OFFSET);
 
-	cdns_i2c_writereg(CDNS_I2C_ENABLED_INTR_MASK, CDNS_I2C_IER_OFFSET);
+	if (!id->atomic)
+		cdns_i2c_writereg(CDNS_I2C_ENABLED_INTR_MASK, CDNS_I2C_IER_OFFSET);
+	else if (id->send_count > 0)
+		cdns_i2c_msend_rem_atomic(id);
 }
 
 /**
@@ -818,7 +936,8 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
 
 	id->p_msg = msg;
 	id->err_status = 0;
-	reinit_completion(&id->xfer_done);
+	if (!id->atomic)
+		reinit_completion(&id->xfer_done);
 
 	/* Check for the TEN Bit mode on each msg */
 	reg = cdns_i2c_readreg(CDNS_I2C_CR_OFFSET);
@@ -840,14 +959,31 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
 
 	/* Minimal time to execute this message */
 	msg_timeout = msecs_to_jiffies((1000 * msg->len * BITS_PER_BYTE) / id->i2c_clk);
-	/* Plus some wiggle room */
-	msg_timeout += msecs_to_jiffies(500);
+
+	/*
+	 * Plus some wiggle room.
+	 * For non-atomic contexts, 500 ms is added to the timeout.
+	 * For atomic contexts, 2000 ms is added because transfers happen in polled
+	 * mode, requiring more time to account for the polling overhead.
+	 */
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
@@ -876,11 +1012,16 @@ static int cdns_i2c_master_common_xfer(struct i2c_adapter *adap,
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
@@ -926,7 +1067,7 @@ static int cdns_i2c_master_common_xfer(struct i2c_adapter *adap,
 			return ret;
 
 		/* Report the other error interrupts to application */
-		if (id->err_status) {
+		if (id->err_status || id->err_status_atomic) {
 			cdns_i2c_master_reset(adap);
 
 			if (id->err_status & CDNS_I2C_IXR_NACK)
@@ -992,6 +1133,41 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
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
@@ -1056,6 +1232,7 @@ static int cdns_unreg_slave(struct i2c_client *slave)
 
 static const struct i2c_algorithm cdns_i2c_algo = {
 	.master_xfer	= cdns_i2c_master_xfer,
+	.master_xfer_atomic = cdns_i2c_master_xfer_atomic,
 	.functionality	= cdns_i2c_func,
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	.reg_slave	= cdns_reg_slave,
-- 
2.25.1


