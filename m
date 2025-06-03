Return-Path: <linux-i2c+bounces-11208-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 241D0ACCF36
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 23:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 019853A1D9C
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 21:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D58222F766;
	Tue,  3 Jun 2025 21:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YNov1x0C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFDE7081F;
	Tue,  3 Jun 2025 21:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748987192; cv=fail; b=jl/KPwa3hqzp0KtFoo0pwXhg9MQoUvmUBeep//l97nGoU3KeDCjbu3U/yowCO7O20Lt9FWavWow/6TAHx/3swCaxuOTNjgndNo/8ulba5et+8EdeP0MN32yGy+WQusM9apucVg5HgwxdZgqBEWi+96YjqvgdA9P4gc1Glh9Ib0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748987192; c=relaxed/simple;
	bh=70tmZtWYF2KTJ63HgJRgvwg5Gb7xVhaV+YHLiUzilJc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sPhoX8CMhZkSPy/qHm3OK3BXD7f9THvOZvSp4lZ45YzBcGAH3FZxL8dfVu/5O/hitDrJyi9fJ/AqSfPdfIbnFyIpQ1fjkXca88mqSfpB4SVnLU9CEbX3S+Klo4lF5FdsBB+Y0ah1UXCL/s4mUVwIdRfPFb6RhpVKuGj2jz1ZLiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YNov1x0C; arc=fail smtp.client-ip=40.107.236.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmvcdH2tvbNr8tLau3EnphbfGIgL+o10ezSE60w0gJstYVJ3jGrlI1ALcvyP32wfwcJRg2rYh31E6WXq5b6WhIi88ltM3CX8nSr2dq6gDjTwPfZCFTG+VijU82yrG9FVAZ0NJVP80Clga9bfn3/W5Za50xVzxErUdi1dEAERmi7gSZv2+Wj70kHkCurW5Bf8jPxMi+4GZEOmG2b2WnU5gydQJnv8KUgptE5uTGYv1p6WOhmKInhEMA3P7B3D1GEyEf7WFNBzcG0VnNEMme89JG+rFSTnpkmhP9nJHIbolz4DBIWnKu1Ig5BA4HrAiFHB6HuOKIAnAs4CVxtL3rsZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRR9tbraq2TmRaz1nieZLpfmMiD0bPZnhIA2+UO1LF4=;
 b=jc2gxagB7YckQyHqk/AbPo//pCHN820WRIiObffD9yq+5BPatlgFx8K4TfQmLHHFxy6xn4/SzWLY1J6HJz4nZH0bqvXB+OsoDm8RMlUWI4lNHE3X3C5dX684NfcItD9tXB3nD419MK6NgB+4Qu1ABsRU1zYmnrC3BlSO/1fd9u5KJAiYCwgDfStQzqLEAPURp1fCnyx3QPj9ukbcYrsFoFxHSG9k7POQmOsnjbkLbosbCiBgX2pSdb10/psuClJkn9ecDERnPOKqc5Tcw42Atwy0FHWsl/uQBGK4wcQY2TSJKCMOiDH41Zkuy3RNAkByaKS1eVemotIbeI1IaM91cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRR9tbraq2TmRaz1nieZLpfmMiD0bPZnhIA2+UO1LF4=;
 b=YNov1x0CwLKscjJ0WlVHpmN98UqWuo8zt6cvWtpjndAppslnDt95gxea/6TXsB6Y02k5DzGTdBEFnyR5HYmVtJlT4oTx+VhqcoG2Nqmjy6WPnJelZfrj1H7y2BPTDp//7Nn16TG/2x4tNKSj3F+AXFzug4h/ogcUnRKsYTbfCrY=
Received: from SA9PR11CA0025.namprd11.prod.outlook.com (2603:10b6:806:6e::30)
 by SJ5PPF4D350AC80.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::993) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 3 Jun
 2025 21:46:26 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:806:6e:cafe::a5) by SA9PR11CA0025.outlook.office365.com
 (2603:10b6:806:6e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.34 via Frontend Transport; Tue,
 3 Jun 2025 21:46:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 21:46:26 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Jun 2025 16:46:24 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <andi.shyti@kernel.org>, <rdunlap@infradead.org>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <mario.limonciello@amd.com>,
	<sfr@canb.auug.org.au>, <linux-next@vger.kernel.org>
CC: <linux-i2c@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <benjamin.chan@amd.com>, <bin.du@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <king.li@amd.com>, <dantony@amd.com>, "Pratap
 Nirujogi" <pratap.nirujogi@amd.com>
Subject: [PATCH v2 0/3] Fix build issue when CONFIG_MODULES is not set
Date: Tue, 3 Jun 2025 17:40:10 -0400
Message-ID: <20250603214611.3039787-1-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|SJ5PPF4D350AC80:EE_
X-MS-Office365-Filtering-Correlation-Id: 220a680f-f4b7-4d50-5b40-08dda2e8172d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?etNX78RSvLGcqMCoKDC3vdVgMpdkKXR7hYJGvzCQqDDKc4+UrZFBYogR3kuF?=
 =?us-ascii?Q?Fd5kTBKV1NxX0eUYNLy+UaVeGWlX1X/eApbKDIf52XxoPSq4nH/0VVET+U06?=
 =?us-ascii?Q?Yt5N4AiLp8z7rETmWsykfaAxg9d3j5dek8yL86kM5tcQxfb1w55hM9RFH/+j?=
 =?us-ascii?Q?7GtY3kMCh8A9y7p6jKpw9mWWD5xpRG2dc4KjfsvYT4R9o/fRvxCYKhMcT3Tb?=
 =?us-ascii?Q?Y+g8sK4gWaJOUOczx0Zzb5koUy2A6vbLwUepa+Rut9XQ3bgMCCNnkbNZrHSr?=
 =?us-ascii?Q?STR1avFwuJopS4dlL5OmHwsC5ZZBo4MfZiM//bKvT+FSta4Qy0tQ7Q0Jx+vs?=
 =?us-ascii?Q?DIDr4jxDwAegGTWEk4jlQ1ztbgK694IOxLZRNLznMiQsY7ckVLvWuZcCs6zB?=
 =?us-ascii?Q?d6tSqs9dOpTdQDXXwMAjl8j75ICqFq8TBpmiV51SzDaiHpVpL3WuDDqu/wGH?=
 =?us-ascii?Q?GrOeXePhkFDCWT+n+y2m2DN8KYXNmwsKxlHS73iGYUX3asLQXgaZFO4i2hRi?=
 =?us-ascii?Q?//Xsk1nCrALhEyHQhX/VaKqzISGfDaGhU9r0iN7DKnR2W4U9PL0l06ykFNW1?=
 =?us-ascii?Q?kBlfuS2U5ijxkJ9ps7VK7O36aNfW7clwDQ5rTswcJYExw9eZWjqHXtSzAkXP?=
 =?us-ascii?Q?c+ZURgqLLFIknUjQUFf3AmGlS15/NEU6fR58omph7WmHQfjwqIRkvmHX7gV0?=
 =?us-ascii?Q?D9CVybdPb56y+1kDktC3ynDzm+b14/vTMfR2zLlCRBuHucyey7PYg7CoAVc/?=
 =?us-ascii?Q?ANj+f/ABMWKPRJLeeg41JdYSOV4G9p+XnIKyFAaoU5QmAZjb9JmLu1R+cjzB?=
 =?us-ascii?Q?gu/idPQACqnQqYBTrtsaB9uoBRScBBCzG7R4YF4Xx4wYAVlLm8bJUKlKRFUx?=
 =?us-ascii?Q?2tipIbeDXqMAGjScSagNJL3sj4ICtF7vm5/GF0pMS2ieVkSO/Wc9EuOfrVCB?=
 =?us-ascii?Q?kPGWOrJpqSR40kcARtcR6jE5Xv/SRqTNVVV4sIpaBHLkW6Vb0UzBbJJEjeZh?=
 =?us-ascii?Q?O67TefPj1fHEOlYaeyZI28CKzmJRb5m1Da4kEUefjaS5UHJOM28taOuRsPJt?=
 =?us-ascii?Q?kPSeBVAvYRxlEH2XY+nehdoJIBxM3WjXphuY2nfkAyBxZUimjk9XQT2cMlwF?=
 =?us-ascii?Q?OQy/HpzJgPoYB2S0f/ncaH5DRppN8dX4ZyD6h73NI0eYqFR3hZvOvVKbJz9h?=
 =?us-ascii?Q?BPJYWQ5OyEGVED0bKOg+OpjXB5VEvUxh5/hiVRlZnc6LeIgZxkOTYuqEBGDN?=
 =?us-ascii?Q?UFjCVG6kD/KhtX5sFUoHIEcnbObPQJ6ZHjravQzJDpIWpDHKIdWltR3gmFjw?=
 =?us-ascii?Q?mhTu/D3NjV1VnzjG1d5k+G8NOXm8JOakP6E7/xyC/gqllG9HcrfQtFuDFplj?=
 =?us-ascii?Q?T071c0fR1U1UxBtSOnJO3rvSdAvT8mjqJCbERG9IM0YC+Jkm4+chAwJO51v6?=
 =?us-ascii?Q?XGfwYVid+DlPjicssKGCUJnLXhqfx3OXH+VTvBE3WYWA4SWUFkjYajMpaiIp?=
 =?us-ascii?Q?5rM8KcR4Un5vL1xBo1Jq7j6gxCbq7uqmzhDK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 21:46:26.0678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 220a680f-f4b7-4d50-5b40-08dda2e8172d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4D350AC80

When CONFIG_MODULES is not defined, 'adap->owner->name' used in amd_isp4 platform
driver will not be valid and is resulting in build failures.

../drivers/platform/x86/amd/amd_isp4.c: In function 'is_isp_i2c_adapter':
../drivers/platform/x86/amd/amd_isp4.c:154:35: error: invalid use of undefined type 'struct module'
  154 |         return !strcmp(adap->owner->name, "i2c_designware_amdisp");
      |                                   ^~

To fix this issue, need to make changes both in platform and i2c driver modules.

* In the amd_isp4 x86/platform driver, replace 'adap->owner->name' with 'adap->name', this removes
the hard dependency on 'struct module'.
* In i2c amdisp driver, initialize unique name to i2c adapter and also make a change in
i2c-designware-common to avoid overwriting with generic name when adap->name[] is already set.

---

Changes v1 -> v2:

* Replace snprintf with scnprintf
* Add new isp4 specific misc header file to include the adapter name
* Remove 'Fixes' and 'Link' tags from i2c patches

---

Pratap Nirujogi (3):
  i2c: designware: Initialize adapter name only when not set
  i2c: amd-isp: Initialize unique adpater name
  platform/x86: Use i2c adapter name to fix build errors

 drivers/i2c/busses/i2c-designware-amdisp.c |  2 ++
 drivers/i2c/busses/i2c-designware-master.c |  5 +++--
 drivers/platform/x86/amd/amd_isp4.c        |  3 ++-
 include/linux/soc/amd/isp4_misc.h          | 12 ++++++++++++
 4 files changed, 19 insertions(+), 3 deletions(-)
 create mode 100644 include/linux/soc/amd/isp4_misc.h

-- 
2.43.0


