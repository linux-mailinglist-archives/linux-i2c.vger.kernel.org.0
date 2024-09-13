Return-Path: <linux-i2c+bounces-6713-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D7D977F58
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 14:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0319128219C
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960B31D9347;
	Fri, 13 Sep 2024 12:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1pGXfGon"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F2F1C2329
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 12:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726229525; cv=fail; b=D9PDPJt0iHmXsuy/4kF1CuCcjucocqEzR+DvBqZunZ9ZbFRVwi8sodAx+/3yjnnrd3/K856gKcCVWvk3XbY7KQHz+Juh83FqyKuHbVuSIvaV7IACKXP42+ZrTGqXfpsc2ZiwLFYECnFoZGCnJwwcqKz9aBchx9tU3XQ5pfZBkrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726229525; c=relaxed/simple;
	bh=MHxeU2vbcANVhV447r92ome6DsYWucQMpKqE/+Xm44I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AQDYsUOPrLS2hXUIGxPVJR58FPLQPPg7ulyPQCS9JccySkHpgmTwTzHP/0EhqF6ABhzoNwAIMcghvyMWd597O2enFUckHW/KpY/DGnJili098IXVqTU3YroJeubwnpJ17z5x8LVg8fnXC1TXqLWupnJuSojy5lf0cQv9TXm3d9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1pGXfGon; arc=fail smtp.client-ip=40.107.93.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCyJYknEplcdvZ2I6cCulEt8npwS8Umcr/BCpEJGktK/a4N08q78fPs0/qY83syoxUBJdofdxs4FEcVQjXZndGOgHdX843vYVH48MT2/7B73Ty8toah1Qk7mfvvSPnHk0jIMHcTHpTi7Q8MUNxL3Tt+PgHb603aTTENlb+82NVWNfpbA08zOkVt7RtMuhXnlgaE9u20sB7UznN+3Idt2GFUqTuVEeh1E25hiCDTOgQ1UDcu1riQRN5Q2hk1QNgY+dgrhO9XZjEio9sC8N3cImLsaDqvnAoolienQmOXJ6tZAOwSK01ee4s069pV6FdPGVFS5fSep+kbMuSNydKRtOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6/b7yT8gQtKxyyct14dob7/bmkS91Hm3H8CuyUEeus=;
 b=fA0Tn02uBJ0ucDEE1mhY8kqbVTYwJ7qReHlzPtx6dd5rQQP7kFYaFnvnYvozKt0Nw0ElLJSR4n850ZxFYxUv8KwyQWlSNsOPDGA7rUf4emd+5IPnkJKKI431i1wPOAvYIrRjAnV+ANiteMefRC4+IqdmicbbaWOURznFWzzs1y8VrTZorp93qQ7DZUAJNGVAKidHBUIIkMUFJtuIGwjduq7aZwC4aIaWeKUKjCO9ohNSptmWRLqNAMtr/hTqrXg0z4cSSiP/t9LU1eltqpruzt50IOmTs41PbSMf5qPdy1TDvmTwl1c2VlYhbUgRPdVFFq5FoXWK7ANhPS/HksuIlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6/b7yT8gQtKxyyct14dob7/bmkS91Hm3H8CuyUEeus=;
 b=1pGXfGonlDkbU+YD/huA04CpU5hTA65//emvTSdyzIqLTaGvNEwtv4nSj5F08ZRcMuw6E2Z97/9qclhHG8dHANIXEm2UCMVWsZmACLQfi6S3BvdjO7vHPDVHOvJRBFCrvXpRarWZZIwQ+ZSxVCsIn5/HI1VWMvMXFh+rVqrkcHE=
Received: from CH2PR18CA0016.namprd18.prod.outlook.com (2603:10b6:610:4f::26)
 by CH3PR12MB8512.namprd12.prod.outlook.com (2603:10b6:610:158::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.27; Fri, 13 Sep
 2024 12:11:59 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:4f:cafe::c5) by CH2PR18CA0016.outlook.office365.com
 (2603:10b6:610:4f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Fri, 13 Sep 2024 12:11:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 12:11:59 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 07:11:56 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 5/8] i2c: amd-asf: Add i2c_algorithm operations to support AMD ASF with SMBus
Date: Fri, 13 Sep 2024 17:41:07 +0530
Message-ID: <20240913121110.1611340-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|CH3PR12MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: 09c89ea6-38a7-40d0-d4a1-08dcd3ed449f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tx0g1Ig2+EI5qE6zJup4clGjF5em3w5qdwPPoxMGwQ+kJuvFVr5EN+Ycdgix?=
 =?us-ascii?Q?isOR4z5LAVcDlOY1FGdbVx4HMcTazxIF1qSK9zLPVKdaS5AVVYHOoyblCMCE?=
 =?us-ascii?Q?yxAso9EuS61YA9Nfr714CkcI3N8FV/BS6Ay6IPpJMBz5eUB/mNqjb30M2SlR?=
 =?us-ascii?Q?9pZKC8dBjzVHff7BfMunJUKJ6H/7ptmKD/P4jB8pNIWAzuWvL3vA5Egs3uxu?=
 =?us-ascii?Q?4H+8EZ0RY/0MApwxSaF7HvQEQRye4T4gf1o5KokuHXQykJekF+pel0/+GS8P?=
 =?us-ascii?Q?U2xhEK+YyAlIbp1sEyn+5WASM2UpaaBXL/CZtaKvjtiS68gLZvI+Z1RE/gCA?=
 =?us-ascii?Q?6HtcjBSNY3cACMIlEmw0i8/hAPqbiaHBNOIndYh9QSlrZfzPPcS4WolcdsNf?=
 =?us-ascii?Q?gmMnMHHbp0iW7gdHMoUOhV5hLzEANAOHSKzKOpTn+E7PMoCy8FyaHyLGzIGp?=
 =?us-ascii?Q?ZhVF+tk654GMmsV+fAPoXIIUXqd2kouur8SZB/8mPXidgduPn0kNocf07OKM?=
 =?us-ascii?Q?PxANDwhWMqrzaXNgwgLBB6veambBovYIs4/ObRd8rPPVSZ1Q551UiSQG23ad?=
 =?us-ascii?Q?7mFyG0+cMuI5ktbYTyerBYY2vtOQ4Q19VUetTs93729BNODAjapP1F+7LsMj?=
 =?us-ascii?Q?A+fo6Y7c/wloLtuYPvuBs6EebRA/lw4wGDtcZFnby1guMjuy4zdA7ewn9iem?=
 =?us-ascii?Q?09h92U9UeFGO09VANIgknZ4O/wQplvepy4JLPpLRCoKcB8U/I2eANR1HPeRK?=
 =?us-ascii?Q?f1oPiSwhLe2boViGBfKljKVKXQMO6E/JtSLWxIQg2dQRW+bsBH3DajQUxiRf?=
 =?us-ascii?Q?ho9Zos40C0IKvkX4yqSZAsD2Sy6QSopa0MJTrThrxnuaYq9KqW35DeMkrSw8?=
 =?us-ascii?Q?IC8xPy1mvj7hW85FbI0wYDzVcn6UC3CH8gzpiCu91Vv3yKNA9clexjK3CnWT?=
 =?us-ascii?Q?cG+jfy0Udx9RAOPB9falWTgQzqsxA8BxYrHy/cx83tSSZl1AFz54oxO1LuE3?=
 =?us-ascii?Q?R7CwsxVd4oSC/74dxsJt5+DOB4qZ6X7q2Tq6efW1SrqX3QE3/K6zONWGK6ra?=
 =?us-ascii?Q?I6sVFHAO93Z+XwLp7D+3KBOs6Za3ITwLGHzTTJR/G5DnRQT2LlplmsT39pqA?=
 =?us-ascii?Q?Ypu8xlOmNmNu7pkxeOIs1p3pyCcdsZAfd8CItHafEa22vkyDIDxQYt0gtI6p?=
 =?us-ascii?Q?pMSLmxGDBropRyjnbZoYpDvzZcd4fgHhadkzJtbR03xVP0tEEn8cI8e2re1U?=
 =?us-ascii?Q?1+g6J+Ww6Fnho58g8B3vBnCsauK/7/Hzn8mLuaNLIIXFTv8skHSVDajGlzee?=
 =?us-ascii?Q?KEFcS3rBfMQL/yR2wIyUdMJ7yagX5aDD9eLtt6Z/Zp4CX/rx78btlOVUriO1?=
 =?us-ascii?Q?WW5nWn0ea5vIr/IMHirIV0+/PmIhYF05kOkUPKB/ncWZf3LiphwKJlysG6IM?=
 =?us-ascii?Q?dRDM1WX2RCrrVF1To/T/mCnwf0HHdY98?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 12:11:59.1021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c89ea6-38a7-40d0-d4a1-08dcd3ed449f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8512

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
 drivers/i2c/busses/i2c-amd-asf-plat.c | 185 ++++++++++++++++++++++++++
 2 files changed, 186 insertions(+)

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
index 3d80805a7a3e..aa85e10a3927 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -19,15 +19,199 @@
 #include <linux/sprintf.h>
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
+#define ASFLISADDR	(9 + piix4_smba)
+#define ASFSTA		(0xA + piix4_smba)
+#define ASFSLVSTA	(0xD + piix4_smba)
+#define ASFDATABNKSEL	(0x13 + piix4_smba)
+#define ASFSLVEN	(0x15 + piix4_smba)
+
+#define ASF_BLOCK_MAX_BYTES		72
+
 static const char *amd_asf_port_name = " port 1";
 
 struct amd_asf_dev {
 	struct i2c_adapter adap;
 	struct device *dev;
+	struct i2c_client *target;
 	struct sb800_mmio_cfg mmio_cfg;
 	struct resource *port_addr;
 };
 
+static void amd_asf_update_bits(unsigned short piix4_smba, u8 bit,
+				unsigned long offset, bool set)
+{
+	unsigned long reg;
+
+	reg = inb_p(offset);
+	if (set)
+		set_bit(bit, &reg);
+	else
+		clear_bit(bit, &reg);
+	outb_p(reg, offset);
+}
+
+static void amd_asf_update_bytes(struct amd_asf_dev *dev, u8 bit, bool set)
+{
+	unsigned long reg;
+
+	reg = ioread32(dev->mmio_cfg.addr);
+	if (set)
+		set_bit(bit, &reg);
+	else
+		clear_bit(bit, &reg);
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
+	amd_asf_update_bits(piix4_smba, ASF_SLV_LISTN, ASFLISADDR, true);
+	/* Enable target and set the clock */
+	amd_asf_update_bytes(dev, ASF_MSTR_EN, false);
+	amd_asf_update_bytes(dev, ASF_CLK_EN, true);
+	/* Enable target interrupt */
+	amd_asf_update_bits(piix4_smba, ASF_SLV_INTR, ASFSLVEN, true);
+	amd_asf_update_bits(piix4_smba, ASF_SLV_RST, ASFSLVEN, false);
+	/* Enable PEC and PEC append */
+	amd_asf_update_bits(piix4_smba, ASF_DATA_EN, SMBHSTCNT, true);
+	amd_asf_update_bits(piix4_smba, ASF_PEC_SP, SMBHSTCNT, true);
+}
+
+static s32 amd_asf_access(struct i2c_adapter *adap, u16 addr, u8 command, u8 *data)
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
+	amd_asf_update_bits(piix4_smba, ASF_DATA_EN, SMBHSTCNT, true);
+	amd_asf_update_bits(piix4_smba, ASF_PEC_SP, SMBHSTCNT, true);
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
+		dev_err(&adap->dev, "ASF: max message length exceeded\n");
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
+	amd_asf_update_bits(piix4_smba, ASF_SLV_RST, ASFSLVEN, true);
+	amd_asf_update_bits(piix4_smba, ASF_SLV_LISTN, ASFLISADDR, false);
+	/* Clear ASF target status */
+	outb_p(0, ASFSLVSTA);
+
+	/* Enable ASF SMBus controller function */
+	amd_asf_update_bytes(dev, ASF_MSTR_EN, true);
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
+	reg = (target->addr << 1) | BIT(0);
+	outb_p(reg, ASFLISADDR);
+
+	amd_asf_setup_target(dev);
+	dev->target = target;
+	amd_asf_update_bits(piix4_smba, ASF_DATA_EN, ASFDATABNKSEL, false);
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
+	amd_asf_update_bits(piix4_smba, ASF_SLV_INTR, ASFSLVEN, false);
+	amd_asf_update_bits(piix4_smba, ASF_SLV_RST, ASFSLVEN, true);
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
+	.reg_target = amd_asf_reg_target,
+	.unreg_target = amd_asf_unreg_target,
+	.functionality = amd_asf_func,
+};
+
 static int amd_asf_probe(struct platform_device *pdev)
 {
 	struct amd_asf_dev *asf_dev;
@@ -45,6 +229,7 @@ static int amd_asf_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, -EINVAL, "missing IO resources\n");
 
 	asf_dev->adap.owner = THIS_MODULE;
+	asf_dev->adap.algo = &amd_asf_smbus_algorithm;
 	asf_dev->adap.dev.parent = &pdev->dev;
 
 	i2c_set_adapdata(&asf_dev->adap, asf_dev);
-- 
2.25.1


