Return-Path: <linux-i2c+bounces-8738-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D799FD0F1
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 08:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1290A3A0599
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 07:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5565D13D62B;
	Fri, 27 Dec 2024 07:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hKVyS0QM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2081.outbound.protection.outlook.com [40.107.247.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1404D599;
	Fri, 27 Dec 2024 07:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735283886; cv=fail; b=u25aV4RgnyDwVi7Qb+e+1Y0nTCq+xxrlmzLmBOqQmV4hIUBWO1/CHMWvifNalzJD7Y8kSjQMkls/1z8cASuDB10+/QMI5XeT8Jxa9TTgFBT2zc9d7UVAcMF1ekbNY8DmQ83hOcc910HTk7nKusbiuCETxpMr68h6YZy1ieCH8F4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735283886; c=relaxed/simple;
	bh=S9nyckda8PcWT42YvipDqfP678Hz+mLD2GOBieTRcAU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jDijk6P1Myu9qacYvuCB5frt0pQV/LfTQUBPFJmefiZfZZ+NTLc+NcB3pYixFxdgh2OEmy+Xd5QZ3a5rqxjQEQyrxVsCwrUtuXyuvblskj4NxgLcyZcRoL2+B53vgXTVXD78wYZQTVHvLSMFpcxSL/kqKtVujGGhHymb/V64EGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hKVyS0QM; arc=fail smtp.client-ip=40.107.247.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkZS9poOaVdtynlXAly4uTVxwBdrHNt59qBKMclncJqgsbWpa2o00fESKPpJHRJ5vqXG++2CwV+LgFs2BBwuk/Q0U/KGPBP4RbifZ1kZKpdPv6I2+KGMqsshPcy9bGIbWuDM0lJDuwTbvC9AgWkLohf4+z0kjsSSWz/vP7aXwsx+ZILLwHwe4iCVZk0DJKi1oU5DHLbt5cgzD81h5EE854atMIzlKILqS6COF6oyKjdl8+i75llsYOPiRKuVyVkIb8mqs4ie1WnABUhqNIfogaN4xIHETha9D1KsnYEjBx665IMLIfZvqJvLdos4wRyG0fbyEJ0Gw9H7sLBFHLExkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjEp5EEqNgOsyn0PDB0taUP83YFhvCmUR8HyIu2QJRc=;
 b=lldYXKmYXvLutIO7pXpTUr56tllgicX8RG8gHz72lQaVdQWxUqLPnjAv4bJFf82IoDzpbebu5sE2ayNWahBbZjB7ZgxApGD0SrzMH5a8R1PGhEueZ2ZZqgC0m1A88ObKCPYL5Z/Y5+nzrAFEBaXxDg5n9FUhLVP5DhK1JWrX+E27UpBJsbxGDb7LQ0EEAfJmwMgiJoh1BEi54WhlIdvT10xCtF5zyW3Z0b7mMAP9fOYs6J46mP1tWUz0oLa86YLdBMTl3rqS3i21ygjfub3TVvOJOfSbeHMYLB2FLbCdm/NcfbuEAhYoMCOsmQw8/InNo4hdkhJurqSUNgr4qXg/Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjEp5EEqNgOsyn0PDB0taUP83YFhvCmUR8HyIu2QJRc=;
 b=hKVyS0QMq0NwUzO8+U5ZSVpmu3mBwK4zAAYA8/8tfhPBDzdObSZZhUFZtvwH6vi3UgC6sRWpUPtxJF8WbG4UbZ4XrNK8s4LGn3sICkNVIMiXZQvlk7L999y5UKps7GSuzfJQG6NIjTTwoIbZQBsVddFAzssduOOU1buMTcyP7yycw8f6qB1BaHNY1BmFty7ZRCieQuA/+W2BCSIZCWuLP96Q0DUAElmraQj7jjmqe0xi2x2wkWIGEIfyO8ypLwTKMWUYAfmf3wjUJg9qN8dOF8KPXYQ2RfgD89LtO+HQLCXBu6f403NI+klbnlbQttFMyv99uzYk4xyWQaw3+A0ebw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by DU2PR04MB9113.eurprd04.prod.outlook.com (2603:10a6:10:2f4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Fri, 27 Dec
 2024 07:17:56 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8293.000; Fri, 27 Dec 2024
 07:17:56 +0000
From: Carlos Song <carlos.song@nxp.com>
To: andi.shyti@kernel.org,
	aisheng.dong@nxp.com,
	frank.li@nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Carlos Song <carlos.song@nxp.com>
Subject: [PATCH v6] i2c: imx-lpi2c: add target mode support
Date: Fri, 27 Dec 2024 15:28:57 +0800
Message-Id: <20241227072857.1146099-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To AM0PR0402MB3937.eurprd04.prod.outlook.com
 (2603:10a6:208:5::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|DU2PR04MB9113:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c9e6a92-ccd8-4bcc-b928-08dd264695a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lFLznWsVCcUy/ZWFjn9JDte4JUdnLXnoq9Vrj0/v31hFLEGp/FrjwghVHuVF?=
 =?us-ascii?Q?AjtWNPYVLB/fjsdMYKCuozFHcR4a7RFCqjeFuMiS93c/ovAkFN8672bBJAI0?=
 =?us-ascii?Q?SFRbBGlvsyzLZ8Q9HrwF9ODim39Zq1fMUTSE+RFl/w8wzr4EekKIGooVzeLK?=
 =?us-ascii?Q?AEXEnhJ+hZwEtNQyPbEXGMvDeIxbmuiqWmYtylWolhpm40L8UgKdMb9Xg6h5?=
 =?us-ascii?Q?WEjEV5pk8iG1/OyOd3WeB8uTlDcrpkXi6vNHwQfWJ+D7GodF9DLraZjtqB0H?=
 =?us-ascii?Q?0x1jScGGn4XkY+6mTefBhmxFNOGjbQJwYxUp0TufBZYlUKLaTlTGzmcibrUY?=
 =?us-ascii?Q?eP3z3rtbVxJizUbDieeyag3JYP8AtBI5leOBkr8axfohj6EdBO+rJsM13C2G?=
 =?us-ascii?Q?zWmER7IZqNt/QOhI1qKFakJWXudWESyw6gH+v06Ccg3UQSTOlRLR9gRZ1wDz?=
 =?us-ascii?Q?SvVOeIm9dAs/T8liT+/ohbsd+TI+LhfSUadkm+eXFHaQwfdUMkE6Hh4dCjhJ?=
 =?us-ascii?Q?VV9JRFQeAH85T/MKvnbZ+D24XlgKnq9iHONCTJLYBYBszdPvLRhflrg+Vnww?=
 =?us-ascii?Q?jBBXxFbvFC/cX0Pyhw+Lrz/SfH+PSzn2ueDdoClN+efUKsQMCTXTMf7P1Z4k?=
 =?us-ascii?Q?x8CiIaJDKgnUY64wVPwdTB1KZz82CAP3UaD9Vl6siC8FdqU0HmdkEOGebaCM?=
 =?us-ascii?Q?quHgBBsuKTlWvT6vA1PcQjqCUx0Xd9cFxrRJ6wYfvjahVWOQPfroBucmNSm0?=
 =?us-ascii?Q?dYRh2Ug0gaEvlY+uMKciVpilcuMiHz9db535Zj/LJtu7WLLcqQRItYInumwy?=
 =?us-ascii?Q?7Ul2WcFxGIlU94aPhcEqwVajn17JfLBwP43cGvGR0fedcPcGPuez4GhctGw+?=
 =?us-ascii?Q?4HwTjk+rHqczxYLUt8MByQE0rFtJ4Dn9px6FIB/jKaoya87CGKwY5Iga5up4?=
 =?us-ascii?Q?JaIH039v1f2/0TlgLl6IHuc+qQHStxMx5LP44TE+5dYsYCPGRKcOZmCbOiEw?=
 =?us-ascii?Q?AN8LaYE3Ba8cWnZlV1y8vpmYdO711jS/Vj1BMl0FM4Rm8MD5sl2x4uv5Uml8?=
 =?us-ascii?Q?GFbmXoElTNvgTaDPQWWn0ZbV47kNy+ftVdBLqrakGd03aMCdc33EgsFKCCle?=
 =?us-ascii?Q?IWr96dvmOj4HbG0bcNJiMNiVADX1J+BqPxH5YAIyqV5uvuvT6T1yq2Dnc5dg?=
 =?us-ascii?Q?RXmo02oyRM1Gq5xgO4JYku/P+ONaGTUCGi82qNbDDLlgR9UkEqAPuImfPYPR?=
 =?us-ascii?Q?ts7W2nyHbLGS5FayeTRRR3AGDFEDJgNgZ1VNgV+VVfrsaCUOODljzTYlH+mS?=
 =?us-ascii?Q?uUU57uGlD2raeP8TQ3P0PSQxgGPuZg1rvAUtwO34FMBl4j3/G/BVUjPPgd/B?=
 =?us-ascii?Q?qhDrifE/4jcviUBzrZzqfFkAszqcjlkUomtZYA0vCxMkB0F851/lz3ruzuxn?=
 =?us-ascii?Q?Ko0gPCTcQGY1wuVn0rvuKcP8Hobv2E5x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZpkFpO7c6HSRIMpTP6JxVsYjO/HnQ2oo7fwXDUCJBdzbLn1p1JDjQN3Rn9GB?=
 =?us-ascii?Q?7QN/UKGFKvhUVE0uqnbdnvyl+3Xgee6OZFlvohpP0LH6vIArazIdnhF3a8Mh?=
 =?us-ascii?Q?ejmFJhPYQgH8e5EaxFZ4GdTPgsLCS38J4gUEBv63yMwrWjCwQJguJ4q3mr/0?=
 =?us-ascii?Q?WAJKE+pipaCIqqIuWWDZqSYkeZFlBjvnm+vnokiGh+NCf9bn1wMGIPwkCjS7?=
 =?us-ascii?Q?fKgF9Cl/8AYQxMJlv67C54pYLLbhUBsBRZVV1LmWnlnTQAbtFVL27WfwkZIU?=
 =?us-ascii?Q?EwJFRkeAh8UDO2xMoo9WpoM1WrtBrFHaCKYVhEVCjf8EWwfUsmbT3jkrix0P?=
 =?us-ascii?Q?BwB3a2igILOBIO2Yz5gJIntlUsA3R7VowUiI86es8VQa+CwInDEJeDtsT1WW?=
 =?us-ascii?Q?3Of76RB9SSMJe+04dU8pRkm17VQaI968IC/SMh9OtNJcc8xOtllSTIpBZiWn?=
 =?us-ascii?Q?UXXPUYuk11pCyNWQ5mb+v3ROoHULbGuPH+G9LIgfF3dQXMeEafxdnv/5wDjv?=
 =?us-ascii?Q?pStDR1iOwJQEjPKGeGV6BA1C/K62E9SzhyQELH8hnSzvLWe292RLxcZ7KOmD?=
 =?us-ascii?Q?5kzmVE4LjSBwRzJmsC2UbrW+hbtHGKZTY04AIr7CqarmnpRVwHIqiGJ+bUNX?=
 =?us-ascii?Q?ajDjBHxJqXShfAmWVeVY+/oliN2h6iS7hAq6voh/HPQ+jvBBFtM+t3NYr3Ae?=
 =?us-ascii?Q?OEiOLTaea/4xT5nJvLDiBmjuCHK/gn/5QwVJS5qiL0zp/TwTrXfV1K20+vZm?=
 =?us-ascii?Q?wYuly4xumDsXViMCb3NHozyRKvz98laXXc2pbkNUXzOKHbpR2sEJbeGfLJeX?=
 =?us-ascii?Q?ApUgZr3jhguqxNpu1cKRFhBgwP5MDdPzXPaLjEAbvNnuxGCUtHMEv4yVlZPo?=
 =?us-ascii?Q?CTbNHolg/3odvonS0RGTfj61hNd3Ss9AjCIhL1dYjxyXmbmQn1wZ17otIbqN?=
 =?us-ascii?Q?FU+WuydBZyxgjBrPv5sfcYe1RcAeePC0buBtXUhIUfO/onI0hM08UYKs0l7b?=
 =?us-ascii?Q?1QcXVckQQ3uWf5CAci0XkQ7WjY40hOIzno23ZHdQyOx12yYHoWF31mrOaxwe?=
 =?us-ascii?Q?67ZRiE0TrmNp+DcNsCcqa5FnK36Zo1z2AwYurhGTKpPhxNlb1V7Y8L4Mt+Yn?=
 =?us-ascii?Q?xFW8EBkIoh6D0GOu9qzmmch1zE5mDeZj7NJO7cHJe4klqKVL7S0ZW6bLrTuX?=
 =?us-ascii?Q?oOKhHx2olcjAIqQUZymEq8Qdi5dT88s41RmYJZO75BxTOepvdHiUXQ7PVs72?=
 =?us-ascii?Q?1f4WooIOXZSnBoCGWDesFw6X0Njxf9FcPoZo7mJvc3k2oZ2UHPGYdFfRKis9?=
 =?us-ascii?Q?a3MyUrVVs0LjabK+7i/DTt6EGiCz9FCeXM9EObjjKbZwWcTB4pRD6W5vFjYw?=
 =?us-ascii?Q?41oKLqoa7u17LNryQaytUu/bXa895daY/XmMJ0R6i998RKZezRz087SGjXxu?=
 =?us-ascii?Q?+7WkV8vSzbucHzrgaL8cEtCYMwDjvgYPg/lb8uoKN3zH7BSB+jb+HLIjOeRC?=
 =?us-ascii?Q?rQYYPV1FUSa47dyijrEjr0eKy9axTYykOVEyts6ekf3oTXIvV/CHbIHTvxV1?=
 =?us-ascii?Q?9VvMnNYQsIvXrwcHkAzyKBi2b7KGQPq+Lz60m4V+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9e6a92-ccd8-4bcc-b928-08dd264695a7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2024 07:17:56.0222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BaheC0ddqkz0qeTJDS0JeiRX7aw87Vo6kCAzqiEFla/yNx1Jk2KKbAcdklhw/nFr8KTwMj/ShkEiaSvrrbVjEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9113

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
Change for V6:
- Just notice reg_slave and unreg_slave is deprecated, so change
  to reg_target and unreg_target, no function change.
- Simply return pm_runtime_force_suspend at lpi2c_suspend_noirq
  to reduce some redundant code.
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
 drivers/i2c/busses/i2c-imx-lpi2c.c | 251 ++++++++++++++++++++++++++++-
 1 file changed, 247 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 9778dc8f6d36..02361274fcaa 100644
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
+	.reg_target	= lpi2c_imx_register_target,
+	.unreg_target	= lpi2c_imx_unregister_target,
 };
 
 static const struct of_device_id lpi2c_imx_of_match[] = {
@@ -1204,9 +1422,34 @@ static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int lpi2c_suspend_noirq(struct device *dev)
+{
+	return pm_runtime_force_suspend(dev);
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


