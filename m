Return-Path: <linux-i2c+bounces-11272-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5FBAD09A0
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 23:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1024B17AD86
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 21:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F075F23D2AB;
	Fri,  6 Jun 2025 21:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jGJOBtMN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D6E23C8D3;
	Fri,  6 Jun 2025 21:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749245756; cv=fail; b=d0eovs9SasceIR5hVGKGE3PxGk/WtDcWqOyzjnTxmK3UieaMl/ZyrAbpe+K6Pbm384F9ByplwCoLmDZN9jegQCzW1s/37tmSN4cVKR7vatjYJVzjo8pczko/A6fOxOa5XgC7Jt2pyN64Rfz5HRpiGBF9+GhKkBKoHYZq68gMjSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749245756; c=relaxed/simple;
	bh=pJgDXKSI1bgyFNpRCuUrhGd5SX5Jud8jqDSaW7tHf2M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tjm2kfUzYrwmszNjdUnRF3RWFvaKw+Kwb4g5VZ6RrWKgABLr/p4u1N4DFxbtO4HSZcvPc+rHbR79HQTioXglqVtOmju3JLio9SdZ6CYeBSSpeES1ilbd7jaJwqhphlqeIOmwR9K9qE7ZKUw7GMa8YlS916kp4XPYjuuA2pPQESc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jGJOBtMN; arc=fail smtp.client-ip=40.107.92.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEcAshRoqy+sGZR6ZqifzOV4OC4DM1/dTx6nj170KwR9bSelZwFKyFOX1oYt7rpw6GTzoVOu/W8Fx57JheIAqKom5BVIYfBjj2ptuG1G6IarqulZRkJ22bqEw0CFlUbbjbprNW1TAoXsP4zwjO9wuuMYjK/hI/jHF1O0UpgIsEmTd+BygkIxKSdB1eCvEmNANWzaXLFYdaem63nNIBeOisNAx4jw8nmdt6+7r5ACkjo0z9QsYEBPBDCXQCWATtXn6x1meXudffj/bRxWeuUopv6emRk8YHDqVYZLnVZBLz1US4fsN+VTP13bsEbrqMUCznzHJqXwMzGw9dSBmsb4mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMblxp/rB40vVvTDuqKTqRbc4SPfL2+L14vtA+b/BIc=;
 b=lAdaq6ekwi9wnnfGY7bpThjlrBy3Dg7v/1LKc7pt/n2fgX3dPpO0VQVM3XTPuy5SsLfixN45aIEgupAdhb6/qgwJHneyXBggpxi6GKbyEYE7MFVIMWQuTGscE32o9x7LkswFkwpxsJ5T0SWulj/lGoRVf4ux7ymY2xYXruqNyfG44cVERXTDsk5cegwEkeb5lIJsHDrvgtwNSeR9Y1UbooVTtCP0SB4eTcRYqTboxttfTsAR3hL5Nxit8keml/IEK7SotMEyszTSHE4c0r1NtXo7tWgdZKCcIFh30vQf2wQYxBtud7UI1u+Iy1SycOhRNsqqcd4lDvhdvnqJj9bhtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMblxp/rB40vVvTDuqKTqRbc4SPfL2+L14vtA+b/BIc=;
 b=jGJOBtMNLn6zjuWN8HLPLIiuVapsdV/DLZStEYqXspWeB1LWh5N2MsmyGYq5Ytnnys8k8lmYlTIWrIeGQHYt2DSo1BVj8nazW0zt91sfgHxI0SlmoGsYSMAWX8G+qsjhGTqNvJyfaLJDdIw8xQvyqgvW11uyAEJDl/1oQDbkCWw=
Received: from CH0PR03CA0040.namprd03.prod.outlook.com (2603:10b6:610:b3::15)
 by DS0PR12MB9447.namprd12.prod.outlook.com (2603:10b6:8:1b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 21:35:52 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::42) by CH0PR03CA0040.outlook.office365.com
 (2603:10b6:610:b3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Fri,
 6 Jun 2025 21:35:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 21:35:51 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Jun 2025 16:35:50 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <andi.shyti@kernel.org>, <rdunlap@infradead.org>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <sfr@canb.auug.org.au>,
	<linux-next@vger.kernel.org>
CC: <linux-i2c@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <benjamin.chan@amd.com>, <bin.du@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <king.li@amd.com>, <dantony@amd.com>, "Pratap
 Nirujogi" <pratap.nirujogi@amd.com>
Subject: [PATCH v3 3/3] platform/x86: Use i2c adapter name to fix build errors
Date: Fri, 6 Jun 2025 17:31:41 -0400
Message-ID: <20250606213446.1145099-4-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606213446.1145099-1-pratap.nirujogi@amd.com>
References: <20250606213446.1145099-1-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|DS0PR12MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: bf273f8a-28cc-4c29-4562-08dda5421c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|30052699003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RZHbsUsuZ85BZb0vCAiuB/VuqNOgR729ZjyNZ4wvxXPCFXK/zxL7r+cpztid?=
 =?us-ascii?Q?onznQaGYYGZH5W7su30++ZH+Vo4zk9BnzEGRABHAaARX6Z2WYKHu1yE2LJ0I?=
 =?us-ascii?Q?mGO8VjLaocQs0vfc66vch6ARVHCrUYpJ1uCRLxX+AyZr9AtjX1vRkDTO36B2?=
 =?us-ascii?Q?jaO2GaDRGIHsqm4bDse27+LZBAfLroJDepGqJQZWECabmXn/fI7n9V8inTd9?=
 =?us-ascii?Q?ak5j3jfxt9CopsVRUrjk34t0/TyD/8GIMuYizRg9hBlv167YDCiaPoOkmLJS?=
 =?us-ascii?Q?cY7THzn7LXhyK7o7qlZ2v1JMkZUcPnYTKSYwRj6XlbyOUIQPXwPUHebKJWNn?=
 =?us-ascii?Q?/zbCgxEMqOzAtXK6yJrkR8XIEnufL7BCO40D4jrhFYefQFoSMykt3JAJh1oa?=
 =?us-ascii?Q?TyS21vXWZB14+Ns5H+RtHKzSVOC+bTUeiLaN1vJIpVWlLol+933qsYCq1IjR?=
 =?us-ascii?Q?MEkORjiouw1e4ke30X18h3yiVdKAsjhzM7LNy5azztpHscpJZFQuMxL7iHb4?=
 =?us-ascii?Q?991ZQb3LbFOt79CAKSFaD0yjdY0stdSoulvwUqVzx4NK/E6lUOvPbRBKoojG?=
 =?us-ascii?Q?SzBN/IsTY0XFH+zAEXSXr4QG2OKkGIrLJ7AgIkZmvKFQ5hVwbxgT5Vo+GkjP?=
 =?us-ascii?Q?1cmnSKFcXVzE7RIVh2BS7vr/wg3b+yUMTFoeeQ+WCE9J6u6Gt143Cvn/i+vc?=
 =?us-ascii?Q?/X+xMMncWXLi9rAw8a7F8VyWFQ1rxdvTzN8zkRh2YGTWYUVvaNfeEwlRBzPY?=
 =?us-ascii?Q?rDR7p3xHcYruLF/7Ds+EjeoZfNnZU5f0nT7OOuw00oGDCvktchI46D2AuhU4?=
 =?us-ascii?Q?Fude+ur6hLPv6/bs9FP3EmGhnX2vH//p0q6t2R60w5cGf1fy1BsW2lBqbHnl?=
 =?us-ascii?Q?HAE8SA6yEOX5XYUAXGBRcVUQ5tIi2ekSdsIMF0xes0QD65/fDNo7aqUDHqk5?=
 =?us-ascii?Q?eaKOht/xvGJ3NIifToxGfOKiCHmwR5pa5AhjA0oCUT+3bCCu0qkGENIVuLXJ?=
 =?us-ascii?Q?1k26xYM5wA8xS74kjUK5d5l7O4D7xXjHwVY80mZ7Ls2a1xPeu64hCcaXkOaU?=
 =?us-ascii?Q?62ZaW1vEVH3vk8hoHnlx5A54yXSvWIEQlo6lTN5I4YZh2W15AuSztcXdh3dJ?=
 =?us-ascii?Q?2u3lfkozV4SJxreTs+JXlkBWSIkIMf5WIBGG6dGBgDYnqkgRDZV3WmhShRa7?=
 =?us-ascii?Q?8K9X5yZ2BmXIEr8zrZZrpa+nMWluVHMYdDYJ2utLmeb4G56OJKp2ZQElS+Zh?=
 =?us-ascii?Q?0Hy1PMhA8728akQ5GUKuzNOSZ6gQwBXI+os3KUrwmIfJ1IpbrhRGTAhTorE5?=
 =?us-ascii?Q?opoLYrdmzelJWlCuUtjA+ApZ3bGoI1C/2otGpeSqhGcM0pmB8VDqznxMobul?=
 =?us-ascii?Q?NQJWrfDbX5+jqVfIWiWMYjzW8/dTiqxh4d3KaggEZidbUcBx8IIqHCj+Aukc?=
 =?us-ascii?Q?BYUkoranfR+7l/fIthlvo1aruIPBGkH71FsDWG0zylCY8aYyljB4ougqIWSN?=
 =?us-ascii?Q?ker6IvkdxJbuN4MTH1ECL0KpIx9VU1PT4+W0LPQiFN53rDwcqY+830U1EQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(30052699003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 21:35:51.7966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf273f8a-28cc-4c29-4562-08dda5421c59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9447

Use adapater->name inplace of adapter->owner->name to fix
build issues when CONFIG_MODULES is not defined.

Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for OV05C10")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/all/04577a46-9add-420c-b181-29bad582026d@infradead.org
Tested-by: Randy Dunlap <rdunlap@infradead.org>
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


