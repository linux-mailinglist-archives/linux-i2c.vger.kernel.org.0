Return-Path: <linux-i2c+bounces-15226-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D98D303F2
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 12:19:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 16E68300CF0F
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 11:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA2E36C5BA;
	Fri, 16 Jan 2026 11:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="dINjtcW7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010038.outbound.protection.outlook.com [52.101.84.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1076D2FF65F;
	Fri, 16 Jan 2026 11:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768562358; cv=fail; b=f6Mx2Ei7XQZv1skORKkZUEky1iwGhwT4Po6NyFl1pJIkaaQFQqiOBDfRAi8gZLQ4Nedl+nZD5J39tnpqpV+JkFJ6rlYqspEjeBNKCWW9wkwDWHYsdFAzmChWOXNPkhfqF/x7x1dflY7Uz1iC3GPDaeJXpiy5aDUglTSj682o63U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768562358; c=relaxed/simple;
	bh=XRdV4fuk3okZuGsQRCrbEsVAQ8dVphVOSnN3t8lrnys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fd7onOs4646eOMQccJDXsfkks6e1bNtSzu235Hv0n/TR6UL/021hZqrf3eQlYkQYquALIG+mW0uhInGNOltI7OLaS0JsFcC7EEKiFQRoVg4Pj/r3zjeLfP8hEByAndlLNPn6GDzmhMMv7KGyA1K1Ppl0+FuIDNDNiE/Woqc7NME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=dINjtcW7; arc=fail smtp.client-ip=52.101.84.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQ2J0g027HjA501z6rdHuLXQmjExBC5cGZU0Ob5v1we1BI6f5ibTOL7pNPSKWjHk0ph2cPwM7WvOn3O+sH8PpR8Nanp737MiRZHVVByIeXAHkcyNDGIrWZgigg/6hnLK93adzvZ50vc2gs/102V9qZdHaRM7AKT6pLl5FLCqUDjI7rMbNHpxc1vK0M8GIIR9H1u2Y15hhpxXY12krThuIN3C/s4254zQzTAePuP7rrnt+fi6NZhgFJxtmob3b6HYOojYcKfZvC3PjqwEZdqKnH/oRx50HzD0TM8dmdLG64MwWQ29ExiIkzpYIRU91IRqlFhgpSzNRKycjiTY0yvt0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6hi2Ng57jOgja0NHfG8qsfVJKsfUIfcFnUYxfdNiuA=;
 b=s805yd3TK/O+xN9A+XCU74RqpqXNKXnTBCbn5QfL4MQnYqE//w0gEQW5widk4Vx9lmiX1hRtpUm9VYqU41ghiODI6/GhzZNcLeDnIjWbbENPih/XIy2+o5gbv+eMcBIRUzBniar8f/mzYfuxWerQ1ca6sDhCXj1diU5JvMxIWU/VGDR19/NDezmsXhWyEWldL06PNWfR51FXGPe/MhqEi+jO5ggrEQbrttanG6gHHQcrUE7zO2oSX5cqpLIw0ZHcdrg2x7JXk2CZFnbg3/ojpoeGXOfDXXdclzxKpizk1rjQeLFTO5sM7CFNblxposCB45dxc9FFbth9FeLpx4HCug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6hi2Ng57jOgja0NHfG8qsfVJKsfUIfcFnUYxfdNiuA=;
 b=dINjtcW7MOA9xBOw0SofEPLzyYXcpOOTAwvXBJnjF4PenD3UUDjqhnm1VaK6yRC2SGV0NcGqWqWGQxeFJJl2FDfuxXV6pcwtNjXYJAGQmWhRyRDlh2qeLGaLIy/lAWl4mGBsvtps6WzrWEexlYB2K+X/uB4RtOPNMk9DT/DXwx0=
Received: from AS4P192CA0038.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::7)
 by AS5PR06MB8656.eurprd06.prod.outlook.com (2603:10a6:20b:678::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 11:19:10 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:658:cafe::67) by AS4P192CA0038.outlook.office365.com
 (2603:10a6:20b:658::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 11:19:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 11:19:09 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 16 Jan 2026 12:19:09 +0100
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
Subject: [PATCH V3 0/2] i2c: imx: Fix block read handling for invalid length
Date: Fri, 16 Jan 2026 11:19:04 +0000
Message-ID: <20260116111906.3413346-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jan 2026 11:19:09.0541 (UTC) FILETIME=[EF51C150:01DC86D9]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AC:EE_|AS5PR06MB8656:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 09236811-31b8-4195-e468-08de54f111f4
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?90pB0Gn+OnP9XFpQWxwZ1/xA83KgJTb5ie6xgVyWO18veFVBZSwBCBJeE9j7?=
 =?us-ascii?Q?xQdfTzSZRgLUzceoZrBf1gE7hI0/pKQ2Mm/l9ajw8hZbgAdRGF990SLKzDWf?=
 =?us-ascii?Q?QLKPrQA/BrYI7EFOJzxJW+OAHmZtv0RKUVzFHJcQTN38rIGZq6eTMMrud3t5?=
 =?us-ascii?Q?5litPtfY1WOx1LvBAawO8Tmk8z/AIxHrYfNOZKi+zR8X1EpEAqHSPf2GXOBg?=
 =?us-ascii?Q?Hnh4ESqK1+clVxHk1qgBpkYMHeolG5+SJNFWi00qk+l5gyXTyQtDXd2j8hUY?=
 =?us-ascii?Q?rXRL+oOy7krASz3Eu2U7irevtF3BrD2JwRtWrKMvGlCWUcuGML2rkSMoRjoV?=
 =?us-ascii?Q?NSfUkPySrw2Uoxe2nfmHBEt1RP968MdSXuXSdlUMf/dxu4Rqd/5gY/mBonZo?=
 =?us-ascii?Q?7S/T57TQVHP2MyIeJHQNRjj79qDuyRY79x3V9g64ZuV0tdP0o4r0ewW6yHcX?=
 =?us-ascii?Q?JAaLlnz02uRrW1q1WnjX24ZicCMNCOkIU+vmUvFFdJfuojpCym892uVOCYPW?=
 =?us-ascii?Q?QZRZ1uFxt2/G3UAshV5afaIfpgUEKIK3WtLA4xdHI/Jz0WR1KnGqMNKZBVfW?=
 =?us-ascii?Q?NOgMQEbkyqn08LfvdoV2+aFPE3C0GMhYIPY8Z7lB41SicU/q3TP57BL3aiAd?=
 =?us-ascii?Q?ROXTVFl9QRXCMZzbG1eCRKgZkFTcE/ESJRNCaX4z36CVR4nNhgft0s62qvBU?=
 =?us-ascii?Q?FpRjb7idsxRoK3v5qk3x+aE1OeHEs9XWHr5Ryv0IVkP8reP4BxeuwrSfecVq?=
 =?us-ascii?Q?Ga3BmZ6QOXMtXUs4rpJs1UA4fUqYGR60BByZ3clLfoQS5y0U6wPcLIgH/gWz?=
 =?us-ascii?Q?XLjQfbT71BNjTjnRKU2SfFhGKjlJ7WmmpmhCKC0pQSJszguYkLYz4jUa0t3a?=
 =?us-ascii?Q?Vmv8ofT2q6ELfnh2u99cK61PV5au75VeLYsMNffJ7wXx6iiXGLuH8fZDGZhv?=
 =?us-ascii?Q?Z9VeJSYqdlt2f5URqONYBlXz7yxVUnuYCk/Z6MXIhIK1kTKv76fHP+W3A8iv?=
 =?us-ascii?Q?RCjwfGqLV4KfD50b0HAe/QlUQ+GAhucJ0/gwb7NX0+25Ugjwo1LCYZxnsRsG?=
 =?us-ascii?Q?UjKjLDZPorWELymCLPzGQXvmNlA78b+EUC70wu0RyO/c3yeXNx3KKw+JBdW2?=
 =?us-ascii?Q?ScFRmnBfBgXh6lKSvGCbk1RTlupJThpgjFDKeKWLPXR4gtUNZxLV0n9m9atE?=
 =?us-ascii?Q?FIt+09NtVvGQlBktqLdL6b9sn4JDLX5c7pnCGCe4sYQPBxJlq+bQo2HFx927?=
 =?us-ascii?Q?KCWleXhR7sgRQQwAWScQ7VlMZWAmjsKJ1HSu2jiP5KQElxobFJePRHJ6D15E?=
 =?us-ascii?Q?ua5kqTldUawWOjzEzUJISTBG06zkQXR5hxt4nUF+8Z3374l53zxyvoOF7oun?=
 =?us-ascii?Q?oH4TK+z+2t298A3vPJ0ocdlDakbbWFSVSOxvsi7YPgZJXB3b2O11Hqt9AJ8a?=
 =?us-ascii?Q?FfIATj3yzGolGyZ4V0G2IxNzubxcaEM6Qk4liliBI+cb8zlYeuFccdXbBh/S?=
 =?us-ascii?Q?eiLYypXLVcnC/PC4Si70Mxk8Ap12syHIYKEE1gsGk/Kx1XRKigs2nhWdHioJ?=
 =?us-ascii?Q?oshB10vd/ScKtHZEqub8467stbWkTSRnnm7kPi21yl+LoMCLcAYps7Z/C7EF?=
 =?us-ascii?Q?0/R9fpcrzHZsfR6xfkejuKi0pd4YLRkZfgGeJMpUc1A1Voob/GlW7eYKNDaq?=
 =?us-ascii?Q?gd8R5A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:19:09.7274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09236811-31b8-4195-e468-08de54f111f4
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR06MB8656

This series fixes a crash and bus lockup when SMBus block read operations
encounter invalid length values (zero or greater than I2C_SMBUS_BLOCK_MAX).

Both patches have been tested on i.MX 8M Plus with continuous block read
operations from battery and keyboard devices sharing the same I2C bus.

Changes in v3:
  - Add trailing comma to IMX_I2C_STATE_READ_BLOCK_DATA_ABORT enum
  - Clean up reference manual citations

LI Qingwu (2):
  i2c: imx: preserve error state in block data length handler
  i2c: imx: add abort path for invalid block length

 drivers/i2c/busses/i2c-imx.c | 58 ++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 3 deletions(-)

-- 
2.43.0


