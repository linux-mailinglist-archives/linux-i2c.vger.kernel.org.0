Return-Path: <linux-i2c+bounces-11303-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BEEAD2314
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 17:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB1533A25BF
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 15:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D57421770D;
	Mon,  9 Jun 2025 15:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TBdZkUSb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C942165F3;
	Mon,  9 Jun 2025 15:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749484594; cv=fail; b=Gk/xc99lRl0+1TWLdf6/nbUEDUbSQsAgnLX9QK/v9WPatiIKw2HOKHPW7m3/9RhXGqE+g5iFDqs/wm7jVdSkOeuZgCfdcQ0js039YedUf/rvPHS0Elj52NJOZs2+kECtBjVySNNaba7EZ5QN6dQLo+LZD7MX67oUGRl4uSHek9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749484594; c=relaxed/simple;
	bh=pJgDXKSI1bgyFNpRCuUrhGd5SX5Jud8jqDSaW7tHf2M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S+ADky92LBSHB+OMMhbKGGQ9Gpv3ku5y9oAfnhC/g05egnlpDFl9KvXTAbAXWMja7ylx2ye9z+bWnyf1FV9ow3JR0t9jWF4uO7r5eHCTw09fyn97a+EUYGRAH8pijq2AbtulJwrc6CqEmbDCqLg7KoFSm/A/EDBPR3RJOFIWEP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TBdZkUSb; arc=fail smtp.client-ip=40.107.220.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtvCGeZGh580OMtl+suegk01ms7ngIpD86CvJfIqxeJS7s0U0v3ALI3o3GPx/Ru89OrMGyl0p6vVB2xHrWpGZ4FDzSqB3z7HViu/KF7jwnx10RxlxDvAA4fOlmJlXgwgYwdxYhQFYaBldVjPL8SFySVjZHjvGpyduDGKwyRrGEyXH+pEEo4SUKbPhor3DJQat/CBSIzkpwCfzKIy7kAYvdYJH+OSZJvsKO+4uPkxsRiPCTgWloLxLoT7KRAGcOZ0ddxVM2fdqzMSYw+j0wfwI/wy6qUOMPt3kze1L4+eo0DS/1I8eFYuin2iSjviVrkTesMpPQwR8/YbgS1uBi/LvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMblxp/rB40vVvTDuqKTqRbc4SPfL2+L14vtA+b/BIc=;
 b=O7xGoUtttq5z9FRNjp1+P+x92T0qGFTnQbbUy34/lkQBOJriYQ3Fh8t8OWDmokWgRtk0a0F2nlQZSzH/yeOowDtHzbD27OM1jnAtUk+i11flMoitnOdEXSYuzjChwjbxSIiIzjfFl2PHissG02r5Gk4CaWWhrQkqPzIHTKO8CS+FNvPHzY2nNpjx/2LSOjixDAG0A2IRZkiXpZ2g8iMfRjFRHrvCbbXRaHTYXlO0USjD1S5yDEf8S7cF2wF+WLgsSk+1BLFr1IWWiWUZ6QiYssTHmwj/OpRov7RM1pYUD1LuiTudDBNDKR0f/+84dunMUZ3zZVsoAF1wIyZl+xBcxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMblxp/rB40vVvTDuqKTqRbc4SPfL2+L14vtA+b/BIc=;
 b=TBdZkUSbybSsWcVOLj1dEOPk+TjE1vQmjl1/nBQJXA/jsGhiYLxoOhyuSeZr4huKE/o+zn3CstL18ArNE4W6S0cr34QgzPC2J1l+MdKuY6vFzje/SeNjzjhgn9cnFaaqD6qd0JEC7s2s4DiXBRMoFrZ/Yz1XOP1yb2phBQhJKjs=
Received: from BN9P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::21)
 by SA5PPFCB4F033D6.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Mon, 9 Jun
 2025 15:56:29 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:408:13e:cafe::c5) by BN9P220CA0016.outlook.office365.com
 (2603:10b6:408:13e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.21 via Frontend Transport; Mon,
 9 Jun 2025 15:56:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 15:56:29 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Jun 2025 10:56:21 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <andi.shyti@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<rdunlap@infradead.org>, <hdegoede@redhat.com>, <sfr@canb.auug.org.au>,
	<linux-next@vger.kernel.org>
CC: <linux-i2c@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <benjamin.chan@amd.com>, <bin.du@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <king.li@amd.com>, <dantony@amd.com>, "Pratap
 Nirujogi" <pratap.nirujogi@amd.com>
Subject: [PATCH v4 3/3] platform/x86: Use i2c adapter name to fix build errors
Date: Mon, 9 Jun 2025 11:53:57 -0400
Message-ID: <20250609155601.1477055-4-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609155601.1477055-1-pratap.nirujogi@amd.com>
References: <20250609155601.1477055-1-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|SA5PPFCB4F033D6:EE_
X-MS-Office365-Filtering-Correlation-Id: 72250091-c9cf-4cab-7a2d-08dda76e32e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AeD0su/3WjR8Ik77Lwq7L2cs7PDjbRzry1gpB73nRgHn5H9YKRQcpWlLbjuU?=
 =?us-ascii?Q?Xb1Lr1r+B1oOodZdUyo15S5W3Np3fcFWF9NIxY+SmqVBlVxSLrVdtqdvokbK?=
 =?us-ascii?Q?cumTIwNax1fOeBB4MGU/15ieRr1Kmp86MSEj//XdydDVjcLrQDbb+R9TJsb+?=
 =?us-ascii?Q?sk6fb2h4CHVfkh3s/GQNcpvvR+NSubSVE+IyuRvX6B0N1drMaHyak16D7lIf?=
 =?us-ascii?Q?UQz0SC/aNlXSvOE1E6QiTbonhNTLkjRf1Y2t1HPq5d2pgWe+asm3XX+twLud?=
 =?us-ascii?Q?+Rinyy8uHu99ZX2qvhnNPbwM4WRUiBxza6AjP6QBZroQN0bCUYJfrqiApuQh?=
 =?us-ascii?Q?sES1ihIqTByhWaiUQ+Deer5KZ7WRgm7xy5kTNaQZmYgDV1zN3DOR4Gf+5Jvc?=
 =?us-ascii?Q?U73Ixory1/XVG0yik9IUGquRb/WkqhT991RtG6Ib8ReROGCisF5OCMR+wrlI?=
 =?us-ascii?Q?pykSf48523MiU25Ryd1gVyxkZnN69t2QEk9OjKoITjqAxgLmwL8EqMrhbRMN?=
 =?us-ascii?Q?1F5ti9tSmdONmS0m5oxqWj2KplYMmiOjtDDN76LNUz4mWgQBf4xO5feNOtrc?=
 =?us-ascii?Q?HzrJV5vEdoI7th35mkGruUl0aKbgx3evvg0VdeFu23LaLt9llHa2l2vs4V9a?=
 =?us-ascii?Q?ig4dN0EoPA8dueXsEXn9Jgx56mICKmFsm+5ZgzRLuMQAf2bKJWQ6iyndVhQW?=
 =?us-ascii?Q?vvjA4gYebv0ZBGgcPIhIdowFtU72WWAiKMsDFBhyPazYsNx8z4HqTG/MvJY9?=
 =?us-ascii?Q?7eoffl5k9BcYKr+cpl+gAhKRqcN6HAN4gvQx/T6VMCthagRe9fwfyocxLZos?=
 =?us-ascii?Q?RNPZo0CM6zzUMvSU++jo/wu2rT3RJeqK30uXcwyUVNIVAyRX6oDfRRyW3HeW?=
 =?us-ascii?Q?W8WAJztuOTSff+P92G51ipizpQTCGc7wU80NmoVhqcgeNu6A11+KFO+AxRSG?=
 =?us-ascii?Q?Brjt1rV/GkfmeL0t1I/dlBH0jPNtaxTw/NI/MCnxN//dvc/DD+X+B72myE+i?=
 =?us-ascii?Q?HfJz63IDIzsd1/AC6dboi/0f9leNlBEIslMau3t3Y0ELHBPbgk81Jpm5vpcN?=
 =?us-ascii?Q?EnADCtquVXVF241r5O35f0TCZkTJTNWJDkVKs4NtZB1VMYnZs1zBi3534W0H?=
 =?us-ascii?Q?/0RQeaMrrn7+MvH/G85lQs5owIrWK7Hq55fU/MMmSB8/vd0a9oCcZ2f6xuzV?=
 =?us-ascii?Q?M9uLFRsDZYseP0TuAyZ7EGiAe3T76bM5tnPL9t8zATVC9HcmbP+Gm9Bc9ak2?=
 =?us-ascii?Q?n7Xu7d2qN5P5AN77srzk69LtVRnidJHLx4uChnwPIKwRU4EePVBLn7eGx3Fc?=
 =?us-ascii?Q?Gkt2XOQp2X3U9kt6i7hMI+WKjyizXu/rvFSKMF2WxGmp7oYTVsz+7O7cnkqU?=
 =?us-ascii?Q?MKU5M8lG1ivMZ8hOk2I2glAlcvu1gkIcBqkg+5YWstyyp77/B0ByxAG34iRI?=
 =?us-ascii?Q?l3NWRYvWlBMUP7q2G4ACq1QTxDrVSNbKYpkU1X4MbLM3JrCZToXp0ue00bvG?=
 =?us-ascii?Q?EusK6AWwG9u98GwXDoAoYSnCHegq3BRs5e2ZAp7TsgMmxQKEQQbaURQiTw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:56:29.7856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72250091-c9cf-4cab-7a2d-08dda76e32e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFCB4F033D6

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


