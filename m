Return-Path: <linux-i2c+bounces-11302-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 599C1AD2309
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 17:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B614716B909
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 15:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE212144C9;
	Mon,  9 Jun 2025 15:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Pigw/33h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBC541C69;
	Mon,  9 Jun 2025 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749484591; cv=fail; b=XjQhY3on3g6lrRd2kizxJALPSYMnOX6eb260Mbu8bl8pweGXaTqFalqiRY8RPyhfkGchltRcjw1y+xA3/rU30OD5+hyCcqL6kuriP5wNA9dc4Pvnp2Dwp8ECMBJl4ZgjmJsUGLVJXHMEp1GwGNPQ3t/rY8ooq0nkX5WcysZFTxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749484591; c=relaxed/simple;
	bh=d0sKiADcnlAo14rTobngqe8/8Ak8hig0XhpQPa4hmWw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o9eOEmQ0dWuJw/gsXidbXV5xawbKvYdl4AiIINJmVMfbaPE7xoOs+eeTSeQVVEvQ0MJ1sgiwHYIffHgzCijC6G1pMdPkQiAvx5MSKxwb8KpYSBlyHznv8BiBJhQvsHCHLTnpGdWBkxRQ9yCrXov/1Fxh+ScpvnoYXRymBNCFVOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Pigw/33h; arc=fail smtp.client-ip=40.107.244.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzfbxhM7uMfAT58aknck5ow+Ncs4EXqb3nfhtJztzjRGGcqr5aJ4KluV0wM1tlE9QiGNxvwtUpF8B+rHFc9qEoqrze6PR9Mv4sFsawckUQ3QsQL3Cj1PunfuP1lve5MJ3m/q0H0YOHJ6bI39F+0/DSCWgW2oglqHrQKm7OreudAo+Fx5gZJ+Yf98rMFu+8BsJrXuS6Ts9WMvlY3U6IKEgVW6/31cAA2KOc2iuku/s58lyPZRYjJO5spfbY9akpYllVONWsmoKkjlC33FJWa/wpd3MsQiYsyWfPHs78cmQz309ILFldcDT3pmTCw/HMYHl2cMiHk8H2eiczYHDLufRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbW30tIl+bf5iuR5TOGQ4uIXPNH0d6FIGodWpWMqEEA=;
 b=hwr0BjzH1H83GXE+tDy9xXriibsm0eSCmVS5a3Z0k7/vwJtOMlzw+uAVFk5TG1gGCPMlLk2Aoc9yY9ThYAfkZ/DOrd10l+pu/XyAbZF8OSphJOkHISjZo9JZRqidpR4oQp2LAcTf7vQCVsbXfNgd3Wvn3b1APMBylz99lrvtSKMzenYsg5jMLzs2f3NItzYTM0Q0CKp0vdZUjE0gnpmuKuMfB7Y6f0rfKzThmIpO36Q78QLMRs64r+YFboO/n9vmTXyWy80DENXbwEvCXodmcI/U07rOH/LbPt+/PL6DPCFSuLO7qP9LbKETONqQdAnn/iYqVYVYRc5LCHp6CmxvZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbW30tIl+bf5iuR5TOGQ4uIXPNH0d6FIGodWpWMqEEA=;
 b=Pigw/33ho33T9nQbFg2Oca+ykTa+uKGl73t3unhUgt1gLsKyonTYPrzEL+rR1nQJuZNS3mKW24Q8HayH7NJeEXIqkPTYX7BuOZEy1vzSBVO6auVthV8B6DcxuxfzDnUoh38zrLY8n8t4eArvVwyRHwRZn1rp3ck8QBS7TjvlXFY=
Received: from BN9P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::19)
 by SA3PR12MB7860.namprd12.prod.outlook.com (2603:10b6:806:307::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 15:56:28 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:408:13e:cafe::e3) by BN9P220CA0014.outlook.office365.com
 (2603:10b6:408:13e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29 via Frontend Transport; Mon,
 9 Jun 2025 15:56:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 15:56:27 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Jun 2025 10:56:15 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <andi.shyti@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<rdunlap@infradead.org>, <hdegoede@redhat.com>, <sfr@canb.auug.org.au>,
	<linux-next@vger.kernel.org>
CC: <linux-i2c@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <benjamin.chan@amd.com>, <bin.du@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <king.li@amd.com>, <dantony@amd.com>, "Pratap
 Nirujogi" <pratap.nirujogi@amd.com>
Subject: [PATCH v4 0/3] Fix build issue when CONFIG_MODULES is not set
Date: Mon, 9 Jun 2025 11:53:54 -0400
Message-ID: <20250609155601.1477055-1-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|SA3PR12MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: 2280706d-40fe-402c-47aa-08dda76e31b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ttq0KDSjnTboMFvJX6WcvGkNmtx22WFYLxBuRx2oKj1VY2xSYfwtJqsRTh9n?=
 =?us-ascii?Q?GTPipNi3ISzRL7hmC4TfmeaczRBT/fSe8YlS7K90V2p3LE/85D4gAFf2rJkO?=
 =?us-ascii?Q?YcjF8PeREWBmmZnHGp8LvtNsIwrufvG4ic/4yINEpSE0truuHc1gjh9MLCfY?=
 =?us-ascii?Q?qR4XuCmmipZlIReCpvSZXTgrFZDdfZN7rbyFQ0q381SoFTWUYGOk3uAJqeG/?=
 =?us-ascii?Q?i33AFbj1ECuVcS5/W1WvGA3ngakSmOa+notKLU6CVL8l+pnmFNePYntNP5j4?=
 =?us-ascii?Q?ZGmOZv8SNxbKSDKd4spYOEqHhKQRLLAKft+KI7iOQrV058dA5tbBw33sKfao?=
 =?us-ascii?Q?gzMbWCpjXnlhenTL+zFS+fWpDL4knGjqWqkO1CwqLQP4JJrCKqs/vNcVb2Oq?=
 =?us-ascii?Q?/O1ZwPoHk6tmUguxzYa5Lf0p2xwKRpl0nJWVCSMZNdeCWIiUT2yiSQt03BwM?=
 =?us-ascii?Q?bPngpQ98+ddHHPdm72v7mguKz3ucT1zxi9kKmkpIc7ZpZbq1mjrrjCG2naUe?=
 =?us-ascii?Q?o014EChhdIpVQ+a7AjBTu9fKO5d36gl2dNKCQmhG1RpCA3xizQy5HXN1qN76?=
 =?us-ascii?Q?7Kc5lTsH+8Jd3jrvjUVaZzgg1uPPH3oEzBoDerz97si0g525J7SzNOS9C0Ub?=
 =?us-ascii?Q?nwA4HzX2YHqa0aHnc5uXwGrMKpo3YUv1wwJl+ZC9Vxoa/QhZVDmXSMp1844K?=
 =?us-ascii?Q?fWNzEc4N0idaA+FFhp83E/qH7SFASPvMJnIUYyBTkOruRf3YKkf5ft8O19b5?=
 =?us-ascii?Q?dbBZyc+znIFL0IQklVsmIaESeU+SB9aGQ370ZXPRft7SSYvw+TeILHqk3cOs?=
 =?us-ascii?Q?+GuT5FfmO7uC/a98j7HSUYpUf5C+wExtI2Ekm+GGqQ2+tzW+HQyHRwkDdOJa?=
 =?us-ascii?Q?UQSgaXgjtRNkH/px68dwscxsIfeWUx/jK55bxj28yNFDBrhJWl7dBGyYQELf?=
 =?us-ascii?Q?4jxaM2JAaML64JWF3vMr1g6FMsgvAEPNr9AzHrYxz3+hpqMPHyI4auIY4HVK?=
 =?us-ascii?Q?xaRTPt+UCADTS5W/LSj12kBe7D0B+vqfaWy6uzX6a2WAEy428iEZxfgAOZpc?=
 =?us-ascii?Q?SJhxFQYIfS/0fTVYpxYAgNErZFyuUaHLkZMafCP6kPiyA5hdfbzR3g0bGgCc?=
 =?us-ascii?Q?Lm/2HXwwEjwbMtDdA7lK7fP2ByUoXC7LCMQixG/SoNdHAK5U06aYY+vvQ2XM?=
 =?us-ascii?Q?LpQobeU5nJecXP+w+ph1Nzy2lw6Q6NOnNYatCXZ4qSs4bo4OIxIa0M12AxWE?=
 =?us-ascii?Q?ZzlL0RJrgIEpMAv+KHNsZkWVNZcTp9z6C/V13sdHHYDsOme6yfbNp85FpTe6?=
 =?us-ascii?Q?B0eRXVtaLLMsPjlXVWj5mFsqIJQOIYDvA7V8VKfiRL8k8sCvwogvTK9QUojd?=
 =?us-ascii?Q?yyRNPJWNa1SPQNDb8+Z4AarWVg4q8Qe+ASj/DnEB9Z1kWcrmUbJQFglRf3/K?=
 =?us-ascii?Q?901fOZLoNV/NQwtwGCIwI9Q1V1JVtlUTrIV/4nKuek2eeuMgOZJeyX/tpdhe?=
 =?us-ascii?Q?pRv6sY84SP9V6V/Mb88UsTNiRKU7WN6K1FV1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:56:27.8168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2280706d-40fe-402c-47aa-08dda76e31b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7860

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

Changes v3 -> v4:

* Update MAINTAINERS file with the new isp4_misc.h added
* Fix typo error

Changes v2 -> v3:

* Update commit text for patch 1/3


Changes v1 -> v2:

* Replace snprintf with scnprintf
* Add new isp4 specific misc header file to include the adapter name
* Remove 'Fixes' and 'Link' tags from i2c patches

---


Pratap Nirujogi (3):
  i2c: designware: Initialize adapter name only when not set
  i2c: amd-isp: Initialize unique adapter name
  platform/x86: Use i2c adapter name to fix build errors

 MAINTAINERS                                |  1 +
 drivers/i2c/busses/i2c-designware-amdisp.c |  2 ++
 drivers/i2c/busses/i2c-designware-master.c |  5 +++--
 drivers/platform/x86/amd/amd_isp4.c        |  3 ++-
 include/linux/soc/amd/isp4_misc.h          | 12 ++++++++++++
 5 files changed, 20 insertions(+), 3 deletions(-)
 create mode 100644 include/linux/soc/amd/isp4_misc.h

-- 
2.43.0


