Return-Path: <linux-i2c+bounces-5686-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7967D95B840
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 16:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C9F5287333
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F1B1CB31B;
	Thu, 22 Aug 2024 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OmSEllsS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7F81CBE89
	for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2024 14:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724336565; cv=fail; b=FpQaq/w8J7LVNcCE2/HRWdTjd1X4XgTNlrqLYDW6HnWvjCY/UglvC80g8ADKHnh7wQXw4hS2bouJEiuXT8JbuGt4xMakJOqtzBOp8yquTqRoh2FsRtPDfNtbvVVqHX5rM6OlmutPMTO5rHiUcbVPm7IqpcN6Wgwfw0u8ObPxARs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724336565; c=relaxed/simple;
	bh=HfOSyF/GbrssYSa6+x4Gpb8Y4OKwxyARgj8Yc1uFhAI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UHRMFY57D2aWjpHWe1qHK4euUz+P1AMUJuYud2x9xfjOpboP4SDTdsZulMOqNmcl1XOKsYTKj0NDLLL+bc76eVa0daRLSljA8mbmIiIygZ8kzZ0eSdXseOXGRhj1fx0W061bHebbUT0IjEM0tJgRr4kNwZPUPJHwL1E0Bf3yHzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OmSEllsS; arc=fail smtp.client-ip=40.107.237.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGiv4XNUvbDCYCdo/e9tWrpf8HCRtNJUpXP5u6EoBhiu6l1iMRf6jxb2PNSAfvii8qttUuy9Vf+f8AvkYlXBH3ppkVO7ffiuJOSBSNRijFznIT/xTYYJtsu7tNqMJ8FZfK0kl5FgVnq611m3jUdTmAo6w5z7uX4IcuNXunVPPIZYR53hysndS+3HXyHdmaKehWI7QGjGcpQ+9EsTzAf4Ruc2oRiBEpOPfYCCvCr2BB1AGQymhjJL6RsrshYPleKr+BxNrxF5mBUYy3LDFY2fRGuT9AiRJJF5W/3b8bf7ycSl7PdHq8m3tqV4kWfrntF1iDyVwxOnDh2K8yfi87zDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AY2XjaGb1r3S4fNB8tull9MnpxrC052jUv/jK0Euf7A=;
 b=mz8wzMokX9lYT/mxwAILHJdAzM6jDTWQbmZ3pWHxxHCDlOJK+Hx74SQBaYl3LwLwg8A2e4dKtLOu4HjoqOuP12Ot5zk2sfm1vCv10lbSh2Yn0H1iFZ+BU1LtS/AYc1sH+GA+axXtxghqGkEOVfeU7BhOr3MUUQ4GjeU3n8Z0NulIBxwdwINapRxvQ1pg5C8J4PVpCl7FxxrmAUiKl7xIhMPW/WwElQYFI7fn9fppTEEJbZXZpbdGU/PSDIhSEH2a8ZOlhtt3uxcfgw9+dY+l8o996djj299Rq2+h+26OS96LNnrGdh4DisxP/KogW7Oa3vK+NufVzr3dmsUPz8AN1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AY2XjaGb1r3S4fNB8tull9MnpxrC052jUv/jK0Euf7A=;
 b=OmSEllsSxQtIltiPoud2/n3Uvr6rJbsMz01XSbFOO/ex4eeW/aj0gbMy3ITvYLEX3wpMj6mdmvRx309A6maYjTxn8xLYSDRySIyon0SI8qxVu6mfacSHW8dVbjAgCDGORWmfeoIhhCK8vVIqn45uZXWCgE/X0WyUsizRImZw9sA=
Received: from CH2PR04CA0003.namprd04.prod.outlook.com (2603:10b6:610:52::13)
 by LV2PR12MB5894.namprd12.prod.outlook.com (2603:10b6:408:174::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 14:22:38 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::c) by CH2PR04CA0003.outlook.office365.com
 (2603:10b6:610:52::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Thu, 22 Aug 2024 14:22:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Thu, 22 Aug 2024 14:22:38 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 Aug
 2024 09:22:36 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 4/5] i2c: piix4: Adjust the SMBus debug message
Date: Thu, 22 Aug 2024 19:51:59 +0530
Message-ID: <20240822142200.686842-5-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|LV2PR12MB5894:EE_
X-MS-Office365-Filtering-Correlation-Id: 766bf9d8-86d3-4ec8-597d-08dcc2b5e02f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xm/tApPH+nfNg5l/h0nzVoN1wqKel/sNF+XihR63kLOfeYtbCmCftz/CMroE?=
 =?us-ascii?Q?4WLtMsqplFZ2N5DyGoqecn16lD0BG8xLFA2LsaJ6O6KeDc3GmMbgt3oc+Q3s?=
 =?us-ascii?Q?gknn2Vuig9nCWBl6Bbtr9fwVg9Ln4+Z3TYiVjc4i+IpYNubEOoo5zCXwY+s+?=
 =?us-ascii?Q?bgkAXLV1dJ3nqk54nHgWTxwWaz4bDMmGQ4WHK3ONN9nESEmTiam6Zd0wfvrI?=
 =?us-ascii?Q?5r73Wohgv7zFKVdmj4QPm/LxqTzAhLaaSkjsLN3o4bjUQAYeLBYNBT+FXKik?=
 =?us-ascii?Q?/UoTI8enbmV8kdvn9RANh8WoWTZYOCQJX3FsMdFbl8H6Tg+sW91QqtKfa46V?=
 =?us-ascii?Q?HWkK/hKuQ2OIBsQCKGPK5r/vB5RlPUgMshtESXIIYaGZKTcjhTs+PXJDnrJ/?=
 =?us-ascii?Q?WAW24zw24JS9OstHWyeZZrR+EqiioIQemtAu2cL40Q4nFouMZBldjDyXCUwV?=
 =?us-ascii?Q?3yz4PMZhqShoxP2sQdPP2wMdPOTRfzr4suHlDAERqxImTfX0UngK5uWffMDj?=
 =?us-ascii?Q?4yVLecFzvqTGYpxblFDhGVBqlJ5h6qjOJNX+u8fOZ3DL0ZmBHdz3csmoJrJ8?=
 =?us-ascii?Q?FkBIkeLHJ4p1F+glwOWnOlbrTeFPT27g4p6Kr2HPuCnbgkUM4KWbk8BT6pgx?=
 =?us-ascii?Q?Ra4aElS6jgz7JcejVtOZwTwRhRW1MGkaEPaYdEBhp9DrvfrO/xezw6RJtwV3?=
 =?us-ascii?Q?OkpIJvQ0FYQApNzd0UkKPXq77QJxGZG7+zu8PhmEmBLGBvo3/9FMfOEUn4FQ?=
 =?us-ascii?Q?XH/W6qVK65r2SX1NlouXu7M7yYHtTvXurGqdZh8VzsM8ZGI7zdYfvg9LLTiF?=
 =?us-ascii?Q?lvDBE0/TFSSGbsRMXoySOy2WgJDvHLcG/NV16QywadnNTOVvlJmu/YT4XVZk?=
 =?us-ascii?Q?p9CGKfChbp/rIsNB8TUEiv0Q68ow4D77gPQ0WQu86Hy2ry4iu4YH0bbbBin7?=
 =?us-ascii?Q?gQPwQxBUcDZTkRmlNEUmpJeVyVK79C9oRtKweBH8OOd11tF7JcRK5oUARGNZ?=
 =?us-ascii?Q?VYx2ImNM/2pSxfBHyIlAc1qq7wNJz8q4H2h67ODh+x/3GtW9EZEXfW6DTVHt?=
 =?us-ascii?Q?29/3mnIHj+HuXhh9YWRBWxfxHU7aWgQeaP/eRgLlXgQ05YnfnNYrWqXRq07s?=
 =?us-ascii?Q?40vPgyR1Da27XC21YmPQytVz7YvEoqRO38EOdELAXw2/OQZ93czza2DU93Cx?=
 =?us-ascii?Q?IGtEGQrFJBxBnZAuyAsC4iDQlFaxiJRmf9Khd9mo/26QxQzxOBxkCcJ6HRrQ?=
 =?us-ascii?Q?0Y+Uf37riQdYQu8lVGKC54RKTyvFIv4WJDo0zUdvl7x4UMnRvqzfDVQrIqO5?=
 =?us-ascii?Q?kXltn2m2LEmq72LKoUHCJh5LhFk0cqOLKvtPg4xoiGld5suFumK5FScnNWRC?=
 =?us-ascii?Q?1NPyped+yLMifnv7FRsn62pmo9p4VBD/sHeRE7R9WbHiwLoGhQxZiV0Elp9a?=
 =?us-ascii?Q?SRgDcw08xRyeDsEBJNF502J6suNCHJDC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 14:22:38.5055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 766bf9d8-86d3-4ec8-597d-08dcc2b5e02f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5894

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
index 00fc641e6277..446e9235f900 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -1194,6 +1194,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 {
 	struct i2c_adapter *adap;
 	struct i2c_piix4_adapdata *adapdata;
+	char *node = "PIIX4";
 	int retval;
 
 	adap = kzalloc(sizeof(*adap), GFP_KERNEL);
@@ -1213,6 +1214,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 		adap->algo = &piix4_smbus_algorithm_sb800;
 		break;
 	case SMBUS_ASF:
+		node = "ASF";
 		adap->algo = &sb800_asf_smbus_algorithm;
 		break;
 	}
@@ -1240,7 +1242,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 	}
 
 	snprintf(adap->name, sizeof(adap->name),
-		"SMBus PIIX4 adapter%s at %04x", name, smba);
+		"SMBus %s adapter%s at %04x", node, name, smba);
 
 	i2c_set_adapdata(adap, adapdata);
 
-- 
2.25.1


