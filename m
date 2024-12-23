Return-Path: <linux-i2c+bounces-8694-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 028709FA9BF
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Dec 2024 04:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18BFE1886BB2
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Dec 2024 03:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37281369B6;
	Mon, 23 Dec 2024 03:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ii129ahY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from outbound.mail.protection.outlook.com (mail-vi1eur05on2061.outbound.protection.outlook.com [40.107.21.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E624B45023;
	Mon, 23 Dec 2024 03:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734924777; cv=fail; b=OX1lKgUngVXloPVsuxuCcC8OQ63tZltGWimTCEGPlo5kMb/WqyPaFhrZolpdh9S05xQD2jE7T/n7R0AffMXJfou4fniiP46ADs129DpfudWyROVZwzLMDEDtA2RR/AU8DKnlUBi1sc5mm2+l2n5lVM96bv470Oeip2IRXdfCjiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734924777; c=relaxed/simple;
	bh=9Py7yFWRHqUidZfkFd2Mq8D3uAM4TTrGFm8KYAl69Vo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UaW0tGUIzZJop5VYnwdcnzGuazqnWytKWI2MHpw2uHhs4Yvv3Rh/psT0QiUrDNfDEmMLdbrPV9tDuG4QyBEB9KiNS5R+uC6ylLO+JvJKucPm1g0+2xvHijPeotdU6/rASEGSgfbgRLcfhBaWJnUAP/bp31Fpq84b8S7UF9I3MV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ii129ahY; arc=fail smtp.client-ip=40.107.21.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ON0lSRpoW6270Q4n7yrpNK9kGnbkOh7AqLMD+zYc8zBn4xKlRVIR1/UHo4HA9r7baroWfHBSVnyM1cKmtMqyfi4so54XIvshtfzF3lNrmByFlminuhO42DwSVCtUj4IBPdZegJt0IiahQVUuFAQXzvq7lT+50Iz6CjwHBeEUmt/h8BTwLI6ZJLx8CT0ZDFlZnYariuq32B4ytXQEwYHQmZ7g87IrwO/kSJTBIx/hFGEZoiMALgeh4vLHri7QYzuTy39EkZZggeoj5Uq+IdqcyVSvh8vlEEuqt5KB72E6R3M+moDfB/XFzfzjEEZc8ht2NULtsgLeCnxQmHXx5nEA+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXYopqj56IbSRtEE9ccZtkfmaJ/ykG+YT3BHbCiMas0=;
 b=AAc9FHN2tdUgHv4rpWpyJlgeiBK79ogYA+s7+sdrCg4Tqg52wX3k9WVM75kd2tG9VuqIqopmbnZkSYWl6/4QOqpLvDYNzDFY6D0fjEicwEfUUtmFLZNiUEE0w7Io9X5ySyltJ7vRqUTFu+Mu+pLcB9AQIVgsR1FU/ruTxh46qbJLFxp+al0G7E/HSPcwjxJPfdfyH+6CXn5CssjU0BzwhDNxxmYX2pGZm1uNdL++x04btuPrFygVo3VtqDvr7hg1jOqrlybWkrfBC6v1T+siEsPCx7Uq/XQ1shyYnq/fQUjC1me2CaXP8DaUTR09qNv9ay+qs08VPKo5NOFombVe7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXYopqj56IbSRtEE9ccZtkfmaJ/ykG+YT3BHbCiMas0=;
 b=ii129ahY6yKRIQz9GHRr0XXR+EXqjznyfmof41tbWC4Vm8aNE3qL8XOYMFrzfgQew4n8/iLiXvARjIqevwlUyKPEJOfWUvUBaFzBIkCHcDo1riQo07IuQBZGsjUsFe/xYgUfcqCDkRYeiD0oJQ78t8F5/nyVhDMMo9wl2hzpx650r8sZjIgXYdImUQ5rZTtPFKJiETIDea+fqDPTz8QcIV5ivbmn8OrhJn1jI8jhmXb5S5xIvs/GH/d4NXxhCHlkwOG3qhWJboah4UKrN1+c/TAcE9peaEt04uTZaVCpD5A+CXiBTJCjNbGHBfxb2cleFQ+NUgsbZPbyuwM8soIjyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by AM9PR04MB8905.eurprd04.prod.outlook.com (2603:10a6:20b:408::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 03:32:47 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 03:32:47 +0000
From: Carlos Song <carlos.song@nxp.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Carlos Song <carlos.song@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3] i2c: imx: switch different pinctrl state in different system power status
Date: Mon, 23 Dec 2024 11:43:43 +0800
Message-Id: <20241223034343.544002-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) To AM0PR0402MB3937.eurprd04.prod.outlook.com
 (2603:10a6:208:5::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|AM9PR04MB8905:EE_
X-MS-Office365-Filtering-Correlation-Id: 19431c15-b2dd-49dc-43c2-08dd2302785a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AyaY01S42qf398aE/bQTR9FMdNlv0KsYxsNAuQT+vSGyujScGhY+17p5I5C7?=
 =?us-ascii?Q?Ra0MMLWWigpxz9uRgBhsZs46/29txII7AJzTK1FNx07DecBAt9XAnJUpr5mx?=
 =?us-ascii?Q?zXlbQwcjafcvavtlX7uZ72Tn78bHryP0YkhhlBVHMA0WJvIGGTAroI/dLsNN?=
 =?us-ascii?Q?CzJPm4iil2ouQ4YLv/Ln2hCzYEpOwiyX6g9rs9nASpdZPDREN1HUd9YAA/TN?=
 =?us-ascii?Q?Tdkm2oM0ZR1qaOOCmBGWebMjJu/wY/4F+Y7urqYidQLX7EJvbwm0Yq1HcMm5?=
 =?us-ascii?Q?W+/iQNmcYXUJKeAik/7xiRobThcgDlMOLZxsOleBEsAJc2SMUSq2DfGM3V6a?=
 =?us-ascii?Q?RCGPlSpQhVHxmZ0ptguAXsNsvroyxL3/gJ5BVuknQrypb3p2GrwJjOktWCnm?=
 =?us-ascii?Q?TSGlC+0+GoksEOGpouqvFctGqwAWwNOhdsKi2Ppe3+x3qUywr9E7MbGGpXfI?=
 =?us-ascii?Q?ewiPN7C2UJ0fIXNR3nStbBVHOIq1Cja41iLaRUAmX44hhQq0H8QogIEdkmeM?=
 =?us-ascii?Q?ydLqltNZVSv9a8IoiKAWKZxwxD1Vzd5vbALbwhL2CPpiGih74Svb3SaRJpq6?=
 =?us-ascii?Q?UaYpKW9/YbaHJcsLo17COrB2MmaPB2bifWm9LnM0z1gi+CPxHYsPSwlCqfB+?=
 =?us-ascii?Q?jO2sym+++LBUaWbq+tz/tQujfzEegeGFqcGIxp78dXw+SNyA8mK+yrQmJxqT?=
 =?us-ascii?Q?oBChjMdkD0KONSEjF5iX1ps1PqRyydwnlVhzFJe/5Fqem7nbmMvs1FveQMSC?=
 =?us-ascii?Q?W+sy6bVj3MQWWAVOZl2Ecmp0rMs5gnbsXbgChkyoDLwvuVoFgY8KEAAqmi8e?=
 =?us-ascii?Q?klxkgaWQh5brG8TsxKH2ogAd0zQw7cIlNiiaMgW1FvAoA2iMWJu3CLL51iQ6?=
 =?us-ascii?Q?v/6mAZMjo6rVklU6/WWLm2SMrm1pvVuJOtVzUlFI7ZDtZRAPPz7Jv3xBba5R?=
 =?us-ascii?Q?Tl0nKOxN7szD4eqBud4AnNsV0i4hxfNKjeTXYDMp01xfXBy/B+koZTNHMx3e?=
 =?us-ascii?Q?FVDZeHrauHWWcf+tgaSpenF81xg+qWKOTVgePvnUtBqkwBPeFuqPMIZev7QB?=
 =?us-ascii?Q?LkzK1g09r2LEDbanpgYFKvI4/ckQznHxJehN+uWlMPBj4RW2fuWPMRnou2de?=
 =?us-ascii?Q?vn5ghFiCJIkDXDUyYpJAXvJzMl2Ui4IkFiu9shsEQ+r3hhpzh5PxmVgU4KeT?=
 =?us-ascii?Q?RhhQpBcYF0nlHK0r3L85zlzhQ38wUrXBmcYmnDvCRSueXKlCj/Y/0O+ZgJr/?=
 =?us-ascii?Q?RXLsEgim/ByloDYHc0pPCOAFfRGE4AzmJV55wPWyWK/4AGHzevzlOCeGaWxv?=
 =?us-ascii?Q?qWOhr6iJB8M8IFM8/6TFMlH9CqsRMcDUCdhuBFPYEujXOv1i9/39i6lyrRD2?=
 =?us-ascii?Q?wwMhi7cMnc9uFeWqz70NMHuEuwblEbGD5FtTJYIy+vi3GTXt5qG7oDlcHHBe?=
 =?us-ascii?Q?/HdQR5B+rA1tjEgstwbkYHgYoRdC7wYF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OlFJPraRGWqn1UZlS1om/Sxs0CwmxkEm2aXsfpbvbFIQUacY0zjNs6rbiF56?=
 =?us-ascii?Q?iETSVklmvzu0PEJKSEh/3dj3etjtVV50SunyeGALgjlMqMMKg4MuuwvHk/5V?=
 =?us-ascii?Q?Q+5QC5C74s9YwCyfr9zwOEnHDdLkrCJEXiYKveEXLUKzFMQNzU/WvZBPqDDQ?=
 =?us-ascii?Q?gXmI5rwOi1VecfePE/m5OdOgk+KzwwQQ7CX6I0RzESpArKE8fNhVjtOIBF6I?=
 =?us-ascii?Q?TsBxmgQmdtyGP8STGSuegJDxNQGnZNCcC8Mq9gfIz6bDHlGHhEQG4MWSPrm9?=
 =?us-ascii?Q?FJDSq3Z0R2XM6TsZbJ0xwqiGDa/QEnpNTIAW4nxckPWz3csQ9KEe4TpI4sGw?=
 =?us-ascii?Q?2RV6hhc0JoCko6Eq/IK6nRYLdqv0Qu46li/60fknO0+FfiXo6XscYidPWnL3?=
 =?us-ascii?Q?VaW5exfKk2LWNbOU1Zlp4kdXTl+NIb6b6vMFT6E5xFbD0ZACZvV0JK7JS4px?=
 =?us-ascii?Q?8rGwGMMX4PXzjf4NDfUyxtXZxatdro0iCrK7bdp0D6+Bo094uptP+vfWUtJQ?=
 =?us-ascii?Q?efcDE5qV6zXE6p3+p6jXzXp4p0GO09APB0lZlDnUtUofTNviMVZsQrzbYK5C?=
 =?us-ascii?Q?5AvnCqNpQkcjMCowGC4ELFS1/EhDVzqXEzkXDM5mD5lOUQllP/Pfs8iyJu1+?=
 =?us-ascii?Q?sQAr8UGl3dHoPGiAeELlVjblxkOs54hBP62fdx1cTBhy25nIClIGtAjtgygA?=
 =?us-ascii?Q?V2cTgXPJMGW5H3cRFsvGUmeRyEC+yaB+WREZEQvJiin33pQ06koiXIOEJqnZ?=
 =?us-ascii?Q?hvmA4TxmhhDg67kTppk/KLu0gPP+Ax0eMuIHQRttkOrryri3/2bnOnYII5+4?=
 =?us-ascii?Q?OUBwyyeFzHpLKSA2Ig6+5Zp6AAcRy3i2i6Pz53LuQH0PGprnepiAK0j6RQYa?=
 =?us-ascii?Q?wOxCijko8NcyYN9uI/5k4XcBdNsH03HK5gJDlw8ZHjH3LDzlgKEd5rl4Qvy1?=
 =?us-ascii?Q?TOqIKdGLdXpjCvVM5q5AT3hUTY9m0bvxdQ5CRj1SaZYx+zKU/zHs+S4v5dv0?=
 =?us-ascii?Q?e2uBj45UbJl9KWRCPB4sLgZkddJRjjUntOzKabDCdC9rbBsm0OIpb139Jkz1?=
 =?us-ascii?Q?67U8X1xwjHqkqoDDS74e3nNTB7kwhXA4vCO6VcAD5iRpKCI9dfK/U5IGNsIX?=
 =?us-ascii?Q?1xTzPniPlbQ/llq/bJaZoU2uQXCGp67YcIORQQaZiq5OwJpaYN+3WgdezahL?=
 =?us-ascii?Q?GPyt+kj/WZ/dx6qJPpMKDUCeuzEIJwtY57rUf6BN+tPhAW6HpxgoiKkbayNf?=
 =?us-ascii?Q?koWFDOpkDFxYBxkFnp10pCfKf7lBCZMWXr8qpQQC/7EZYm7VC/T+n36KphKq?=
 =?us-ascii?Q?EUDYGgw7rICIUYrltRkcmpW6rTGJZ/fndoqhgshRcyQk2Toxxsl8BseVD6Rr?=
 =?us-ascii?Q?No1/sx4ctU4fDT/660EhHUHpinu4CJv7Cp0Coj+QO36PdqJKdRNzTw84KYgQ?=
 =?us-ascii?Q?MuToAwY6Wr0nLsXNomrHcQsS9u8yHn4vfuoMNmU+NW9AutXDRjcxyx61D/Ru?=
 =?us-ascii?Q?VLYxdLdtk00FPz0Jk0j1ctunPL4SkZMxu6QQX39hvxb5ZiPujkMEzh6/062o?=
 =?us-ascii?Q?HTeGsXRRjyLz7Z2Gqa1dD5m9nhGGsV+yGRBxlrx3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19431c15-b2dd-49dc-43c2-08dd2302785a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 03:32:47.5647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4WGW511m6gDBC+iFzJXIyXgidyQsclQP5dt9mdaKjProZpbphCWKck/azJQemaTs+jgafDyRuOUDr8qjE2MBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8905

Switch different pinctrl state in different system power status.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Change fot V3:
- According to Oleksij's comment, return values for
  pinctrl_setect_state.
Change for V2:
- Add Frank reviewed-by. No code change.
---
 drivers/i2c/busses/i2c-imx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 6fb496a92817..d0cfb8eac580 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1869,8 +1869,7 @@ static int i2c_imx_runtime_suspend(struct device *dev)
 	struct imx_i2c_struct *i2c_imx = dev_get_drvdata(dev);
 
 	clk_disable(i2c_imx->clk);
-
-	return 0;
+	return pinctrl_pm_select_sleep_state(dev);
 }
 
 static int i2c_imx_runtime_resume(struct device *dev)
@@ -1878,6 +1877,10 @@ static int i2c_imx_runtime_resume(struct device *dev)
 	struct imx_i2c_struct *i2c_imx = dev_get_drvdata(dev);
 	int ret;
 
+	ret = pinctrl_pm_select_default_state(dev);
+	if (ret)
+		return ret;
+
 	ret = clk_enable(i2c_imx->clk);
 	if (ret)
 		dev_err(dev, "can't enable I2C clock, ret=%d\n", ret);
-- 
2.34.1


