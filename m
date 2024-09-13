Return-Path: <linux-i2c+bounces-6714-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00255977F5B
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 14:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AB60282487
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1564E1D933F;
	Fri, 13 Sep 2024 12:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="it+NZ7Jq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2071.outbound.protection.outlook.com [40.107.101.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AF51D932F
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 12:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726229528; cv=fail; b=SiV6dHNxRGnVZbhtQUfTDLJCIgS1jJWsKPGppLbgQ2QJuBbAif6JFKaC5pUp9QNeegGcgsy3yWDjydlEVaEipd8XsHsW6dT/buA1ZBZluFLOkgkwIinhGY5feZ5Vw4dQG94U8oDDTffHQEIi9QNpyqCWpB7Xy6MzQ8PpLPJ3AbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726229528; c=relaxed/simple;
	bh=4MB3QhWwseFIEG0aHskRBdMxe6Qr0aEuibazMqpsS6M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MsHMYnCmiOPU8M/dzt5yxbVw6ZMPL4w0aE7wwazkmRDf++MUXL0vLuRXUJFKODYvzr8brUFzowvScxW6HPIAbItc79k0TTEC9cTeW2y0HFVqYjHEoJFDsc0dytaTQb6OVT6ZAB3mgYGgWzftRqU3QuY3VvJ7wmOP0rpPNwbGUJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=it+NZ7Jq; arc=fail smtp.client-ip=40.107.101.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgq53i7zUtbb6aUeIidrLn5VTtrgwK4Kr2/vkDIBbe2sDow78bb7Q+R0Zq/jvgoAO6mnLVmjO1bcbqQWSYCGa/mMnG+E1gsq4JMC6hX1nHCaomBVGKmEHN8HFAEpvGh1X3HImOqWIylOSWlS0vDEk7T6kO7JhkzyBTCHkFQuAIbPabj3Y9+Yja5GrYKPOLqNQbiyD8f10OQPqIQ5uV6DK/maQ4JIZFdMu0tDcHiy2Ei9KyjKLj7MhN66Nihc64bPBP6jsKrWzuYQUMlCGqi2c5KVyzlhbMJWrxY4/By6K4zcFErdIAsz2JVs13KkI6D2UebOCclqRNo9RyxX0U4z9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFuMgtay9sTuMPD9zpjHF2whmryHFlELJznzRDfOEiM=;
 b=jpDMc3sOqFyyiPnVb4ARMNR8KqLwytRLWY1wUNp9zL3tfgxyLciTgz/NMZYggeXZXaVCvey7Cvq/Z5BGxgZyUtGyzlcViCReflxzeZa/AbbVPLbjFdlopqroSXvwOPuevJvyutEtPBvip7a+by0pdbGvhZLd2nMV835TIwfYaIaBIgR34AHriFrxekA1kSoRY4Gy7qNlhOe2Resx7RiiiJMI2oEMUqFj+qbjNTCB5enIhQAlBCBDV8tMTBD+itgD0i9oRaKNlcMSI/YtchISOisehyWho60lv0Eu6FEj4PGCg9bUZCjUuQGAsBKD9DwgUPIKyHZ3Jx+mi1Oa68E8JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFuMgtay9sTuMPD9zpjHF2whmryHFlELJznzRDfOEiM=;
 b=it+NZ7Jqy63Vvu4Hm/MiMdpCQ+xCrC3iChc1jYj7TG35gUCQ7TagQqAf9QzBhIXhQCwekdk6cutZ20p3sjYnBgi5LLWko9KzVLnEXaC8l+lxvPS2VoyqAls77FsNKbVCvDMCaT3Dtwd8zdibEFvrwxFpzxre6cr1a9BMZGufJlo=
Received: from CH0PR03CA0259.namprd03.prod.outlook.com (2603:10b6:610:e5::24)
 by DS7PR12MB8322.namprd12.prod.outlook.com (2603:10b6:8:ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 13 Sep
 2024 12:12:01 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::f0) by CH0PR03CA0259.outlook.office365.com
 (2603:10b6:610:e5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.27 via Frontend
 Transport; Fri, 13 Sep 2024 12:12:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 12:12:01 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 07:11:59 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 6/8] i2c: amd-asf: Add routine to handle the ASF slave process
Date: Fri, 13 Sep 2024 17:41:08 +0530
Message-ID: <20240913121110.1611340-7-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|DS7PR12MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: 43aac748-ee4f-4754-1291-08dcd3ed461c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1LinGCS9a0Ptvc2sq5VO5u4ZpCZDss0+PMS4xaFMXSzmG5OPiZAjXwJDj1Uf?=
 =?us-ascii?Q?6L3tKo1hO/tc7AvzCXGe6jE7YlyZ1Vx1R108z+wI8dzF4iEXQM4Kwa6Uh/tM?=
 =?us-ascii?Q?/p9OUnVGzykvilM5Nm9dpGTdp/DYvOA7OLZFebhj6Bi/mUZ9duWRMukWkABB?=
 =?us-ascii?Q?VhNhrXkMyDTfTkW74SbX0Gc3L5gcZnivI7UXyLs9uN8oJFWhspxkcaFrmNv/?=
 =?us-ascii?Q?s2CfJvYwcXThb97F/xlZmVuZGWrSiHFQmGtEtFgEqYP6Zsg1v/Gw0T74unlT?=
 =?us-ascii?Q?N3Jani3+KJqIxQAbqsFwpG8NXyKQKB2h2XUqWnOFzSRiZuFzni/Y6Te9aM/e?=
 =?us-ascii?Q?PDRZJ7u336mtpOcQ+AJGtcJZ2L2nBFFJOyS/xDyiaupkbSdVc1SmhHd2LXSx?=
 =?us-ascii?Q?vPPhqOOqeXYPP7fzbnMZ7PIC0EMB8i3GQs6pAXjTVv68BHzkMrf8sCAkwOdj?=
 =?us-ascii?Q?iEwG1dPWCmKbBIwG7C/Fginyepw5dnEkoAE76x9Tx5kl5iA46X7RxuoxcVYG?=
 =?us-ascii?Q?l43EJml1JuGkL8WhAh0qRhvVWp+MnBIft1IhFF67DIh5VCyWLo0IyNbkKZ3Y?=
 =?us-ascii?Q?J/VRELoBv0OQ4jM6apBi662BYSuyP7mExYb7irSqUBZ2uvBZbugPboEAspH0?=
 =?us-ascii?Q?bBBkb3GfJmKvhyc0XfRZZuCK1681MhZWHXdz99/GkdJyyPoW29VruMWsNRVv?=
 =?us-ascii?Q?H1vF4ytB3bm2x0MbxwSGTv/FQUNvMTYJqQofqyAndd/8D5ul6ukC7Vx1ULie?=
 =?us-ascii?Q?s0+ijudSBpsXt9149/OGFnKkOBo1deKBrFad7QOqJler0R4BNboLAN/ufppz?=
 =?us-ascii?Q?6a98G3PQxr83BB0IsPtxRH4ms1djQRQmOplZ8PBho4LbuUk4P+irr7qyG2eL?=
 =?us-ascii?Q?TU0v3f9SMqxdm4VeSnrL43iEg4jE72cDcGQK9D2qCZ92/usp3+zj4KBPyCtR?=
 =?us-ascii?Q?7seIW7mf1e1pqqbHYCixpMtvY+a59sBFN1r28CEoAIxi52tOKytbKHuKAwfO?=
 =?us-ascii?Q?fqXB3f4zirjS426+MKswz9OIOs+Q221o+it69azfwfMRMcEFWTYltP9EiN1X?=
 =?us-ascii?Q?fnyXIipfXruEaitVjJRbJRwz6h4axI1r+GzGfNUDCGXCrcdiKjcmvHyHc/FM?=
 =?us-ascii?Q?RNzTYT9Op3T4zTRMnqydlXTSv5u8xmJHtitfsDsxG9Oo13+Niz2thlkCXqub?=
 =?us-ascii?Q?ddJlKK/AIjYNzqnZmmgI44SITy2ueHj5axm+c77ea7ulTTnkznDdfAESB1sO?=
 =?us-ascii?Q?imfs5QXaL0QSJ4vPAFA7w5qylPR1WlevBodKMjfASL3CzY5cp0rVax45hoGo?=
 =?us-ascii?Q?j6sSY94ZJeHnSy1ZuJkYu8WoKRNXI8C9HmFRgqR6qaeKeFh2FddNm3ChK/3x?=
 =?us-ascii?Q?7bwWszYRKWLygboehlZCj62dA7MQhtaiHV8WOQHtrWXj3920U/dnwm+0CFnQ?=
 =?us-ascii?Q?u1RqIeECFKvwUMPByhz+ClbnTuEAL7+a?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 12:12:01.5941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43aac748-ee4f-4754-1291-08dcd3ed461c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8322

Add support for handling ASF slave process events as described in the AMD
ASF databook. This involves implementing the correct programming sequence
to manage each ASF packet appropriately.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-amd-asf-plat.c | 103 ++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
index aa85e10a3927..1beef717ef40 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -29,13 +29,17 @@
 #define ASF_CLK_EN	17
 
 /* ASF address offsets */
+#define ASFINDEX	(7 + piix4_smba)
 #define ASFLISADDR	(9 + piix4_smba)
 #define ASFSTA		(0xA + piix4_smba)
 #define ASFSLVSTA	(0xD + piix4_smba)
+#define ASFDATARWPTR	(0x11 + piix4_smba)
+#define ASFSETDATARDPTR	(0x12 + piix4_smba)
 #define ASFDATABNKSEL	(0x13 + piix4_smba)
 #define ASFSLVEN	(0x15 + piix4_smba)
 
 #define ASF_BLOCK_MAX_BYTES		72
+#define ASF_ERROR_STATUS		0xE
 
 static const char *amd_asf_port_name = " port 1";
 
@@ -43,10 +47,71 @@ struct amd_asf_dev {
 	struct i2c_adapter adap;
 	struct device *dev;
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
+	u8 len, idx, val = 0;
+	u8 bank, reg, cmd;
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
+	i2c_slave_event(dev->target, I2C_SLAVE_WRITE_REQUESTED, &val);
+	for (idx = 0; idx < len; idx++) {
+		val = data[idx];
+		i2c_slave_event(dev->target, I2C_SLAVE_WRITE_RECEIVED, &val);
+	}
+	i2c_slave_event(dev->target, I2C_SLAVE_STOP, &val);
+}
+
 static void amd_asf_update_bits(unsigned short piix4_smba, u8 bit,
 				unsigned long offset, bool set)
 {
@@ -212,9 +277,28 @@ static const struct i2c_algorithm amd_asf_smbus_algorithm = {
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
+		amd_asf_update_bits(piix4_smba, ASF_SLV_INTR, SMBHSTSTS, true);
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
@@ -228,6 +312,17 @@ static int amd_asf_probe(struct platform_device *pdev)
 	if (!asf_dev->port_addr)
 		return dev_err_probe(&pdev->dev, -EINVAL, "missing IO resources\n");
 
+	INIT_DELAYED_WORK(&asf_dev->work_buf, amd_asf_process_target);
+
+	irq = platform_get_irq(pdev, 0);
+	if (!irq)
+		return dev_err_probe(&pdev->dev, -EINVAL, "missing IRQ resources\n");
+
+	ret = devm_request_irq(&pdev->dev, irq, amd_asf_irq_handler, IRQF_SHARED,
+			       "amd_smbus_asf", asf_dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Unable to request irq: %d for use\n", irq);
+
 	asf_dev->adap.owner = THIS_MODULE;
 	asf_dev->adap.algo = &amd_asf_smbus_algorithm;
 	asf_dev->adap.dev.parent = &pdev->dev;
@@ -239,6 +334,13 @@ static int amd_asf_probe(struct platform_device *pdev)
 	return devm_i2c_add_adapter(&pdev->dev, &asf_dev->adap);
 }
 
+static void amd_asf_remove(struct platform_device *pdev)
+{
+	struct amd_asf_dev *dev = platform_get_drvdata(pdev);
+
+	cancel_delayed_work_sync(&dev->work_buf);
+}
+
 static const struct acpi_device_id amd_asf_acpi_ids[] = {
 	{ "AMDI001A" },
 	{ }
@@ -251,6 +353,7 @@ static struct platform_driver amd_asf_driver = {
 		.acpi_match_table = amd_asf_acpi_ids,
 	},
 	.probe = amd_asf_probe,
+	.remove_new = amd_asf_remove,
 };
 module_platform_driver(amd_asf_driver);
 
-- 
2.25.1


