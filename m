Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51FFB59CF10
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 05:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238907AbiHWDB1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 23:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238975AbiHWDBR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 23:01:17 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F8E5C966;
        Mon, 22 Aug 2022 20:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2I7TRz5XCt0p6uThUvJNUBXSrdGFghdkdC7hscFktu3c5+782TwZ0YNeQihT8sgeRZbmuV2aiI1kj7pMYhhMwwtkD7rPXqNrgwi0T6ozWigtTArD8RM4sgRa30TZ76TvRRO7NCEwOzH0TDiMmF9zzC6tZlnaiD1y8eq+yNEsKP3zvr4OwemttdU+bPcwKLCBxz1eQZl2DIqAG1bp92SSFw7QaGAixH02msjd20QUs2aLXqRPDI5+knpcUAMjf+TwDvcbDeqOjjQ4ulOtVw+I8JLVyUYtWyfpDsiMSkl+1t6xNSDWHLbMHS/812leN/0ttZ5+L4jado/So0b4FboIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hwX/OgOnvi+oELdCsnyxiCQxff1HQ+jQVKY87xlIzQ=;
 b=oXlnOz6BjST3NROY1iMTBhZ9zgDXTifHLl9548n0Ewe+GZSkcFvYx3C12GEcW1sfwFmdghebdw1LCOOx3vHyV0jBKW2ohBTbeRK/ajmui630zz4M0th9VAmJDPT6XT4w0hCbwujRPRo97T8igY7btj+IoAB+cMikXfUaO6PlrUem4uVdJJ29kpiQ2KNFu1ZkWUbWdAtjfqWEx9Av9mkPj+1+EZKHmTPKSV4VMLBV71h28rsN87swOtLvrBC8J5bOIZ3Nr26HbLTL060YZEC76Yxr2KWGn9PN5njXHXbB7mg+hwviHCu9iijWm8Szw5YbNNIQK3N9jf3EifPymA9ezg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hwX/OgOnvi+oELdCsnyxiCQxff1HQ+jQVKY87xlIzQ=;
 b=bgZQF2UBMD9q0VVrFYno3kAaQueV5B2e85LeSo/YmvD9J7/VVQ/V+WDH6BPHmC7SMlNxl58wVBMj7nnspyT3nUtSNFYcIccK3X48SdBl64FrV/PnuudvN5R2LikHzxFThrJ664a2Cu95voUFS7NSkOQLoYmzCt7ex3mi1WR/q4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 23 Aug
 2022 03:01:14 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 03:01:14 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     wsa@kernel.org, aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 6/7] ARM: dts: imx7ulp: Add IPG clock for lpi2c
Date:   Tue, 23 Aug 2022 11:02:14 +0800
Message-Id: <20220823030215.870414-7-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0f45bcd9-ead4-42cb-1a97-08da84b3bd6b
X-MS-TrafficTypeDiagnostic: DU2PR04MB8824:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C20Dwks3fYOHSQbh/f4bLFVZSJlC7RBAyEoKVbVPP6yx89/GUe4qQp0ioGVKx6LriRfXgi3q5z2KKbd2JFkQLwStxwu64lWXmuE8DctIdrregHwUQQf0NnYJiE5/S/rbnRQN5nv8xB4j9U+SpDr4MB9zov8PplIrTsdy0GqBbVIIGmqSPzkWCCpBJG2O09hnicUW4DPQAtk7+ogh2lTwt2XOPInHXFTmrIeTPQUWA8xQpl1QvMjhRD26+nRUADvVR2nDKTzhBHHP01OKMkGI+TIoEsokgZcTLh4U1X88uEkOjHPlp/zLDE5RwAO0W795FwQtzd7SwYDQL7qVKbXBTTRJeQj23/nIu8HvtGHmHsg1XtubBMKrgMKJJxmKGXLU9w4IMqhiKi/usqGmVO6Z8DONRK/e2epVIAQRFY3U3xbV+HFvK686rot5nzfxy6uK67N4WGDLdOFX+YrfZmx1ObRYTwAhI9RUjU8c3DT353hsfLEjHOMU4y9Co/tTJUld6YbSUp39rCSrcnYsyhVGIdHsx5rxKivnkFp7p7MPQpQCW8Dy3DAulmpINZB0X5gGQkxi+QLqRd9zZdoiIV3liy4CjnrnqWN9VhF5dMszTpUajY67aaL80Zs6C/adhSZQkj4fy5UQfp4nR3Y+Kht8qpsSoxOM30bGNOMlbV/1S/Zt6WEfbBzOxqZBCdYhMUHcJeH6D7IbeVRD0rnjo6JVRTNV9wnRFZx7LX8O3gUZN57bh0Fy3bNUS5KgHHMgKbwMlvayRpVD91OFwLCPVI3FZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(83380400001)(38350700002)(8676002)(38100700002)(5660300002)(4326008)(66556008)(66476007)(66946007)(186003)(52116002)(8936002)(6486002)(478600001)(7416002)(316002)(26005)(6512007)(41300700001)(1076003)(2616005)(6506007)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tXmraU+N4K7xNByRYpAaKQXSXT0bDHkLXjDq43xU97wURXoVN83VKdfC0IrR?=
 =?us-ascii?Q?sZAevBrwJ4uEjNALVuUECsKMH+qpxYcD05NwpBXCGkCsx+3+uC+FQECBT9rQ?=
 =?us-ascii?Q?vwCD5ZawrLf2CAxckvaiKV39BhxoRA9x8Q5L5AfbnGRgDdPFL2v3+pn0Xzq0?=
 =?us-ascii?Q?BrKNGDOzh8NP16R9xVcsDfVoamFnmGVrP/AWmiasOFSFUJ5GAsEmejmbRiUQ?=
 =?us-ascii?Q?envkZvQW2x6Cz0ebZ6wIS4aA3TcsajLHH/JdIlod8CrmP1bnoYDwxNzgqGxu?=
 =?us-ascii?Q?wtGCVEKGVz1cHvfWqK5QK4dTvRRG1Fv9dibytxYltUwKl69ieh4g0EFJqCbL?=
 =?us-ascii?Q?JaPAYS7V4M0JZ4p/x3skfOQq38JuzT0le328B3aBtIUzh7Nb+k7JdXJw5hrH?=
 =?us-ascii?Q?iAPJU5JekKk6rQ40O51X0SLB0vn33jQC1Sj/2Kx0BIFFAExcNAVVJzQl2QDB?=
 =?us-ascii?Q?74uLfkgHkaAcjw9SDJE8wL669HUCcJkA6O3OAm4fZBfndzbjKuSaAh1J04Vx?=
 =?us-ascii?Q?oFqagjCCEvFALEK6E1AvFFuez7VOEfJOpWCvHexznuSkismP7laR90FDLVmx?=
 =?us-ascii?Q?x081ZOgQmi4uNr0d4Bq2fUOzU1/nGgb4Y0T5F/8PF3FIPNKkDxWsXnm5Eybz?=
 =?us-ascii?Q?ImQ041H8zJzIMM/iE2KaaxEe90KQRXj2F5rdB7t6dQzUxfmBoxrBajHf7xC2?=
 =?us-ascii?Q?DQ4BC4VwHxShyXGneeymrQ4585hWLvrEKGYMzNyoNFgMlB926BJf6m4yTlAJ?=
 =?us-ascii?Q?AGps6ESngcobbgK8aUIMipTQTiIZsUA/JBIomCfe9Y0i9KTWA/N30Rx9gHhx?=
 =?us-ascii?Q?YBLk5n7xnFjfXLkJQnd3YRpdQr1KQJ0ryrfvSEXkBkCslg6fiFBG64b2/KIT?=
 =?us-ascii?Q?jw/AUsQg7vbKH5f7L5avkA1NsnaSEeG3a1kEeQLzDeMoYCbdL3LeO+I/m81W?=
 =?us-ascii?Q?l6Dm8+Oy/Y7Uz6hqcKEitDABvT1Up7c/UTECLqGvPbtacwjzzm4xKoL/ntH1?=
 =?us-ascii?Q?APXe6iutY/CJrpWe6cmVsMImDpMmYEPys+HFaGeAWFKe9ZMj8Qywt+eDClbN?=
 =?us-ascii?Q?8cfrLumz+myONTIBWJ3ZiqrlQ9e8PO9U7KWA/LEAXEMeaulVVu0lz1u6uYwI?=
 =?us-ascii?Q?XscUNyXxZ+6e46kxj7YaXpAzIeqHGnRJzh5xGYtSSm03ubfEZWCvaDA3C2uk?=
 =?us-ascii?Q?+phvfQ+vNZb2gYUFOViDcE8F/htaEL+u2Yu43qIvwSu/49lrtmKdY/n0V2ME?=
 =?us-ascii?Q?GGfwShgEALr1AlQicEv6eFGg0GbWqITsOjaBAu0orspnGLpWhIL4jbmbnj+c?=
 =?us-ascii?Q?oog/9X20vF8ecHvtyD7PbpWVJIfgE1KQ48OUcso6OrzP4PopCt05VufBlAdO?=
 =?us-ascii?Q?FSeDK8Lf2Yuhsmf8LFuO1zapRazvB50cHZIKfyIYFqfkexPaRKBMxqKlVsDq?=
 =?us-ascii?Q?WuPkyQk4pSge+g6m69R5DJfsx2mE1GT6DbI683bJdyRARqlx6/eT+UuvvKM7?=
 =?us-ascii?Q?wiO5SYTtwqoJT15fo5H73aT/OHK0qcMllI+tztBk3vsF8mO0hp0uzy2KTvMf?=
 =?us-ascii?Q?QSarxYJkCXDb1bzg6ZLqPcwzC+YcuhsGOpJdvxa4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f45bcd9-ead4-42cb-1a97-08da84b3bd6b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 03:01:14.0125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8BLXXU8mSJXW6ZdyMEKTpLTOySy66sWiUYX0PF3QFy5aCtihlnQRreRGbfZxlfN1V9+aZ5FknFofpvN7PIH4g==
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

LPI2C requires two clocks, add the missed IPG clock.

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/boot/dts/imx7ulp.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
index 9c7abec90a89..7f7d2d5122fb 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -328,8 +328,9 @@ lpi2c6: i2c@40a40000 {
 			compatible = "fsl,imx7ulp-lpi2c";
 			reg = <0x40a40000 0x10000>;
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&pcc3 IMX7ULP_CLK_LPI2C6>;
-			clock-names = "per";
+			clocks = <&pcc3 IMX7ULP_CLK_LPI2C6>,
+				 <&scg1 IMX7ULP_CLK_NIC1_BUS_DIV>;
+			clock-names = "per", "ipg";
 			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPI2C6>;
 			assigned-clock-parents = <&scg1 IMX7ULP_CLK_FIRC>;
 			assigned-clock-rates = <48000000>;
@@ -340,8 +341,9 @@ lpi2c7: i2c@40a50000 {
 			compatible = "fsl,imx7ulp-lpi2c";
 			reg = <0x40a50000 0x10000>;
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&pcc3 IMX7ULP_CLK_LPI2C7>;
-			clock-names = "per";
+			clocks = <&pcc3 IMX7ULP_CLK_LPI2C7>,
+				 <&scg1 IMX7ULP_CLK_NIC1_BUS_DIV>;
+			clock-names = "per", "ipg";
 			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPI2C7>;
 			assigned-clock-parents = <&scg1 IMX7ULP_CLK_FIRC>;
 			assigned-clock-rates = <48000000>;
-- 
2.37.1

