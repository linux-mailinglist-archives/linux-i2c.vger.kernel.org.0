Return-Path: <linux-i2c+bounces-10605-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA10DA9A072
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 07:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D72D24429A2
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 05:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D304019D07E;
	Thu, 24 Apr 2025 05:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="smiVdXAN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198A58F5C;
	Thu, 24 Apr 2025 05:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745472844; cv=fail; b=GF+Oz9OLhmXb1H117dTYYiCSYCfkAldGxs0gWipn4wsRhvbuFeT7QBKbPcpyuo4Eqscn+TO7QCGwSRHSfaa9dAk4YIoJjoPN1G8f/Jg0hFuElt9R9gGI/eMQN9Xoh8wClj9DPZ9yHf30H8RHmf+nVktcZ7UPaBc/5JXSMnb75pM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745472844; c=relaxed/simple;
	bh=zx3XgtaqzjznZauA83EPjORemynJVQ60sMi95/78lkE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OC3ZJ0vzsI7akRMO3AKNtW9bxrVylEGC5adKfjFF5WwTWo3VrLBpjn4yIwxguc5OaVcY0aQ2imFNvbTg/2DuYEIZTXxQ3BJ/fcHbX3Uw5kGyclTnA8TUkDXsNTvr5pySYBMeFEDq2cpQ2uh4iIHQ0RDz8DrPjkTUMwDixAxXoEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=smiVdXAN; arc=fail smtp.client-ip=40.107.92.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JM99ATB19EYzcuzkaUXF7PpKJMGYl8nQ70JimN3kacygOQb0LMknUqmfTI7qfhCuop7fUsh5QIk/DTiOLZ32sVAW6hY5n9mJn90NAf/vK7sNgaIfEaOJc+kJBy9hpx9ByPWAawjvcDTlANqnRxPB18BRwDLHVqw05kuvYuIYZDj2SRDm0y4J1wRj3W3/z9uhl78BNYulUN+5XJ4fsYnfKJVPoiIq/s+fQyOjswOaJgt/zGSOzdtptpwy4lyCBufC54zmZOua2kcdtVqxQTiLURQ1zMy8RoLmxPK3r5NWizHvkj70wZIXikd9SQgGtemIaFQGBMlONw5i3101fYYJfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnN2auT+5LLEeLzgKurinturUTdahwXIL4XZLKFRx5g=;
 b=IRbAHLtBI7JHexku06nUOFlCRjr5zizUeTEQ3IYKK+1l3oNDfw09x4IBfFbDHwcrJ1IfxsF19c0K+8yOJWK0B/bQhyEYJ5MfHKKZ88KEenwlSr+3+mj+adzg6jn22bAu6wyqXuu54Q9cH/nul/h4lUdIw4R9Y0LMVfnhyylKP5m/CvNRTZK13V23bcOluHqdTrIJ3w1rdSct9T4/Vq0k8RoseGJnaEMgzPdfCzUj5M4WO1S1vwaXV9CNXCSRhewM3QbnqmGjV/Y+bkMKPZCKpicRSyb1IdpWvYJVKXdNOdiSNlOH6sSHkAEgGcWzdrr/Ga9RS8nG53iWmkLgukyGiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnN2auT+5LLEeLzgKurinturUTdahwXIL4XZLKFRx5g=;
 b=smiVdXANZOw+QtWlRC6R0PfeoVMyRekyXy8C8AkNlH7idMEcBA+5atsxoOvU07xKW0AvCw3lTrF1rTUoP/orCFuFUZZWnrcCCE8zwf98N3BFldVn63YTl6BnJtA5yrMkenJ95NgjGkP2oKZcxAxCxBXLavQkleurn4ebMz8hpduhJvGa8qJ1HxtYTqcbpYM24Jlxn5L/HKvetJT0hA+BKbrvOiceohDe6iHDslH8cM03l8eYdqV5aPsBGU/510RcWBjurj8xXSomFlWhURrLzu8VjbMr3Sxt5Gau/UZ0STTVb/Pdb0W/cyTz9iPPFX9XXTvQR4ttukFObCc60a1Y8g==
Received: from MW3PR06CA0005.namprd06.prod.outlook.com (2603:10b6:303:2a::10)
 by CH3PR12MB8969.namprd12.prod.outlook.com (2603:10b6:610:17c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Thu, 24 Apr
 2025 05:33:58 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:303:2a:cafe::28) by MW3PR06CA0005.outlook.office365.com
 (2603:10b6:303:2a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 24 Apr 2025 05:33:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 05:33:57 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 23 Apr
 2025 22:33:39 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 23 Apr
 2025 22:33:38 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 23 Apr 2025 22:33:35 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <wsa@kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>, Thierry Reding <treding@nvidia.com>
Subject: [PATCH v2 RESEND] i2c: tegra: check msg length in SMBUS block read
Date: Thu, 24 Apr 2025 11:03:20 +0530
Message-ID: <20250424053320.19211-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|CH3PR12MB8969:EE_
X-MS-Office365-Filtering-Correlation-Id: 77359d3c-a66a-425b-d4e1-08dd82f19c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MwATC47g3drs+xdXbC8iyd2lqn7/ShB3qqVFbYbDMCwHxQ6l2OejNUxg+O5W?=
 =?us-ascii?Q?xHFwlJtu4xeQuRVNSg+ObjiCVNmd1vBe75vtMnw+EdJyi67um4PszuTNFpmJ?=
 =?us-ascii?Q?W6Be0FMomwk4zi3Btk5Kv5g8X4YriWJyTaeqgsMDaKbqBrfOlDiLJ6vFkBho?=
 =?us-ascii?Q?T3SWwa+Rbh8v0xDshEF44eVR0NDQ05vOJoK4L6FOaBzjlzbpoi5u7ObGNsYx?=
 =?us-ascii?Q?UIjHjKmXRv71DaRhSn3f08LKDhxx1zfoQdWCQLIPmyMFXGWTYQ5DPVRMF2NU?=
 =?us-ascii?Q?sNisPd2Zss3qU2dLdIS3InDZC+0Hx+hZrq3NRe/TmFs+Cj4nSEWaG0Kxsb1Q?=
 =?us-ascii?Q?fFYAZ9y+JY4q+6IWbzECWa5mhpJUIoG8xahnheoyI6zR/GhH0XrCHvJSMRLd?=
 =?us-ascii?Q?4C9qPJIkfLa8kv7W09HWFMFqvCCsc/F2QmvCy68qM8m1A9d439v3Mm5ZBguK?=
 =?us-ascii?Q?RHS9/G7RdpXKALGm0TVPvFLgbnkK2pQVk3nguv4n8x8l3h3/LQNhYY0EOJj+?=
 =?us-ascii?Q?3hgX4hIoxNK9QL98L8LeCW0eS21T2zXRLxmMgRz2Ipj9MihH5rVjq4Bfk2YL?=
 =?us-ascii?Q?t0SS0zLflZJE8s8usfvRPnQrIYHmjXGKtkU4S41AtWZxSVDKv+CzzNjboKQi?=
 =?us-ascii?Q?+BDweEaAG56BsT3C4QicTNAu4+ekSdMtl46EYLpmqNhrby6aCWIU7+0BGpLM?=
 =?us-ascii?Q?L5uvjmhjdle+pvii/MZSD09lobiY/gXrbaYfLhnZ83oaYiUWEWkV+RC9LIuA?=
 =?us-ascii?Q?8RPeKWwoZIgrTSlvDAcgPf4sqWRCReMgSXgkCJZ/JuO4+pzP81AEdQ/ti8Gg?=
 =?us-ascii?Q?vjwfF+mng23Ckn1PWgYZfdmOvK7Jj29ymxQl+5vYoLfNoJdKA+7Kns8NMYw2?=
 =?us-ascii?Q?P5SQ7s1JdTihwbnC6oImPcxMly2fRf0xOb31nl89hm+Csm++8QOyY1U/NPv4?=
 =?us-ascii?Q?/zCBs413VlUDL4Uesb085RHIxCGI1Em0VsT0j9u0rUPFpo2ObJlkjKDfmron?=
 =?us-ascii?Q?4tfrGRyEvrmWF210kLtAVo0WDcjOM8kOhf3gHlRGexB7B2V9GvCVWm86NKVk?=
 =?us-ascii?Q?DurF4E3MIdTr5T2LVnehHuOGBE19u3VRCxhyBxubGylbuzdTT9h7reCRhyes?=
 =?us-ascii?Q?jhvYSykJRFCdR1IBBQkoRlDPeoZr97BzjP3nmElQtf4EsdatL7YRrYhb470V?=
 =?us-ascii?Q?sFeNef6NNDNT/U/5Q3I52xMeFt7Zn7V0ZOZW87aPzmemeQ3k49TA6t51QGgn?=
 =?us-ascii?Q?Dl6mydji59LvKEz8dJsfMQeFD00eE1kloTRdq1KekFVB8erO+fpNN4DL0Toh?=
 =?us-ascii?Q?qetBIhO7wEKks8z9QeshoZZRWbiW+AodtlQyrSsMHlULEvMDKOQkYDl6JBVZ?=
 =?us-ascii?Q?7d4LRb9RGSb8RFNMUamt6xsZN74IsibOOGhiFBE7ZHFXz7/+RpnQA+FmQvgV?=
 =?us-ascii?Q?/JyAhYujvlYWbF3Fls5UjpEsi/qPYwoiQmic3QVWFaNVZzHkGyCh8sQX1Wzd?=
 =?us-ascii?Q?wSEj8dM5os3QApX5uOVaLA71M7Mj4ZPpkC8a?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 05:33:57.4966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77359d3c-a66a-425b-d4e1-08dd82f19c34
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8969

For SMBUS block read, do not continue to read if the message length
passed from the device is '0' or greater than the maximum allowed bytes.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
v1->v2: Add check for the maximum data as well.

 drivers/i2c/busses/i2c-tegra.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 87976e99e6d0..049b4d154c23 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1395,6 +1395,11 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i], MSG_END_CONTINUE);
 			if (ret)
 				break;
+
+			/* Validate message length before proceeding */
+			if (msgs[i].buf[0] == 0 || msgs[i].buf[0] > I2C_SMBUS_BLOCK_MAX)
+				break;
+
 			/* Set the msg length from first byte */
 			msgs[i].len += msgs[i].buf[0];
 			dev_dbg(i2c_dev->dev, "reading %d bytes\n", msgs[i].len);
-- 
2.43.2


