Return-Path: <linux-i2c+bounces-6881-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BB597CD68
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 20:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DC221F23D2C
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 18:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996FF20B35;
	Thu, 19 Sep 2024 18:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p05Csf/T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE66A1802E
	for <linux-i2c@vger.kernel.org>; Thu, 19 Sep 2024 18:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726768817; cv=fail; b=EKHYFYmj/WVFbLMsP1hiCecZpjSuze2w/CbgyBX5cmnOb4cFVBbyMrMfyr0OUiMCT/r2WZ9yfZBZlScQHltnugmR9JoprzwZ29UxuwNrD0hscew+iss0cCn5TETYKz0eC8dvbWoyXwl6kWlfZlWDV7O0Vn8QvUKvWAx2pkeYhlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726768817; c=relaxed/simple;
	bh=7QA3Eq/owrG5KypNu7IxRumF4EJKw9ImbZ0gJIxqDXk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kcM3gidCR76gNuhbpBl2R50+UEP8wNd9rTXSe6t/yghR1wOYHxr7IoGN5+FEk5q4JLlq0bAn+V27B/79++e5hsnf7AS5Y4nx3KLmb0qCPrlSmodyAh/SlUO6BXIPYrdSnrbiuz4tqN+diNVM71f0vLUSDVUGlxqvBWoWKIZyiCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p05Csf/T; arc=fail smtp.client-ip=40.107.220.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YY+Ga7VK5HwspBxOnYqoE1G7t3NcKoHjSHAzemNgo/uE/IDp3hlyEI7nsZb8GCJzVZgqxKGKhH9k7fyvNBrXJ3C3ll7bvH/IwjVxnUH+Lt5uJDalykvEVVogl7e0mEPLY4Kc8dpBSYc2wF+4nbVclns6XJRngAbp0kIaGMb2ot7PJWjW8NpLIu9z4eROrCpuwjCrJGBHXPmj3IC36KMaZSsf4B8VslHkF3IjSCoct5uS3mYsW2CH5rNIbuoGeTwnUH/W4ohFdSlxPkS31pgkajPQUePglfwM+M4RoR5Lrrpxte2kX0XZy12RgTPmWRWIoHENSgv2TvpawQ25eqvuAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L65BImzKPwfkRubPDERMHSUNAZI1j01a7YjpHXSaoGM=;
 b=OocJAVfIxltrQgJq0O/7aesu5bIiTZvsPfPbH8CQ56yx5fa1bljljmrOgAL4tFOMzgKQ3C/EQGQwzXTQ8njaBxNLIBaqrjPIpCP5dRIEOLPh6VbqBhcOtQgVeFnu8gOqbYG8PqV5C6xO71hHBbQcIB2hK/0pakXJhG5QlmNDBADS1pSNuGLJhmJ4nFU5OEEKh0IrkB2d16piqP2SgQ0n4uRdaZgPZShzNlnrClIx2x7JBVrB1aiSgTl/H7yr3+7AfgfBBP0ghbOprBwke0lRjh2hfTSUKRXiRV5cfYFKuwg+0ZCSMH2dSdOyxTLxO1MLO8BlSlmYGZyDnLj3yztNng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L65BImzKPwfkRubPDERMHSUNAZI1j01a7YjpHXSaoGM=;
 b=p05Csf/TWKeLHW45P8rcE5qV3HJmGbIGHA2tVG37nkge2ttOuIDUMng6JvlUr6HYOy3u0nzPknJoIyuNBTNsELIWxyStK5bUtLed2RaEgz5EpwmbNuXCaTUJR17QlTpzz1HkGIDD1KHSdf6MWg34RFDwjj9uvmfnlw6ugZrfim4=
Received: from BYAPR08CA0061.namprd08.prod.outlook.com (2603:10b6:a03:117::38)
 by DS7PR12MB8291.namprd12.prod.outlook.com (2603:10b6:8:e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 18:00:07 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::e0) by BYAPR08CA0061.outlook.office365.com
 (2603:10b6:a03:117::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.26 via Frontend
 Transport; Thu, 19 Sep 2024 18:00:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 19 Sep 2024 18:00:07 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 13:00:04 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 8/8] MAINTAINERS: Add AMD ASF driver entry
Date: Thu, 19 Sep 2024 23:29:13 +0530
Message-ID: <20240919175913.1895670-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240919175913.1895670-1-Shyam-sundar.S-k@amd.com>
References: <20240919175913.1895670-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|DS7PR12MB8291:EE_
X-MS-Office365-Filtering-Correlation-Id: 263a1edb-17c8-497e-0ead-08dcd8d4e578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8IkrL/fxaCtgPB74873jmYln3Jji4+Y80ScMFjqOy1YE1vzHd8gdG/I7ITPR?=
 =?us-ascii?Q?1eggQzMCPdrTA7aablYbqhxf97JIKkgWVmVrw3Y4sA0uscEptY7wLNO4z9/0?=
 =?us-ascii?Q?I1ZAxk2feyCBR0EKObllIM6hraRi4y9ulNV5HDr1k0xXGmPpylYt5ciS74MD?=
 =?us-ascii?Q?5NSPzg803OJUpgKR+FWrwK1Ulk61V9Z4MCxT9BB9gYFthpbAoBcdArlLRB3v?=
 =?us-ascii?Q?WNKJNhCxvzHn6B5/DXj9KUs7DF73Q4tux2O48cisuknn5fdEXwMcYOmqlEN2?=
 =?us-ascii?Q?o0ixsCt1kaLtrrB7DAipbHNVzHg+MVw0rgffCu4rQy4HBR+lyk4BurbtyxFG?=
 =?us-ascii?Q?85FNE4u7T6L1Tk20FFzqB7PLJD7G8D8o+ZdOhs1qZYW7mydeeXVqxudMyj2+?=
 =?us-ascii?Q?43WWqLnq1TleOxg1cyEmBlpMG6Zm9HMmzvjwSKhbF4k3X2yec7l/9VzOX158?=
 =?us-ascii?Q?GDAqknitKk36KftR6XsVIUWnNUjhwsXONgh/+pG1cAo+MQsgnWfpkaYoQbJj?=
 =?us-ascii?Q?GRZF9P1522DE7ICoNRr3ebV82qaa8G768HvUXnHkJRvpeW5xfCXkPjvz84Z4?=
 =?us-ascii?Q?fwKZrLPGG48i4bwA3QCgHBRSWZyfx0hWAr66IkftvOHUjbQQwoBXhHSikhTc?=
 =?us-ascii?Q?NqwqIO699w7Fg/RC3s9T+ISgRNohQHPBZQk3+EZeFlpz22ar/y32dBz5a1cb?=
 =?us-ascii?Q?c60JjEDH4bfU3bMq3L4HSAGboZ91kzKkJ3muTvo5IrmU+riAnMXOOp131tC6?=
 =?us-ascii?Q?3FpGsUlxVi+CY/I2bkXAstKJvlu5DDthtf5FUWBGcvqs4nPMTJ8u1pqWDS5k?=
 =?us-ascii?Q?zf9twjxTWUNcY+fOmHRAuXE/5A7mQFgHXPIV/4RpMbQDHjHJ3gOo5reHmjEl?=
 =?us-ascii?Q?Zt3AGZhhyXsHQ6JQiIYY7awBCKgpGbNi9WSeGH0Xji4XtCx/Xs3jM6nS8LYC?=
 =?us-ascii?Q?ReaBvBX0zydGqD7+Wr3YoM79o4QZdCMbLNkpOUxiMYq2ydQjD5NLRprf6II6?=
 =?us-ascii?Q?fU2t3GXYtaqZSNVU35H2yDObSaitCUqHsfMYWFK/aiKkeT5TNhxwOu2js3ra?=
 =?us-ascii?Q?RNuZlLYSYH0uc2aRiBl5Z5qxGHmtEY8QTUJWf5EJ23tC5fnaTmbrHZnTu0H1?=
 =?us-ascii?Q?Fj7fxfKauxUvhVlP7kEB/z1VE0AEuYjju3WZAH1vL+NnM6ocFO2KBi8R1ArG?=
 =?us-ascii?Q?qQpbcMN6//K1qdzZ/CIvLd2Dtd+Iz5sP+84sHd4NeJd4KmyWPeWsyGx5VLWu?=
 =?us-ascii?Q?6i9sACuvzimA3lCKQVPp3KkWerySfOrSMDKKTHDrOIFtNV+dfVLWfNn06ydI?=
 =?us-ascii?Q?JQHcFm9KWpQDkT7lyO2wXmvRLMbt2zvTwllQwuGNyXBnvjRuQS1tzqMVaBb+?=
 =?us-ascii?Q?di8j9Y9E1aOsWNzS/SDHF8qHBWJCZY8uA0oekNeirKpQhBefpaQn/vSv/f98?=
 =?us-ascii?Q?mIjP3jeDji4XXFLSWut84hTR1zH0ys+r?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 18:00:07.2722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 263a1edb-17c8-497e-0ead-08dcd8d4e578
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8291

Update the MAINTAINERS file with AMD ASF driver details.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 815f46948c1b..9d49a5d366aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1101,6 +1101,12 @@ L:	linux-i2c@vger.kernel.org
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


