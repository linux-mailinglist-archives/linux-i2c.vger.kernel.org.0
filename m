Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B43744E30B
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 09:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234591AbhKLIdc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 03:33:32 -0500
Received: from mail-eopbgr80059.outbound.protection.outlook.com ([40.107.8.59]:24846
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234144AbhKLIda (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Nov 2021 03:33:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InRA+rBIQdGssSOEqmGBlDyuKC12prJ9FYGVaVWdxgf3ufL4zSF2BksGKOXRXT+egyzTACFBEb5Pk+vFAw8a74FuyYxbY0kGL6ieulJjc8bo60gpSXKTZHV0LKzN7pg8RGlaa4c1ESSsDrfJdqo6ConCPpTUXWQtCUNyLnryulcc8ZKjBqOjUTjZwRG0djB2pkUAshTBAXvAfFUr2faeYKD9GBtoqlJGlyQJwfN0okMJGP/1aMlJU1tWKF0P3UrAF+iMtM0SPDh3V6K9n6Y2zC1DVvesbNSsZ9I1oOjUqs9AY1I+BAw5zpYVzMK88O2Oq6kB2sNQmPJRYgSfrKsl3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbmsirArgVsnd8p7ZD2efWWr/1M/epfNeqSRtlcQGFc=;
 b=fQ+j6xbQB1dqhPFuYWxkAFJZ1/37P1/HiAh7qYkWOqoiX+jw7KrRsTAcWr2/CQYE5i5uv2SKLEA3iPC0uzqD6msBHIAYN9WkFvwT8fgmDN4tVE9XxMek4jEALuHitLOXT9uoslCEbEjSdCnPWl86WTwJnIvFEgLhVKQxCYQn1TjJKBsVKW/ZYgmDHL2dDOJwfCegl85ecIKWtQGqn51XmAByYv1MjbUFPdWhMRgo9QbcO5gYAltI6CGVGFXVEWvuigEbsQFl2ipeo4iHvra10L6Ad7ToSsSosslZGSnH3TOPaKC+P3ukOxqq+WTsKtija2ng4bZ8oDGHAG9WweiyCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbmsirArgVsnd8p7ZD2efWWr/1M/epfNeqSRtlcQGFc=;
 b=aYoyiwUtpH+SnGxLL7u2IKJY3alBnfeY+zlx9quDsn1gYcgGAd104pjDtEJ7Xlls2Gp276OktgVwqRcGOK9Ee0H1IG4q53om3CB+cRVYY2IpW1lH/pjnDASecx/xqdnJADOg4eKGTyyw94donDhMALKJDt94LmdpYdNZhWT0tp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 08:30:37 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 08:30:37 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     robh+dt@kernel.org, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, ulf.hansson@linaro.org, broonie@kernel.org,
        linux@roeck-us.net, wim@linux-watchdog.org, linux@rempel-privat.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Jacky Bai <ping.bai@nxp.com>,
        Rob Herring <robh@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4 2/9] dt-bindings: mmc: imx-esdhc: Add imx8ulp compatible string
Date:   Fri, 12 Nov 2021 16:29:23 +0800
Message-Id: <20211112082930.3809351-3-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112082930.3809351-1-peng.fan@oss.nxp.com>
References: <20211112082930.3809351-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SI2PR01CA0013.apcprd01.prod.exchangelabs.com (2603:1096:4:191::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend Transport; Fri, 12 Nov 2021 08:30:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a5f281d-228a-4dc6-d788-08d9a5b6b3a9
X-MS-TrafficTypeDiagnostic: DB9PR04MB8493:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB84930DB78DD22353768123D9C9959@DB9PR04MB8493.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I+hHasOIJ0rlenEkbcZOrL7CBRQ9rTKsgU8uR4phX+33w9aw7gaZuGQRn6dbiZEzaYvtbyvLu+F//wocI3hmsBolpgphCB2ghhSSGdqNpxg4Nrnznf5uVpocwwGijD2N2O2/NNKQ5hkFsjbB9ACeQRyWevEdU5Jt+PFdHofX13TkIPYMemleilYpVilJ3boddtWVLDtPJTEOpcOxU0+nE2aH3A/lvqGlUegxFB0RkHuZlLy06pu6YRa1v1kpyRnli1Zy/wc1AkCTObJTaBjZdtDNW8zP0/f1jORBaVWb0sXCEily4RFx+1/hcvh1+Kew3XNf0jPEHOmuBPysBY6iT59A9TLozQqU3Cd5wh5oNwWxAaqGJUy5MH3WiPblhOxa0yjPnIxX0ZEduxovmKVE3jgQUSKSV6HkF66N8hCc7jK5bHvgWMyAkacKeBeke+XgSP+d12pZiHZ+rPBaoj1OYjkVAd/rtt1IDrM1tN/1bMkKoJ0ZJyUIZLNGfah00K75TdoCiWt3+Eb34J1vwifoCuW3aMGbFu65GALF5GOWUBaKSDnjZ5fF0IaQP/L+TNIIXFX44iLelQNNqcVQHOPM5++G79V7M7mOOtrbTAssuGS4T/Z6i3hBJat4eUM37K7O6BAbniCYScFYbq4LRIv208N1S8U+igfNwAsJOZ4J21mDIJRdLppc+uSmrd8r120/rKiUefNRK/Vl0xqBeA6fId21FlQVXNLpstFMsWOgqnw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(8676002)(508600001)(186003)(6506007)(1076003)(7416002)(956004)(86362001)(54906003)(6486002)(2906002)(316002)(4744005)(6512007)(4326008)(5660300002)(6666004)(66556008)(38350700002)(83380400001)(2616005)(52116002)(66946007)(66476007)(38100700002)(8936002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vpIM5K99zxavulE58BoU23El4WEjj+i6gN2hsiDcUnrjiZzAPU/LgOkPILYM?=
 =?us-ascii?Q?xUQ0zee4XPo3NAtcfbPhdWP1jZNnGCYtYNfQYpiYAtKziv4FiYdTywK/jPOW?=
 =?us-ascii?Q?ADtDo1OiRcS2QyPu5zymKP910WKzVEQgVsNQ9hbI1SeNwABRkmQCkr3gunvf?=
 =?us-ascii?Q?N9Ez78w5199p+4sA9yN5+I1oe1i6lDIY+pYQDYgMM57k/7wiOeFZojBooAnO?=
 =?us-ascii?Q?uY9vUKebWwSlrMOjtcYZOhbo0d8T0m4lkzFlnU1ohLmWCxgZbY4apv50OCLT?=
 =?us-ascii?Q?g2F3OfzDNCwmq7Yvejujo1iWwNfAjsVMD6K2I7LrGtgkqUm/D26hWsItkMxA?=
 =?us-ascii?Q?zOHjyvgOy5wcMhZhTdtEUUEkVvlhegnJhhbIk9LsM56YIOPgLO/aBgSogu5k?=
 =?us-ascii?Q?G/VNlUJiUjqsywhicQX8x4Qf5HQrXr8oEhctZIGNvknRof59vr6kcfvKdAOF?=
 =?us-ascii?Q?oTjPmk1fRy7B2IZsMN/IEkUdosfedyDX5UhwwnSBFlcjpUkN+lVj55KNIifR?=
 =?us-ascii?Q?u8/nKHWmNJ5DDJkyDJckD9gPc28DC5SbpRUSkjARNj/62sOSSOR7g84LrCbV?=
 =?us-ascii?Q?OElk1DScsH8kpAif7C3fO18BTsgLjQ05gF5vGA1UZerfHGbUYZDKHjwhkvmu?=
 =?us-ascii?Q?TSofg7FUPGNdq3StJ2CgXO8TQ5wK6u2DbYnqifGJ4zs+Nmzfuokcx3sgIKvM?=
 =?us-ascii?Q?+dbBiwMAt7qq6PqXDTuBxnmqKycmIddJ4n4wlWeZUvCwnQ6ErwDNPqQiOZlO?=
 =?us-ascii?Q?JBY8t6eCPLQofpQqB1NqNCGW9GH/Nz6kO+1hqFSFYIL6HMC7sROKqCRqWFE/?=
 =?us-ascii?Q?bK6Q6wBb1Ss12C82zlogEhEy4Y0rF6S4NzfZ3a9kFiIfIxlwJwR+J7BEPiyf?=
 =?us-ascii?Q?8oksjuhm/863v219Q84dwEkYOldJP3ZH3JPPYssUgsicCe+89k1ECpuGkAo0?=
 =?us-ascii?Q?Wf1Un5fwYNIo3dfXd/1qSXSMLv02UnIjeo6SieHzZ0NLpaqN5KxidEJ0sTgM?=
 =?us-ascii?Q?0oeHlexwHP8J2XEDgpHOEIXqaHLKtpvfdkXIh+gTeovvrxkpFo0wQ8EZS1lO?=
 =?us-ascii?Q?ajIhSTdHxi8zxXttiJL7hlmu76saxR8LwUlr1q4IXzvq6GEeuPiph56ALT7E?=
 =?us-ascii?Q?kTvKd3L+ZMRBL+MRxmKSVbZVFWnmKej9KAFMat8B1JgDZOaM2/y/0L6P8+vM?=
 =?us-ascii?Q?M4UpPhNcsqO1NSd9lJadotUSqcoEm6RscTJ2v76+P2eCUhJEir+wDXfuy4Ph?=
 =?us-ascii?Q?CEmOMCk60+b0NmJzvhzKzpJDBm144liyLKPmPXHa9kAFAnDzXw/2bkb9qRuI?=
 =?us-ascii?Q?teJOIYOU10z6LtVcrlKj2IdMB41kNSu45v9UNJRDrqAbsF8baCG3umCHpOUW?=
 =?us-ascii?Q?cIv9pW5OnXv+URZpEsK5LbiRMRaOURwLyzzcD5YUxIlFqvshRWRaVKSG6mp8?=
 =?us-ascii?Q?t8+gSpV4XB2xlBonG5cu9DpgkGrSoumeVMI4QnQpuaaSgIa3Km2KW9SyEwUz?=
 =?us-ascii?Q?VgmYwLQJQtp+h9adAYRPi8Z452KXFJPlkya+NT+IpOzoGar3P0nSxSsyTF4U?=
 =?us-ascii?Q?3mUI0KtJIhL2+1TFfTVzhMGSAMP1FEWiUoAKnCkjwzD2cpeLOgh/HAd91Pzh?=
 =?us-ascii?Q?5sjYZjz4l3O5zPC4V+/8g9I=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5f281d-228a-4dc6-d788-08d9a5b6b3a9
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 08:30:36.9525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0TncVW0XuF5fawkJKfjj/pZub9T+lp4od84ROa1QRkUpyWinFGuO1qiJK86hmei8rU1PoILXSkcWX+B+1hLdCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jacky Bai <ping.bai@nxp.com>

The USDHC on i.MX8ULP is derived from i.MX8MM, it uses two
compatible strings, so update the compatible string for i.MX8ULP.

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 - v4 changes:
   no

 - v3 changes:
   no

 - v2 changes:
   refine the commit message

 Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
index 19621a2f8beb..d5be9863009c 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
@@ -44,6 +44,10 @@ properties:
               - fsl,imx8qm-usdhc
               - fsl,imx8qxp-usdhc
           - const: fsl,imx7d-usdhc
+      - items:
+          - enum:
+              - fsl,imx8ulp-usdhc
+          - const: fsl,imx8mm-usdhc
 
   reg:
     maxItems: 1
-- 
2.25.1

