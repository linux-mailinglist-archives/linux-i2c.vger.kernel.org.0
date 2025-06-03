Return-Path: <linux-i2c+bounces-11211-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDA9ACCF4A
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 23:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B0701896C95
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 21:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDB92528FD;
	Tue,  3 Jun 2025 21:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PjiZ2zAW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2079.outbound.protection.outlook.com [40.107.212.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31941228CB8;
	Tue,  3 Jun 2025 21:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748987238; cv=fail; b=j0LlRO86PC2Bbga5cYNbUiBiVkIi3JONx31yPvYPuevN02TWzW/J1YWFzLr5HLp3R3yGYwRolUOhsaE9qd70kzDYzp23vJZAOAbVHBfQl73/vqmoDRzPJxGcjCADlSoe2m5O62M47zLreFUruNf4e0Z3YoHolEFq5sErw29Cwnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748987238; c=relaxed/simple;
	bh=7zA2Q4st5GonzsQtXmlaT8VgBTu8gNp8q9hH8Fc4TIQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NunM+gn2ZtsDU+lQHFRP67wGEoftK4RDs5Rga47UDoBoyJxEotM7TV1m1WlQ+b1V0UjUakuaVVKopyzk67vw44o/zfYdK8xwfZiJmQFv9I0lozFcnXE6jknx9aHz5c+3k1AWpZXkiSVT3dMN45E9VJDDbcaS3SzQaJpf7DyUHqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PjiZ2zAW; arc=fail smtp.client-ip=40.107.212.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIwF6TaeUJ1OSSdrOYL6Bvg81IwPEztbCun8IumCEINr7keXLCZW4NawMkjy64lJGS4YyIxOwvAqruU6GgoWbWkocQGDXlYurYVsWa/K2+/zrQ4bgi/DZhlKFjmaaKWLeaaNdbaogtGHgd8xfxVxi7jRIsBHgBdpqwzQnhKlFJfbEoPaKh5TcslL/jflhZByUXim0xRXIbwLE6B1imRBtaEVZU1CqmhL7R569LdNK5DAPi04g8taOsX6YSxI0p4kYd4WrrEmQIlhIBYRWg0jYQSSgTjfsLLDIDbImlWMt3KSz2JdmhVzzUNujXYi9mDMGLpPxaLFkvqrDROZGn6DlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oow/ifob46Ag4yR+jB4UukJjTk9cxilBemzAgMqe7ok=;
 b=V64rmEJB6kAw5TSq0DPIOrJFfzFaUIVr/YXptGNpG6rEKHem+CUHmv8EqeAlduKNDYBM8siLzrjWXgjsVHHzmvXX7mPKH9JJdtiqiEbk/BeYVh0e3GjSDyDbverZotxtpkct0pzKBVasRDEykcaDyuo4sWfBrA4nlWYJHBtH3jaxGsPx6SFrOegDauTu5n9uBjbJ7SuPSg+qo4Mc7R0Scj1HA5nzxxeJySih6HdgZnunQTJ6+eY9eeJOxxFhW+7Q6dnlR6++IbtztAvgz5aJhpVWlcG0WrndGXzHxMT1ac7GPoN9bC+0CnzAQSTxbW/Pu9TldzYeqG0XH1DeJ5oB/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oow/ifob46Ag4yR+jB4UukJjTk9cxilBemzAgMqe7ok=;
 b=PjiZ2zAWrskKR97hInf320XbkJ/UptMemN/F9o9xRyffgDhwI1Rch0l0GsoARATKnXVFw/NfLQthkMuvpkJD2JMPLu90dJQuhjB5H3ITr9mCo2E5XYgOv/u1v0ritxw0oggxyg4ZzHz+sED9S3zPXba32hLUViyrdSLYgK4v3pY=
Received: from SA1P222CA0127.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::17)
 by BL1PR12MB5946.namprd12.prod.outlook.com (2603:10b6:208:399::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Tue, 3 Jun
 2025 21:47:08 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:3c2:cafe::52) by SA1P222CA0127.outlook.office365.com
 (2603:10b6:806:3c2::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Tue,
 3 Jun 2025 21:47:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 21:47:08 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Jun 2025 16:47:07 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <andi.shyti@kernel.org>, <rdunlap@infradead.org>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <mario.limonciello@amd.com>,
	<sfr@canb.auug.org.au>, <linux-next@vger.kernel.org>
CC: <linux-i2c@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <benjamin.chan@amd.com>, <bin.du@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <king.li@amd.com>, <dantony@amd.com>, "Pratap
 Nirujogi" <pratap.nirujogi@amd.com>
Subject: [PATCH v2 2/3] i2c: amd-isp: Initialize unique adpater name
Date: Tue, 3 Jun 2025 17:40:12 -0400
Message-ID: <20250603214611.3039787-3-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|BL1PR12MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: dca9d224-720c-4d56-1305-08dda2e830a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rbPDAoTU7gcaOS5VRECqxSPFb1GS+kIJRDo+5x6Ez50A07wlMLXHgPThu/Lx?=
 =?us-ascii?Q?snfzg+PAB039LuIu/m2/JJ48rmFsbTMT6gHbq+iQKMG8DkWFjr7zWhKJ9U4b?=
 =?us-ascii?Q?7eGsGa2NPZqTrvMhQ2KQ/zfxtD9clqHA76CMqUhV8gYqM9MgHjqFJTrOcq5p?=
 =?us-ascii?Q?ZxHLxFVXqLsE7xH+dopxiEKWE2fvtVGsYlUKLHk/nP9lAVCJmJsfBmIouDD5?=
 =?us-ascii?Q?ATxS9NK8tSOdQWGGO+kqUk6qLGtB+wgAquQ9WZelNhgrcpdbe+p/+m8FDqBd?=
 =?us-ascii?Q?y6IHkBNTauGtUSRI7MCrhWr49bWYq77705Am9B7D9hkXCzsvKHL9XqV8pj/t?=
 =?us-ascii?Q?zfk1F/RcYodQ8F13Vq78f8UAq4OPOZIXnv2Of9Kw4KqoWZSio3Vw262y9yYn?=
 =?us-ascii?Q?TWvD6WSxQb6mkiV6d9lcSzWSrBjCuyWuBB/g8pgCmvXD9E8I35VtmAxKjX+E?=
 =?us-ascii?Q?u/leOJPrE353PJ89v63Hf2pZmBFLWufv8jjITsI/t1XaHexKxSegIP3kSRAH?=
 =?us-ascii?Q?8tGgcZdy1jCg640GpD6GXxDjDyFsyaxAD6EciKN7Lg8lKEYETJ3mVob+BtUa?=
 =?us-ascii?Q?klUc9GrfwQqB/b1nuFlEGqExe1/Mo3/rY7G8dwK9iZ2724U1J7LeF2rrZRhp?=
 =?us-ascii?Q?UlXO5pOOj/zcq0eLqcj8+ACZNDH/gZnJFkHy+IgOWCJ7/wDSEA57/sP4ApA/?=
 =?us-ascii?Q?5jq8Q9Hv3jlCvUVfF2v5G7FyFuaVibWT2OfNlxLBLDHAHD92dMzy/5eEH2cL?=
 =?us-ascii?Q?rt2ygjIUzfXuidhbpP/jMnKy3I3/fWmoyIcvJ3hm83KoJ4NPa6jMNbB56OT2?=
 =?us-ascii?Q?tLIkfGN1ByHczBHYhondEjWOX2tyfxVDJLoVdshfGgVbDzi8GB5bQ3TKpNtD?=
 =?us-ascii?Q?kpxZvwcemUYAc4owirYB+Znje80J1ctmWJmVIYHFRcSqnq0sw5nwr+JRkXJt?=
 =?us-ascii?Q?hXZEyOIJ+1P1Cxfn3t6oP6eo8kXfcEuw125wPHIuSv1+Hua4e95dtErz1oA2?=
 =?us-ascii?Q?ernU0ROAMaki0gAuz84kI5lFvSUdUKDQKzDzVJF2jM7hZhrvFcvaYf8jDnGJ?=
 =?us-ascii?Q?fWQ3Eh4Sqzpx6/SLn8bByxCswiH/r4tTTB7RsoIoT6Tv/jT7rNM+UWURuASs?=
 =?us-ascii?Q?LoNArXpoBRcfvJsauQVyPiPmqn5CCe2e+DQnCee5hgiR0jaFjSOh0ujoUhAt?=
 =?us-ascii?Q?0wc/Hmkhy1s9nW03Ba95HVG1DrsmAmctlx3RI9yVQIIL4ugU923Ora9xIU0o?=
 =?us-ascii?Q?WtsH6oEU9crvd93c8rkf722JyIutbeg9+im7d3lC5Lya82WFirPk4AuQmT3C?=
 =?us-ascii?Q?CWKgMjlaMdZcbwQhTyyJC0V/vm/sC8guoTzNIt4/9vC4Z15qUfH9P5yM4/cU?=
 =?us-ascii?Q?+uf6GSK61UQ1WIwFo27BFfmP66Cxx7WvtHq5fdzwLvokCTNm2jEqdy09i30+?=
 =?us-ascii?Q?7X3Tk1l3WS/pUOL5CxNu/k9j9D85X86leN201EkyD3XqmfDHH4D/h2gAivuh?=
 =?us-ascii?Q?29wLn3STNy8V/a0ioD3zFd4xaNiI3ox6+JZe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 21:47:08.7721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dca9d224-720c-4d56-1305-08dda2e830a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5946

Initialize unique name for amdisp i2c adapter, which is used
in the platform driver to detect the matching adapter for
i2c_client creation.

Add definition of amdisp i2c adapter name in a new header file
(include/linux/soc/amd/isp4_misc.h) as it is referred in different
driver modules.

Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
 drivers/i2c/busses/i2c-designware-amdisp.c |  2 ++
 include/linux/soc/amd/isp4_misc.h          | 12 ++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 include/linux/soc/amd/isp4_misc.h

diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
index ad6f08338124..450793d5f839 100644
--- a/drivers/i2c/busses/i2c-designware-amdisp.c
+++ b/drivers/i2c/busses/i2c-designware-amdisp.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/soc/amd/isp4_misc.h>
 
 #include "i2c-designware-core.h"
 
@@ -62,6 +63,7 @@ static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
 
 	adap = &isp_i2c_dev->adapter;
 	adap->owner = THIS_MODULE;
+	scnprintf(adap->name, sizeof(adap->name), AMDISP_I2C_ADAP_NAME);
 	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
 	adap->dev.of_node = pdev->dev.of_node;
 	/* use dynamically allocated adapter id */
diff --git a/include/linux/soc/amd/isp4_misc.h b/include/linux/soc/amd/isp4_misc.h
new file mode 100644
index 000000000000..6738796986a7
--- /dev/null
+++ b/include/linux/soc/amd/isp4_misc.h
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef __SOC_ISP4_MISC_H
+#define __SOC_ISP4_MISC_H
+
+#define AMDISP_I2C_ADAP_NAME "AMDISP DesignWare I2C adapter"
+
+#endif
-- 
2.43.0


