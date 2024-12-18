Return-Path: <linux-i2c+bounces-8592-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FF29F5DCD
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 05:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3830188CE81
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 04:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54730143890;
	Wed, 18 Dec 2024 04:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dLchgk1l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013033.outbound.protection.outlook.com [52.101.67.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454634A02;
	Wed, 18 Dec 2024 04:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734496301; cv=fail; b=W0AJyGAJCFbLT5iwzZ6aZ3yWPKFvYIsvfMndhEd0kHQr2GyCPBjaQSrQubgpdkxy5/gEClOg1+pqO8tuN/uanQOyA5lWgO+IVIran5PNznBeekOuRyQsAhtTmfVkYZlUkThdOftcE6Y5hWvUEzhjV/KQZRj6OAYWyAqH5ywqb5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734496301; c=relaxed/simple;
	bh=SJAW0IBnt29LprQo8uwP+XYmGwmtiyCLjT54pCIID0I=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=r/UvbGgQu38IifJTnnfI0uewflnJ4vVo3IQyKmZGalMyoxQxFJ1ObtfZrp3n2Lw4J66rqhZF4qJzsrtpPXbV6FGOSSxoU0IVHpQ3Z2fjTzEjSqc8ON/3tq0huLoInZId/ZSg/9rNAoHy33tr9smHsDcdaTw2QHymh4loboo3ikc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dLchgk1l; arc=fail smtp.client-ip=52.101.67.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AE75BZX4pOoiJzwPRKTJQesrUo+sAWGEG/DWkEcL+CNgnAItHKN037MXSl9mawXwgLgu9xMwL3PR65xyBklgEXh+tC5ssH8iYQSDKKmdgfNMIQE6rrOrguST184t8wyDqYqV0FyUHwvE8qio5eJ3FHx9aEMHfD11tM7R2a2n/uiVGGaBvlus/++OGI6U6P9P6jd6ph2sDKXg0UPAnnb0QyyrfSNyTuhXwDYGjBzEL3VjxdbEXGzRe6qSRyoYRGkenj0mYKKEz9mDcS+r4x2CkTpTFLB8L76NERs3cAkODGZJSJ+77YqT0O3Q0A+3aR4goe516MpObjfOnAy7EAi+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjXr7/gAhGvH3Fw1kT+t8GfkOpLq/6YNEl2eWiLfVI8=;
 b=qkpkzGLR4QeSdWzZvfzIE7G/XR8M0dt3mBnLW4VPpYpsQdGBngGq46k0xsxc5mqw6lKhwlov0OqiN5jPNB2QGVeL20EEfeCstuGOz3hPgbZPLnHXNbjVxIvTD6NMeHnQq39RN7i2LANrDhoFUPXjCfNjm3WoiUVHrFQ96U1xcjVBl4R5izO5Xm+OMB0fFDwTjtkvpg96iwjryLJNnmPbEVxojAM4e3u305JPy2d6eEXtDts0wecwdCCMQhaJxFubutpRQ81ETc4T4+JX690SNK4m4+QaaCgM6jtahrYQotx+4WyurCuPqEiWVHpWLvopAVFizoTiqp65g3Lcrl3pMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjXr7/gAhGvH3Fw1kT+t8GfkOpLq/6YNEl2eWiLfVI8=;
 b=dLchgk1lZ/tb++3H2qjftoIZzwKZai2lZX6HaHVfey5yBDhXhfwZ8oQo2gsVonlgEIFzuiuxttkAiTA3p3sHbTQ+2j/f1+7K6+xHFWEcX/bKkyc2WsicbU0ovNr3g4oatwXFj97+JtcvVFmlHQH0UqOXzIybsHjGSP5dj7mhiaUvCpArEpkGZ15F8pyajfyLejthqBzRz2aH9b99RcknxNbZU9m7PWFmAI2DIYtGcrm4SHZxxdrw0V77z4dwc5rgWrjQTd2M3U669LXAwfecG2YPFspwurde0tbTbwuIvw+OuWLsVrRaP0sEe0iNWG+JjlHXsVvzk4e0jMlfL0OtrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by AM9PR04MB8873.eurprd04.prod.outlook.com (2603:10a6:20b:408::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 04:31:36 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 04:31:36 +0000
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
	Haibo Chen <haibo.chen@nxp.com>
Subject: [PATCH v3] i2c: imx: add imx7d compatible string for applying errata ERR007805
Date: Wed, 18 Dec 2024 12:42:38 +0800
Message-Id: <20241218044238.143414-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0013.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::23) To AM0PR0402MB3937.eurprd04.prod.outlook.com
 (2603:10a6:208:5::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|AM9PR04MB8873:EE_
X-MS-Office365-Filtering-Correlation-Id: 98eb1d8f-4c18-431f-356a-08dd1f1cdbd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3V1qk2MkjkTNgZ1RyZVcbrP1leSAx8Uv7H6FG6j4sF/qSvK1KugtgVzoXYxP?=
 =?us-ascii?Q?xyFQUANQKL+tMaDc/u+8f3RseZLfT0f1G3W4SRljB5zsICclHmD2pnwJ4L3V?=
 =?us-ascii?Q?gk2CW4tOnB2ysub9AlgRRbAUWE2cGpjy7ONJpgRrGLSz0Sz7onAFFRftXnZr?=
 =?us-ascii?Q?F8gLFLn+M0DibJd9lMdJYGacYWr8GFzcau4kpnCtzD57kEWRmD0I45XJbR07?=
 =?us-ascii?Q?izP8Ly36dnG4OJYMY7jy+vwbqG4oYXcWtT1zzxEib97+GzmQRYSzDoROGJXQ?=
 =?us-ascii?Q?lpIXelMV4NKekPZSHllsN2wxv5isPh2ef27j8ZO+ErbVOEcWFKL5hsyETwHs?=
 =?us-ascii?Q?zY1KzVxxxUZKVww5MHiMNaBPLkBde6rcEwBsUFGY88LTM2ITenlKmUBXARMT?=
 =?us-ascii?Q?12cUt9iT0Od3QQATKDWrZ7Z8ihn3A6GvKf+xfmUspqOe87/mMiKAAD3J1dkC?=
 =?us-ascii?Q?Aubjs5Jd/9tNyd4roPcUivHSwqbbUEyR6r0izmOoEy2mW7q+D4aefcHMgVYq?=
 =?us-ascii?Q?/LgG4KG0Q0M8MLyUMX8V1vkeA5qK0Fa3N5Tmw2FZ9Od7vP5u4IlS6kC2LuFH?=
 =?us-ascii?Q?kVDDNHhjfXnUVe/l7V+ilgavUjoKGBR8jgsivQmD1JC3+HGW91jg08rUCA+n?=
 =?us-ascii?Q?yu2xpbD1xgA135AmPWZWO7WLoLG9BXZuufLWOWC3clRd1Ut8CiHcbO24TsUX?=
 =?us-ascii?Q?6u5/6GO/IpfKr/yNuFqP2eOtheM2hviJouqOd1z4PjqCBjCA+fqcLOsNMwjQ?=
 =?us-ascii?Q?w3ZOp4oLOVCqVAvEvFrXWAxrnaGegX/bePE19+vab9cJdrJeUGxX9lMGlNe5?=
 =?us-ascii?Q?H6mWWOzF61DLWg5IFn6FGXaAsuCFpP2YZKfargvg2Bsa6ZDBLn4UY1Pt0yZx?=
 =?us-ascii?Q?DZEuefDwQlbsneds7J/5NZPWJTicpjJGMa+7TRDo4Nl3sKFFXcjuoUDiD68Q?=
 =?us-ascii?Q?TVWlO+9SDfo8G99fRfy63ZFCOJRl4CAXDhme3yMvAnYBIiHWqF/B4gKlYSg8?=
 =?us-ascii?Q?hRasIJMkYi6HTu0qfk5PPQm2zND1ljx5SfQrzEHo6knFnnWAVF9KTNo4Z7rc?=
 =?us-ascii?Q?sjfk2xgGXTTN1ljFUMXNzz2Q3ZQnSquo1jwr23NU/cHj/sPSqPKvctrSMpej?=
 =?us-ascii?Q?EKMNdmyoLF3uQRhg0SrIZn02p/Kv4XwicebqnfFlCG7B3LjSSi8zuAzw8Che?=
 =?us-ascii?Q?4Pxeu71haoceysOW0V94pRdHnGJkb6/eQJu3CdS53fJUgbJtvj9ExZp11r7G?=
 =?us-ascii?Q?c8/TSuJkjs18+ZYqTmbXpsenZVByptdgIOybVpMu6z5WTkUzqMEwehXjPnLT?=
 =?us-ascii?Q?hI0lPlEBR9hDVJcaXadvgDn/uBP1Yj7NFo3WA8wa8M3Nk5N4fABD7Jz850I5?=
 =?us-ascii?Q?iQA6rqIs1D7hfSm/OLVqEXvi83/eUdrLSZG1AoMtDxYHr/My4WKU+XbT9b3f?=
 =?us-ascii?Q?SQS2sa8oLB8OT7B22dr2SE9zBW4k0AQX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vmDg/baoYJMba8zsbL6c6NEjn0eJlkbktDo4jwyZnOcrPXsiQiftiZ6xjrnN?=
 =?us-ascii?Q?rMV9CwTSmHuZ2qtVR+grF/4acdTiiK31QTWI0l0P6yB6x/5Q3mqSkEuBqvIv?=
 =?us-ascii?Q?PaSbDhkYl0r1boFbGdiOGaivPsPHWfC26wp7ED51tVphECTKQX++xQgpU+KE?=
 =?us-ascii?Q?dwR9w8HDMRdckQaAr0Y59xCNuo+Voiqxnu4mCMUD46y3Fs1J8oIbbdC2zYEu?=
 =?us-ascii?Q?bZ8eVE/2vMHZOht6uq78g1/vpjXhN8DLC2MQjMx3To2tDx9onT8vt+pwjFVk?=
 =?us-ascii?Q?v8N51XKSZOVooMiNSVTh2bsjl5FMHTIvjxqm0iKSaDqhsCRazmvFTBQ/oF9S?=
 =?us-ascii?Q?iJ2ep2sNQzwfXUeddgQ9gQ5fIsW4AtXZoeJzCO2M+TBNUJaVkM1YvO7M/8ff?=
 =?us-ascii?Q?9qUfdgS8eVt0oiOTEAStLDdwG75A/O6I/bY+AkhT6zKW8RZyBIBkn8UOSyJI?=
 =?us-ascii?Q?UDY/7GYsPtIbTPFQjSjCsLO0vIlc8NsqhHZm8sjVX/Gvmm4Iv2KTgew66frD?=
 =?us-ascii?Q?syZD+78dFrmDAuuLly3X7I1QCWrE0+hJ6Mag1ZfH6+RnL5/fWtSfrrNsLRAp?=
 =?us-ascii?Q?yhvdQitRB1M0kgc++GEE7niBziDFBlqBtMgXM4nDYvg/ckS42ZqckuE5kALL?=
 =?us-ascii?Q?I8M117ITW8ktUI2s/5GfNMsr28oNF0tiXkhYQAqoxMhRrIeKJs4YeVsBfjAi?=
 =?us-ascii?Q?3cBAMHl/edeAccc9PG+qg55L8CfV5orFngXsc6BmagNqsMTVIxaqOtL8i6aw?=
 =?us-ascii?Q?malaM7zCHQbxyfPGNAVJg/DlBq6ePU8xbL4BnRITsv12je2JlrCdI1Lf6HiO?=
 =?us-ascii?Q?mQMSaY+/mM0kVC5fa1knlBf+BSodx/ogkhGTpnAjCsxdMLP+ndUF2Kp50gEa?=
 =?us-ascii?Q?BalkCLjRhV6GmX5ZgBPwwRR2YO+OsYUQ4N0YMF3VhLgHsBbTiSb+NAW4GuDR?=
 =?us-ascii?Q?T4y3kkwkJrxQKxI8uF/fTnQjF2blj2wjF5Lb2AktUg38/eZiRuhr13xwcawG?=
 =?us-ascii?Q?6f2wPLmOhUUAuqCe+F7FB0mmopxEvqg0KKRagqDLrWj31EofnQ8IRhaeDyk9?=
 =?us-ascii?Q?CHtIDjlkoRzUBvcIRIhi0CJpuiHo13eHAZBtjgtxrzMusK7VTMKvPtXT4vP3?=
 =?us-ascii?Q?GVfL7XXPCVyE27esl3oCbSNfBoJcf3BAaWp4XSUJswoJnmTe6V1m+lmM94Hs?=
 =?us-ascii?Q?3OIyVrNXmNH/ox3WrU+HE8JSCRweod+GeHzaarBQetkiztOoVeFWbmLq64s9?=
 =?us-ascii?Q?mSFpVPrxJ0lWohx6a/vE+JDmM5HNZVx+JET5NFa25FdcXbk1pEWIBVo/BryX?=
 =?us-ascii?Q?FiiRndcSKk0Fn0w6RgMzzu78U+bdNaLKxlgzFhYGlxXMhpdB6ejDSk0g+z6w?=
 =?us-ascii?Q?tbj7gEiJ3Vm7xtC3rusk3BFEF69VN/1qENekvHdyGUn3O9/gnA5NYsTi0hpC?=
 =?us-ascii?Q?K7GrSDuHux2rSYGEJMr+lf3bklnNF6FJ49yNU9pCih5l/sMi0ZXYi0D3Qgon?=
 =?us-ascii?Q?8Rl+8qTY3cNUZfyiihMg1uRUZk4EfamXIPPpPgcIWk0kb7mO7c5pSP93f/Hh?=
 =?us-ascii?Q?YXNcToaE6Bak9YQ/+H2oOAUzIq0sYmfvJUt/0nNL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98eb1d8f-4c18-431f-356a-08dd1f1cdbd8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 04:31:36.8276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IkSGulvOoHqyaUqqykh7ZmQ/a4XeGouxcbzFREcUU8CfYDaB31AkmgIWh/1Y4lzpDRlTY0hb0c73sBJ/Y84aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8873

Compatible string "fsl,imx7d-i2c" is not exited at i2c-imx driver
compatible string table, at the result, "fsl,imx21-i2c" will be
matched, but it will cause errata ERR007805 not be applied in fact.

So Add "fsl,imx7d-i2c" compatible string in i2c-imx driver to apply
the errata ERR007805(https://www.nxp.com/webapp/Download?colCode=
IMX7DS_2N09P).

"fsl,imx7d-i2c" already is documented in binding doc. This errata
fix has been included in imx6_i2c_hwdata and it is the same in all
I.MX6/7/8, so just reuse it.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
Change for V3:
- No ACK, so resend this patch.
Change for V2:
- I have tried to fix this issue at imx7s.dtsi in V1, according to
  the community suggestion, I make V2 patch for i2c-imx driver to
  avoid updating the FDT to fix an errata. Discussion in V1:
  Subject: [PATCH] ARM: dts: imx7s: change i2c compatible string for applying errata ERR007805
  Message-ID: <20241021031148.2682015-1-carlos.song@nxp.com> (raw)
---
 drivers/i2c/busses/i2c-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 350346a7892c..9d5caa032c5c 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -335,6 +335,7 @@ static const struct of_device_id i2c_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx6sll-i2c", .data = &imx6_i2c_hwdata, },
 	{ .compatible = "fsl,imx6sx-i2c", .data = &imx6_i2c_hwdata, },
 	{ .compatible = "fsl,imx6ul-i2c", .data = &imx6_i2c_hwdata, },
+	{ .compatible = "fsl,imx7d-i2c", .data = &imx6_i2c_hwdata, },
 	{ .compatible = "fsl,imx7s-i2c", .data = &imx6_i2c_hwdata, },
 	{ .compatible = "fsl,imx8mm-i2c", .data = &imx6_i2c_hwdata, },
 	{ .compatible = "fsl,imx8mn-i2c", .data = &imx6_i2c_hwdata, },
-- 
2.34.1


