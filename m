Return-Path: <linux-i2c+bounces-8695-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 050469FA9C1
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Dec 2024 04:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CC561665DC
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Dec 2024 03:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB5F3A1DB;
	Mon, 23 Dec 2024 03:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PbqBmnrc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2078.outbound.protection.outlook.com [40.107.247.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A0622094;
	Mon, 23 Dec 2024 03:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734924813; cv=fail; b=YzM5I1rOyQYZUXpAs8Zj+5Hop6GdJTu96bNXSBBYp+4Y+26I+w2MiXqFs5lUwOnj/lHih/+KDSQPnbyR+1uF9O3xZ9xNgKBZxPP33X3tvZgq8AYrp/+Ch99Z8Qj9Fv8VHsGDiB1BqdNhF+BRI9PdXFVmQJlPuuLZomsxccvFHQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734924813; c=relaxed/simple;
	bh=n9TiijIo6HprpaVAPzOBHMERcA3d9+Orb0B2tj+dnWY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=emHtqjhC87Oa+TQpuyfGKmUZUymQ8XboYasDyFqyT/HDXChFpKWatpnS+Iw/RIcD8Hk/iwOQ9NFG5VwdqBKIC2TLC2INvNinSzrMgqtEzF6jDxE77v604MaBqamPmKu6Y/Me8iocH91DhXGUeVc29KgJQn6aN+UoIlJOKx5EZek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PbqBmnrc; arc=fail smtp.client-ip=40.107.247.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRBML0fnLTVwn/+B6BR0QDYFhkYrhnjlbJC6Q8PsWG427mp5ZSRbwQeyc6lC7cctyMTRL1aViMw3yXqkiBV+lXQ17oCAXb6K2HGe98xSnpbc+21iXEhrets9xH0EvzAC+OTPsLrCIf8kGVnMDTG/LMFY+OVNDAmaSb2jdI7856gMQ0MxTo6E0adUb6mHnI5XTtFuuUR6rlHb4GL0BiYiZqqDeUFKuuP4DkgvIkh3FBl5avCB1t2Bd3iJbyqZEmXGtytaZM6JcAwDxWmIoebiSjflv5Y+o4SRLliGFGRWYS19+kqcDOAC+LMVb1z64Uh/VXAxV2wGcAdyM0IB4u6Wbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSxvpQl7C19QyYGJlx4cPpXq8hOS52aLc8dOJwA1qO8=;
 b=pziV7SVqCacsSzvlMynna6AWArWAT0AUagBEL/C89JFFxkuLg7u62ll/mtvoy/JGIqYu3YQqWef1fXGARikXiSISztQLYR5GJVM5pGkzPg0hT1gPbzfRX3KOXcO8X3qeTvqcM+TYmaG3D9wYJlxQsde7H3zcuvwjTNQDwFo2TysYbVoSMgyfZH1I5yHxrFD8wTapVcHxfToQ7zSM7mZOoylCTLlKT94mRb2qxKU6Rhri2Bgdv2vlw7zqtSOwC67JPaTT6GdHqq2b3dOn82muR+ILVzQwEnjCuKJTsZH2tJWAReYZNi23yDmQVCiANaWySFYrDmnH9ELgdehXye7ARw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSxvpQl7C19QyYGJlx4cPpXq8hOS52aLc8dOJwA1qO8=;
 b=PbqBmnrchad8DNYlXV9zxx4KaJn5qeXiHSvI0WlsTdEzqkmtypg9vP6yQLJNCm3D6jbRqxfPM7pEd7Rh6V+kDx2TJkMYGCczsbM3G/oDSAK0zQd2aGIQl0ioQl6o/kPpne1FO75Z8reHpUG48ySWh4MWIreI8b5GzSANjQHBoNDG7Z4YF4qo3WaaQLaq5pL+AwHiUHaw8MrbXNOkXRbyjPXb9gG7wdGEVJJE5BJAUYcjZputOrO8EPLOarj9ho33xNSQMHb3cZ+MULhrCXCSbX86llMAYfgKe5ad6UmTX0IT250BQdyM0Yy2jnlaMSBEiblQUxmdkLBf1gwpvgglNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by AM9PR04MB8905.eurprd04.prod.outlook.com (2603:10a6:20b:408::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 03:33:24 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 03:33:24 +0000
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
	Clark Wang <xiaoning.wang@nxp.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v6] i2c: imx: support DMA defer probing
Date: Mon, 23 Dec 2024 11:44:16 +0800
Message-Id: <20241223034416.544022-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To AM0PR0402MB3937.eurprd04.prod.outlook.com
 (2603:10a6:208:5::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|AM9PR04MB8905:EE_
X-MS-Office365-Filtering-Correlation-Id: 03599ec8-0afe-47bc-6829-08dd23028ea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7e7L5/c1EbwCf7LsQ24pwmHDJbVO+Dfcwy5LAVEjjBSlzNQIlbp992c2RTHu?=
 =?us-ascii?Q?Lau/qxvsxJ7Bnt/3GkgmsUVsEO/mF0D2IfPZ4nbbRLNueMzK4gj6QcM6O3aA?=
 =?us-ascii?Q?f4RFaCMyKAuq8weX9SuLuPrEp1oeMFH6xGZqlZLjfk+ZVTV2C5AKtn2ScGwf?=
 =?us-ascii?Q?T5IMflnlX1d1ptn9zWJglf6tY//md1IJ6CX5JVoju4+jt0QgUOYtLCOEqLIR?=
 =?us-ascii?Q?4M26QBoa4HyQHD5ZMAdT6XEpuSPeow224ba+0l28xhNvGwqsXSIF6bsFIfRT?=
 =?us-ascii?Q?sgoBp5CX5bG36aOwD03j28bRkpfXVmm0CAUCcvwyLmGLvcPS0f2dnYpw11iD?=
 =?us-ascii?Q?Y5e4nhiYPH7OWShiar4PzSZDa7vcBfzPyEhbXk6eifR51ccYplb5BHk1g/pI?=
 =?us-ascii?Q?T8pbD5DtK11aOf8OxYOuPi2QacIq4iK8n91rKNssH5mue2XjlnFe8hQr66Vk?=
 =?us-ascii?Q?NLtNVxxEEtXAbUKA1GEB8gCUXCQX8EPuffouNP+jQC53JHJjMfFNhadfBmZP?=
 =?us-ascii?Q?GqGv7xcg7WY/W4JiR4XPBkSrPgp41rMblk4YLZZg5A3j5rNAza/ThGlahZ/1?=
 =?us-ascii?Q?zE+KNR/B97Nc1P2oCwrC0pUWTQjh1e9i6DNoAgpuvjqQh7A4pXwv+eyfdkgK?=
 =?us-ascii?Q?otr0HyY7tOV3OHOd+xasw8sd60YcB+E63P7i4Zxt8FJa6nFHI3nLD4wXk7tf?=
 =?us-ascii?Q?g12lekUfdmoHxqN5IKlnfSgvysPefJgy5rR7cgyohHpg06Awm31hmtr/fhKy?=
 =?us-ascii?Q?Lxr3Py5Lk5BmF2rpOOLEdrRY3E7YKeahM52orJY8YID7KYnYYu0NtGfh24+N?=
 =?us-ascii?Q?6KUxjK3/rq/qz1h3Bct2GKBDY5lsvGI/ZxkaonOIulY5183mRUipRIZ4MVFp?=
 =?us-ascii?Q?QnMByt3+aCIg9i80f6Wiu0Uh5NmsnNn1kPz7RGOp5916nW1MmOnT+Q+NomgR?=
 =?us-ascii?Q?2TzFitKsztrqwhOsT2RH3h70gcgAzZp0SCqviKe29ma36vFUpK7m2XCpvSuT?=
 =?us-ascii?Q?lc+kdoJyz11qVerMciK5lKcwUukU3tGKQ4vsiFEuC5W2SRWtmmXkQasGpB2G?=
 =?us-ascii?Q?hKPb7lmI9llgtoe7uv5RgE7Ag7LF7BZCPzemk1dJ9Hw9pMw5mBNzuTE2ezgr?=
 =?us-ascii?Q?nHuLED9/YeR95seJom21JiqRDJo710hBPMM3aM3Q8nghhqmPbktVrGMJ2D1J?=
 =?us-ascii?Q?R2c0VIWge5CzMMdl6HCL/HkgQ0f569crbx8ZXGnv4CQEYfInM0I1qBiYv0nL?=
 =?us-ascii?Q?KDCghkKlmrDkhAG8XjQ+axVwR7gn0SCSmrcXFrf/BlO5PC3YOKQurYuFVfdh?=
 =?us-ascii?Q?bZQrRoNRIVfSBlc8edXz3L5B+ckzY26N3egkZelO7ohXUJ//WgDFybEmri6C?=
 =?us-ascii?Q?eYbJ12GQOGOurrx3cGmIZW6RlomDIu0S7+bwPTFQt9foH/oRsO8P1NLoji+K?=
 =?us-ascii?Q?+59whUSFBZwfz2M44PQbzH7tJujzOgaA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ieNyqVsr91cwAbMd7jF5foMFflRLfSUPwyDOCTWRZ2EKe+LS9n/E3qLh2djK?=
 =?us-ascii?Q?/UvXISf9oKaWhPlvPnZkdvBbmZCb4v0pTsHyfqc/gq+Q/fGOHCzZEN8ML+Tk?=
 =?us-ascii?Q?T2AbyvWUcO/YCE3R0a8W9wAq1sB0tF59iHh+w0E8tUboHGde7ObW3vobiVvF?=
 =?us-ascii?Q?Dzaq5YAnlStMKQsjC82478UlA79+Ze4PWfqhppxFDSSierNgrryT192d8g3y?=
 =?us-ascii?Q?0LC+rcSZxHNvcHBQbqnwPBqtUCTBa0Mj6LdL2GlnKhhK7F3AuUJpuJxbGH64?=
 =?us-ascii?Q?rZ6SCb014lYRmzg7dLFiYFS+m4f/wHFq//UmWv75EO489I/1TfCMCMTy6ifT?=
 =?us-ascii?Q?JNq8mFMP3oVEHzla5tZic8FvVzZL2wSo7yh1ck9X6vtbY2bfKg7p7ZRJm9ON?=
 =?us-ascii?Q?9/1XNxleYRpdN1PLEnF2CE9X6ZRxBTujZop85dQlcXMlhiWCTbrPkiB4x6YF?=
 =?us-ascii?Q?EcdSON906cRN4Y5nVrp81fukX6in6752xpq5Q++w3YjxmcIun9vGKNpLk6Bi?=
 =?us-ascii?Q?SkgAj4OJpHWDdvu5JCARBO+aEd6FmR5b8JZfanks2ljfZkEfRbTn5UGXCkik?=
 =?us-ascii?Q?aO4QBnFn8R/APTMPCxtEt4thdzyzgruhTiis3tNTtG+hHTWVKDENoXvbr5FR?=
 =?us-ascii?Q?jYlEPsgOY3Pg3q2Nz5QMn9xSopCL3xiZX3kGBbf2aMbqGTRvXkiPqOZnrJ96?=
 =?us-ascii?Q?YBMBf5HZuhfvwnl3mmGQcmp2ddCyF14aw+Wrf+FER8aIsbxt0mDJXzIQ/PPH?=
 =?us-ascii?Q?g/iFJ6RKhY+/NEvU397v+CwuNPxn6A2L93AK4M36xSUBK9QXCdtHkySPRig3?=
 =?us-ascii?Q?ou/lh7gow7L/lgzWD7/yyvnHpTrdWxiU6Wy8utTf5RiPiNGfeU9RgvZLrt+W?=
 =?us-ascii?Q?pZHeFUAsOzQ8kX2ZayhYJrpGQ9OJ8IdLkAFHlavCy64aoxKKvGhgsRvGfqWn?=
 =?us-ascii?Q?ZDqYN3fFD+92up825v+a3NcvB9QzLh53f2uIjpiIxFePWlkrn6QwkRxmzwRo?=
 =?us-ascii?Q?ch1L8uGDMArtUQVQ1omF96JqyADZ6ukSIBxBYtXJjfgSjBCD7Q6/wWNpjukt?=
 =?us-ascii?Q?t2c3FruYGxl/EFEj0kte6g3j/WYwgyqV3OY6KFHlpE/NBCB2AgeGFRSPNK3Q?=
 =?us-ascii?Q?TXh2RWxRfNqOtUjTDQ+xrm3i42thvwlX91yhblnAQz2t4c4Vilbq6y7q9agt?=
 =?us-ascii?Q?Y6bp4ETTlyfSD6j0vLEldSoFE844v62V420DL2OIGB9grwOl0ZhlV3yDumXV?=
 =?us-ascii?Q?riSDzOYEQkNAtZlibm3jAx2OVS8FjHv7/Ox5iggy9TXhUQwxD37reENlpMC+?=
 =?us-ascii?Q?yVHWComXY9Lyf5hjIm0pQ+amNLGIFoq+bip7YBCQXbkgDyYReFMsmSYEzNVJ?=
 =?us-ascii?Q?xlO7XWz6qZpLv29DxIYNKQB/fhEMko9sihKRoYHvlj9cg8GdHvwO1EBTfuY9?=
 =?us-ascii?Q?ci8dEYzUzVcSCEWGWhKbT8qn5SzcjajGP5LRCtWlqzBTMj8HIswTgOOi5QJx?=
 =?us-ascii?Q?CIxEvO0T4guDrsvispAjUv23HIBDm0zZjvvRtzibmhcw/0gBuINuUP1lZwdJ?=
 =?us-ascii?Q?MfXhnqcLYpvXM75tqjjD7lxO0V+fEyhx1gTQ+IP/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03599ec8-0afe-47bc-6829-08dd23028ea0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 03:33:24.7948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7GPNq+LXetnRdZWRIO6ZrV8z8VIGgrDwP11ANi53+y6CfHSMg7u2R97/iL+JaC3dwn9F++cGWqnjck9Dvmx3bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8905

Return -EPROBE_DEFER when dma_request_slave_channel() because DMA driver
have not ready yet.

Move i2c_imx_dma_request() before registering I2C adapter to avoid
infinite loop of .probe() calls to the same driver, see "e8c220fac415
Revert "i2c: imx: improve the error handling in i2c_imx_dma_request()""
and "Documentation/driver-api/driver-model/driver.rst".

Use CPU mode to avoid stuck registering i2c adapter when DMA resources
are unavailable.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Acked-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
Change for V6:
- According to Ahmad and Oleksij's comment, use dev_err to print error
  log in failing setting up DMA path and simplify code comment.
Change for V5:
- Add Ahmad Acked-by. No code change.
Change for V4:
- Output "Only use PIO mode" log in debug level when no DMA configure.
Change for V3:
- According to Marc's comment, remove error print when defer probe.
  Add info log when DMA has not been enabled and add error log when
  DMA error, both won't stuck the i2c adapter register, just for reminding,
  i2c adapter is working only in PIO mode.
Change for V2:
- According to Frank's comments, wrap at 75 char and Simplify fix code
  at i2c_imx_dma_request().
- Use strict patch check, fix alignment warning at i2c_imx_dma_request()
---
 drivers/i2c/busses/i2c-imx.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 1f441227bfdc..9ac02640fdff 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -397,17 +397,16 @@ static void i2c_imx_reset_regs(struct imx_i2c_struct *i2c_imx)
 }
 
 /* Functions for DMA support */
-static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
-						dma_addr_t phy_addr)
+static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx, dma_addr_t phy_addr)
 {
 	struct imx_i2c_dma *dma;
 	struct dma_slave_config dma_sconfig;
-	struct device *dev = &i2c_imx->adapter.dev;
+	struct device *dev = i2c_imx->adapter.dev.parent;
 	int ret;
 
 	dma = devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
 	if (!dma)
-		return;
+		return -ENOMEM;
 
 	dma->chan_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->chan_tx)) {
@@ -452,7 +451,7 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
 	dev_info(dev, "using %s (tx) and %s (rx) for DMA transfers\n",
 		dma_chan_name(dma->chan_tx), dma_chan_name(dma->chan_rx));
 
-	return;
+	return 0;
 
 fail_rx:
 	dma_release_channel(dma->chan_rx);
@@ -460,6 +459,8 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
 	dma_release_channel(dma->chan_tx);
 fail_al:
 	devm_kfree(dev, dma);
+
+	return ret;
 }
 
 static void i2c_imx_dma_callback(void *arg)
@@ -1802,6 +1803,18 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	if (ret == -EPROBE_DEFER)
 		goto clk_notifier_unregister;
 
+	/* As we can always fall back to PIO, let's ignore the error setting up DMA. */
+	ret = i2c_imx_dma_request(i2c_imx, phy_addr);
+	if (ret) {
+		if (ret == -EPROBE_DEFER)
+			goto clk_notifier_unregister;
+		else if (ret == -ENODEV)
+			dev_dbg(&pdev->dev, "Only use PIO mode\n");
+		else
+			dev_err(&pdev->dev, "Failed to setup DMA (%pe), only use PIO mode\n",
+				ERR_PTR(ret));
+	}
+
 	/* Add I2C adapter */
 	ret = i2c_add_numbered_adapter(&i2c_imx->adapter);
 	if (ret < 0)
@@ -1816,9 +1829,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		i2c_imx->adapter.name);
 	dev_info(&i2c_imx->adapter.dev, "IMX I2C adapter registered\n");
 
-	/* Init DMA config if supported */
-	i2c_imx_dma_request(i2c_imx, phy_addr);
-
 	return 0;   /* Return OK */
 
 clk_notifier_unregister:
-- 
2.34.1


