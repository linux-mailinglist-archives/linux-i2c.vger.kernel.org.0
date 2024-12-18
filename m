Return-Path: <linux-i2c+bounces-8591-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FDB9F5DCB
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 05:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2255C188C759
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 04:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD5F3596E;
	Wed, 18 Dec 2024 04:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A8sF1cMT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE61153808;
	Wed, 18 Dec 2024 04:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734496217; cv=fail; b=OnU+QbxmUFmXqWq/lnQUpTo9SxXGkwAgc7A5+20gifvEcyiSVm+2l0+3brl2XTleQmneSyQmTNuSwx/ByX/6e7oAHKOD3pzt7geSGtQbCRyJGSCUHv4nbfOhjFIBE6fihuO9qHM9KhvQ8DDGpA6vkMa2mG/EuSImTGd2O4N1Zac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734496217; c=relaxed/simple;
	bh=d7zCXgYZlWdOjmaMAK6UDPHWnsKgDXT2IP7jCn37OJo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=cFGAwT4FTD0J3csotg35jiiSzKCWQQl2glI3hzw7+ZiU7VNxrOk5MudfHeCpEH9rMvE6uvhhSww7gFMqiQtqbG+qyMEquFXhO5ETmEDtbToldP7UxTpiDT69y43VShJdqNA1tfQSNjeEfhfTbArlEef1h2oBY3Uikm2FlNA+Vtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A8sF1cMT; arc=fail smtp.client-ip=52.101.69.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evs37vHlgd21EWo+ykEhEB6SMxWtBi1i1mr2VOlfGD6ivpCbsjaIXNMhSWfpARBykpuGFPE0+UQ6FPvzfggeGJpz2iaXQ508A5pJUWi74N3T2Xa8slg1seQa6eWy0Et5ZRUOqh4UgptJ1trFZ2GZsbYB126wwjaHLu21sz/a7MXXsp5zMTIOJGWkROomMmN5hZoJcunp3vOTl9HKyo5fFW56L9pDrl+3HOeF0L0nbdwkFum0atEcP3KrUxLI2JUhP6aKz+KWlzrGra/dyLXvRCGYiH2h74x2r2weqnzBA0O9SRzomgkzfxOp+ux6580FfAa05KQjUx1hk9sCj7054A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/Gb5r3Xhn0MnIy2mmeGlSoK2grmixxDn80VWAfG32w=;
 b=LYz+8yLXp9qxZX826x6Nv4WDRL6D+243b+4qC+SFZy8N7WhOIoXieSVE5JbCeHSggp7nR88ShVD/ZduEreuIxE8nrZYAErJn2UaUv0Y+AF7Vt+a2i6GsUSuRtF3asAzqsMb+txqi3+HhkSEfUcGtnrLLPziUM8YlZ7Wuy6A4Z4Yg9t/0sqHzIH32gyxhl/SGmMGGEmLSPDCxgHD9gJUw5SMwmogJc9udyoAuUs0b5mSzDaY2MpC+UPwyLN7bQEqaPWIl22cirEHNM66Pkc8HHi9VjKVkuK3Cfbv4YkYl8Lj7iFFfc28CazR/uiR9qSAGvgBPrmv1hvhxQSRvym4CXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/Gb5r3Xhn0MnIy2mmeGlSoK2grmixxDn80VWAfG32w=;
 b=A8sF1cMTaOYGmL4qjqBoitvqTI7iO3l2uLUjHZY42wQrG3CyTLbc76L2oNqYRxBXR9gy6X3CQcTXt1bLW+Du40kEYjiVzfHFLFmCo4UDYvCHurAV9XgGLCRrPGuzLdb0H+7OxBWhzrAwKmu9+f4ZV7zpbuimuq/AKcWG753x5nadKOWcAhrwWjOwfSQVvAWGhbd63LUFstky23fnjua5gbQ4E5UZUZtvAVcpHI/Hvu+2bSd0D7USqBXpBrWCqxLWsfAUahyPVOIjZFrxWC+K0LjuyFj2P0uUSnywMhJEakrmBsZEXMj3/B76CXGxWuad1lWv331CaI1WxbbJPPlgzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by AM9PR04MB8873.eurprd04.prod.outlook.com (2603:10a6:20b:408::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 04:30:13 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 04:30:13 +0000
From: Carlos Song <carlos.song@nxp.com>
To: andi.shyti@kernel.org,
	frank.li@nxp.com,
	o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Carlos Song <carlos.song@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2] i2c: imx: switch different pinctrl state in different system power status
Date: Wed, 18 Dec 2024 12:41:14 +0800
Message-Id: <20241218044114.143358-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0062.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::15) To AM0PR0402MB3937.eurprd04.prod.outlook.com
 (2603:10a6:208:5::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|AM9PR04MB8873:EE_
X-MS-Office365-Filtering-Correlation-Id: 841016b3-4c55-40fc-234d-08dd1f1ca9d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vmEJlv5ILRxPU1iqrzUxCxLwezLclLxQkSbI/cwBjHgLqiArsTBmJJ8Ul5D0?=
 =?us-ascii?Q?Ctorp1NDYZV6hpWDHbYTVS/XJv61lP2KT1nIZssoeJHr4ouHLnaj0d8G8DV/?=
 =?us-ascii?Q?XvT1XRE9IPO3URqrU4LdCDAbOJ6Zs9zRLaMwmg1XMcZeA2hFP1mdL48YiPTU?=
 =?us-ascii?Q?xkYQSg38+m9R200mWV8k5NNaFXw5Q4uMgoQb6QgDjA2zpciVMl9/mw7t2uOn?=
 =?us-ascii?Q?2F+B+FNX/39DKI85AXPrkzGW1VPhwkbsiEyz+GxkAL3kEhx/SQgZaqwepLmr?=
 =?us-ascii?Q?5ZbxlbawTMMYzyTkUftMUKxOvHH18QbHuCdGx890MzJoK0309KfryxHVlRS0?=
 =?us-ascii?Q?2RuWj9oIXZklb7/JLZBejXoypSz6YxQ3oqR6d4KfvggivtOBYATvHonbP3pc?=
 =?us-ascii?Q?vz7x0DvZB+oC6yZ8Y9J95oCH0jrfuA0nb0XKQHHCVG5iwwTwg7Kzx8XybZCu?=
 =?us-ascii?Q?XLhwXftcRw+heyThNNeg5rveVBwD2UK3IXyWzBuG6ABLfFyGYj/swgYdTVVF?=
 =?us-ascii?Q?JLgYGdIuG0PrGoWLFSyH56tfUNMnAGLfzScbkzFeTP6eaBhEcUYHxjm5LTlS?=
 =?us-ascii?Q?mPmlHkpfLDyl6PQNLxAE/0c38iiXDwPZsAkk/0eUZ3s9/2snUC6ECJpnMdld?=
 =?us-ascii?Q?3uAjzkRiGKfUHwJdVC4c+rP8STiTSwophZHeXegclq8TdwcP6+p8xPZ6Rtkn?=
 =?us-ascii?Q?67lEMTPMhe2GQGiI0iZcmrkGud0cDXdMJBRCKnziqJYgH3H2NOI53lk0K96U?=
 =?us-ascii?Q?Xov21u7/g9QSA3n+nxEy7J8MgiwBS+ZIXlkn9JCHrGCjrqQZc/EAmomQkL+O?=
 =?us-ascii?Q?GWvam+aL9ZL6BsfzygO/fqaIY3vSFwRS5qjSw3Ekif0HSuxhxJSPgV4wr724?=
 =?us-ascii?Q?o51znYUME+Ai6JpL41KiWIL/1MzeN3TfluQJItV5gziIUNBq9/ZAdESmVdQ2?=
 =?us-ascii?Q?EEzNA3RLXHH57ORG04givflWqOawvlLbWAPLOj6OD/aXOKi4o1Bk5J/R1oIE?=
 =?us-ascii?Q?gnBXpKIExeGmbWYteGfU2zn2IhBKS1LAv0ntb8nXIg8DIZuKUiJ348LZg8Rv?=
 =?us-ascii?Q?IL1AkM/txJyraMfI7orNa0bO/cmXtzb2BMmF5ZSo/WyEU5oJ43XAzdgPEeLY?=
 =?us-ascii?Q?rJ1y9sGil3JVFDAqFZ+2HDMKlxxt67vFCXT+2uD/W+ispYpudeuChSoLGPt7?=
 =?us-ascii?Q?WzEiqsu/FrL33btUn9VRBqKa0+md3G58w5TzJb4FoRVNzZ1WL9o/ueKtq7tT?=
 =?us-ascii?Q?TS1hH8QrIxqvRx49CoSmz7xS1sqVes638QpRQITKVkVIPapK+dTu2GyVhSpA?=
 =?us-ascii?Q?oOLmGqLWMxvw/mJKDYtiwJwEYpimK+AHU3A4XQVr4gCBF+cKFW95gkFSssP4?=
 =?us-ascii?Q?f+ccAXwyLbulx9U/fFWdMtHUr5LUfaroZHyBIfnpTn17I8nf5bI/EQomgDVB?=
 =?us-ascii?Q?oPCImCwSIieetnYoENkZUfRhzi3Xi60x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zCyCRL6rCazZ4wcOj+tG0J1jFuYF5m2aHPSW2/VQbxmsvbV4txg3b3oAppni?=
 =?us-ascii?Q?wnV4g5Ir8MUKyZh5Z5+ZhI1j6RKEbCVPOUD00Kr0k1M3KCqxwhia1exJrOIw?=
 =?us-ascii?Q?b3YNbqaTe3GJtxVDMLZoWqqB0at/xZ4JGZxLx8nVxzcE2LV1oV+1XUK6mLeC?=
 =?us-ascii?Q?vlvJCuCug5lVyB1IxbpIgXeqhXuEvLGjwdWxijQBKqyYboUXNkgR4G2DR/T6?=
 =?us-ascii?Q?VjMACuAnH2JTMvGSDgp6uaR6Fu/P3Y4Z5S2GwgerlFnGsHYnrwbVIG/Q4ofZ?=
 =?us-ascii?Q?AKZsHFgWTVDq+nuVh8fGSb/WqCTL0VO5DMWnERyWwhn7cw5MJ+kMVJYnRxIf?=
 =?us-ascii?Q?koYgfgqHEFUXYXzlL9x1pcflFALbKRtBzMBbh7tnPbrusJihbtDd7l1316a9?=
 =?us-ascii?Q?rEsqzASJyP73zBVuad9Vlcphr3vwk3NNWkxJs3mz+iYzCAAB3GqMp+caHFcG?=
 =?us-ascii?Q?ZYHUkj+XL2Ft44pXs26ba655mV+VLzzLMnkFVM/FsDpSqEmQ5FJHVPEthHl0?=
 =?us-ascii?Q?nNpokhq6CebzwuJ2MkjAnUl99iAdgEKwPmJ7TCNKbB+k3o4wJY0eLSxCkEwE?=
 =?us-ascii?Q?h2rhcArBR5B0kevADUQSug+h8gdUosZJmME4iy1I35AqfTlQZE+nR/REf7Tb?=
 =?us-ascii?Q?vyhyQ6UhRyKlsjCdMpiHZSIkOXONU57uhTURpNpdeb/e+4D5RvXQVwMLJFvA?=
 =?us-ascii?Q?ZMxH/XNwey9jN2rxdjn7hc/poUUikBaTWLGK1fzv+cbw8k55BTxLrKmdU2Vz?=
 =?us-ascii?Q?692a0v42KmYY9YGoRkx3VgD4LouDJtzSfCrbdmz93bszFDPe/Odpby2VDbYn?=
 =?us-ascii?Q?wtpD9/D580dcwG0N0v40o/gHoyrNtzg29oImMhSvoqXEjMYOzgsTzZ1XdgMg?=
 =?us-ascii?Q?AOz/jBBsQwKttLLaf1FMVKe5lJjwiFVIvyjViJ7FzmevifqtHcH9lteeXPKP?=
 =?us-ascii?Q?efWFJsPNjzVb3a0Hv1ADAFZOlEA/NZj1hpZd5aUPYFb2TgCf2to594GZEGfN?=
 =?us-ascii?Q?/NIyAkru/bUmcgg79OrofIySw+VFlOmLy3xEFiJr8X9rFmLMN9xpDlC2shU5?=
 =?us-ascii?Q?jciLPjpUUR3eLqdzrqbXRuHvF2sYigAUCzLE651vzflT/maAVOeA+bsws4J4?=
 =?us-ascii?Q?O+d7gkLrQqD6kgjaOgtiwEf4peeZbJ6XBslh2O+DNvUIob3V51x0o+Tcm6eL?=
 =?us-ascii?Q?rKjk83UtQo07knMvgW/84pVQWvUz/+90WkRYVMrvQ+VWhZWoSIxL1M64XK51?=
 =?us-ascii?Q?IzhX/g8KHOIxeg2ZWnpRVt+8Frk2RVIw0VxpsHSRGhkaOaupeHPDZoDMJ996?=
 =?us-ascii?Q?hGFqM6yvVhOpnScP/hFZo1j8cHZT3Fr8yf3x685bdchSRDi+5DyBVtbWY/CU?=
 =?us-ascii?Q?eP0reu5zdX2rMERiZ0Du58q3UP3X2pXzZXykbb2rsgragFgqsJk+NoOOOBmo?=
 =?us-ascii?Q?3WGSOGwXtSHc4+8UT4IwN6IWkxJgwbdA2mcbqRSKSB3X0DCMUgbNyp2kO1GN?=
 =?us-ascii?Q?0m1odcfsgPcOgd/QyNADm5Wk2kAvB/rcH8icVq/YGFZ/Z4DYzWR4rRQ6jtsx?=
 =?us-ascii?Q?AEFcfTCY3sbpRxSN4Pim4JgRkJFYIWg+Pc9cD4at?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 841016b3-4c55-40fc-234d-08dd1f1ca9d1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 04:30:13.0496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWqoRzWAWQ05XLQkW6HLyHQCa9ka+lyfJQr3ZPycHh9bVmwFoM5XW7ojH1ObQoTtuvUoQH2hKB7vqKbSd5vrsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8873

Switch different pinctrl state in different system power status.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Change for V2:
- Add Frank reviewed-by. No code change.
---
 drivers/i2c/busses/i2c-imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index b6ed270dd04b..350346a7892c 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1871,6 +1871,7 @@ static int i2c_imx_runtime_suspend(struct device *dev)
 	struct imx_i2c_struct *i2c_imx = dev_get_drvdata(dev);
 
 	clk_disable(i2c_imx->clk);
+	pinctrl_pm_select_sleep_state(dev);
 
 	return 0;
 }
@@ -1880,6 +1881,7 @@ static int i2c_imx_runtime_resume(struct device *dev)
 	struct imx_i2c_struct *i2c_imx = dev_get_drvdata(dev);
 	int ret;
 
+	pinctrl_pm_select_default_state(dev);
 	ret = clk_enable(i2c_imx->clk);
 	if (ret)
 		dev_err(dev, "can't enable I2C clock, ret=%d\n", ret);
-- 
2.34.1


