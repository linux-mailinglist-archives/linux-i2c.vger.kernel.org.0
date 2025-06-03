Return-Path: <linux-i2c+bounces-11210-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD31ACCF48
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 23:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CCCE1896A15
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 21:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E96124C692;
	Tue,  3 Jun 2025 21:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TfYNNyo9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4E7233704;
	Tue,  3 Jun 2025 21:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748987238; cv=fail; b=bmIhv4qnzvKr4vQdx96jSUv2/58svwJ7MNXkkUZ04/ywZI5dzpe8i2K7K/KpRTVJm+r5J/YUnVYSt+ZYKP4YzYcc8bLW8Fh1nsMIRIqOZ/Ci/HPfleDPj1R/Huulr38shiCLLO1vcbq1JjohCNxVHw/6MxOkrO+HwQesPAuQAWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748987238; c=relaxed/simple;
	bh=PP7UV9t9tKgdBnAotcN5CeZT++mI3eso+8/qVHZ8kuA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IVDeA+5KvoYCJIQT2oS9GGklIA66lPIF8p3a5L/oqwQ3c8SQY6iglx9aJmw1V1FBFH3MFSIo6bxKr9btT604tBjzKI3e/IYqHCqjKsJN5kMwYp/CtWOxAltP/KHQRmwoj2V6wYeniHYBSLUaHnFKmoyXXYpKm03AXKu2KJ8nRew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TfYNNyo9; arc=fail smtp.client-ip=40.107.236.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNq8fZoE0owORHI/E37p+egVNQD8ZyCJJza22mbN4DdBUjmJjRygJD03Z48ExYH4rfSIBvpE0qXaXZdmH1bmPxvAf1Pcukc8p89Gp5oUgIN/bImlwXoQUqkwQyVlDULpFEeLlr2p80ZYANX8R5L/EAy5x8g7zMufb5sPmcxQB64P8J63SuSJJp+Op8LF8TBZItQN71wonc7E8bmkc9my+WXXvUSLM88OX7GlCLYphqgjCdUvy0bkwsoVRKPgBz00OekmCrVmrdvEhXFDqvtISz+A2nB1t+0fMWeCchUbJlReGhL7g+BQMilX9MLpq9OJ3ZpkU2jshypqnHYBTy7c4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxRSt7BsE20a4MTLyguJHClcN4hbbQ9jcciXb6R0Hwk=;
 b=dnZxqDebCFHoozQYefWZXiqnCJDQ2gJDMYPjIzjZs7OTm+cZlqROHaXHLgtSVbqnidKSuaAWumkIAaIA5Oqxi+qYr60hPKFvBAzAZdOsTEH5gc1fe/NAtPxG52pBPCp1XhxS5sraSTcbPYa4oK9D0S31hgfOLoCCuZ61AZJKCxp7CryvdGUa1iHsFYyP/aTFdFlCGpNCjub83hw3wSD9dExOM96pHKWmMh5rebBpKP8PqjgpNpHoGQSLKKMQ6cRTYaHNSBNwTXeGkhr9BYYJ1j6RbyoM5vEjCTB38wO1i5mho6a7PAJypaBUZ7fMRbWr4Cztcw+gcy9UHk0K86Hg0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxRSt7BsE20a4MTLyguJHClcN4hbbQ9jcciXb6R0Hwk=;
 b=TfYNNyo9GzD+ocF1lcNZv+V1w04UcinuBpKy6iytYtPSGAZr9jtlXbUbAvB92MrPoW003N/MycLK7WgdRjh9MsbHrQTdksyHYmnesSlSxovkZsr0zc9kPjwwDtFxMq3wt2IMFcojBcx8C0pm7uLCnhtYFbM+hykOTS75HyRX2/Y=
Received: from SN1PR12CA0056.namprd12.prod.outlook.com (2603:10b6:802:20::27)
 by LV3PR12MB9332.namprd12.prod.outlook.com (2603:10b6:408:20f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 21:47:12 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:802:20:cafe::8d) by SN1PR12CA0056.outlook.office365.com
 (2603:10b6:802:20::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 3 Jun 2025 21:47:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 21:47:12 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Jun 2025 16:47:11 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <andi.shyti@kernel.org>, <rdunlap@infradead.org>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <mario.limonciello@amd.com>,
	<sfr@canb.auug.org.au>, <linux-next@vger.kernel.org>
CC: <linux-i2c@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <benjamin.chan@amd.com>, <bin.du@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <king.li@amd.com>, <dantony@amd.com>, "Pratap
 Nirujogi" <pratap.nirujogi@amd.com>
Subject: [PATCH v2 3/3] platform/x86: Use i2c adapter name to fix build errors
Date: Tue, 3 Jun 2025 17:40:13 -0400
Message-ID: <20250603214611.3039787-4-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250603214611.3039787-1-pratap.nirujogi@amd.com>
References: <20250603214611.3039787-1-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|LV3PR12MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: 29898303-6108-4bcc-973a-08dda2e832d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7Y78AMISLbTzwS1+0fmwI4dhgFCnqaL4haPXmNO7MFK6+LEHGdC57BbGPHks?=
 =?us-ascii?Q?17QAUc8ZUsGElSRfTvK78zbPmUPGHsTA8vpz5VkcZ8KoEGouFabuYgzbSm/E?=
 =?us-ascii?Q?L3ZgBs+MI+2G304k3FiRhbWAjKc2han9p8OAuKNsqQ5+388Rm98wc+ivJUTK?=
 =?us-ascii?Q?vejre4RMytq202JnniGUCZiE9aMQl1TVZZ3F3fz7CNoVB9rFTzlOKJ9uOjBx?=
 =?us-ascii?Q?lPClqi2vRDv/ulP5pqTjwHgQBqGsFvZx7fGMDKwWY93xr1CztxDROvgUcE9X?=
 =?us-ascii?Q?f6A/ijwIRAaPGyI/bHi0nY55FQIG/N8ev6l2qrIGeQ1gglnWzavqn4Kh+XNq?=
 =?us-ascii?Q?JJwLGe2/1AtQp9DbtdnmdYz4FPBTT3nr0h9J60mRFU/a0DqS9of76/FIC36A?=
 =?us-ascii?Q?4lg0QhNj2DG5H31ZfEBXm3h77kxrDS6BvXeX9TWoS4mGh6ZSd0+b00gk+CmY?=
 =?us-ascii?Q?erpEUyM24F6vfIHsbsAZQ6OrOqXVSGh56Z5BUMTyt+hoYZg5WghwMwdxd7r9?=
 =?us-ascii?Q?+eNnRuX8YfiS0DzGfIUEa9JuB3V17Ic0LnWj6Ub6rYINazdXAzM+yu2wlKrq?=
 =?us-ascii?Q?cqXNqCh4pBsEgIkkht5xP2+GHgUeJoAGEwQRwUrE4PRSa6s/ToxIKP/PWYSM?=
 =?us-ascii?Q?i8CGej4XRhzoqcUcV2FxdAR7BmihKmkZCNsB8NhAVz/e+9sX7lYXS6xJ4FVh?=
 =?us-ascii?Q?QgUGkeLPb97jyMvz2BbS0FB/Ch7Om7O9+lnpxG4cq7N2m7yaAN87LOuzH6m3?=
 =?us-ascii?Q?p+MCH9SuvTGM0Rmd7nR6XegwafyT9UMmzZn3lbDTBxPQPz3pbeqYiYTk3DOP?=
 =?us-ascii?Q?LsyOhLj+meTMSwUf3PMisjLDjDg9PoN9r94NAZgkf1dT64Z0j6XAlNccJZVr?=
 =?us-ascii?Q?T5Ic6n1etMiJakw8pl/1lYNWgp3DoTPhmd3VeT3ViCEWP6+GrYxne0bOLn0X?=
 =?us-ascii?Q?Ys7S0CNcfko0PRWs1u0L6WzbHtnonMCB0nubFwQPMXfjZ7uHjYDmRN8aPdb0?=
 =?us-ascii?Q?dt4X3zlR2tQoQ8rGEBsFVauqQfIYVBVNh48o6Po+INbnF0oFUFqx9Vr9U/u/?=
 =?us-ascii?Q?ZMZF5GG44YA0/MMnJVWmXoGgsZSQDCBSg6Sd1KTPQ9WPnWKtobWgg52kNIGm?=
 =?us-ascii?Q?63Rmf60AnZwZyE8vyl0gzuLx+KpUvsGnG0a0i6+XJG/uscWQCVpqgHxUE2Rj?=
 =?us-ascii?Q?BU1Sjt9y0FE72EVHwstRu6SGjlJiLweb4qGDgSx11UgnNG/ILj937xi4noEN?=
 =?us-ascii?Q?Bf00bnt686C3dW/BhTI5D0myBvCILVWlV7D3plzUcmPZxY/jhy95M3x5Waic?=
 =?us-ascii?Q?JudiaOWnUtZ7sdRO28wa7JrMH8DZfTYww1NnWAobxAcQaCI8tXCIP7p+Qoyk?=
 =?us-ascii?Q?hIRep6OCEDCju0AsW8exxSnBNzkiDl/NjtaPa2YFfLvAmHPwsXVmHQgxqR34?=
 =?us-ascii?Q?l3vkxfHKvtHDQdFkXdkNkzotMqhi+b/b8Tzl69gJyXkuO6DjPH9tKSWY3fXf?=
 =?us-ascii?Q?4joXb8E8JnGt2Wt+SiibdXtM3eaQJulOS/teGHtfQRBPEdeMm7k83UnbTA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 21:47:12.4901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29898303-6108-4bcc-973a-08dda2e832d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9332

Use adapater->name inplace of adapter->owner->name to fix
build issues when CONFIG_MODULES is not defined.

Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for OV05C10")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/all/04577a46-9add-420c-b181-29bad582026d@infradead.org
Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
 drivers/platform/x86/amd/amd_isp4.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
index 0cc01441bcbb..9f291aeb35f1 100644
--- a/drivers/platform/x86/amd/amd_isp4.c
+++ b/drivers/platform/x86/amd/amd_isp4.c
@@ -11,6 +11,7 @@
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/soc/amd/isp4_misc.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/units.h>
@@ -151,7 +152,7 @@ MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
 
 static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
 {
-	return !strcmp(adap->owner->name, "i2c_designware_amdisp");
+	return !strcmp(adap->name, AMDISP_I2C_ADAP_NAME);
 }
 
 static void instantiate_isp_i2c_client(struct amdisp_platform *isp4_platform,
-- 
2.43.0


