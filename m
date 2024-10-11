Return-Path: <linux-i2c+bounces-7337-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B142799A1A7
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 12:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3135E1F2145B
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 10:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65290213ED8;
	Fri, 11 Oct 2024 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qjZ36qm8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A18198A3F;
	Fri, 11 Oct 2024 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728643312; cv=fail; b=EdzEX2LIMZXgLVb6TTJ6WOOUsmnZPHT9cB2PQPGTnzGMmUZfbyi1UvrfCj2p430Cw6y5VKry4xRgQW1jcApu4HhuS4+xcwSg12OHT6RYqEuC3toGlDNRsINyqSLGjNgDSsCVnHwwO1C5NEbVTw9P2VwON/gyNgyZVBuxbe+PTqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728643312; c=relaxed/simple;
	bh=hs1ZYhVb+i3Ukt82k47FK38wn3MJgYB5Bo/pczXQyqE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=haRv4vrzhEkd0gR3WJ88+WO046AXmQ+uhmB6g0/md0pupPjC7ICv/qom51D7NeYIamia0Zy1EkEKBN7xjmAwLocwKWpW7sAGJ8aq/+VmqNH3fONeNNE96y/UDhohEA+Dx8I844Sw3epZMpf4ruPcs1FPa2grcTe/5BJr21StxkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qjZ36qm8; arc=fail smtp.client-ip=40.107.220.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DoauQYS80wpYj7b1x+OpBTJ8vLTihQ+966ZwRszRixFoPsTtRvUsLiaNxePg4dtZjLW6GKRGREl9u8Oh7bPkHHqxCkv2II6QuTM5V+615eS+NYVLOyFnqaSe/l3xCXABqAGh2Fg70Y34hHLfzyPlsqN3Ms5X6xZAlyKvaUw1Th4wdso+Pn+taOJtKZf2f5dittqJqLWjw29Xf8zjzOe8VjJViorGxmLfhXremJkbXqbhFqfaXS21U1rFITVJXWsQgsXRbzh5lf8NUtYpqOHcvZRUl+zGW7A54VJQ7DrgDeZUMdhF/0umsCysjLYM0e8xKIvYjzIMZyO7L/4HRsLGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9m+4inL2X14VDyKSizk8yPtqv+LYKMtk3S3XNxqjiM=;
 b=bIleZxzBuGcO3s4VxZB+nazqw+na90dUG14/po4n6mH/jZf9ly+QO1tUV4+wp9Dch5znBtQC9aTqrGO+jc5MyVZnfHvDIhYfyST0BoCeo2kJWuDLZ8Bo+9f1iCuXLaJTD1Zbu0ZmaWIoyIIH0Ge4bsYPGKz3/sKk+SGutDmITSavw4x8qeFR6SOlHtNvb4e3IhKUbbmeyUQN2YTp0MPKo/PJuJo52F1mRalTe4s0A8njEmmXBgeL7kUQi29q/frCOt7EmAl7AgJ308MRQatkQWcnhShZnde6jjTiLdgjo5Fuqvofqvc8dCiicV9NibxP23dvT3a/zEJNGzTznzzLKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9m+4inL2X14VDyKSizk8yPtqv+LYKMtk3S3XNxqjiM=;
 b=qjZ36qm8KWjQ7ZLojbGwgOW/9CGSWrMY+B4ngDeGOSNzH+4lhEzea/eQEZsr4MKxvcIvJVf6xHn7s/5QH6s5vyyjCP5ZqK52QNaXZh9PY3auE+3BcdQSN9SV6s2Wngj3Vg9q6m2AbxXutLDhChXnA9GKqyB8zM7nJA9jnnL5ddQ=
Received: from MW4PR02CA0012.namprd02.prod.outlook.com (2603:10b6:303:16d::35)
 by SJ2PR12MB9239.namprd12.prod.outlook.com (2603:10b6:a03:55e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 10:41:45 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:303:16d:cafe::eb) by MW4PR02CA0012.outlook.office365.com
 (2603:10b6:303:16d::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 10:41:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 10:41:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 05:41:42 -0500
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 11 Oct 2024 05:41:40 -0500
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manion05gk@gmail.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>
Subject: [PATCH 1/2] i2c: xiic: Relocate xiic_i2c_runtime_suspend and xiic_i2c_runtime_resume to facilitate atomic mode
Date: Fri, 11 Oct 2024 16:11:30 +0530
Message-ID: <20241011104131.733736-2-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011104131.733736-1-manikanta.guntupalli@amd.com>
References: <20241011104131.733736-1-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: manikanta.guntupalli@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|SJ2PR12MB9239:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f355dd8-ca49-4732-c38f-08dce9e14d19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cke1dZ0J8zJN0p2JPlXs64OCvj81kKl5hCY+A6arneY9nTrZzvRjhK4m63py?=
 =?us-ascii?Q?vDq5uHMpSZbYCRgA5BVH3quxwsO3lFhrDgKJueWaLpwpYBb9V03GVLggSDJq?=
 =?us-ascii?Q?XqzDra82Vj7p7nDO4WheO6JDTNJ4Tru6Sy2CVyAdAhpg2aPT9wDgke2VNW1s?=
 =?us-ascii?Q?MvPY26GQm32iGAS68ggtjjhWfz2EufcwbFM9fw/AG4AfPL7Z+jKjPE45YL2e?=
 =?us-ascii?Q?t1/PGSByeYdVtXaCduS5hvrjuIvA8uqomIgQtTg5tlSgPRIHTCED2K/9bAQ4?=
 =?us-ascii?Q?LSaCQFZXHQfWwniJ4XBSocPHe080NroKASXjKeiyg4prstuOiZUFFuW2RFam?=
 =?us-ascii?Q?2ZlWNY+8MW0S3h/einoyijQmjsVoxrxD0cxVkEHZ49RQntcgq4450xmEzb1U?=
 =?us-ascii?Q?7QZJsWAaW5i0yYY+FJR/Ut1YWBW9wNcA4UtUSVVmKVStp9SkGgMLreqd8wDo?=
 =?us-ascii?Q?ZYNFNAlF7HSlCAYfMJLS37dvqxVGN7VhZrgQGQS3e6M1cLtV74VN5hRcg5W1?=
 =?us-ascii?Q?tAZ1fBEW+yZCFDq3k/3QNWIvcHWevJNGgCBdH1EmepbU2a0JLIV1YK3pwMAy?=
 =?us-ascii?Q?X2GgOdZENHjrD+189MRmKD9WCYyn0/AClZWmtGF8dRjT3+qmIJ6ZhSm5OnQg?=
 =?us-ascii?Q?PjEDWKRxMQ9jSnXiraOuSs513c2sqY2kQbgOOOInRIvoRO36N12rStWbIhgm?=
 =?us-ascii?Q?ALAAXjAEE0QFYghgfkS6M3UtB55ZvY/l/cs2nki8wVQjAUWv+KUUaEsckanv?=
 =?us-ascii?Q?Cc1d1dHFEW1j1QU7e+8mC766QmbG9Y/PO0WMyl5m27tRDO8guSvv+Q7yZk+Q?=
 =?us-ascii?Q?kwPWbCTRWyecdQkdhRj+rlZjjypvgpoRS4kZFmuHdhZEqR9AT30mqAAThibh?=
 =?us-ascii?Q?snNRdG6YhpNi8ENk9nzg/P6zDG9I53b5SOfkZk5mj/ZRfW4camlXwiN3KUkk?=
 =?us-ascii?Q?UrFCTSTq61AHwaAaQ6GuO+0Db+w453yYFIJ16bcph/2GtGN7iao7qGsoT2lm?=
 =?us-ascii?Q?V1wRDmD0+LGhEcLTGbFe959dzalAEi4D6jemGOufbQpOgmqc8f18zYb4QceM?=
 =?us-ascii?Q?PFQ2OOnA/tf/NOH6U8+MUXnozfcXgeqSg3PbUpp+WVJC1W53kOZB/1zF5LCm?=
 =?us-ascii?Q?abhPd2YNuX1O92By0RzblwonCFa9DVuUr3bsTqBxETFYzKFyH740IICoQcAw?=
 =?us-ascii?Q?3jS1XUIMLaRJRpeA8o5erUbN9JgvJHC1eAdGg7YOh0OeJIlKTi8EXJOOcQVm?=
 =?us-ascii?Q?WmczRTZPmgTOTtkKfB6Vn/UaykxVl6vpiKPW+jMs0HuuUpLNiZfcOBwqmZlR?=
 =?us-ascii?Q?VGgEbuSa+pY8Mod6km66ab0rvWiNhGpox2S+7yowiMeIME0Rwf9BEswPAuA4?=
 =?us-ascii?Q?T4Uhj25Pc7gTJlO8joqGj4mdM8T0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 10:41:44.8809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f355dd8-ca49-4732-c38f-08dce9e14d19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9239

Relocate xiic_i2c_runtime_suspend and xiic_i2c_runtime_resume functions
to avoid prototype statements in atomic mode changes.

Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
---
 drivers/i2c/busses/i2c-xiic.c | 46 +++++++++++++++++------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 4c89aad02451..052bae4fc664 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -238,6 +238,29 @@ static const struct timing_regs timing_reg_values[] = {
 static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num);
 static void __xiic_start_xfer(struct xiic_i2c *i2c);
 
+static int __maybe_unused xiic_i2c_runtime_suspend(struct device *dev)
+{
+	struct xiic_i2c *i2c = dev_get_drvdata(dev);
+
+	clk_disable(i2c->clk);
+
+	return 0;
+}
+
+static int __maybe_unused xiic_i2c_runtime_resume(struct device *dev)
+{
+	struct xiic_i2c *i2c = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(i2c->clk);
+	if (ret) {
+		dev_err(dev, "Cannot enable clock.\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 /*
  * For the register read and write functions, a little-endian and big-endian
  * version are necessary. Endianness is detected during the probe function.
@@ -1365,29 +1388,6 @@ static void xiic_i2c_remove(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 }
 
-static int __maybe_unused xiic_i2c_runtime_suspend(struct device *dev)
-{
-	struct xiic_i2c *i2c = dev_get_drvdata(dev);
-
-	clk_disable(i2c->clk);
-
-	return 0;
-}
-
-static int __maybe_unused xiic_i2c_runtime_resume(struct device *dev)
-{
-	struct xiic_i2c *i2c = dev_get_drvdata(dev);
-	int ret;
-
-	ret = clk_enable(i2c->clk);
-	if (ret) {
-		dev_err(dev, "Cannot enable clock.\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static const struct dev_pm_ops xiic_dev_pm_ops = {
 	SET_RUNTIME_PM_OPS(xiic_i2c_runtime_suspend,
 			   xiic_i2c_runtime_resume, NULL)
-- 
2.34.1


