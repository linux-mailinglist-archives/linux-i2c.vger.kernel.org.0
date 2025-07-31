Return-Path: <linux-i2c+bounces-12099-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD5CB17198
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Jul 2025 14:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AA1EA8241E
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Jul 2025 12:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BE928726E;
	Thu, 31 Jul 2025 12:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ds1Ud1Nt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40F41E50E;
	Thu, 31 Jul 2025 12:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753966552; cv=fail; b=Ays1Q1yBVtyur4JPmFzqiSbF8So5HQfa4OoCyQSj9qOiec/WOyg/Lv6XNbZKk3PLHB4uQdQ+aela/KsUvlhYwgHorx0I2Zs9oh+Vc8ouMmCq6rNx3aFxyvGta5ei1MIIwJ1D0gNKq/Pe3lTQ1rZzq+GOsshRXizWciLjtEe2IA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753966552; c=relaxed/simple;
	bh=W96AbO98u7bsCGZK7jzR4X/e6J0ATC7jaltcLowgJvE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CGKV6ERtf847AHlTSPNK9Ymr+0FS6rdH9yGe6xgW74yznhfTor30B5QnHw10I6yoRsFYBThJiDnLYI1uVqCOttXYPXzA5cpOffgfJa4rxjjbRpIv3CQ5tBaSi04aOTe7ACCJr1c7b09yB7UwH0fajvi+WGKx8Y5Cygo+At8Z1u8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ds1Ud1Nt; arc=fail smtp.client-ip=40.107.92.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pog76DwrkyzQ3JD+RMwzdmAVNIV/O7+SNaSkurIOqrUSaBoi2YsU2G9xmIbFkdE6Mxkdty0D+Vnhwou7sr1qiv0wIJWxuN+8/mGYTQ/+KpiIZ9vhapzfmwxqb3DAiTQNjR01hPeVwB3c6HKEqophbht+UN/2DefiF3c5cCkIs04Xo5nlQ5QjvNL9+4kh6cxU0wBi/9rGmxbBc0Zd8FS2Mf+jdF22Ev6xVE2KjpKR/t+zXQ9ct95t7dXgvYYff7dQlXoHl1kiBakywFJ3IObal1gOqRBb0cEUjG7gxKuY6HuHjY00PuRgS7KMdiL6QqCHV4Rxrulfpoj3x1HHPSbGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Kh77+EGxofKsBzACGas8jZ9Nxmekz1SyutXkRXRlSQ=;
 b=Nbx6djfNYEE1Rukk0qA/FlybSkmRDz51cxirCpsV+Uqb6Ahc7g1jpvFPlWvQPPT0hyf6UNnGPftxH6UmMs1EWqQCrB4LIkzyEmDBdKA+F8OG7QqUz6GLaQYQO8G9cL8cJw5OM8W4hiL+tJ+qMFMCgSN2HmJX7yOc7yPUcQ7NHdl03VZ/T9s1xavVuKKSgW/pZyOjWhi836JUYf8pigZlklytqH/czVE+kATwzp7dto8klhCsQNLSu7Wa4raGH60AKuP9wGTk1fIJ0zfGaLBdeEtMPHHGj6APoZn7SSQXqbVVRUU7j8hQw4uhXaka/M6vejZre0uUZEAHN/+ZpzHHMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=axentia.se smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Kh77+EGxofKsBzACGas8jZ9Nxmekz1SyutXkRXRlSQ=;
 b=Ds1Ud1Nt+TPrq/0JWB63mQv0q+Gj+J53lssrrXNO3426pq6KwE36ZPV6XSVfqA++SOtvfSzKzHulhrk/ySMvCumO4i7NVzii5KbjhO4L0WbS4v+frzSOC2cVAq06Ph8RftCBX1bki9HDoZHDyph0Fxc0/j2ZmLXGdn6niNkh1R8=
Received: from BL1PR13CA0327.namprd13.prod.outlook.com (2603:10b6:208:2c1::32)
 by MN2PR12MB4423.namprd12.prod.outlook.com (2603:10b6:208:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Thu, 31 Jul
 2025 12:55:48 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::e0) by BL1PR13CA0327.outlook.office365.com
 (2603:10b6:208:2c1::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.11 via Frontend Transport; Thu,
 31 Jul 2025 12:55:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Thu, 31 Jul 2025 12:55:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 07:55:45 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 31 Jul 2025 07:55:42 -0500
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <peda@axentia.se>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<wsa+renesas@sang-engineering.com>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manion05gk@gmail.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>
Subject: [PATCH V2] PCA9541: Use I2C adapter timeout value for arbitration timeout
Date: Thu, 31 Jul 2025 18:25:35 +0530
Message-ID: <20250731125535.22598-1-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|MN2PR12MB4423:EE_
X-MS-Office365-Filtering-Correlation-Id: a69812bf-022b-43b0-122a-08ddd03191f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?btombfaDMbbBlhAuocIK2O+1oEODn276HZgE2XXaqphHlRdXCjNRypcSqXCd?=
 =?us-ascii?Q?WDQ5bDzNMUCElcQ4SHHgzPC+6ZY1HvuRSMDsq3KkZYRDete1krMJNb/4LPoF?=
 =?us-ascii?Q?RGSqaj9tIZ1kVp54WwopMNilY4tfQqDk243LBuGI3CDXuxkB2i75GDepvo0k?=
 =?us-ascii?Q?UtnxIZ14/xqGRq0Qr17asmV5T129N18q5mWSoOb94Ih0cKXzt7a/SeNTavty?=
 =?us-ascii?Q?MU+AnQTZlPpFLB1iOzZMp3gCBobmA4tMBgPRXLduOr1k0PWhm8Yu+/cf/rkp?=
 =?us-ascii?Q?Npku396BchzesR5jgKbhHiWIPJS+mOJn7L4VoEamw7DzPf1vEn5srOWm5+jA?=
 =?us-ascii?Q?/HMtcbZ4HqKC0KFYoaoubw3YfcewFsi9PieoKsNN0P6+6sq2IvI4e39TLGDM?=
 =?us-ascii?Q?wIlH2p9cGWI+Pdi0Pn6ALuYvay5c4CtM4yoxTavxou+6ts1QDhfcvWLG4KBY?=
 =?us-ascii?Q?+jkKquEITchcfayiA4MhZEt9BqKu0z5UJV1Mq1E6NgJN2pP/9BZAEYfR8Qw1?=
 =?us-ascii?Q?DK7WYY1w7v5CdG5MdGty7ZPEc19jVuTYEDuDUklVz3n59OuV57KR1bG0UKKL?=
 =?us-ascii?Q?B9sQp6AzOnj8aEmBoIpM77ENRy0cKmfwuKRFcJ1SWvv3X3AXORKcr3Jyxt7A?=
 =?us-ascii?Q?tM/PfTvJtksnjJXixyKKiS8rGuLfynqdu6x1XQz4U8Nlo9+8o8u5fhDrstoI?=
 =?us-ascii?Q?QzIWVya8uKRLZqoM8Q5s8O8LAOGYZ9n8eR0izFnzW6uP0VIzRcRCsOQWMPx3?=
 =?us-ascii?Q?GDCSA4WDekjU415aQoBy1vd0FhnmOwcNCX15icy6CgSkrdKGduPL/jP16sZW?=
 =?us-ascii?Q?xrInspXBauqatqgbFcfYMWV+jaX81NtHWqmwvbIJGpWeTdOMDhJJ2wphcTJx?=
 =?us-ascii?Q?B/JHzfsn7gRhwW0Twj27JbxxA+5vM7S0RPGML5lTCXbArKrCyPF7XY4kvvgR?=
 =?us-ascii?Q?OmYWqWan7nQ4uAr8WRQDQ12z9743CRpYYl0dt+YVjZB9a175QV+gHM9VgEoz?=
 =?us-ascii?Q?bOhyS4ArUi6RTndq1lulQX+31K/5oTqYNBHHuhhwvsNZsP6cT8V9Z/vMOJYp?=
 =?us-ascii?Q?KiezboD5tYHeE72nuJYFVmXSwfjrqiU2qsNQxK4iKcu//r35FbIviB8YcR6m?=
 =?us-ascii?Q?s/KGfqG2WmD1lMNsyu6ukEkcNUU8g723GhJKH5vnvOeCGVoy/Ck7DP/IcJR2?=
 =?us-ascii?Q?ArI8l0v1FeZjSNca/yIAIn0r4eWarNd5zuylKeD6rZPhGtXnCcEoc6hv7kwq?=
 =?us-ascii?Q?H738oa8IglLnz+O+O7nLvCXV0aPT6Vrz5cgNw1x1Hohes0rfAqAgVGZrnQcx?=
 =?us-ascii?Q?JLZqzx8WLSyjq5qiRejZTzeGrkHaA7yNALJyx+zj0zqcsMksLAPutEPmcQ4S?=
 =?us-ascii?Q?AciEBCmYh+2fET2ezgt/FviPS/j6/IJRv3kh5I8b3dK7qwmO5WcpTcC2Wb9I?=
 =?us-ascii?Q?5AA2M9sPcZkP2WEF0KdBsvfTKbIDRQQHV8sjHHIoSCJsX3/0FJyaZrmsbeR8?=
 =?us-ascii?Q?8IkzpsiFTaNpAMJXUJpZdPrTaG3qPI9f8FQmqYbraIaR6FP3Z5bs8Jmrvw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 12:55:47.6846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a69812bf-022b-43b0-122a-08ddd03191f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4423

Remove existing arbitration timeout macros and use I2C adapter timeout
value for arbitration timeout and forceful bus ownership.

I2C adapter timeout can be configurable from user space, so using it
for arbitration timeout helps in configuring the arbitration timeout
from user space depending on the use case.

Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
---
Changes for V2:
Remove existing arbitration timeout macros and use i2c adapter timeout
value.
Change logging and commit details.
Link for V1: https://lore.kernel.org/all/20250711124503.3390451-1-manikanta.guntupalli@amd.com/
---
 drivers/i2c/muxes/i2c-mux-pca9541.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
index 8663c8a7c269..3d8002caf703 100644
--- a/drivers/i2c/muxes/i2c-mux-pca9541.c
+++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
@@ -63,10 +63,6 @@
 #define mybus(x)	(!((x) & MYBUS) || ((x) & MYBUS) == MYBUS)
 #define busoff(x)	(!((x) & BUSON) || ((x) & BUSON) == BUSON)
 
-/* arbitration timeouts, in jiffies */
-#define ARB_TIMEOUT	(HZ / 8)	/* 125 ms until forcing bus ownership */
-#define ARB2_TIMEOUT	(HZ / 4)	/* 250 ms until acquisition failure */
-
 /* arbitration retry delays, in us */
 #define SELECT_DELAY_SHORT	50
 #define SELECT_DELAY_LONG	1000
@@ -229,6 +225,9 @@ static int pca9541_arbitrate(struct i2c_client *client)
 		 */
 		data->select_timeout = SELECT_DELAY_LONG;
 		if (time_is_before_eq_jiffies(data->arb_timeout)) {
+			dev_warn(&client->dev,
+				 "Arbitration timeout on I2C bus, forcing bus ownership\n");
+
 			/* Time is up, take the bus and reset it. */
 			pca9541_reg_write(client,
 					  PCA9541_CONTROL,
@@ -251,10 +250,10 @@ static int pca9541_select_chan(struct i2c_mux_core *muxc, u32 chan)
 	struct pca9541 *data = i2c_mux_priv(muxc);
 	struct i2c_client *client = data->client;
 	int ret;
-	unsigned long timeout = jiffies + ARB2_TIMEOUT;
+	unsigned long timeout = jiffies + (2 * client->adapter->timeout);
 		/* give up after this time */
 
-	data->arb_timeout = jiffies + ARB_TIMEOUT;
+	data->arb_timeout = jiffies + client->adapter->timeout;
 		/* force bus ownership after this time */
 
 	do {
@@ -267,6 +266,7 @@ static int pca9541_select_chan(struct i2c_mux_core *muxc, u32 chan)
 		else
 			msleep(data->select_timeout / 1000);
 	} while (time_is_after_eq_jiffies(timeout));
+	dev_warn(&client->dev, "Failed to acquire I2C bus, timed out\n");
 
 	return -ETIMEDOUT;
 }
-- 
2.34.1


