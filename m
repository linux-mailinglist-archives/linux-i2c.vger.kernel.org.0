Return-Path: <linux-i2c+bounces-5684-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A35B95B83F
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 16:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4BF0287414
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3638E1EB5B;
	Thu, 22 Aug 2024 14:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HOLqukRG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFEB1CB333
	for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2024 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724336562; cv=fail; b=KMntUkOId6eRdmuq0F5MtgMOpAdk46BRN+SgjNMTFh3c5Isdkz5V4gENcFfPqp4fpFn1ZuDVla0VUaDbL8OPQW/LRfNgXVZuS1QsOfx+1ioaR0K7fcuq95vP127Kn2/ohOdQZ6gBNM3A1Y+f1+5RFxzgPslKAbYPr+AMCKOJaCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724336562; c=relaxed/simple;
	bh=01ZRAwt0Nwhhm5vHamMIVN+kxe3yx//XQI0MfxPiUt8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cimZ2f0zLFqtAtgoBsXiNTm21r20NHAKB0oEHUzj6XkAjh8TQU3120nX0PP98uMw2bVXq0hsLcQpQVZ2pCr8pvP1Fo2doOV9gRmcVWF2k2vx13jRSfWnXARzyUIbl+VS4ul/5L7Ro7qrboodtcCpMuRC7HbrrceJgg9CME4U45s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HOLqukRG; arc=fail smtp.client-ip=40.107.237.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1+AXUNp5ivTWqg1ecyRgO07Xaa8z6Rda8dPBHUC7iIjlROqRNwJxV+VAvMK+Hwy7eaRnjWXhKON1w8R7RIbt4pPOA3eGWLg0qBw/1Z+Qh38p+yPca19ii0dETBSuyKtHz5StfMV68Y1OFHnn7B0Si69aG3fepF/C5XWOzdIXK+GmILdF15mduTxNRE+2J8GX1c92kv/xI3T9GNS5w3TXebna+g88L3qzDsdSVGFmqHBLAXRiuMcUFjqYmuHuxWVBSQediA4beZaok65LtNJBZyjRikhTwzZIS6pK1pFRWaE3osQFiPRbIi49D4DKetmf/VNtjoxFd476lk4jacInw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voiPuEUEc/hrocvnnUG1DyrvxTqCRJLFXZsFE526SAc=;
 b=NAoshez+bIUryaFY2Tt8Y6XH9M1/oDR6asmgpw+R384FHUADRQM95OKPMLlOQg8RO/aqfm0ElMHmOC41skVe8ruY+bncCOIFv7tzoXZFHL4MnrwFkFOM57fpnVgDabIpNyf/t5v1+nU1UEmf3XtW3NQ/HoN44aJLtHWt28qyC2rIKKn1oUiX0hEfYxv23tDsdT0lbdhCO6reNQk0IC8qSWOLnk+2ZQ2JtBwP9SWqomjh+cKkE93bfwNOl6xo8sW3X5pdRXcxgf1lH3qDubhsCqWhEj7AULNwKWI2fhVvYUjJOyzSjuiGjQR+SUOfi4ZgKjD645i6fSfsVZFLGS/Udw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voiPuEUEc/hrocvnnUG1DyrvxTqCRJLFXZsFE526SAc=;
 b=HOLqukRGGu8COWnsB6eL6cwON92mmP2ER3USQA8z0GWvhwqhDwpiMDwhrcGfRmdy8FaEqRI2h15wc3VnySpdwQcZ/W7Kv7d4mtEgnxSIsJu+rTHICR6DEU07gmXLirbjYDtGPVRn8mDL/u4MSdOjJwiZR1unAL+reS1BkW58WAc=
Received: from CH0PR04CA0112.namprd04.prod.outlook.com (2603:10b6:610:75::27)
 by PH7PR12MB6467.namprd12.prod.outlook.com (2603:10b6:510:1f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 14:22:36 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::a8) by CH0PR04CA0112.outlook.office365.com
 (2603:10b6:610:75::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Thu, 22 Aug 2024 14:22:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Thu, 22 Aug 2024 14:22:36 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 Aug
 2024 09:22:34 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
Date: Thu, 22 Aug 2024 19:51:58 +0530
Message-ID: <20240822142200.686842-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822142200.686842-1-Shyam-sundar.S-k@amd.com>
References: <20240822142200.686842-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|PH7PR12MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: ec34f3a2-01ea-4b62-47bf-08dcc2b5df03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Kdaz2caY263U+fzMN/PIkiwiXDgUvZ6pjYQXiJm+vATd4lTxgY4FLMDcfj8O?=
 =?us-ascii?Q?TuTNds0iSTqX5DoTavGSrjEX5lu3dwMP4YEF9DoddEiklQHCfwwwc+KS5kTa?=
 =?us-ascii?Q?9/dPmPEDd7CNUTV1FiU5fDLhFd+9AHLHrX3JbYmUzNG1KoFn2ZWO/QnNqF3F?=
 =?us-ascii?Q?aLomjuJaj+ZRZmOqQ05+iNbjvU73xuB6yj7/W8AjeniH1blVo0xfqS71U+jz?=
 =?us-ascii?Q?i1IWJOcvSGIq7YJDFC5Cp8fT5dWbAgGW11Cjn2S11XbCN4QmdFBWCeoL95Md?=
 =?us-ascii?Q?Nrn3ChtG0oksS61Ng6z1UvLH39C+4+j5j5qUk6Gtj7YY+8Qdq/Eazl6UY34d?=
 =?us-ascii?Q?9Vqv+3U5mmkpti5zCETA+lUvUUpNBBJN3AvMxd7sM07W2/9+MphhDo0o7ECZ?=
 =?us-ascii?Q?5G8MsctIMOBzT4gzLPk28KfaIIzLDGhe3Y/4NaOrSHpY2PZL0zH33DPW8GBj?=
 =?us-ascii?Q?YDYuAdNWZjCQHEZP84qp9DMaYhaYRQhPC5AE5exsbvrGX30wFCWB7RudfMe2?=
 =?us-ascii?Q?zpzPJzTfHaCE6iwXx0YU8zGaa2uekWN95pXnMFxiaE6URANWSEgLB4lXo5Tv?=
 =?us-ascii?Q?wSpA+XOvkF5iYX7KL/A1c2Jugw77xwDCXc4FVEraAYpH9vgvzfmzY6ZVHNMC?=
 =?us-ascii?Q?Rb9iBz22AO7WNUcVPPCKwGeB/2ZpNOc5cBBDVap58RNANkKlhZlMuZyBC90m?=
 =?us-ascii?Q?yuLVxZr2Ua1472tztosr3MKhBqb92Yttecocei1AIqLrIcYnwxDv0LSMKYvM?=
 =?us-ascii?Q?ZGBvPhJb04ZGFtMhK9xF7921Vmqq/0w9ApYg5vgdg1ZVgqIkFsBUBO1wQBvP?=
 =?us-ascii?Q?5EYaho/5smLYBwxuDmxgwet8oPPYUf/FFb2O1UWEnCfPsuL/4Wwzg43sWm0j?=
 =?us-ascii?Q?R4AYkpOqUCuOjezk8ByopP+nKTgBrFvL28152Dp1vBwCC8MVcCtazHflhH00?=
 =?us-ascii?Q?wl0mSWZtW2M+v8lRyjsUTCwuBT8MQVoTLY8/z6gxEEiyNYkg6Pccc6cBvT/P?=
 =?us-ascii?Q?qyRDPjj9I6LlfOrGKcIfAAqsTWjHeiFZMeNBB874mIqp9EV7NcAGduiqb9mI?=
 =?us-ascii?Q?vZkQ4ovEMfMFoMCGBgtHcFdp6Woct1WvAM57NRMS3Nb+hfBTQOh69Ub8ZaHW?=
 =?us-ascii?Q?dgxgz0FKe6OSjsWnHi222DzJ42miaU0V2nvbaLkpwJulZWdBZA5MysOYM/Hi?=
 =?us-ascii?Q?gkf0JOilQ4J1BirZ58M00EbIxm7kTnZJ7hIQJSsLVkFTezqWaqQTyH6FLstT?=
 =?us-ascii?Q?saoCFkzU0tECwCr7Z48EskajvcTRf/Zeg5v6PfBPqRz9doGGd8/63kn3QvN2?=
 =?us-ascii?Q?iY571wc1pucc/BryivgZrupQGWAHk0cFJk8ukvx7IzDEZH/acTSRaFkj/q8x?=
 =?us-ascii?Q?cD0RE+VS4C8pC6Z7BN/WCGUdNOpipyZf8ynMkQ2M7rGfHt/M7kFGitsIDxuO?=
 =?us-ascii?Q?Kei6bgAGwxHslWwl3sspXHnR3e5/aZMu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 14:22:36.5233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec34f3a2-01ea-4b62-47bf-08dcc2b5df03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6467

The AMD ASF controller is presented to the operating system as an ACPI
device. The piix4 driver can obtain the ASF handle through ACPI to
retrieve information about the ASF controller's attributes, such as the
ASF address space and interrupt number, and to handle ASF interrupts.

Currently, the piix4 driver assumes that a specific port address is
designated for AUX operations. However, with the introduction of ASF, the
same port address may also be used by the ASF controller. Therefore, a
check needs to be added to ensure that if ASF is advertised and enabled in
ACPI, the AUX port is not set up.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 161 ++++++++++++++++++++++++++++++++-
 1 file changed, 160 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index a44b53dd4dd7..00fc641e6277 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -121,6 +121,8 @@
 #define SB800_PIIX4_FCH_PM_ADDR			0xFED80300
 #define SB800_PIIX4_FCH_PM_SIZE			8
 #define SB800_ASF_BLOCK_MAX_BYTES		72
+#define SB800_ASF_ERROR_STATUS			0xE
+#define SB800_ASF_ACPI_PATH			"\\_SB.ASFC"
 
 /* insmod parameters */
 
@@ -185,6 +187,11 @@ struct sb800_mmio_cfg {
 	bool use_mmio;
 };
 
+struct sb800_asf_data {
+	unsigned short addr;
+	int irq;
+};
+
 enum piix4_algo {
 	SMBUS_SB800,
 	SMBUS_LEGACY,
@@ -201,6 +208,8 @@ struct i2c_piix4_adapdata {
 	struct sb800_mmio_cfg mmio_cfg;
 	u8 algo_select;
 	struct i2c_client *slave;
+	bool is_asf;
+	struct delayed_work work_buf;
 };
 
 static int piix4_sb800_region_request(struct device *dev,
@@ -909,6 +918,66 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 	return retval;
 }
 
+static void sb800_asf_process_slave(struct work_struct *work)
+{
+	struct i2c_piix4_adapdata *adapdata = container_of(work, struct i2c_piix4_adapdata,
+							   work_buf.work);
+	unsigned short piix4_smba = adapdata->smba;
+	u8 data[SB800_ASF_BLOCK_MAX_BYTES];
+	u8 bank, reg, cmd;
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
@@ -1195,6 +1264,86 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
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
+static acpi_status sb800_asf_acpi_resource_cb(struct acpi_resource *resource, void *context)
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
+	return AE_OK;
+}
+
+static int sb800_asf_add_adap(struct pci_dev *dev)
+{
+	struct i2c_piix4_adapdata *adapdata;
+	struct sb800_asf_data *data;
+	acpi_status status;
+	acpi_handle handle;
+	int ret;
+
+	status = acpi_get_handle(NULL, SB800_ASF_ACPI_PATH, &handle);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+
+	data = devm_kzalloc(&dev->dev, sizeof(struct sb800_asf_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	status = acpi_walk_resources(handle, METHOD_NAME__CRS, sb800_asf_acpi_resource_cb, data);
+	if (ACPI_FAILURE(status))
+		return -EINVAL;
+
+	if (!data->addr)
+		return -EINVAL;
+
+	ret = piix4_add_adapter(dev, data->addr, SMBUS_ASF, piix4_adapter_count, false, 0,
+				piix4_main_port_names_sb800[piix4_adapter_count],
+				&piix4_main_adapters[piix4_adapter_count]);
+	if (ret) {
+		dev_err(&dev->dev, "Failed to add ASF adapter: %d\n", ret);
+		return -ENODEV;
+	}
+
+	adapdata = i2c_get_adapdata(piix4_main_adapters[piix4_adapter_count]);
+	ret = devm_request_irq(&dev->dev, data->irq, sb800_asf_irq_handler, IRQF_SHARED,
+			       "sb800_smbus_asf", adapdata);
+	if (ret) {
+		dev_err(&dev->dev, "Unable to request irq: %d for use\n", data->irq);
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
@@ -1243,6 +1392,7 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int retval;
 	bool is_sb800 = false;
+	bool is_asf = false;
 
 	if ((dev->vendor == PCI_VENDOR_ID_ATI &&
 	     dev->device == PCI_DEVICE_ID_ATI_SBX00_SMBUS &&
@@ -1279,6 +1429,10 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
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
@@ -1308,7 +1462,9 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (dev->vendor == PCI_VENDOR_ID_AMD &&
 	    (dev->device == PCI_DEVICE_ID_AMD_HUDSON2_SMBUS ||
 	     dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS)) {
-		retval = piix4_setup_sb800(dev, id, 1);
+		/* Do not setup AUX port if ASF is enabled */
+		if (!is_asf)
+			retval = piix4_setup_sb800(dev, id, 1);
 	}
 
 	if (retval > 0) {
@@ -1326,6 +1482,9 @@ static void piix4_adap_remove(struct i2c_adapter *adap)
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


