Return-Path: <linux-i2c+bounces-8205-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DD99D87CF
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 15:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D31616A4EA
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 14:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9AD1AF0C7;
	Mon, 25 Nov 2024 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h2NqdbGI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2047.outbound.protection.outlook.com [40.107.20.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF229192B7F;
	Mon, 25 Nov 2024 14:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732544595; cv=fail; b=pzMsIiggfhCvzyB80ivsANzIR4V4FSMjwqrRDSPmhKFpiZSciNQimPRnypgGpSMmqImoZeqgh/50hssuUeB0xWO9QzxrQtEHnZjpgbyrlKgyTtN/2WzBjJ5XDH29f+tOkqgnaepoQ1ETXHneZXrnBxiOLEDGYtHslLYUUASkOZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732544595; c=relaxed/simple;
	bh=7HmgQ2kkDoD5dxUrFbLX8r3CvNbCaYHYi7j374RxZeU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=JgbwvdZP/oc0dQgmPAQJO1UljQhshupRbMjOOTt0U2WSCy8Bca32iR1cQrY3mjuQftaMNqFvJAhnbYjlWdDws2zbh7g49F2bYcEXj2D8FsTMedMXz2zVsV2Gdl6O/uHSsUD4duJk4dp3TQ82W81z5IytbdrvwdbxU3F7Qa5PscQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h2NqdbGI; arc=fail smtp.client-ip=40.107.20.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=piExJPXy0hIA+qvdNtjOQgT2URQoOl+52y/3RtdbWPQn/SdMKgTK3AZiE2JBaI+QInbRT3A/wD5u2WZAVKxxzy95v4ukZ+1crY9hnVKPKoleojGCdfeJCodyd5SbYZAAI22HFDuXG8T3DYM3+di6CHk7hxcFEmrC8WDxwdhYFnqxQG6qTSFijQVfsM946hmgdb1gnDoMvuiCJM73PA7eo23X4h77AxSsLgAMmj4ZEtBrnjFnLviop7F7HJrFxwZbppwekk2tGgS1iOdTlELg9zOJN/wOOjRSiD3lczWef7/f4g+9yayiPCnGAQ7HXZ8mwC5aMbvNIS4NMqJjz2+o8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFpA6WGTyoF+w55X9LlyhnfwlHBr9tJTsZNyBzU6eb8=;
 b=apKw/tqrYntJwX2RrVbDMAsBOhadUACrzJheCexwanarQvDhcCNNVySM7C6Z8yjGk22S+MUeftuWTGgfWmj9w34dB2K4ZpqZ6XKibucPUwcYMvwHXh3SmjfPKvG8Oj/YuN2Wh3DcSAsTw8yMXcuyUcmDgcrKaBq8yxYVWpNGhBJ9Xv0MLc1SY2GgKC24kwcjyjsH5hSum/VR0oX01TZDrs4MuPPgX7EHePJnQoxanuYmc8oQm2Cgm6h1DAb9tuOYndZT9eqR/Aeo2BZHPhuUTTkaUJRclrDN48ZGUldh507YLJ4KhPMPHEPoql+yzga/O5FafIwvG9iM36H6P5mgtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFpA6WGTyoF+w55X9LlyhnfwlHBr9tJTsZNyBzU6eb8=;
 b=h2NqdbGI71DUtTLXPBMTpI7bkmv8cT2evSJcgVzcYLSr8XH4M1nvOlx/9sHjdTIek/p9tHQgI+dFf+qJreWcEGdnjKwPgkP0ktNPLQJMeiT94lLmuVJTEEymoPxZ7Lw/GGpIt9F17yPSfDWi9QOvcJSpKXqxTJhf9UYrmZTyCFKr9/amE/Zg9wkHzuNUAD0hmKqqOlHVA9O9YByGyaOmEO1OXwof4ee+5QEW/PyW+Es78r1/3IQQ/MjqrQ/oBSSIssl8oG16kMSGJZAc81hKXbTDRBJu2ASyAs0IAC9u/Tg0/KU0cb0a2ex/m4yCm3c1wBqwGYmY/oFYag11OtRQWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by VI2PR04MB10715.eurprd04.prod.outlook.com (2603:10a6:800:277::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 25 Nov
 2024 14:23:04 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Mon, 25 Nov 2024
 14:23:04 +0000
From: carlos.song@nxp.com
To: aisheng.dong@nxp.com,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] i2c: imx-lpi2c: add target mode support
Date: Mon, 25 Nov 2024 22:31:40 +0800
Message-Id: <20241125143140.1613282-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::8) To AM0PR0402MB3937.eurprd04.prod.outlook.com
 (2603:10a6:208:5::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|VI2PR04MB10715:EE_
X-MS-Office365-Filtering-Correlation-Id: d5225895-0743-49d6-aba0-08dd0d5caca9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fAwH+aBe5QMdbmEub/qCxWG4MeRFaEROsx0iosKkkWHeLj2tPTc2L4RZ5K/H?=
 =?us-ascii?Q?/WXHR3x+0zTD2tZERi1L/Vndja9M6XNcIYzFm0AoMVA81ozxhkQdJGdO1Qw4?=
 =?us-ascii?Q?b1DVHweZu2q+Ov8oNDbE/Vi0hW2fwLduecgb8yB2yRNVKDW2/jhYEJUcrjLe?=
 =?us-ascii?Q?lEEfvcZlqaQi66HZ0A763NjWR8IPXAFwl0uqmtXYBPU3jxO3DcfUQH6w30vt?=
 =?us-ascii?Q?oqt+qj1he0XQDuU1sgkcB8uxUooXMx0O1zc6bILGiyp0wWkC9m4QAPKtWSfN?=
 =?us-ascii?Q?hqt4HsISuYu7B/TF0DReIkhWQAGyfbPFZrrzLhqamZA5mpkN/6Mmkv/i6KLU?=
 =?us-ascii?Q?Gymm2IDlHeaUSX+IvHYVdBVyOceqXwEvecSPiI0fDsF8Tal1iT8WPLDTWU/C?=
 =?us-ascii?Q?rKtjgyL06rKLmb8RKgMWEWpVy9vp4DCgBdpv4fVPXMk8z4sU9CsimjndK3My?=
 =?us-ascii?Q?D9mufKPWZWCeUJWQw0r1VeZxBYD+UYnbkpCTGPfEJvxSLx0A1a4KsqRtESAm?=
 =?us-ascii?Q?6zG/qnen1UKAtLq3OdFqjkqqMAtEKkSCCa/pZFgTMk/pADvuDlggVfyEYdXK?=
 =?us-ascii?Q?SjIwjHl9srEwF27EeBj7DwnQrDZjKh6cKtyw2BW4avDfZipEkF1BVXgWhBee?=
 =?us-ascii?Q?Hfq28sDxxDhi6AQY3JlNUWlIkE2QORqonnYi5areCRSaCPuddiMI7nM/B+xE?=
 =?us-ascii?Q?qLG9m+nxylyqHT4Z9JaW/KDAnPnjsF9NZUDQ4ieZ1hc2q0hQVtUkjREiNhnk?=
 =?us-ascii?Q?QVXqvJMgLOQKjz3ohmwkbQrC+K/YcuT9Vnoz4/RURBH4a8xRZHerZygW3pGS?=
 =?us-ascii?Q?vEpsFC2fSMbcGkYWOzC95PyFWwYKyHMu8JWNA43c2uDdMwMv7+8V7x/u2x8L?=
 =?us-ascii?Q?bpeK61kBFbtzzeRmGEshSNej5PPEte1Pl4pSRnkhQ0aG3PtHWKjtNWn+iHc4?=
 =?us-ascii?Q?Rs/uACLgLpqUwg5bwvXELqu3vQkbVVBbvkdGCAdb7FohycSuNVvd6ibgcU7D?=
 =?us-ascii?Q?Q+ii6ZAyNbZ2V4QXIzocPc9qHHCUdcsXcGlilnB4m++GeLx0I7r5Q9kiygvK?=
 =?us-ascii?Q?Rhsu8CPuvUVsWclQcI5fjv6TrSRKHGmnBDvfTP7nosStwAtu3wsRn1a8vziq?=
 =?us-ascii?Q?p3gduUbI8m8IkcSq2KS5XZU5HAeSsNhnyJmiw6g9rQDg+huj3ac/+x2c3TqJ?=
 =?us-ascii?Q?/Dqw+qXmSBj1wGa/mPYBh7BCeGzVizYkAQWfQLRwDMgy1TzHKRJIWi4M8kVg?=
 =?us-ascii?Q?QWHIak59qGCrOXP/pRuEjVkgOwfyCBgK1MCYP9GKNVYJtxhkAaqHbNVAjXTk?=
 =?us-ascii?Q?2Ub/JVb8aZn1dpVpgkVGc2ZKF+fZ9EKYqEIEER/pxEuh0h3iMr5MdD5Fp2OC?=
 =?us-ascii?Q?kP8b2G8udMr1AM3hzTCi7+qZnU8ZZZ1wOFg8zQeBO99Z7BuFiQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zvSZuk/kJ8DxFXJzPRxW2LZDO0+Flj8Z8v4wEoujxz7wDkS8ww5YlLfNB5dn?=
 =?us-ascii?Q?Jubml/Hjkjbd89//mAJd5rl86EZQ5futaQi3VbxOUI6HmOMX2zbE+8xJNe9B?=
 =?us-ascii?Q?iuzyb0PkxcJmtHMHA10XRCq4T5Gc0eNL9gAHDIyWGLDPiTq1PZ8FqkeeLcSC?=
 =?us-ascii?Q?G2uDYHORiC4bU9+zYEvuG3gWEGlGprMj9YeOd/XlhDDFsF1Ul80qwJPr8Wq6?=
 =?us-ascii?Q?Cp7FJUbe8GNVaW+sJAT0PgaSUtXFjMKwpVuUQ9VHrDjE7Gezf5ueS8m7rYwl?=
 =?us-ascii?Q?y6b8dY5ZBByVh0ktyYToNWGKJ1Wq3jiYoEcdjvPZ+DUeojfuSfwETFrKYwg6?=
 =?us-ascii?Q?bUHAEfIYa4wH22ww9SnFclbbvCbu99x6e5ZxYXqNQXqTkUhaz/6H4jOL9e/i?=
 =?us-ascii?Q?irMdy/njq6DW4WLY0xLA19GFDAWihIz4CUe1CTeBUK8NxtRLUvh/D4Wq9G13?=
 =?us-ascii?Q?c8ShM79sjYKrIQJS+Fw+v2fMXXOGqXhh3fgWDQxNvfN+37jbNp9NGjfPA0DL?=
 =?us-ascii?Q?gqqnYsRZ1aQ7BGS7Mb6A8Gj8czRIvV9m1HLTcBjz28CDLYz4RZHuTAKpcj37?=
 =?us-ascii?Q?Ar3rnYg8Smrk87IQ0XpX7t+rx8kH/ZWAdHYvkx8N3+RJMPS808lOVUIv80hN?=
 =?us-ascii?Q?fYjw6qxbbu36eW16f29l5Fh06bMAmS3arpMjx+UU4vSBpg4nDkITQwGoCd5L?=
 =?us-ascii?Q?7EqcxnTvKnKbx727BzqTWwTZcroRx+FmF43n/mRskIieWtfmbS41sLbEPh+J?=
 =?us-ascii?Q?0d2lpFrOpstuKjWILr/Vp+AqI5GdXrinNFOnAsp9pV9lhWT71I9NyH1KDJpC?=
 =?us-ascii?Q?X+5ZKSzr3rSB6NBrTMENhvoGb9Www8i8bjiumOoqNq5oF5nkxf2ejAlkN4q0?=
 =?us-ascii?Q?AlDCnSIsZB7ERquEIwtQ6d9EG10Ul5+P2+kKFGSz+VdbKONjAuz4uwp5tU08?=
 =?us-ascii?Q?8GCIKCRVNPuKny0NWzV7uGCk8Z9IV1AJbCiNHpB1cngg0zCOIzMYidT0NcwX?=
 =?us-ascii?Q?YGzqMLKIw46tfzT929ysr8rB+K8eGIJyvIcZTgUz9qehGKFQTxJpSwp76ZlZ?=
 =?us-ascii?Q?t2j+zj7fEp3bP9GG0lDn0Wt1HhNMOkmKJc92L3GLN/gfWFj7R5jwZs1BYnV0?=
 =?us-ascii?Q?HAA0/SejnmP9ISlCeNWt9WVPolOx+WvwTR8+odTcr1KVUpeZ4qjz8aS/uqTk?=
 =?us-ascii?Q?UDP2io2CMrt21A1Tk5DOt8eI6Ac/Dq5FNb7hHzn+97UUW6xXjDuyJubYE6+5?=
 =?us-ascii?Q?zdFSkGT/6Lqug24yDUguepeHUnSOoNNX1BqiiSLUXYA+4Np1gSPmgSqSRyhP?=
 =?us-ascii?Q?mgdu0hAey0Rm40xNfbiVbR8kZrr7tcdO7xHtjifaTg+IkLpv+DDj3qkOcxVQ?=
 =?us-ascii?Q?428aRV9KAHRH7apqvwDXTXezC2AnhLD3hbCDDF750ICkYeYkuEsis9qdwk33?=
 =?us-ascii?Q?X1Y1epQZb1JlTvIiXZhFO0eSHIYU+4VAhxAEWYuxTniqwDwbYYZD40WmMaCb?=
 =?us-ascii?Q?6ZbjpzwKkr9q4xN/7Gwd02IvE72BHYHjPmlL++jg6t34Sph2tuTTaZxGHQll?=
 =?us-ascii?Q?c9ye3IKfqyVJp1tldQ6QaCFeeVh3gtubNhWAyMjO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5225895-0743-49d6-aba0-08dd0d5caca9
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 14:23:04.5630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dBxnm/V7vmIlPJJmSChDeF7jaFDfDoBjshYRxHRaN9ouwPWO56OC3kuIiELXIJIb1Z1Q2hECsBS8PUPctNCIqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10715

From: Carlos Song <carlos.song@nxp.com>

LPI2C support master controller and target controller enabled
simultaneously. Both controllers share the same SDA/SCL lines
and interrupt source but has a separate control and status
registers. When target is enabled and an interrupt has been
triggered, target register status will be checked to determine
IRQ source. Then enter the corresponding interrupt handler
function of master or target to handle the interrupt event.

This patch supports basic target data read/write operations in
7-bit target address. LPI2C target mode can be enabled by using
I2C slave backend. I2C slave backend behaves like a standard I2C
client. For simple use and test, Linux I2C slave EEPROM backend
can be used.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
Change for V5:
- According to Andi's suggestion, modify commit log to align with
  driver logic.
- Fix syntax errors in some comments.
- Change function names to lpi2c_imx_unregister_target() and
  lpi2c_imx_register_target().
- Using strict codespell to checkpatch and fix codespell and
  alignment error.
Change for V4:
- According to Andi's suggestion, simplify the code, fix alignment,
  remove redundant definitions.
Change for V3:
- According to Andi's suggestion, enrich this patch commit log.
  No code change.
Change for V2:
- remove unused variable 'lpi2c_imx' in lpi2c_suspend_noirq.
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 257 ++++++++++++++++++++++++++++-
 1 file changed, 253 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 9778dc8f6d36..28a94c1a4c96 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -43,6 +43,20 @@
 #define LPI2C_MTDR	0x60	/* i2c master TX data register */
 #define LPI2C_MRDR	0x70	/* i2c master RX data register */
 
+#define LPI2C_SCR	0x110	/* i2c target control register */
+#define LPI2C_SSR	0x114	/* i2c target status register */
+#define LPI2C_SIER	0x118	/* i2c target interrupt enable */
+#define LPI2C_SDER	0x11C	/* i2c target DMA enable */
+#define LPI2C_SCFGR0	0x120	/* i2c target configuration */
+#define LPI2C_SCFGR1	0x124	/* i2c target configuration */
+#define LPI2C_SCFGR2	0x128	/* i2c target configuration */
+#define LPI2C_SAMR	0x140	/* i2c target address match */
+#define LPI2C_SASR	0x150	/* i2c target address status */
+#define LPI2C_STAR	0x154	/* i2c target transmit ACK */
+#define LPI2C_STDR	0x160	/* i2c target transmit data */
+#define LPI2C_SRDR	0x170	/* i2c target receive data */
+#define LPI2C_SRDROR	0x178	/* i2c target receive data read only */
+
 /* i2c command */
 #define TRAN_DATA	0X00
 #define RECV_DATA	0X01
@@ -76,6 +90,42 @@
 #define MDER_TDDE	BIT(0)
 #define MDER_RDDE	BIT(1)
 
+#define SCR_SEN		BIT(0)
+#define SCR_RST		BIT(1)
+#define SCR_FILTEN	BIT(4)
+#define SCR_RTF		BIT(8)
+#define SCR_RRF		BIT(9)
+#define SSR_TDF		BIT(0)
+#define SSR_RDF		BIT(1)
+#define SSR_AVF		BIT(2)
+#define SSR_TAF		BIT(3)
+#define SSR_RSF		BIT(8)
+#define SSR_SDF		BIT(9)
+#define SSR_BEF		BIT(10)
+#define SSR_FEF		BIT(11)
+#define SSR_SBF		BIT(24)
+#define SSR_BBF		BIT(25)
+#define SSR_CLEAR_BITS	(SSR_RSF | SSR_SDF | SSR_BEF | SSR_FEF)
+#define SIER_TDIE	BIT(0)
+#define SIER_RDIE	BIT(1)
+#define SIER_AVIE	BIT(2)
+#define SIER_TAIE	BIT(3)
+#define SIER_RSIE	BIT(8)
+#define SIER_SDIE	BIT(9)
+#define SIER_BEIE	BIT(10)
+#define SIER_FEIE	BIT(11)
+#define SIER_AM0F	BIT(12)
+#define SCFGR1_RXSTALL	BIT(1)
+#define SCFGR1_TXDSTALL	BIT(2)
+#define SCFGR2_FILTSDA_SHIFT	24
+#define SCFGR2_FILTSCL_SHIFT	16
+#define SCFGR2_CLKHOLD(x)	(x)
+#define SCFGR2_FILTSDA(x)	((x) << SCFGR2_FILTSDA_SHIFT)
+#define SCFGR2_FILTSCL(x)	((x) << SCFGR2_FILTSCL_SHIFT)
+#define SASR_READ_REQ	0x1
+#define SLAVE_INT_FLAG	(SIER_TDIE | SIER_RDIE | SIER_AVIE | \
+			 SIER_SDIE | SIER_BEIE)
+
 #define I2C_CLK_RATIO	2
 #define CHUNK_DATA	256
 
@@ -134,6 +184,7 @@ struct lpi2c_imx_struct {
 	struct i2c_bus_recovery_info rinfo;
 	bool			can_use_dma;
 	struct lpi2c_imx_dma	*dma;
+	struct i2c_client	*target;
 };
 
 static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
@@ -957,9 +1008,56 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 	return (result < 0) ? result : num;
 }
 
-static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
+static irqreturn_t lpi2c_imx_target_isr(struct lpi2c_imx_struct *lpi2c_imx,
+					u32 ssr, u32 sier_filter)
+{
+	u8 value;
+	u32 sasr;
+
+	/* Arbitration lost */
+	if (sier_filter & SSR_BEF) {
+		writel(0, lpi2c_imx->base + LPI2C_SIER);
+		return IRQ_HANDLED;
+	}
+
+	/* Address detected */
+	if (sier_filter & SSR_AVF) {
+		sasr = readl(lpi2c_imx->base + LPI2C_SASR);
+		if (SASR_READ_REQ & sasr) {
+			/* Read request */
+			i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_READ_REQUESTED, &value);
+			writel(value, lpi2c_imx->base + LPI2C_STDR);
+			goto ret;
+		} else {
+			/* Write request */
+			i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_WRITE_REQUESTED, &value);
+		}
+	}
+
+	if (sier_filter & SSR_SDF)
+		/* STOP */
+		i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_STOP, &value);
+
+	if (sier_filter & SSR_TDF) {
+		/* Target send data */
+		i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_READ_PROCESSED, &value);
+		writel(value, lpi2c_imx->base + LPI2C_STDR);
+	}
+
+	if (sier_filter & SSR_RDF) {
+		/* Target receive data */
+		value = readl(lpi2c_imx->base + LPI2C_SRDR);
+		i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_WRITE_RECEIVED, &value);
+	}
+
+ret:
+	/* Clear SSR */
+	writel(ssr & SSR_CLEAR_BITS, lpi2c_imx->base + LPI2C_SSR);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t lpi2c_imx_master_isr(struct lpi2c_imx_struct *lpi2c_imx)
 {
-	struct lpi2c_imx_struct *lpi2c_imx = dev_id;
 	unsigned int enabled;
 	unsigned int temp;
 
@@ -979,6 +1077,124 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = dev_id;
+
+	if (lpi2c_imx->target) {
+		u32 scr = readl(lpi2c_imx->base + LPI2C_SCR);
+		u32 ssr = readl(lpi2c_imx->base + LPI2C_SSR);
+		u32 sier_filter = ssr & readl(lpi2c_imx->base + LPI2C_SIER);
+
+		/*
+		 * The target is enabled and an interrupt has been triggered.
+		 * Enter the target's irq handler.
+		 */
+		if ((scr & SCR_SEN) && sier_filter)
+			return lpi2c_imx_target_isr(lpi2c_imx, ssr, sier_filter);
+	}
+
+	/*
+	 * Otherwise the interrupt has been triggered by the master.
+	 * Enter the master's irq handler.
+	 */
+	return lpi2c_imx_master_isr(lpi2c_imx);
+}
+
+static void lpi2c_imx_target_init(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	u32 temp;
+
+	/* reset target module */
+	writel(SCR_RST, lpi2c_imx->base + LPI2C_SCR);
+	writel(0, lpi2c_imx->base + LPI2C_SCR);
+
+	/* Set target address */
+	writel((lpi2c_imx->target->addr << 1), lpi2c_imx->base + LPI2C_SAMR);
+
+	writel(SCFGR1_RXSTALL | SCFGR1_TXDSTALL, lpi2c_imx->base + LPI2C_SCFGR1);
+
+	/*
+	 * set SCFGR2: FILTSDA, FILTSCL and CLKHOLD
+	 *
+	 * FILTSCL/FILTSDA can eliminate signal skew. It should generally be
+	 * set to the same value and should be set >= 50ns.
+	 *
+	 * CLKHOLD is only used when clock stretching is enabled, but it will
+	 * extend the clock stretching to ensure there is an additional delay
+	 * between the target driving SDA and the target releasing the SCL pin.
+	 *
+	 * CLKHOLD setting is crucial for lpi2c target. When master read data
+	 * from target, if there is a delay caused by cpu idle, excessive load,
+	 * or other delays between two bytes in one message transmission, it
+	 * will cause a short interval time between the driving SDA signal and
+	 * releasing SCL signal. The lpi2c master will mistakenly think it is a stop
+	 * signal resulting in an arbitration failure. This issue can be avoided
+	 * by setting CLKHOLD.
+	 *
+	 * In order to ensure lpi2c function normally when the lpi2c speed is as
+	 * low as 100kHz, CLKHOLD should be set to 3 and it is also compatible with
+	 * higher clock frequency like 400kHz and 1MHz.
+	 */
+	temp = SCFGR2_FILTSDA(2) | SCFGR2_FILTSCL(2) | SCFGR2_CLKHOLD(3);
+	writel(temp, lpi2c_imx->base + LPI2C_SCFGR2);
+
+	/*
+	 * Enable module:
+	 * SCR_FILTEN can enable digital filter and output delay counter for LPI2C
+	 * target mode. So SCR_FILTEN need be asserted when enable SDA/SCL FILTER
+	 * and CLKHOLD.
+	 */
+	writel(SCR_SEN | SCR_FILTEN, lpi2c_imx->base + LPI2C_SCR);
+
+	/* Enable interrupt from i2c module */
+	writel(SLAVE_INT_FLAG, lpi2c_imx->base + LPI2C_SIER);
+}
+
+static int lpi2c_imx_register_target(struct i2c_client *client)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = i2c_get_adapdata(client->adapter);
+	int ret;
+
+	if (lpi2c_imx->target)
+		return -EBUSY;
+
+	lpi2c_imx->target = client;
+
+	ret = pm_runtime_resume_and_get(lpi2c_imx->adapter.dev.parent);
+	if (ret < 0) {
+		dev_err(&lpi2c_imx->adapter.dev, "failed to resume i2c controller");
+		return ret;
+	}
+
+	lpi2c_imx_target_init(lpi2c_imx);
+
+	return 0;
+}
+
+static int lpi2c_imx_unregister_target(struct i2c_client *client)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = i2c_get_adapdata(client->adapter);
+	int ret;
+
+	if (!lpi2c_imx->target)
+		return -EINVAL;
+
+	/* Reset target address. */
+	writel(0, lpi2c_imx->base + LPI2C_SAMR);
+
+	writel(SCR_RST, lpi2c_imx->base + LPI2C_SCR);
+	writel(0, lpi2c_imx->base + LPI2C_SCR);
+
+	lpi2c_imx->target = NULL;
+
+	ret = pm_runtime_put_sync(lpi2c_imx->adapter.dev.parent);
+	if (ret < 0)
+		dev_err(&lpi2c_imx->adapter.dev, "failed to suspend i2c controller");
+
+	return ret;
+}
+
 static int lpi2c_imx_init_recovery_info(struct lpi2c_imx_struct *lpi2c_imx,
 				  struct platform_device *pdev)
 {
@@ -1054,6 +1270,8 @@ static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
 static const struct i2c_algorithm lpi2c_imx_algo = {
 	.master_xfer	= lpi2c_imx_xfer,
 	.functionality	= lpi2c_imx_func,
+	.reg_slave	= lpi2c_imx_register_target,
+	.unreg_slave	= lpi2c_imx_unregister_target,
 };
 
 static const struct of_device_id lpi2c_imx_of_match[] = {
@@ -1204,9 +1422,40 @@ static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int lpi2c_suspend_noirq(struct device *dev)
+{
+	int ret;
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int lpi2c_resume_noirq(struct device *dev)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	/*
+	 * If the I2C module powers down during system suspend,
+	 * the register values will be lost. Therefore, reinitialize
+	 * the target when the system resumes.
+	 */
+	if (lpi2c_imx->target)
+		lpi2c_imx_target_init(lpi2c_imx);
+
+	return 0;
+}
+
 static const struct dev_pm_ops lpi2c_pm_ops = {
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				      pm_runtime_force_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(lpi2c_suspend_noirq,
+				      lpi2c_resume_noirq)
 	SET_RUNTIME_PM_OPS(lpi2c_runtime_suspend,
 			   lpi2c_runtime_resume, NULL)
 };
-- 
2.34.1


