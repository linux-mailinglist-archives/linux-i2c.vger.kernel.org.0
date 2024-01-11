Return-Path: <linux-i2c+bounces-1270-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB6282B460
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jan 2024 18:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 539C41C243F7
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jan 2024 17:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F123152F6A;
	Thu, 11 Jan 2024 17:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QGmbrYW2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44E34F8AB
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jan 2024 17:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHIKyUQiF5e+LFo6xYkMuzfdiIhy4Iv2aZBJMXLy4vhjENC4/v7X6m65G4zNneuZG7z5I1VLTXjxGEuny5a7H0VsWwY5/MIVjqxaLVlh4T/HXqfaHXkpg/K9tOjy98y+yk3MMN+ELTPIw5D5qpJ+ER/H4Td7cU2YrpeUdLN/tlsW4/VxrhdZaVcWIyqNDQRGhWLBJKfLwOMKhMivpBUT7cVvnQG3MNmEw0qjAg1y7qNn6XFw5s//6OIVB20aGB3EPnHsmsiJ3FB6DLx9neCzYFYQQVBXB3EzliAf8X1oFPUeXXBvAsyhMFJYHWGjlovfMxuvWy7Qwfw8rj7vkhESHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qocRaQV5WB/1twOFQGV0v1zFMsOPW0vzTznj8HPkWPY=;
 b=nKcPPXpOgaRIPpwN/jVOMG+zRLEnVqm2K9B7U5U7nTto55zTOqm379lIQaeDnCe7GDKS5eYxMmLWt/f5hI7FF84NvcTNeJRpxkpfGoBtbIjfjBTfQ2B8nNys2c3l5oQ49ItHFM0/YIObnZgFKQlArmD/kgfEzqb6liNbDxMO8ttOrzQEzSldVf0raG7LELVKHIAPlrhScTX6lvxSe4Mbj1zlo0WNrxcwVFySvJV4UAcQhEix6Ecbk9D0OHe6dkAjp77bF15YZc/hwwT9fI1U0bUNK9YvYzFAX9Grn31IfJzBeWXVzGxc7idzjSqUgpUU39V7u3erZQwS7uEgxP2bmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qocRaQV5WB/1twOFQGV0v1zFMsOPW0vzTznj8HPkWPY=;
 b=QGmbrYW2cVNbuvFpP4p2UoVSH4nCgo750FESUPIy6gSo7I06/FoDhtZ4oAPP7ezt64mcef4K3FcLBUv7IoIm4NNkPF+LSorE4iZ/OGtvNDhbaczd6K2QUBuM6sMGctzGW6rsZ+Px5LIqb56Qt/+anuk2afuin2rpYssJCPNDQkw=
Received: from MW4PR04CA0170.namprd04.prod.outlook.com (2603:10b6:303:85::25)
 by DM4PR12MB6136.namprd12.prod.outlook.com (2603:10b6:8:a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Thu, 11 Jan
 2024 17:56:57 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com (2603:10b6:303:85::4)
 by MW4PR04CA0170.outlook.office365.com (2603:10b6:303:85::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.21 via Frontend Transport; Thu, 11 Jan 2024 17:56:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.4 via Frontend Transport; Thu, 11 Jan 2024 17:56:57 +0000
Received: from [10.236.30.70] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 11 Jan
 2024 11:56:55 -0600
Message-ID: <f5493701-4cc7-42c2-b9bb-958744bd8626@amd.com>
Date: Thu, 11 Jan 2024 11:56:55 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: designware: Revert recent changes to
 i2c_dw_probe_lock_support()
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, <linux-i2c@vger.kernel.org>
CC: Wolfram Sang <wsa@kernel.org>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi Shyti
	<andi.shyti@kernel.org>, Borislav Petkov <bp@alien8.de>, V Narasimhan
	<Narasimhan.V@amd.com>
References: <20240111125658.921083-1-jarkko.nikula@linux.intel.com>
Content-Language: en-US
From: Kim Phillips <kim.phillips@amd.com>
Autocrypt: addr=kim.phillips@amd.com; keydata=
 xsBNBFh3uA4BCACmMh2JZ9f6vavU7XWTg45pl64x61cugDKZ34jiRLohU280rECk+kyXrKGB
 GdtV5+8tZWhMCyn151/C/OEYIi3CP5DY6wyrjbFkhI8ohqR4VqyC9gWAqD25coTQpOHyt7pd
 8EvSBDAuL031gqw5w6JNeqEbMplZeToy5Rgdr1i35MZOzyIaO01H+F2/sOL7qk6pY21y5Flj
 ojjFT/uWg7eodnOu/BJ1Uem6FaO6ovYSAMOaCs/GpguznsS76ORsH6Jnyp6+e3KlZe/F2M7H
 5HWCVsS5np2rf1luDsfHKV7HCd2+4iFRhxjbbulSBRMn7zx16PEGh8ccNwJm9/nwof6jABEB
 AAHNI0tpbSBQaGlsbGlwcyA8a2ltLnBoaWxsaXBzQGFtZC5jb20+wsCOBBMBCgA4FiEEaBZs
 4ROWXWKVJWj8Z9viHdU8iO8FAmHm/zMCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQ
 Z9viHdU8iO8aXQgAnByD4TUD+xGXXDAkIopwqip2Vfy3qzNhmfzdvLxKxsb6I6Tf1l2pMPGP
 EHxDPfuQhheyh+iRWrba6flwBGaNriJTFuVpQUGoRcjV11F2cpEbToqv2LGPaXIpc7IxEoRt
 lg9VKr70XcRePKq4iH5e7wrmzACP9UlvaKlRJl97FTckZIguQQMZe9kqLga1yRDqcQVN5Kj6
 IP6V8WzRz0qGpVE1GE/vjYH13o2qHrvp9d/zlPBTZFwhNpLBn4JHohyxQ63t7eZ1L4U66Caq
 jZ0lhdN/psHJWab0SeIIRAG5+WLMcRbx3+LPjzIyrXJSonsm4t5lU3RmGmWwJSunxGDu1s7A
 TQRYd7gOAQgAp2VJv7J5eaWVdHvazWijdobOXSa13GnV8DXENQLQSSQlxGkLkYa3nDHr6Xjk
 z2NPFn4cf8GgMd7Bd4p3MR6DbwA4qKE+8ZW2x4XdH///HGDDEI69sDZEzLPXgl/9dv49dxym
 Q/nuco2KtF4xaMS/mjRsv7Eu5oGH+2+vPKe7L8ykXUh7SJmr0tI2/y9A6MVOPckdenywmKQ+
 6R0gw6aL2OeUyWZLS/e/3+0zFmQxeTyHpoJb8cNk/XqUGsBXsTO6y+7fdykpXNCfeJL/bSGE
 SXgwRROHCnQeKwVbbvEU/e5GZlNnKXoD7u2jyJxt4NTG2c0Jze+W3MPwh1wxzNg6BQARAQAB
 wsBfBBgBCAAJBQJYd7gOAhsMAAoJEGfb4h3VPIjv33EIAIRVHWqFbAYPZZtYKdwugwzL0FKa
 X0VbkUvKNG8SQAcdvkKmnSITWrIbecHPQaSqrtl/W8qKD6YFNOC9JNCHEfyLPTxo33WonQpo
 utm5nbRS1p45Mk65Uu76qhuHMjPnOgbMqmRHgWjIRiNfKm1QD5/3bml08HnJ1PuucuxI4HkK
 SWR00RE4Jyhxi1ISB3UEQ98iZtobAkTYa3aZ6xCZzd+v+o4CkLDKtS8vrBXpppi/HAeRlL7m
 waGKsjcegLX8cEHSblIct+9KKjUrE8uZyokt67sTYDlPapVCkhTtKn5O88jXkqA2PgAU6XqP
 KeUe7zYeAD22yc9K+Ovi7bZ9I5o=
In-Reply-To: <20240111125658.921083-1-jarkko.nikula@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|DM4PR12MB6136:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c0e56f-1789-4f36-dccf-08dc12ceb410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ryhk2+TCjl9XJLlb9oy0xCv/qT2FintZuGFOehEUgV+UGrpnqIGzs7VeR4Kukftcdztk9GZs9ZZluqYaP4uGNRzit+XUnjIQP6vFzX5Kft8BBSYMsAWd/q/d4UsOF0LR0aYZoC4nDr4REEQv9fScTqTZebLLT8wlPQZRm4fa+sAaO6pLD/+ecnhVUGK/UOBgRVUV4S6XaCkzIPJROVOnONHYlzeE/iaE9f4HS1+0MReviO0Mjf6fa3ty3K5/sa2JPXthyTrz0iUpfhLvQVcl1e5eVXjwOtPtBTLy8ldJa0vMdDxNm0HbwhsLmRLqBvM9QwsLg9wJRDmCMPTtkOrFSiF7QAUPQqn+0hkK5R1lLr5+Jz6igva9ty9esUx2ob0OVpfiPefcTS7dSsSTVdbuxyPzac0sXNg7POigBmT9f3P7BAbHFu+un6BZQfUrBI02PtDsHG2YAveqibYwfn74eshJbGaa+fHMWCSuTQARF9GgAXvqFegrOsSbo5SH6PsyRWAD1ceYCv8Mmc3jxGRWo3p+CNHelA4ZUOBF1mgeNABQn2E4zQCX2c8E9HMZVt7dWjzKJB3NHWY/9WAf9blDvPo5LPMq+qH/k2xfx0/CmCRMVsBWrjd1aW2LHRxcMjy+fTRf/ziD5eRBvvmmCdaEAnzgQM0fVn8hVp4J/GMuHg1JN2qglZvTX8nBcnc3l4fnNKdvyfO0pgKDHbj5C0iJXWeSmtbeq5LKiBqq124kzHIIuasHKtA2hSyY8aAu7BubirmPOXhhdjA20+SQSyo3MubrLr1cmeg308gnwQB/paHhwFs9l91iD2uoztGT4v29
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(82310400011)(36840700001)(40470700004)(46966006)(31686004)(40480700001)(45080400002)(2906002)(83380400001)(426003)(16526019)(336012)(70586007)(70206006)(47076005)(26005)(8936002)(8676002)(82740400003)(356005)(2616005)(5660300002)(81166007)(36860700001)(4326008)(44832011)(40460700003)(478600001)(36756003)(16576012)(31696002)(86362001)(41300700001)(54906003)(110136005)(53546011)(316002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 17:56:57.1928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c0e56f-1789-4f36-dccf-08dc12ceb410
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6136

On 1/11/24 6:56 AM, Jarkko Nikula wrote:
> Borislav Petkov reported a regression below on an AMD system and it
> appeared on linux-next only after late December 2023. V, Narasimhan and
> Kim Phillips helped to track down regression to commit 2f571a725434
> ("i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()").
> 
> Unfortuately above commit is not directly revertible so revert it by
> reverting also two other related commits on top of it. So this patch
> reverts following commits:
> 
> f9b51f600217 ("i2c: designware: Save pointer to semaphore callbacks instead of index")
> b8034c7d28a9 ("i2c: designware: Replace a while-loop by for-loop")
> 2f571a725434 ("i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()")
> 
> [    6.245173] i2c_designware AMDI0010:00: Unknown Synopsys component type: 0xffffffff
> [    6.252683] BUG: kernel NULL pointer dereference, address: 00000000000001fc
> [    6.256551] #PF: supervisor read access in kernel mode
> [    6.256551] #PF: error_code(0x0000) - not-present page
> [    6.256551] PGD 0
> [    6.256551] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [    6.256551] CPU: 32 PID: 211 Comm: kworker/32:0 Not tainted 6.7.0-rc6-next-20231222-1703820640818 #1
> [    6.256551] Workqueue: pm pm_runtime_work
> [    6.256551] RIP: 0010:regmap_read+0x12/0x70
> [    6.256551] Code: 00 00 00 00 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 53 <8b> 87 fc 01 00 00 83 e8 01 85 f0 75 42 48 89 fb 41 89 f4 49 89 d5
> [    6.256551] RSP: 0018:ff7fa5c740bcbc98 EFLAGS: 00010246
> [    6.256551] RAX: 0000000000000000 RBX: ff38ff5c159f1028 RCX: 0000000000000008
> [    6.256551] RDX: ff7fa5c740bcbcc4 RSI: 0000000000000034 RDI: 0000000000000000
> [    6.256551] RBP: ff7fa5c740bcbcb0 R08: ff38ff5c02ceb8b0 R09: ff38ff5c002a4500
> [    6.256551] R10: 0000000000000003 R11: 0000000000000003 R12: ff38ff5c159f1028
> [    6.256551] R13: 0000000000000000 R14: 0000000000000000 R15: ff38ff5c159ed8f4
> [    6.256551] FS:  0000000000000000(0000) GS:ff38ff6b0d200000(0000) knlGS:0000000000000000
> [    6.256551] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    6.256551] CR2: 00000000000001fc CR3: 000000007403c001 CR4: 0000000000771ef0
> [    6.256551] PKRU: 55555554
> [    6.256551] Call Trace:
> [    6.256551]  <TASK>
> [    6.256551]  ? show_regs+0x6d/0x80
> [    6.256551]  ? __die+0x29/0x70
> [    6.256551]  ? page_fault_oops+0x153/0x4a0
> [    6.256551]  ? do_user_addr_fault+0x30f/0x6c0
> [    6.256551]  ? exc_page_fault+0x7c/0x190
> [    6.256551]  ? asm_exc_page_fault+0x2b/0x30
> [    6.256551]  ? regmap_read+0x12/0x70
> [    6.256551]  ? update_load_avg+0x82/0x7d0
> [    6.256551]  __i2c_dw_disable+0x38/0x180
> [    6.256551]  i2c_dw_disable+0x3f/0xb0
> [    6.256551]  i2c_dw_runtime_suspend+0x33/0x50
> [    6.256551]  ? __pfx_pm_generic_runtime_suspend+0x10/0x10
> [    6.256551]  pm_generic_runtime_suspend+0x2f/0x40
> [    6.256551]  __rpm_callback+0x48/0x120
> [    6.256551]  ? __pfx_pm_generic_runtime_suspend+0x10/0x10
> [    6.256551]  rpm_callback+0x66/0x70
> [    6.256551]  ? __pfx_pm_generic_runtime_suspend+0x10/0x10
> [    6.256551]  rpm_suspend+0x166/0x700
> [    6.256551]  ? srso_alias_return_thunk+0x5/0xfbef5
> [    6.256551]  ? __schedule+0x3df/0x1720
> [    6.256551]  pm_runtime_work+0xb2/0xd0
> [    6.256551]  process_one_work+0x178/0x350
> [    6.256551]  worker_thread+0x2f5/0x420
> [    6.256551]  ? __pfx_worker_thread+0x10/0x10
> [    6.256551]  kthread+0xf5/0x130
> [    6.256551]  ? __pfx_kthread+0x10/0x10
> [    6.256551]  ret_from_fork+0x3d/0x60
> [    6.256551]  ? __pfx_kthread+0x10/0x10
> [    6.256551]  ret_from_fork_asm+0x1a/0x30
> [    6.256551]  </TASK>
> [    6.256551] Modules linked in:
> [    6.256551] CR2: 00000000000001fc
> [    6.256551] ---[ end trace 0000000000000000 ]---
> [    6.256551] RIP: 0010:regmap_read+0x12/0x70
> [    6.256551] Code: 00 00 00 00 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 53 <8b> 87 fc 01 00 00 83 e8 01 85 f0 75 42 48 89 fb 41 89 f4 49 89 d5
> [    6.256551] RSP: 0018:ff7fa5c740bcbc98 EFLAGS: 00010246
> [    6.256551] RAX: 0000000000000000 RBX: ff38ff5c159f1028 RCX: 0000000000000008
> [    6.256551] RDX: ff7fa5c740bcbcc4 RSI: 0000000000000034 RDI: 0000000000000000
> [    6.256551] RBP: ff7fa5c740bcbcb0 R08: ff38ff5c02ceb8b0 R09: ff38ff5c002a4500
> [    6.256551] R10: 0000000000000003 R11: 0000000000000003 R12: ff38ff5c159f1028
> [    6.256551] R13: 0000000000000000 R14: 0000000000000000 R15: ff38ff5c159ed8f4
> [    6.256551] FS:  0000000000000000(0000) GS:ff38ff6b0d200000(0000) knlGS:0000000000000000
> [    6.256551] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    6.256551] CR2: 00000000000001fc CR3: 000000007403c001 CR4: 0000000000771ef0
> [    6.256551] PKRU: 55555554
> [    6.256551] note: kworker/32:0[211] exited with irqs disabled
> 
> Reported-by: Borislav Petkov <bp@alien8.de>
> Reported-by: V Narasimhan <Narasimhan.V@amd.com>
> Reported-by: Kim Phillips <kim.phillips@amd.com>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---

Hold on, I'm testing this on top of next-20240111 and still seeing the splat...

[   18.822681][    T1] usbcore: registered new device driver usb
[   18.863839][    T1] i2c_designware AMDI0010:00: Unknown Synopsys component type: 0xffffffff
[   18.882449][    T1] i2c_designware AMDI0010:01: Unknown Synopsys component type: 0xffffffff
[   18.890568][ T3175] BUG: kernel NULL pointer dereference, address: 0000000000000384
[   18.894399][ T3175] #PF: supervisor read access in kernel mode
[   18.894399][ T3175] #PF: error_code(0x0000) - not-present page
[   18.894399][ T3175] PGD 0
[   18.894399][ T3175] Oops: 0000 [#1] SMP NOPTI
[   18.894399][ T3175] CPU: 386 PID: 3175 Comm: kworker/386:1 Not tainted 6.7.0-next-20240111+ #7 ad2022c7b217b1e9ec5a9b3b4ecf4603a3c9a2e0
[   18.894399][ T3175] Workqueue: pm pm_runtime_work
[   18.894399][ T3175] RIP: 0010:regmap_read+0x12/0x80
[   18.894399][ T3175] Code: ff ff 66 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 53 <8b> 87 84 03 00 00 83 e8 01 85 f0 75 54 48 89 fb 41 89 f4 49 89 d5
[   18.894399][ T3175] RSP: 0018:ff5a6e8852503c70 EFLAGS: 00010246
[   18.894399][ T3175] RAX: 0000000000000000 RBX: ff367ab45a32e028 RCX: 0000000000000000
[   18.894399][ T3175] RDX: ff5a6e8852503c9c RSI: 0000000000000034 RDI: 0000000000000000
[   18.894399][ T3175] RBP: ff5a6e8852503c88 R08: 0000000000000000 R09: 0000000000000000
[   18.894399][ T3175] R10: 0000000000000000 R11: 0000000000000000 R12: ff367ab45a32e028
[   18.894399][ T3175] R13: 0000000000000000 R14: 0000000000000000 R15: ff367aa50c2a9178
[   18.894399][ T3175] FS:  0000000000000000(0000) GS:ff367ac3ed600000(0000) knlGS:0000000000000000
[   18.894399][ T3175] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   18.894399][ T3175] CR2: 0000000000000384 CR3: 0000001813a64001 CR4: 0000000000771ef0
[   18.894399][ T3175] PKRU: 55555554
[   18.894399][ T3175] Call Trace:
[   18.894399][ T3175]  <TASK>
[   18.894399][ T3175]  ? show_regs+0x75/0x90
[   18.894399][ T3175]  ? __die+0x29/0x80
[   18.894399][ T3175]  ? page_fault_oops+0x153/0x4b0
[   18.894399][ T3175]  ? do_user_addr_fault+0x345/0x710
[   18.894399][ T3175]  ? exc_page_fault+0x87/0x1f0
[   18.894399][ T3175]  ? asm_exc_page_fault+0x2b/0x30
[   18.894399][ T3175]  ? regmap_read+0x12/0x80
[   18.894399][ T3175]  __i2c_dw_disable+0x38/0x190
[   18.894399][ T3175]  ? local_clock+0x12/0x20
[   18.894399][ T3175]  i2c_dw_disable+0x3f/0xb0
[   18.894399][ T3175]  ? __pfx_pm_generic_runtime_suspend+0x10/0x10
[   18.894399][ T3175]  ? __pfx_pm_generic_runtime_suspend+0x10/0x10
[   18.894399][ T3175]  i2c_dw_runtime_suspend+0x26/0x40
[   18.894399][ T3175]  pm_generic_runtime_suspend+0x2f/0x50
[   18.894399][ T3175]  __rpm_callback+0x48/0x130
[   18.894399][ T3175]  ? __pfx_pm_generic_runtime_suspend+0x10/0x10
[   18.894399][ T3175]  rpm_callback+0x6c/0x80
[   18.894399][ T3175]  ? __pfx_pm_generic_runtime_suspend+0x10/0x10
[   18.894399][ T3175]  rpm_suspend+0x17a/0x730
[   18.894399][ T3175]  ? lock_acquired+0xc2/0x350
[   18.894399][ T3175]  pm_runtime_work+0xd6/0xf0
[   18.894399][ T3175]  process_one_work+0x215/0x4f0
[   18.894399][ T3175]  ? process_one_work+0x1b5/0x4f0
[   18.894399][ T3175]  worker_thread+0x1d5/0x3f0
[   18.894399][ T3175]  ? __pfx_worker_thread+0x10/0x10
[   18.894399][ T3175]  kthread+0xd8/0x110
[   18.894399][ T3175]  ? __pfx_kthread+0x10/0x10
[   18.894399][ T3175]  ret_from_fork+0x47/0x70
[   18.894399][ T3175]  ? __pfx_kthread+0x10/0x10
[   18.894399][ T3175]  ret_from_fork_asm+0x1a/0x30
[   18.894399][ T3175]  </TASK>
[   18.894399][ T3175] Modules linked in:
[   18.894399][ T3175] CR2: 0000000000000384
[   18.894399][ T3175] ---[ end trace 0000000000000000 ]---
[   18.894399][ T3175] RIP: 0010:regmap_read+0x12/0x80
[   18.894399][ T3175] Code: ff ff 66 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 53 <8b> 87 84 03 00 00 83 e8 01 85 f0 75 54 48 89 fb 41 89 f4 49 89 d5
[   18.894399][ T3175] RSP: 0018:ff5a6e8852503c70 EFLAGS: 00010246
[   18.894399][ T3175] RAX: 0000000000000000 RBX: ff367ab45a32e028 RCX: 0000000000000000
[   18.894399][ T3175] RDX: ff5a6e8852503c9c RSI: 0000000000000034 RDI: 0000000000000000
[   18.894399][ T3175] RBP: ff5a6e8852503c88 R08: 0000000000000000 R09: 0000000000000000
[   18.894399][ T3175] R10: 0000000000000000 R11: 0000000000000000 R12: ff367ab45a32e028
[   18.894399][ T3175] R13: 0000000000000000 R14: 0000000000000000 R15: ff367aa50c2a9178
[   18.894399][ T3175] FS:  0000000000000000(0000) GS:ff367ac3ed600000(0000) knlGS:0000000000000000
[   18.894399][ T3175] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   18.894399][ T3175] CR2: 0000000000000384 CR3: 0000001813a64001 CR4: 0000000000771ef0
[   18.894399][ T3175] PKRU: 55555554
[   18.894399][ T3175] note: kworker/386:1[3175] exited with irqs disabled

Thanks,

Kim

