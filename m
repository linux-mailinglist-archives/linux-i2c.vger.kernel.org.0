Return-Path: <linux-i2c+bounces-6879-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9527097CD66
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 20:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 165941F23DBD
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 18:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BDB10A1C;
	Thu, 19 Sep 2024 18:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vBdpz8TL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9822BCF7
	for <linux-i2c@vger.kernel.org>; Thu, 19 Sep 2024 18:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726768809; cv=fail; b=u6JXur34aJUYszNeR+crsSXSolduxcCl8r6UP7VdHo2MOo/ztjGrV2btQrcWvhyEcs7qkYeghUGZOyzEre2I863Zb0Ea8IwGcSLm61eTtOSXking19Ir7f0HtgANuVc2FDtKlWHiKRVFufPHOI1Hh9xkHeL9EGL5tE6RDSUr55w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726768809; c=relaxed/simple;
	bh=auVPAopvvDql1rMJrsAqaJHTDnD86hBC+rN8qn0TVTE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t4RYUnkjVmCU/rUdKcSHqKe5ILRAqPzzeY6wULhIe8a8uBgAg0SMU0d6Ph7dtmnPjNfiVCBWzR3huYFSCtxZMQto696cF4sqgACp1BRGSRJVGIs+3MeAz/ndv/ioJCY2SrajAoKAWdzaKR6OscQOUtlW+/xeOBEJXpgyWF3V5aI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vBdpz8TL; arc=fail smtp.client-ip=40.107.236.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xfyAbCV8nf+XzHglWWepGAxZ6PRkKF+800Yc8VYikx7Mx4ipZJoIjzF1J4KrMBXkRrDn9oWpcDhnOH4MXmZyoldw/OfElztN2BwqDbTQ5syPHQ/3GwEugkB12qiJD4BNfS++9weabzBPQaLDDR4N9YTI3PKghyJr15/iYobRriC01YOLrfuyWcfQ7qqsA/ufVHkiam/BVKGrp6SvEObvNlGZXrpWkJnUjUFnz2gN9hvxWyiQUhK6YuiDaUIgGyYNYe3TLqgzm4Aip37OZTrO8cOP0F6R9JIwqWsqqTRCYDgtJXtXSEWEWHlOfl61KcsCfRh1/iBOlxZA3lrJOgUkEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFLfzLcY+Whzd/aeSlMy5V0tt7EGy0Tf38XDAYZAsjw=;
 b=K1Cjiot1RjdlZzuTkMufgHXShgtIx7vg48D/tI+MQM+KzFSA0XFTxkMXF8CWAU0/rE/JJT8BIp0bjGOxlX/0dTsVsLo8y+exfE6JyzTQuy4FLl9t2YBtT7WPLoB7tMEI8HTpFLGQgdAP1KGLiyV7Nc04yajCFQUD4sg6dARG1FByJcHWflNRbhpJ0/4kRhhb2jwYC8yWLYDCdeofjH91XmxUZM33tPXkFJqDsMAXDLfOsRL6K2o96ZqNOY3Igj078n/Nj67iWTegpDHJ13FruN3uTPUzv9L5R+2T1zNEQhqeNJlXbrRI0a16t8TJk9yy+3rVcsgJd84VPFeG1cAJaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFLfzLcY+Whzd/aeSlMy5V0tt7EGy0Tf38XDAYZAsjw=;
 b=vBdpz8TLoH6mOnMMxDxaDIxfx3VHJgBJhX902TAj2qDJF8+stzyDO+ITbP28zySaNDS6BZq6ziu1WipGMq9bpOg2yGiRvvDnfcb9x4o5m7Ep2BmEknZqecXycY3o8bdSymP7NWe12PfrmeCysM3usJ4WN+ReukA6e0H73EI0Fik=
Received: from SJ0PR05CA0037.namprd05.prod.outlook.com (2603:10b6:a03:33f::12)
 by DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 19 Sep
 2024 18:00:02 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::12) by SJ0PR05CA0037.outlook.office365.com
 (2603:10b6:a03:33f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.11 via Frontend
 Transport; Thu, 19 Sep 2024 18:00:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 19 Sep 2024 18:00:01 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 12:59:58 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 6/8] i2c: amd-asf: Add routine to handle the ASF slave process
Date: Thu, 19 Sep 2024 23:29:11 +0530
Message-ID: <20240919175913.1895670-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240919175913.1895670-1-Shyam-sundar.S-k@amd.com>
References: <20240919175913.1895670-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|DS7PR12MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 188a8435-bfd5-409d-4e86-08dcd8d4e25f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ppj/dAS0HKrx4fYnZLdR7n8/JmRaDCmVWxXzCVWg3engihf6WPXDeM78IHR/?=
 =?us-ascii?Q?DiXZj3dXc5NLsYQWhdxCIPH3L3cWRg+QBzHyi52AZdgk1+WDT5SRuq9z3t59?=
 =?us-ascii?Q?0J7IwcOrl25O6/qL7NEAfWcPE7AEjCEgS/3E8DDEEveiQPgB6u15ySFN1bL9?=
 =?us-ascii?Q?epXNoQl8KrjaHq5zaOuYCEQns8O5E3UA3z3fMNv00QW87t4gwVM9LsR2ml5s?=
 =?us-ascii?Q?75CK1nIj0Pm1oeArvm15toqSHrdN6UFHZix9J376DR9b0rm+Ev//J7TdFoxZ?=
 =?us-ascii?Q?s08QvjCvPx534PMD8KIV3RRg7sJuNBrbjMB92mFvQA0pLRUhDts6d1g1oIRr?=
 =?us-ascii?Q?RMTP9G5D+5pXm7Qb5wbYmVrJVZAo82NraY2m7kHBpSvZd7MGrNNAcULDvLQJ?=
 =?us-ascii?Q?2YVVT6Kye2B8m8M6Xw4UG/UoKuua+N2M92YFmsPAX/V3WSpLokZJB0Q0u/pN?=
 =?us-ascii?Q?CP42m3VS9+oGA8n2DkfyE9Pc71A1ediKrDJ/4kUHUObpRSRd31O9kSAxgr5v?=
 =?us-ascii?Q?Ra844qi0gwe7nsg9Csu5Esrubl39Ac8ZoMmCHKn8BVsx5fS6S6qYJ2KIit7W?=
 =?us-ascii?Q?0aWE4lj5V5UR3sbEJnOZJ2XIJ6YlFcO+HWsgtIusFcFodTgN+OZXfe4a1iVk?=
 =?us-ascii?Q?i9xfPMO55pq0fzBD+8HO03RdYv7jRWEqvs8+mQUdOEd4Ga88s+NTx4/IJQ7X?=
 =?us-ascii?Q?u/3XXuCGMTBWgtgHYRlIreZFjWlJ2xm3x5E1StpqcP8eQKKrnLM3HMDItRF+?=
 =?us-ascii?Q?Oj8Ui8mLa6P6FjZMJIonQLiUTK/U6vIbTELwQCrtHtbTh739QPkfYBlmDdsR?=
 =?us-ascii?Q?/3frLv0OlMDUWic4eGha5o/WLap1FjT6henE0PnzpP5KVSc237ZOxGmnfFs6?=
 =?us-ascii?Q?agOHfbpSmilnFrMVb062KpAOgMTcQhK7sclsAMJrp5R8uxDmIhamAtiTrP7o?=
 =?us-ascii?Q?IZdVBBEAd5/t/plg2qN3764nQav45Y0LzF+ryuFL62ckG6pYPBL2uIT4p/d2?=
 =?us-ascii?Q?SDpMQWR8AufagOUcis1PxmevRafh1s/gGXn9T79U0GODhweO9SZCNlAXZws8?=
 =?us-ascii?Q?uXpE2apxM3PFF3/zaY3CjJiHYFCZyc0gL2j9sp/xdfMmygXyBJ+A40cifw6G?=
 =?us-ascii?Q?MKDJ/Ibp6edah8ZfKSZJkpK3SiJgLlW+uwCUJ7q49R4uakZfWrd4UEKwj+Wy?=
 =?us-ascii?Q?LE0PbiJPO4zzjLRgAXCBCqx42/3jfqVEE/4NbKTJEs8t3Qutr1T6t1WEBRiV?=
 =?us-ascii?Q?RsLffEhpVWIhlilKO8Hms2c0SjvX+wTbtMZBvyvkBfi94KlKhPQXPs9dFpcV?=
 =?us-ascii?Q?RnKxxHufNiHF756L6uRJilnHxg7bSa+4exkCBcDxwpAMhto0YYmN9qmK4JF9?=
 =?us-ascii?Q?A2/9mxyzxjW5N0Jb3s1NngBYHJOOQVpnIvsqxTou6zNc16UZ0RJr8wke5YMK?=
 =?us-ascii?Q?cAqlgZ0UrpJtPZR4hc3FwMl2yr1mGduE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 18:00:01.9987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 188a8435-bfd5-409d-4e86-08dcd8d4e25f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6095

Add support for handling ASF slave process events as described in the AMD
ASF databook. This involves implementing the correct programming sequence
to manage each ASF packet appropriately.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-amd-asf-plat.c | 102 ++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
index 45e54122fa28..fe6cffa2fba4 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -11,6 +11,7 @@
 
 #include <linux/bitops.h>
 #include <linux/device.h>
+#include <linux/devm-helpers.h>
 #include <linux/errno.h>
 #include <linux/gfp_types.h>
 #include <linux/i2c.h>
@@ -33,21 +34,90 @@
 #define ASF_CLK_EN	17
 
 /* ASF address offsets */
+#define ASFINDEX	(0x07 + piix4_smba)
 #define ASFLISADDR	(0x09 + piix4_smba)
 #define ASFSTA		(0x0A + piix4_smba)
 #define ASFSLVSTA	(0x0D + piix4_smba)
+#define ASFDATARWPTR	(0x11 + piix4_smba)
+#define ASFSETDATARDPTR	(0x12 + piix4_smba)
 #define ASFDATABNKSEL	(0x13 + piix4_smba)
 #define ASFSLVEN	(0x15 + piix4_smba)
 
 #define ASF_BLOCK_MAX_BYTES	72
+#define ASF_ERROR_STATUS	GENMASK(3, 1)
 
 struct amd_asf_dev {
 	struct i2c_adapter adap;
 	struct i2c_client *target;
+	struct delayed_work work_buf;
 	struct sb800_mmio_cfg mmio_cfg;
 	struct resource *port_addr;
 };
 
+static void amd_asf_process_target(struct work_struct *work)
+{
+	struct amd_asf_dev *dev = container_of(work, struct amd_asf_dev, work_buf.work);
+	unsigned short piix4_smba = dev->port_addr->start;
+	u8 data[ASF_BLOCK_MAX_BYTES];
+	u8 bank, reg, cmd;
+	u8 len, idx, val;
+
+	/* Read target status register */
+	reg = inb_p(ASFSLVSTA);
+
+	/* Check if no error bits are set in target status register */
+	if (reg & ASF_ERROR_STATUS) {
+		/* Set bank as full */
+		cmd = 0;
+		reg = reg | GENMASK(3, 2);
+		outb_p(reg, ASFDATABNKSEL);
+	} else {
+		/* Read data bank */
+		reg = inb_p(ASFDATABNKSEL);
+		bank = (reg & BIT(3)) ? 1 : 0;
+
+		/* Set read data bank */
+		if (bank) {
+			reg = reg | BIT(4);
+			reg = reg & ~BIT(3);
+		} else {
+			reg = reg & ~BIT(4);
+			reg = reg & ~BIT(2);
+		}
+
+		/* Read command register */
+		outb_p(reg, ASFDATABNKSEL);
+		cmd = inb_p(ASFINDEX);
+		len = inb_p(ASFDATARWPTR);
+		for (idx = 0; idx < len; idx++)
+			data[idx] = inb_p(ASFINDEX);
+
+		/* Clear data bank status */
+		if (bank) {
+			reg = reg | BIT(3);
+			outb_p(reg, ASFDATABNKSEL);
+		} else {
+			reg = reg | BIT(2);
+			outb_p(reg, ASFDATABNKSEL);
+		}
+	}
+
+	outb_p(0, ASFSETDATARDPTR);
+	if (cmd & BIT(0))
+		return;
+
+	/*
+	 * Although i2c_slave_event() returns an appropriate error code, we
+	 * don't check it here because we're operating in the workqueue context.
+	 */
+	i2c_slave_event(dev->target, I2C_SLAVE_WRITE_REQUESTED, &val);
+	for (idx = 0; idx < len; idx++) {
+		val = data[idx];
+		i2c_slave_event(dev->target, I2C_SLAVE_WRITE_RECEIVED, &val);
+	}
+	i2c_slave_event(dev->target, I2C_SLAVE_STOP, &val);
+}
+
 static void amd_asf_update_ioport_target(unsigned short piix4_smba, u8 bit,
 					 unsigned long offset, bool set)
 {
@@ -207,9 +277,28 @@ static const struct i2c_algorithm amd_asf_smbus_algorithm = {
 	.functionality = amd_asf_func,
 };
 
+static irqreturn_t amd_asf_irq_handler(int irq, void *ptr)
+{
+	struct amd_asf_dev *dev = ptr;
+	unsigned short piix4_smba = dev->port_addr->start;
+	u8 target_int = inb_p(ASFSTA);
+
+	if (target_int & BIT(6)) {
+		/* Target Interrupt */
+		outb_p(target_int | BIT(6), ASFSTA);
+		schedule_delayed_work(&dev->work_buf, HZ);
+	} else {
+		/* Controller Interrupt */
+		amd_asf_update_ioport_target(piix4_smba, ASF_SLV_INTR, SMBHSTSTS, true);
+	}
+
+	return IRQ_HANDLED;
+}
+
 static int amd_asf_probe(struct platform_device *pdev)
 {
 	struct amd_asf_dev *asf_dev;
+	int ret, irq;
 
 	asf_dev = devm_kzalloc(&pdev->dev, sizeof(*asf_dev), GFP_KERNEL);
 	if (!asf_dev)
@@ -220,6 +309,19 @@ static int amd_asf_probe(struct platform_device *pdev)
 	if (!asf_dev->port_addr)
 		return dev_err_probe(&pdev->dev, -EINVAL, "missing IO resources\n");
 
+	ret = devm_delayed_work_autocancel(&pdev->dev, &asf_dev->work_buf, amd_asf_process_target);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to create work queue\n");
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(&pdev->dev, irq, "missing IRQ resources\n");
+
+	ret = devm_request_irq(&pdev->dev, irq, amd_asf_irq_handler, IRQF_SHARED,
+			       "amd_asf", asf_dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Unable to request irq: %d for use\n", irq);
+
 	asf_dev->adap.owner = THIS_MODULE;
 	asf_dev->adap.algo = &amd_asf_smbus_algorithm;
 	asf_dev->adap.dev.parent = &pdev->dev;
-- 
2.25.1


