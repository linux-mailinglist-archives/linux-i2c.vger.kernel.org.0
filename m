Return-Path: <linux-i2c+bounces-1397-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9009F835DA7
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 10:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B43751C241B1
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 09:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACC938FB2;
	Mon, 22 Jan 2024 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Tav0W2wU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2057.outbound.protection.outlook.com [40.107.104.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80E517BD3;
	Mon, 22 Jan 2024 09:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705914499; cv=fail; b=qptHYXeip6olYG0jgYoDzxx8Uj0ZznjHY9QFnFWNT+wGUtIHv8uSeMj4EMd4tJbx6VdDRH9Ic3SJCAOFJt63Hb5ooWi0SbXv5CWT2sGH3VSaJDyOITpgCwdFwpf4FfSUeOU621Ls9dQ+17Ifa4EbqQBdHA28ptzq9yhO9hm9pQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705914499; c=relaxed/simple;
	bh=jc6MguscBLczYZ3uf0NsvqpwNgGwuLxsxN10V8cmh+4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CyE1q8FvOgOTfG2OR9/UiemAqptUyAs1Fv18XRVz7QYNi11/r3FxdqAIGHodF/7XavBLeNSldBM9/YaEzWUmB78qaTOShq9YbyOJedJo9m14kieFnBWbyzFYXaJtIC7l2GAJ2/hA7HIrgtp1zJEHgvENPDx69h4Zhc9iq01616s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Tav0W2wU; arc=fail smtp.client-ip=40.107.104.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dR+Z/OHKMlxKY4lmERrOpVFS0UhPOQzjpWQgXR3rfUXPmCqQzYDcYoU1njU1RDrRNBN9TxyJHkB2J/hz0eI+R6DmrtFongk5rLbNGHnUSxehWhOitQ/vg+3VieuHzo1jRo2RXj8D8ZnU44E3raMr2RYk+ProKt5eUngALaIF/GxuJq3KPx2uEEeYxUICtj9f8blhRbQQVET6LDUD8NVn62+jl1IDFPcg75hyP1ga7VmxRWgORPu4i4kU6Y0kc8C5viv9VyycLcpzsjbWcUHXGkWiD5e3+jPKGyuPWzx1JjTIlpsVynow4OnTaotXe5DOFw0xCRN6yjnm6WCclo5GYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgrkD6+0Sg+M9n1zwLX7vF//KN3I9GvDilqPWeQVsK0=;
 b=CF/d2E2/2hbkDCl+5BYEdsZ5Pa8Bjcr7BLCMaj+UrL/8sjtIJv3O6gK4HMcOzd9ijx7YOLnQ2lTkzUlliwbzjs3IxH97oTQHbuU26T8XISS6CT1nM7XbRISeEiXhxkg1+Xi2BIsZce97MXAiWRaP8UIb6IUS9wywvyyT0fIMQbvcCaseaod2euGEivhlbXv+s8N3vSb642eDOo4823GO4HxyOUT917mVE7p3ar+z6d0p5kfM+lUd8QHv7istKe85yl0t9M26eObfKhoD3NNsMTqP3SzDvH1zJ6m7gj2+2q+n8JFDmKqQfUCbTQmTW9RwNGaVzyuUunJWhfgBlpO+eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgrkD6+0Sg+M9n1zwLX7vF//KN3I9GvDilqPWeQVsK0=;
 b=Tav0W2wUz5tKwwHe4cT07sTTffzrAeUR5yY11gWVvkWVlf6IPJq5kzdKd46IEgQwIgQ8+KvZVZswWft4wHNW/OYDhaNHalyLONJHbae48AW7zXQ9+HakDbV6ffDMJ6iSG0g2omWv3HK0+Z0kyr20a7bvb0uIhmMjoFzZXkZ7z0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM0PR04MB7122.eurprd04.prod.outlook.com (2603:10a6:208:19c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 09:08:14 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::c499:8cef:9bb1:ced6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::c499:8cef:9bb1:ced6%3]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 09:08:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: aisheng.dong@nxp.com,
	andi.shyti@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-imx@nxp.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] dt-bindings: i2c: imx-lpi2c: add i.MX95 LPI2C
Date: Mon, 22 Jan 2024 17:12:30 +0800
Message-Id: <20240122091230.2075378-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|AM0PR04MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: e2bf3a9b-b226-4cf7-bef0-08dc1b29aa1d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pq6Lt5C+KOoqy+TwhVReTjGWOKx00Q8W2IJlbpFoJPRuau9OUvH1zs+G7K3Qq1Pj7/Eq6RTrw/SQzdkXt5oyCZNdHtpYoU+iORxQ/XwrF/RdzJPbTqKjB64U9CutafoQFwVMuGF1OyDIZjOgF6rcDUV5if6J/EqZY26dQaxXPD+SIn6wIH5UEEfR8s0riA132wv3OgxKI4YBM7UbrOiNie97WjtYw4dhxme2VweJ/jRJPumrDN9Fyqq04rwsWRxj1B/pXPQlXuZ+N21sR8u8+g1Br+Ie8SMDXPneZCLwgzDqy+mtoxLhCqdx3NErro2LOIOGKqPZXAC5W4hfNLwB068T9CnIR0qX9I9liFVMi28jYIxLv/958nm/QdZBaExUHPhR0nyIizfVrybw5BTVg+00klwwToSInRlw9xbTaOLpHDewyyFTB3xe7HXpOQlZ/wVw4CxKxls/cQ8moY1EmDtDtgURg8sJ1pgR+lIHsVAtuMDWQf5BkMb5/60xStFTYeMMFi21THzrKfhAFtk+fJHVA9WsoA6pU8spE4CE6Y1BFGiPOv4OSLvAH+veQDaODIEl2Li1vEOi0pdwG6OBYmoRxQOLT+jz8U2U7o/1GIVVJqrxgh6+f+2rIYG2ZU4h
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(136003)(366004)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(6666004)(2616005)(26005)(6506007)(6512007)(1076003)(52116002)(5660300002)(7416002)(4326008)(8936002)(8676002)(2906002)(6486002)(478600001)(316002)(66476007)(66946007)(66556008)(4744005)(41300700001)(86362001)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aWqRdltSed72EIHHK5SKNI3Pmz/28l33/X/Q3O9C0iQItQgG7M4Ak/sn0iiz?=
 =?us-ascii?Q?aI7cexN2XhYFjw4nPbDC7mk68mjOetwfAna54RwTECA78CZzU2akq2HqkuSF?=
 =?us-ascii?Q?3RznDIGlfR6Jv7g8UITllzA8HV02D/MQ/0xuveQh1szOgzo0Tecx0mMFnOW3?=
 =?us-ascii?Q?iqUEfdUCUFlJ4pu2pI4K2ExoruuVXngdcwwKJDQocBNaVW1DSrC+bOhG6Tmp?=
 =?us-ascii?Q?+gPzDVzYO3UmaHCcYiQ+RhDElM2dD69nz5BvdWLGMBhE3RHRIjY8E9Xhm1DB?=
 =?us-ascii?Q?A+Gw+oIDs+Tt3a8A/87axhip0cglWISCXJrMSXHR7jZ8kRP3yrvG1Wni75rV?=
 =?us-ascii?Q?IYkJWx7okS9mLXBPbjWKDzL2XSV741i0uF6Wlz1K0dWReDUrhKKYqycIF/Rh?=
 =?us-ascii?Q?/pOKnQ09mMwDYFL2pgnoQGPVKsxKIw1QGOiCmyBC0f2SIfimYREtzGhUa4If?=
 =?us-ascii?Q?MZauvduORFU8ckxGsRGswIrb49C/vDcuBOeaFZoVWIjiuRV9ZzRQYLtFZdkx?=
 =?us-ascii?Q?x7sRjp0n5leJDkOSlvfav6C2J31CJjHDmNaj/pKfsqoQqmXNCxzuaU4edrv+?=
 =?us-ascii?Q?ajAvodRWyvSj6FmlQKdyYnl8yWejMuW2VpP0qQXkx+vqqundbbL0IqauU7bM?=
 =?us-ascii?Q?eCy17Yx8RSPLpcVR8iBv64lNwNFveKeG9/JuXbt580jrhL1U4gTOinQ8vTxE?=
 =?us-ascii?Q?Bv3+Qxa//brVRq+FTVVqjQfAjcXhu2ZxK30FXlsZZrsJyTYmadpCwCD7tn/g?=
 =?us-ascii?Q?adZldJwXx7D9M+h+119N/DFufcweG28iKnPrqb1qMlB1jr5VAS7a9hVrQhfD?=
 =?us-ascii?Q?7bPoYfi8VSO4HIwjp6xE3XgazGheW7ywMDzkr9+yqTO/KujW3PmjeA4uaxpF?=
 =?us-ascii?Q?yFUKHMETXDQLj8M031n28j8V72x6iPldSpSuL44006UL6DShY3FYLxoVIC/s?=
 =?us-ascii?Q?qDQaU5zVS8keXpC6PY3qDswiXc160ZB1MZKfec5/+gzip2haLFYvVM5c4bt0?=
 =?us-ascii?Q?iNcS0IrZrLj+ge34MQdkgVBqILeSdV7Hx8KEcyfAw7fHzR8CD1c4cNMkOaIm?=
 =?us-ascii?Q?mtmZHy25IYTVFxLeFei2qKbN9rnV1wVpEeV4gMhWGTHe3D5/iVNv3Hm37Ba7?=
 =?us-ascii?Q?6F0jx/ZeXZr+Dw8uBUjkEV33KzURiBWaPxlguhDYPkaV4+HRqLLxMi1su6Tf?=
 =?us-ascii?Q?P4CL7xy5E1srfQnAYWepMA4onzkSWuMNXEK+KmFOjwRgwJJLu9fLRi5WPlIG?=
 =?us-ascii?Q?7sV0nAziaVBogWFPur6UYqXCEl6nC4dGCgVrGcYOu+3RuT0AXUPUzjqD6A7S?=
 =?us-ascii?Q?JcvztiQ3HDMr6hfS0FnOFDslxXFUElXr91DGT1VnL8N9ceF+g74p286DKEsE?=
 =?us-ascii?Q?O20GN2y5nhsT0DpbCWdIS+XjZsJsjc+Q2uljKXCsBP+9QkFeZnKG1XTmAQDY?=
 =?us-ascii?Q?nX13Or6N8lnWdbrZC+FAHhKTbQBi1A5Do/zmfZeKKCdYC72j3xNu5h2masqA?=
 =?us-ascii?Q?QbrKSsGe/txwvL9JKXwbDgmRp9hq2nwocFXw4IXYqv5oIFO4Wv+9h+My8xlw?=
 =?us-ascii?Q?upW2jWajPl0DTKrUjwjJCmhGYaoP77UgxFQaLfyb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2bf3a9b-b226-4cf7-bef0-08dc1b29aa1d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 09:08:14.6437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W2X95OHQ8Yru1sGwGWMBE9kogwBFtlk9ufa4bL2vhwn1yI4N++Bl1KA04xyExf2nBVoijUgo0pXxIkcrZcFjQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7122

From: Peng Fan <peng.fan@nxp.com>

Add i.MX95 LPI2C compatible entry, same as i.MX93 compatible
with i.MX7ULP.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index 4656f5112b84..54d500be6aaa 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
@@ -24,6 +24,7 @@ properties:
               - fsl,imx8qm-lpi2c
               - fsl,imx8ulp-lpi2c
               - fsl,imx93-lpi2c
+              - fsl,imx95-lpi2c
           - const: fsl,imx7ulp-lpi2c
 
   reg:
-- 
2.37.1


