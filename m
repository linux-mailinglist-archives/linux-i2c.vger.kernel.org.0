Return-Path: <linux-i2c+bounces-6716-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A121E977F5C
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 14:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21A7C1F229A8
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92351D933E;
	Fri, 13 Sep 2024 12:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YraOblDh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1561D932F
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 12:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726229534; cv=fail; b=Pg4Nc3DXCd2g8NI1tOtVoF/oI56Z0JL7k1dnPajUDD7BXwPRWOW6zkKME0xPM+RJoFZTqOQgV220LSqAujS99PPv7xNjDJxH+o+1Hq2pTS6Kc4PmdpAhcAQ4u6zt085RvlYz1iHCTQ7OMym3Bj9657ngrd0yYQve1WUVDo4wJJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726229534; c=relaxed/simple;
	bh=0jASz4pDDI+7tLG85wbL6aIEUOlrpaUqP8MHVRtVURo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MqrVPYjSpKvmW+S7nHUI7Div1srjBWivC9kummTKOY/56lL40YTWAUMoOc2AXLlMK12YEfV7pAK+rmsTmk57ZsX9Cqw2R6kfvY2IlfL1+IHTy811BVbOu2+Toa668Oxpq9QcK8ekJnk0PWhPB2CBX5K1YZ+s4pE88TjjDld/eoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YraOblDh; arc=fail smtp.client-ip=40.107.94.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B39XbB+++mCFyrTjDQepzhbuZMaJ05W6HrUhajHWt4txiVurrlrsoVKeHxI1Jy0HPPBR1gho54fvbvgifvmh85yundGtrCIY8CMq7KtMriGpXu2NAxMsk5LbfKYuI79tA3M00M8+WEerVys6CeieN3J6oMfC7hJ2E8HJKM64ys6qcd2m2YNwZSwKwYTSklz7HrRC4JAKiMb3NPZPhj214faRYrxcGbymmGsW0CIyQXjsJYuYnHDIIXF3pP8wRsJMjg2osCjx8RPcLKHi1zwCeSkEr/E7eK6jTc14/0YIAYXrR22S/yHsGMyxMEmDDtLIKSQ4SXjzNEd4WdMxxNV+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70uaL74fdj4TD6eP1KHBoDkBUeLL0nXwecX6kkmx1ac=;
 b=Uhc/bpI/t1vp0zDVl07q5VzusvajTKkmexsqL1cTxDwh0GxuKlwSLvuXtSm003A/Ss473CX16hBlP8DKLu9BEqpUbbTUQUfZCT8p5Ntw9ah94fZy0sa8YaL9nYWeJkwy/N46mBvCo16E9qm/BrdpItRmsYeyqu9+v63981c7aCBGxOgXGeyn/eao5tbm2qDavN30xN9S3WIod3aW6wB0VVNrlWrOyFTIbC9P/lEI1KXy4kIDRBVeNYUepd3jn+7SMzahspBCNWypLeozk7o6nlgx/1UDYLfNavi0PCc6fXH4A4wYdM6hllUbrSgiOONeFx0KQJRWhUJSMQDmmJ3i7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70uaL74fdj4TD6eP1KHBoDkBUeLL0nXwecX6kkmx1ac=;
 b=YraOblDhns/JnVczj7mPiXdAK3KE5gndyJ8grLMA52qjuxcNCbz/gIC0/OsZewm1BpEbgmcFTittMdysJbTtb9rIjzVHykZHevldaABuLei/NXsLFDnWEJ5BimFs2sAh/hNFem02Q3rN5ft2VAcBn2z8zqwqvthIxVW51jMzhUw=
Received: from CH2PR17CA0026.namprd17.prod.outlook.com (2603:10b6:610:53::36)
 by BL1PR12MB5873.namprd12.prod.outlook.com (2603:10b6:208:395::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.26; Fri, 13 Sep
 2024 12:12:06 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::bc) by CH2PR17CA0026.outlook.office365.com
 (2603:10b6:610:53::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.27 via Frontend
 Transport; Fri, 13 Sep 2024 12:12:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 12:12:06 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 07:12:03 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 8/8] MAINTAINERS: Add AMD ASF driver entry
Date: Fri, 13 Sep 2024 17:41:10 +0530
Message-ID: <20240913121110.1611340-9-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|BL1PR12MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: 818c3663-6dbe-4fc5-20a3-08dcd3ed4901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4a/+6h2xZ7tCGfZmTm5s4HVzR/jOTM3gorcPiUgS8JFzFmdwgVj/PExvmuih?=
 =?us-ascii?Q?4vaFF5eEgF/qaFTfobL2rjdZum4HCGjHsPSgsF3FMGL8dd4B2d6Xa0HwZ53i?=
 =?us-ascii?Q?FIMjIGuHLucmYq8Rmrw0DgUCT+w31UjaXWA5+xaIbI+zxIw3nr/GDENChbbV?=
 =?us-ascii?Q?5pKMIrMRT8n5RHmRmZq8E+jI3Btwb5IYustFS+s8xA2xXTd2dJ/N7JIEtvlp?=
 =?us-ascii?Q?9MMFVVFJ7e2PAPjLTzErdmr2IN4onqZ8BsoiJj7PBtuYCnfwpLQzWO/90bOr?=
 =?us-ascii?Q?qywu25hsdhYpVbXhlISrPCsqdQmj6zhyIqSJcHBJUyserczZ5voeB0lSmEQ7?=
 =?us-ascii?Q?9yFCs8FlnwxovqZvxko+sOGp1uCAaBYUrSVZfPoWzVwpKh/niEV1+DhZAeBf?=
 =?us-ascii?Q?Q8yVoL95eDqd5PnvHFfAUC/i6YFJpGx2xFdC2n0Ji8piZ4EC4qGsHIUCqxav?=
 =?us-ascii?Q?Vu6jJwDhUkmh/CIk0JdXGb5dJmm0KGPIsFsSKYp8vDQj/ShCEx5TamIq31Ur?=
 =?us-ascii?Q?tfKHf38tK2TyTtSi0PCzZPamtDw9Gw7cT9+YfSbcAI1UzgWVXbmFNknw5KT7?=
 =?us-ascii?Q?4jP7I/jst1dCqQ07dT+HfK+k6xaZUH+RHoaEZv6UbW+7IIMAS3kcRaEa2yOY?=
 =?us-ascii?Q?rgCyC3Wki2ckzXVe0qabx+x/S2qwNB71kQOkrZGUKBDD0M5KW7pkeeaI803n?=
 =?us-ascii?Q?Df19Sh5Pal+J27QzUhKrCNxvAl4s/rHtZ4/RkZK0V6jEqGIBooz5PSb7W8CY?=
 =?us-ascii?Q?CUe3ZKpuKSarG8UwmGUdlSNS6o8ciu0S1PqwF/BI11xzjjPoWinBtjfCm3yN?=
 =?us-ascii?Q?ruV4TKaD72yzYbCUzcblgbu2LQHfrIuWvXdu6iuE2WC0RmLNjsrWeAZk0fHt?=
 =?us-ascii?Q?WFRFcMGD66uj/w98CDJWsi4iYdl3g+QG0OCZLsQFx4Lfd+JBkf9DJP9/c+Qk?=
 =?us-ascii?Q?Mn8/+/G7XwlzkkwTtCZCDvTGJZ6B/8T/SCZvVgWFZ0u1mCVQg3t9Do03ZA39?=
 =?us-ascii?Q?j0GB/wf8CW7TlpqGC2sqduIwjOx5fmepVeqQzk9i1U2vuboLG4FinlmgZH5b?=
 =?us-ascii?Q?IS0qp9RG97WpP/MMrYKzoWZ7i8+/i/2nFkpZj/WInHIIE9CsKHBUy8E03E27?=
 =?us-ascii?Q?GO3uYMvZtdnMO5Ese0HA35jVBwNigcSFQOUmyKi7bQDRQOwNF1djSFji191B?=
 =?us-ascii?Q?WgKTUQaWgHAqCeA5UycVIyrNFiqe07i8guRgSBt0XNBSfMbWM10oF3cmTxvn?=
 =?us-ascii?Q?Y7ZxznnV/yc1+k3qjmb3NRgfqm3iZ9u2jkLRE4w1i5Z1xeGa5n5JHydMYjIz?=
 =?us-ascii?Q?tmbvfHOWs0Gegz33TV11dkTpcxdY0Kh9F2fqUf8t9VAePxn7zkVSLSxtS0C+?=
 =?us-ascii?Q?2yBTeB/1zneJuoLYEiEa6EJS1HpfA+Upk6lasw0X6uBkEwhAhLo3QqXl/elF?=
 =?us-ascii?Q?kaZ9vZ6KgCGg7797bjaeJ8ntd1PohoFf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 12:12:06.4507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 818c3663-6dbe-4fc5-20a3-08dcd3ed4901
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5873

Update the MAINTAINERS file with AMD ASF driver details.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3f348b71b9c9..18b8975dd058 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1082,6 +1082,12 @@ L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/busses/i2c-amd-mp2*
 
+AMD ASF I2C DRIVER
+M:	Shyam Sundar S K <shyam-sundar.s-k@amd.com>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	drivers/i2c/busses/i2c-amd-asf-plat.c
+
 AMD PDS CORE DRIVER
 M:	Shannon Nelson <shannon.nelson@amd.com>
 M:	Brett Creeley <brett.creeley@amd.com>
-- 
2.25.1


