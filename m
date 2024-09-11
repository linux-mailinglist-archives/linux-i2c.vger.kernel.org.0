Return-Path: <linux-i2c+bounces-6553-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F89D97513A
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 13:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE0711F28303
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 11:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0A018785F;
	Wed, 11 Sep 2024 11:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UfvymfNm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1458185B7B
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055700; cv=fail; b=PMisvzuzifhCL8vNLFJ6Gn4aodAQ256agf5Z306lGCaWucf7zUrPcvxDJGnFjgQojznj/3D5iORZ9YxoNXoSSW8e9MXTqcGvn8Xong7ldTbsEhwTidLI3R8kBkDO4VKxf2O1NL7WhvVI8+1J8IMJ5NKHGEU9WHGuTYp/Z520HZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055700; c=relaxed/simple;
	bh=57EPlpOpy89oUinXmHOwvdXAXRwKS0V6xED8ETPUhCs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SdtIHEhW5xDldht7Af3EAN+ltUq8H2EOPprDqDPf6OCyKltO2E+Bl0JoLu++E37i20v/PO/fO/6QbBQ9UxsyMXd3stjQS5rk5e6hnCxKA1qxN2oHK3Ne/Rvxkha46ZUVaCd+2MPeTKGlftZISf+AP9KZKTV4uYB5TAMDu5b/ZhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UfvymfNm; arc=fail smtp.client-ip=40.107.243.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUlRPYODymjS1+VZytF0Cr5YeXENy9vMpCDg/+8281GKmbYGNcbVCi5/wSiDaIiNPICJ8nV1S71kilFv8gkNGmYA2Rj2AWSjUXyh501Bhd+OiSNr8Xs8g3w17y94HSSPXnu459WYw7IrF1eKMWXcEP2f8l+8CJ9+ClL0JIC6AFs9gb6aCyQiVjifOkUkrJL4uwAOjn4cagIokTwT1dkuJR3cuN1oB+qHCnyxiWA82S6XKmUW5o+V5TnuISov/XCyI3FFRzeZVEztOLPpvoQgbtQ+74aNOsq+j8Xu+/wN+Bfi7t1GhRTENgGaqG8FHe1I0ty5dzc0MbqnZMnG4dko2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALIzYAu1StT3FqoSZSOKW6wp204ZYy+wQ5wihB0jEqA=;
 b=xK5ISuVxA9RHz+xd3TMgcVZlWVRo3c4qtG1FQ7m/Xo0mVY/jl/wPIcPOJ/QLT0avJbsy8jP60pwQ9UBOi04tOQ3a6Aa+ck0pExObmjqiyUYQu78wvf022pJiQG5KOY5rIFf1R0U2FdJELyJ1DszYZ/7n1H1fg0IlybtLSwrtVuht4767/sjzRBpCbWk9u43cA87wK55sjBRreSFA1Yp5lZfHz9/n3UuFF6hN+5sPpzz4XSdKKROIpzPBFwM0dACTuptTIjK0A/j02qn5+bzQ0Gwzgj1GAIiyllqliRTmf+E1/6KMWSzccZz7pTbBwGCkScwhlONzh9jTatmQmQHONg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALIzYAu1StT3FqoSZSOKW6wp204ZYy+wQ5wihB0jEqA=;
 b=UfvymfNmBFsD7EoQzBdo35bC7cuZEegrofxb1mUnu+gteYLS6k7luIh+rXYU51jtovrhf0QKFGcqJYb7js5bXWBXc0PKAZ0Z2lXUfVsX5LtARp3CKNsWMxTferLLopNPhu2XF9r6uqFOBY99VwGjT6SR58/+77tIek7btkXRPg4=
Received: from BY3PR05CA0032.namprd05.prod.outlook.com (2603:10b6:a03:39b::7)
 by SN7PR12MB7372.namprd12.prod.outlook.com (2603:10b6:806:29b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Wed, 11 Sep
 2024 11:54:55 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::73) by BY3PR05CA0032.outlook.office365.com
 (2603:10b6:a03:39b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Wed, 11 Sep 2024 11:54:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 11:54:54 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 06:54:52 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 6/8] i2c: amd-asf: Add routine to handle the ASF slave process
Date: Wed, 11 Sep 2024 17:24:05 +0530
Message-ID: <20240911115407.1090046-7-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|SN7PR12MB7372:EE_
X-MS-Office365-Filtering-Correlation-Id: 063a17ba-de0d-4d45-6b41-08dcd2588d20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vxvdondr71XcebewrWjwom6thTjNqpd1EyU65fg6RBLLMZ4F9N5k/l6xs17F?=
 =?us-ascii?Q?gyswQxUXtrw/2yLpXVsF7rQ4IlV0YSKvJFTMiMsEmlvus7110NFau8p43BQy?=
 =?us-ascii?Q?aSGjkCI8zFRFeND/fgKmYnsLGXzXgxYG6NuO6I6UhzeOkiWP2Wu0ZvKraJ/R?=
 =?us-ascii?Q?YMEV/hU/XMt6zP/ETSvfidPJyBvngj2Q0nuqAENJgBnoBUx/0UZKiyKmKfca?=
 =?us-ascii?Q?/dzsbsoqM/JXpdBVtEkG993/BWZQbPctY1d1C+0SKmtbk2nQn39DCefa879L?=
 =?us-ascii?Q?SeEceRDqIttWRM9X1vOjooyvIB1Pg73COhZOBNzMODDxbzU795f8ln8lxzTj?=
 =?us-ascii?Q?ybZ+EH+29z0jAdmn6vEGIFwIeItdP3HJLYVj/2onnFTwkYdYzIE6erwIjpJc?=
 =?us-ascii?Q?6TuJsSsOOwtRRA8Akg0JyPuKRbJjPJqEbasE1q7mmCO2xQa22JiznZYCvwDs?=
 =?us-ascii?Q?yhZqZ3uVxJtknmuzshNrnk03GaiVf8Y3k1BeSHaEdXm576jPpUJcQLct1xwH?=
 =?us-ascii?Q?6VE2931yBSX41EFoYzw3a1GCc7Qjw3CNxaOa46bM2mUySkjlvYgVXzeOM527?=
 =?us-ascii?Q?h45kdPTcLca6Tgm4IAV+7JOr+iAClM4NYdNrY4KlFs7BnPKsm9lazWVXwBmd?=
 =?us-ascii?Q?kd2WCMuOyAB0OVSG+WadJEM/7vsYvSE37oWKrJ7Dhz6yolTlTyJkDf+EED6r?=
 =?us-ascii?Q?EBI7pBuF2oR0840qKOd+ZbRRq/eizygFd3kvt/2jZ7dqd2sviMwp6fSNdv5n?=
 =?us-ascii?Q?AISQ1vafo01BEzi92zcaKpsreZzDhFfe5X9rc4kpwCDR7s87myPcLU8+IYbg?=
 =?us-ascii?Q?79O2J+T1fZtiLfgA0bW6ReL1nDIW9U4hB8955OLtaZfvXhtceMh0pjgblSey?=
 =?us-ascii?Q?FB0RN1sPt9SfG6ckqaVEF10+OGo7Z03ZEHTt2QP6uD829ettq1R5n7/3+HfL?=
 =?us-ascii?Q?Mrvd9lJgKGqzd4KuaElX3sceRlSf/2JGFtO5IefcTdN6BFlRATzRS46N9xWm?=
 =?us-ascii?Q?kClqoHYya1IblkBcrvwC3/tvrGmyINPAlteIhFKA2EK/gt7hmHHOQ4vfr8qb?=
 =?us-ascii?Q?Z/FgxYI9T2Jp7nlkg/KpNq9Fz9h9HrHZUSN7nh7ANbcbID3i76/P2UGF8bw6?=
 =?us-ascii?Q?p0nBm9aEWAXOuUtXAXRkwrGZyPsvEMLUaSw5HcSjsOS9rZtKs5bqTVIshHnA?=
 =?us-ascii?Q?Bo4yKRl5NtmqVEpuRagbaHSa8SkqpKtOAL+oxHj/edUyGlaJvrHgus4FInHq?=
 =?us-ascii?Q?VvLEJD/cIkG+dmvsiW1F1ExRqjfg0QatjRRalSWmL/gV8Jh8ZUFDd5bPx8NA?=
 =?us-ascii?Q?gBx5sZIGUxkPcnJD2iONgCp2E4ytDFzz/e754hVVcfioTck3KqFMAj7hibVI?=
 =?us-ascii?Q?oRNOWU6sZhYmjFNi4AWSIZtLcJj8QOHEaB3lCk/9ZtTHee7nKsjqRqctOHdh?=
 =?us-ascii?Q?ZGW+qp+PyoDsjkYC5hhz1abYzVT57rtf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 11:54:54.4559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 063a17ba-de0d-4d45-6b41-08dcd2588d20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7372

Add support for handling ASF slave process events as described in the AMD
ASF databook. This involves implementing the correct programming sequence
to manage each ASF packet appropriately.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-amd-asf-plat.c | 95 ++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
index 7afaf8a9440e..65904fa895dd 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -25,13 +25,17 @@
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
+#define SB800_ASF_ERROR_STATUS		0xE
 
 static const char *amd_asf_port_name = " port 1";
 
@@ -39,10 +43,71 @@ struct amd_asf_dev {
 	struct device *dev;
 	struct i2c_adapter adap;
 	struct i2c_client *target;
+	struct delayed_work work_buf;
 	struct sb800_mmio_cfg mmio_cfg;
 	unsigned short port_addr;
 };
 
+static void amd_asf_process_target(struct work_struct *work)
+{
+	struct amd_asf_dev *dev = container_of(work, struct amd_asf_dev, work_buf.work);
+	unsigned short piix4_smba = dev->port_addr;
+	u8 data[ASF_BLOCK_MAX_BYTES];
+	u8 len, idx, val = 0;
+	u8 bank, reg, cmd;
+
+	/* Read target status register */
+	reg = inb_p(ASFSLVSTA);
+
+	/* Check if no error bits are set in target status register */
+	if (reg & SB800_ASF_ERROR_STATUS) {
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
@@ -208,13 +273,31 @@ static const struct i2c_algorithm amd_asf_smbus_algorithm = {
 	.functionality = amd_asf_func,
 };
 
+static irqreturn_t amd_asf_irq_handler(int irq, void *ptr)
+{
+	struct amd_asf_dev *dev = ptr;
+	unsigned short piix4_smba = dev->port_addr;
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
 	struct resource_entry *rentry;
 	struct amd_asf_dev *asf_dev;
 	struct acpi_device *adev;
 	LIST_HEAD(res_list);
-	int ret;
+	int ret, irq;
 
 	adev = ACPI_COMPANION(&pdev->dev);
 	if (!adev)
@@ -241,6 +324,9 @@ static int amd_asf_probe(struct platform_device *pdev)
 		case IORESOURCE_IO:
 			asf_dev->port_addr = rentry->res->start;
 			break;
+		case IORESOURCE_IRQ:
+			irq = rentry->res->start;
+			break;
 		default:
 			dev_warn(&adev->dev, "Invalid ASF resource\n");
 			break;
@@ -254,6 +340,12 @@ static int amd_asf_probe(struct platform_device *pdev)
 	snprintf(asf_dev->adap.name, sizeof(asf_dev->adap.name),
 		 "SMBus ASF adapter%s at %04x", amd_asf_port_name, asf_dev->port_addr);
 
+	INIT_DELAYED_WORK(&asf_dev->work_buf, amd_asf_process_target);
+	ret = devm_request_irq(&pdev->dev, irq, amd_asf_irq_handler, IRQF_SHARED,
+			       "amd_smbus_asf", asf_dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Unable to request irq: %d for use\n", irq);
+
 	i2c_set_adapdata(&asf_dev->adap, asf_dev);
 	ret = i2c_add_adapter(&asf_dev->adap);
 	if (ret) {
@@ -267,6 +359,7 @@ static int amd_asf_probe(struct platform_device *pdev)
 static void amd_asf_remove(struct platform_device *pdev)
 {
 	struct amd_asf_dev *dev = platform_get_drvdata(pdev);
+	cancel_delayed_work_sync(&dev->work_buf);
 
 	if (dev->port_addr) {
 		i2c_del_adapter(&dev->adap);
-- 
2.25.1


