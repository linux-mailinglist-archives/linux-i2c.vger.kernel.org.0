Return-Path: <linux-i2c+bounces-6554-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCDD97513B
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 13:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CF8E1F28395
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 11:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4300F187336;
	Wed, 11 Sep 2024 11:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zblvebvZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC9918661C
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055702; cv=fail; b=uvjwajOBduZNiUMreuKG3CPXWkTPMBrM9XrnwYvGpLusmtJf9FTY/GPbUAQt+HtTQx+ZwOkDn+Pen9y3EmpXVa0c79XW1rDukf3fnQRpzWtoKEeIjEoi1rcLGLVDoxQsJ7l+zLrRdfTqaiilNBaY215cvyZ7sVw7eorbu0/RsW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055702; c=relaxed/simple;
	bh=ocIlx0A8STRGc0ZuMOvDxDVK0/IZSkmUCiRbM+0Yj+Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VlbxEpzpNFwWC44o7E9nDAdGcQSaEoqSD9AXVEe1UqrjTNRhr7mvaqu1qbUwuaWxFz5Zxx6YiIwxzkBPK8G9Nlwn+pgzzl7CfrF5xdZhuIDbDKNnRRhJ2BNs6yFRJrwrTrzsJICanFpuVNC3t8OCy9ro/GK8tOt9lStctFCOB1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zblvebvZ; arc=fail smtp.client-ip=40.107.220.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkLtfb3QYNOj0IFTUrgLz34PUwwtCMkb6qgLp5nIX5d3TZYF0JFIy2ttV6mVmjB0u1uU5VY5tX55Ia/ew7OODu9u/e63UrG3PAAUVoWWH9kXdL49guc5J6G0LWRKezreuwyBsR4NOXgwB5pAn8L5G3+29QpSpJKtG0N6SxziA/diSOICG9ync+db7j42p1F94bNnLiFEZvwCYQRpemJhQqpM8QvIuWNA97GCMqfT2pRltjgeGeGeCb23uCQd6Ci7QoWjnfcguZ1uW6HPkngM1fXHBUP3N2adY/q5+aQtUf5xTvrfRVvQVv10J1kJAQsnwbSOtKyV1mj19hqO/DpoXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6UxWagYxU7As/EYa9YlfJKfSH4F/7XQyUS2QhSdpN4=;
 b=WRShFglFpTZNw1qjF7kw8L5GzU8HTjxMi3sp+nmciqzg1E/D37ZUktvaaw4n/d9rdkhGiAGrXmuVEIJnwO16jRPk5ZV4G6FcaUsw4vc0YsSwc3LGROttszPmIfJaGXgSVDvPmVnSFGWRWyywBN9PMGhoZLkMySSB/E79iGmowjPqbQxu7f8UfKApe/aWXkdlMKsI5UXUVFVWfdP+2xFeMEEMmY/A4QqZWLLHSuhgf+sBYqpSeDXKYbMeS1tS45BOpmgHOI9rpSCCCWaFXsjxz308x0/JTpFeooXygN9vl1CZTqOlaTo3ZwqVfClSeSiIQ/eo1fTjkRxnRMbC0oasOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6UxWagYxU7As/EYa9YlfJKfSH4F/7XQyUS2QhSdpN4=;
 b=zblvebvZhE1ok4u0tsvlYxEs4UXWt9F+dWdScd4GnyCOjiMC0N9uxrUvjSUet5uM6ogtQcc76GgIDAX/u30qLLJ+nf9weIs/7WuQU7s4KdotryWEes1Z9iGAz7BfXMnbkcvSz5hIHFwlry+MbhBgtV1RA2/PbG4GO9yzAA3yYIk=
Received: from BY3PR05CA0059.namprd05.prod.outlook.com (2603:10b6:a03:39b::34)
 by DS0PR12MB8246.namprd12.prod.outlook.com (2603:10b6:8:de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Wed, 11 Sep
 2024 11:54:54 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::d9) by BY3PR05CA0059.outlook.office365.com
 (2603:10b6:a03:39b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23 via Frontend
 Transport; Wed, 11 Sep 2024 11:54:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 11:54:53 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 06:54:50 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 5/8] i2c: amd-asf: Add i2c_algorithm operations to support AMD ASF with SMBus
Date: Wed, 11 Sep 2024 17:24:04 +0530
Message-ID: <20240911115407.1090046-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
References: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|DS0PR12MB8246:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d683df-1197-4d51-fcd4-08dcd2588c6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yv8iQN6VP591ytSszMmYmoiF7iJAvg9ZkqVuAFbya8ZuMQYO/ezoLyYBvhp7?=
 =?us-ascii?Q?V/+L/I33KzpmzpuCSs4taa2ysoMvi5wirqMWanaAgOW1VTSk+vKyy32YFhvE?=
 =?us-ascii?Q?lldrxe0FQA6fwkjgS15I1WKPh2jMWrLmf+luh88V7MeMqhIXlpJUVbBHSRad?=
 =?us-ascii?Q?stDu5J5iXzhA3sC4OLg939FL2a+A+WkVFFF4b5nQMckDdJgcWY0gGZzUat4m?=
 =?us-ascii?Q?ffuLyLSeIIpw+F2Leggxm0MIsFTuW4dCbReYT59xnp2PEf8AqmP0UxP5b49T?=
 =?us-ascii?Q?/Gc41084SZ3DCiItnvRqBcEj37myOVUevQQ7ryeC4XcnXbfwAa/jx0H5Cglw?=
 =?us-ascii?Q?FWDmst6JP1WGDXnLcIu7s/f1bxgnlxxws7mWHKW0WzfcBtY5kjU7dN7T0U5x?=
 =?us-ascii?Q?2ZdCC/8ld85zsYfLdwK1gW85TjPETI/zT7QpzMb3wQ26x12Rguxh7i4eNH4q?=
 =?us-ascii?Q?v+tjdWVTTECZjzIRg2XSkvvVPUQc1EuTU9Lqj4EkH12JkhP6wBrVEhl6QU6R?=
 =?us-ascii?Q?8sJDnrKtIZVkVHBTqTNc8yLPQnVPr/uegcUWGttI91g/HRx1PmiyFUK5N0ba?=
 =?us-ascii?Q?+ZTXXRJwd6XRbEBLvbGSLhJT89YNJ1KfZO2GM+K5qTq38GAoqtbm9tZRIZ/3?=
 =?us-ascii?Q?dYWgCQFj1jzil1k/DVMfOuZsiYRuCbbxZ78qXqweRE2GjKlUTxI1sxx3aPp+?=
 =?us-ascii?Q?Pi6+fNg0LGmgDIHMXvbfkOo+piHXbYZIWnAfWlbxSFa3vk773dWKoaFpirhG?=
 =?us-ascii?Q?GrSUJive/brDcCZIWYV7jJN65Sey494EVHuAPnTgQ+5j0n5YO0nn3P0mB/w+?=
 =?us-ascii?Q?ue4S2mW6oQ21E4uyjIlDTskp+sttPf91EXIqLYJ483iZB/FjfFun4q+W6CaY?=
 =?us-ascii?Q?rT+WwOGolwmyNOk3odcqBHIftC2S9nuAx7EGCjWepJrQkbNroUXrHksG3R27?=
 =?us-ascii?Q?e9+i5H436PtfVq3trhA/SCmzcnK5mKkcShpi3FiI6L0r0XvOskoOHwzac1mS?=
 =?us-ascii?Q?Kt6i/DrM9n33UO68xQXZl6HouhozGRLDbJXHIS4lw3nnFdnvYvHf1646BMWF?=
 =?us-ascii?Q?Bq80AGaXTFCXOGJhsRMH4Cr7JdMniqggxrR5fMbS4aEyaNIqTIEHjdYF5TGa?=
 =?us-ascii?Q?W3uBllvZh9eziiKVfwa5XpHuYM+IQkVdqhtW5r+XPEnKjSvqLcU/OW48Q/uK?=
 =?us-ascii?Q?adruUaeoTKQpI/Z4KuFtfxD4kpUnjbzBjnvIof7e/l8QvBXmtmyzd2/uUZtK?=
 =?us-ascii?Q?vOpPjL8wOhUaFjoWCr8Np8RP0tKHwiryt7VydZbQTEguxUmypieO5iMh9QsF?=
 =?us-ascii?Q?3fxoPzJGHa+YgK7aOFRXf3z0LNsDm3yWVYpUNJkuvoHDHk+v7HGaCwVgdTTr?=
 =?us-ascii?Q?abTuz2S6sRvhS4iT74Z96qJZ4kl/j4pbtfbCUYnbJL0m1cxnnF1+rxLRACwx?=
 =?us-ascii?Q?1uBXOIpAVsATFrUxbf38hG89+5PDkRSv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 11:54:53.2997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d683df-1197-4d51-fcd4-08dcd2588c6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8246

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
 drivers/i2c/busses/i2c-amd-asf-plat.c | 189 +++++++++++++++++++++++++-
 2 files changed, 188 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 262a8193c0bc..b8c6428d24ea 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -98,6 +98,7 @@ config I2C_AMD_MP2
 config I2C_AMD_ASF
 	tristate "AMD ASF I2C Controller Support"
 	depends on ACPI && I2C_PIIX4
+	select I2C_SLAVE
 	help
 	  This option enables support for the AMD ASF (Alert Standard Format)
 	  I2C controller. The AMD ASF controller is an SMBus controller with
diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
index eb3cd166850c..7afaf8a9440e 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -15,15 +15,199 @@
 #include <linux/slab.h>
 #include "i2c-piix4.h"
 
-static const char *sb800_asf_port_name = " port 1";
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
+static const char *amd_asf_port_name = " port 1";
 
 struct amd_asf_dev {
 	struct device *dev;
 	struct i2c_adapter adap;
+	struct i2c_client *target;
 	struct sb800_mmio_cfg mmio_cfg;
 	unsigned short port_addr;
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
+	unsigned short piix4_smba = dev->port_addr;
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
+	unsigned short piix4_smba = dev->port_addr;
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
+	unsigned short piix4_smba = dev->port_addr;
+	u8 asf_data[ASF_BLOCK_MAX_BYTES];
+	struct i2c_msg *dev_msgs = msgs;
+	u8 prev_port;
+	int ret;
+
+	if (msgs->flags & I2C_M_RD) {
+		dev_err(&adap->dev, "Read not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	/* Exclude the receive header and PEC */
+	if (msgs->len > ASF_BLOCK_MAX_BYTES - 3) {
+		dev_err(&adap->dev, "ASF max message length exceeded\n");
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
+	unsigned short piix4_smba = dev->port_addr;
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
+	unsigned short piix4_smba = dev->port_addr;
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
 	struct resource_entry *rentry;
@@ -46,6 +230,7 @@ static int amd_asf_probe(struct platform_device *pdev)
 	asf_dev->adap.owner = THIS_MODULE;
 	asf_dev->mmio_cfg.use_mmio = true;
 	asf_dev->adap.class = I2C_CLASS_HWMON;
+	asf_dev->adap.algo = &amd_asf_smbus_algorithm;
 
 	ret = acpi_dev_get_resources(adev, &res_list, NULL, NULL);
 	if (ret < 0)
@@ -67,7 +252,7 @@ static int amd_asf_probe(struct platform_device *pdev)
 	asf_dev->adap.dev.parent = &pdev->dev;
 
 	snprintf(asf_dev->adap.name, sizeof(asf_dev->adap.name),
-		 "SMBus ASF adapter%s at %04x", sb800_asf_port_name, asf_dev->port_addr);
+		 "SMBus ASF adapter%s at %04x", amd_asf_port_name, asf_dev->port_addr);
 
 	i2c_set_adapdata(&asf_dev->adap, asf_dev);
 	ret = i2c_add_adapter(&asf_dev->adap);
-- 
2.25.1


