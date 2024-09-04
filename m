Return-Path: <linux-i2c+bounces-6140-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8384696B980
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C720285D9E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 10:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D121CFEAA;
	Wed,  4 Sep 2024 10:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0/tpdrUK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E781CEEB1
	for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2024 10:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725447500; cv=fail; b=EGQQgc6L0S4tBIMNTP7KxnzcwZcl9+QhhYLskHwwRB+SqFve9fCd18VZUOAZkBPI5jA9YO2kUk4cBThEKuhQq2yBikBye1h/wUxAPQ7yXoKl2k7c0vr7Mm3mdKck2/FAKQWlenHmov/OFQATqo150ccrzM2K+RD0jb2uWfEbGBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725447500; c=relaxed/simple;
	bh=0Sa/N6RqUIxLAHhaPYPNB9CXPyyC59kLP/jMMzNXi5w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z9BSO6M6Wmc9fznkTk0H37hhHSlCIvI2yd4j045eJrB+bxyzUnSpFIV6krDRq+mwPYLJdKjZZIXgOkwQXJ2cKJa/RUtEcw15xocExQsvWfTK8IZ51hL00xZVBpg/qashhWHj0//3t5e3Ckd139uMs/rU3jgbAtezNO9UMxN+jcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0/tpdrUK; arc=fail smtp.client-ip=40.107.92.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9E6l/14hV1phmlVY/hWlpXcnXSDTpVJBlElQvgxS0Ox/NQyCaIFIphFkjhzrksYzSWQBF79VmCTIzmp4+ZMOQ62MXyfIP65BQC+UVPViUxsyOx3x1D2v2MbfxWYmotvagJF9xuHvZO49f7cALmgTmAxUVkl8/DFRrnCG1sbLiW44B8MZ7WioZW2MAQEESTkCDZBmhoiqVImdbFhpQhY18xNikzklu3BSAiipaLD7dKhh004UX51/qbPx03PDSUkaZ1vrOhz9Z8mYi/M3pgIevM59A259A4Zx9dYdmRMXau9W9KX2JHvAVJOuFOqaOpkISG5tIxvrTejdiFXf8Tnsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPAjrgBMf77AWZERR0TSqVkwMs2mRmEB4o5NZkoSKBg=;
 b=UFIpc3VE9z4no2X9ID7ZqU9XyEK2lvCKAGP7U40HA3uzSyTwdP7fLR9hSDVI1mxqR5HcKNJTmmuS33xoeFSWH/nTiRq1Iw2PLLiM7WoezJi4IWIROZ2oM9mAftzzE7YDQqoaibupHMBlQrItV0j65mao08TmJITsAYOaWSOoon3uNC3pf4ykjO/1SEBz2NQQMtPgxOvo4sc8Gz3EcJq5jY8eJUFYaTtql9sgioVrxDst013NyR/KPUBI+oPuWbKzK3DEGH7jn7tVaQPZN1ddw3bHjCp2X0F0RVc00cZQChn2vjG3mk6XCWxqhKeoassnqUfEb6FSiRQys6HYoI6nrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPAjrgBMf77AWZERR0TSqVkwMs2mRmEB4o5NZkoSKBg=;
 b=0/tpdrUK8qbidiCfVEynDoANulyv0MSUVsRsYk4Pm/ilnD7pZOoAuXErJE2k3Mrh7yDVQ/5EB8y9KidawuGYA2jH9DQxJJOy/PVgsg0pyHHr6z+y4zbiL/Ms0jMypXQJLiqjdBpXcd+CkD6/e1LCopKr67UWjJOaxdqIfeq3Sb0=
Received: from BN9PR03CA0527.namprd03.prod.outlook.com (2603:10b6:408:131::22)
 by SN7PR12MB7980.namprd12.prod.outlook.com (2603:10b6:806:341::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 10:58:14 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::32) by BN9PR03CA0527.outlook.office365.com
 (2603:10b6:408:131::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Wed, 4 Sep 2024 10:58:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 4 Sep 2024 10:58:14 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Sep
 2024 05:58:11 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
Date: Wed, 4 Sep 2024 16:27:29 +0530
Message-ID: <20240904105731.2246235-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240904105731.2246235-1-Shyam-sundar.S-k@amd.com>
References: <20240904105731.2246235-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|SN7PR12MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: 154f97be-fd18-44c1-54c9-08dcccd0795a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qA04y+phU+M6Lsm3thKrynF105UMGdPtjsbTGtRurLPtbiiUsCvLFhbnkD9l?=
 =?us-ascii?Q?WDGrjURkXr6AWQiUZZlCuNpGML+YBjmY5fsWWdIEEq8drG+0Y1aR6AjxCF1d?=
 =?us-ascii?Q?Tx5TxQx4znjdNyZNM6lxGmvT6hVaiXSehf53YgGKHtvC1/VmMlLFJm2cTZYJ?=
 =?us-ascii?Q?BCLeA6N6Yh5lKJW4gFwMxD0MjfBkKgXgGALeI+iuO5aOcU/AO+d7C0Vr9qg9?=
 =?us-ascii?Q?XOOyYCTBuc264ThZ2AkoYNIQ8brHOcG8KN/UdxZEU9qbs4YZ4oau9pVntFiF?=
 =?us-ascii?Q?dUGoFdfs+NpAEObLwRISPVq1/lHRJUukkfe8f+aXPfmO5/+fY6QO3c5NQ9N0?=
 =?us-ascii?Q?WNaGXB3QCd8O3mUt/GdU681oO3Fd2P9w/Wv3JZj5lcWD/hB3x5i6mkeAeFqa?=
 =?us-ascii?Q?4nOfn0G9aHF2eLQEqjcLRVEC79r4eTlVQxlxEFuyyAO0UAMuGVwA3q1X6R7h?=
 =?us-ascii?Q?pSkJZbIk3pW3gRgsOyrtDNUnHZerObzX3/fs0CCtrmConZIVJzxEEDRn6vp4?=
 =?us-ascii?Q?gVo3s3SQvWUhxmVeCmLquYS972bpuP8lr5yE5pKLQwlBOPwebhFzX8jgrjpO?=
 =?us-ascii?Q?Z1YvOyDHi0p3JNhiSO5S98Lu/KRw1S3GC09iocKgeEEkvVy4dLJwTj0T+6GC?=
 =?us-ascii?Q?TNqZUYTeNTegyWDlLfSsHaY6x0CLkaWWDnbTzWTg1Ga/UUjT4/UOwNSGj5oy?=
 =?us-ascii?Q?4Q5i8pMX4FPpayNWIL6Ph8a6/Zt2NxLF2rlsTKd8sTudpwBcxZreuEensfiA?=
 =?us-ascii?Q?VB4uFrxzu7AK6vqa1n0TmVRAZVCMLlHGu6d6WosRu54yAJnmw6mS2PUf2yu6?=
 =?us-ascii?Q?HjUReQBQpUtMVqPp8fhBAnYu3F38qzgdiFf6V3XoWTtTrJY/QVp/oUCkvY95?=
 =?us-ascii?Q?TUMVPOS4C1i8NETUwNbZmsF/VM5ReTdUzEgyeA6tBjw60TS+3EOa0GmBzMYy?=
 =?us-ascii?Q?pGqei7yeOMKN5gPHXTXL8J8z26KXzSXXRKJACJuXmhs0YqKeIypjDGaGgKGJ?=
 =?us-ascii?Q?XBxTxHR1pJpG+MoOxmfD/QRgD7qrYh2NGxwytUN6KQwTT9k22C05lbQOXKk3?=
 =?us-ascii?Q?vzKyQ3dEgimwamGQeZ9skqCh71yRLOC7j7T3u3vs230COHhlZlpeyMi1iMt7?=
 =?us-ascii?Q?AqKsghRMCh+ujE+lNZV6RNt7NtVjH+iEqWJmXKVd6gS8EuQRlFPu0zZ5Lic2?=
 =?us-ascii?Q?YSyE0HH9DuceQQVZlFaSwRX2cgIfUYIeOtuYgVnxBw9ItUvLl3b1VzNvvMme?=
 =?us-ascii?Q?J0BVvdHv4ZF6pMG4OnMHzYM5rxGpngz1HuBKdmWexXDxiJDx16i6zbj/IyJf?=
 =?us-ascii?Q?neRvIlUYFkQHO+EUVhe6C0JE4KfyBK0MwusYU2L5PmFnDVRY2Hisj3aWHyae?=
 =?us-ascii?Q?h/NCjyjw8P0bCh1TNw83OAouVaPzFcOkHVBKx1RCCfwRDaah8zuG8YP8nQzi?=
 =?us-ascii?Q?WD4YfD0/XKaHicPZuIzsmp90eNQDTz+d?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 10:58:14.0370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 154f97be-fd18-44c1-54c9-08dcccd0795a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7980

The AMD ASF controller is presented to the operating system as an ACPI
device. The piix4 driver can obtain the ASF handle through ACPI to
retrieve information about the ASF controller's attributes, such as the
ASF address space and interrupt number, and to handle ASF interrupts.

Currently, the piix4 driver assumes that a specific port address is
designated for AUX operations. However, with the introduction of ASF, the
same port address may also be used by the ASF controller. Therefore, a
check needs to be added to ensure that if ASF is advertised and enabled in
ACPI, the AUX port is not set up.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 166 ++++++++++++++++++++++++++++++++-
 1 file changed, 165 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 003cb04312cf..3bcf2e8b24e7 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -60,9 +60,12 @@
 #define SB800_ASF_CLK_EN	17
 
 /* SB800 ASF address offsets */
+#define ASFINDEX		(7 + piix4_smba)
 #define ASFLISADDR		(9 + piix4_smba)
 #define ASFSTA			(0xA + piix4_smba)
 #define ASFSLVSTA		(0xD + piix4_smba)
+#define ASFDATARWPTR		(0x11 + piix4_smba)
+#define ASFSETDATARDPTR		(0x12 + piix4_smba)
 #define ASFDATABNKSEL		(0x13 + piix4_smba)
 #define ASFSLVEN		(0x15 + piix4_smba)
 
@@ -118,6 +121,8 @@
 #define SB800_PIIX4_FCH_PM_ADDR			0xFED80300
 #define SB800_PIIX4_FCH_PM_SIZE			8
 #define SB800_ASF_BLOCK_MAX_BYTES		72
+#define SB800_ASF_ERROR_STATUS			0xE
+#define SB800_ASF_ACPI_PATH			"\\_SB.ASFC"
 
 /* insmod parameters */
 
@@ -182,6 +187,11 @@ struct sb800_mmio_cfg {
 	bool use_mmio;
 };
 
+struct sb800_asf_data {
+	unsigned short addr;
+	int irq;
+};
+
 enum piix4_algo {
 	PIIX4_SB800,
 	PIIX4_SMBUS,
@@ -198,6 +208,8 @@ struct i2c_piix4_adapdata {
 	struct sb800_mmio_cfg mmio_cfg;
 	u8 algo_select;
 	struct i2c_client *slave;
+	bool is_asf;
+	struct delayed_work work_buf;
 };
 
 static int piix4_sb800_region_request(struct device *dev,
@@ -906,6 +918,66 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 	return retval;
 }
 
+static void sb800_asf_process_slave(struct work_struct *work)
+{
+	struct i2c_piix4_adapdata *adapdata = container_of(work, struct i2c_piix4_adapdata,
+							   work_buf.work);
+	unsigned short piix4_smba = adapdata->smba;
+	u8 data[SB800_ASF_BLOCK_MAX_BYTES];
+	u8 bank, reg, cmd = 0;
+	u8 len, val = 0;
+	int i;
+
+	/* Read slave status register */
+	reg = inb_p(ASFSLVSTA);
+
+	/* Check if no error bits are set in slave status register */
+	if (!(reg & SB800_ASF_ERROR_STATUS)) {
+		/* Read data bank */
+		reg = inb_p(ASFDATABNKSEL);
+		bank = (reg & BIT(3)) >> 3;
+
+		/* Set read data bank */
+		if (bank) {
+			reg = reg | BIT(4);
+			reg = reg & (~BIT(3));
+		} else {
+			reg = reg & (~BIT(4));
+			reg = reg & (~BIT(2));
+		}
+
+		/* Read command register */
+		outb_p(reg, ASFDATABNKSEL);
+		cmd = inb_p(ASFINDEX);
+		len = inb_p(ASFDATARWPTR);
+		for (i = 0; i < len; i++)
+			data[i] = inb_p(ASFINDEX);
+
+		/* Clear data bank status */
+		if (bank) {
+			reg = reg | BIT(3);
+			outb_p(reg, ASFDATABNKSEL);
+		} else {
+			reg = reg | BIT(2);
+			outb_p(reg, ASFDATABNKSEL);
+		}
+	} else {
+		/* Set bank as full */
+		reg = reg | (BIT(3) | BIT(2));
+		outb_p(reg, ASFDATABNKSEL);
+	}
+
+	outb_p(0, ASFSETDATARDPTR);
+	if (!(cmd & BIT(0))) {
+		i2c_slave_event(adapdata->slave, I2C_SLAVE_WRITE_REQUESTED, &val);
+		for (i = 0; i < len; i++) {
+			val = data[i];
+			i2c_slave_event(adapdata->slave, I2C_SLAVE_WRITE_RECEIVED, &val);
+		}
+		i2c_slave_event(adapdata->slave, I2C_SLAVE_STOP, &val);
+	}
+}
+
 static void sb800_asf_update_bits(unsigned short piix4_smba, u8 bit, unsigned long offset, bool set)
 {
 	unsigned long reg;
@@ -1195,6 +1267,88 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 	return 0;
 }
 
+static irqreturn_t sb800_asf_irq_handler(int irq, void *ptr)
+{
+	struct i2c_piix4_adapdata *adapdata = (struct i2c_piix4_adapdata *)ptr;
+	unsigned short piix4_smba = adapdata->smba;
+	u8 slave_int = inb_p(ASFSTA);
+
+	if ((slave_int & BIT(6))) {
+		/* Slave Interrupt */
+		outb_p(slave_int | BIT(6), ASFSTA);
+		schedule_delayed_work(&adapdata->work_buf, HZ);
+	} else {
+		/* Master Interrupt */
+		sb800_asf_update_bits(piix4_smba, SB800_ASF_SLV_INTR, SMBHSTSTS, true);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int sb800_asf_acpi_resource_cb(struct acpi_resource *resource, void *context)
+{
+	struct sb800_asf_data *data = context;
+
+	switch (resource->type) {
+	case ACPI_RESOURCE_TYPE_EXTENDED_IRQ:
+		data->irq = resource->data.extended_irq.interrupts[0];
+		break;
+	case ACPI_RESOURCE_TYPE_IO:
+		data->addr = resource->data.io.minimum;
+		break;
+	}
+
+	return 0;
+}
+
+static int sb800_asf_add_adap(struct pci_dev *dev)
+{
+	struct i2c_piix4_adapdata *adapdata;
+	struct sb800_asf_data data;
+	struct acpi_device *adev;
+	LIST_HEAD(res_list);
+	acpi_status status;
+	acpi_handle handle;
+	int ret;
+
+	status = acpi_get_handle(NULL, SB800_ASF_ACPI_PATH, &handle);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+
+	adev = acpi_fetch_acpi_dev(handle);
+	if (!adev)
+		return -ENODEV;
+
+	ret = acpi_dev_get_resources(adev, &res_list, sb800_asf_acpi_resource_cb, &data);
+	if (ret < 0) {
+		dev_err(&dev->dev, "Error getting ASF ACPI resource: %d\n", ret);
+		return ret;
+	}
+
+	acpi_dev_free_resource_list(&res_list);
+	ret = piix4_add_adapter(dev, data.addr, SMBUS_ASF, piix4_adapter_count, false, 0,
+				piix4_main_port_names_sb800[piix4_adapter_count],
+				&piix4_main_adapters[piix4_adapter_count]);
+	if (ret) {
+		dev_err(&dev->dev, "Failed to add ASF adapter: %d\n", ret);
+		return -ENODEV;
+	}
+
+	adapdata = i2c_get_adapdata(piix4_main_adapters[piix4_adapter_count]);
+	ret = devm_request_irq(&dev->dev, data.irq, sb800_asf_irq_handler, IRQF_SHARED,
+			       "sb800_smbus_asf", adapdata);
+	if (ret) {
+		dev_err(&dev->dev, "Unable to request irq: %d for use\n", data.irq);
+		return ret;
+	}
+
+	INIT_DELAYED_WORK(&adapdata->work_buf, sb800_asf_process_slave);
+	adapdata->is_asf = true;
+	/* Increment the adapter count by 1 as ASF is added to the list */
+	piix4_adapter_count += 1;
+	return 1;
+}
+
 static int piix4_add_adapters_sb800(struct pci_dev *dev, unsigned short smba,
 				    bool notify_imc)
 {
@@ -1243,6 +1397,7 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int retval;
 	bool is_sb800 = false;
+	bool is_asf = false;
 
 	if ((dev->vendor == PCI_VENDOR_ID_ATI &&
 	     dev->device == PCI_DEVICE_ID_ATI_SBX00_SMBUS &&
@@ -1279,6 +1434,10 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		retval = piix4_add_adapters_sb800(dev, retval, notify_imc);
 		if (retval < 0)
 			return retval;
+
+		/* Check if ASF is enabled in SB800 */
+		if (sb800_asf_add_adap(dev))
+			is_asf = true;
 	} else {
 		retval = piix4_setup(dev, id);
 		if (retval < 0)
@@ -1308,7 +1467,9 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (dev->vendor == PCI_VENDOR_ID_AMD &&
 	    (dev->device == PCI_DEVICE_ID_AMD_HUDSON2_SMBUS ||
 	     dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS)) {
-		retval = piix4_setup_sb800(dev, id, 1);
+		/* Do not setup AUX port if ASF is enabled */
+		if (!is_asf)
+			retval = piix4_setup_sb800(dev, id, 1);
 	}
 
 	if (retval > 0) {
@@ -1326,6 +1487,9 @@ static void piix4_adap_remove(struct i2c_adapter *adap)
 {
 	struct i2c_piix4_adapdata *adapdata = i2c_get_adapdata(adap);
 
+	if (adapdata->is_asf)
+		cancel_delayed_work_sync(&adapdata->work_buf);
+
 	if (adapdata->smba) {
 		i2c_del_adapter(adap);
 		if (adapdata->port == (0 << piix4_port_shift_sb800))
-- 
2.25.1


