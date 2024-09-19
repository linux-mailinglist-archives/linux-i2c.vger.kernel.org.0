Return-Path: <linux-i2c+bounces-6878-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D4397CD65
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 20:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 425E31F229E0
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 18:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D1320B35;
	Thu, 19 Sep 2024 18:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="n4m0Tbcy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67393210E7
	for <linux-i2c@vger.kernel.org>; Thu, 19 Sep 2024 18:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726768808; cv=fail; b=IoDLQyw2+VZP/BJ2JWWSUtw1RKV++Gp3IqUzf320/Y91woY1vYTDCq4TSBDaOAWwKHKm88sLh4YpDQQJIS3qM9IPzR50SUe8HV2F1+cjwUCWhT+ppcRHxFcWyi0gly66lOlD6QBeGZuMQ2kaFlzFHzdX+bPmfTLSwaKwsD6tYPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726768808; c=relaxed/simple;
	bh=77ASfQzN2d0vbvTonO+Tm0D0pnChsOmHerb6R2I8/R0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GMvSqTrKoBDdE7jt671T6glCOXQHZjAcTxuQ9FJntdvn+66GLvkz1ImFqcKwjMLn2lJ7SA/vHvwF8aXt6zFrUMRhiMoNlMqRw2AWbYf5ZRcLLPTB/KebfrjgHWb0cD1uyWRe4HGc4FMSZ8YvdVDMLXmV/2C3B4wo7xjb8xp7zF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=n4m0Tbcy; arc=fail smtp.client-ip=40.107.93.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwdgH8hsmHXEEZU12MzyPOIgRzqE6ExS8xQI5bdHAfBYEl1nYZDAtxXfs5smxUzUp+rlpeTtb9z6kncMKViuSEDIgfjG1cvIf+5a1bEyxu3n3tNmER3W7+CkB1M+3tMG70XR6oUanr5VSwY1T8CNdRuKpzbjCOOp2Om0+ZNQNFsC5pBGvsMvBl0ks/1PU50+mUTedZnTMSPW5/CWX5VBVyK9eP605pwuHQlN13L8p5jJigAer0eLk3WUS8QeZq7wEC5leZlDfjNtC+kca+Xj2vVKtXCK7io0ryfuCnKE13zAJiIGkdo/yFEdB3OZaPmF6VJmuI2Y9ZqBokPBaDIVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrU6n84sy64htMdaB7OmBn6fRDTO0edm/qVgE/XakDY=;
 b=ehUXgc5IY6bahHFoS4uGE+TDvbN+8AGrCFCpAGqkNKseRD7LI/GjfMxQon5JbV+/GJ9yaFIxkvQghlGjMBiNM4gmSh9n58NC13B7IEmb2hfOtWmfQ6DastQ1OFCUg0WvhfwXMZ4yH+q9KmTvm0tJPqBg7qsM/AnJ3ZkOqUkTt+u8pwsiDf2BR1s9gNTGbl5YDZMxImMosjhGFwgRtjFRUFgrXgz/uxjIAl67ALsgQ5mi1iXMe/q6sg42+fnoy08gZOkZRvbYvwXcPBMqLKzO7u9NDiU9dfroVXhPslaASaAjNDhTRSSvWXbJ9eKSGkJi/hNliSpMsUlLL30NWvEktA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrU6n84sy64htMdaB7OmBn6fRDTO0edm/qVgE/XakDY=;
 b=n4m0TbcynvUDRaUxWIZjyI4EY6AzXwHxcVFJvC5SxXawnYv9JoR7R1nr6AbTShSTfZJjN2mr5o1phv689IosD/IMOdws42rUy/vDxgnc6dl4BabMJXHPb+GmwLuS9O5jLCNZ7CN8hN17HqaTu8C20URiOy3XJdFRk8rYQ1/Qpak=
Received: from BY3PR04CA0018.namprd04.prod.outlook.com (2603:10b6:a03:217::23)
 by PH8PR12MB6988.namprd12.prod.outlook.com (2603:10b6:510:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Thu, 19 Sep
 2024 18:00:00 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::b2) by BY3PR04CA0018.outlook.office365.com
 (2603:10b6:a03:217::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Thu, 19 Sep 2024 17:59:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 19 Sep 2024 17:59:59 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 12:59:56 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 5/8] i2c: amd-asf: Add i2c_algorithm operations to support AMD ASF with SMBus
Date: Thu, 19 Sep 2024 23:29:10 +0530
Message-ID: <20240919175913.1895670-6-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|PH8PR12MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: bbe64615-88ca-49d4-7935-08dcd8d4e0d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UkRxr2Ib8q3GjCI9feduO1tAdugYtxnQGpLB8UgZlyju9YXPoSzb3RBeqhXB?=
 =?us-ascii?Q?m7cXRkJLUcSljHE6wICZ7nZH+td3yKMQY/RMfUbqGdLe7+YY1UG/ojuthADY?=
 =?us-ascii?Q?c0G7eqR/KPw7Hcrb53e+oKpQK3P1zlCUc5pbYMrH44U9MwUgTNlYUiBdLc5n?=
 =?us-ascii?Q?JbUDNwYoCdMKntTV5euv+1V3hNOp446YSQMfr+dzuYdm3rNm8OXzschkHAbx?=
 =?us-ascii?Q?dkENWlklm6aHQnlbR0ei/q1ESyA8S9RZ7trKjviuDsyilKifKCLTI6teMbsV?=
 =?us-ascii?Q?2amjnyVC3xz8nlzrgg/+hZ9JQyxGB7ralrz/e8mycl/tPkJEmQVOD70Hoq3w?=
 =?us-ascii?Q?MacrY0kGBCScrzULrPTehUfve8DkBU8M8hUOGlMZ7yWOflmyD9Qy0CBI01Cf?=
 =?us-ascii?Q?e4c30XRCviUebw2lwZ1Ao50rSEzhSi/IYKaVAYDhrw2+/HOLOcbwK+lk2HiL?=
 =?us-ascii?Q?khFyWa1Ft7RcWQHooNvhrn9BsCgY22GL9ImxQTTVTh8UPoh2K++3gUc0WSG5?=
 =?us-ascii?Q?VdjqXeYzThH+p4Lq31gZIy/sl8PkpDFob3m2UGp+vddHcTBhUuyUI2BI8wEz?=
 =?us-ascii?Q?6uGul4mTAV9RTcRpe/Vm7Pf1PMkszwNnGhaQDszIsXFG787GDBWqdvTaCVgG?=
 =?us-ascii?Q?IeRzIN3PIP2egA2jAghfhlg3LKch77P4xKDkbYAfa4qVcL7BXCJ/ZfCGezcP?=
 =?us-ascii?Q?wls04uctVTz6PBjcJlNEaChlNp6ChNOV3HI3XptVw1ZQfPdFSPRvnI6I9C5r?=
 =?us-ascii?Q?JgNNxDRX1vEChdK2T5SnpjFltn7087FTZOwvSGgNNi6JtH3McHmECKwzPcH0?=
 =?us-ascii?Q?vc6FG8NtPmbzXiHDp8ZIcp5gsuUVN+qliFLiKFQVd+mzgJb+sKPsU/Togalu?=
 =?us-ascii?Q?71KFRwKyacYfiW1QVWLz7RJlFITabe5cS1JdL3ubeWR0WE62hxH/Elg8BZb4?=
 =?us-ascii?Q?X1wlWGn0Tz3waH2g4HiaH8Sq2DEFudayVIIlE0N7m8c+9ocbawmGFnL4OULr?=
 =?us-ascii?Q?PxaxVAu4TWkd+WTAFhhh3CFh4UG4+KAdzztZ0UIfoOiLLQGq63ewV2DdzCCX?=
 =?us-ascii?Q?CfzEHRLJYtRuLb4ECIXd2+3UyAeyEora7JSm4LOrct4W5pV4nv1BUDox2BOv?=
 =?us-ascii?Q?JLby6wiZ6TOXAjgdb02aeOoOf7AiIzC1XMCQNk6MrvYK/UaBUk1tCa1q/60Y?=
 =?us-ascii?Q?BrUhM4ltN7Gv5mALba6KIN/ra9+FU5w74nl3QO1zEtDGXtwlfo+jJdQDfJbK?=
 =?us-ascii?Q?BFun6t4JckLm/WoScZcTfpgGLQ5fWeU1TRCPvBNXSocpAfvA84VzPpHT1OIa?=
 =?us-ascii?Q?KAgnmZxwN6ZDWnZRsXLanHAu9vMVP3NDoq458dNPtnhnH+gno63WhkXCoxFm?=
 =?us-ascii?Q?CH3JiGYazP7R7GhYm1Pr5fowe98C0OsA//Cdy/oJxmnE88zRxB0NG8D/E0db?=
 =?us-ascii?Q?n1h/8fv9hVF2HVHZRSXrbbKFDD4onuXW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 17:59:59.4308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe64615-88ca-49d4-7935-08dcd8d4e0d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6988

Implement the i2c_algorithm operations to enable support for AMD ASF
(Alert Standard Format) with SMBus. This enhancement includes:

- Adding functionality to identify and select the supported ASF functions.
- Implementing mechanisms for registering and deregistering I2C slave
  devices.
- Providing support for data transfer operations over ASF.

Additionally, include a 'select' Kconfig entry as the current patch
utilizes reg_slave and unreg_slave callbacks, which are controlled by
IS_ENABLED(CONFIG_I2C_SLAVE).

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/Kconfig            |   1 +
 drivers/i2c/busses/i2c-amd-asf-plat.c | 181 ++++++++++++++++++++++++++
 2 files changed, 182 insertions(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 03afcdbff209..9353946882db 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -98,6 +98,7 @@ config I2C_AMD_MP2
 config I2C_AMD_ASF
 	tristate "AMD ASF I2C Controller Support"
 	depends on I2C_PIIX4
+	select I2C_SLAVE
 	help
 	  This option enables support for the AMD ASF (Alert Standard Format)
 	  I2C controller. The AMD ASF controller is an SMBus controller with
diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
index 56e2d9ba6cfa..45e54122fa28 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -9,6 +9,7 @@
  *	    Sanket Goswami <Sanket.Goswami@amd.com>
  */
 
+#include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/gfp_types.h>
@@ -22,12 +23,190 @@
 
 #include "i2c-piix4.h"
 
+/* ASF register bits */
+#define ASF_SLV_LISTN	0
+#define ASF_SLV_INTR	1
+#define ASF_SLV_RST	4
+#define ASF_PEC_SP	5
+#define ASF_DATA_EN	7
+#define ASF_MSTR_EN	16
+#define ASF_CLK_EN	17
+
+/* ASF address offsets */
+#define ASFLISADDR	(0x09 + piix4_smba)
+#define ASFSTA		(0x0A + piix4_smba)
+#define ASFSLVSTA	(0x0D + piix4_smba)
+#define ASFDATABNKSEL	(0x13 + piix4_smba)
+#define ASFSLVEN	(0x15 + piix4_smba)
+
+#define ASF_BLOCK_MAX_BYTES	72
+
 struct amd_asf_dev {
 	struct i2c_adapter adap;
+	struct i2c_client *target;
 	struct sb800_mmio_cfg mmio_cfg;
 	struct resource *port_addr;
 };
 
+static void amd_asf_update_ioport_target(unsigned short piix4_smba, u8 bit,
+					 unsigned long offset, bool set)
+{
+	unsigned long reg;
+
+	reg = inb_p(offset);
+	__assign_bit(bit, &reg, set);
+	outb_p(reg, offset);
+}
+
+static void amd_asf_update_mmio_target(struct amd_asf_dev *dev, u8 bit, bool set)
+{
+	unsigned long reg;
+
+	reg = ioread32(dev->mmio_cfg.addr);
+	__assign_bit(bit, &reg, set);
+	iowrite32(reg, dev->mmio_cfg.addr);
+}
+
+static void amd_asf_setup_target(struct amd_asf_dev *dev)
+{
+	unsigned short piix4_smba = dev->port_addr->start;
+
+	/* Reset both host and target before setting up */
+	outb_p(0, SMBHSTSTS);
+	outb_p(0, ASFSLVSTA);
+	outb_p(0, ASFSTA);
+
+	/* Update target address */
+	amd_asf_update_ioport_target(piix4_smba, ASF_SLV_LISTN, ASFLISADDR, true);
+	/* Enable target and set the clock */
+	amd_asf_update_mmio_target(dev, ASF_MSTR_EN, false);
+	amd_asf_update_mmio_target(dev, ASF_CLK_EN, true);
+	/* Enable target interrupt */
+	amd_asf_update_ioport_target(piix4_smba, ASF_SLV_INTR, ASFSLVEN, true);
+	amd_asf_update_ioport_target(piix4_smba, ASF_SLV_RST, ASFSLVEN, false);
+	/* Enable PEC and PEC append */
+	amd_asf_update_ioport_target(piix4_smba, ASF_DATA_EN, SMBHSTCNT, true);
+	amd_asf_update_ioport_target(piix4_smba, ASF_PEC_SP, SMBHSTCNT, true);
+}
+
+static int amd_asf_access(struct i2c_adapter *adap, u16 addr, u8 command, u8 *data)
+{
+	struct amd_asf_dev *dev = i2c_get_adapdata(adap);
+	unsigned short piix4_smba = dev->port_addr->start;
+	u8 i, len;
+
+	outb_p((addr << 1), SMBHSTADD);
+	outb_p(command, SMBHSTCMD);
+	len = data[0];
+	if (len == 0 || len > ASF_BLOCK_MAX_BYTES)
+		return -EINVAL;
+
+	outb_p(len, SMBHSTDAT0);
+	/* Reset SMBBLKDAT */
+	inb_p(SMBHSTCNT);
+	for (i = 1; i <= len; i++)
+		outb_p(data[i], SMBBLKDAT);
+
+	outb_p(PIIX4_BLOCK_DATA, SMBHSTCNT);
+	/* Enable PEC and PEC append */
+	amd_asf_update_ioport_target(piix4_smba, ASF_DATA_EN, SMBHSTCNT, true);
+	amd_asf_update_ioport_target(piix4_smba, ASF_PEC_SP, SMBHSTCNT, true);
+
+	return piix4_transaction(adap, piix4_smba);
+}
+
+static int amd_asf_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	struct amd_asf_dev *dev = i2c_get_adapdata(adap);
+	unsigned short piix4_smba = dev->port_addr->start;
+	u8 asf_data[ASF_BLOCK_MAX_BYTES];
+	struct i2c_msg *dev_msgs = msgs;
+	u8 prev_port;
+	int ret;
+
+	if (msgs->flags & I2C_M_RD) {
+		dev_err(&adap->dev, "ASF: Read not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	/* Exclude the receive header and PEC */
+	if (msgs->len > ASF_BLOCK_MAX_BYTES - 3) {
+		dev_warn(&adap->dev, "ASF: max message length exceeded\n");
+		return -EOPNOTSUPP;
+	}
+
+	asf_data[0] = dev_msgs->len;
+	memcpy(asf_data + 1, dev_msgs[0].buf, dev_msgs->len);
+
+	ret = piix4_sb800_region_request(&adap->dev, &dev->mmio_cfg);
+	if (ret)
+		return ret;
+
+	amd_asf_update_ioport_target(piix4_smba, ASF_SLV_RST, ASFSLVEN, true);
+	amd_asf_update_ioport_target(piix4_smba, ASF_SLV_LISTN, ASFLISADDR, false);
+	/* Clear ASF target status */
+	outb_p(0, ASFSLVSTA);
+
+	/* Enable ASF SMBus controller function */
+	amd_asf_update_mmio_target(dev, ASF_MSTR_EN, true);
+	prev_port = piix4_sb800_port_sel(0, &dev->mmio_cfg);
+	ret = amd_asf_access(adap, msgs->addr, msgs[0].buf[0], asf_data);
+	piix4_sb800_port_sel(prev_port, &dev->mmio_cfg);
+	amd_asf_setup_target(dev);
+	piix4_sb800_region_release(&adap->dev, &dev->mmio_cfg);
+	return ret;
+}
+
+static int amd_asf_reg_target(struct i2c_client *target)
+{
+	struct amd_asf_dev *dev = i2c_get_adapdata(target->adapter);
+	unsigned short piix4_smba = dev->port_addr->start;
+	int ret;
+	u8 reg;
+
+	if (dev->target)
+		return -EBUSY;
+
+	ret = piix4_sb800_region_request(&target->dev, &dev->mmio_cfg);
+	if (ret)
+		return ret;
+
+	reg = (target->addr << 1) | I2C_M_RD;
+	outb_p(reg, ASFLISADDR);
+
+	amd_asf_setup_target(dev);
+	dev->target = target;
+	amd_asf_update_ioport_target(piix4_smba, ASF_DATA_EN, ASFDATABNKSEL, false);
+	piix4_sb800_region_release(&target->dev, &dev->mmio_cfg);
+
+	return 0;
+}
+
+static int amd_asf_unreg_target(struct i2c_client *target)
+{
+	struct amd_asf_dev *dev = i2c_get_adapdata(target->adapter);
+	unsigned short piix4_smba = dev->port_addr->start;
+
+	amd_asf_update_ioport_target(piix4_smba, ASF_SLV_INTR, ASFSLVEN, false);
+	amd_asf_update_ioport_target(piix4_smba, ASF_SLV_RST, ASFSLVEN, true);
+	dev->target = NULL;
+
+	return 0;
+}
+
+static u32 amd_asf_func(struct i2c_adapter *adapter)
+{
+	return I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_BYTE |
+		I2C_FUNC_SLAVE | I2C_FUNC_SMBUS_WRITE_BLOCK_DATA | I2C_FUNC_SMBUS_PEC;
+}
+
+static const struct i2c_algorithm amd_asf_smbus_algorithm = {
+	.master_xfer = amd_asf_xfer,
+	.reg_slave = amd_asf_reg_target,
+	.unreg_slave = amd_asf_unreg_target,
+	.functionality = amd_asf_func,
+};
+
 static int amd_asf_probe(struct platform_device *pdev)
 {
 	struct amd_asf_dev *asf_dev;
@@ -42,6 +221,7 @@ static int amd_asf_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, -EINVAL, "missing IO resources\n");
 
 	asf_dev->adap.owner = THIS_MODULE;
+	asf_dev->adap.algo = &amd_asf_smbus_algorithm;
 	asf_dev->adap.dev.parent = &pdev->dev;
 
 	i2c_set_adapdata(&asf_dev->adap, asf_dev);
@@ -65,5 +245,6 @@ static struct platform_driver amd_asf_driver = {
 };
 module_platform_driver(amd_asf_driver);
 
+MODULE_IMPORT_NS(PIIX4_SMBUS);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("AMD Alert Standard Format Driver");
-- 
2.25.1


