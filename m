Return-Path: <linux-i2c+bounces-11305-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA80AD231B
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 17:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4C733A6E00
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 15:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D0321931B;
	Mon,  9 Jun 2025 15:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MJF67aQ+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2232C21883E;
	Mon,  9 Jun 2025 15:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749484596; cv=fail; b=dsidtPa9ifdQNhbc38zAmYEusVuz8G4b5XLHHk49a0/RVovdSd1p5ZkdPJTgRUB/ovntTP0t/6Dvh8Q+p3iMOE1cOTIHEkl4tXp5yzuinwjAbhmLaN7CxL7d1PdeC915FzWUGQDFmnpbEuJY4uzNlcVdcxiXoE6v6iZ29NwNYLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749484596; c=relaxed/simple;
	bh=vHJR3OR6dhTiWlyQOOOWvfWd3jHT9TFPtLbVanVItNU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EF4Wz8i7KSU6Sd0dKLiBGIYZ/TPzirESB4Q/FI7rZG6oIRd0YWFHOoVnnE+QrxZmenBXZBxqiknicXeaSL6GR4EPgqMpmzbpVN78ZLV4AsFEqLvmm/zylB1nV069LTVyAaaSh286Njh+Fk8sEqmpCSgsOZlgL+wk1GRzLe4/mx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MJF67aQ+; arc=fail smtp.client-ip=40.107.92.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuJksJAtEeEUaR8HhRK8osOLAleXfdCxVvdIRji09iZCVwzLoHwZu2s4CUGBDUheXgFil0JikTwoej6ZKCG6lLvuIeuEpp00uZ3mx2NdTco2beqO/J+Pws1jYNjZKmKb6yLNDb/+3FUwq2KspqsZ1xjzU8ptWONRf7fEaMn/1UsH6SNXxeHw2Ib1el7ry0d20WT/NObKNUlrrdMbbgXAUppCAHm8KdNiwkU5tO/poWdkbHdEllyyyu7z7ksb8LrbPxYD7Reyy+TEdFDyu/Fq/3SYZjANbZdPzobfIht17i58/mrlnG0LWCj/6CI/EqsV/APOUe/SYjUhq1YYMSGKyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKiNkZWt5Dd66kYiauq8T9FX8HqaRoQyDX3KpEvpAKQ=;
 b=dj4OR51d1f7C7T+135DS1e6kfD7m7uFJWK70S/VLCuqrtQ7XK9bv0W/G1dQmV++1YjuKGFvN1I9278Js9bpX7v1OVKknjc8F8x4nuLys9ojHZY7JDW3bExQ8jowrYSAEzD8DHLFoAILc/esaRGiSc8jbuIc2mOr+Bc7FfaPISKjbwz7n3o7T+c0L5lVx4VNLe6mTFhGrWs3807ia9VEOINH+F4kLjvIwYVdel+1dNEYooEmF7H3/vClCqXNYvku7zqDcKwO3H1a1IQRyn2BAd/lNuyoWs1eR4MTwVwxTrd/7PDIV7d3y1yTRwBLxDw6APCWK/sB+ncWbz0RycRnkFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKiNkZWt5Dd66kYiauq8T9FX8HqaRoQyDX3KpEvpAKQ=;
 b=MJF67aQ+HgJ8xfqMF+XCBw163K1ZrdLkVyNAOCeQhxzRBbjdCib9KFB0u+HqyLPsmIhs2GEj1wrChdS31Upf1VixSnxypuPAWWUHSRdFStSdPPJg8t+PD3wLQnSk9ibpeQSj50VDdh4ZBpnlpLyuqbenPdPsQQ2s9sNedTtPbNg=
Received: from BN9P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::31)
 by IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Mon, 9 Jun
 2025 15:56:28 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:408:13e:cafe::75) by BN9P220CA0026.outlook.office365.com
 (2603:10b6:408:13e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.25 via Frontend Transport; Mon,
 9 Jun 2025 15:56:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 15:56:28 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Jun 2025 10:56:17 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <andi.shyti@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<rdunlap@infradead.org>, <hdegoede@redhat.com>, <sfr@canb.auug.org.au>,
	<linux-next@vger.kernel.org>
CC: <linux-i2c@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <benjamin.chan@amd.com>, <bin.du@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <king.li@amd.com>, <dantony@amd.com>, "Pratap
 Nirujogi" <pratap.nirujogi@amd.com>
Subject: [PATCH v4 1/3] i2c: designware: Initialize adapter name only when not set
Date: Mon, 9 Jun 2025 11:53:55 -0400
Message-ID: <20250609155601.1477055-2-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|IA1PR12MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: bde478e7-b664-4050-194d-08dda76e3229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kOh9hTqku8BaS//E6s/Mf+QIRfVgfnPfuQJMvFQCrOe3mZ6D0g7p0DrPpvws?=
 =?us-ascii?Q?SR0Ij3sGtxGsDl8eEv6Z3+oOoxpbWUXhYixmnkpE6ExDxzx67r1f4tc9ZJX6?=
 =?us-ascii?Q?M7uR4qhXLrcBQVcp8gRZuhtowKmBM4msA6MQsTd/Krp7RkFyRu7DY4eWBGH1?=
 =?us-ascii?Q?rOxuX8ju7bphY9gEXo9R8CbB9TABkbt/pquzxRQSm3D2gkHla2qG0xeoufFB?=
 =?us-ascii?Q?/qMWjcbkI0StCYI0YPBvgod6Lh/Wkglr8Mvhu+/AoqEm3GE2q4zRQQYoh9Iv?=
 =?us-ascii?Q?g6c9VhCoHsXW+AXy9grYlH03AHwvr+xVmKrAyS8yEk4ZVCi+xBA37opMnHnc?=
 =?us-ascii?Q?OSk0bfMW6Qz1i7bOU1srE5rU7zmjX8omemuDXmp5DORiFkmWbqoOYnpQDyYI?=
 =?us-ascii?Q?5y42m1TEaxmJOQG4aolR/vEG0MJ0Z5pwQiF5C3b9VbAoQKkdWGqDp111jx/I?=
 =?us-ascii?Q?CjKccYi6WGYqI9KWgd9HSeSWNkAOZladm1G/4UB+QLpOpryFd33suTTFHZzk?=
 =?us-ascii?Q?zJ/DC6WbFEsF1fYMHrpuhpMsme0Ooy1/H+f6WmUV0DZJy1GIhNEcs0te/rW9?=
 =?us-ascii?Q?eOJiVY2DtzXPtKAnNql49LTYHTrvOt+QodzLigwZp0fSSFsFlSn5ZDnmTwsV?=
 =?us-ascii?Q?5eg/OKMe6UpPaG1oY0l5ePCwVyxCi74QlG2wVfLT8ujgWK4Uj1u2GUpvEEdf?=
 =?us-ascii?Q?UwK2DC3cZzB5oq3RrkLy+xyHkcgyLbYFYnOA9ap149RZjJgUc4aA+Rjz6QY5?=
 =?us-ascii?Q?5mN8+Tw/1rZR+v368SkRuIicwhTFPUZqUHYYmZX+NjCVonc/Y61NY4Fvk5jG?=
 =?us-ascii?Q?U3gfvJG7orA0b+6iW4jSQYgRf58rvRe1Ssh2bXODWuY0bhVVhY171ZiJLprw?=
 =?us-ascii?Q?3UR7N7op/aU9Ud3LqOQh5Rg1O2UEHu+huHJGarVw3zPO0VrIY/qGzTXck8DO?=
 =?us-ascii?Q?XVdT1PYGjxc5Q1Q+/Z8AWNlJhZ408AnfTcHJtBlSTWLr2ax4KOVs6Jm9gxAV?=
 =?us-ascii?Q?cQOpGsRiRJ+S2U/GcSYYSRD0fN7h0Ixbw1WxJ5kTDZZek4xEC7LfPXuzLGWq?=
 =?us-ascii?Q?kHGoaiIaNofyQ0X1rd6CIpxbx02afXQ8KFkoydKrt+rYMzYhWU9s7A+LFQc+?=
 =?us-ascii?Q?/74SXac9qc4FKRPYe/SgW9Yr6YmudnsX1HY8UN45ZvDdLPVg3rTqPGIgiCrq?=
 =?us-ascii?Q?t6E2zWSyUZdX6bh5rJQykeazyi+lEljO2DHe6kT/MRkJLvRzGU9ZatIUmkXe?=
 =?us-ascii?Q?qp+TXEClZXC8TZmjhGaEiA5m7+5c67VUBUYrSYf6hVq6Zw/ejkCvdZhrHVZj?=
 =?us-ascii?Q?x37BRSpixGq4q7f2BMfT2gqA0Kp/1K5+4y9czZEljTmWJLpz/cNSBnXDendB?=
 =?us-ascii?Q?a/TvAxPk1wXXlzRR93wlNzi7cJ2nQW0v4PCd1RPDjMgISnq5+wQu+RgD3QBT?=
 =?us-ascii?Q?1aeBUvDM2nYk1k1Eyk+IDFWztaM29U/qz9lGtaSAqXFTpRwAiK+H+6mPK7uG?=
 =?us-ascii?Q?GpvsYUAwDoVUDJAoA6FOY+BybKRhwJxyDqW/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:56:28.5824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bde478e7-b664-4050-194d-08dda76e3229
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6435

Check if the adapter name is already set in the driver prior to
initializing with generic name in i2c_dw_probe_master(). This
check allows to retain the unique adapter name driver has
initialized, which platform driver can use to distinguish it
from other i2c designware adapters.

Tested-by: Randy Dunlap <rdunlap@infradead.org
Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index c5394229b77f..9d7d9e47564a 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -1042,8 +1042,9 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	if (ret)
 		return ret;
 
-	snprintf(adap->name, sizeof(adap->name),
-		 "Synopsys DesignWare I2C adapter");
+	if (!adap->name[0])
+		scnprintf(adap->name, sizeof(adap->name),
+			  "Synopsys DesignWare I2C adapter");
 	adap->retries = 3;
 	adap->algo = &i2c_dw_algo;
 	adap->quirks = &i2c_dw_quirks;
-- 
2.43.0


