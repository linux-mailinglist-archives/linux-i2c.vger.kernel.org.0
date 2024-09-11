Return-Path: <linux-i2c+bounces-6539-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1064974FCC
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 12:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F1CC1F20596
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 10:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2281802DD;
	Wed, 11 Sep 2024 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CpdOaDID"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD07177992;
	Wed, 11 Sep 2024 10:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726051146; cv=fail; b=Mr3bK1IDlH3Tij5fLETilFrkB+L5kbq9qNrNeAI+7sWlR+OQbbZoyVqyjqFNMs5cqwNQgjKxSaFT9Oka9Cmf/Z+lKNDc4ptUnQslGmB0wjyCyDDHoyOSMxR/f1dRG8B1rkPcLyk2ERBTbOCzoCLZzhiW8HeGLRePgGSuRaKS6B4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726051146; c=relaxed/simple;
	bh=J0Q/kADp15LRulja8W8MlZ3O8WQk7neSwQd+txiX+DQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AUTtwn9cz/gmUL0auVlFZ4Kk8yWqngbsrmSWUiyF7GzgrhMY+5FZrEmylOzegSZIMQj9lNZsd0EEbZ2oo8/kAOugbehdxwnzjm4VMyBgM1cuDK93uKO//g5aasegSERHsYQOaMXC5vEZbTYpqxOQtYK+nLjyk84XAKMRWUOEusI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CpdOaDID; arc=fail smtp.client-ip=40.107.92.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPbXvOr27m8bYHjzjctCVyEmwZ78xbSH59HF0sWXbqTe40/xMcECp8adzoyygI99SZa/X4XNXI/gyugbNRzWXAQOnwdHvZ6Vf9ylwfeI70bcSYHg4mxJkI1wCt3Dp7hjRQFNQ/aGmfvLEg6QsOXw4ZzMgPH/CbKGJFUjvZGWF6oZv/d2P1pVAKSIEKV+kG96aehX5PQPkC5oFrAsc1z84jq9xwekifNeoLDw5yfPGZhdErreljarT+/YOh5+tKUSOxpaqyaa1G0jzXcTKR4NCLLDEu7mzExukUDtOJyt1xnWq/AQtMnSuRnhoFG2Ye1Bv/48pmGE1aRf+Gzn1Vu/9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSPf9jhgQnPcnvpgHkcUphtoF8OTjkrbYrfKLtbTFhU=;
 b=rqzV8DvmlfiTLXeSK5U/i7u8xBg6eKqfsheqmathV0Td/rdVoLEAmuuDj2YLdI/3gfLnrPNJS/IPWyZVyvxJbP2P8Dv5Nr1hKLNxlWKPDz0j/rnWarTr9LDL+Mux1Axy1sqJuytFf29VQZuEQIJGNekVJqsNtGblaNxctwxuvdiADERjSykDXYRFAXFab+2MKiXC9scC1Ke/li+poO1co7bK57oSIF0/9AjJwdmDkaUj3mxPLdO/Qk6Y4dwUm/jxWQpRJDbtamm+9o8ino0/ulPdUm+Lopa6Xbc7rG9nCtdjUl7YKP6MVT5161ghzWxRZQ7DdtukAig3SmAgpM2BaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSPf9jhgQnPcnvpgHkcUphtoF8OTjkrbYrfKLtbTFhU=;
 b=CpdOaDIDsalLNsY877uCgD8KNx9YRRChqS2Crveqx4VxSzz9kQ5ImjyBQgH6Ss7eRuzbWx+FYeO/0l9O9wdoq9GD6S5SZvmc3/LgrdbTtUo/vbY97u0k90yWDmX5Ii75K2dLi/apO7bNwL6xBxWc0WB1SGSM7/QTEFnyQT8JpdE=
Received: from BYAPR08CA0066.namprd08.prod.outlook.com (2603:10b6:a03:117::43)
 by SJ2PR12MB9238.namprd12.prod.outlook.com (2603:10b6:a03:55d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Wed, 11 Sep
 2024 10:39:00 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:117:cafe::20) by BYAPR08CA0066.outlook.office365.com
 (2603:10b6:a03:117::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Wed, 11 Sep 2024 10:39:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 10:39:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 05:38:58 -0500
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Sep 2024 05:38:55 -0500
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manion05gk@gmail.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>
Subject: [PATCH V2 0/3] Add atomic transfer support to i2c-cadence
Date: Wed, 11 Sep 2024 16:08:49 +0530
Message-ID: <20240911103852.162234-1-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: manikanta.guntupalli@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|SJ2PR12MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: ee440d12-9448-43fd-9d5e-08dcd24df294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eZy3DRpmp066vYMB0CxhtzmgeUVKbLWEJaPY7MtiacCngQpgR+myQajAM2tR?=
 =?us-ascii?Q?swcSJV5VVPKePxMkUNSk9Uga8NH0xF8HsI3OcUTokyoGZwhp39TaJETRi0Ra?=
 =?us-ascii?Q?8uK0JsuZcbmWDAZ8EY5awlglNl5pOwaYnVoCi7d6h/oClBKJLNNFpURuLDHR?=
 =?us-ascii?Q?11RzaN83SuNopSNOwayVgmAMvo4Unw7AK2HQH0o2rag1RfQ1eN9b/3sXN0J2?=
 =?us-ascii?Q?m61AHwEcJmwa4osneT+v2nqwxx/O6h5wOVy2e8N0CGP8qjwGd+62W/atBpre?=
 =?us-ascii?Q?nP9pfhFqc1Ai7/5hMSTYBOGkrYy0IscwEaHHQoj8ckBnP38v0YdIWHgzdiIX?=
 =?us-ascii?Q?mi6DgcOVsMxTztbtRtVECT6b+WynJfw+7G2z14efyulexDjJWMC7+0I0DQPW?=
 =?us-ascii?Q?LyLc8vQo+wm7aQLAy8K6XUe7fcOp1+/LOINcTxEB1e2OvlLMBk/PCVXJ0YOI?=
 =?us-ascii?Q?B511/qXUl21Nja6drFhZjmVLGNIXma5mGqYrodXZvnzvX++e8yWc4XSzVXJv?=
 =?us-ascii?Q?42JCOFpaXWBsHPXM3EhC8jple4/NMxkarufdmYPIfhVkh2M6qL87zUF6aPVR?=
 =?us-ascii?Q?ILzK4/Zfxsyuu9U11jLunRseFjRPYY3i7c3drLHn6puXVdLgCEdIwWuVhk+l?=
 =?us-ascii?Q?ZYKSC+3lnUVU1UqNKEh3ByH7WWVSEyVaoJ7dMbkjq0UDiYEpFdvs23VGJpLQ?=
 =?us-ascii?Q?fGik8PsqnCUEwc66ReRyud9DrDn49dS7bQdbgNtM9cvV0drAy+SaIiAuxEPB?=
 =?us-ascii?Q?OytXExL7L5GtFKpF8T7H/FyDvBfyGSr9V9iqPJ9ffIMiOdZljxb4PaU3AVt+?=
 =?us-ascii?Q?oDtqHN9ejuKhFFGKqOjZK9X5YH0IgxxACevBqwc23/cdjCrgK9NNfZ3Y4Ss8?=
 =?us-ascii?Q?8ZFgKGgOWDK/qQm9tWO6AvDZPaLGgMexM6x5tlVJT8Vkiouaug398cUWiG8X?=
 =?us-ascii?Q?XLZxd3omUR7/IyIPpKP9wWVdDh/VUsz/rnTLBX8mdbkYB396ZR3sL764Ftu0?=
 =?us-ascii?Q?W31U+PCfHbFa4TRWRWE+CjbNiqBLjKraQVsPZQEaAZSLMFWEeylY8naFjqRC?=
 =?us-ascii?Q?S6sP+4/fn3gkhtywxgXhXSVn0DHITFRolgNmFI8lHZiqwR0VEcFq5GsJ/kDe?=
 =?us-ascii?Q?gkPVplncKDO5VwK3drnxevwW8K2XUZRN1hr9Mngvcqz6OH/PZAzAiqR0euPz?=
 =?us-ascii?Q?sfH+uPd793Oavg/6Ilteh96a2/S3kspUExTKrzm8Zzq5TRCo98wzPrgwKq9U?=
 =?us-ascii?Q?VUyQ6+MWzHwGBUzvOf3D08UoQ2Wf4R/pFef+ptYgJCzpPRsSVbQCWfJ/yZo1?=
 =?us-ascii?Q?0MhjU3ZICcoKqK5mgEZii+HcvD70JYd3Q+s40EInZOmC+F+eiU2EHYicW8wN?=
 =?us-ascii?Q?yzzvma3wRsPNY02/0ji3bRiKzpl3S9mNg5oGcNOIcE03oX1cjTe3XnTAiatW?=
 =?us-ascii?Q?xbRtz2FwVgmCsVZLVbrQs+WW1ySo/FFo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 10:39:00.2345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee440d12-9448-43fd-9d5e-08dcd24df294
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9238

This patch series adds atomic transfer support to the i2c-cadence
controller version 1.4.
---
Changes for V2:
Added review signature for PATCH 1/3 and PATCH 2/3.
Simplify the return statement of cdns_i2c_error_check().
Update description.
Remove unnecessary typecast.
Update if-else to reduce a level of indentation.
Expand *id->p_recv_buf++ to have clear operation precedence.
Move variables to inside while block in cdns_i2c_mrecv_atomic()
and cdns_i2c_msend_rem_atomic().

Manikanta Guntupalli (3):
  i2c: cadence: Relocate cdns_i2c_runtime_suspend and
    cdns_i2c_runtime_resume to facilitate atomic mode
  i2c: cadence: Split cdns_i2c_master_xfer for Atomic Mode
  i2c: cadence: Add atomic transfer support for controller version 1.4

 drivers/i2c/busses/i2c-cadence.c | 423 ++++++++++++++++++++++---------
 1 file changed, 303 insertions(+), 120 deletions(-)

-- 
2.25.1


