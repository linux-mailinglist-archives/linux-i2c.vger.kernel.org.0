Return-Path: <linux-i2c+bounces-5910-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2845C964012
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 11:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D8911C24783
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6B418E056;
	Thu, 29 Aug 2024 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mwwjreDf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010023.outbound.protection.outlook.com [52.101.69.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1344118E028;
	Thu, 29 Aug 2024 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923719; cv=fail; b=RYsD9YP1AjTRHvJv3p7lNVRUI/q1X/u1z4rMro0/DP0xYD3Jl8Rx5/oZya9U0OPnBbwULMyYFRyG5NL9MjSNKW8rPpnIeF7uXkJVOxJsL+2MqawBirFo0BVh4DokjyBQogHHKXtg3ennA5Z51aVSE1S9TiCpiLiQor8BiRn3pC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923719; c=relaxed/simple;
	bh=aNsQSCpjkcNGUe0WWtFOVtZ50BMvufaZEZkiOT512sk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HErubqcD7ymGLP21I+PGRlheJfYLz72eJdGhE+Vrx0w2pYusFu6h4ygSVQviEWBq2aZ5l6NZxEOSRoqXebOHVAox87bd0Zr7zaMzA/vugZGGXUh/pVX5JVBJL+rYtQHCfSgmX+MHsGH+uWHNzQUhok4dkJmoNVwjMcK3slvmrUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mwwjreDf; arc=fail smtp.client-ip=52.101.69.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkcrBlQjw6dJ0+wsXX1VRhCM8hLOMhwH7sz8Nl4jDb+oHMrR++fjK6/TnIgmhh/OiY74yaSgs4C/f2dBbRgUSlEr3jLbC5KekDuPSnR3+0YMVA8gtHNVqD9K3mP6kMHex658YNnjoqaj+1H1kMg+UioEu7oigVbs6TFzAfJh5nhYO70s+Dy5RwWp63nsNL2MUGyqO8fPVpsaUf8kAPgt9HGYbdaDZT8yfqxLpOQi4a5MJfc2mBhqi5tJMr5HSVU6/UNNf+ILB0fKn5DWx6D5HMOXxACkhx0JQuq3b2Z7FzlBzpDCdgYlnZq+Y7rqg6nBrnVd7tLjSWJcJa/CJpXPNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78uc0SE3UCzL+K6hrEj4vzvmh93AUBeNZeHF8DpY54I=;
 b=Dho89D/k1gM2hNe37UAU/98V+2N4D6evmsNmMj5iWC5fzzRMool8/zTqOz7KFLL/me3vWwuklnfeSOXMKhHRcrcfwKCGpNBgLVI0JAcYQN/XIyugNGY8RiRQ4RO3o57gB4bjCFlP/qrBj3t5HmHmBZCd+nfoFW+NUcscYLy12gj+/nyXIjP8juDkq50L/6D/+Axg9I04bj/Of3PIwsq7ET2PPi6En+DLVfkaZLAWNV9Rm0SUGZT9BsxsbDcHCKKkgmqNWNnlAsgg25E4wCQDKLE4YgET56IW2QFsD7/xbqS326WI9MDMDUE9oxDeuS4jZuxS5z21ZWQ/v2uVUJPq6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78uc0SE3UCzL+K6hrEj4vzvmh93AUBeNZeHF8DpY54I=;
 b=mwwjreDfltfEgb4Jn5Vd7pepyRoPW7be/yxABFzC4tcIDQhb1EtY2uQHGdX8hRQf9T6zEaz2O1wHHmn1451bAadgwXKUdZJpD8J9T29wBPJ0bWNCBid0Hc5fSO9NslqYp5WIb4qhhfYbFf8V7zGDVBV7dfYD9bEpgju0fNJLiu5dNbyYm8fzXVhE9iBBUXCGWDGCUZhOM9gLdWoPmLrR/1OmCwFcv/S8MAxdVFl6Fj/zgHdcYfnKu6nexkLGtU3FNQGQxdOu6R42/aCRxin8KvcyntNVEB8QnvieMUPIsBQXwQUbpYb34GgNBAN3CQs0r8ngNcgDCSdm/AnKRiSpiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by AM7PR04MB6902.eurprd04.prod.outlook.com (2603:10a6:20b:107::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 09:28:31 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb%4]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 09:28:31 +0000
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
Subject: [PATCH 2/5] i2c: imx-lpi2c: add IRQF_NO_SUSPEND IRQ flag
Date: Thu, 29 Aug 2024 17:37:19 +0800
Message-Id: <20240829093722.2714921-2-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829093722.2714921-1-carlos.song@nxp.com>
References: <20240829093722.2714921-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR10CA0023.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::15) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|AM7PR04MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ffa59d-4f2f-4112-509a-08dcc80cf20a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HQHM9MVDu4RKu7HZtLd4+LRhIk8Dv/nud9B6WAuLYzgfyyFU8Noa3ECdkbBP?=
 =?us-ascii?Q?bNuqOdhnFpP361kaYZ4U3eZ+CkHS7YGEINUso4c5O9Cr6OkUC3Mdny8oLaFE?=
 =?us-ascii?Q?1lYxeAd3MHheqUGTnDGy+FFOkvOXwztvO69LtugOGUPbhT2m/EG6xVLnN2oU?=
 =?us-ascii?Q?vOSZiBTGPbiX4GQOeEBxFJJnoRbS2gKC7TTk3DfDP8CJ6fGh9r8pLYNmPWLT?=
 =?us-ascii?Q?W4mlLpG08AE0ISdAKWgQo+HDKA9jF5uFA8fqYav6/2jGrWPx++hcPGF9q/oR?=
 =?us-ascii?Q?0451fWSt+030EBvtsA3lS5lE7rlnG3UQbX/fgaen7daMFEVT/NmyZ6D+6rLV?=
 =?us-ascii?Q?CJHJJAr08X2+kt8XMpi0RbWwaggtZCNJeXTT0dWQCvXq6XdY4Rmd4tYB1P0Q?=
 =?us-ascii?Q?oeu6zoJS7ScGNX8YF5CZAT/p313pjFpi3f2aNVWspYTJtsbQVGXR3XB/X7vE?=
 =?us-ascii?Q?4L9tqm+XXOECvD5JRawl5sgDHmo6RiiGwqBj5hLB5rCHpXRhnUbtdITA859M?=
 =?us-ascii?Q?GEJfYCWz03YMRcUSk7GKNqBoWBBorAoYjlV8UMaGEyT1cuMXL4C6kXJvZKAj?=
 =?us-ascii?Q?CnhZU8P3qnfmApveRhKFKgzH8y6qs9tXMBpC+pZjGA5wGx+TVJyC+o10puLw?=
 =?us-ascii?Q?JbIPvBk4wFuhXPfBBWxaBooeYLPO7TDvIaHMOTDifUovekXf1IuQyqt/dJuz?=
 =?us-ascii?Q?/bR0BvyO7JI7i6dwL+oG3aI3BAixQixE9CYbe50pTKKExYDPscZ2gxAsEahL?=
 =?us-ascii?Q?U4Y4Q8DiiHOYrhmSmdYGAkGTbrv9r+htPPsMYHf0fq7F1bBl8+ACPLX4sMsy?=
 =?us-ascii?Q?BF0qsRHo22lXsH+e6yJmGV12tNfSTreDC4U1ZlKZEpNvcgAZB19W94IuqfZJ?=
 =?us-ascii?Q?+Xghq0HPtyf9Rr3DCXjTDZboXmBXd6ETzxIBlz3rHd6vmat2jFqUSXeW9Rhk?=
 =?us-ascii?Q?XiLO7gh6Tzh2VLfS9v79pcRd3nK6tS70oLUbDHf2YmcH+IVeVIvWUZFMC2GS?=
 =?us-ascii?Q?u0AjGqzafD1073gNeNW8SPZDukzaP08Wr7dU6RGImx2UE1tA/DA5/M/hAvjI?=
 =?us-ascii?Q?3bFy1QqKwRRUKlValyj5kUFlCjaZvdAAUU42sb3nDy62RbpODdmSoMZc7/1K?=
 =?us-ascii?Q?xavkSiuK38qdTcHfkLVpgvtrTlpdgEOiOrIv+MaHDT2tP2HLTde6HI307Jhv?=
 =?us-ascii?Q?NGLNMEEnS+YflFrHQ17+Er+cDAySBWGvYS5juqC59VPOhquW3mx2B2MhvM2Y?=
 =?us-ascii?Q?Lmo3N14ZqWQ2of3cE/ERZg1iupj5SbEqBTZbqf7YEXaJUGzeoZfvip8AL1cQ?=
 =?us-ascii?Q?yyWaWCPjPFVCal4bspFvmxxfg3pxjt/lgXIQ518Rx/Y3E0lHgSL2JpHDld8X?=
 =?us-ascii?Q?9uort5xFX53adrS9UrIRxAXLN/a2eCnbiMFvB0z4HYgeHd85mA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8sMXO81QC1wNmBc98Fsf6NoPe0MspXRmQDFc7ZNCfv/CJudOHYwnZP5IAlr4?=
 =?us-ascii?Q?M8KD15IoNBBTQczFgmmD8HDD/lEMfpNtrg8R2Gr9yM4NlOnXtKbrZC9YPj5/?=
 =?us-ascii?Q?F7XYirAfYdoqmvZm9IAMqV7gXldSCUtqzjNUN6cIu83QuRCpXKOQSSQ2fuM8?=
 =?us-ascii?Q?urh9T8iKWuGRMcqPNRwnD63q2zE5nCOO6kXTDRLezJFHkxpcy7YTSI6MM1FW?=
 =?us-ascii?Q?l8Gqp0buEDUDuovbMRVCOHfDmr7UBxDU0T50eu72aH74CWYQM48SHamhSD5H?=
 =?us-ascii?Q?PbQuORCFtbmONqlLW9W1BFM4JEalvB0p9sagU7+27qwy55uh+SzGJ+Fw3C6x?=
 =?us-ascii?Q?KBu88wcFkC9l0fobbFj+tVl7Kl5SrOa36JBjZ/78lghMWE3QiLxJNFS61lMd?=
 =?us-ascii?Q?Bn8OgbucxI7ma7UJsBUov6BPEEzjIyOVb7d6v4eALaBxGeXv3wcO2MbRENHO?=
 =?us-ascii?Q?NBGb1BeHQKExiVuxjj6VP5wplBFkNPJ+t9jPo1U1eIeCSlJlMe2koSZM1XO0?=
 =?us-ascii?Q?nJrpqt3SkQKShgPTi6ojt5xJ2LY4rgcM5Ug2mHL38xSz9Z8GDjp9xZjbIokK?=
 =?us-ascii?Q?A3qamuaDsIOFZssXwFOCUBbUb6YmZ7fIKYxRpNOsvjCCllF/1t8il6jPA+0M?=
 =?us-ascii?Q?lxt3UGkB/2NIO86/PWQbmQQN3HAudSyrLWV/Zh+44R4oKhqhuSn9HEkFdeyB?=
 =?us-ascii?Q?8U1J6+3AEg0BGTbr1FvFcW8teU832cVYzTZkaf27bqx79S0DA5UoaoV9bof+?=
 =?us-ascii?Q?bMiqgRHMCXAgUdkw9hrdlF83HDHAxM9utJMy4pnOYAu19OgQpKCGytRtg7bp?=
 =?us-ascii?Q?GL3hM91HP1SlJXGFA+XJkuHymJ+280t+SVXA7ij10jT50Ja0ll2OT3Zs4EP4?=
 =?us-ascii?Q?WgrSItJF8bzUJLohAJHaOkQjwhR39fWBjvm6/2JAxakXL3BKvDtx/Kgy0a34?=
 =?us-ascii?Q?bWD09YiVKq7a3obZVnvujFCmqEAlNary8FHty7VVgtNzc0fvFGhQcw4rQEBM?=
 =?us-ascii?Q?B2eP6qsti3SQNJhrNTz4+EYgaZTNX/x8GdEa239McZfGf/JtGgLMBWOgOLPt?=
 =?us-ascii?Q?PDSm6b9zvWONlGeK5Qy9rMLf04aGXn0DSscg9MXNJXXXb2VC/Jd/TKgPEhS/?=
 =?us-ascii?Q?92ikX0hYaQNit9qhgNpDtdkJ/zQvECvT0ANROja/BTcVelQif7hBQ9BYzLyd?=
 =?us-ascii?Q?RcXU442lZEFEiO4txDU+cpL5GpGbaZKDK1WuEKlHGJHWVeZsrN7GRL4pItE+?=
 =?us-ascii?Q?o6qjWiYzbN6PddX2xfOX0eMP+6gn+piTzVuIv0DzRqK0UKPTtJ5b2FtnbA1g?=
 =?us-ascii?Q?RO1Ob8DrwMisoVdlsGUGcaLgM9I1n3Dyygwv9tfdTDpQo4Wf+IYUny4asvdF?=
 =?us-ascii?Q?rtV/rbiIF4mg/8ExAabJlELyNt/jk3X48e0adVJ9z7ALoyzgjUfvB2Z1bGxe?=
 =?us-ascii?Q?7gE5jAYOxtrPgZfjRoH9nhRohlDin9ccuWBnZcoRoX7bPUuIpH7Tf7Lo/wcj?=
 =?us-ascii?Q?1iyPHAP57gmTMEClYDQM6CqtzT4bh7KS89Oj4Gn9+SUX+DPAeliXDj1+JOqL?=
 =?us-ascii?Q?3iCyBmY14HJ814VeywrUgCT8OIiq2In+WXYr+eOO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ffa59d-4f2f-4112-509a-08dcc80cf20a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 09:28:31.2525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2nb6ZbxvFNGGEPSujK2IFhq+mK53mXCQtgbU7ZzcepBQ+GegVh95VCI8YsmPl7WVPaPs5yC+1XwrskPszSksw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6902

From: Carlos Song <carlos.song@nxp.com>

Set IRQF_NO_SUSPEND flag when request_irq(). Some devices such
as extend GPIO will need i2c transfer during the entire system
suspend and resume period so keep it enabled.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index c8f3dadfb36e..23f83f10d5f6 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -1309,7 +1309,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret)
 		lpi2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
 
-	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, 0,
+	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, IRQF_NO_SUSPEND,
 			       pdev->name, lpi2c_imx);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "can't claim irq %d\n", irq);
-- 
2.34.1


