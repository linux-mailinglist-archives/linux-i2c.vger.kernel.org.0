Return-Path: <linux-i2c+bounces-12350-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2508CB2DD96
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 15:19:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A93251765CF
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 13:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9752D94BC;
	Wed, 20 Aug 2025 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="IzZm80k4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013047.outbound.protection.outlook.com [52.101.127.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452EA17BEBF;
	Wed, 20 Aug 2025 13:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695859; cv=fail; b=lFK0fpyiRTORYhx5KEVXatV4HgSyWd315IZt0A+qXHtJbmybX2x63MpVaBKATowDmKVrF4UXuVMOuCy57ZIHDnmNcYkb9cAFDF+8azm1+iWWRwOKTHKytJ0qGOJZp3g1fpTjl+1GWl5RGIAVNxRAcMkEV1xBPI/1/AOCdNJcLuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695859; c=relaxed/simple;
	bh=g/gqpqGqFkN+pRM/G0H7QE39sJDqpWnTZovv9niBmYY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lXA2K66KBGmQEvapWGB7dfLA74xwCHYaJPVC3lDbPxi+1hD0MV6ig9cJbLghH4HYyR7cFLtXWu5cmk7MXKan9vjPB+4wYUBlvOgtyTIyTunUHIW/8Kei+EHReOdn1oEq2PmsOonqFSUIeP3TzJdzZrjSp8iI4x5Ytpth3CzsIts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=IzZm80k4; arc=fail smtp.client-ip=52.101.127.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRqQKLNTJw9JXlQ351jMcFcapLX4MwXq6zXyulnAwE/um5DkWnft9f7ji+e8ja4SkxQESMmv26qC6HQT0ZhmS2yshR6l42t687UCMcwf+FiGcXj6G3yShvJHXdtnV6H3VVob6Doj9iOQ7h6RgdhjaSpRx8xsNZ190SWu9fRsF9STsJc3uwVyO+DenfbQAKTTJf1r1WP58xNUt9uqHyn9NkLebUNFh9J8KpdVupTDcWAitiaq5UwNfgrMNTHFJ1yECaHy5+0087tdtODLzMyWxgqYIaeqn99NafBVnlnZOzEpKXcYshHBHK1fjeauCpbBhE9FVNZzZDkZBPTP9blGZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmUzEAr2u9YjW7SIOXoL23h2vwFkRajPK0vNtlUinM8=;
 b=Kp2Z+67UErrhnz5zfoYAB7QRC30l0XOtZVDOyHlZkFJL6ilKF0BRWbVrof2sYwpWmIpGR5Zn4TKvqyNdAknwFHa4sAXICeBLVtQsTNFocokkCqtPL69QsGoXzRzDn65bsFcuTMQwOYQDL0XDvmtlQ8GnahUSjUE6mKIMnStomPPFb889nQ8qtJrzYgu3Df5XfuwuWD36VvJxKutWSoNoPyk6OrPKZaLD0pw+fCVwd4ZipgeNls/24K1F2EQxrU8qx56x78UAub6Sw/ERI2K5rKIJiYa7x8DVGD5x9+2GE1O2zXKQ9qWURzMgq5vfRSysjK63wsr5gr8dGxbMB5vtbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmUzEAr2u9YjW7SIOXoL23h2vwFkRajPK0vNtlUinM8=;
 b=IzZm80k4w9WBmlWLnuIeqkBxtxBcnkbUlNLCxp7lUBd23JjdyYLyY5tPo2RuhsJbEK9S5533XjKo94kUd2MPDqjxaQbNXqcIKzYoHcxtMWP3p8B58URLNk3sYf8GKjLb15NygrXaDdooGO7f9g00lNoXYZ5+fd6Rn+N3lz++taE6br6sxHTF0/AMl6DwD6DOFPDZxSqlile+pS58/wYWOJMzdXDLmfvWXAMgbBAGkwZSAVKQtNRWJPJMxUptM9pKsXtZYa08XR5kkKx83VusT5Q2jDnzuIwTIt5pt+Z9v5mPO0aT3G+VLGqFsFFfgIPt3TbTCDY/5TgI6WeskxA8Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TY0PR06MB5306.apcprd06.prod.outlook.com (2603:1096:400:211::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 13:17:32 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 13:17:32 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Ajay Gupta <ajayg@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org (open list:I2C CONTROLLER DRIVER FOR NVIDIA GPU),
	linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] i2c: nvidia-gpu: remove the use of dev_err_probe()
Date: Wed, 20 Aug 2025 21:17:22 +0800
Message-Id: <20250820131722.502768-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0110.jpnprd01.prod.outlook.com
 (2603:1096:405:4::26) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TY0PR06MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a60672-13f4-459c-0fd5-08dddfebeba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t99gpJvmrJuSthVCP87ke2Maqpaqksxk0j9Xa11ENUWf49IiatKFLyowj/VY?=
 =?us-ascii?Q?JpS9nvbgSvG62YtQiDn/5BfF7huL3rpgcqh0qqYMx5JR5SYP9PDZiFvghx91?=
 =?us-ascii?Q?FkldRGOCQB8pkCshlUJzKBP7XwVbFodgx1SVkZyoLsQerPAEMZENmBjoxtQ1?=
 =?us-ascii?Q?RPEajlCLz3PdiIyRc0w9bafRbn7xME0T+y8XRqPj67lvB+NHyMAf+xx5YU6B?=
 =?us-ascii?Q?Hn0tTWOVamReXcFm/VIYaOrD1Vs+mOul/pGJQcGea8bizfleYlEgh30cIo9f?=
 =?us-ascii?Q?zPqd4TvBFqZBdqbfEc1HW+JBYtrR8Qie8t/QnFD57CcyNbJ594qv1rkPBgF3?=
 =?us-ascii?Q?iNdtwBME5hGgtnY+NgNlYAuj1QhWKb2GES0C7HeUWZtB3VpNlnO1px1eaDq9?=
 =?us-ascii?Q?7uN388z19xyf1RJOQhgVw8+IY0hvlwA5RYcQsC5+eRBtHwCUYrkkQ6X/uv/i?=
 =?us-ascii?Q?FMiiB3HdONiR/Kyu43SwLDT0cC06A7BMpVedZyaKfyQkl6k5FzSne8iVKdQX?=
 =?us-ascii?Q?ov/unA2b34xJ2aaeRINeW08AcLuMuptj+A/43ugkHJBnera60Q391Vz2wsIh?=
 =?us-ascii?Q?XsU9IHA4fU2c5CS2fZ0wf6X0YnNAeGRym8ek4JD1YKq9BnndnNaBeojfmprN?=
 =?us-ascii?Q?OrtHvpKijcKdBsKB4sr7FfCnDFgGFcd6WCvyvG8Gk3FzLKUL3dWGTqDk9EL5?=
 =?us-ascii?Q?gDhGRDMIUmKutv85Te9WH2YTtdZAGdehEQQxUp+692GvPCpAvTLgu4UGUW5/?=
 =?us-ascii?Q?wxBkzUSdxvDKzl9NZRVhLP6aCGuJpna667vddm3DhHMGC30zzNeAtKi9/T33?=
 =?us-ascii?Q?1h7UUjTGZHpXn6eFxkVvhnKH+JWHw/q8WH0PIC11bhxkZF9BBt5QBtuvsBHn?=
 =?us-ascii?Q?ce1paCencIBqfMMaonQ3RI7CS+9kSEwGE4IG/XzON8gcXMy1LMs8NLhqmKAj?=
 =?us-ascii?Q?n9PcAFSLqD4pFGoz9GIkUzXHFpLUyHfHgiFyNxrxnvrCo9L/WtwGxoXQPuwr?=
 =?us-ascii?Q?uRzNvgnmxkKMFtswpt5HDzfgaX7KK9FDlCk9pzlZ3n0yL0EaLzfv1fmfHFgF?=
 =?us-ascii?Q?PBwRjOaiHwNxfMDMTvTZg1X/mFaLqYSFNZAXdpwKbg+ZA7S1TL12SyBc16eR?=
 =?us-ascii?Q?nzixeiDg9E434QCK59I6pim+traihv1PoFdOopMXhZguD+BmYpSMFVZKAFcv?=
 =?us-ascii?Q?+QgrK/vo9QCcwI2wE0izrHRGjh6ZmRhU7l3M3vROtt6vlCZFt3MqZEmo/+QZ?=
 =?us-ascii?Q?Xs9X1LOuQ6B8DYJ4STChXwSWyK4P5dOS0EvRX2kFQRqmTdGCykG4w2PwS6QD?=
 =?us-ascii?Q?JJPNi44oBOQBKY5TPc003NHy2P+UT++rnuW57Iw/Xd/PqzLII6G9A4hOd7hI?=
 =?us-ascii?Q?VblNOW64W4oyVO5wiF2+kJUKjgTJoeV1wlSss4+WI6FFAYcGcjx16T2sarH7?=
 =?us-ascii?Q?5x0uHGuNl7Gta3Dk4HhG/nCJN9A84ot6x3wfuygOjU8guTmpgCGfqGup6pqf?=
 =?us-ascii?Q?/0QQyHcOK+8lFnQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TQpPgLEqwA0sUV9M1OFeskwIT8uNpp2aoQ1WNqrUVDAkS9d3fiiuaMVxdxVY?=
 =?us-ascii?Q?8cqdbf5bQIumJBA5v7OEftmMmikoCxqyqCYswXXgpb2VyqHi3WqBBuj+nCMN?=
 =?us-ascii?Q?pRRuYw/iRl7RRT/fsarrIY6PgRfajcEOm0NFuH1apkw5rsU9auSOtFOPZnkd?=
 =?us-ascii?Q?euF8KFEjUne68NBn53K/JUoO55ZdqP1tXis8M+6O3E1FewDsryci2S6a0PA+?=
 =?us-ascii?Q?mTH19CiF8KKiiklxc+oDfJ6LH9rgYQ1+y/9ZGVe3tvqskQ3XeGlE/U6Fvpyb?=
 =?us-ascii?Q?CIgbHJr19SUBTE5JDuM8a+K9r21EZdYGaubKdnF/fjGotgEkoIRaYGnvK3xb?=
 =?us-ascii?Q?1LzjA6sjrUeemyqxlOmBPXfkh0cU41kuGAcLdeimNpEwUdK/urjCodHLgIOc?=
 =?us-ascii?Q?C+k2bJUP9Gim8nw19aBzMLbPlfLYlTP9i+W0TICWkbLajpFXAMqfzv6YHaex?=
 =?us-ascii?Q?L6w7Qu/cwoyHo8KUcJzoTWQCpNsGPDfKvLm7MBef8aqQIXf7nxo+Q0uu1vgc?=
 =?us-ascii?Q?k0gKUUWzd0v7471YxaVFvWASs8LBCc0XH+OoCyY3TZKw3TwyMvgDwvav5h4R?=
 =?us-ascii?Q?QZ7UvGBunTq6iLTVm86LdRTWFNYv9xlGUz6msw5CdisH5hLzEuSbuc8A9C3z?=
 =?us-ascii?Q?R53JYdhE6U7prhBxo12CX9WKn/TQCPym9JrBn8InlC0Kk9+Pu2ASQ8d7fhDo?=
 =?us-ascii?Q?LPtbhBVSSqTei7Ard8yWEnxRZ+ujSEWuvVE2q02YUqQ2MZUhcAAU/5fvHYPJ?=
 =?us-ascii?Q?4kKDig87apa2p5ODIoT5j9SOzUe79C1ukTpYIb+vlwK80HC0REc89yz9jDbE?=
 =?us-ascii?Q?xduBiDWCnmreaRJ78K5abX+6KBiNlVmotMRTRoqXm4nTawZXjGbMbtHp7zeb?=
 =?us-ascii?Q?1b8xkdBlkTpNlMhD6PL6IK+PpruL6Me4BT8LM55jb3m6sHQwaYPSI9VjZr9d?=
 =?us-ascii?Q?md1Zk0Y9bdEi0y+VrFhJxDJ1OfVTD7HvexZlrc0ryduYw2OM4JLOWQJoim6F?=
 =?us-ascii?Q?3SCCF+IwwXSU/WXFnk2IGFjzvanMI1NiH+Ca52tzksr5y/9WQ8RtGATnHLap?=
 =?us-ascii?Q?aGY44H+YC3MX9XnaOy2a6l97lyDRETr3aCzCIouSLweQgoU81MCfEwTy/i+8?=
 =?us-ascii?Q?5xm/oA5gxVZ95WtGXKzkAAVMX95zOoMAEV6dEM8GlsuvUK3euDhW4mWr6paI?=
 =?us-ascii?Q?xBANbcYLLaF9YNMAb2lttSSuuGGD7scr6taQ4kt99HoSVnPH2KQ8gR5ZD/sz?=
 =?us-ascii?Q?xHUxJ5RHoda7y9d6Hb4shFn9byoVJFEfgQAcJMsPNcGUrvZ3B+gdVpzXZip3?=
 =?us-ascii?Q?zwrnRmFxWAlux2/1U3wdt9b6KWY1HY/fALyLqCk74GhEiWMlRugKNqB33/sY?=
 =?us-ascii?Q?pnfrXt9iBqIUVp2BL2l/dm602pCUc2h0na5GjFz2MAy9ddte/aOroOMmuvPl?=
 =?us-ascii?Q?3lCkv+R8//XaRyJKsiVw1Uw5Znnl8hwL4OnnqnUjUcK5Hf6DA32X0LGdsHGj?=
 =?us-ascii?Q?VI1ziqZ8DB9F1n67T0p70UrorOwT3VeqeQY7/XXJJBC2ax06FKak/gXhcweT?=
 =?us-ascii?Q?XjSVXbSzIupKoCuiV/LDJbGVfxw7L3l7uu0n5jhT?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a60672-13f4-459c-0fd5-08dddfebeba7
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 13:17:32.2599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pMPs/jfdPlMsqFYxstHw8C5Dqb/1NSnQcRbgZxWOl5DyyXvVRIFt1a+TmKKeMvzj1O7qye6n6xP4a3rD2D9Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5306

Logging messages that show some type of "out of memory" error are generally
unnecessary as there is a generic message and a stack dump done by the
memory subsystem. These messages generally increase kernel size without
much added value[1].

The dev_err_probe() doesn't do anything when error is '-ENOMEM'. Therefore,
remove the useless call to dev_err_probe(), and just return the value
instead.

[1]: https://lore.kernel.org/lkml/1402419340.30479.18.camel@joe-AO725/

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/i2c/busses/i2c-nvidia-gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 541d808d62d0..056ed33818af 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -291,7 +291,7 @@ static int gpu_i2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	i2cd->regs = pcim_iomap(pdev, 0, 0);
 	if (!i2cd->regs)
-		return dev_err_probe(dev, -ENOMEM, "pcim_iomap failed\n");
+		return -ENOMEM;
 
 	status = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
 	if (status < 0)
-- 
2.34.1


