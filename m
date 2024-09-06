Return-Path: <linux-i2c+bounces-6303-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 244ED96EBB8
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 09:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2C09285316
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 07:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F8613BC0D;
	Fri,  6 Sep 2024 07:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="x2TIgsT2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D53D145B11
	for <linux-i2c@vger.kernel.org>; Fri,  6 Sep 2024 07:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725606794; cv=fail; b=ay41Eog0CG9/bA/CxKHGsraisWQlu/+7isYC0gMJGfvGmCCV2r6T4th1ZGQMFPpK19L5jsBHOS2s+y4g2dBauqHKtRbvLMFsfCVpwQHrEjYCg2KdFNjrk8hzxK0SQBCpY+HXWvSROZjHx7hwROyF4+g6TgKQhhkI4cDejOtklng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725606794; c=relaxed/simple;
	bh=7VPaH3zGADQn6/L/0lh3VI0v7AkfUq+w6ad7vzmdAk0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B/zxmYwS74iUXL/dwYtpgLral2Bt1Yc4XSH2CU8RQ3mOpE1qbGQPihLdYpKTnlrr5wKMJGLNN1PjGjBRFaQ1BgaxhUmkYQF8oJKh/nixGxwSusnBoWUhLPL16GI3b3QiR6IFnOGNg0EWwljywpWW19Shgtko3W8FaGc1BOfsRZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=x2TIgsT2; arc=fail smtp.client-ip=40.107.223.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFVO7uxcAEIOrcM9FiFfyiH2Png+rZL58PGyJ9eqUNVtuW1s7N7Cj4dLVcHTkm2Z9Hcy5BMiGbaJfTa1zznQFs1sVXg1IBFKgQ1yvTWdPyNov15TTWddiG3kIQ2kn+tjtEVOMvhyj7PANinTea38fPrUVYvCqZva+H26CfqxJ5H9hy/Ii8O7uiyyKnuePEeSQEOhReY3aZQsKOulPm4qhmW+ujMM/M8xpSG6/lVx4ngbHPnSfUDAcJIIlWXeNmeBFW4zuPqnjbXGFbdEhMMKCKfdP8Eq71UuBLYJ1RDmQs5/CFEzY9sqEfsR4OzVX9reThOn5Pzn9wJq/kzKB93ZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xX6oydbPK4poDo+jomkTAS6F5B+zwslOnQlC14UnVeA=;
 b=Xi+rLGBgYo9yeSO03yLIesaGcArfnXrHsN7Q/eSCq751ArmRu85Kp7nKulrMur1kaYXieLLFeHPatpLQmOf+kqZtgBS1LbDfFS1FAN7U7nkldsnrl98YWRUgvSaRs9ZMfQiHNwmXId2nej6NEg5pxzrKYLGNFkGMF6rJQGi/lZUn5RYZ6l47w9lhOyH2TnKBQ/BWMYfPALMSUueLRCIpLv+xuvu0P0DNwtNDRViNzjVaYsoBbWjZZgU/U2ibQ4+JH7nM+HoH62J/zxCZwyIQyvGAFJObpoynyGaqeIpC6RGLhJX4KfR8KbXMmMe1iRl/yF3UCoYfmRS2GsFqXJT/1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xX6oydbPK4poDo+jomkTAS6F5B+zwslOnQlC14UnVeA=;
 b=x2TIgsT2MdZJkh2+ypkqQYSCpMYAd4YZStlxaBiZHeL7E7Dy8RtWWlm0MNtQgTsdHOKHUSTB82Bmc9zag7lYMY4n+gnUqer5KjSm6FEu5XGHgALUGsAVcsUq7yPXDYOWCIcir+1a7kWvdD5n/EmRNaVGRgSH1nHIfewvNyeOnxE=
Received: from PH7P220CA0151.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::11)
 by IA0PR12MB8301.namprd12.prod.outlook.com (2603:10b6:208:40b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 07:13:10 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:33b:cafe::95) by PH7P220CA0151.outlook.office365.com
 (2603:10b6:510:33b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14 via Frontend
 Transport; Fri, 6 Sep 2024 07:13:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 07:13:09 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Sep
 2024 02:13:06 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 4/5] i2c: piix4: Adjust the SMBus debug message
Date: Fri, 6 Sep 2024 12:42:00 +0530
Message-ID: <20240906071201.2254354-5-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|IA0PR12MB8301:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d07886-febe-4229-65d7-08dcce435cd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?48Mqi5ja3snlP5+xyVV8joyOYcju5cWxl0UlmWZ4pkWIyCC1NOaa4LeL7L+M?=
 =?us-ascii?Q?BVSJlkkRiUp47Uv1bDzF+STD7JcBIrwa9YwNFKpCGO8aTzDL9eu56657gEkG?=
 =?us-ascii?Q?oqUpX3LI5mHi/a51tDyCmnIEZAgOWgo47YfYLkLpu5VPCJLgwX94aDBWuPYg?=
 =?us-ascii?Q?5p/XpHO3kAPmFOcqNtmrP4ZhPGRkNHHOf854l13B5GwATbaC2EK6zpqys0Av?=
 =?us-ascii?Q?CRs2QurdsB74YAH9Orl2xDV/seL9VJMChSfSKJDkrfmyiuAiTUIKSFfs6/GU?=
 =?us-ascii?Q?Juts99wBZWQ7FwMeiy4X1TS5GbAK//cdnIdd+Yr/bbrrc1OYmmYzj58mf8Hw?=
 =?us-ascii?Q?iKPv/B3nA8a70IbWRBIi4xRftt52Hx++WTdvzDVQspEeSpX4Yz7Cfdg3cc27?=
 =?us-ascii?Q?Crd4DoFBND5sFmX29dl5sQJPmXId3+dxXKLsVst3YPI18NyCzQ9IcDhuEOZI?=
 =?us-ascii?Q?WAxqfj3KdSgX9URJAJeAULObcke3+dbGI80aIowTKxRhAVua8FcNo6SNLTUW?=
 =?us-ascii?Q?2z27QckCleQyvIvUbMAhazTvtkOlWz0aRpKNHX9GzFg6Kj3ddAIelz/f1h1L?=
 =?us-ascii?Q?haw6W3LXG3L6Yxti2/Heh2AfNXvllSufHOqpBVZ2McDuEy//B89cPUI8Bs28?=
 =?us-ascii?Q?U5sVj/OrvoNslxDrHYbTipap+dDGuF/vBXkFR6DKQSprmAoBKOqO1yPbtJFB?=
 =?us-ascii?Q?UegP11RRtxhYjRuqYkPXF4Vo/KW8h/eOcNfVpANh490ScyPSZACygJADe4Fk?=
 =?us-ascii?Q?Erc239uRoTJTUz1M+zqX2+qIhe86VLlgMexqu35twSBr4v9yKqOwNoGK5+nR?=
 =?us-ascii?Q?nVb5NuDRnfAmSMFPqBzW2ZxmS4FUz1X5V0NEv1FdoENqsFCQl057zDnMTTQO?=
 =?us-ascii?Q?eiyOlhbAUuQmn/Z5GIgj+xTbIBXR3mGZE2lr4fLkBGtQy3HpUU8/3bWpt/J8?=
 =?us-ascii?Q?JLqr8ZcXyJwY4IGYMLYOAoU4obUJI7BSDbRVqJlv2QxbEbzlzMVxa8iSpLYR?=
 =?us-ascii?Q?pAazBbL6bmCvK0Hy74kWB0AMxk0HNP4I4lCCPK9+0MHAw7ryb5tNgXQ6JbH3?=
 =?us-ascii?Q?ys0Ab+W2ijEzH5OFLw5dVyeIyoSkT0XwXuFWLWdjHdy/3Sk8r/4I0HBHXhH+?=
 =?us-ascii?Q?hQ7VJjOBGl381dmJ0Jb5V9lpYS3UIWbh/vc/QIGEEIg7b40+FUIr0c+cR/td?=
 =?us-ascii?Q?Nav2RxOUCY6Ajj8IkQqDPcLjlZrF4TzogOxOkMI05Ou1TbqBQnJ4s3j28w0r?=
 =?us-ascii?Q?gweb0NfyxO+vapCiobWuHAXQzcGOnS8RNpZ4j58654LqaW35EnZLg2pqAp4C?=
 =?us-ascii?Q?RNz9X6W5miXa6nYtX7ZrzhdUEBg+ARJjqeVOoR09FaeCoW6j/+YzNflg7SJf?=
 =?us-ascii?Q?vLsyJhax8hV7HWZ+YAsPRnUhwv7Hf+n/79XEaDTesxaEMTpYurSKSN8qnN0a?=
 =?us-ascii?Q?2F4i75WmclFEjO1D4e11RtBu8FgRrz8h?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 07:13:09.3668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d07886-febe-4229-65d7-08dcce435cd5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8301

With the addition of ASF, the current adapter information must now
correctly print the SMBus node details, whether it pertains to PIIX4 or
ASF. Update the driver to reflect this change accordingly.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 2bf9611d864a..6abbaeaf2810 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -1195,6 +1195,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 {
 	struct i2c_adapter *adap;
 	struct i2c_piix4_adapdata *adapdata;
+	const char *node = "PIIX4";
 	int retval;
 
 	adap = kzalloc(sizeof(*adap), GFP_KERNEL);
@@ -1214,6 +1215,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 		adap->algo = &piix4_smbus_algorithm_sb800;
 		break;
 	case SMBUS_ASF:
+		node = "ASF";
 		adap->algo = &sb800_asf_smbus_algorithm;
 		break;
 	default:
@@ -1244,7 +1246,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 	}
 
 	snprintf(adap->name, sizeof(adap->name),
-		"SMBus PIIX4 adapter%s at %04x", name, smba);
+		"SMBus %s adapter%s at %04x", node, name, smba);
 
 	i2c_set_adapdata(adap, adapdata);
 
-- 
2.25.1


