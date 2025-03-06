Return-Path: <linux-i2c+bounces-9738-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFE9A54FDC
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Mar 2025 16:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E77C1894234
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Mar 2025 15:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2627C211469;
	Thu,  6 Mar 2025 15:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QvwurLY0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012032.outbound.protection.outlook.com [52.101.71.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319A920B1E4;
	Thu,  6 Mar 2025 15:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741276713; cv=fail; b=DeTLmXg3O9CBwHZZQaH8TvG1/KikZfB4a+tEXl9FOstXuC2iy+7O+EQsunNOQDWddOI91jxbzYCjM72rn3naMmlU4tqaEeLSGAPLu4Z5ScHdEgvd6Ampp4mk0oDMMExSzcJQjHMrFZvQme6G2mBvB9/532jZaM5dLQ5UwnoOer4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741276713; c=relaxed/simple;
	bh=uCCBYbLkEClWyEkuRabYib7JXqlKp0TUDGNhwdR8rOA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=PTuoTxgq2k1UG4t2csnQbGgjsWEfds2pi8H+v1iP1FHiZRs0Ioa9ZUcfjpB8D0KccPH208+oAH5ojLaMbAfOFcqEnkb6aLr+vIPQUAaJdV5jSBSQRXJWyx1Bi2wJwaqUrppBNAEo3ZKweM4+BeRBlgltVRKVLNwjYOQf15ahrW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QvwurLY0; arc=fail smtp.client-ip=52.101.71.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwFsHksBAkGAV+hr3M7ycoH/dDwXWl/ocuDJUACYFvtf6tsDiIqIcuNbUjxMnIUAzlIEmdHvuZe39mwUMCxOxUdTT9uoQzdvPcH2m1/lJbhlLUVEWuHceolTofdPyBca1ZTynDxEVb4WyjIvPmI9wAzLNLoJZ0WUxPWzlpWxBj7LdqE+pGrzx+Xt+I3j11e+cjuPc/KJkYYYQwlHh4NgNShxQ/HPNMqtKH2N4UAR442IBpAQPCVVyZWdSwYmEcEfRTAvGUvWs6f1GEoVg7SNGv2gCzmwT+I7PAePREHztbNXcY1elyZF4jczHEkI2XXl9zoZvBbIzfJWBt890Mp2bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKLQOo+h6wkMC29fzswqSWk9MTt9qVypWoHFeqmEG58=;
 b=v9T/OIR0FgH8Nl4pNf1lWGKb+3PM9Jr3dKMEmSJlO5RHfs3VMgMfwdPNWoEFZwRx3PJ0p9LEcABPMk27IIyhYlOn2KOYTMNwYRjLDv3luDfiPRy+jcyTYJzlK/CCeeWfiguWqFcx6gFGU028tne7myXGBeAsymApW6heNx8viSP8hibr0oCM2giZ4gwr/4nESnWTV7euNQAE/7j7T76JmvLD3Y7+CuLCsBDasu7VGepeyi7DxQ8rqK5lNjsspNZNqb+/hN0SE+LvEVrnbUHLckW38swv//I5rbuT+trKIfYEaS0Zo4IeelSMIELx7mHTMCDocvYli4GnWDH1OS9kLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKLQOo+h6wkMC29fzswqSWk9MTt9qVypWoHFeqmEG58=;
 b=QvwurLY0k4T6MNNsxWhYlBmoArhDBn8iVdY9dPeolod6XTGoTNP3UWsR3BMv958V/TypMJm4VqHIhmTJgJJpz2RzVhRErsfPcZdVOi3e3TXCc2RTn3q6KllsGw3m3UrdGsUNXgjyyMEpJmjvNqOCJ4h7A+3eqtxOdK8m2eae4LvEbo9qFctbUHcpF841iS7lXYyDMU0nIBkpMxZ3OklnHsM1Tq3vbHhEeOE4JT9VliA99ovCs9dNNI75OO1wDXQRmVjlBY7BNJWH69/Lnb85oHTe3bJIU7bmi75bq9edj6bX0aWZMSpPc0PdSHAJA+V5DKopBN14xxqLDAIszR4pZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9330.eurprd04.prod.outlook.com (2603:10a6:10:36e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 15:58:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 15:58:29 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-i2c@vger.kernel.org (open list:FREESCALE IMX LPI2C DRIVER),
	imx@lists.linux.dev (open list:FREESCALE IMX LPI2C DRIVER),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: i2c: imx-lpi2c: add i.MX94 LPI2C
Date: Thu,  6 Mar 2025 10:58:15 -0500
Message-Id: <20250306155815.110514-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0022.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9330:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e76b1b7-de1b-4248-2d35-08dd5cc7bca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hcBuNtGhykuoHr1HOLPeCy/bgT9lVV24SMeREzvKvHrzEc3WBjGquPMNhlb9?=
 =?us-ascii?Q?Ly2smjP2D/0yCUAayJErFKGrrSxvgQl/GefAqlSgixsJFpNTTEuqOI2z8gzD?=
 =?us-ascii?Q?ngL6Qa1ZYsaniX16FthwyMK/l9zVscFUlDuR5NQigeyKNtkET/TJhDfcHPgZ?=
 =?us-ascii?Q?hypmiR/nx+zw37EYbB5djiwEIjUGL6WPlUQRfa1pYZUOSAfTpTGIETXNXL2o?=
 =?us-ascii?Q?2cmqlATnhMGNUldlTsvNFRvF9Cayyl04gfDHS52UPFEEsA1qW0s5v5DrkFWG?=
 =?us-ascii?Q?erECGu0p/p98Lvs7XOHJ9jwizl0rsCGfdgSEZKJ7Zei7/GzqXN7bjTm8DiVp?=
 =?us-ascii?Q?om0zR9PyA/J0oh6JB7Kq1Ty71zRPUe91K/HeCtR5ZCsKbiGNa3lsPA16b9ob?=
 =?us-ascii?Q?pedBnfnzl6/Da09vGexVczKE3gC8WvBPFg3CVteOL2YgBtYHtZfNDfaAZcMM?=
 =?us-ascii?Q?DrZw597BUhYu9B+Z1adnH8ajp2Vptn/Flx8X2CBPnUsFYwvLBuGZAXsKooQ0?=
 =?us-ascii?Q?Uoz/LFunrKtFCufDNcwzUL2c9cwVef75ucPHgLnDXlnwMuHzmohWPk2nlklo?=
 =?us-ascii?Q?KRkFjOzGQI3MlPdRcpRGObc6N5kGDgBAMfsfubEUVQn/2SwxctqynilSRDfT?=
 =?us-ascii?Q?nKnLDCkn+VSO5miGX9h9M6a2iQEgbdCdcYOGTmSCSZFqtLR4mYNFHOu3KrU4?=
 =?us-ascii?Q?6l707151+n5OJQcVAnYIZDHWlG8AR1rNlOM/WGE9GiAmOdSsVz/TD6EpbXS7?=
 =?us-ascii?Q?xpN5jOtYHPfNU54W1wfPxTBjZeopGZb3LnaNWj+rRiTDVIS7xiOT1xNtEb0A?=
 =?us-ascii?Q?iDKuAf66FAE09WUljEXFVB5gTV5nzsUDsZihx5Kl5Z9lw6MVGxFaY8X1CB09?=
 =?us-ascii?Q?+0v0BJPAculJVNd4D8FFhlI46I7zjUMXocrALk8zJrqWeCoX14uRdZdMijNk?=
 =?us-ascii?Q?1GJ5K7HX4AJgK+NPx9GRNShQG8cQdt0P75PeFmLpo5Q7xpPPLF6iXWk+4G8+?=
 =?us-ascii?Q?96745ckfNJn5SAu+6Od13kbdIb3KqCdyj47Q9+7hqjjHZmSpSKVV/Unw65Pz?=
 =?us-ascii?Q?sSo75Ii0S/hKw00SFwhn0LU62vib7xAxFdCCRhsUIV7aeOx7Q41ry83zijnf?=
 =?us-ascii?Q?TXOEbjYdvyie0rf7WHdi1yt4ZeSzW2oM0G+MqzGnVZpjNtg1SEjeHY3Q2fjR?=
 =?us-ascii?Q?D4zzdgT8gFOl9mncdovL7evIweTMJGQabKDwxM5NLrLgnsky/UNjUxo3RrNd?=
 =?us-ascii?Q?tpKKsK6H/mAgQnilVFZncHEDw6V4AJca0LTjapxh4FHFQpC/cIY4himV/Sf1?=
 =?us-ascii?Q?SCMnD19T8mXqvSAHyo8CBHt9rBBmVPCbjHq7C+lGVIzQJgSyNQJr+n7cu2k+?=
 =?us-ascii?Q?w3xM6vrPFGAyxHSjbZK7pODLC6MbFuFYBiHKmv8NzcWA/eD6BnD8oZ5n/rVT?=
 =?us-ascii?Q?MJazUecZdAlNYdAVjS0DgBOp5Vn6h6zTt8kUjw82pQ7wIpc3LxuiSg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BegnxSriWLAhDvxmDYv4ghCVYF45Qorwu7x3300r4+oKugXuRcwLrkZKFeC6?=
 =?us-ascii?Q?mX7WexCQq68bSKBDGuQvJXzCqKbfsiiYQw5L568fc6S+wPQSqlVB1BDHtv/x?=
 =?us-ascii?Q?0lxoh2HW1HN2zk4P4ho8G8s76+5zA48ISv0JqHyq7LIuCO83USUFKogZqKRW?=
 =?us-ascii?Q?/UNWlwLuothmpT3b/tXCxFl14THDEVN9QPIv4Lc4L/L61J8uBn+cmYh/logW?=
 =?us-ascii?Q?IzNuyZVrgmvNpMdvS2+5WW3AI1PuLLYdLfl6Mr2GVPU2CLgKbZAXhAuuoOyj?=
 =?us-ascii?Q?AvDiPKoXG0j3ERU6RkSYJXPhQXBeuYleZW7CuX3Q9r9wrwJPlzw8Tqtey7+3?=
 =?us-ascii?Q?IoT4dMtuy93UL1y4zkbrL5PSJnSmHU18TWXvGsT1wMhkOEN1n/vAXUBP+gsY?=
 =?us-ascii?Q?xgDSVEhVV09qfhlrUW6ObIdAwQ4YEBY7iaMlcNugKO/ooIjDEzYflAqH13uK?=
 =?us-ascii?Q?l0ylwwsficEowVvGU6KGJoZsWniQCgsHpodwXCkZAn0co1Sh8j6MQJNyLZs/?=
 =?us-ascii?Q?+T5u9Y1lSD1KnlYst1JdOIzTKGEzjqqZNAS3AN7Cyzks3AoYmdhX+RHuuRqC?=
 =?us-ascii?Q?08KtkiVuh6tTdAD20Z4nzJTZccIlgXxtd4c0lv9pZAddK8xsQDgulnHKqFxR?=
 =?us-ascii?Q?870niuVjSbvibR4PkAtq3agkABG0x6Z//pnBwa4RlNGxQJxWr38R/hP/2FSr?=
 =?us-ascii?Q?t1FTsd16G8yFZEpfnB1bCQy91Zo4nQEXNF+6FU4agQ5aQdXYSpNhegOmBY9J?=
 =?us-ascii?Q?n+421voxwtm4NbhRLs6K4ZwKbUKACtADfe/EQEMWW5NmT6xEOki4kBOwtI1/?=
 =?us-ascii?Q?14jcsDM1h9LCFi1TX8Uqby73uJeWV5XA9h/xVnB1gAP3y6sjhi1/+p8AnDut?=
 =?us-ascii?Q?FpJ32oW6m1AVQ1o20/yJBRHleatmt7xpNzpvw2oPos6GxBdJZoaEM9eQbfD/?=
 =?us-ascii?Q?VJT486SiGFTsPCyJ58tBwAf8fv81STapIc/CaCPpx/SVUPzRd+yAiVe4lN/m?=
 =?us-ascii?Q?bcDtRCF8h7wMUx7LYTGGHKzdlFnwIA1gXcb2wbIFXoVUJFCLxh0sTFNlYqQs?=
 =?us-ascii?Q?oPvoLJHkjzN2JviTkNknWaAJvjTprgIEch7yG7fdUQrj5lcSyHD7eTNQpQoz?=
 =?us-ascii?Q?E2GWD4id+N4xba8J35/O0+pzZfHMZeFBqeEBzrKRdbl9Nr/hsqY/1g0oYXKs?=
 =?us-ascii?Q?KYkTI6qF8/Wa9twdh1jwrxoZ7uAyqHctk/+f/AD5645g5ISpMvC5Pw9DKA0R?=
 =?us-ascii?Q?9owYjxqBEiVQvel59VGTBrvCKB2bkqGynoG99e9HkX1f+DoDy+44FW91KQ2c?=
 =?us-ascii?Q?iCo+SXxTJoFgmVhtnrwPMVhNIRzLeFDJxQV3+ZSjyRBGSrxvrL8kDyXFyNZs?=
 =?us-ascii?Q?ExigfVMKvhpcojIuELX4EmnMobaFLSbNRlcixy0xfeKL8k8mFM22SthS7auX?=
 =?us-ascii?Q?xtzQzOXT4IWGP4IVRpbSvfIeW0lBXz7xEWGzYI0KIjd0Q5UZTA4rTpGggKiL?=
 =?us-ascii?Q?GtzkL+Y0i3nVdasWh+LWtsWlDoObHzWuuvOjvd0ti+awsh988V+257+7zGCa?=
 =?us-ascii?Q?RaChGnaQCrodr7vdzE7t9c7LFetxzLhslHXid+ak?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e76b1b7-de1b-4248-2d35-08dd5cc7bca1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 15:58:29.2604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdTVcv2mC0hojZHk25/TyA0fDL/Wx3F0hcrpCjlL1JE2HqPWj5z0A81g+FpbFkFlxWiJpdIUMJwJ5tl8U8i8yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9330

Add compatible string "fsl,imx94-lpi2c" for the i.MX94 chip, which is
backward compatible with i.MX7ULP. Set it to fall back to
"fsl,imx7ulp-lpi2c".

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index 1dcb9c78de3b5..969030a6f82ab 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
@@ -26,6 +26,7 @@ properties:
               - fsl,imx8qm-lpi2c
               - fsl,imx8ulp-lpi2c
               - fsl,imx93-lpi2c
+              - fsl,imx94-lpi2c
               - fsl,imx95-lpi2c
           - const: fsl,imx7ulp-lpi2c
 
-- 
2.34.1


