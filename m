Return-Path: <linux-i2c+bounces-15215-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 648E1D2EA2D
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 10:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E43630D317E
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 09:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56384346AC6;
	Fri, 16 Jan 2026 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="1Dz9CtEi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011002.outbound.protection.outlook.com [52.101.65.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C6731ED73;
	Fri, 16 Jan 2026 09:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555035; cv=fail; b=mkWt+Gi/QQNXF3WLCXEcqY9jPxvxc0aXxKHd0evuuewC4ToPxWi786R+cDAg/B2yh8YBIN7L+2HcQ2WrdbtC0KE2577J/Wmt60whxv4AktSnfWOtb6eG6g97icKoYqdp0hDxeXaNuulkyb2QcTWYknb6ad8H94v8BoVAavBZZvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555035; c=relaxed/simple;
	bh=zenxyCnrk2PkVimw63TYeDFyU5E/XODwKaV/Rk6O6wk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pzJQuZ4XTFysohgzn6+fm6NWQpr8Nc/vNarAMORnZX8enhe+37o8NJE7+aGi6GeXthmnQR/fHPEUKaH4al14r4xdKO4c16rkZZ3alTQ/I3yMNSfF1rfSWF95hxZAo6mXlV/RWDj9Jx/TAJdhsA2XtWRGdrHDCS6I7Z2gxtUwUyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=1Dz9CtEi; arc=fail smtp.client-ip=52.101.65.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvzHEuaVP4G6EOvcLyk/3jCjEjqEix957DaWGG01wn1HqK5qbVLeJDzEeQA4bwdMkO6cWPTFK0HMOwxHwP699YgxCsa7+bTX4iMRAthsr2no81/76//FJYFvl+J8cjk7D9z/dixuGdzN73tloRxnLsJ6YDVdezJBQyIvgMz8I/aaJweAa7cpqEZ/9P71uS9B/h5QD95Kdy2D5zzt3HlC6zzSxG2En2y78ITnCeqXvUDTTtIv2vYoB0m1mB7mXfQPQz33xOGz1o+xT1NjK68sa0qzB13nA++OJNn68miiypRmOe5iMMD0XiiDM3DZK6AogBqKArZBzMNZhVf0bswFYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvOLKgBt0iIkqmp00gos0etEo79aDgCs4FvkScVEjIQ=;
 b=wR+WTvUTEj+jMU5zItpo09s91PXqAXvTgTtp3NgSRyUAAuHdGTF2Pr4Kj29tzDJXriYOYLGbWW11i+8Qr5A8tTQuN2km65y2RUwW/ijH9rI3gGMdK9tBkIVMU5X2moiWtwj8KYSPtHU0vWwpn1wzSpfOvwykCHySqkfIbwjzBvre8o3z0uXuJusUueSO0OEFMrgS+BXxpqCaMVnSupnqTrgRxF5mIrd1XfGiHK6UEeIybiMUBxTm0yHvfVd6oHf9+K5PhL212KWJSXOuLp1H/mM4Yl/5KkgZ6O6UJJmjemXqSmx7zWg+30jhizoMfPyDt3ANZS/bnv2Gd6VxJexOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvOLKgBt0iIkqmp00gos0etEo79aDgCs4FvkScVEjIQ=;
 b=1Dz9CtEiPvUXqH/Je0XMKHcVPKLPO5pO6rQXa6TjsLtr5XznKwbHn85+OUBO/LyvMou/5mpPBkK++JJ0EZTn7Rc5aPvXPZyGK9ybXBmbdDOQn2tkr0YcABBLfjIme8cH/MKhU5fH/v6qK3ZUPji5p4OFj7UPV+dDxLC4foHW5uY=
Received: from AM0PR02CA0198.eurprd02.prod.outlook.com (2603:10a6:20b:28e::35)
 by DB9PR06MB7705.eurprd06.prod.outlook.com (2603:10a6:10:252::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 09:17:07 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::bc) by AM0PR02CA0198.outlook.office365.com
 (2603:10a6:20b:28e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Fri,
 16 Jan 2026 09:16:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 09:17:06 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 16 Jan 2026 10:17:06 +0100
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: bsp-development.geo@leica-geosystems.com,
	LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Subject: [PATCH V2 0/2] i2c: imx: Fix block read handling for invalid length
Date: Fri, 16 Jan 2026 09:17:02 +0000
Message-ID: <20260116091704.3399142-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jan 2026 09:17:06.0386 (UTC) FILETIME=[E260FB20:01DC86C8]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019F:EE_|DB9PR06MB7705:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5155faa4-3390-485b-7b87-08de54e00503
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KKqPsXpGg2AcOFCjQ4gR4fgDkYadGtaxKopKA0/2vmiZSfneezp5JNOUl3b8?=
 =?us-ascii?Q?EB8sbBxSMtv8DnHFzpLgFSlsJC4nyyx+25AsRStvsQ6bay7z5Ut3onl64JRF?=
 =?us-ascii?Q?8U2yqBd0b2Dut05UBddzcgij2eSgw8qPeCXOaKxCWFb33L9epO4LaI51fXnO?=
 =?us-ascii?Q?RybSN3JUN2WialBCG5nFKqRUaHfoc4rjaC787fzDDvxpFIITk76eaXDzjscU?=
 =?us-ascii?Q?f3yLzAdSv9oVocmaMA7GwmCCC0OKwN9o1tyBLSeNKOTZAxZB8f34/K+SitH0?=
 =?us-ascii?Q?QO8bHjK3j8OUsQmRhy9iOvGEbJ0cU7VvfgYXaHgkqGA+Hhij5EGLV/DXTYwb?=
 =?us-ascii?Q?XaRFPrxXggFwReikKXOQ8qXnuutTkRRHhjgiVyqB+4ZYETVCnxysnNSeYGXp?=
 =?us-ascii?Q?heUdmMjofmbku/CPB4CH83aaXLFhEaeGP8qylci0BBzYflapF6yGJEsDzcHL?=
 =?us-ascii?Q?QfH8emhAEYOzkUZ9NUAX/mkNi+/RFp5LD9jvdqiMJRfkxCzAlfyu4wFbW4mh?=
 =?us-ascii?Q?OjmxMXl4RUr2wGp1J++KljsNdo4Zkysn4xtHNUghGl3SWb095cx+5sLNwo7g?=
 =?us-ascii?Q?h6zcnWTG86PwuP8H9tectmPPNbM9GqI10UlFq+zIhE9RWZu0SM+eAA27XVqC?=
 =?us-ascii?Q?QdH1e+0xeRaAJh0cNxPuKlNtxRGhW3e8DmeCeFJvAGvNPYaqTDnrjpYNAnjl?=
 =?us-ascii?Q?Gks4PDeQYyQEpmeB8eout5YDdCeVpWOh/7gwhUG0zwyBvvr9zixnS4VVVU99?=
 =?us-ascii?Q?I31UAaJa0eF0fCPOM2YzDL0of44yqzHC1zJZGYUlE0h5m4KBJgFH3Ph/Xhhy?=
 =?us-ascii?Q?4TRz6mo2lWcu9iGFXo8DWYQ8KXdBmfbUGePuo9ENcaRHlioZVGxSm5w4wsjV?=
 =?us-ascii?Q?JuaxD8qKoI8guH5GVh7rsg7gOum7vME73nR6kpxWDHQlqgj3ssyTGjfULWpt?=
 =?us-ascii?Q?SZ2J8xl+ZgQ/uS0uHPgkp8mu5vlGhKi8BNrCfR1kxfHkB9liIxRwd2ciUJS3?=
 =?us-ascii?Q?ixRNvelZhYjmN7bfDdL7f8I/6PswdFTM66sEX/KQdeRs3G601k4PKRJK0pmf?=
 =?us-ascii?Q?OIr2iJwmyjfxMbWDWHBHL+p0cSYWcu9BWKdIf2CZ4L2xRSi3gcQ7IeKcefbq?=
 =?us-ascii?Q?DiaXblEjVB4RA0T+Bz9ROie3B5/2aG7Sss3iHsbat5VNWLzciItupwI0gWGy?=
 =?us-ascii?Q?xg7JL3vcy3gSDOrHAd2Rre7xUHSzYGiVJXbD2FTenPVwIul+x7VsHk1zymBb?=
 =?us-ascii?Q?+CcFdGDVZQHh8U00sphSctlAtzxpM/rdXJWRIZqv2R37K8wSU9S6EeKzTQOg?=
 =?us-ascii?Q?wsB7HEAwk2G1QIT8/QWjAqLj3bn8VATxMOyD6v/uqy8l3l3nkJrvnzJOomfg?=
 =?us-ascii?Q?q0HPUj7EjVw1j9j1UloqFXE03W/C6ei0OFMwr9JRdj69NPoIbcNZG19v9LzZ?=
 =?us-ascii?Q?6zRflEjdsFIkYphRBjuxSIo3Xbj9+d3S4F20OsFl78J25TE/dMYE1e6sDBeT?=
 =?us-ascii?Q?1iPmLoVHnLi4Xn34ncCb6ptbRwUkt9boOBZ0oCsFsjO4m4j98qdtdOCCK/Nd?=
 =?us-ascii?Q?lO8DHZteqkoGs7/74A6uE5UKhF4ptzKxoucx8WMfUetn7dAinmOXafCCT9wX?=
 =?us-ascii?Q?ih0qjsgCP0X89jvBDih26BtLvgo6ymQRILdGF1sYiWYxkTSQMRBuTjXZT4vO?=
 =?us-ascii?Q?qujbvE7L68gdVgTa2tjvUC5bhUA=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:17:06.5744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5155faa4-3390-485b-7b87-08de54e00503
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7705

This series fixes a crash and bus lockup when SMBus block read operations
encounter invalid length values (zero or greater than I2C_SMBUS_BLOCK_MAX).

Both patches have been tested on i.MX 8M Plus with continuous block read
operations from battery and keyboard devices sharing the same I2C bus.

Changes in v2:
  - Split into two patches for clearer separation of concerns
  - Add detailed comments with reference manual citations
  - Implement abort handling in a dedicated ISR state and handler function
  - Remove modifications to i2c_imx_stop() to avoid affecting normal stop

LI Qingwu (2):
  i2c: imx: preserve error state in block data length handler
  i2c: imx: add abort path for invalid block length

 drivers/i2c/busses/i2c-imx.c | 58 ++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 3 deletions(-)

-- 
2.43.0


