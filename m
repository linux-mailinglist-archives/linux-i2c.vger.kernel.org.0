Return-Path: <linux-i2c+bounces-1968-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE9D866A60
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 08:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E42A1F21DBF
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 07:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25D31BC4F;
	Mon, 26 Feb 2024 07:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CyV1xoql"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2069.outbound.protection.outlook.com [40.107.21.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D241B7FF;
	Mon, 26 Feb 2024 07:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708930870; cv=fail; b=rXaWpnQEnoopLyJdYNBupkMyvObUjNHSjRE5X7lGsM2m8wOlvxFi12GqvpUat5WfXS88ePVaqkjtqnZktStptDj4RrnDIveDYfCJRW8yohzyXKq+PXO/+0Ehvk2t1V+0zcbSMouU/HOPvohQd2nEV5uh1a5dxu6OOitgok1gerM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708930870; c=relaxed/simple;
	bh=GNHBo8hOixSYxzcHq2V2T/Q3//CATkmZoGOZzOdLvdo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=rqFyPhvhVg67kraqanbyMLYVMkrdxpkqM70KX7Az1kcRAmnwJF2aNyl2+Gss0vgRYonNL2UsNYxhCwEL3gnf1Ou2sjwdGQQKrANWbRApLBJ0H42IstQEakzgesRwHc0MWRMPpZNxbF+pRdms91LZ6pw2wkLCQOQdpp09TopByus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CyV1xoql; arc=fail smtp.client-ip=40.107.21.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIn3/7MbvFrHN5tB3IkJepnbWQBtzoN5A73agzWnXX+MJo+3f7VFmAocmWihGjFqlQDfTSZ4wueWj1aEotqAajEG8g+dKb3uMB2FenhdPRTb0ix+odnWROxZ0JlyKtZDDYM1CLBRIwbSLz2U/5Z1RBTgj5nS3Jnj78LzkiR0geto6Fh+3Mlja3ouyoUKK7a4yBbeFMmNqFTx3OVa2TqMQ2irni89VukBPcvsyrbS0u5AJS0fh5cNhi8iB0doQPZOzb/YI9kpTNLyRQ/fv56llYUweCAtoW91MvOtxJdpaSZvoOowRLnZmam1ixyqT9Cy21Los9bUN1/B62WoT8SeRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07uOpOmQDrC/4/ObFu5LvahvI4xVwdXOw8KxGfBLNSc=;
 b=IRVppunswyPudIpfAJ9g/IiUa8/aPO+ZMMBWUvRJ+rjpsiGnXgll7fVAJtEkSslh4TONp+5KgThVJ6Rzc3ZWLPt2yQD6Nkatv7eUWncNE9xDQSuy98d8TBm4Js9KrV4L0psAQCSBEmeyhx5qe56OECFdtgAX7T+RqNMuiLZsreRfID9ZDvjD5NZ9ToLC7/H0GmZI57qnb6yDpuowbzc1ONZQufYE+T6JBaEOhOUbPVKh+BUXoPr7eisEmIxLbSfc7gsnTKL8hd7vr05SxwHcNaMLPpA1K9O5iH0psHEV654eQ/9UnwLogFXr3QD66rNjtUmkLEcHL8JJyC1qpfCERQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07uOpOmQDrC/4/ObFu5LvahvI4xVwdXOw8KxGfBLNSc=;
 b=CyV1xoqlTpiuPQFc2nuYgNfqfQ4tKHed4hFHnYAscygLHTdNGGg29f7ZdYftWY3wa+6g6gcVVhJpbSgGB+xbgel923vzvfBt1jRA0Gxyij5AJxWhfywRWL3dke1vVuFbiiWNkiImojnYNuIU/VsF2LS3mGiqxZOdBz0R36VP/EY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PR3PR04MB7243.eurprd04.prod.outlook.com (2603:10a6:102:8c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Mon, 26 Feb
 2024 07:01:04 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::1232:ed97:118f:72fd]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::1232:ed97:118f:72fd%4]) with mapi id 15.20.7316.034; Mon, 26 Feb 2024
 07:01:04 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: wsa+renesas@sang-engineering.com,
	aisheng.dong@nxp.com,
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
	Peng Fan <peng.fan@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V2] dt-bindings: i2c: imx-lpi2c: add i.MX95 LPI2C
Date: Mon, 26 Feb 2024 15:09:10 +0800
Message-Id: <20240226070910.3379108-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|PR3PR04MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 82bf867f-3187-48c0-ae3d-08dc3698b2e4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZLelg2DUHTK8LnPdt9bHUf4qFs7WU/+2XN4QNRT34+j95qjbziSJxfxnz/SEXxU28Sg7B+h7KuCGmQwjoI7reCMO+cdp03z55Q5M7O/C6+kSEWpfSUQqjs7szJUWvscFJ0Zmvl994EqcDOfAOiFf211Z/VaNBtSjO6VGPKM7hHFxFfa5NrH9jVPPSzZMadiKQraa7tHCDfhd/BYltJKZhCDKj6cDT6rV5+ReXURIhomg4IyVXURE6asIwLARcaC5qg/dXsZHMWG8V3O0o0IC55MhsYGQxW5jZGMBpg7YtvPEZGXmyN8SOvLiVq7qoR/dCk35dNTJGF51UzFuqrzGeXQt1/3yeMjNpKHlCUP1ZgNk8ZyoNm5UgyfXgoqkiOe8wRxAsmxDhPd75FsW0lyEuCgolyxyUBBOJ+X32YGxjRt/LPhfKNIjQFNtKmnl4+wemn+CXJy5+CAg2KMClrZgYTBe/jYBZoUBXyCkIZgzpZ3LpUTphb3tbz8DhOeWhhTrgcyWFmBwnIZF5RyEA+UGkpmTDy7tHcMbwuvVlghRkH3pv/7++P4Aa+V7U1ib4qd4uNO52rGOiVCT+M/ROyPtxVJYslmnbRlBbcQPAsf1Jwh57dkbNL9fbTVQHIqR/TD9+2Kj2Sefz3jwBhOSTr2qmNVymeexzNtEhKy04Yp70nMM1bdEPuGKPMC0jBbM+SqDmFOnEdKJUEAV+HyHrL7ghelIjfUii+xIgwKwyD5kTOE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dp1JBvynifrNHDq8BIgQyAY75PPXGTtoZhScJv9ozg+26tZ/ixpV9+NDP15P?=
 =?us-ascii?Q?Fsc7aYLmIaA2vZcD1POQpdBzEeXVGHn+0yPBGmZn823vyoR35Y3XMZPGd3Ey?=
 =?us-ascii?Q?Jy/wnwdpUTqESV4svzNOPU2X3l11LhWniMaDDDYCxsLHzK6reca58gbf0jps?=
 =?us-ascii?Q?xowKkVv90DXHuSOCvwpVRhC7+udesojhKvqzOeT+g9WOmHbRP5xFmqhbXgit?=
 =?us-ascii?Q?nAjjFmJWqkmRh7zCvwviFA23NO2Yuu3GT56uC3Bsg5Pm5JnlcmD7Rc0Ibck2?=
 =?us-ascii?Q?OrXREH46uocq78qdaA/gusctx0F7YoiWEtuAU2acm9YR6DqI4kx+miLDKUQs?=
 =?us-ascii?Q?dcJXtn4e3iBXqYw7LWjWoxAJyMdUyLBmLFKRfPPDZcAk5eO9GmJchwjGUqZK?=
 =?us-ascii?Q?4p4NFsVPIN0JAUideR2NPMSxOt5tlyiYgMgsXJSiA+adG9WyGR6Du4bXpe+R?=
 =?us-ascii?Q?ZMzkatpjM/MPn8rOrgAn7ilkYKaPZofv3i5EAAtBbhW6mom5F0pEOel2DE7c?=
 =?us-ascii?Q?wOzriQ78GLy9Auo5TAB3OWm5rlpbS682o5oUvqRdGW2xOzBYF/IVLMzV+oSC?=
 =?us-ascii?Q?ljYgkgdcrjGy7ep3H2Tay55xX0BW0RN3D+XCRvScmBg5hSiugnW7hMq739QZ?=
 =?us-ascii?Q?eCgFgFHAvM5mrpSQRRqB4XAno4ly3ts9w3u+lOdLr38rx+pPLwIpZJY8hR89?=
 =?us-ascii?Q?WGuAnqYfNhyotmPqOLZwh2YuwLjy7RFF0IRoMQJmalpTICfog7rs7MFKl45W?=
 =?us-ascii?Q?G1MjpFPz9r7sMbimMmFcnK82lZLiId3wkDgia1t39iUhAcTvLzZxB79EQ7r5?=
 =?us-ascii?Q?ea1X3wxp7TqDSyKNbLkm92vCJpkcdAEYfvqjaS6a+q2c5D0lyiczdp5qF1IN?=
 =?us-ascii?Q?jt9y9O/Gu2i6aXrdT0jsIfHrDtROMjESswKnkLr8bUy82jNzdQChavwNfiO4?=
 =?us-ascii?Q?1k44u2QFwzEYulldLcoRUv6jR/TiWvKIfEPgWD50/kGnENWNf0TPafhWAAL0?=
 =?us-ascii?Q?kGQ7q3r9qgIJeJvHrUNNhUARvq+f/lz0OARFT5yyZAGXei242/uZ5Mc85iqI?=
 =?us-ascii?Q?iTQ3OPTG2C9t+Tb3hewvScqPVM0EbF+hP4cmr/nEcpcENEZloJ5lKx7eN+s7?=
 =?us-ascii?Q?NqxW8E9i8EH0sYYgP5eDiTyJQoB36Or5wAHaZMOd8QR6vOmm0/k6CmHpNrwf?=
 =?us-ascii?Q?SRDf06fzioiUXuu4yPIidJob9K4vDYDlJH76w7gaFrftzVWzBrOL8MipF75U?=
 =?us-ascii?Q?XE3niqdOjB2f3QvOLzsX2yq/7ZQEHebVOoUAchNiZOvKF05b033PcglsrZWz?=
 =?us-ascii?Q?ASgWCbNchVseE+Ek87WrN0SfIoTPKjwUobu2FawYEDBUWG1Wa7GJSUKVpdlv?=
 =?us-ascii?Q?+twrxmr+KuXUqPCY8rdWRrnY8UQNp+USqAf6088Hnv2JbF8NSVvMvETI6+pq?=
 =?us-ascii?Q?6bt++zy0vICVvmWi7kE8xuzXaWRTVJyy17WRsQfZwdSTvVXdDOZDT361W401?=
 =?us-ascii?Q?xxOyLafypzG/Q7CTAZXDfeV851CtMfW3A4Z6czgb2H+98ISl8ErRv2tvVP4g?=
 =?us-ascii?Q?p8bOEl0tg2L7OULy/kJCa8JZcdaL9URsVUAcmcC8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bf867f-3187-48c0-ae3d-08dc3698b2e4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 07:01:04.7853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEhhj375O/HqUg5GMik+OfFGcstevDIYZl6xk5ajAtmmMFH0abf9np/xUovCXyR9tvPizJ8M9r0HF0bPmNrawA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7243

From: Peng Fan <peng.fan@nxp.com>

Add i.MX95 LPI2C compatible entry, same as i.MX93 compatible
with i.MX7ULP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V2:
 Add A-b
 Rebase to linux-next
 Link to v1: https://lore.kernel.org/all/20240122091230.2075378-1-peng.fan@oss.nxp.com/

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


