Return-Path: <linux-i2c+bounces-5921-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7362F964227
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 12:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98C7B1C215D9
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 10:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381B314B96F;
	Thu, 29 Aug 2024 10:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fIGCDZ3Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2057.outbound.protection.outlook.com [40.107.241.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91A1189F5E;
	Thu, 29 Aug 2024 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724928347; cv=fail; b=TrXO6nd6l85rsmBr4ODhQUfM9GFoFUAKM8OAmv0FhQQmbXx2Tj9qsd62xO5TLfRgeltGlPYxdYtzO3V3CZ0fijvQ52IXE1HCwtML66o5ywbcsZ4JE2tlKEIKUk25IByzREuaBX7tc+9CLscf32ZGkmbziyK8gCYKJurlwPu7fG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724928347; c=relaxed/simple;
	bh=Z/2GlE3NphF4dqQx5BkKJSSMjSfFZhDp/NpmJaug3J0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=tcCzh/AZnY4mkc4ABwd1upJy4A2FYLjN39cfyUfbqJB4rDRBFGwziHINepHPe6ZiB1jekfeLYrA0Q+8BkqmPRwIxvqXLpydTPDYjha2SwE3/Pq+d3rv8aibL5jnhtvV+NOMzmgPLjTs1cQsFA5oPJOQq19ByMqq5idHUQkEFnXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fIGCDZ3Z; arc=fail smtp.client-ip=40.107.241.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hc5IajcsPRtIm/0zqAnbqhKDMvbjHDS4eABlyY8N9aWXXURACQX6dQdRpHWBj5rM6X8oExos9WHkQH4g7TXBkLrNYn8DaNR2VRChRyLQZtorLJZtliQO5GFe5V/DhS3KaTTkBIJXnestCeAyJgov37Xyg0Q5o023IgKTPcErk9fz0xSEQi2tK8eaeDoXtR+IHQjzr5yoDb5Wmm/lpkMBbKRMf8+HVB7PjdYk/J+00JYCP+yjA8qLNlyNqiq8c+MySZ2gJKE21X4Ejizr0gIUzdWVhDBWcT0fG1VLkOYP8wnaf+mnALZwVIpUXU7GoE50z8ilzpQgETRWOZxGfbVYiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWplrJb9Jxl9v251BdlgDQCQCmq73ep6CDHpKvjvWwM=;
 b=rMuyp09Zs3BQg+GcG7t9IYPZqgOH0iT5VDT7FusuBJnaraKcKUNl5UvXWUXPRJOWi+gVddWGKofphkaKQx4iCm40u4u8yWIlMbMIg+OL8OyNpn9T+BID0srrqO7FaIN+v7y//PR2coYD42187UVSJYvbb8mcn256HP9m2nAO8liI8H80rDiY66VVKp463o7VJPx49mpRq6nvd8YlgmH42WZlMyGdWaEz71T/mGGDBLdo0AXmYz1zuyGZejli2A5zWohiC4ze9nwuNLDkJJWjNb4Z3xfhn0zRz4MT34Xry8+dV0l1NQMT7H5kSXM5KvpTaYYaA9t/22c8088hbu/yIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWplrJb9Jxl9v251BdlgDQCQCmq73ep6CDHpKvjvWwM=;
 b=fIGCDZ3ZPZGubjnEWrQdIRe7KFbl5taZDMy4rCkYaeqYJs9eahpO8OxSRyJnC+YZap8Vjun0WWzWvRz5M+BvuXCtiQUYkrJA4oi44LFGK3DKqUd+MfwFYg1Hd/casmc0Q40zEn7dJ9O1/kQv6pgjGkyxRlBm5Qboz2ezvQYtGSPQb5bxqGeZUY588GJohdQXZFvM/WNO9jlu6exLKWIN7Lj5dtAAEJfyUC4EYYjZm4pecDlG/F2SRw3ahuiOjWd3mo9cAm0qdlt6Pj3G3wYI6+o16SeonrnB6rzUmAnXnZEjAnGN5UruShhDEX15bOxOjfw2BjEk+leGclzmt3LyQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by AS1PR04MB9261.eurprd04.prod.outlook.com (2603:10a6:20b:4c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 10:45:33 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb%4]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 10:45:33 +0000
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
Subject: [PATCH V2] i2c: imx-lpi2c: add target mode support
Date: Thu, 29 Aug 2024 18:54:44 +0800
Message-Id: <20240829105444.2885653-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0010.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::23) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|AS1PR04MB9261:EE_
X-MS-Office365-Filtering-Correlation-Id: d6818f3a-a560-49c3-0ca5-08dcc817b54a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iFja3D5BwJe/Wnd8dAlLZru4biInKYr2gTbJckmqzkE604KxZqW32/mO+m6v?=
 =?us-ascii?Q?lJVnSTdmtJfNFDKDvlzB2azIiEip/7Hz34kED5dCdrNG40DuJSQCUnTTU9J4?=
 =?us-ascii?Q?3TkCPooXuNdjj5cCB3YG9AlUtH+cnQW5bPIqTb1aX3dWIx8g3DxtRBRosJf+?=
 =?us-ascii?Q?5UC8p0fpZ4RCln2z6QYrcysaQUQvX5cEfj3D0e4eeKxnO4i6ky1Yf0E/Gb53?=
 =?us-ascii?Q?prh8HQcjlLygDkivJ4ObrfDGucxSNgvmSweSPNwgX1YvnMQgg+jcvkkq8y0V?=
 =?us-ascii?Q?jjDF5gpF2dmOmNvUt+MTHmdU3xsbjZjez/pmTx3uXHJ2xIHdOnt4Ny4tK8jd?=
 =?us-ascii?Q?xQvzaj5vce9fs5YPU6hE9t8Gbv+rTyDMB4WfDN+u50dyFN9JvCibCS6jf12T?=
 =?us-ascii?Q?G+LFdB+BN+A+M3DWypzO3hlUk9Gz9sMPfEkc/guIDbgXIjA6+48bByvr7yyi?=
 =?us-ascii?Q?2QPn+JVdXVMroedg6gtZcD47/Qhk7TmHx02oUV6gn9jY2l3DuLfKAerJw40N?=
 =?us-ascii?Q?MJLYNqJ0dRKEQ0ZrM/1DFdoqoO6NCJuFCRpFKL8FpEN3OpFVr9NHH9hOv7Xe?=
 =?us-ascii?Q?kErvUiIOTS4LSPuZwuFN4lHtT5uWvKKxQJVbcZbrjX6qgfmexkILsUDfREEY?=
 =?us-ascii?Q?v5/kUabfuwBj/CI8uhV/4MrCzHWRJDspi1ctn21Key/Lw3Q4l5d7/5eR57Lt?=
 =?us-ascii?Q?+KsrnXoUHWscXH5fSaOkGZfsqMLVlj+rOt4gVDEJ0/QIHD/Ww6jVBCikk3Sp?=
 =?us-ascii?Q?PklZCB9A+o91rTVP3RBWFaFsslkFS9nGJtyzf1IFqPhyxBHps9DiTFKgdgRV?=
 =?us-ascii?Q?BdBX431yCofP5PYt/YgxGpgvJPN8PcBy06dz72segf9kshfpjHZKLt+jjX3r?=
 =?us-ascii?Q?upD5IGjQ1A0RCRrL0GD0DfKoSZxWEGBPK9P0cHhCLlvBevMBKSoCaogHBGZ9?=
 =?us-ascii?Q?KU6/4UV1uEqOIFujsVPccfZlUhYOg8yJkB8+Cf49m6I18V9gko4STOYvLKIC?=
 =?us-ascii?Q?/FkgTfneN9c5u5izVfjcSMolaIMgvbFWObBAJifSjuv6enYm6U2Qtn0YK0uI?=
 =?us-ascii?Q?vYcWBtyItY/BXluozNqx2t7As3DhYGLduiaFjqei0Xy8mKoovR9lRSxpqSxC?=
 =?us-ascii?Q?1k2KzPWGdCgrqRiiKYXM8VAcAvJnLc2R6y+vM/fDMl+EOF9SQzoZJOz9ijE0?=
 =?us-ascii?Q?zHPj2IJFZogczLisqGtQEGsCxHuYMiqLSVoB6ZcxOYh4TchTqcedXdWnfJvn?=
 =?us-ascii?Q?PbODC0tFLQY/uOlDE8HENEXdZzq/KxQ+FZQyv2Hc/adQ8FCaGpYHJvOjSb+C?=
 =?us-ascii?Q?HXF+EdZFKmZailyZeV9CvJFaGCSf3bwYqtJmDJ7wLjLfbMciQECO2IEKTCd8?=
 =?us-ascii?Q?nDR8iYaa6Y0xdC2DqptdpHmO9aiOoQaw+yLECd7S6LlduwVDYQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VXvRGZlBA2bf7tpmiMGVB2iR71eoR8E4EtcNZaeF0Oxu0Ran4L0k12fxovBz?=
 =?us-ascii?Q?Pi6jbRRidwq4LTE7EjnxkJyiyElAPcKulFrKeShX6wJbvsDw/0buySe4M4VK?=
 =?us-ascii?Q?RZThHMVQ05pCEH7NUbRGSn/cezL79pMUQLkDNXXg36Wx9+wrVwN+ccLCVlIr?=
 =?us-ascii?Q?DPbUp3LLWflwAZobL+Arr/VIIu+TlWLP8yInVYmS53S08sxMlqYCb0kURreK?=
 =?us-ascii?Q?itAo12gnD7QyiFQ7uul45CMHyaGAWqxG6gHB3V2AOsRDjiL4KvUWVed8rMID?=
 =?us-ascii?Q?13rZZlOAGM5rC+dGUrSknjPfVfW549JaP+h06S+gv9CO3RCHdstTEMML6+K+?=
 =?us-ascii?Q?rrsSe7SqNeljNrlChezFNt2GCILlg6M7j7PsB5rLTM6aFfDwumSpZMg8GiuM?=
 =?us-ascii?Q?CHB6rf5wlJt2/bJV71hwzyKR6exhwe6sQ7avq0nF7XBeIoS1HeF9J8qkF6GU?=
 =?us-ascii?Q?hsZi86vNdsVqnDMvSovCWsmCWOl7nDeYiPP5uwGDwXr7xBTedc6smVBw4EFE?=
 =?us-ascii?Q?LdDW1pPRVjP69m7zNBoFyYSLBBAMKoVrGLT9nIpzquLtg3f8H9U/GPd0yh91?=
 =?us-ascii?Q?mabEen7DVYPPDUhdWqp1z5YOgzxBFoh4jEVRr9H2f3migOBnClBXaYp8s7hz?=
 =?us-ascii?Q?PsxHu3m2zhhtdl3UlARP2Tqqk/u6/ba3w0sTNDeRQR4A1eJhqsgvvT5m0T+7?=
 =?us-ascii?Q?CCGXfD4rs9qzV8UpcP7yqQ6S8cFLuRFHkAaF0nZwNw4DHsIkS4R2qCqKZL2j?=
 =?us-ascii?Q?p5tgIbhmppfpySI9Fj2Foq3J+MwjhzAo4TVHFDPFXhtiYsylFfHxcmRJ5y6K?=
 =?us-ascii?Q?hPX7fSNa2DMa3zgaMulIFoAiHKUAUibCaO+OiBk3p9GA0j6BmUSSTCfxJY22?=
 =?us-ascii?Q?pmuikIBxLaoN5BsLxW35P8/zC9J6YhElHfvOKbCuYQIsFkcwO5HaKp2A5vhp?=
 =?us-ascii?Q?WaZ4eW+C+cwSOywFKZTm/fhsXfW1+Jf63uueAbZwWr/LY4tiNr3B5YNgzbb7?=
 =?us-ascii?Q?w/nHcE4GJDrN0w1dE8ayHgpL9OHlZF/LIwhQaJPfWNf6Icu9tJjDI3dI6v4z?=
 =?us-ascii?Q?EJwfR0I849hjLqF5o92c4jCx+UiB4iS6+BZ4Op0kK/Lg0Q6WBptYhYWA8I02?=
 =?us-ascii?Q?W58QBtjvkI43pWVkmbrj5Nx8IVTcUBoh/RHrTRmT7V/k++vK2VbB1hD+J5HC?=
 =?us-ascii?Q?RKHl+EZvE283UIIxDe9fzP+6LlZgA7hcvQLvPR7484K94oI2M460TECqLacT?=
 =?us-ascii?Q?rkn5WjddFuPQdlZSjVkJKKQj22RZ8PY/8ZW6ZmAGJwUmXCRJ3N4n8HnG2yMv?=
 =?us-ascii?Q?Tn04tA2UO391kNheWjEc0nAYlpISMSB3qDs+EGfXrBhCHwfiVR+YDVuPbN34?=
 =?us-ascii?Q?RkjkYdyONov2MxZLLm8n39vjymlG/9mvQdjQzrvU1rBSpaCRmhwghg7danDj?=
 =?us-ascii?Q?6/1CNn9OvbpCxe1tVhTGCC8w0ZcGxP2w2Jei10LBa/14mCMnliC+lcfV7y3y?=
 =?us-ascii?Q?MoElt4ld6hgZXBbQsYGNwO3CME9ANQGwMRxwuVoy0FuNn/UX82HLBvJGHhtI?=
 =?us-ascii?Q?mNbzON5y5KXNpluBjaKr0Qr0Gw1pwOIZt4sDIEAd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6818f3a-a560-49c3-0ca5-08dcc817b54a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 10:45:33.4759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: koqCEWYLa0ztJfHBvrycsCPbHBM8RgsV6IBRyToOxDsZIbIa9W8YFm+nB0uKH9F8Cl0A+LRLViJwbuld1jru9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9261

From: Carlos Song <carlos.song@nxp.com>

Add target mode support for LPI2C.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
Change for V2:
- remove unused variable ‘lpi2c_imx’ in lpi2c_suspend_noirq.
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 252 ++++++++++++++++++++++++++++-
 1 file changed, 248 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 530ca5d76403..73eb04c04466 100644
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
 
@@ -133,6 +183,7 @@ struct lpi2c_imx_struct {
 	struct i2c_bus_recovery_info rinfo;
 	bool			can_use_dma;
 	struct lpi2c_imx_dma	*dma;
+	struct i2c_client	*target;
 };
 
 static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
@@ -952,9 +1003,57 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
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
 
@@ -974,6 +1073,119 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
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
@@ -1049,6 +1261,8 @@ static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
 static const struct i2c_algorithm lpi2c_imx_algo = {
 	.master_xfer	= lpi2c_imx_xfer,
 	.functionality	= lpi2c_imx_func,
+	.reg_slave		= lpi2c_imx_reg_target,
+	.unreg_slave	= lpi2c_imx_unreg_target,
 };
 
 static const struct of_device_id lpi2c_imx_of_match[] = {
@@ -1199,9 +1413,39 @@ static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
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


