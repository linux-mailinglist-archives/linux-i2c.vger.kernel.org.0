Return-Path: <linux-i2c+bounces-6925-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F44397E726
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 10:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 327371C2112C
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 08:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C146249630;
	Mon, 23 Sep 2024 08:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LGdyfYGJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19598328B6
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 08:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727078737; cv=fail; b=BLo/LsK5FpsyAZfQXGhKSA1GZNNhIEEreAlajT23ir4PCRtzV2cVyFr43pNqKurKhHqb/v2s6vEwoO4qkXtrfus/nlXaGQJ1sg2R3ATbqkyGgsMFjUkD2qf7DW9HiOoPU5P1BkzO+uEPl2zx8vpZVT2o//csmpfzgsvDSwRTaQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727078737; c=relaxed/simple;
	bh=EbHAnuaRVhQTeqGa+PT8hC3LlZ9yqJfIeqM5E/IIP4Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bsZL/R9W7PLX/o2fBH7dqTSAjqCQ3/kLYInXoU2TVP7t2ve6dh47h4XIPrfJcxkO4scaGHCnkVJTwybrzGudeT7jvXokuwShlCiY8x9h7+gx0mzjq3kErneaaeer6QAFDm3Cu80O237mIMizE/EOyFC1rDH19V+87GHWR3hItIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LGdyfYGJ; arc=fail smtp.client-ip=40.107.93.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxU8o5SqEG5+MbQgeEKITbIs60hu2p1+RdIR9nl58dtIllHYCaeydzLsYlHgTXuRTkaIfuYihL1Uim3dul5GHtIeh3sPQNCTkjfvUGwwGOQDw2Q2BAOvPYYPzUaspMP1ZFkADnTZI80uZN7yTK38/A1fh9rFxLv/nCJ36EC1Q3p0TDkfslzfjuS+RhKI75HBLUyj6epFHgQ2I/3OogIHUdd82cfE+7wtzR1OshZ0pgvrq+w+/cXhwSlqDO0K3M4rpatNmN/1eSgcXa+3QJwBFEYPzoZWvNaMPQ2jxd3kyoh0YA234iFoP6+T0aD0oesTArAquR5teds+/xdI+8Yt3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pv//g30l8p1auD1afNh1AfRALQVgbYB16xHyAlfPbBs=;
 b=bWWDrXbUl27hifSmAwxUQ/9mFqJyHg9zheBTzHB4qsaJXB9q7BQkBgxVrOstw7wCZnYlUggN5jgnJ0jyWJCtgGNjVCiUBN5QqiHK6N7zcRwWWIMUAKn6+geD+KYWTaeRGI7evpK06/zKO0D92pWKPQIMIYFsVp5SBu8GFqOGwWzrszJxXau2k/KDggcE7BK+AA1ODQHZKrBgKyx6c6TqUI48fkuGM6H5K0TctD1ok3nrKCdwtPh2HtyLtmAqoJIDyWX3lSqr3I3+lZgWM9c3+4IMDcImUFEfXdYhpethOGhZtt9o1FpuhgcZT1rXO2b+DOVofgb3RmGJ3oQXfpXQmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pv//g30l8p1auD1afNh1AfRALQVgbYB16xHyAlfPbBs=;
 b=LGdyfYGJdbkqiiAs5ukZvb5eKaubq7VEnT+Xmc65BSRdCOY7pAK7OOgElyUv4doi+8X2GxN4+msV3/wGXGyvdqrP0FMCQb1Fp3hEvZghg2qcGcjxNGAUZRptKkKa5d/COEFp214eHb58TqsStROHq8Bkujuxb8ykbOpsNONiXsE=
Received: from SJ0PR03CA0366.namprd03.prod.outlook.com (2603:10b6:a03:3a1::11)
 by SN7PR12MB7369.namprd12.prod.outlook.com (2603:10b6:806:298::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 08:05:23 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::72) by SJ0PR03CA0366.outlook.office365.com
 (2603:10b6:a03:3a1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.30 via Frontend
 Transport; Mon, 23 Sep 2024 08:05:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 23 Sep 2024 08:05:23 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Sep
 2024 03:05:20 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 1/8] i2c: piix4: Change the parameter list of piix4_transaction function
Date: Mon, 23 Sep 2024 13:33:54 +0530
Message-ID: <20240923080401.2167310-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240923080401.2167310-1-Shyam-sundar.S-k@amd.com>
References: <20240923080401.2167310-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|SN7PR12MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d330523-238d-4e8d-83ae-08dcdba679d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/xfwgcz6yhJOCF+YsEXQo3wPJXoI5STReZXwES4Yx+QvrTCPQgGrzvddDf3j?=
 =?us-ascii?Q?J0TH/Wuhn6ceckhSarwCUQOPgBid70nkLdJHZtW7pYibxYn89g+HxuQLgVLt?=
 =?us-ascii?Q?pphC45QbsC1OOpuCbM524Ssa5teeBYhlW0arwJ7WqOu+kcElGlv2QE6pvaAQ?=
 =?us-ascii?Q?NyqIz6kIUmYhve56JrTpn76VS32SKVX4FLgwGFPMydAFeUV7y+OzBuR+FGE5?=
 =?us-ascii?Q?oD3ukWsmv6T2RhHYwegZr3nRBxR7dLcfBXTVpaK6ORinvaZvEmJSlypHZTfi?=
 =?us-ascii?Q?rWnO7XnuXarG5luJyoNfiNF+nqWpIqhQr6XKc+mzGvotp5A+bCd9cgrnOcC2?=
 =?us-ascii?Q?W52nCQRRRzsTxWDQww6MTQOAfC5+oMF4ioNN/EeQfJF4AAdRl+3w/jS73gzu?=
 =?us-ascii?Q?HrMncPIkXDoZdkgcv6NY+A9/J1xMeV7qRVoIrfdz7Er4bdGHBNb+mQMuLvr0?=
 =?us-ascii?Q?qDDA7aGkynOSHnGOqQiVZhwjkx17hO+RDTNA3azdmlm4mCT3PW3F/qEE2WOZ?=
 =?us-ascii?Q?NQV52vOWggsQkTqM3DYRCVb1O590JtvSjT02ZMNxBCrpsYlqOB+Qy3evHEX1?=
 =?us-ascii?Q?a3p+27QyH1HrwuUQZ9DimozyZp/he4ZTM6Jovtl4LlCJ+7q2NEkl9fKCpD5k?=
 =?us-ascii?Q?7gqWsJjSBYY4mCm27grq+YZjFdhov1tPmdoRCZvwfKaTG5CSXL3H43MnEsuW?=
 =?us-ascii?Q?BPmjEksTWazppoj+/SdyoegRtWW+9IAzdlZOo+B+zzgAICIKlt6E9RqnHmcg?=
 =?us-ascii?Q?X1c21x/4tGKpO+QeMIaqe8Tmu2F8hanCPNNE4SyAkf6IHE5Oy9vP7kUMZhj7?=
 =?us-ascii?Q?wQlnI+sOmq3lXjeKtEipY4ftK/GgtFNLt1JCTKFvnrn09T7wMZL/CSpu2hoN?=
 =?us-ascii?Q?V8Etp4JTWgbxceAOTtgv+ta2IWm2LXkSyyP1WqcXKq3WkuD7EoeQQHtZ1zqO?=
 =?us-ascii?Q?xZJItXDMLvMzIzmRb1uMY5NhsWxaIFKYb4ciEfDgGXcZVxVh5Hv+CdztVozA?=
 =?us-ascii?Q?Zz/Wzm/DVjNQtI6D/bL1ewG11RRt5EfY6Vc+4RdEaMdn0k9k+BVDZ06/eyhz?=
 =?us-ascii?Q?J+5m6wy216Y7SQh7Gm87fwaw6cWeA4t1k3MuaY+zmTmjrtf7wgXMkZIXY/n+?=
 =?us-ascii?Q?QrW4knSFPa/RxGD7k1mFFSdiaBM0+FGlxSaZ+inGX/9+xTJcKhMbezqyGElA?=
 =?us-ascii?Q?XBArPRL3szXw9rOhXMmar6wnbiPcAqYIavNP3z9CwEOx/h2oSYGljAfgkFZD?=
 =?us-ascii?Q?z590QNiKjCrEYmfMLN5dfkU64jf109/S9GtYo/NcbL226bAMg7QXK6I/jl5i?=
 =?us-ascii?Q?okUrNQW8OA6GFwfWCP4buQC77YqIFYcoD4FLJa/hmw+m4NRY9wy2jz+qeuh3?=
 =?us-ascii?Q?MB6nCBqh7r8JrvgsiYgfhxeclo204WcRCwX+IkROT3BGr5H6i05WRP6eUSaK?=
 =?us-ascii?Q?2ALxz/ZwGbN8vOiisl5VqXxxjUbtBwYx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 08:05:23.3648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d330523-238d-4e8d-83ae-08dcdba679d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7369

Currently, `piix4_transaction()` accepts only one parameter, which is the
`i2c_adapter` information. This approach works well as long as SB800 SMBus
port accesses are confined to the piix4 driver. However, with the
implementation of a separate ASF driver and the varying address spaces
across drivers, it is necessary to change the function parameter list of
`piix4_transaction()` to include the port address. This modification
allows other drivers that use piix4 to pass the specific port details they
need to operate on.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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


