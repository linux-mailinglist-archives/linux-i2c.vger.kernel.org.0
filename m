Return-Path: <linux-i2c+bounces-6927-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E99597E727
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 10:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A27661C210D8
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 08:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FCA4F215;
	Mon, 23 Sep 2024 08:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AZnGcOB3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782093C485
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 08:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727078741; cv=fail; b=T1vDBMtNtZ8P0AZ5x6+s+vo8+cfg259Pw6y+BNbGVvN6La8tmk82+pk8BFlwRR/Jc4yTiAHaIlm7A0kq6pfd0BaSrF2M5Y/spGbxSN3VGByZXF3xakxQZuJvJQuu5dT9lWcG3mbr6s/6+T+DIrwZ/6KipwBchu4DCEv9V0gyeqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727078741; c=relaxed/simple;
	bh=Lno5JBsGGrrOfwPf1vAhMbD37ANJ63fdlzH5k9EkIjQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GLL8+/kcNQU3A3GuojxXWGH8B8IlQNPJsuolSyq6C6a1MZNG8t9JrMLY4J4/FASIDUKtzuSvLZn3WCYXPraf/w6A49ztMSYFKTphLs6wDMR7Xksm0mBYuR8XQS8VIZ9hXreLQke0AJic534DyibiG5VOutJ6+c7a2fIhRryGJoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AZnGcOB3; arc=fail smtp.client-ip=40.107.93.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xgKJeCTHHHnm9srObVmt2oQu3fTK94cegwW52NDBESldzczt10+kyWJz0xyfvI7aSHG6ocb7ZAvZP6fexn1aGx8o8IgAgyFB1EFjnjqYb8ryJiTUF/MZbDGoPYduPRGOkSDEplm+x+a1qPGuZMiOJWvL8HBegcLX9LqGfZ9GAscTtpT9w4fnRUaHZZcCzBDn/NvR7p+YMdHw7S6UWdOv2dwsdy/fFrzSiXq905CUTo3nQSVze0nMOdWllGKgblXEGUONN6yYFkGmw4NCqhSg6Ycs7Sr2l3ZZXEb73/8h7JuX2AHkfm2Sm2xC4yMjT62xM1lmvQOTusjnOPaaacGhhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPBjLv8lSSPBf4CmtykfDPotsxsS2FO2DigoqBfWnfE=;
 b=bCORBLTkLs8kNeuBvSRm42EMoHiwLa9ZndNpBi7fQh179u8/cZ9+9X64Eo9bHuF0TkKSpGuikuKigweQl57WcDuR3FP7R0f5uNAeK1xnXUlniL3ImMkCUUHBjL46MPSUwEZjyRjPrpDDp/2qdbGfF7IHnZ63TlOe3zn1m+L2I8eKv+/OYsD8I88lvRIXjICA40/6xNaIBWufRAkPtexpwjT3z64pTkZAJubbu5FJ3OoP1VIuQdJDm/AcTgZNKojwS4NyTFL+vkBKI1iWTIZlimwthgxhwFABH6K4QD7er93ok8VMHIjWJc6OFpfeiLzjFPB3ZzXjViQ+zen+8vM9/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPBjLv8lSSPBf4CmtykfDPotsxsS2FO2DigoqBfWnfE=;
 b=AZnGcOB3PwlLwgq53LdZ4nOlmVk1XHwis1DorrBHKnyVfUhxkfCQfzpP12456AdVQ1pOULgJwmKP6roelKdPHChzagRO4+zql86tKyCw/kORb7kR1jjFT/yMNvY13DtONGhDNa/M1PocBWL+uyaIAOeeAW6kqWUZpp25vD8Vuks=
Received: from SJ0PR03CA0361.namprd03.prod.outlook.com (2603:10b6:a03:3a1::6)
 by LV2PR12MB5941.namprd12.prod.outlook.com (2603:10b6:408:172::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 08:05:36 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::96) by SJ0PR03CA0361.outlook.office365.com
 (2603:10b6:a03:3a1::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.30 via Frontend
 Transport; Mon, 23 Sep 2024 08:05:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 23 Sep 2024 08:05:35 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Sep
 2024 03:05:30 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 5/8] i2c: amd-asf: Add i2c_algorithm operations to support AMD ASF with SMBus
Date: Mon, 23 Sep 2024 13:33:58 +0530
Message-ID: <20240923080401.2167310-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240923080401.2167310-1-Shyam-sundar.S-k@amd.com>
References: <20240923080401.2167310-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|LV2PR12MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d036f64-99bb-4695-6a95-08dcdba68136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tR76PAbS6L7EtUR4XRu2YxjJmFcrZv2TWUbEXy2tVi+2fMrjoNZ8w5/5ahmI?=
 =?us-ascii?Q?5uxVyw30yILVRSdpOpnj4OU5+QKLY0JuT2nTQG5XQ7qKYZzc/7Uo0b/Nj7kd?=
 =?us-ascii?Q?FKZMIYZUZe4DusImZE10w8DuS+0Th+UibC4WLkXH+xf3q7QgLlhowYihWCuk?=
 =?us-ascii?Q?w6ilEWh03WEPYZaK9FEWxjhBl703+x56+2nHpmvnlNsoeO3wCsGGotPL+hcg?=
 =?us-ascii?Q?ikypmdQtEdO/yyScIYujTREmxzAJpu/29o0Ai8Ng8Cl/wmVeQMAw93LpQuS0?=
 =?us-ascii?Q?HXqypshiic7Q/A9c6h5herShqfjTvlkIHIQt2YUh7eg5iTHk2L0ItuQt6ymP?=
 =?us-ascii?Q?etnlaLZu5bvh9q6QTQRphHo4wY/rFKU5HJynYY5c6E3Pevcmhk080fDTeg6N?=
 =?us-ascii?Q?nw4Apus+GsBStJY5j1ARCVmMiKRycec/Zqif20LenZIOrZ4yaOFEFGD2yhEt?=
 =?us-ascii?Q?PJVOMU2/3PsdjHEy2N8V9ezAWmul5YeDgb52fWmc5i5bXzl1ZJ19W4VCEDeo?=
 =?us-ascii?Q?mtSzeYYSOsIwTiw/fHnqHmJ9dzEhjHH2+v+Ib4J74fulrg9OwKjdbgF22V7/?=
 =?us-ascii?Q?+q0Dxs6UI+fYEijoO6bXUAJd8rlw/3VrKEFw6Nr/rtAkQa1YjzTD3Kc8Hp9X?=
 =?us-ascii?Q?XE7vZ8/4FzlrmQo4aBt97hVQQzzfsKwOyllkC78sJbVqIQgwYvQ4s3rwcwkq?=
 =?us-ascii?Q?LV5Ur0wb/WZGcraLbLj5dLou4GsfQyNLKMMVBYG/W8igKhkzyt8twUri+fn9?=
 =?us-ascii?Q?zZIw/0m3ZVIhkjY94qOPMOaLoA6vdxqYAOiigoro5qQEbI72aygw/K/B0AlO?=
 =?us-ascii?Q?A+z1lBdA6W/WEz3NLtptMz8XtnSOsTXfz71TE1IcKNdkKDEWiaegJTes6f7u?=
 =?us-ascii?Q?GLtWQb2/wttocoPIqvPa2N0GX1jlidbT1YxY0tUBMSTBaf6PkTkRFF9FnAIv?=
 =?us-ascii?Q?g46gey/tr9+NJioSSOy+mkqog9FDWFAx1AaR7cTm4dMz3a0khsxgzKCIDdCh?=
 =?us-ascii?Q?z/Vd6QcIRGm/x1IwVjsrIuHmKyzAlRaLZO5V5sDxywiABUAeZoxymODfYt9j?=
 =?us-ascii?Q?mAhqhgO0j5Aacon2OF/r3vpNoUjhmhn6QSBI0cWsQG3IwaOd+vtaGh/qdK5o?=
 =?us-ascii?Q?LEL/af5pMvwPwTUgBiBwQ2mXZCLHVUjojeypvl3bfMvDmfO1F4xK/pQrgvUQ?=
 =?us-ascii?Q?/4YB6k3mZeSx9VxXBiLwuobw45pMO8rC8yhTIkne5AUoMddViPCMk6o9zviO?=
 =?us-ascii?Q?FRrsTBMrQwI7aMT0tyo1qxeBxZ74ifafTHrmUxaS+QvV7r28BktUa9a4AmiO?=
 =?us-ascii?Q?cC4bUmHsu0tsxTIIejPrSEBLzsRbeqTjeXEKTk9bBl31zDhUlbLecDJLTuXr?=
 =?us-ascii?Q?0mvDgQguUEI/BNqhd/aCDr3GcD8a?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 08:05:35.7242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d036f64-99bb-4695-6a95-08dcdba68136
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5941

Implement the i2c_algorithm operations to enable support for AMD ASF
(Alert Standard Format) with SMBus. This enhancement includes:

- Adding functionality to identify and select the supported ASF functions.
- Implementing mechanisms for registering and deregistering I2C slave
  devices.
- Providing support for data transfer operations over ASF.

Additionally, include a 'select' Kconfig entry as the current patch
utilizes .reg_slave() and .unreg_slave() callbacks, which are controlled
by CONFIG_I2C_SLAVE.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
index ccb547e14414..216b194202ba 100644
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
+	return I2C_FUNC_SMBUS_WRITE_BLOCK_DATA | I2C_FUNC_SMBUS_BLOCK_DATA |
+	       I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_PEC | I2C_FUNC_SLAVE;
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
 	struct device *dev = &pdev->dev;
@@ -43,6 +222,7 @@ static int amd_asf_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EINVAL, "missing IO resources\n");
 
 	asf_dev->adap.owner = THIS_MODULE;
+	asf_dev->adap.algo = &amd_asf_smbus_algorithm;
 	asf_dev->adap.dev.parent = &pdev->dev;
 
 	i2c_set_adapdata(&asf_dev->adap, asf_dev);
@@ -66,5 +246,6 @@ static struct platform_driver amd_asf_driver = {
 };
 module_platform_driver(amd_asf_driver);
 
+MODULE_IMPORT_NS(PIIX4_SMBUS);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("AMD Alert Standard Format Driver");
-- 
2.25.1


