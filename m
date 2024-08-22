Return-Path: <linux-i2c+bounces-5687-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F08EB95B842
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 16:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E3F31C224FF
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAEEE1CB154;
	Thu, 22 Aug 2024 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3Rqoe2fC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E39A1C9EC6
	for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2024 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724336568; cv=fail; b=ub+8HlTo7tWdXRjomQrkuppC/HvN5Rjo/YmjHBDvcuTm+oZ+JU9nd32JMiQAfqKaKid4lPBRdkYZ5+/5QpQR0zmznWM6+yzjfptLRfRkXBJ3BE32Pr/ByPAut8zJPRNle16xyG/RCX7vBfcHUU1qotuxMP9NVo04fWgLjLRrY24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724336568; c=relaxed/simple;
	bh=LB6ZTWnMoBRqjNCzWqczA7hgGGKuoS4EalCtC4k5vUo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l3MWHk4IPRr7Z+HwAkW6dSIVwCQ3KUUWHa4UZdevp1hamKIxS9w+YsgSxkywiZtL9J1tFM3wFB5OF61QmFnGqnRpSGBzv7Qj6yMZxxCiiHG39rkQugcdxZAAc40CbYIZArAxtTPaKaktVgNxcIysEz0S01AzATIRBIaasDyGTkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3Rqoe2fC; arc=fail smtp.client-ip=40.107.92.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VsnuTt7UUDJYX/69w2haqvheXu+rjxsKfhYSYKcvhWMmrt7P/7VkPDpdFnUoOEOmlrxlFIc27vR/tW8m+mSd78WBsBoqCKR1KrqY2O1NHCUC7oW2jr5JPQkvCdvJkj0ORg7h4TtO9jxdBiq/G5N3Z6IuRmjMpi638GBepuLaFc7s3guFMdRtt1PY0Y6yxakDVwyrkZpS9+yGDz4leaLiGLaZMZGmKP5Jt7dQM9pFKsyzCeCLxWaSGb7gxVT6aI5BnWL7cOXIXE83jiF1l3nG+vueix/dVFMDKjo/5n7SAT4aJAOVzN3/m/suck2X2ltq/lZmSZk5bTDvq7THsnqKvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uP55U3mWHViC9CzWxWkpj3ZPj+VTl22MLS3g5vIfmuI=;
 b=Z3PFgLeka4atxJVLmwpPCpl+QFLXaShcAeKvRWwVi0Y0jJLF/+45MsEgWYKXPkRc7v7gyKhZxgXeVG35fBj3zFAYlZt0wLRiWQm3beAWxebU1FeS3G12pRDHpdl1RZTMUYsHHP78uvnE64XVMoya0Wu51zA80O4PlKjTN1ipy8xfC3MhKpOBNl4H0xizWNDNgwH6GxPqJmi4yW/oC1rlYQaPAnkpxO2zCDW9GCDOAzAgbKHfzlCOZhk145SDdB7JjddhXppGnB5NR/35RJTgYFwDZNLgNSsHHhRDVH/83ON9NADQXPdaM/mkG0PHx3D6NLc9NYFhDYl/dWg9ejiMbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uP55U3mWHViC9CzWxWkpj3ZPj+VTl22MLS3g5vIfmuI=;
 b=3Rqoe2fChtpse+igumRtrlfZQBt9s88BymzL/nRsFYOGnrQCnbiqpkpO1g0xEdPt5xinqzIICDhqSclrlCiKoDG4KZFd0C+sQPE7KNZyO9OEFIPU6bpSk424+tsMep9lfVtWeAYw6tIQwjFEdba/QJ5RafULCGWlic2M4d6kjgg=
Received: from DM6PR06CA0059.namprd06.prod.outlook.com (2603:10b6:5:54::36) by
 MW3PR12MB4443.namprd12.prod.outlook.com (2603:10b6:303:2d::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.17; Thu, 22 Aug 2024 14:22:40 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:5:54:cafe::5e) by DM6PR06CA0059.outlook.office365.com
 (2603:10b6:5:54::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.22 via Frontend
 Transport; Thu, 22 Aug 2024 14:22:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Thu, 22 Aug 2024 14:22:40 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 Aug
 2024 09:22:38 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 5/5] i2c: piix4: Clear remote IRR bit to get successive interrupt
Date: Thu, 22 Aug 2024 19:52:00 +0530
Message-ID: <20240822142200.686842-6-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|MW3PR12MB4443:EE_
X-MS-Office365-Filtering-Correlation-Id: c36add2c-f934-4162-e85f-08dcc2b5e168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ycke6DBpj3adjMALiCGJAQgsE8/sF+zY55/nIt1EhZrZnleEM4uaiY/BcfF7?=
 =?us-ascii?Q?CKYmkc6todIzRlmEhlaqja/N71Hh2W5t6k3t72woqCrEPPweBvHI6Y1Tnma6?=
 =?us-ascii?Q?7noLdBqcgNkjlP4aKsfUxidnkYnt8WpT75S+UoktytSPXvSDdT9qBHpRWLZ+?=
 =?us-ascii?Q?2lgaYQyh7p7LKLhDC1xa97OJMLCVk2aidTPynu0rtc9X3IE6LiYogcIFMVp9?=
 =?us-ascii?Q?Z8/VsZhFv7DGg5Md49akotf3EwF/iR8UaQlltqucRz484uPh9eG+exyLis4H?=
 =?us-ascii?Q?8iTa9EtN+NL/JKOwz0fjTGtLesZ8NPvPUA8FAvQgg8FQfN8spf5BEh9EKr/y?=
 =?us-ascii?Q?zLGLMwCynMAFESnFf3CkDa2Ey+9+u8RehQ7An57WV8MO2z2lTYY93Xqm/K6T?=
 =?us-ascii?Q?/KySehxRP1vNkdamLHPkTpo1Pb7LlPyu6hnUwnoULGD/nfof5v9BtYEKX2ZM?=
 =?us-ascii?Q?aShx9sKd8ZmNgqRc9zZMDgvNy/JEuFToFhJNClGSoHTwkR5w4d1bMHejugXW?=
 =?us-ascii?Q?g6rhyYabt2txdOzX22cZqk/sU85/+vrwU3akKwn1eDwuTLL6TFH/gc+hu3BU?=
 =?us-ascii?Q?sxFNOa+MMG4aBr+kZ2ubCjg5jk7ZjSaKNXYDWPt7Hy1bZVWXaq9l4FCb0uhh?=
 =?us-ascii?Q?JRcMhkY52v4jJdvmvJdS8UuoXku4uBsBsMKqPIbOsUwkRFx1p4vpOHBV2aTR?=
 =?us-ascii?Q?g0HeY9tnSVPQ8U4JlgtiafMqLq6NWuxTJoULtfJohDucfFl+9BlhFsyQqySE?=
 =?us-ascii?Q?2UPTgl3t4S6ZB6azoZ9pZhqH9rA3xphAcgKcaAiMfWiFYDodN8aiuhfaPrhs?=
 =?us-ascii?Q?P6m5qYon4dsKZA+8KpOIullYXyUXGI1DySOoZQ3i1kZ3vCN6AJWOO1lMV39i?=
 =?us-ascii?Q?84ez275GubusmBW0/oGCEROOAulumTZ+GpctPEkmo9GlzKlaiH7D2T2jwejh?=
 =?us-ascii?Q?CkmaEVZ9jAOt6yxpysoM6rXpnM43soIau7fYpkhe087iAp1qatjD4Tba/DUS?=
 =?us-ascii?Q?LGVbZu8ZBA1DddvKJ1c7Jt26pL9/ZlK3SKtVnGYl7vYfQyTeZSG1K+1s1Pg/?=
 =?us-ascii?Q?1D3I+sbp53XxjPXSUfVNik8OSn85vFMqIp80mTaa6UMUyIfKFFnB6A801p3k?=
 =?us-ascii?Q?mAgXrOWDUXR/3iyJ/yAslIrhn0Cd0be++t72IHakZMVdlaawgR4ifulzgoWl?=
 =?us-ascii?Q?eYiR4OdT2K2V7vhWwcsIW1vbuW3gjxdhaCtAD/Xp5Z7no8cxFt57QMCFUE8z?=
 =?us-ascii?Q?yS1kEFfZ7HMl2C5FqjPx5zv7JN/WfOzzwvxgkfxuyALvLfmrYX4PvPTyHL4r?=
 =?us-ascii?Q?gR0bQBNkB+iMtRAeCK7AB3Bg0ycE/9SMI4NFA8DWvai3ycfTgmytN2PTTycF?=
 =?us-ascii?Q?ULxwhaPiCuC+Xgq3Erp8JTW8D2MgRQr57gt6jFTZJpEzFL+ZXqKb5dHeS9on?=
 =?us-ascii?Q?k9PrQN48B8kIQ6XoAYTP6Db2s4jF4GJL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 14:22:40.5448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c36add2c-f934-4162-e85f-08dcc2b5e168
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4443

To ensure successive interrupts upon packet reception, it is necessary to
clear the remote IRR bit by writing the interrupt number to the EOI
register. The base address for this operation is provided by the BIOS and
retrieved by the driver by traversing the ASF object's namespace.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 446e9235f900..146c0f31e26b 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -188,6 +188,8 @@ struct sb800_mmio_cfg {
 };
 
 struct sb800_asf_data {
+	resource_size_t eoi_addr;
+	resource_size_t eoi_sz;
 	unsigned short addr;
 	int irq;
 };
@@ -199,6 +201,7 @@ enum piix4_algo {
 };
 
 struct i2c_piix4_adapdata {
+	void __iomem *eoi_base;
 	unsigned short smba;
 
 	/* SB800 */
@@ -1281,6 +1284,7 @@ static irqreturn_t sb800_asf_irq_handler(int irq, void *ptr)
 		sb800_asf_update_bits(piix4_smba, SB800_ASF_SLV_INTR, SMBHSTSTS, true);
 	}
 
+	iowrite32(irq, adapdata->eoi_base);
 	return IRQ_HANDLED;
 }
 
@@ -1295,6 +1299,10 @@ static acpi_status sb800_asf_acpi_resource_cb(struct acpi_resource *resource, vo
 	case ACPI_RESOURCE_TYPE_IO:
 		data->addr = resource->data.io.minimum;
 		break;
+	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
+		data->eoi_addr = resource->data.fixed_memory32.address;
+		data->eoi_sz = resource->data.fixed_memory32.address_length;
+		break;
 	}
 
 	return AE_OK;
@@ -1340,6 +1348,9 @@ static int sb800_asf_add_adap(struct pci_dev *dev)
 	}
 
 	INIT_DELAYED_WORK(&adapdata->work_buf, sb800_asf_process_slave);
+	adapdata->eoi_base = devm_ioremap(&dev->dev, data->eoi_addr, data->eoi_sz);
+	if (!adapdata->eoi_base)
+		return -ENOMEM;
 	adapdata->is_asf = true;
 	/* Increment the adapter count by 1 as ASF is added to the list */
 	piix4_adapter_count += 1;
-- 
2.25.1


