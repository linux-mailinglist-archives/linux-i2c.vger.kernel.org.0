Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D8D44E2FA
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 09:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232841AbhKLIdS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 03:33:18 -0500
Received: from mail-eopbgr80074.outbound.protection.outlook.com ([40.107.8.74]:20870
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231173AbhKLIdR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Nov 2021 03:33:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjz8tB9x+b9GSEZZlsRNPHyt2nMz7bWkTe7Qer8oS+L2ota2R6UlNm7R6y+pSn4Uspp357bL9ZHq4PVeAzNHWI5J400aiosDPu+IkRZUqa1JcVCsAx5WcFh28LRxx2epqpRelfrLHabCW81cmKux8ANmIb18jcNQukFbfO5enWcL6h/TT3XrxQZ5WXsWwt4YsR2SW5+TYI0crAB98/CM00ggU6VOmnYHV6jX5TpCV5C2W525C4u4snuJBw/fEHeWezJgMo6uSluDECeJq7stHOZ17RAhLVqgCvmSYSoYDJfPIRGyf7RnNWfHfRgNtXNxpverwhPE2vQGhzTFXfqc5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pffnFuTCnDkzFj8mDogdDwzIibO3fDM/yd7MSvmkjMc=;
 b=dgzUqEJgZlxjVTDxgUHIlvr0c568tapbXzE/eH1hUVBTpYkXTXS/8Wkpj7xI5JALi6AVjPStMPuvJbK2TLrX7gYHTPZPzg4bIU+OM2TXa1IaGRXsWe5lLL3ixRYKpecENU9GqVsnq4ZzWm/rkvXY3naFkDcDhqZoA3D0Q8bRAC13LfVq4KySmhcpfNpQsi2C7N+TMqRZyQVyQDyCHJWq390pkLDh46Sou0LRr7/T5Nheu2UY6I6QoN4WURpzQwokRLOFrpOJJ+QC44Cf0H1rD4vvKelHeNL9QFZEEt5FBZh1XAAHwTCkaTJnhzaRNp62RsDIWmpEQCzeEMS25RxEZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pffnFuTCnDkzFj8mDogdDwzIibO3fDM/yd7MSvmkjMc=;
 b=fdCBBL4KeEi2HCaVVAwhjvSF9VI0A9h+CHYW1J0o1KAQuVwJL2ebiATjD1GJxMJxPWwdV4T4O0l8RXUewqhdRGCHTMBDSs0yfYtcKQeH3SUccflmnubUbEgQ3wWMRcXngeXH/5aUr6OztLF5LjlH5GlRA/L2uhGHd2KwVkMmrW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 08:30:23 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 08:30:23 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     robh+dt@kernel.org, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, ulf.hansson@linaro.org, broonie@kernel.org,
        linux@roeck-us.net, wim@linux-watchdog.org, linux@rempel-privat.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4 0/9] dt-bindinds/dts: support i.MX8ULP
Date:   Fri, 12 Nov 2021 16:29:21 +0800
Message-Id: <20211112082930.3809351-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SI2PR01CA0013.apcprd01.prod.exchangelabs.com (2603:1096:4:191::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend Transport; Fri, 12 Nov 2021 08:30:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6988502a-040b-4525-6f5e-08d9a5b6ab4d
X-MS-TrafficTypeDiagnostic: DB9PR04MB8493:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8493BF5A1DD13FBE3FF5D89AC9959@DB9PR04MB8493.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wEsKwwiBaN9C/xmdC3SFz6pWbqHaBCA85xlJv11Tz6amUtXky67+7IUAMRCiJGZHzqCsgRmuSOhs+AH7xggKqvfbN+a1kRtegi6cJ54ldtncbr2znRK6iSL+OklwCPAEyDORWaJSPqM6rbXRAFZX7zxBeKqRpJlTCTooUaSLdu4PU/jmXdE4+qqSe0ZEufnQ3b8ZEg9U8Z51WxQ/4vSOZPOF7Vza3RZBa16pkjkoWeiyk7EcXJfDx1unGC24Ch9Z7WgdLxDWEMT2UOlHDgLLaMk5kurDwsIxWr8TcCcBXp5X6zq5M4xIZBIk4kgPNgWWgxI+dR5EbliBW61yy2IXKL4DP2E/4L4gGbkZEAxbkCwLS091wIV3imwoIWijH2tCbw9gZwsCBPX+I1GWw/Wgzvu0VYspMWza2V8/gsnvr++pZEpVfwlWKB1TIX4Dvf9+hs+qJf9eP/Tnm8f+jd+0qnZsHBGaauJAPCWAHBdF4DleeqPefASbv1k6FfyTRMWWdG7dZGcJgXqNTofqg2RpUQkLd0VezeUZLEVTfCNFQwsTjU1Od9yq1Ai6xHh0b7p8bstsFX1KcyZdXXjsHo2kKpU0Ado89z+E4+gNQ9yaa5O6PVGJFc8GgiCuGstc1YlXgkud6HUD3pd4vjtRK32s2G4q3V7ZG9E/JFw77lry0LHxf8KOood9ecSnnE6eDkiTupNaSPaBRc3IVHcp3OKc+5XUvq6vfped/MO0NGxAgIl60NAyEn265df0pJ1+KMPb5oDRiQoRs9VaP7beBgq3ul/sHf3BQW5N5aLAWc4c15Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(8676002)(966005)(508600001)(186003)(6506007)(1076003)(7416002)(956004)(86362001)(6486002)(2906002)(316002)(6512007)(4326008)(5660300002)(6666004)(66556008)(38350700002)(83380400001)(2616005)(52116002)(66946007)(66476007)(38100700002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d++VYwgTX7AOGWN701mkSz+PGU/k5r709qfcQjjejJvjfzu8xy6ncoa3PS6r?=
 =?us-ascii?Q?QbmHrs4Md8DLzuUpDkxM4S4DC5z9hQKfmxxp8jYZRJaOwx3JqJblZCPX4tIp?=
 =?us-ascii?Q?bnt1+lDOmTflr+uMyI0WUCUyR87NpeQXkIPETFpYFh8IPu9uLKOoYAt8mSqs?=
 =?us-ascii?Q?lYdn67+1YMPAMimfzLj5Yw4hV5wLOTgIa5z5L3sdjPNmKc7IkemxEv6wysT6?=
 =?us-ascii?Q?dj3s7XWRW66UQefWLJ7KEMxciFoZnbIx+l03OWcLYIXCVT22g3Mlb4hnk0Id?=
 =?us-ascii?Q?QjZAsli3mYaXOueQxwRAV7cheG66TQ2CinEafVr7MMg7lW11cLL79pdJ5oQX?=
 =?us-ascii?Q?WJVkF5H7gXU076xnEWdvWoos20RHpAS6k+01trGdBubyjtSamcJjTTnehdDu?=
 =?us-ascii?Q?tUNjGeq9Y30UITzbVEyVwr7cYFtXRCShZjJBkldCRK50f/QrCpeEv14y8KPm?=
 =?us-ascii?Q?uMtA6Kt9E/eS3pawIuQ9h7gpPGd6d/GSzVrZ8cbTjUkTqm0jVEiniKCMSxYe?=
 =?us-ascii?Q?OdVWdvmBMYw7kAX7eqXHwa8RNYJEL3Ypv7maZXhz377Op7K43xZrEYTXIEe2?=
 =?us-ascii?Q?yE71uVO3vbGpoGGS3C3gL4ldBFgyupQIRYxuxnR+AE2Hqec+GRi+5whGLfoO?=
 =?us-ascii?Q?3zzVqCMHM/Q9az1m4+gsV90hCcQzw6u0m84UjfL4iLayY2wvhHq6JOxjpPEk?=
 =?us-ascii?Q?HcL/RpZSd53y2T9YXOr5gB9sh7aGs1kSksER4/hBnO3JhGmKZGCu8oV/si95?=
 =?us-ascii?Q?hEFbuKu2aVqCJOzvVia5xu9myfgsvkheHJL11lfVCv4+rjhglGSUPANMLwsg?=
 =?us-ascii?Q?e6yeVSqnd85vQBOF6q72fS+h/T8rDpAiq5FMCpCdKlS0cl7+Wo8Tjd+HrW1n?=
 =?us-ascii?Q?s3gSff7MlQoYHwTKcDSh6MCvLg9baflZgfG5/ZOGNOrUXjppjSlAhjgQnc3y?=
 =?us-ascii?Q?oy60+ClSujaHR/WyAZRBcTfg66v6ZhyQ+3uANrN14edyYpxG5iZnrR3OHfYG?=
 =?us-ascii?Q?gd30t/Vy8WfGzb9xpXCRUSY9AXtjThD3hormM6A9LEpPedFl7NSwiT9GHo2k?=
 =?us-ascii?Q?Gm6E2ddzACjG5FNjO7zQSj1FShom2hFFSdebZXe5MgIkLnmSpT3Gke3cpXe6?=
 =?us-ascii?Q?LNElK7ZBbMy4toInsNUQB2Q0S7do49OiDS5JQzWsWpBSQOeVep2gGnbm4+32?=
 =?us-ascii?Q?2bS7ZoWKaokex9CEpoIWkTAMAn3qg0kU1jJjkpM7kbouqSPv45aR+QBkNMjK?=
 =?us-ascii?Q?59/qsNNm9o8bU3WOToKnDdZ/AYPDl33KEMcYpg/pRYpk5k4ADLuEJHrn+Enn?=
 =?us-ascii?Q?zerfcSY4r1KBBXzpAg1F1IjJn764iZCmW9v74wq4+8MTYtxei8VJ/UE0p0+m?=
 =?us-ascii?Q?8qHHGZH2OG52Nn66LUZ6G4YEJfx9SVKog5CnfIDH8+J6r03BrOHryJYW7SIT?=
 =?us-ascii?Q?R9+zEZwJqaveW88yAeDNnCei+tmv5t39TY2DvHA8ykqX/Vmoo8Jw8xY0voey?=
 =?us-ascii?Q?NVrhUZWem9wzma6CozycacPyeZgsRtuk/eRCg9pvEy6kUgwD/j2sKRFKllY6?=
 =?us-ascii?Q?nEoEMSPBDb/aChWwLTwxSnmZvZOYdiN5ZguovyYbpEv33jvWMem/hFdm4KUk?=
 =?us-ascii?Q?l53kMkPYBvM+QK0K1viiLR8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6988502a-040b-4525-6f5e-08d9a5b6ab4d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 08:30:22.9242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5PdS0IN7PW4SXgA8FFnk6mE5jfSvTYHwkG9E0+FWyFOk3XpbPuLaI7y+Qh60rBcXv/wxZTccxoCsBfnVQTLQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

I just pick-up Jacky's work, rebase and send out V4 based on
Jacky's V3 patchset.

If you prefer to split the patchset and send single patches, I could
resend one by one.

Note: the V3 has a gpio bindings patch, it has been seperated and
sent to gpio list in a single one per Linus requested.

This patchset is to add i.MX8ULP in dt-bindings, introduce
basic i.MX8ULP dtsi and basic evk board support.

The detailed version changes are in each patch.

There is checkpatch error in patch 8, but that is for device tree macro
and we could use use "(xx)".

In V4, the changes are in patch 8, 9 when rebasing to linux-next/master
,fix build errors after the clk driver in tree and drop a few nodes
that not have bindings.

Tested with CONFIG_CLK_IMX8ULP and CONFIG_PINCTRL_IMX8ULP enabled.

V3:
 https://lore.kernel.org/linux-arm-kernel/20210625011355.3468586-6-ping.bai@nxp.com/T/

Jacky Bai (9):
  dt-bindings: i2c: imx-lpi2c: Add imx8ulp compatible string
  dt-bindings: mmc: imx-esdhc: Add imx8ulp compatible string
  dt-bindings: serial: fsl-lpuart: Add imx8ulp compatible string
  dt-bindings: spi: fsl-lpspi: Add imx8ulp compatible string
  dt-bindings: timer: tpm-timer: Add imx8ulp compatible string
  dt-bindings: watchdog: imx7ulp-wdt: Add imx8ulp compatible string
  dt-bindings: arm: fsl: Add binding for imx8ulp evk
  arm64: dts: imx8ulp: Add the basic dtsi file for imx8ulp
  arm64: dts: imx8ulp: Add the basic dts for imx8ulp evk board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 .../bindings/i2c/i2c-imx-lpi2c.yaml           |   4 +-
 .../bindings/mmc/fsl-imx-esdhc.yaml           |   4 +
 .../bindings/serial/fsl-lpuart.yaml           |   4 +-
 .../bindings/spi/spi-fsl-lpspi.yaml           |  11 +-
 .../bindings/timer/nxp,tpm-timer.yaml         |   6 +-
 .../bindings/watchdog/fsl-imx7ulp-wdt.yaml    |   7 +-
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 148 +++
 .../boot/dts/freescale/imx8ulp-pinfunc.h      | 978 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 469 +++++++++
 11 files changed, 1629 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
 create mode 100755 arch/arm64/boot/dts/freescale/imx8ulp-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp.dtsi

-- 
2.25.1

