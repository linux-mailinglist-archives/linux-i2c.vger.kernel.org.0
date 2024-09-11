Return-Path: <linux-i2c+bounces-6568-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E7E975630
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 16:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4704E2833E6
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 14:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3553D1AAE1C;
	Wed, 11 Sep 2024 14:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WgdE71rm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2661AB52D;
	Wed, 11 Sep 2024 14:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726066603; cv=fail; b=e5w9iPDEiW2nq4iGHHbzUVozvHmFPhmdU7a6rdlUNt28xxlp0//L4vomtAaNUPwTT1GaGlJU5YEvuxbMDw+ffciztSv6WJXiWQVOjbY55ZVq9nCO8LbVHH+8gk6VAw2wt/iiWGMYeZeMM22faWoUjLPwFjrwJggYo9EJXPn5Hjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726066603; c=relaxed/simple;
	bh=0B+gQ1Wt8U9F3T1qa0kmhhYFRAjDNshLcox5dHRsnw4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=n+bMDD4m3rSfyi26eirKeLc7lopg3R1oK9OK6caPQWPb0AKh5lAIeTKtAjk5B+YdZvn0MV5ZEV6FmCBrf9B8mr3dmFs/xZVx2ZIa9Fl2uwlvpa0UJJPKSoaUyzKl1LtOKhGIT8ZPmuQzJAmo6xJUvX4emi3qMyIboBDiSCFGcxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WgdE71rm; arc=fail smtp.client-ip=52.101.69.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNXS3dcQ7D7G5WA969qFaBss1GOzOCvq6JFcktGGNSrAQRsoLgWxdXyyLSiHwKIPKTX/AYEfQeAVPyCFi3VZFMD701JBYTwTI+7E7/IoLLqUj2ruH4WvHSRk2ZV2WJtZE7VEojlE4+jUuRxiGNSCi3k5t/MLXOYk5TfOzawnL3G5CEM72yQSpfzmYSBE/ARo6ZpgYrzniVgVBKIPc2UnNPaFf06GmgHW1GQ81ZFE7UJJHlh9n2urozDWSDXBIKQjqHVBD5Y6HpEmP/l+2rywQg43E2glLW/2GOPO1CQLTptXbKHR2UipjpDNJte6ygCPcF9jORhHqxXKRu7Od5bOXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKlIXy5cda8nttwEHoqNfWUY3wPS8P4zTBgTD2YFM5E=;
 b=UkRe6CtNQXRX/bgT3yLuaNBFn3VSRzICKJcTARIm7+eCgqUCccPGDU48Z/Eg3K6iz/8hOh9qmA5O0UDP35umx/fIhIKrW5Pz7abAIud8+xq9pNJ6FUXWovXRNXutMSCcTxCt+16gJkW6EmAL14ohEN0vE/ERdcr0dCR21MFK5cK7lSwfBrWD849OI2+r6mrCoW2V4ucUyvOtIGzwk5gikiTtwahHNzs+q76H2U8SKnhBw5qPQ1STvusHIAHTDUtYvoJNP6nrrBZjex2shZ6hBtYrHp/VBHbWJnXYrjNbdd/GwpviZb0BqTLa04IomiKD1febNAaAegqi3GK3stGGeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKlIXy5cda8nttwEHoqNfWUY3wPS8P4zTBgTD2YFM5E=;
 b=WgdE71rmmeBmk4k/g4bj4GKOBBibB5+jpy53q7AZRA5p2B5CRfvvda5JPVJjEnd6cNwwd4T7/0i2TsghV39HA9g/SuJ1jH5LXdrurbV9bQvdkWcrv4YfTE87J7MtjvGnFIf7uBHyBgdw6AX1V6uAtkpmnH3/MI7fG/p1br0P2mqXwRY7acm9cV1D4ZerYrObBI828l6drq/J4EnlQNYEuAh9VkgxVqCc+5TAwY87CmYSG4iFWeQYheVEo/X4GxZ1yj0yrGywjd4By5FcN/s8DEvuv1ZN7qE+6e8QnS7m73WnAoPLF81+iqsDw93I/kyG5NOPXhLG1N5g3sMrVl2poQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by AM7PR04MB6838.eurprd04.prod.outlook.com (2603:10a6:20b:10a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 14:56:37 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb%6]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 14:56:36 +0000
From: carlos.song@nxp.com
To: andi.shyti@kernel.org,
	aisheng.dong@nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3] i2c: imx-lpi2c: add target mode support
Date: Wed, 11 Sep 2024 23:05:37 +0800
Message-Id: <20240911150537.192570-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0022.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::20) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|AM7PR04MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b5026e-4bd5-4b2a-a63c-08dcd271ef0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xDc4dFlUNGuoC0RMraPpsc+/mBoUnaMk/32D5uIA7tVLiJMNniqxrE1JLj7b?=
 =?us-ascii?Q?AhGA8vJZAZEccsv4ffUqEfTWjGKRAOxxOI4+04pKhSM9jhR1d2Fu1hANphEP?=
 =?us-ascii?Q?oZziJilwPXBCGiUe7pkycdY25Vn38ilHbhWQ7UigYqG/7pP2RvkTf3RpQRZO?=
 =?us-ascii?Q?0oIvAqirDrPwiOihleMeGqCn0buBZcoDYCt4zC4WgCaylJo0dMHap98n46lw?=
 =?us-ascii?Q?r5ZzpKto0AHnffc1owd4AUpMtGkSZRG16Ntc3hf+XUIEilB0nKa6FgouJA1n?=
 =?us-ascii?Q?5u/z2AakcBBfE8XlwXhWaUOR8b+tPAAy6rf2PL3zZP82h1mkAkUphICBrL/N?=
 =?us-ascii?Q?BG4ie/YRxk6l4PQE2IIYTBmsZd/ARNj8vZKjGcTuoFgF6dbF9KY+/Fw0cKAo?=
 =?us-ascii?Q?WEklR35B8N85vmdLHk+vbeLrvqoWRj1D01vTMKKhbMYZtKKNa0iwbG+I1nmc?=
 =?us-ascii?Q?pBlaWuDvMWhHR+ut5tCQkjyIUwQq5OJFCdJeLpfl0+Ty+XX90gLgqbHU2UIb?=
 =?us-ascii?Q?iqwQ8Q27OEwwH/im5JcAca1XIhVWINzaAEmgs00CUECCPU6XlkjpV3ym10PZ?=
 =?us-ascii?Q?OX3cpcqmYCZFEfh0sDVLWYk3KcXjHbif0Qs7GXlffM209mB+pItQ9exya3ik?=
 =?us-ascii?Q?B+QdvJTD3jL/HaIRfEYgjfHpGoKOE2OClhZXGDhcRudqm4wIpZlDdVVcu3PV?=
 =?us-ascii?Q?OXorNblAtluDYDgGJ8HL9icvghi2mhr9jtqF3rfjJyhi+ct3K4GPy4qQkMmY?=
 =?us-ascii?Q?WKvyIpeoHKUSg3IGYCYLWBTqpK5YXoYr8LRDrlRATy76khURp8CuJupWJ/RT?=
 =?us-ascii?Q?reCsVAfMjzsXjdETeJgjA9bvA0Akt1XiT/uL7OuKP9AtibaqvlwCcwd6P1H+?=
 =?us-ascii?Q?JQVFcWLZ2C4S1SB56uyRZRsLFtkpCn5T13aebwhvUBZQZ4QLKrY+TJvGkqxB?=
 =?us-ascii?Q?vp324mApq6/5KbcHXPVN9l1/Ixv1mnwIi5duCuSgy+bOiHn490L43JWP40Ak?=
 =?us-ascii?Q?GA9UZKwCY8pUC0GfKEwvnmJ+LfufjtATRkPSCBSx7aKkvCC/lurauxcwi2zP?=
 =?us-ascii?Q?gXQAOIa7n1T/kIUA6yxKbYU56RyDpNWJWADpNAA197xILNmmYiOuNPI9D7iw?=
 =?us-ascii?Q?ggLiZzwjJU6mQrrrxJPOuVvXKEic9HVrpuPVPX/O3zN5rLKxS2qXAVzc/Vzl?=
 =?us-ascii?Q?gn8fC+KXanG2WCn9o571gc+0XQ0on3VpYuURUflJ2ax57U8zX0M0IdAxCj7a?=
 =?us-ascii?Q?9tp1Beh2e5cjy0ciu4lr3Dty3Ltykd1auV8JtTpU6gJR6WGLxEHw7GMgRwQP?=
 =?us-ascii?Q?JD++70b+xw7wKdHMF0KGppGIHo4cJj/XbaZcZAbI0tyWc1F6m5t3hWQk8gnU?=
 =?us-ascii?Q?WF/N0FYTVQeSZOmwLn4YGep/wMUZeqL4C3g3iX/QGo2h4p85zQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bk2Z1e7Z0otmzx6mHELSEwVEhpB7yRvzxt/dt212vZHfG78kMKHZg6p+Pzty?=
 =?us-ascii?Q?uYsAlhLMNjr+3aC/F2jBh4qjQKQse/1gvMuP+UUzuqOEypn44yf69RP0Iaht?=
 =?us-ascii?Q?Fx5rjZpaMVGi8yjxH0nKpHM04mU80ZtJaCgbHyyiStz1E8tTcReVuMshQm/0?=
 =?us-ascii?Q?CZqPyyvfYwIQk2jDos3igEYDH+AjSU70+moedq1Lu761HsdsYPm+6Rfv2ifz?=
 =?us-ascii?Q?NH+ZiRLXWUV+olmVHnAXZznOG4UwnNxHqb+/RwzvR5QZyUyf89es9QGC/bgi?=
 =?us-ascii?Q?0HQQ6EX+yg9p8DKly4NWAYdPH/3B2tPtDxMNgcPe7N80iTO6uOqON4wP4qUR?=
 =?us-ascii?Q?spP3x3sHrr6pPdoRh4TecF0HGj8jwr5ZmM444vMXKKxCEyrnEAbYEZy9D9B7?=
 =?us-ascii?Q?ivM26oEw3PGyq/GlzMb1nVb15t8vqhvtPaIV2YT7CWCTH0S5MxIQjpMBdxyn?=
 =?us-ascii?Q?iGxIMQYQRxXQIRNWmLCWUp2j8sk5hml0qoK1+ea+5Agc4Dw3+CoGUVBhZ2R5?=
 =?us-ascii?Q?DMzhDfCCiAu7wkV9s/BKkKR/+IEuxK3vztyPQvzXw1/ll2LlvtJECzd7kBq4?=
 =?us-ascii?Q?GTv+VDBTzVDXbztr4Iu8z0IPCmWTQJFXyNghIuyZUFxcEPsrihG2//lRjeBx?=
 =?us-ascii?Q?SzXqVgGeuWoVg73LXH6Rk7DElndA9eqDaIs1l/tUi1JsIvxLZUI35Wzfkiyl?=
 =?us-ascii?Q?TGJzSQog+kogqojvBQd3w9LVn62v8IjAsPhKel6hOgMtfXhVeOLwqYy4tPWa?=
 =?us-ascii?Q?JqGmGToXpkyLLk4RQtfk+OoVfBulBbcS0aPkb+L20HOQQTSS8k402XLIfKPd?=
 =?us-ascii?Q?UsdXGQtsVOYu11tfWAJWikOo6AxYh9wok5huMdx9F/qKJNWXna+X25TP4ke9?=
 =?us-ascii?Q?IaBWemW+kXCuVtYaZeoi32XN7tn8kejguRguGhSgHMIEX0Ch0KqSCDe0bPMl?=
 =?us-ascii?Q?mexZhNYEmWZhoJDdknw148DM24ry/mQ4Lhr5K+x9BdvDWXX+IvapIQk4IFsm?=
 =?us-ascii?Q?NlP4ZOBC7TTbWH2c4TJSQXbpa0s2wsjImbTA9swWkTvEpbSZjOWzP5y8Y7WB?=
 =?us-ascii?Q?hza14nw+GWmq45HCQRK5bigvBqUp47R/cqoDNxQuerIJ9N7UZsZbvUGfeolW?=
 =?us-ascii?Q?0gFRXfUaN0Fi8/2IvqrZUUqeFzjC4CQSbTeh5UPEnxHHpI+iR+crYlfsAujp?=
 =?us-ascii?Q?2i/F4TuwDVXLFVdQqxS1Qr7gPmGUAzjqVhHUDj9KxzjYC6fU98CZU/i8bmqi?=
 =?us-ascii?Q?iXsTmSSb1MpLOm1AEuUwTIroI+UWPnc2Jssz5U36XY3k4cG0Tt8svkzb3iLB?=
 =?us-ascii?Q?hGLjXU0LRmA54oina31yL2DgdQzdbOTutndE2JY4yKJ7N612JwZ+Vvnb+7kG?=
 =?us-ascii?Q?L5X+r0AIKLe2qOpop2bii9skubUq/K369zP8b88S66C6qjg31Eaglyd7flL6?=
 =?us-ascii?Q?QF8yTjZF/BGLMc3J9MeFkfwGlIfcUAZ+Z5LlDtBspieH4TwaHa4CdkQKoAqE?=
 =?us-ascii?Q?K1qX6ytu3iFPpSM4cGmOYQXq8I26sMvds71DNml8uMNOovunkj/tYzfZ9Qnd?=
 =?us-ascii?Q?LDYEw6B8oMugAWIz3y5KBmygCqTBjuTKtcATInmc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b5026e-4bd5-4b2a-a63c-08dcd271ef0f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 14:56:36.7881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IygUhVq/gqRh14rVFf4O34yLgeRlmdy3YLL21W12Nn3e8Tuwb9QpdGKhkuL8+gf7yIpDv1QlExnWVgXnMqSenA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6838

From: Carlos Song <carlos.song@nxp.com>

LPI2C support master controller and target controller enabled
simultaneously. Both controllers share same SDA/SCL lines and
interrupt source but has separate control and status registers.
Even if target mode is enabled, LPI2C can still work normally
as master controller at the same time.

This patch supports basic target data read/write operations in
7-bit target address. LPI2C target mode can be enabled by using
I2C slave backend. I2C slave backend behave like a standard I2C
client. For simple use and test, Linux I2C slave EEPROM backend
can be used.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
Change for V3:
- According to Andi's suggestion, enrich this patch commit log.
  No code change.
Change for V2:
- remove unused variable 'lpi2c_imx' in lpi2c_suspend_noirq.
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 252 ++++++++++++++++++++++++++++-
 1 file changed, 248 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index f2bbd9898551..2d68faf6847e 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -43,6 +43,20 @@
 #define LPI2C_MTDR	0x60	/* i2c master TX data register */
 #define LPI2C_MRDR	0x70	/* i2c master RX data register */
 
+#define LPI2C_SCR	0x110	/* i2c target contrl register */
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
+#define SCFGR1_RXSTALL	BIT(1)
+#define SCFGR1_TXDSTALL	BIT(2)
+#define SCFGR2_FILTSDA_SHIFT	24
+#define SCFGR2_FILTSCL_SHIFT	16
+#define SCFGR2_CLKHOLD(x)	(x)
+#define SCFGR2_FILTSDA(x)	((x) << SCFGR2_FILTSDA_SHIFT)
+#define SCFGR2_FILTSCL(x)	((x) << SCFGR2_FILTSCL_SHIFT)
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
+#define SASR_READ_REQ	0x1
+#define SLAVE_INT_FLAG	(SIER_TDIE | SIER_RDIE | SIER_AVIE | \
+						SIER_SDIE | SIER_BEIE)
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
@@ -958,9 +1009,57 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 	return (result < 0) ? result : num;
 }
 
-static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
+static irqreturn_t lpi2c_imx_target_isr(struct lpi2c_imx_struct *lpi2c_imx,
+					   u32 ssr, u32 sier_filter)
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
+	if (sier_filter & SSR_SDF) {
+		/* STOP */
+		i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_STOP, &value);
+	}
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
 
@@ -980,6 +1079,119 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = dev_id;
+	u32 ssr, sier_filter;
+	unsigned int scr;
+
+	if (lpi2c_imx->target) {
+		scr = readl(lpi2c_imx->base + LPI2C_SCR);
+		ssr = readl(lpi2c_imx->base + LPI2C_SSR);
+		sier_filter = ssr & readl(lpi2c_imx->base + LPI2C_SIER);
+		if ((scr & SCR_SEN) && sier_filter)
+			return lpi2c_imx_target_isr(lpi2c_imx, ssr, sier_filter);
+		else
+			return lpi2c_imx_master_isr(lpi2c_imx);
+	} else {
+		return lpi2c_imx_master_isr(lpi2c_imx);
+	}
+}
+
+static void lpi2c_imx_target_init(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	int temp;
+
+	/* reset target module */
+	writel(SCR_RST, lpi2c_imx->base + LPI2C_SCR);
+	writel(0, lpi2c_imx->base + LPI2C_SCR);
+
+	/* Set target addr */
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
+	 * or other delays between two bytes in one message transmission. so it
+	 * will cause a short interval time between the driving SDA signal and
+	 * releasing SCL signal. Lpi2c master will mistakenly think it is a stop
+	 * signal resulting in an arbitration failure. This issue can be avoided
+	 * by setting CLKHOLD.
+	 *
+	 * In order to ensure lpi2c function normally when the lpi2c speed is as
+	 * low as 100kHz, CLKHOLD should be set 3 and it is also compatible with
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
+static int lpi2c_imx_reg_target(struct i2c_client *client)
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
+static int lpi2c_imx_unreg_target(struct i2c_client *client)
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
@@ -1055,6 +1267,8 @@ static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
 static const struct i2c_algorithm lpi2c_imx_algo = {
 	.master_xfer	= lpi2c_imx_xfer,
 	.functionality	= lpi2c_imx_func,
+	.reg_slave	= lpi2c_imx_reg_target,
+	.unreg_slave	= lpi2c_imx_unreg_target,
 };
 
 static const struct of_device_id lpi2c_imx_of_match[] = {
@@ -1205,9 +1419,39 @@ static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
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
+	 * If i2c module powered down in system suspend, register
+	 * value will lose. So reinit target when system resume.
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


