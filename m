Return-Path: <linux-i2c+bounces-8204-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA27B9D87CA
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 15:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B965416B5EA
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 14:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5EC1B0F15;
	Mon, 25 Nov 2024 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JghwB0Sl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2067.outbound.protection.outlook.com [40.107.249.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1937D192B7F;
	Mon, 25 Nov 2024 14:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732544435; cv=fail; b=aMnDgyXro0AYIkf6LY9Qd6Hx47AjeUdoolsfLv3DKlMte1Ae9OiALELcU2Ir4VrnAa8ht+A0zyT1Mt4KbM18V9SQ6Ejc6a/M5j7sPDUyjYe9cXrmtucbvve360t54scq6C1xeuHOYunpVqACX4SzRfcmagZW6crmthO4eQjdE4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732544435; c=relaxed/simple;
	bh=Wy7N6nO7uqvgnQnD0tAKmXQyGd4DhCu6mWO3vX7N5FU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=iV0kvp1e/DQVDjBvYNjO+fJdLGn5Wd/DOVYux0MtTvA2LUX21vuz0e8ZbVbJ9jSNBvE64eXs7mo3RajITrq8hOKqmMxa01eHgdD2N1Z8Nq9rpGr2QC8hbPSojl8QA6DVuizgrAmtqMxwKFQlf6diGJVyHVgnQwm38IxzinbyPGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JghwB0Sl; arc=fail smtp.client-ip=40.107.249.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHTVDT9L3kg8Mv09GnOWezkEMndwdoyyv9yIr+asxBcb+DzhGtpq1sBBy7b1khkEGAE2dBrYZ1kSipEN89YMz/4Mc0lUi1pgwEHpJEJoWMi0+21SFk/u+C9NPEuQJOELbsFbQxI7mBkwHN7I0mf9oJd0KRRD9AvlX8tjrOgsVij/jwBHOvLM9KvzeW7jaIOtHjViTSRA/ga/ra0H2MqnsCZi9hZ4PJK4ex3KXFHrlp0/sRoOXzR6v/VM/Hl2BDGdf3FoYLMjo8HKxq0Kv4py87UoQb2vQSjcdJlKxuijIUXnYqks6dKgOv8sZDGGP5zBaqQdcrDHYMjzGb1fk36ZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTn4RDlF5Dg4X8Uo1SHTU5yDifdg05aCPqTj49kXR88=;
 b=gc3UyNmXWKSGRyIB0xLcgyJUELNJChlKLRy0d3B7l5MfyjQDygk8ml5/bGad+VWIlWq/WRBrhx3PyzK6zfuox48/+QnjSapkj+yuwD1hmxqQteEIGuqu/ViALSCAU02thypO4wbXIYr7SBHI2HLHQ9t2/tTIz/ZMc7kGbDhptquxF1cV9ys8OXZC+B7/TJXltubL7rdnW7NXAaND//+hnCKqM0SmVXwDnGj3Pq9gl0gLHG4B2k0P3uL8HqVQ3m+wnZEKwYSxl+OhUA6hS2Ri4aaRiERs95///MbH8Q980ojl1Pe/WaORx236FrvBPKB8oh+tj6fQKRSbLvQ/MnAnxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTn4RDlF5Dg4X8Uo1SHTU5yDifdg05aCPqTj49kXR88=;
 b=JghwB0SlzZpbqs8aisTYaZLA5l/17F+fVY9MtvC2FY5B0rKKMWNpWHV530ltjjt0KFY1t++QPxCgVB605KzOD5T97ifqAo61Urnh/jABsl4alhiAZjx2OZYKkS2ywHkUgLXVuD87DI0UpEXl0yIH0sGYMaMgAMGWE1yKB6LIv22EGALMMWet/rVbrWAC/s7a5eg9XaGU66PZOCR/wvWqROeZeNvP6XEgMfnsvZgBsLJOzVFbkdk33acmZB17rLtULBIKHS0GuRiwmI+91YF1lX35iYgIPR64v2DNjsi1sI6hhiqif77pqLHp0Q+fcB18s6I6z2Ikyax2RAYyfizpyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by AM9PR04MB8083.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 14:20:27 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Mon, 25 Nov 2024
 14:20:27 +0000
From: carlos.song@nxp.com
To: aisheng.dong@nxp.com,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	frank.li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v6] i2c: imx-lpi2c: add eDMA mode support for LPI2C
Date: Mon, 25 Nov 2024 22:29:09 +0800
Message-Id: <20241125142909.1613245-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:23::9) To AM0PR0402MB3937.eurprd04.prod.outlook.com
 (2603:10a6:208:5::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|AM9PR04MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f2023da-85d9-4bab-fe79-08dd0d5c4e81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lpbtt7wR8NzieykX0eea5xqHUDSxnibO2JuDhQ8ZM2q0RYgSgm1KLnMr3cmf?=
 =?us-ascii?Q?E/wKjf8tevyvIxe1VWkopWVAvlTSgJovQFAKyzoLvF9OPjq19ct9JXzJ3mcp?=
 =?us-ascii?Q?hy5HqFq7JOmFCyHWWTttS0kXqzCv6BFpdpp+rZp+64EC1acY4w/jU2ymz1EJ?=
 =?us-ascii?Q?5cJQINQvz2wQAE6XwplwZKmfHQag4CDdYPU8EO99HB6xXroAkHpUVP8HdPjZ?=
 =?us-ascii?Q?vD3AMLM0DfOpZiLK4JK4UyC7nhuqOZIWBGBsXklqDG7WGWYORelj329CxlUK?=
 =?us-ascii?Q?mCb7KDVa9IOxRvRjQcfikWmeZbsjhEsqs6jgpq3FzqkxY+8gfdW4b3z6dnQB?=
 =?us-ascii?Q?QznGgVRcykKmCnJCFVqgNFI3RI6r86y3TeRPAiXd+TnRf724q5aWson7qG6x?=
 =?us-ascii?Q?WtSIOeHdiJbG+2d4JChW3dWMbI6hmKyV8zIosx63gdq59EbMk4mOcza7Vvt1?=
 =?us-ascii?Q?2DSDMVjfiggzmyVpQxpaVBH3cFk1kq5kgaQJCEHwf76qXOefDIplEcRagGPU?=
 =?us-ascii?Q?2XEDNLpWE+IYkZIHPytOiPQXDZqmD8nXFruMXrRhW2hAgSMJIh4ZVPrZFmel?=
 =?us-ascii?Q?6G9LVxuwnMoYWptoOzdqsRCxOGTqtl2pn6eXesDXiyt4GtRPDR0ofp3vYA6C?=
 =?us-ascii?Q?T8MwcvLZVTodcQoFug5Mu3q4brbpcvCGjcpQDwEQ3N1gAjLI8BPim8CSgABn?=
 =?us-ascii?Q?WWS/0JSq7hJvolPSird+HU0ueR8ruzF8Cnkemhd1oyHq3ngIklfYCihr6a6p?=
 =?us-ascii?Q?U3vLKO6KNJirSzsw4pC0Nv3Xredf/E0SOnILAXjYBhkv5HefC5iTrLCUfso8?=
 =?us-ascii?Q?rIDJQetcIrlr3s7aN6e585/LdTQp9KU2k6TPFYGirsP0xxYWCOrhfZj0uTuM?=
 =?us-ascii?Q?t7xtQsDlVU4+0oxDb0m0PlHtWOnFhZkSiOWyMcMYwVYjQof852IhzktM+p0P?=
 =?us-ascii?Q?7OtcpdiIaLQpLUrNmka3ayRQC49vDmdXB8ma4BuDgEZ2MZba+gK4RdJGfPs9?=
 =?us-ascii?Q?zbtKkAx4uvMCD9SYI4ibrxDbgAL3FI9TDumjhIe3vlMcxa+kjVQWOeT/bFka?=
 =?us-ascii?Q?ImN9LE82MHblrdvefOe09OukQdT4xc0+1VJiwVfZNV1ejZt55QufHsOmuS5K?=
 =?us-ascii?Q?m93LOBLGpbTCqkaDvSGnMRQGRirO528C2bs+OTofbv4P0FFg6+irqPVVWZaz?=
 =?us-ascii?Q?/F0StJMs2pnIgVlFeNWFYkY5DhBpOXzrrrP/GEXy4KTODd9OnlkcnHPOur4r?=
 =?us-ascii?Q?qLQ+EPPG+DJoROZtKn0NWPJyHF7UkoqXiP0/iKRqAwmQxiwNR2FUZYT0m47N?=
 =?us-ascii?Q?luTEPAvng88tuQhrINzE3sV26v584bf9CgnB9UIcHY3QNWD3M4mVqcx7Z9rk?=
 =?us-ascii?Q?hHBrF4NrCa7iKLHTiYG/TohaaM1Io3jYeuhuw4NvjteCVURyzA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xM2Mgl0iUOq0qWPJvnwAYIfw1GfxKT0mpCu2jQDa3ql4YaYB271Ks8xYYpWG?=
 =?us-ascii?Q?X7oTHzfxXXre6iQi/mcSAFpO0FIUPbhs3Br9QESJav6M9lLV/G6xcgSJnTde?=
 =?us-ascii?Q?jUbsv2MWOcdtedm0RnfGdG1/ZWTHemDDCdZcyOefd1/hK79iQkVpq9eh2V1G?=
 =?us-ascii?Q?Z8LXdnxu2AifJ8fjPlIibcW6s05EHaazDRzCW16Nf2TmlGfx/PX27maefpDM?=
 =?us-ascii?Q?evSN97rkkA0vuYPlowJmvUbRxZJu+jplBTauN+5LkN4pgaGR2rty0M0G/lxN?=
 =?us-ascii?Q?enKxQ18hjmO9kB3LOOVn+dU20mgxHSFbyIqE6Fm/+e7C5iBEuxBTRPPh+K/F?=
 =?us-ascii?Q?pAplUXaoY8EMSFKpenVPmbBKXvM9R65Ts9cfPAy5gTCiwQUdB7xcky2hfxr0?=
 =?us-ascii?Q?PcKoRhCTAAtYg+AFmaBDsU3rUXO9nBw9rI8IbBJryJ04yPk4hbKMRbKjQrLQ?=
 =?us-ascii?Q?CGmryeLWUaS6l9abBSdMa42DlJIyrI4OjdgwEexbJ9cGSwMkRYjediP+Oj0d?=
 =?us-ascii?Q?UdbCOGMsfwPko/Q+t44YYI+ahJwlX51cfJT9NxevDbYXWww5Wvzj1iXjjk/J?=
 =?us-ascii?Q?F3a8V70HjZ/7Z/CERmj9RTQA1PkIFJN5fAo8/ww6HZSpBQfyE5jy9Iyq7+V8?=
 =?us-ascii?Q?YQyZtDaA67Ok2cWGxb0w+cqTKsO88e5M3xs4Wndt2dPN7Lsz2Az/exU7uONK?=
 =?us-ascii?Q?G5O1dLwzLr795D/igJwhWCE5b2G32t5X9quTqStC6XNdULybcX0b+ej6t8Yb?=
 =?us-ascii?Q?HSG+1ecPpddARflF6UovMR0dQ/tZj2gbpm6OfNlW5fgGoWmdCsdp27BaY6l7?=
 =?us-ascii?Q?Bc2mL9Ta3L3qOF6IbyHq3++EiQtRcg4xi/mHSym7TS+HAkhTqEc4UmWmGUJ2?=
 =?us-ascii?Q?iB4KrVUj4Q1/GuhbdlOplsAhIzsHf6oZAhFI7m1e2ERMhYMgOV/FN8jJpHQz?=
 =?us-ascii?Q?pvwa52HDl6g9uTrS1SpYWPGR04PG+my0y7FMA88AIw0u1xSruWA+XBq6muTl?=
 =?us-ascii?Q?nr6ZHrAG4mCVTD5HKxj7aQbIvHpSm193oRDmAdopVKBdOmyxEsBuIWeIclK4?=
 =?us-ascii?Q?MqDhiZsBixgnjI10We4ASkwl+Krpra+DlwnMSYaMP3w/cYSRx27194q3E0bd?=
 =?us-ascii?Q?5HkJ1KhzO+uqHu95MpR1kZNDH/4zi9XhD8nCADYZryFxCUj4lDTNJKmhS8+k?=
 =?us-ascii?Q?lkDx1PnQEBgO5CCQC45NuWEs2hud8e5MmezpMNqVKHnlUESD+UnpazwVNJv+?=
 =?us-ascii?Q?Nzya7PxeI94aXg/lTXoNfPXi4Cg/vZj0qIH6Mx1thhUgQ8gBbJvNhJIaGcR4?=
 =?us-ascii?Q?+Iy66ypf71Lcx9FelavdYxlYqPLEtsg9lZ5R5cuq7fOIF2Vl0hsb1D924nXZ?=
 =?us-ascii?Q?DieeTzZtvwRYql057UCCEByAwLSw26Q9+gY5lcfij7QXAsdYbii28WLmHDky?=
 =?us-ascii?Q?OAwwG3GQe5NDuvR6KZYOh4W6ZoAd7/gk7GlQ4NqecA4Djb7paBZFqfpwqSoE?=
 =?us-ascii?Q?T8D2imkbJwXdec4tT9PhEgqYIEjIfSXF7BH0efn7UYNTguxwaZDGMBibPwp2?=
 =?us-ascii?Q?wcKtntYhSM3Cwmgw5o5FsCjZ9KWRqUduyFcZ/L0b?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2023da-85d9-4bab-fe79-08dd0d5c4e81
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 14:20:27.2213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AH036b+x9Q3FxVEXoZKVlYfRG2EmNC8w2QAVuZ10DUcmTQme8+4fF+wOoyNlZHmX58AA65dWZfaDk7erXD9BXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8083

From: Carlos Song <carlos.song@nxp.com>

Add eDMA mode support for LPI2C.

There are some differences between TX DMA mode and RX DMA mode.
LPI2C MTDR register is Controller Transmit Data Register.
When lpi2c send data, it is tx cmd register and tx data fifo.
When lpi2c receive data, it is just a rx cmd register. LPI2C MRDR
register is Controller Receive Data Register, received data are
stored in this.

MTDR[8:10] is CMD field and MTDR[0:7] is DATA filed.
+-----------+-------------------------------+
|  C  M  D  |          D  A  T  A           |
+---+---+---+---+---+---+---+---+---+---+---+
| 10| 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
+---+---+---+---+---+---+---+---+---+---+---+

MRDR is Controller Receive Data Register.
MRDR[0:7] is DATA filed.
+-------------------------------+
|          D  A  T  A           |
+---+---+---+---+---+---+---+---+
| 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
+---+---+---+---+---+---+---+---+

When the LPI2C controller needs to send data, tx cmd and 8-bit data
should be written into MTDR:
CMD: 000b: Transmit the value in DATA[7:0].
DATA: 8-bit data.

If lpi2c controller needs to send N 8-bit data, just write N times
(CMD(W) + DATA(u8)) to MTDR.

When the LPI2C controller needs to receive data, rx cmd should be
written into MTDR, the received data will be stored in the MRDR.

MTDR(CMD): 001b: Receive (DATA[7:0] + 1) 8-bit data.
MTDR(DATA): byte counter.
MRDR(DATA): 8-bit data.

So when lpi2c controller needs to receive N 8-bit data,
1. N <= 256:
Write 1 time (CMD(R) + BYTE COUNT(N-1)) into MTDR and receive data from
MRDR.
2. N > 256:
Write N/256 times (CMD(R) + BYTE COUNT(255)) + 1 time (CMD(R) + BYTE
COUNT(N%256)) into MTDR and receive data from MRDR.

Due to these differences, when lpi2c is in DMA TX mode, only enable TX
channel to send data. But when lpi2c is in DMA RX mode, TX and RX channel
are both enabled, TX channel is used to send RX cmd and RX channel is
used to receive data.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Frank Li <frank.li@nxp.com>
---
Change for V6:
- Resend V5, also use strict spell to check patch, then fix some alignment
  and spelling errors.
Change for V5:
- According to Andi's suggestion:
- Fix code alignment and improve logs.
- Add exit goto branch in lpi2c_imx_dma_xfer(), lpi2c_dma_rx_cmd_submit()
  and lpi2c_dma_submit() to simplify code.
- Use dma_data_dir and dma_transfer_dir to replace dma_direction
  for better readability when setting variables in lpi2c_dma_submit().
Change for V4:
- According Aisheng's suggestion, fix code for improving readability.
- Add dma struct, when dma resource not ready not alloc dma resources.
Change for V3:
- Optimize DMA timeout calculate function names and variables avoid confusing.
Change for V2:
- Optimized eDMA rx cmd buf free function to improve code readability.
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 524 ++++++++++++++++++++++++++++-
 1 file changed, 517 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 8adf2963d764..9778dc8f6d36 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -8,6 +8,8 @@
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmaengine.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
@@ -29,6 +31,7 @@
 #define LPI2C_MCR	0x10	/* i2c contrl register */
 #define LPI2C_MSR	0x14	/* i2c status register */
 #define LPI2C_MIER	0x18	/* i2c interrupt enable */
+#define LPI2C_MDER	0x1C	/* i2c DMA enable */
 #define LPI2C_MCFGR0	0x20	/* i2c master configuration */
 #define LPI2C_MCFGR1	0x24	/* i2c master configuration */
 #define LPI2C_MCFGR2	0x28	/* i2c master configuration */
@@ -70,11 +73,14 @@
 #define MCFGR1_AUTOSTOP	BIT(8)
 #define MCFGR1_IGNACK	BIT(9)
 #define MRDR_RXEMPTY	BIT(14)
+#define MDER_TDDE	BIT(0)
+#define MDER_RDDE	BIT(1)
 
 #define I2C_CLK_RATIO	2
 #define CHUNK_DATA	256
 
 #define I2C_PM_TIMEOUT		10 /* ms */
+#define I2C_DMA_THRESHOLD	8 /* bytes */
 
 enum lpi2c_imx_mode {
 	STANDARD,	/* 100+Kbps */
@@ -91,6 +97,24 @@ enum lpi2c_imx_pincfg {
 	FOUR_PIN_PP,
 };
 
+struct lpi2c_imx_dma {
+	bool		using_pio_mode;
+	u8		rx_cmd_buf_len;
+	u8		*dma_buf;
+	u16		*rx_cmd_buf;
+	unsigned int	dma_len;
+	unsigned int	tx_burst_num;
+	unsigned int	rx_burst_num;
+	unsigned long	dma_msg_flag;
+	resource_size_t	phy_addr;
+	dma_addr_t	dma_tx_addr;
+	dma_addr_t	dma_addr;
+	enum dma_data_direction dma_data_dir;
+	enum dma_transfer_direction dma_transfer_dir;
+	struct dma_chan	*chan_tx;
+	struct dma_chan	*chan_rx;
+};
+
 struct lpi2c_imx_struct {
 	struct i2c_adapter	adapter;
 	int			num_clks;
@@ -108,6 +132,8 @@ struct lpi2c_imx_struct {
 	unsigned int		rxfifosize;
 	enum lpi2c_imx_mode	mode;
 	struct i2c_bus_recovery_info rinfo;
+	bool			can_use_dma;
+	struct lpi2c_imx_dma	*dma;
 };
 
 static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
@@ -305,7 +331,7 @@ static int lpi2c_imx_master_disable(struct lpi2c_imx_struct *lpi2c_imx)
 	return 0;
 }
 
-static int lpi2c_imx_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
+static int lpi2c_imx_pio_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
 {
 	unsigned long time_left;
 
@@ -451,6 +477,425 @@ static void lpi2c_imx_read(struct lpi2c_imx_struct *lpi2c_imx,
 	lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE | MIER_NDIE);
 }
 
+static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
+{
+	if (!lpi2c_imx->can_use_dma)
+		return false;
+
+	/*
+	 * When the length of data is less than I2C_DMA_THRESHOLD,
+	 * cpu mode is used directly to avoid low performance.
+	 */
+	return !(msg->len < I2C_DMA_THRESHOLD);
+}
+
+static int lpi2c_imx_pio_xfer(struct lpi2c_imx_struct *lpi2c_imx,
+			      struct i2c_msg *msg)
+{
+	reinit_completion(&lpi2c_imx->complete);
+
+	if (msg->flags & I2C_M_RD)
+		lpi2c_imx_read(lpi2c_imx, msg);
+	else
+		lpi2c_imx_write(lpi2c_imx, msg);
+
+	return lpi2c_imx_pio_msg_complete(lpi2c_imx);
+}
+
+static int lpi2c_imx_dma_timeout_calculate(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	unsigned long time = 0;
+
+	time = 8 * lpi2c_imx->dma->dma_len * 1000 / lpi2c_imx->bitrate;
+
+	/* Add extra second for scheduler related activities */
+	time += 1;
+
+	/* Double calculated time */
+	return msecs_to_jiffies(time * MSEC_PER_SEC);
+}
+
+static int lpi2c_imx_alloc_rx_cmd_buf(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	u16 rx_remain = dma->dma_len;
+	int cmd_num;
+	u16 temp;
+
+	/*
+	 * Calculate the number of rx command words via the DMA TX channel
+	 * writing into command register based on the i2c msg len, and build
+	 * the rx command words buffer.
+	 */
+	cmd_num = DIV_ROUND_UP(rx_remain, CHUNK_DATA);
+	dma->rx_cmd_buf = kcalloc(cmd_num, sizeof(u16), GFP_KERNEL);
+	dma->rx_cmd_buf_len = cmd_num * sizeof(u16);
+
+	if (!dma->rx_cmd_buf) {
+		dev_err(&lpi2c_imx->adapter.dev, "Alloc RX cmd buffer failed\n");
+		return -ENOMEM;
+	}
+
+	for (int i = 0; i < cmd_num ; i++) {
+		temp = rx_remain > CHUNK_DATA ? CHUNK_DATA - 1 : rx_remain - 1;
+		temp |= (RECV_DATA << 8);
+		rx_remain -= CHUNK_DATA;
+		dma->rx_cmd_buf[i] = temp;
+	}
+
+	return 0;
+}
+
+static int lpi2c_imx_dma_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	unsigned long time_left, time;
+
+	time = lpi2c_imx_dma_timeout_calculate(lpi2c_imx);
+	time_left = wait_for_completion_timeout(&lpi2c_imx->complete, time);
+	if (time_left == 0) {
+		dev_err(&lpi2c_imx->adapter.dev, "I/O Error in DMA Data Transfer\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static void lpi2c_dma_unmap(struct lpi2c_imx_dma *dma)
+{
+	struct dma_chan *chan = dma->dma_data_dir == DMA_FROM_DEVICE
+				? dma->chan_rx : dma->chan_tx;
+
+	dma_unmap_single(chan->device->dev, dma->dma_addr,
+			 dma->dma_len, dma->dma_data_dir);
+
+	dma->dma_data_dir = DMA_NONE;
+}
+
+static void lpi2c_cleanup_rx_cmd_dma(struct lpi2c_imx_dma *dma)
+{
+	dmaengine_terminate_sync(dma->chan_tx);
+	dma_unmap_single(dma->chan_tx->device->dev, dma->dma_tx_addr,
+			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
+}
+
+static void lpi2c_cleanup_dma(struct lpi2c_imx_dma *dma)
+{
+	if (dma->dma_data_dir == DMA_FROM_DEVICE)
+		dmaengine_terminate_sync(dma->chan_rx);
+	else if (dma->dma_data_dir == DMA_TO_DEVICE)
+		dmaengine_terminate_sync(dma->chan_tx);
+
+	lpi2c_dma_unmap(dma);
+}
+
+static void lpi2c_dma_callback(void *data)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = (struct lpi2c_imx_struct *)data;
+
+	complete(&lpi2c_imx->complete);
+}
+
+static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct dma_async_tx_descriptor *rx_cmd_desc;
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	struct dma_chan *txchan = dma->chan_tx;
+	dma_cookie_t cookie;
+
+	dma->dma_tx_addr = dma_map_single(txchan->device->dev,
+					  dma->rx_cmd_buf, dma->rx_cmd_buf_len,
+					  DMA_TO_DEVICE);
+	if (dma_mapping_error(txchan->device->dev, dma->dma_tx_addr)) {
+		dev_err(&lpi2c_imx->adapter.dev, "DMA map failed, use pio\n");
+		return -EINVAL;
+	}
+
+	rx_cmd_desc = dmaengine_prep_slave_single(txchan, dma->dma_tx_addr,
+						  dma->rx_cmd_buf_len, DMA_MEM_TO_DEV,
+						  DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!rx_cmd_desc) {
+		dev_err(&lpi2c_imx->adapter.dev, "DMA prep slave sg failed, use pio\n");
+		goto desc_prepare_err_exit;
+	}
+
+	cookie = dmaengine_submit(rx_cmd_desc);
+	if (dma_submit_error(cookie)) {
+		dev_err(&lpi2c_imx->adapter.dev, "submitting DMA failed, use pio\n");
+		goto submit_err_exit;
+	}
+
+	dma_async_issue_pending(txchan);
+
+	return 0;
+
+desc_prepare_err_exit:
+	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
+			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
+	return -EINVAL;
+
+submit_err_exit:
+	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
+			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
+	dmaengine_desc_free(rx_cmd_desc);
+	return -EINVAL;
+}
+
+static int lpi2c_dma_submit(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	struct dma_async_tx_descriptor *desc;
+	struct dma_chan *chan;
+	dma_cookie_t cookie;
+
+	if (dma->dma_msg_flag & I2C_M_RD) {
+		chan = dma->chan_rx;
+		dma->dma_data_dir = DMA_FROM_DEVICE;
+		dma->dma_transfer_dir = DMA_DEV_TO_MEM;
+	} else {
+		chan = dma->chan_tx;
+		dma->dma_data_dir = DMA_TO_DEVICE;
+		dma->dma_transfer_dir = DMA_MEM_TO_DEV;
+	}
+
+	dma->dma_addr = dma_map_single(chan->device->dev,
+				       dma->dma_buf, dma->dma_len, dma->dma_data_dir);
+	if (dma_mapping_error(chan->device->dev, dma->dma_addr)) {
+		dev_err(&lpi2c_imx->adapter.dev, "DMA map failed, use pio\n");
+		return -EINVAL;
+	}
+
+	desc = dmaengine_prep_slave_single(chan, dma->dma_addr,
+					   dma->dma_len, dma->dma_transfer_dir,
+					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!desc) {
+		dev_err(&lpi2c_imx->adapter.dev, "DMA prep slave sg failed, use pio\n");
+		goto desc_prepare_err_exit;
+	}
+
+	reinit_completion(&lpi2c_imx->complete);
+	desc->callback = lpi2c_dma_callback;
+	desc->callback_param = lpi2c_imx;
+
+	cookie = dmaengine_submit(desc);
+	if (dma_submit_error(cookie)) {
+		dev_err(&lpi2c_imx->adapter.dev, "submitting DMA failed, use pio\n");
+		goto submit_err_exit;
+	}
+
+	/* Can't switch to PIO mode when DMA have started transfer */
+	dma->using_pio_mode = false;
+
+	dma_async_issue_pending(chan);
+
+	return 0;
+
+desc_prepare_err_exit:
+	lpi2c_dma_unmap(dma);
+	return -EINVAL;
+
+submit_err_exit:
+	lpi2c_dma_unmap(dma);
+	dmaengine_desc_free(desc);
+	return -EINVAL;
+}
+
+static int lpi2c_imx_find_max_burst_num(unsigned int fifosize, unsigned int len)
+{
+	unsigned int i;
+
+	for (i = fifosize / 2; i > 0; i--)
+		if (!(len % i))
+			break;
+
+	return i;
+}
+
+/*
+ * For a highest DMA efficiency, tx/rx burst number should be calculated according
+ * to the FIFO depth.
+ */
+static void lpi2c_imx_dma_burst_num_calculate(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	unsigned int cmd_num;
+
+	if (dma->dma_msg_flag & I2C_M_RD) {
+		/*
+		 * One RX cmd word can trigger DMA receive no more than 256 bytes.
+		 * The number of RX cmd words should be calculated based on the data
+		 * length.
+		 */
+		cmd_num = DIV_ROUND_UP(dma->dma_len, CHUNK_DATA);
+		dma->tx_burst_num = lpi2c_imx_find_max_burst_num(lpi2c_imx->txfifosize,
+								 cmd_num);
+		dma->rx_burst_num = lpi2c_imx_find_max_burst_num(lpi2c_imx->rxfifosize,
+								 dma->dma_len);
+	} else {
+		dma->tx_burst_num = lpi2c_imx_find_max_burst_num(lpi2c_imx->txfifosize,
+								 dma->dma_len);
+	}
+}
+
+static int lpi2c_dma_config(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	struct dma_slave_config rx = {}, tx = {};
+	int ret;
+
+	lpi2c_imx_dma_burst_num_calculate(lpi2c_imx);
+
+	if (dma->dma_msg_flag & I2C_M_RD) {
+		tx.dst_addr = dma->phy_addr + LPI2C_MTDR;
+		tx.dst_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
+		tx.dst_maxburst = dma->tx_burst_num;
+		tx.direction = DMA_MEM_TO_DEV;
+		ret = dmaengine_slave_config(dma->chan_tx, &tx);
+		if (ret < 0)
+			return ret;
+
+		rx.src_addr = dma->phy_addr + LPI2C_MRDR;
+		rx.src_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+		rx.src_maxburst = dma->rx_burst_num;
+		rx.direction = DMA_DEV_TO_MEM;
+		ret = dmaengine_slave_config(dma->chan_rx, &rx);
+		if (ret < 0)
+			return ret;
+	} else {
+		tx.dst_addr = dma->phy_addr + LPI2C_MTDR;
+		tx.dst_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+		tx.dst_maxburst = dma->tx_burst_num;
+		tx.direction = DMA_MEM_TO_DEV;
+		ret = dmaengine_slave_config(dma->chan_tx, &tx);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void lpi2c_dma_enable(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	/*
+	 * TX interrupt will be triggered when the number of words in
+	 * the transmit FIFO is equal or less than TX watermark.
+	 * RX interrupt will be triggered when the number of words in
+	 * the receive FIFO is greater than RX watermark.
+	 * In order to trigger the DMA interrupt, TX watermark should be
+	 * set equal to the DMA TX burst number but RX watermark should
+	 * be set less than the DMA RX burst number.
+	 */
+	if (dma->dma_msg_flag & I2C_M_RD) {
+		/* Set I2C TX/RX watermark */
+		writel(dma->tx_burst_num | (dma->rx_burst_num - 1) << 16,
+		       lpi2c_imx->base + LPI2C_MFCR);
+		/* Enable I2C DMA TX/RX function */
+		writel(MDER_TDDE | MDER_RDDE, lpi2c_imx->base + LPI2C_MDER);
+	} else {
+		/* Set I2C TX watermark */
+		writel(dma->tx_burst_num, lpi2c_imx->base + LPI2C_MFCR);
+		/* Enable I2C DMA TX function */
+		writel(MDER_TDDE, lpi2c_imx->base + LPI2C_MDER);
+	}
+
+	/* Enable NACK detected */
+	lpi2c_imx_intctrl(lpi2c_imx, MIER_NDIE);
+};
+
+/*
+ * When lpi2c is in TX DMA mode we can use one DMA TX channel to write
+ * data word into TXFIFO, but in RX DMA mode it is different.
+ *
+ * The LPI2C MTDR register is a command data and transmit data register.
+ * Bits 8-10 are the command data field and Bits 0-7 are the transmit
+ * data field. When the LPI2C master needs to read data, the number of
+ * bytes to read should be set in the command field and RECV_DATA should
+ * be set into the command data field to receive (DATA[7:0] + 1) bytes.
+ * The recv data command word is made of RECV_DATA in the command data
+ * field and the number of bytes to read in transmit data field. When the
+ * length of data to be read exceeds 256 bytes, recv data command word
+ * needs to be written to TXFIFO multiple times.
+ *
+ * So when in RX DMA mode, the TX channel also must to be configured to
+ * send RX command words and the RX command word must be set in advance
+ * before transmitting.
+ */
+static int lpi2c_imx_dma_xfer(struct lpi2c_imx_struct *lpi2c_imx,
+			      struct i2c_msg *msg)
+{
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	int ret;
+
+	/* When DMA mode fails before transferring, CPU mode can be used. */
+	dma->using_pio_mode = true;
+
+	dma->dma_len = msg->len;
+	dma->dma_msg_flag = msg->flags;
+	dma->dma_buf = i2c_get_dma_safe_msg_buf(msg, I2C_DMA_THRESHOLD);
+	if (!dma->dma_buf)
+		return -ENOMEM;
+
+	ret = lpi2c_dma_config(lpi2c_imx);
+	if (ret) {
+		dev_err(&lpi2c_imx->adapter.dev, "Failed to configure DMA (%d)\n", ret);
+		goto disable_dma;
+	}
+
+	lpi2c_dma_enable(lpi2c_imx);
+
+	ret = lpi2c_dma_submit(lpi2c_imx);
+	if (ret) {
+		dev_err(&lpi2c_imx->adapter.dev, "DMA submission failed (%d)\n", ret);
+		goto disable_dma;
+	}
+
+	if (dma->dma_msg_flag & I2C_M_RD) {
+		ret = lpi2c_imx_alloc_rx_cmd_buf(lpi2c_imx);
+		if (ret)
+			goto disable_cleanup_data_dma;
+
+		ret = lpi2c_dma_rx_cmd_submit(lpi2c_imx);
+		if (ret)
+			goto disable_cleanup_data_dma;
+	}
+
+	ret = lpi2c_imx_dma_msg_complete(lpi2c_imx);
+	if (ret)
+		goto disable_cleanup_all_dma;
+
+	/* When encountering NACK in transfer, clean up all DMA transfers */
+	if ((readl(lpi2c_imx->base + LPI2C_MSR) & MSR_NDF) && !ret) {
+		ret = -EIO;
+		goto disable_cleanup_all_dma;
+	}
+
+	if (dma->dma_msg_flag & I2C_M_RD)
+		dma_unmap_single(dma->chan_tx->device->dev, dma->dma_tx_addr,
+				 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
+	lpi2c_dma_unmap(dma);
+
+	goto disable_dma;
+
+disable_cleanup_all_dma:
+	if (dma->dma_msg_flag & I2C_M_RD)
+		lpi2c_cleanup_rx_cmd_dma(dma);
+disable_cleanup_data_dma:
+	lpi2c_cleanup_dma(dma);
+disable_dma:
+	/* Disable I2C DMA function */
+	writel(0, lpi2c_imx->base + LPI2C_MDER);
+
+	if (dma->dma_msg_flag & I2C_M_RD)
+		kfree(dma->rx_cmd_buf);
+
+	if (ret)
+		i2c_put_dma_safe_msg_buf(dma->dma_buf, msg, false);
+	else
+		i2c_put_dma_safe_msg_buf(dma->dma_buf, msg, true);
+
+	return ret;
+}
+
 static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 			  struct i2c_msg *msgs, int num)
 {
@@ -477,12 +922,14 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 		lpi2c_imx->msglen = msgs[i].len;
 		init_completion(&lpi2c_imx->complete);
 
-		if (msgs[i].flags & I2C_M_RD)
-			lpi2c_imx_read(lpi2c_imx, &msgs[i]);
-		else
-			lpi2c_imx_write(lpi2c_imx, &msgs[i]);
+		if (is_use_dma(lpi2c_imx, &msgs[i])) {
+			result = lpi2c_imx_dma_xfer(lpi2c_imx, &msgs[i]);
+			if (result && lpi2c_imx->dma->using_pio_mode)
+				result = lpi2c_imx_pio_xfer(lpi2c_imx, &msgs[i]);
+		} else {
+			result = lpi2c_imx_pio_xfer(lpi2c_imx, &msgs[i]);
+		}
 
-		result = lpi2c_imx_msg_complete(lpi2c_imx);
 		if (result)
 			goto stop;
 
@@ -546,6 +993,58 @@ static int lpi2c_imx_init_recovery_info(struct lpi2c_imx_struct *lpi2c_imx,
 	return 0;
 }
 
+static void dma_exit(struct device *dev, struct lpi2c_imx_dma *dma)
+{
+	if (dma->chan_rx)
+		dma_release_channel(dma->chan_rx);
+
+	if (dma->chan_tx)
+		dma_release_channel(dma->chan_tx);
+
+	devm_kfree(dev, dma);
+}
+
+static int lpi2c_dma_init(struct device *dev, dma_addr_t phy_addr)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
+	struct lpi2c_imx_dma *dma;
+	int ret;
+
+	dma = devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
+	if (!dma)
+		return -ENOMEM;
+
+	dma->phy_addr = phy_addr;
+
+	/* Prepare for TX DMA: */
+	dma->chan_tx = dma_request_chan(dev, "tx");
+	if (IS_ERR(dma->chan_tx)) {
+		ret = PTR_ERR(dma->chan_tx);
+		if (ret != -ENODEV && ret != -EPROBE_DEFER)
+			dev_err(dev, "can't request DMA tx channel (%d)\n", ret);
+		dma->chan_tx = NULL;
+		goto dma_exit;
+	}
+
+	/* Prepare for RX DMA: */
+	dma->chan_rx = dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->chan_rx)) {
+		ret = PTR_ERR(dma->chan_rx);
+		if (ret != -ENODEV && ret != -EPROBE_DEFER)
+			dev_err(dev, "can't request DMA rx channel (%d)\n", ret);
+		dma->chan_rx = NULL;
+		goto dma_exit;
+	}
+
+	lpi2c_imx->can_use_dma = true;
+	lpi2c_imx->dma = dma;
+	return 0;
+
+dma_exit:
+	dma_exit(dev, dma);
+	return ret;
+}
+
 static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
@@ -566,6 +1065,8 @@ MODULE_DEVICE_TABLE(of, lpi2c_imx_of_match);
 static int lpi2c_imx_probe(struct platform_device *pdev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx;
+	struct resource *res;
+	dma_addr_t phy_addr;
 	unsigned int temp;
 	int irq, ret;
 
@@ -573,7 +1074,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (!lpi2c_imx)
 		return -ENOMEM;
 
-	lpi2c_imx->base = devm_platform_ioremap_resource(pdev, 0);
+	lpi2c_imx->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(lpi2c_imx->base))
 		return PTR_ERR(lpi2c_imx->base);
 
@@ -587,6 +1088,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	lpi2c_imx->adapter.dev.of_node	= pdev->dev.of_node;
 	strscpy(lpi2c_imx->adapter.name, pdev->name,
 		sizeof(lpi2c_imx->adapter.name));
+	phy_addr = (dma_addr_t)res->start;
 
 	ret = devm_clk_bulk_get_all(&pdev->dev, &lpi2c_imx->clks);
 	if (ret < 0)
@@ -640,6 +1142,14 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret == -EPROBE_DEFER)
 		goto rpm_disable;
 
+	/* Init DMA */
+	ret = lpi2c_dma_init(&pdev->dev, phy_addr);
+	if (ret) {
+		if (ret == -EPROBE_DEFER)
+			goto rpm_disable;
+		dev_info(&pdev->dev, "use pio mode\n");
+	}
+
 	ret = i2c_add_adapter(&lpi2c_imx->adapter);
 	if (ret)
 		goto rpm_disable;
-- 
2.34.1


