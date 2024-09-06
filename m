Return-Path: <linux-i2c+bounces-6302-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A805E96EBB7
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 09:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A2E31F26CB8
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 07:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA8714A630;
	Fri,  6 Sep 2024 07:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WI1kCoo9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA6913BC0D
	for <linux-i2c@vger.kernel.org>; Fri,  6 Sep 2024 07:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725606794; cv=fail; b=IgJg0mewMeO0GaBItKkW3Lct3F5oUWTsPHWbuHXsdvtzt3za7r/TxiqfHx/63kmQSM0REI7hEcLJotkI7NG1AgGPmkNwv8Q9jn0dnWGzCpPGCI+gDZY423bUvtGtwIgile8t9MX4oeyl4j1XwzuNy3bzKC9wZnGbz5pMklN9VvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725606794; c=relaxed/simple;
	bh=SrFI0FaQr5mJFiYX2Ej1VUQsyLjHWu4qXOuDC6es4+U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g08sucmSmcqgBxrtMJCHsRrziloh5EzDllK/YBoKBXSpAa79SbtD88PMtFStEMVTTZWIcfK8vozG13OUiywbqDDLR8ZH1935D6iaKnhv39N95nc995L6xajKq1abYiY5fsIXb6g0/V805miLsMef9YIwmm9cGcHp1ccjvr6Po3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WI1kCoo9; arc=fail smtp.client-ip=40.107.243.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTJSrv+4weJNYQLtrV9CmkDRPGVYskzL+w8csrF2LOF77YeF4eeh4TsaYcCI9CJz11jeoUMGDBI1ZhMAJv5Sl66SHa2tXPym+LkLeS6asZ4uE1H2wjwNuKTeVgKHTL9a509toRY+xQGL56/uqmSoIAsSqKKumwmdFKYAdLWnP4EJywmhh9Qjac9cv3KqlULyOFFpAb2Eb0ynSXxhws/CwyPW3XxuIZGCc2y9ifD04k178S7ZKV5Pve6jPqZ0DopBNCrkSux1hSvz3vDGwheV+K/qoYvAWJii5i8hxGnNyCyAkhAmgsuCppHDmO8GLurucXWvZQqwX3rGaRniwgeKOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyHmGiouaCXYvrM+j+CHKm54pYMC/JHV9tMDBP2/yfA=;
 b=Fq7Ev702Y5T0Um5mFBUCpvKJ0DG1e2qgUatWGeuMO3q1VIu5tE6Ef8JTg7Qd3qhTF8sEM7gbqBpfnSBZ8QpOd168hWEevn3QP4fk8Q1hdPOXeK6lb1WusaO4hf1OphYl/M3++fp2e5YMa8Hh8lfsFkHNDaKVTWT1P8AS+O6h9sJKnuG3GpLJaSm8H9XMF5jvRgfwkelzNzrhqRuxCt2PmX0YTy7Hf6VbUxRJbJ1fZcyBT4lD1i1T8k4sQeoBUcf6cSIKQYfG0ZZXb2KyRKsHy/4rkdaG6LRfm4fLalXxhk9AsYEPlA7troguOeJQ6Sxz4QtebFt+kWVllvDkj450Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyHmGiouaCXYvrM+j+CHKm54pYMC/JHV9tMDBP2/yfA=;
 b=WI1kCoo9J/9dR12v6WkWJZwHEioYL7Cl83a0FZrrQmJx+W1+kV5U5P5zURC/b/LJ+eG4v/ZpfZA/ZGG50ehDsaJsQinFgqRgYHO6UygOBt0M4Xc+Kd60NMGeY8TFQ4twoUM8i0gu+ITyZZaV5P3QaoEedDqpN+lui2viD6RW8Lg=
Received: from BY5PR20CA0017.namprd20.prod.outlook.com (2603:10b6:a03:1f4::30)
 by SJ0PR12MB7475.namprd12.prod.outlook.com (2603:10b6:a03:48d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 07:13:07 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::a8) by BY5PR20CA0017.outlook.office365.com
 (2603:10b6:a03:1f4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Fri, 6 Sep 2024 07:13:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 07:13:07 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Sep
 2024 02:13:04 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
Date: Fri, 6 Sep 2024 12:41:59 +0530
Message-ID: <20240906071201.2254354-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906071201.2254354-1-Shyam-sundar.S-k@amd.com>
References: <20240906071201.2254354-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|SJ0PR12MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a56ca9-9477-4c79-65ba-08dcce435b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TXaD80wH9jgIL+tQae0vzlIKqHoEUHcWeiYvHHsohfxX2C7Ee4gBfU0bw+V4?=
 =?us-ascii?Q?Zkzyj4z0vOrvKjwJTWmXqK0VtyJa0ZyYoBz8KGKzaUWHaS7zPwVHSIwZaXz+?=
 =?us-ascii?Q?AH95suOfKP8rN6p5+SHAVle/7FNUl6qeR2XjyuR1V6rQN4KfUGgACu6+0UIQ?=
 =?us-ascii?Q?lUrAZoKHd1TyRaEURXhuK/P6IyGQtZppTBHutI1QGsSnWSNXeoehLRYlp+gJ?=
 =?us-ascii?Q?qPI0QRdv9lQp1G+ufTjr55IJf6zhNuJz221Nx+vJdZVLwO9dBp9aEpoep2ob?=
 =?us-ascii?Q?P/1ixESrDcGgNs0ZNspcq2npobQenWa5vRpOfiufeVklsUzwD82brbAjGi+/?=
 =?us-ascii?Q?dNlHVa0HMnHSKsNvKt/6vULHom+tCKLascFTZoT1jsykiXwmnJ1TN6pIyoxA?=
 =?us-ascii?Q?xKD+x77X2S0qIEHFul8FW8VnfhCalFMM7H9hbh5Jh2foIcZEHxuGpb9PDBp6?=
 =?us-ascii?Q?a07BsttWN/VCtLXMg2txgHmweNScWHm9MjlBGEGaWK6jCnFb3NppnIcxRZbC?=
 =?us-ascii?Q?NDDyg0nuJHV0XmTDX4mJeG0wSxymDu/2xrBov47ya3lRfp1cPNBYMFyFfowu?=
 =?us-ascii?Q?gt2RW5HW87HDFt1us4vW0JxXlpPSa1m/XzhenevHUg1O1MTPzs80BnG6ZFAL?=
 =?us-ascii?Q?oPGVsnkf0ftqgSf7V7Wrb1qgyVlh5Gd7bjIc50NsmOpFRJfuqASOsK9t4ozg?=
 =?us-ascii?Q?irV5htbiPuUKoE/UnD3HfFlyqsD5h7+YXkmTve9yTWjxArvBEmHmFwc5MdS+?=
 =?us-ascii?Q?Vr+83WhZGwR+I84YwYwUSdzuw2JOQJIa00tR+1VQxAbs4BT5PJTfpa+ZV95R?=
 =?us-ascii?Q?bDDfMcUlT0JYVdsplcJ+zR3GGuewiC5pV5cY6/CLgMfX3MlzB2zDKBcuw2on?=
 =?us-ascii?Q?/JhIUhWbnJ7WbdqAgTa6ZVskBWvZOWbBG3u7tfrGc8o5F30XdyQIxJqpuoJP?=
 =?us-ascii?Q?Nur60VeZYF4yg5W6iRv++9vqu6xo1vpduGcnKnwIk/Y3E11jNd0lByqHpe74?=
 =?us-ascii?Q?Z+Eu3PK3CosOAwW74D7vgq3RHS4OVkQE25WtAinrVCsb4jTPazBl3uykduwj?=
 =?us-ascii?Q?a3Ehvyo9uUiIEoOEu1Dy9BnZ+epaNFgCIiiO1x4B3V93buwXWXiVs1TxdlL+?=
 =?us-ascii?Q?INOZU4g0kZo/+j0VdFtl+qMzglZqJxUxXrRrxchx6oFvyqDAUvwEFuggNXeT?=
 =?us-ascii?Q?hhRxyFFlB5asSAk3nESDR+Y15MBRpZ5XTuSSNmbGCmUnsC6YGS+nE3J6Fxfl?=
 =?us-ascii?Q?2yQRFH62EsqgoI8WUv8iMUnHDeglq9tvFME/jmAFl4uKspow/co/V0HeD6B5?=
 =?us-ascii?Q?yoE4Jvmw3RfSnhJnGvRS1t38pnxSEGlp9AQCoGDlDacoijLwsORhEkn7f4sh?=
 =?us-ascii?Q?So5K9UUv+eq3Nzl+9hrLwWC4o3oJTKTsmg29nAgf02rUIok3mCY9/1lQI9xV?=
 =?us-ascii?Q?JbCs9M6gVdXfGQu3JH4MNSOhPjG6CVpb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 07:13:07.2672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a56ca9-9477-4c79-65ba-08dcce435b97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7475

The AMD ASF controller is presented to the operating system as an ACPI
device. The piix4 driver can obtain the ASF handle through ACPI to
retrieve information about the ASF controller's attributes, such as the
ASF address space and interrupt number, and to handle ASF interrupts.

Currently, the piix4 driver assumes that a specific port address is
designated for AUX operations. However, with the introduction of ASF, the
same port address may also be used by the ASF controller. Therefore, a
check needs to be added to ensure that if ASF is advertised and enabled in
ACPI, the AUX port is not set up.

Additionally, include a 'depends on X86' Kconfig entry for
CONFIG_I2C_PIIX4, as the current patch utilizes acpi_dev_get_resources(),
which is compiled only when CONFIG_ACPI is enabled, and CONFIG_ACPI
depends on CONFIG_X86.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

 drivers/i2c/busses/Kconfig     |   2 +-
 drivers/i2c/busses/i2c-piix4.c | 167 ++++++++++++++++++++++++++++++++-
 2 files changed, 167 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 10ad839bf4a2..7d080a009ee3 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -195,7 +195,7 @@ config I2C_ISMT
 
 config I2C_PIIX4
 	tristate "Intel PIIX4 and compatible (ATI/AMD/Serverworks/Broadcom/SMSC)"
-	depends on PCI && HAS_IOPORT
+	depends on PCI && HAS_IOPORT && X86
 	select I2C_SMBUS
 	select I2C_SLAVE
 	help
diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 003cb04312cf..2bf9611d864a 100644
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
@@ -194,10 +204,12 @@ struct i2c_piix4_adapdata {
 	/* SB800 */
 	bool sb800_main;
 	bool notify_imc;
+	bool is_asf;
 	u8 port;		/* Port number, shifted */
 	struct sb800_mmio_cfg mmio_cfg;
 	u8 algo_select;
 	struct i2c_client *slave;
+	struct delayed_work work_buf;
 };
 
 static int piix4_sb800_region_request(struct device *dev,
@@ -906,6 +918,67 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 	return retval;
 }
 
+static void sb800_asf_process_slave(struct work_struct *work)
+{
+	struct i2c_piix4_adapdata *adapdata =
+		container_of(work, struct i2c_piix4_adapdata, work_buf.work);
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
+	if (reg & SB800_ASF_ERROR_STATUS) {
+		/* Set bank as full */
+		reg = reg | GENMASK(3, 2);
+		outb_p(reg, ASFDATABNKSEL);
+	} else {
+		/* Read data bank */
+		reg = inb_p(ASFDATABNKSEL);
+		bank = (reg & BIT(3)) >> 3;
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
+	}
+
+	outb_p(0, ASFSETDATARDPTR);
+	if (cmd & BIT(0))
+		return;
+
+	i2c_slave_event(adapdata->slave, I2C_SLAVE_WRITE_REQUESTED, &val);
+	for (i = 0; i < len; i++) {
+		val = data[i];
+		i2c_slave_event(adapdata->slave, I2C_SLAVE_WRITE_RECEIVED, &val);
+	}
+	i2c_slave_event(adapdata->slave, I2C_SLAVE_STOP, &val);
+}
+
 static void sb800_asf_update_bits(unsigned short piix4_smba, u8 bit, unsigned long offset, bool set)
 {
 	unsigned long reg;
@@ -1195,6 +1268,88 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 	return 0;
 }
 
+static irqreturn_t sb800_asf_irq_handler(int irq, void *ptr)
+{
+	struct i2c_piix4_adapdata *adapdata = ptr;
+	unsigned short piix4_smba = adapdata->smba;
+	u8 slave_int = inb_p(ASFSTA);
+
+	if (slave_int & BIT(6)) {
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
+static int sb800_asf_add_adap(struct pci_dev *dev)
+{
+	struct i2c_piix4_adapdata *adapdata;
+	struct resource_entry *rentry;
+	struct sb800_asf_data data;
+	struct list_head res_list;
+	struct acpi_device *adev;
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
+	INIT_LIST_HEAD(&res_list);
+	ret = acpi_dev_get_resources(adev, &res_list, NULL, NULL);
+	if (ret < 0) {
+		dev_err(&dev->dev, "Error getting ASF ACPI resource: %d\n", ret);
+		return ret;
+	}
+
+	list_for_each_entry(rentry, &res_list, node) {
+		switch (resource_type(rentry->res)) {
+		case IORESOURCE_IO:
+			data.addr = rentry->res->start;
+			break;
+		case IORESOURCE_IRQ:
+			data.irq = rentry->res->start;
+			break;
+		default:
+			dev_warn(&adev->dev, "Invalid ASF resource\n");
+			break;
+		}
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
+	piix4_adapter_count++;
+	return 1;
+}
+
 static int piix4_add_adapters_sb800(struct pci_dev *dev, unsigned short smba,
 				    bool notify_imc)
 {
@@ -1243,6 +1398,7 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int retval;
 	bool is_sb800 = false;
+	bool is_asf = false;
 
 	if ((dev->vendor == PCI_VENDOR_ID_ATI &&
 	     dev->device == PCI_DEVICE_ID_ATI_SBX00_SMBUS &&
@@ -1279,6 +1435,10 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
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
@@ -1308,7 +1468,9 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (dev->vendor == PCI_VENDOR_ID_AMD &&
 	    (dev->device == PCI_DEVICE_ID_AMD_HUDSON2_SMBUS ||
 	     dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS)) {
-		retval = piix4_setup_sb800(dev, id, 1);
+		/* Do not setup AUX port if ASF is enabled */
+		if (!is_asf)
+			retval = piix4_setup_sb800(dev, id, 1);
 	}
 
 	if (retval > 0) {
@@ -1326,6 +1488,9 @@ static void piix4_adap_remove(struct i2c_adapter *adap)
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


