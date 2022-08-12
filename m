Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAE68590B30
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Aug 2022 06:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236269AbiHLEc5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Aug 2022 00:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbiHLEcz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Aug 2022 00:32:55 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF439C53E;
        Thu, 11 Aug 2022 21:32:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3m0jrk6zm6r1qju+Q2j3/ghEus5cf3Kupd2CFgxqFoLpK1G+yDc2FK6O5a1oybrUJnPHuGxjC3Zx5Dbco4MA9yRVMf1h7lmnsJB4hoFdey/aXk1PdODrvKnPyBL+JKnPrSbXHWS2Fb3ZXNxDn/7HOPt3n2K3d4Cw5LGNt1pWHgApMu49fjbHtUH2ZtPl2L+15ZS4AfhC+3LGJlEqUhlSayEH2IJQoBsyuHbRe8XVdOeA1zZv43arYr3fUddvI5lzKwG/CekkhovqX3uyM3tYmSF5AkfZxcfK86zxCsoO7ExalcluecDc/ueFDqZt2jr9Tqf+tZvu9jY+mZZaY3Lkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jze+u3jX+hQkZ4Oscu2wZSE0yHzAbcmH9igX6Lx9p7o=;
 b=lahVHz2Vv145hOGa5aXeThlIId1A3E2PgIB2s+MxgTORXR9+ZALSghWAb3vp/b6hqgwmQ9Vug0/6Y+FNJ0clZCMbcVmB8HrlI36kLx54ZZJyDN9klsdmr3B/utYi0uh4BwWcNBS1gQkjes+3krXdQbXvlhhmiB85H2YJYyjRelUCW3XkNM6rj8V9FVk6XIilk5MneifPxZTohjxOvpLQurl6cZokj0U+G4KYqXJxz9bRHUrZM0Cin9F8C0zYr+nipeTFMTAHBhTwgQnXYseNQR2s6HH0J7pvSyTJAGi28zJrpmg9ZePtISeyF01nu99FDs1Um9+MMG5evE/JdSLKyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jze+u3jX+hQkZ4Oscu2wZSE0yHzAbcmH9igX6Lx9p7o=;
 b=V70wCCtNdliAlcq0Axzvv+/ljSmHA3jk8dPZQXkifvJe/MxtjqJPkmWb1D3Dn8OSyntJExyM6034BSqgnaWyzbNaOj4Mmm0QQI3e2dt/XPgLRc2DBERUdRTf3/vTBjF86LG+P7sUY3BRLQdpEmwkaiCknaSapa3R3BLu9CchQmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM0PR04MB6243.eurprd04.prod.outlook.com (2603:10a6:208:13b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 04:32:46 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 04:32:46 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 0/6] i2c-imx-lpi2c: add IPG clock
Date:   Fri, 12 Aug 2022 12:34:18 +0800
Message-Id: <20220812043424.4078034-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::12) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a266b5b-b19f-41ec-70b2-08da7c1bb45e
X-MS-TrafficTypeDiagnostic: AM0PR04MB6243:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E96eKKTjNtz0apJ5mKnDHwsbsP9acrwlwZm2i5UrwQjur+MZHrwA4DkN4TacCDbxTDLsmCBgnjRW/fjhlYdJf5XDTASQkH6Yg+j2TDtWXov2Jh6BBvJIsi7tO3IeNJDVF6SRIKdzXHqiq+eOBybkgEHlFENfeluMbeQXZ5rrc5YsHO+asyFW6BgX6UxTzwMyZJGesOwfQiS0PpXPnI8R1EbDvstU8kPhceC99eoe2wn8yev+2tzAHqEKkqbwYXrMDaNXVC3l5NPyzWCnV0zLkIFPE3BNwAhLD6N+sxKOGu52lLqiV7IXU+euT1aeYSiYRqJwQuN+Zog2nlvMU6cwT22BtG4iQCULBiM+tm6SS2qbwDbVAAI4fUYnu7DcQyPbH4tClDiTao1V5aE7sl0rekNlum6cbl2f1rdhk99a5KiU9QIfcgaoOkKL7BfsYBDQf+lIfHp4M2sZrRlTw2+lbd4+k6ZBcgV0uM9SddUdamVJoplMDCgSepqCXg6aHOmJxJq/3cx7xoVHlLqOLtMHDqVaCfeeQ5hZLtGtQaEwaOS9QTIMXqlKQSsj7CEu3Ge3ZoBl5VaLjyo8nMEzUp3EW4/GEVPxkfgdq87YjOly6uRGl5ibJWLg4gliFdknGgoIbgw6Q/psa+qy1LjchV2NjZdM/BSWYViyap9qTZ/FxgGGwqu7/lzR7zGSQ0K9YLfiBPBl25uFlPrfhwtUtaEBTDdrS70Qcfq/N3hKnLuUhkU7lJ2N8dd/4bzRrn2Atcxi78c0rbBQVj/5uq5W6L3mFdwIhQx1HIcqxVpcNR4vDbhviEgng98deBLh2tRIjun2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(86362001)(52116002)(6666004)(83380400001)(6512007)(1076003)(186003)(2616005)(6506007)(26005)(478600001)(38350700002)(316002)(4744005)(41300700001)(6486002)(66946007)(66556008)(38100700002)(8676002)(8936002)(5660300002)(7416002)(66476007)(4326008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WS3RsdYdhH/LzbfhkXx4tnAIa7lvZ42ZLpzIRsrpjW6m95L1hQ7MKIhLP6gs?=
 =?us-ascii?Q?u8StzI+WS1+CNvih3ZyQDS5tilptZHLuttdAoH7soHSc5pPBrYyEdZvC4i4Z?=
 =?us-ascii?Q?pqyyTL07rTX6CKzxtVXSurslt6r/xAoXWQp2wu503sAVGhfmLFEmh+ACVndp?=
 =?us-ascii?Q?XLzyG7uQv/Pj/jHH8xl4kBJ4I+kZklilHbQRNqnpzz/qkFmtX79dB2DsnBkr?=
 =?us-ascii?Q?TSnsti5i6G/Y2lC8LCTr3a6MhZBiH0yCYqxqjz0QoLYtt5Kl1DGO3K2PfVp4?=
 =?us-ascii?Q?ZR4JFFAXiuV3M9TyoHFWhIIt52bt5OtmlDhyRGr896fY9moAljWxFDp/PThr?=
 =?us-ascii?Q?P/Wbrj5+TeYAhDNGeM6+nnkLWR8s9wVOOyOwvZjV2DHHMSDcfMywYkiCPUlf?=
 =?us-ascii?Q?gS1oVDf8eUrHUnlQZXrrjVD4IrCVdIwUjeclDWeHH/4lT8c9KM+Qhe1QUo0A?=
 =?us-ascii?Q?CfjsX83AJdhXb4dABc+JjgQQXeSD5Wd6FkgwfpFTBBXQqB65j1Irg2NE8Oiu?=
 =?us-ascii?Q?aPeHXCG2M5Z0SrkUP8QMnZMb+QGFJ7h3GKoCbfSlLC6ozvJDAO+TYUc3u7oJ?=
 =?us-ascii?Q?l9kk6EsFisCxsAgiY9ya/eNH+nxvpA9XepbRY/hiIFF8Q5tOW4Bgwe17bFti?=
 =?us-ascii?Q?NvnDt8bYj18pA3iSUelHpntg1srfDdE9byoBFoMvlf1ITFaLrNSfmg/QySWM?=
 =?us-ascii?Q?IPOJLUwWt2a7DGE9pLnJPUReK4SuqnbSZbx9PVbUgZBKa1V2nQP/TZ67Wegp?=
 =?us-ascii?Q?TdtGZzuYXyXvBW+MPdXZ6+nkckWoVEB/Xjbx+U0dH2M5rnSVtZSz3Aoodo//?=
 =?us-ascii?Q?oEZWMd1fl7UEMUoL2zx/CYE8yj0WvbXzwsFi3fluv0TGAkPbnbkbXtA90i6+?=
 =?us-ascii?Q?8FpCVNEWBnI2ijpZ4IXO5XCTmdtoAppanH+5rm3yt7VcpVz2sN3ThSlYbocJ?=
 =?us-ascii?Q?+nu8gfhf75LCUM/XmLZtoyxxlxMg67RytvM+WpF3ECO2gAbJq4izHIpDyINf?=
 =?us-ascii?Q?7SUlsUExoDGmvAozgbKi4aFfrOm4zogIxwmGWg9ZgLoJlC403tqfF2GOHqwQ?=
 =?us-ascii?Q?qEVC6OXIxRw1PvnVUwVXuh3e7iUpAGyY8BKSZLXx9mkOOGNINgzSPCcNvpRg?=
 =?us-ascii?Q?OAIM57j+ZxAOplXOLMebVkvyR1S5wgBocaVvMTpGWfSvFpXy8tQo8G0iYyc3?=
 =?us-ascii?Q?6syMqr7N9URXANPGvsk+ECcLZhIRBVJLe7G9vIXMrjLNOXIJws2S0VblNgQi?=
 =?us-ascii?Q?nLgzHuTE8cfWV6MrShF0UAXWKFprOrvSmhWk2CyaXVVuXmjkL+Oi1o+VZ5nd?=
 =?us-ascii?Q?JHXpZvIU9GI8aNYkvdBi2TjPAEjCQeQnKo2gWbHu8zbaGcW3TLtytB1dGWd6?=
 =?us-ascii?Q?88+jKyg3ubSNrwJYMo6wcTpfhBTzG0McZhrSa8yzTrkS5+GAoqRpaH7xqlms?=
 =?us-ascii?Q?P+bWAB4FgSJESXC/rxFCUsLgvyV92D0GZilYsT4XXAxuFTfXLN015r1lXpda?=
 =?us-ascii?Q?643azIXeExXFEv9cIJchzVV8jUBT3yev9nmPbU3YkbzzjI5FvKPabEYFZ9Me?=
 =?us-ascii?Q?hA93/Fk21F93fOAwkh8IawG24S9qSKq1PxcIuxUQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a266b5b-b19f-41ec-70b2-08da7c1bb45e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 04:32:46.3550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xR/5ru2nG0OA4xlHGxW8K63PXT66afNt8YJhzkdB9Lw0GTOuLzT3TjhUUrbKtOb1KSLPnBOSIk8vlr4kfrUScw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6243
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

The i.MX LPI2C needs PER and IPG clock, not just PER or IPG clock.
This patch is to enable both PER and IPG clock for imx-i2c-lpi2c.

Peng Fan (6):
  dt-bindings: i2c: i2c-imx-lpi2c: add ipg clk
  dt-bindings: i2c: i2c-imx-lpi2c: add dmas property
  dt-bindings: i2c: i2c-imx-lpi2c: add i.MX93
  arm64: dts: imx8-ss-dma: add IPG clock for i2c
  ARM: dts: imx7ulp: Add PER clock for lpi2c
  i2c: imx-lpi2c: handle IPG clock

 .../bindings/i2c/i2c-imx-lpi2c.yaml           | 20 +++++++--
 arch/arm/boot/dts/imx7ulp.dtsi                | 10 +++--
 .../arm64/boot/dts/freescale/imx8-ss-dma.dtsi | 20 +++++----
 drivers/i2c/busses/i2c-imx-lpi2c.c            | 41 ++++++++++++++-----
 4 files changed, 66 insertions(+), 25 deletions(-)

-- 
2.37.1

