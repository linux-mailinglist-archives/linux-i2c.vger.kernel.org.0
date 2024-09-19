Return-Path: <linux-i2c+bounces-6873-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 418E897CD5F
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 19:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B59E91F23BE9
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 17:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B931A01BC;
	Thu, 19 Sep 2024 17:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4vujTZME"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ADC1A0B08
	for <linux-i2c@vger.kernel.org>; Thu, 19 Sep 2024 17:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726768793; cv=fail; b=FK5wwEPHEOqamayoe0YkHzMvPfJdnhKH2fFcdqyVhtnK6MBPHpXKe5+r3QklJ0xL6z5IQLE35/FkYWtXt6qkkN11QJEaC9lJ7PJdnGAa04Hlv1VVXVN0zvfCllaQK74LB92ftxhpUHcx0faB5+0JOsXSbwGksLjVeFskZYWu1UU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726768793; c=relaxed/simple;
	bh=EbHAnuaRVhQTeqGa+PT8hC3LlZ9yqJfIeqM5E/IIP4Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MepI1bEgH2nsQCcYgBeqIgjiNOYZ7SxNT/0aEQcDsCpxvvz/Je4Y6p0DVO+WGAuomUjOAFmotWx8vb/y78qdp//skkACDyW1Fi2o0u19XMsiqAL018VvCQj2MpFJEoLebDAQwUSCkWHXMZjxwy1phX+69AtXNdNUT/LTiq8g42Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4vujTZME; arc=fail smtp.client-ip=40.107.244.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIMqFCjVJ9oHnhEs/N0nW2LWNZRRwEmZ+lEwcKN0CH2phZFGy/63TB2FjkqBrrmyyGpSGqHNjhrNf9bjWWvEpgegSLYTBBCBwjmzurxBx3zY7zvfD/ibx6BQkNOca3SuJ53KK4kVwCB5BaZHErTxh76JXXTGzlgvkBz12iCp0CazKAhab20HdM1XepwN8RpOBpIUr6vGfvcn2/Dk6aNVFQeDVWRg6EUULqlpO5qFe54+Wh2UIL8FrM5nju/H8Fe+B78oUPkdhNO4PvPv9MiwTSGFfO/BqXSOgoOlTIAyeJazeKUVhcOnetp6ANhiks17Na87XAkAtFRFUWxYI/I+Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pv//g30l8p1auD1afNh1AfRALQVgbYB16xHyAlfPbBs=;
 b=O2TVP/YcvYuqEYM9GMiXDYXrL90aAAMCtTxBuSZZCiPwSBBtYiKhbKpqtO+dgwStZb9uJjmnft0a2cEbToqACVt2dbZz9W6vGo6e90cSp7zC7qnx3RZZ2YJnvosuKwpkisRze9dQjFxD+K1iH1SVsiHXUTSAqN72wdY7otvAXwnrTILnpi0PlXLqoWNDdZ8xVpO5K6kbpqCJ8vhBTutoqHCroWqkCrkSF8zNQ1uGXDaVrJmCADUqhsQz4e7CWz5fOEMyOG+WI8pGRq0/HsWq2IzVO8cQjgDnArHYV5DIvp7oPaCQ9v+XcywuYmnNIizIBAMyK1FGbo7Ru6IvN3PTMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pv//g30l8p1auD1afNh1AfRALQVgbYB16xHyAlfPbBs=;
 b=4vujTZMEZrMJLiyo+r/oZCyeqIoV/jqb8oTfyT7TA7yIxrNklOr3kv3O/6gN0qJ8Kak4F8bAuQnbMDhpewOhXUTDYic8+F87c6scssLAnsyZ38nttkMdt28m1eksIcfmWH91toS17Um0mx6ElWUKIrOjVNFCJ4NYhu5q1cnFSs0=
Received: from SJ0PR05CA0055.namprd05.prod.outlook.com (2603:10b6:a03:33f::30)
 by PH8PR12MB6796.namprd12.prod.outlook.com (2603:10b6:510:1c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Thu, 19 Sep
 2024 17:59:49 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::3f) by SJ0PR05CA0055.outlook.office365.com
 (2603:10b6:a03:33f::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.15 via Frontend
 Transport; Thu, 19 Sep 2024 17:59:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 19 Sep 2024 17:59:48 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 12:59:45 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 1/8] i2c: piix4: Change the parameter list of piix4_transaction function
Date: Thu, 19 Sep 2024 23:29:06 +0530
Message-ID: <20240919175913.1895670-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|PH8PR12MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 38add733-79ef-459e-a28e-08dcd8d4da52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qDlVvWKik5i/75TdfeTYnKyX5lsA5DbqBZm0gwdIg0GUUKAqNBpEZLBBzI1J?=
 =?us-ascii?Q?qRY0b1g4m4oaCw7CN0BtFCDEE9lvyqqsKSF+jb/HYFFONMgA+LhuaxjeiWPI?=
 =?us-ascii?Q?nXO8Xq9DFw0mlLCS9uqKlQWBtoQICjqEbKta15n0XvdpGbQJF2D9LovlGxyh?=
 =?us-ascii?Q?qZU/RVPzeAhd2Tc55i5J/gJZkzJ+3NxNU71psV3DxuHpcR61wynXqI0WG9Of?=
 =?us-ascii?Q?5WxHT4aza+78YrJEx92cg/w2/wOECseI9GkPdxH0U0HzROp2aEzeFrR+aqqq?=
 =?us-ascii?Q?WoWtDF5rft+dlXHEiVne8bEeMO6OPMbJndvtJGI9ZiWVi8yjYD9ApiYt/XEV?=
 =?us-ascii?Q?QLMqTxU3/nTLeSdOnWetZASDjyLLN8Bg3zp5ifvJco9Wb9MYKoIjIKRNM71h?=
 =?us-ascii?Q?xmJE8jHWatFw0VYibHKmUj8vi3SO1MqSXKTkSKO5u6/qsVspups52RdxTkJ/?=
 =?us-ascii?Q?evzZcVam9aANCdkINgT7WNRVESuECqUfAJoHlrYCfEAZZlguq7pmQz0OJVqi?=
 =?us-ascii?Q?0sonjaRBlCG20ODlY8CcYNic1KP49cPkKkaA3I4J4MaCXjNW3pI9l1+fGHIJ?=
 =?us-ascii?Q?mi66x9wX1RIXnlAH8cr8PIcLgJB9et0R2lDgSP5TIhhsDCwXsKg1lKGxYK4Z?=
 =?us-ascii?Q?1tW6qXozQHdtY9LFtquP/ed8EjFTmsGAVBWyCRyHGDO/ki5ioJhhhuKd9cDx?=
 =?us-ascii?Q?O51uCJwn2nz2SmhiqYbOOLJOYi51Vdz3hyLun84Oe6skR8Nn9XP3yqagQhDc?=
 =?us-ascii?Q?vikwkX5LDNAjegVLXyAmDjm1n7HU33jlm+41GnOWexk3vjroHaAAwFbGIKp5?=
 =?us-ascii?Q?79QPSSslOYP+XNlmk1coUH5DGQMpP6lPPvGC6wk6tLezHxDqCBFJktroLMfW?=
 =?us-ascii?Q?m5JaSUpUoBRlnfNxXYiXrUC2cQzRVOAn5Y3WcR5yiyz2UIFwFpFa1aZ1qBWe?=
 =?us-ascii?Q?YEO1RzcFu8prGQbU4Hn6l/BNtUgivOdGjKeCM5q2kNkIveJ/YdOIgQ4oIjPX?=
 =?us-ascii?Q?zrixUXt06q1ejg75tDI0r2JgQEig7k8PN5tir5bYrMW5tczld1mPinericD2?=
 =?us-ascii?Q?042pzerH6EdxOt1NGK4YxgeVzFFcnEcbQfEmYHbwj02eh2MJM4s32vlZT/Qb?=
 =?us-ascii?Q?mG22Z6aNr/3jPxrbO/biNfkNGT9WhHkWmlcPQEmYi4nLZJePyfJ9v9z8dSWX?=
 =?us-ascii?Q?8FRDraSQ07qhb7+KnAFk6P/tN++OLonIEtJhQ+UHvJaLXbkL+TMH1KTPhX3q?=
 =?us-ascii?Q?xDrCqz1xnQQifw80yxTdwUAV8Ng3X3LlYKIvXle14e3N/kqwZgKR3E1K2pNm?=
 =?us-ascii?Q?0TnrkyeQ5NiS67iCYGPiO9xKT9GrkqjoajhW4hTnDUMlHIaY8gdUAFGXN2d1?=
 =?us-ascii?Q?I88sdvcJSXOqhvQ7zMm+ITQyyCSng9y9Y/WPlgVuz0iUW2fp6985F3R1xtWK?=
 =?us-ascii?Q?hPC79uglmDRJD84yHXVta8qpG5siKa32?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 17:59:48.5564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38add733-79ef-459e-a28e-08dcd8d4da52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6796

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


