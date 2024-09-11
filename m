Return-Path: <linux-i2c+bounces-6555-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E0F97513C
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 13:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1885E1C225C7
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 11:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B354A185B7B;
	Wed, 11 Sep 2024 11:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="V39yNySu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092A717995E
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 11:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055703; cv=fail; b=qf92ORnKCzf0YrzCGrzVY73ioIQc+6z7DRuJJWf6Zn2fzhZWCRAWpReOpteixORPRYQXf/7F90Reey4vJdlCe2sEcDusEfq0GDgOh+EuPIWpniycBRso6ZMm8korEb/o9Kkh7ad2JY8hAEhOrJwE9qetJUsE3CENI8/v5yCxYRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055703; c=relaxed/simple;
	bh=2UGAMhBqZGD5zT25r746PpJF7N5N3Hz+k0oJNb5O38c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A+S10kdXZvtLfMrISXDefiRd2rurXlVQuQZ3aOODVIv0lZ/u6+Iu9KBx81dmqqTi650Wp+wq3Y6I/fiQ2KJ9TotVHIlT5GgJHeolD7NoIfak3UknGHit0CongLTF5Qe2zNBdMDaEZyc4LYOPR+av50xpMlmEGvZJfRVEbttIW44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=V39yNySu; arc=fail smtp.client-ip=40.107.244.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omnCtr1PX2XjRp85XR1Ewln4XyiiYSQgKW1PkrMDbJeIZjcV8KJt5gATlnP59sgXvuJ8Ra0EA5EtPyqlC/3bLcXNsfTnDaYJhbjcjMq8btRzgkeu6McFj1n/eYR87hRXfw0aowHyzkguKse9qE8RJtdUrKlci/xERphbMqmarKjlivI7zosYPHDymeN/gXxeolrzOhayOgpFU6ZPMT4abvxMDv45q5ay9vZGX/+5Q8dq4CbghrNrYCUd53qfvhqZouZ6s3KEvk3Jh11FgAUR1iUhqD7Xfe0hhRCjQtLkEOGZNJcE8CXTOzAiz7btCs+Q08AT0zILZbOCQnMpZyR41g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28KHTMUMzZ/U9yIyldI7n5jU4CGGKrocQ0FI5CW4oYo=;
 b=ZOxzn6Yul68Ng9k4LxJALpCtIi0Afp6vJ9DQxofziNgU2MC0j1rVY5jA4UicF52P45N2w23iGJBCFh+PVgrv1u1jqY6y/dLIvnFDecB6zuc06Fx/XBw3CN2sHeB/g530c1igtUmjRyfhh09fqGxHLRyqtHzvODPNNnIB6ngv+mu18btR7xSVRs9+tr3EnaVegzufDoC1bqqBdOq6fV5Gflbqx4pCi8RWSytUqh6DSHiAW/PoQchnkLwDKNVdRKxCT12hjJpg2IqrECiSgF0QvYe+1Xkz97v0bObTsIMhvDPp4HCpBmNM7erbki31kUFZ02/WKG8YPj7M8dRKGmvzTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28KHTMUMzZ/U9yIyldI7n5jU4CGGKrocQ0FI5CW4oYo=;
 b=V39yNySum987/pn5r2mJsfiRp10cNJOi5aVbLEo+aYDpgbbMLOhyjzTvR3K9s2RyYOrtAdnC7HFN1NTnkyefMPpF/XnvzLaiyNrd64GCFdvclcPiT7Ef5bSQtkJtS1q0mrc1kEDJoGt0kRITyNRjxoeD8Rmt5vF1C8CVcW7mE1I=
Received: from PH7P220CA0138.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::31)
 by PH7PR12MB6933.namprd12.prod.outlook.com (2603:10b6:510:1b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.26; Wed, 11 Sep
 2024 11:54:57 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::fb) by PH7P220CA0138.outlook.office365.com
 (2603:10b6:510:327::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Wed, 11 Sep 2024 11:54:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 11:54:57 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 06:54:54 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 7/8] i2c: amd-asf: Clear remote IRR bit to get successive interrupt
Date: Wed, 11 Sep 2024 17:24:06 +0530
Message-ID: <20240911115407.1090046-8-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|PH7PR12MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: d9489dc0-96c2-4cbb-f805-08dcd2588eaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yFjyIQ1/hgYYjTrudNkV3SWDe2eqEGL22a6GBS/PP8t83DOAJ9IbsCN3WXeh?=
 =?us-ascii?Q?347TlnBoKnxUv2l49PeJtHUxdbhPd0H4z/vasJqoP0JKCALTb3n6s2KiDuL7?=
 =?us-ascii?Q?mdfy7W6xhLee54toIb5OIejZeuGSNLIHYCRZkxeWtgYDq/4966zA6+Hw4sGa?=
 =?us-ascii?Q?5gyL9SeQKwpRptE5AXd6cTrAsF7LwPd+AjjD2hlGeUe/23Fma4lSJgLY8cfF?=
 =?us-ascii?Q?MQ1zqaFJqf64OLOzQyJS0eHoP8epoc6qQz7Vkb5ESITfHet29Z/+xpvWp8/X?=
 =?us-ascii?Q?kgNY152wMPc9otQP0l8UQhvtOBhleikfTNi9eJeUyiAWwNilFtSPk6hsiVGK?=
 =?us-ascii?Q?EWF9BS9rK7oLaFSAspO+owxirBSLqA6rTcREFU9Th2A6hKODXt9RDOj0xu+Z?=
 =?us-ascii?Q?FgCrb6UhAzLZYy3j53g4qtfTQdJJmAb1k4Nl1t28lsIdzoj6M/Kygp+3Xb99?=
 =?us-ascii?Q?HiFZ8InNVh4RpuI1RYyuUIYEa8NZYQgnXBlWbxPPdPsGc7KAihBRAQ8C1ZYb?=
 =?us-ascii?Q?oRn0nt43ako8crSWc06jp+XXcXUKfFvVlSx4xMghY2KAsu+TXYuBk7QigfqX?=
 =?us-ascii?Q?CroIIfp0BcdWbk2HuOBJiQju+i7UBcfqNsch25CO1LMCYFvPQ0GX+9l0XMAU?=
 =?us-ascii?Q?Tlhy7L6a0rp97qROuEHeELa6gLLncA+ghdwCZF0ITdyCDWR2rNJbGSojZ0J/?=
 =?us-ascii?Q?NbJlDhm34EknOC1C3p02Kro3Ba0tACJxirNHKbB2bgXfoT/ngmRZf1Iv+ARl?=
 =?us-ascii?Q?U2NfhhvE7as3cs3qKAjpVH9KAO9NEv5M3m7DQuSOLO+MOL4wPaCG2QLJ0Kv3?=
 =?us-ascii?Q?QKOo4KDuCnIJnRAa4oXsxy0xo3dMRvX9iSQyxPLbCCaOW3tkyvkqr0TtJuzn?=
 =?us-ascii?Q?f5vkWtsllcaj3DUH9xaNlS5s5dBebpzPOBu+BxOlRpuLG8xeDKihA3+O/HuX?=
 =?us-ascii?Q?nYqjg32MeacW3NbgykNJuv+FHPCwVQeYj2NxAoCWw15pxcr1nmieGjewFvai?=
 =?us-ascii?Q?2dSiFvn5L55nFpaEtU4xPubKgbnVTTGnIxr8N3mnLEuDmvfkqLR2f+3LylPX?=
 =?us-ascii?Q?vELnmM9BVmFREjYHTya6Sb8WWI6ZzMtMOa0wnvN/9NDKayiguVBdBe91pb+N?=
 =?us-ascii?Q?8I1xjxPXHo/PTn+nYrTx5qV+io4s+lxlsnmJ7THDXbDxNMT4UPhSvQHCPCiP?=
 =?us-ascii?Q?WDxS4w9em5zpCrSKCOjueI4KaD9oZN//BDGW4RkNAqpm2c0oOfFWg43qkAmM?=
 =?us-ascii?Q?4iSp8P3WdmWO7s5nzmrsSlNT4llDcaNmoz6uAdBlzunB6WnAFANZJyFwoucz?=
 =?us-ascii?Q?Rj50Kql+/gIwGg1nSFX+TWCHyKZH2DoxdT4L9UkKWOYdCT40uw+eDBpnq/jt?=
 =?us-ascii?Q?/mUSq5kTEe7uvklpfD05DlkvVQizTR2F3D5Af7tjlV5oE0sOIOTHYcuxDyzu?=
 =?us-ascii?Q?4RkOFzL/FCIjWQuUhH3We42UC841LGlj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 11:54:57.0743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9489dc0-96c2-4cbb-f805-08dcd2588eaf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6933

To ensure successive interrupts upon packet reception, it is necessary to
clear the remote IRR bit by writing the interrupt number to the EOI
register. The base address for this operation is provided by the BIOS and
retrieved by the driver by traversing the ASF object's namespace.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-amd-asf-plat.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
index 65904fa895dd..c1b1846dd2b0 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -40,6 +40,7 @@
 static const char *amd_asf_port_name = " port 1";
 
 struct amd_asf_dev {
+	void __iomem *eoi_base;
 	struct device *dev;
 	struct i2c_adapter adap;
 	struct i2c_client *target;
@@ -288,11 +289,13 @@ static irqreturn_t amd_asf_irq_handler(int irq, void *ptr)
 		amd_asf_update_bits(piix4_smba, ASF_SLV_INTR, SMBHSTSTS, true);
 	}
 
+	iowrite32(irq, dev->eoi_base);
 	return IRQ_HANDLED;
 }
 
 static int amd_asf_probe(struct platform_device *pdev)
 {
+	resource_size_t eoi_addr, eoi_sz;
 	struct resource_entry *rentry;
 	struct amd_asf_dev *asf_dev;
 	struct acpi_device *adev;
@@ -327,6 +330,10 @@ static int amd_asf_probe(struct platform_device *pdev)
 		case IORESOURCE_IRQ:
 			irq = rentry->res->start;
 			break;
+		case IORESOURCE_MEM:
+			eoi_addr = rentry->res->start;
+			eoi_sz = resource_size(rentry->res);
+			break;
 		default:
 			dev_warn(&adev->dev, "Invalid ASF resource\n");
 			break;
@@ -346,6 +353,10 @@ static int amd_asf_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Unable to request irq: %d for use\n", irq);
 
+	asf_dev->eoi_base = devm_ioremap(&pdev->dev, eoi_addr, eoi_sz);
+	if (!asf_dev->eoi_base)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "Invalid remapped address\n");
+
 	i2c_set_adapdata(&asf_dev->adap, asf_dev);
 	ret = i2c_add_adapter(&asf_dev->adap);
 	if (ret) {
-- 
2.25.1


