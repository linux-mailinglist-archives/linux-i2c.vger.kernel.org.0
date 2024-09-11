Return-Path: <linux-i2c+bounces-6549-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C32975136
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 13:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D49482833F8
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 11:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CA818732A;
	Wed, 11 Sep 2024 11:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="enK3rpXG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E88D187342
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 11:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055691; cv=fail; b=b7qlCleel3n5rZBbqbqCCU5g5Am5PBwiIbSfwSF7hSU9RL10skNi6AsOF1LeQbtBzSvkQFePhnLgPJShnMfEgIUfxO8NCvBNXrnrBXH64yrU250krhIafDWBn5pC1QKogvdt2/zLiK3xCbpKZZc90nlJ+6IjAYLJlglzPnhivSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055691; c=relaxed/simple;
	bh=1gxpwulv7RnL+Aj79dL4dKe42z6wdd/eONGZA9KT3lk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AEEvrLyIZJq2uQBY/w5VxVXeevD6MiCwipFO8hLd91NGYlxbKs/DiCGsA3xpN93KdYJHrw+BW53Z63ZBcLjFFdDyEBQADTpiO31f/cyd0tGRqm/8DPYT+1aR6/kO/rVSmYkEJ4Hw2Zd+rqNvu68Tm2g5ZQABsrX11fl8qQuRDqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=enK3rpXG; arc=fail smtp.client-ip=40.107.220.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOm3rDnZB4y/9q3rZv+uvor0/+ZkFmzCM00gRwmI2NqWaZzdSXf+iNj5Lb9dlFkaGcShuSny/WIjJkiu9VBT4H1Rmg5oLb2HAT7uR0wRM4gZCsxqKI7a1rpCyzvLhoK7DHXjQ4npUcXlAMsI8qxvTXJ5JgZqM6BuFG7pCxAt3eEEkso8rNgs8usjaWUXAkHI4h3Gc6sCqgZ4ZEmzO3x8wa8jkKb05F0WRw1s0xgzxLtf4QxSiyFpGCw6GoDrEqrFXi1q9o8nen2T7gsnqCqUO6Ci39bLGrW5DuSCh3TYtFzvuWyWYJoOPSVPnM1wdx0kimfNZIQ9tdGsOLkwNI4AjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EpI8r2HZljLUbnRTheg/KQWwyMfFt9M9SbRtlcTI68=;
 b=K+cInMNSpiA2wO6VcyfcbT6OxjZV8JjOKCNwJb2HtjivroUMI1r0N70D1o5xDm0B74OABq9QAeuee1Y76Nq+CVOuaW+UQVtIzv13Fe7nZSlXR3XaZtRnUARMKKoocItTe/BJmVoge9gZnUH6/D0a4xkWqBj1fK3zIbcx4qUXkNC+7Vkt9V25UgnMN4nzNnvJYBxDJz3yGvVeUfJUkgLjQWUj5e+wW0oHx2lF9dUQySL/xHNFB5MAo5Byf2TGC5Ynyl55P3qvWVluoi/6gaBOnUMqFfAVXb9UTNp0qzCZx+DZz4pqFMoRFXKP84ht8vz/PY5KFFcHmnxYbTV78KuVHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EpI8r2HZljLUbnRTheg/KQWwyMfFt9M9SbRtlcTI68=;
 b=enK3rpXG2s0/iU5oiyySZAMqqX/bKMgqv2j6V9MCZFH7SZyZKq2NGzUJnG61irXMFAc9+oJ0Pwrv8uul++q3QdhUgoKyqJudJvc+9+aYq7WMobkd7W1nDItJ2nWFkjxgZyyO0N5s21uPFoOLKs+WgXZNgbjYlbeCi7ULxVZBxyk=
Received: from BY3PR05CA0051.namprd05.prod.outlook.com (2603:10b6:a03:39b::26)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 11:54:46 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::2c) by BY3PR05CA0051.outlook.office365.com
 (2603:10b6:a03:39b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23 via Frontend
 Transport; Wed, 11 Sep 2024 11:54:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 11:54:45 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 06:54:42 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 1/8] i2c: piix4: Change the signature of piix4_transaction function
Date: Wed, 11 Sep 2024 17:24:00 +0530
Message-ID: <20240911115407.1090046-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
References: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 711b242e-6742-454e-1946-08dcd2588801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a2lAhw8aHZBSJAnxc89uvy1N0elntCCIVwcBXQLz/n1WalPFZtJL5+X2JX4X?=
 =?us-ascii?Q?76d9PMXKE64UMV/gUJGLOb6ODQatNUqvS9IiuW++vCoKjFuwI0kdKV4zeI8v?=
 =?us-ascii?Q?WvMnImeMu9qsDnYyi+v/HFSyZU7Jyx7ESB+inOfFt3gYCZOMzrTJYdXuEy4I?=
 =?us-ascii?Q?ILWFXvJmOdnF8k2y8bsFbDi0UF86SA/fJD8cSte/QjEKmXCsdGPzUNHfTgJG?=
 =?us-ascii?Q?HAozyhAq/cBF5chLObWezdAOGousuI052dldlMpmkWCdxhUMR1uj+YxxyMbS?=
 =?us-ascii?Q?/jWRX3uf4o5iJXz6cy46f8xLNjep3O2MpGvx+fUMWgerzNwc2A2vy637jtZF?=
 =?us-ascii?Q?e/0qwSSebv/oU+gU48J+3ybyaHzLx+aMKvfZkwd5z5+mISfb3q8MAON45vnb?=
 =?us-ascii?Q?ycebeIGUJIpxBxSB9rXrkxtUGra75jMJLUoMDiNKAOIdXF/oj4f9T+QabhEC?=
 =?us-ascii?Q?Fx+rAyTqSgBpp73l6cmQppa9wXFoC9JyMCtzzW68lth/5p7nwjIoU25tIthw?=
 =?us-ascii?Q?9J5Odj3VbusChfLrVafDgmsv4i5kAzNiJQ42Dl9FnI3iBHYDpdLqqx8D6ypL?=
 =?us-ascii?Q?JZK7faARHQdGsoCc7GQXZTsnfqpJLT4kHpvAgM/IqwNvOls5dB6iY90d3bJ4?=
 =?us-ascii?Q?fifMPDDTvNYViqQH4VpvdB1yFLPAitd/nsbVGGhVwMjjqYBDXwQpxRfjrQ6p?=
 =?us-ascii?Q?y+ugeBsXzTcKy5maq+YMAfKoJ6dRGCMjoj5HJZN7/6ThY1/xTwt+Y9CyJMqF?=
 =?us-ascii?Q?Wg1zAfGaD+gGr/17uh7j7WYppXtVefhASfuyABVaZcJ8Qd5nROmS5zf3i6uX?=
 =?us-ascii?Q?Dd6q/a62Dh5bFEuBSLtrTS88bAJXfIT7banyEgh5pO8GoykMABp2hSYSA4cS?=
 =?us-ascii?Q?yzrSKs+sM8cSrAngxGaxhmsgpfBy1crK2yV+4/bbvQG2LwUC/ek7G/W3QEU7?=
 =?us-ascii?Q?yFOIqSp4vev9j0nDaT88SAB2GsuiFk06rtqGZrCMpVKYK3SZR8nLyIRGGl7r?=
 =?us-ascii?Q?osC9FLST34h1hfDlXg1Q3O92v+y9rgIuz7+JF4B1uaNcAGhle/L7HU1XM7tL?=
 =?us-ascii?Q?Q5Vlni/7LMa0ePJZOP8Ue4SZO6gB1GCTiJhw0jGBCD1M+Aa4vv7Dlvn4x5c7?=
 =?us-ascii?Q?yTbfUDTs9NJ1aIYbhqxHo8U3ettJhqIDEcUYLv9HpJGMG8WtJ9gMqJGHBbkR?=
 =?us-ascii?Q?KxFDsOz5tirZ2UwPzPRi45XvbCs0Rz2GVTkxGyC+Jc/+Rj01HxOOEEsHa8Ht?=
 =?us-ascii?Q?bMbmCwjXnoRYNZCMBn4DPEkp8QeC70kMAe+UZ5NZRnJHytZepbYnSBqaUWJT?=
 =?us-ascii?Q?VSCE8EKlEVo+nI8xf9/wof4hAmk0Vv+uE9mFdXlf33EJKz/MdxNPdROhAc+u?=
 =?us-ascii?Q?FwDSRfo6IamsT3/SfVtFC00qiEa5NyvVHR7t/T1QrXqQ7KZcdG9FbPLFPHvc?=
 =?us-ascii?Q?cD4RFncciLyw7cAH6uNWROXv3fvaSAhi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 11:54:45.8621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 711b242e-6742-454e-1946-08dcd2588801
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6341

Currently, `piix4_transaction()` accepts only one parameter, which is the
`i2c_adapter` information. This approach works well as long as SB800 SMBus
port accesses are confined to the piix4 driver. However, with the
implementation of a separate ASF driver and the varying address spaces
across drivers, it is necessary to change the function signature of
`piix4_transaction()` to include the port address. This modification
allows other drivers that use piix4 to pass the specific port details they
need to operate on.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 4e32d57ae0bf..69b362db6d0c 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -536,10 +536,8 @@ static int piix4_setup_aux(struct pci_dev *PIIX4_dev,
 	return piix4_smba;
 }
 
-static int piix4_transaction(struct i2c_adapter *piix4_adapter)
+static int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short piix4_smba)
 {
-	struct i2c_piix4_adapdata *adapdata = i2c_get_adapdata(piix4_adapter);
-	unsigned short piix4_smba = adapdata->smba;
 	int temp;
 	int result = 0;
 	int timeout = 0;
@@ -675,7 +673,7 @@ static s32 piix4_access(struct i2c_adapter * adap, u16 addr,
 
 	outb_p((size & 0x1C) + (ENABLE_INT9 & 1), SMBHSTCNT);
 
-	status = piix4_transaction(adap);
+	status = piix4_transaction(adap, piix4_smba);
 	if (status)
 		return status;
 
-- 
2.25.1


