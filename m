Return-Path: <linux-i2c+bounces-9472-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C78DA38354
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2025 13:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E85F01889AF1
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2025 12:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8750219A66;
	Mon, 17 Feb 2025 12:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5X24E5HE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173792F5B
	for <linux-i2c@vger.kernel.org>; Mon, 17 Feb 2025 12:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739796463; cv=fail; b=jIR0uFQw0UxLgoyJBJtTdxG7kY3/6qgHQ8UaLNK4GVL4tT+VDqckAAZHUIpb3e4gHVU5+lrGVGRYSqUh3DO7ddlfeHCb7Q+TedHfcEVHkig+xmLA68NQt3JDOrcsZJxfSNxuGRvYlkvJijn0Py4FshPcKROpeNOy+iDNKUK3beg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739796463; c=relaxed/simple;
	bh=YCEmLXGjHpfc0rlsWVNvzmiL3rncpFZZPJYeOSwQf14=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DbRTheM4Xh408H1CVW0I5kb/kAMMbTCwu67G2ub6OSd4tMKrtmfDLK1MCSNoemxFObWvJI2uBTPeXvuf7ei1di6tP/dPsCnqRHSwFmE0iVT/XTBrZPutR7X/4ymgEpIPK4s274b5MP4HIq3K9ZjTgzeE2P3CbOgdEYpB1u4vMiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5X24E5HE; arc=fail smtp.client-ip=40.107.244.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2TOQMX5Vy1gqYuI/WheIF5ZpSBQ7yvLFai7P2WxqmmoFEvMmBNjyu7MIyMtFCGuqNDtKCOAgML91iuFHlaHOnwh4Rr0zrzJcJdJRq/HPGpA2CEmKU6tsX6NAb6WNhV4p0eRnWIaJGBu5Pf78oGcI03QJg+TA3dFEAYTA4Q8Mhm8TK+j766SF39Ns6nesp+ecDsNltL+5r3arcanXbF8KxY2DxnFAHFKS0nU2Odw0ia8Ie5ULFtKCShELBPMv3TLmVydGrK9J0B53y1Yj86VSFLjByPKTAmvoZVnM+WEt72CzaZIuatlTJilXQAsChVgQ8sXB0bo1VO7DEdrrnZycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QW6Kx2o52/Xur1tRRJGGSalnQbKxqzimwT6INlaK9gE=;
 b=Nxd1LEz4JPaKRp8amFHs3kTGnF9Elqjafc0HAcqsqXmCVIqmRf3ss/qvqDOmBCxyrUTULiEVCUQueTnJUtidIyD+RWRpv8Es31l+m0fSdg9NsPczEgh2LitZZ+gmFZ1tvDX1I9dlPXlO4O54inla1SKcU8cpThEd1EM15mobRYm5TScsHm6wTcfe191cePIDvBlYP7HX4vnWA3MSpb4MmULMjMKFfDRQh4awArsgaLSFg1oOk+zFnZYtORUU1WJJoq2DbXETFsp3q7xd8hFaIiOf3f0+4X2ZSK6C/Ata/TK6F2HaVjdhegpY4qGzQ5HckmzY2/AQRevnp99530bU3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QW6Kx2o52/Xur1tRRJGGSalnQbKxqzimwT6INlaK9gE=;
 b=5X24E5HEUx31OT1ErggteUXurjPKcOV063+jifoITPhzy82pWATfEdg8QZGbk0Jc7UgJlv3v7BcIyVBpb3k2lQcPDejzR/SC38ur1H1pAQk6wfQ5GXRokbCzbupLKWwy8Vx0k/pK5Ua9VlIGAm7CmTeV6A4DT5wz5YgrUHge5ek=
Received: from DM6PR01CA0022.prod.exchangelabs.com (2603:10b6:5:296::27) by
 DS0PR12MB9273.namprd12.prod.outlook.com (2603:10b6:8:193::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.18; Mon, 17 Feb 2025 12:47:35 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:5:296:cafe::85) by DM6PR01CA0022.outlook.office365.com
 (2603:10b6:5:296::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.17 via Frontend Transport; Mon,
 17 Feb 2025 12:47:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 17 Feb 2025 12:47:35 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 06:47:30 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi Shyti
	<andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH 2/2] i2c: dw: Update the master_xfer callback name
Date: Mon, 17 Feb 2025 18:17:09 +0530
Message-ID: <20250217124709.3121848-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217124709.3121848-1-Shyam-sundar.S-k@amd.com>
References: <20250217124709.3121848-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|DS0PR12MB9273:EE_
X-MS-Office365-Filtering-Correlation-Id: a3876de9-88af-4e3d-9b38-08dd4f5140a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TQpNCpVemKZHUsyF9Sk4AX2kViUsD1FyXm7VrHIGZxPR1OjrU64Fbp/5FMLy?=
 =?us-ascii?Q?GwnIAcNoK52HqsVM2xGIJHgW2Ez6bxmnK3FZVKS71+J4m5CzzV9GpyMRYg7d?=
 =?us-ascii?Q?C2gy+QQvOUu5pCTtMyArtw9B8agjiIwcAzTBlULx6j9trsqU2EVo+YzS8WhA?=
 =?us-ascii?Q?WDWg4Wfhu79ssey/Y2WBvB61cT56rWTTBXHB/4KyEaWHtCp6d+DbXR2FGG5Z?=
 =?us-ascii?Q?ktTCnHKQ8dzd0vHsrbl3ctW4T0d66rL/chTg8C9PhIkOSUnq4TpIxkLKaIIQ?=
 =?us-ascii?Q?NDlW2Gmj9Y3/GGz2sJ1DJZXQrjgLFzaiRM7UW96lEsD9W1pinm2o9RPY9i0R?=
 =?us-ascii?Q?S+ILgq084qPhapxw6jCCXdUflvmk35ALFDCWX8LXKSGok076hurPQlqyCbDE?=
 =?us-ascii?Q?suDQnGQcGGvT7a0WVwjChF6sG8szWhc9l0m0U5sSzcW6vxtR6JH8Vt1LtaA6?=
 =?us-ascii?Q?VGz76T3wL81Ea10fARF2G/AnmA/rfrcuCxKBvK0XGCc124Cro96ibZVY0XSr?=
 =?us-ascii?Q?9jqHZp8BboLzPOIQYA/5RUsYVa7uGgtMgAsupduPgqLthxmDLhwhgssBrpif?=
 =?us-ascii?Q?ozuy42Nt9NHBf0kHjsw35uDLddQmlnjwdA/va41us2OLsfSGZOtiUzu2eSgN?=
 =?us-ascii?Q?hPl4EUDGvwKiz5JYxd8JR2/NWHu0jiXC/OQUPq4zvEc9nQqRz+2oec3PEBdZ?=
 =?us-ascii?Q?Kh1j3XU+QsvnQ5pCdRjZYhN1HlEUcqJoBPrp4StcOqXVc/OT8gbbnEt0A1et?=
 =?us-ascii?Q?tQXk1ZM7IZ9Bxht3L+sgj2VfLwngYm4mjjqO4jwPsue77vWXqqTGXOirfuAV?=
 =?us-ascii?Q?w5t0apIU99Rd/WEG7sJlXQ0rhklJIhUvRXyt6gd7C4oQVegHBpV/CdSueBFl?=
 =?us-ascii?Q?PFjXuf751QAgsffdTwOJWtTl8vSame3kiszbOC/5Md/nrIwm3u3kDpF1Tp6D?=
 =?us-ascii?Q?7WjPOqzVrlQvEQa9MtePw5/p5iOdv/rLgElLTBtHdnNBPBM92XBLowiWeBGM?=
 =?us-ascii?Q?8mS2sD2qGLotTnj+6oW3ao/vRr1MDBKpg8I2HXHkdr0c0c5r+uQsCdgZrg63?=
 =?us-ascii?Q?f9FLx1JUtUphJKMgClzkYzpMPdGMDQsRM93L9XXuck5BRPyD7HnO8xhrdRQV?=
 =?us-ascii?Q?BofvdikhD0Y13EidqBTCiROb5kzo/P9+fKPW2LF7FCMATMzt3ChhBeOjDiT5?=
 =?us-ascii?Q?hZWwwPJMkYQRADYUY2MXiOKM6ev2mbE0keXshhjpyoFhdKRzhzfQ40sihTYM?=
 =?us-ascii?Q?eUjn6A/abRib54dXvEG5XzyuhOVs4fTaqfM1XxZdn/bKJMJuWVX8rqbVYATD?=
 =?us-ascii?Q?aslNYSPAVSrMxzUpYoH39AxKJLb0xESBi5ePeAgjmb/rc56nnnlO/v0ziHtV?=
 =?us-ascii?Q?deLnMWhUseAAqnD6PX5OZP2JP5dH5AmEmm2kt6rFXgqUKat89wJgT0mQtDkC?=
 =?us-ascii?Q?wcW3F1Uh/0S32AxgxJdfR2R4NF46FmmzkrwIAZ4jX/ZaDjSyLEYLTVXtRjOI?=
 =?us-ascii?Q?WyFNSTe3jsvj3uM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:47:35.1121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3876de9-88af-4e3d-9b38-08dd4f5140a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9273

In light of the recent updates to the i2c subsystem, ensure to use the
correct callback names. Specifically, replace '.master_xfer' with '.xfer'.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 2569bf1a72e0..c5394229b77f 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -907,7 +907,7 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 }
 
 static const struct i2c_algorithm i2c_dw_algo = {
-	.master_xfer = i2c_dw_xfer,
+	.xfer = i2c_dw_xfer,
 	.functionality = i2c_dw_func,
 };
 
-- 
2.34.1


