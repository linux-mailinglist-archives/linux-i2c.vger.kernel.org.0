Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0B759CEF5
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 05:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239152AbiHWDA7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 23:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239801AbiHWDAx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 23:00:53 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CD105A2C2;
        Mon, 22 Aug 2022 20:00:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgeH21hCeK3ODyVatMbhAt6mxCoCs2gwceE415qq3bWy9joufkqgzVrLrS4ZPrN24tk9XFbTCzrg5q11y+rGdCgui7PnIQZH1BRPsJCtl0N6beKjP6Awc/+7SaucXw8CSc6EdILP/eGmJwDN1ONtb3Y50eRb+VNQPji89XPdmcTcdc8Dx09aziwY1XgjfOD1wGaDS4ESFg+22ypacl82JlU+9pvZiOFhEQw5l4dhetm1FzJwVRtgl9J8kbPQxQ9XIfERpX26RJdMuWo5rwvsQgvLvwwe4otsF4ZqRynThVcG1mDqRNXVKhWmtDl69mgeUoj7H9PlCuvZ+kAeIKCKmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjqA/GdmEKIQxj7dGuQzsGf67nAbuH1s4Jy7bRMENmw=;
 b=dRjh3gSGF+6/2r18nclxF6sb1Z6TCelEPvcs1WYLA+w1engtwVzW5EjH9bLcq9CGFBkiUro0T4nlh7o3pxEJfFU6TNq03rNOcl0MX6EMqLKta8xqauXda8jbbDuWuUfLzIZ65JWsvI1uX78s6P6Ubk7q0xGNG8B7mI7xCzL0sew+VAI7+8SeCq6DeS+7wBmIycsJfdqg3DYjv9gk7cD+45gI3vF+6MeIW9i1IaD135tIUk0mOvV9Hl/Pwoiv3TQ+BsWxAA3p5h9OHoyAa36tmE9lLVxuvd6lqD2vOk7QkPkHDUtS3gUzS67e+QS2D/IWjj+reHVKVI5wHBRP66Y/8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjqA/GdmEKIQxj7dGuQzsGf67nAbuH1s4Jy7bRMENmw=;
 b=fbITCbLT4oIfnqSU19MulNH+D8oyNrjvnEaGscmI4yfndXqqY1PH8lo4MmlNcaj2aHHuyXVtDavWbUVQnVzXPTBrMw46zSzkjcN7QzZaRR6lfUPxCyy3qXm9ww47ljsRvEZjoK0GStJnbeECARUiSkxm3BxeMORj3/KOipryVLM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 23 Aug
 2022 03:00:50 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 03:00:50 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     wsa@kernel.org, aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 1/7] ARM: dts: imx7ulp: update the LPI2C clock-names
Date:   Tue, 23 Aug 2022 11:02:09 +0800
Message-Id: <20220823030215.870414-2-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220823030215.870414-1-peng.fan@oss.nxp.com>
References: <20220823030215.870414-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::36)
 To DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f7f1cc1-b5a3-4026-ef48-08da84b3af50
X-MS-TrafficTypeDiagnostic: DU2PR04MB8824:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dNNYOenEDt94CeYLaGE5HSeo7dawCJovnyUuwjXEWzlPVSFb6QbigMImWdBISkbe35Y4JMEE0ozd46+0QqP8EWv06NI6VQ9LF7vuHsMm/l9G1qy04CBnQR0inRn6Avg0WqyXllTsITfr221YDMHMZqi4bpnEqmxCNnLcnJ7XPROCYoUOBGLm8yu7Ne3hvcpohs7faJNJaxBEnpC6/eCDwvNTAJljbarZXiAyJHNlS+UabVv87xbP81od0XwOLZWjT3qoLhT/PBaV3K25ntLaJkjRTBTyWQkj0PnSWzwdF1BtqkFU+7HXOREvgmObdwp5SoeaT2F/b4yrCaLnMwvrzY//8B46P/REFYAJE5mGPpyRAidbJsCBr+G3NWokk4MoNARJIuJ9P9d2tKZ4OrMZ6URLxS0YFKtQRKVeeC1IYwtyPDtCIjr8+G3JNa42RFbwS4/Ahm2wsZb1fE8HYWJXUjWBHs9zIfeyQMN4N8CJUx0mDzbUQevjtCsLRxQWF85jn0lOveuYnaCiWFx7maHGn4L7Qoso0Dqu6CcTgem0LXzww3uSwWAaTta/wBZfw34JfQ+WcWyOO5bX5KnG1jd9XdgrYUpNfGxgoyw6rAURryMNxhIxWA823HQf8mJz68RapjgEfdxI80Mk4OxL9P743tNxFr8gWiaJ2e3yJySOFLJjBkqGEJ0UszgkRe8IM51uNhx7hIeO23Oupn5EHp2KoC4PflH3z4UG9KfUq9+WbHNU856HsL8cxDxO4qugJzdz7d33FHu8LtrPzDCRq+MCzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(83380400001)(38350700002)(8676002)(38100700002)(5660300002)(4326008)(66556008)(66476007)(66946007)(186003)(52116002)(8936002)(6486002)(478600001)(7416002)(316002)(26005)(6512007)(6666004)(41300700001)(1076003)(2616005)(6506007)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XXdLyVqwOJA/wZl/GKxDiZ13u5xtCeTgRmiDVMPgKA7WmCn4UtYOVK+1mFvL?=
 =?us-ascii?Q?2oPpyJTXH5iV8KQHGPvS6E2GxE5YAWu+TZM9i9Joi+2TuXGrePgq4Er6zxBp?=
 =?us-ascii?Q?ElwojxjzH2oGrMaCfYhRCz/0f2vG/aeN9XzTs+qmzXW/hU6JIyMu5bwngA2+?=
 =?us-ascii?Q?n3fAn8X0Pfl2SRyimfv9bkGdzx/sFI2tbyIh4VSp32X1ffSmhfSnsWvxCj2q?=
 =?us-ascii?Q?cnnypBzFbYN+DlPtwS2T8dAVBxwyQdYfuMxGgjrf9FoaLf+hH8XJXdVbjyFO?=
 =?us-ascii?Q?x0KDhnLGYkjyfZJ9/OInlx7SJky+kaa8tnO924vESZ0jqRCITYYIxJEbfa4m?=
 =?us-ascii?Q?FkjmGddEGAVw+Tq1ZTe7383Tuu6UcYkPfcgsXqEF4MG2zh67dhG6ETiD8QcX?=
 =?us-ascii?Q?ephROs05z/v/CaHlDhhKfjgzKiyHX5pKUdW5smrWEWklpdDWn47piPbGYLXF?=
 =?us-ascii?Q?ysqu313BueqpsPMkgFBBZDXXaspi/rH4IgejyFVACmMzE5Br0vP04W8oSLVQ?=
 =?us-ascii?Q?vYbaTWAsRJZ0QjNPlE74JqdWrEC4j5t6pHMrKacE83enKsznNNO3Sn/Mc4h+?=
 =?us-ascii?Q?BqJHddyQM9WiWNvPpfxNlEo5U2y1WhBfRCE2UoePj+u12J5/v3G/MWIpCdHP?=
 =?us-ascii?Q?T00nNR5/BsqFJvL7fgdk9mXVrWYGZe0+KCh2plmSn0Dye+7zGrK0fQy8gWcz?=
 =?us-ascii?Q?bwMKTjOueh2kBxFgiiqMtHIbmEJfuh+x/3TeXJgjNmE/dsWjAVptPFtrCESh?=
 =?us-ascii?Q?xrx5ld4+FwyHnou8N42KhRc6dX52+SoE1gaVMebrmFy/Ndzqs33ObqeoHCbw?=
 =?us-ascii?Q?b93VocQKoekpbyL8lzOqEUD8y1zFqlXl7/melejocO6+2/HmBAsAoZw1OzgW?=
 =?us-ascii?Q?AJED3boPX7tPI6TrxZJ23LrhPhMoTrI5/WH1jEIojumuVTunW9rebzR3+onG?=
 =?us-ascii?Q?3mAAJal9/bZ0k9EHzmGQifiNMAp3TotpvLv6QLnc0ZKdoBzR2BhKXPdLSL1L?=
 =?us-ascii?Q?47Lr6sFdB01yT1U7ydaQz/yr5FPeLbJFZde/sgnTaDrz24OGzX8v654iYRZZ?=
 =?us-ascii?Q?zBkwJbcMzd3/WvQGWMTnwjHYXElWYXMHNJ2aZAEsbsRVo0BdB/H5jx20FiFn?=
 =?us-ascii?Q?fi+8T+re6byOdMNtQbsdbZ4tkXiDqGp3vdpyoKG93HIe4e+WM484ovM7vJwZ?=
 =?us-ascii?Q?We0YC8wx156kflFDQIY5I3/a0LPLqN2sAOqXyNu4b1ggn9G5T3EbFcZyUwHN?=
 =?us-ascii?Q?P9o6mBzGGlvOJpo71p3WuB8ZdDO+DdOKORnJwVPt4BVtZ7qHVjs7MJEPWp7D?=
 =?us-ascii?Q?ilPoaFerflkxv+TPqlQrJjTRYdr0sjxXtCQpf1I4CWhnoovH68W3HmB/JJKK?=
 =?us-ascii?Q?QqHP5Yyg9dEX7aEfsDEhUCxCVqQ9upMbix+pd0AUdUXxR/ROXn8OCTXZ0ulm?=
 =?us-ascii?Q?oJB5GEihZ5ZRws4p4GDPJA1d0zaVHL0FO2FOIq9c08Ehs1rHOKxxZaMzMNHV?=
 =?us-ascii?Q?JYSuoB0J34RoeR8817WbcoWlOHfiP23KvbpbDq4R7mf0L0Dzzk+PYQpqV5uz?=
 =?us-ascii?Q?HYUNVC4RPKpoYy28VZWHOl5Ih0v0a13jITRpzwFz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7f1cc1-b5a3-4026-ef48-08da84b3af50
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 03:00:50.4800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOhS8cFe64DeUY5O/DJP11FrjqHISU8+ii38ENUknw47IQFkBvoxFDP5xhAW5IE6S4N8DJuR+hkIHdQMdKDJxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8824
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

The clock name should be per clock, not ipg clock.

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/boot/dts/imx7ulp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
index bcec98b96411..9c7abec90a89 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -329,7 +329,7 @@ lpi2c6: i2c@40a40000 {
 			reg = <0x40a40000 0x10000>;
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&pcc3 IMX7ULP_CLK_LPI2C6>;
-			clock-names = "ipg";
+			clock-names = "per";
 			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPI2C6>;
 			assigned-clock-parents = <&scg1 IMX7ULP_CLK_FIRC>;
 			assigned-clock-rates = <48000000>;
@@ -341,7 +341,7 @@ lpi2c7: i2c@40a50000 {
 			reg = <0x40a50000 0x10000>;
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&pcc3 IMX7ULP_CLK_LPI2C7>;
-			clock-names = "ipg";
+			clock-names = "per";
 			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPI2C7>;
 			assigned-clock-parents = <&scg1 IMX7ULP_CLK_FIRC>;
 			assigned-clock-rates = <48000000>;
-- 
2.37.1

