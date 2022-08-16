Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDAC595C55
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 14:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbiHPMyD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 08:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232715AbiHPMyB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 08:54:01 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2088.outbound.protection.outlook.com [40.107.104.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC8365573;
        Tue, 16 Aug 2022 05:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+qNcTra/V175NXdymZrQgEI0CegwZF1Guz3ZdkmA+KIe3/iI/Tq3j2+tLC1rLofGN3iIVe74F3AgNCTc05SM/A1YnpcYnxeEIxzd3raHEqDnyOdtmfNNjP+qZEqfX+tBK96ozgdtU5woVrkz7/PzsmB2yTUayoHAsQ6JerXdyJ7TETXV0XMDUCs4v2oACrw2igDnwBmTLv9xDKICNognGweZhco+whOWHmQsn8lVinfoRtKZ0BDmgd+fHK3OE7A9MC78O3LrucIctr1ZvKsBJax1/diJ7OjeeMi06jsjVRJ8bbzDki6pnMm2lEqzINmI91Bwx0i0bGYYV4ydYkwvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8eTydxdoRwxOFJUSFvvBci3+3nZv9fB7mVmD7I5Yvo=;
 b=hKv4s9MhOIz+jmK6qaEH2iwGSRT4eeqg79Z74wFd2K2sIvIMBerBdBZY+qKnPyEeSa7vGqg/0twV0RCPjsO9B9CKWyruPSnHamOC5iqyAN6ZDcnLPNYhTYI4CkU2soj2JHiAwsqaXG0XrdVSx+ZrruF2PVgpRSGjJeJOEpSEca2QgylbQ2CYEiqtEnTU5/YpHQgQPLgGNQqJvPgAO7LjepaJEhMJW2tFPd0NDuUjUMSYa6Rs/OLJXFaL07uljnUrl24B1sabeiO3UeBhRqUhCuJCzBdmDhqGB35VWQuK58YDS2Cnknyvhoj/l2n1l3Ybm91vDck1iDh/j1jB9peW2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8eTydxdoRwxOFJUSFvvBci3+3nZv9fB7mVmD7I5Yvo=;
 b=hVDWfau7YlgXs03XrDkRd6LHv7LL9w4OOoSvBi6SXS5CMrdImecS8j7H8ltBMxxM2bAZX2gW+6YH0EYge8YkZcYTZL1vkVXW+ogX5B7sCqo7WqC/phBOISfpfwcwFJmS2vTRMkG9feceJv9sc1zFHW8MQHZpfal1p1v4Q22WRjk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB7PR04MB4060.eurprd04.prod.outlook.com (2603:10a6:5:23::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Tue, 16 Aug
 2022 12:53:55 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 12:53:55 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 1/7] ARM: dts: imx7ulp: update the LPI2C clock-names
Date:   Tue, 16 Aug 2022 20:55:20 +0800
Message-Id: <20220816125526.2978895-2-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816125526.2978895-1-peng.fan@oss.nxp.com>
References: <20220816125526.2978895-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::32) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be8b79aa-a5b1-4ec7-2a6d-08da7f8660d4
X-MS-TrafficTypeDiagnostic: DB7PR04MB4060:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z5jtqvBy/oEW2xm5ecWBMB1eTrUrA1GzpQpMGVk+eZ5LmsPxopiPYse3Bp6Z/umVgZS/gVKiusmwsNctEkXDtYWsLVcZ7lkE5odq1v6M91uvl0Nqz2xGfaR7GB0zcf6nYvXNGDZpSLBKjnKTlhOXZmV4BTXiX30hKNtohlbAolNHShK4gMsIR5jrRXzW8ba0Cy26ymLdba7GEnDTiZFosQuUxVMRrsRAgw/RJhx7UY5MGLyKFeQboPDPMExM2FW/nDU4aEPllbPiiBDwmjK9uSqeXsHbcdjFC8rO6wSgEhe90zNV+ocGYFLKbNb9RAt52FE9dCR+spB+UW1s2CE8GGlr97HtYNwr0CAZc5+TmYRpjjATG6beBfK/BB3oeVRtT5eVjT5y1QfHndVFMrxxOpngEgcNgtggmZYUhTmg7wDB7gwu9jW9LHrPx5wa6aqhmzkfIIixw3ogrNRk+09ku2yrrgJphS0ccOryvyztlD1rPxr/d2sQHxEcYLHrAkJk4naieL/GlgbYYq/kYdunX/YJbaWmOAftIo9ccZQZJ2/5KmazNmhYRvuunxwcHHUqw1aKHFzck3n7tsh1uFodganW7Vmjd6sKuHf9tjnnDmu4m830aLjZwyU3kuAgSTWnxz+4WK4cQkeMHG9Bj1xLvEIhjj6rQugijODdH8iWicfnf4uekGLpggGEWDq5XFIeOioQgRB5l8UEqWtDTgDrFicTbBRxJdAPjW5O4rSl0OS16bT9k++1IlEH8VLtL5Ujuj0pWPnyajQo3tES68vPptar/gJb4h5uO9Lw7iMGpTgxHXfpefLLVVgfslzI1l7e
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(26005)(52116002)(186003)(1076003)(2616005)(5660300002)(7416002)(8936002)(6506007)(6512007)(6666004)(41300700001)(6486002)(478600001)(86362001)(83380400001)(316002)(2906002)(38100700002)(38350700002)(66476007)(4326008)(66556008)(66946007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hU4LkHKA/ggufv2bu5P6bHAww+WPX0sbrsT37JRFOku5EGrMi6CsbU8yIfqX?=
 =?us-ascii?Q?AEvlxKMKWEiBwVXngeAfB2D1F03Cg+6JmOpslXw+vG4jtQrFwphMg0KkWxbu?=
 =?us-ascii?Q?YnQPqLZQgYTXVra1RekXezz5AfuSz9xlfP+HjIxKeXQB0NF/woybLE/Ci0nC?=
 =?us-ascii?Q?Tk/uINHmzm6tZW2ygRcddmM/Ty0jVMhKvmucX+V1D8jky51JT6QoQBmxhr7a?=
 =?us-ascii?Q?PgOp6I80vAlPDD1tAwEFypCrx2zQhhS6oGjllsnwBX7SCx6B2L9Iv75NP++7?=
 =?us-ascii?Q?1ms98qlWEaPZSu8X17zYxBnV69uRHBETKiz4a+kdDcCdUGx083UJLLRPByJn?=
 =?us-ascii?Q?BuWyLD81t/JbDWZTS+ui0OO/PlAnhROS6npIInGYV6oIxIvqic/oixYPSfL1?=
 =?us-ascii?Q?D78Nf3QyNiVOGC4OhxnAmcPPjfOLxdzT1La3VtL0NK6tCJnTchkqOUkrvBrz?=
 =?us-ascii?Q?X/xgacvXoyRpngaE6TytU/V3xIGZc8gqHeFFMpnGBN0yRXHvLyPR/2hKH4Ze?=
 =?us-ascii?Q?cXLZkvNtVNEkBBnhqV5t4LwlbutVWk3hfMgdOarmZjUKiyA9Q4qyjt9pejFm?=
 =?us-ascii?Q?xRUGAvxGStSmTNGWhhjyd10GIyLJ1elBfd6Io4smKgLRWiaOBIkyx1FmZdwa?=
 =?us-ascii?Q?FCkCWv21ZQ9urskQMrxRGb0CqoIF4VPpI6d4qNiD+nNg7MasIelVP+bp0Onc?=
 =?us-ascii?Q?CAFm12O2XD9P+7Jmbwg5tcErZ/sAiG/bYeS1gb9jLwtAMfSLlLlu0UF3RNBE?=
 =?us-ascii?Q?pbYL7OUxOmrHizI20eIrmgE4XDoEQAY09i0HV93XuONu2jjeUm4ZLtOIMWLm?=
 =?us-ascii?Q?Fh356V/imAueTGw42Eg0lti7g780V0Zw8Iov5Na/uonPlmZ6lYA4iUigxtRv?=
 =?us-ascii?Q?5SoHnXIO6EUsKZ66K07EMHPXzJJ3mIRBDjUycQ+P4Ud5Rm2McP8gy2LQVY+C?=
 =?us-ascii?Q?TBGkWsK4KV/K+ciPPy9TRPALz4UBBoekrJMyY1R1HhgZs0rCFDCQ3Lauf9aj?=
 =?us-ascii?Q?74G+SHqqehDsS8VQfG1VRwHMc77xetR+wHqVzxnXEGoemtF6os6nI1F5KUPX?=
 =?us-ascii?Q?G4fcRi+R/FmYDUBbBFp6cnoFDXoMh3ocIaMTKdPOK/bXZIqN1zVy4OZlaV9l?=
 =?us-ascii?Q?wPuqZ9cmwR+l+xKhuGD8X9TrJHxz/OH7G/evDaXz9re3sV5duBCFc24beII4?=
 =?us-ascii?Q?uAEdhH1B+Ie9K6vCNPB0bPB162B1dHWgeNXbqv6lZAracEiMFp2PBtgzbIhr?=
 =?us-ascii?Q?jCG1lftVIgJv8BG00JWV5GjKP8GebHvhbL8UddcbQ3EVpWtNGQ7htY3QnJ8G?=
 =?us-ascii?Q?pXodJyQwAHEx7CZ++KDFt3UQ2f9rbAnQMhKZlb/17tMA8YyUyzwFYZf1RQIx?=
 =?us-ascii?Q?DodR08nduQ6CrAHLauMzdMvZ3BdjlN5CFbGyxfnhafO9UissbJBXP/9k3CqL?=
 =?us-ascii?Q?uQLb/+CF5ySZOGKRYI/xW/F/wFPRdSuCcfTY0mpGUCQkkxWuF/lp2g/yR2Bm?=
 =?us-ascii?Q?9HCR0w8dyvsdbmDB2q6k6Toz3cTkn01eV4+8c44dpQuBkL7UozPwiaBN8ew+?=
 =?us-ascii?Q?xR7y0cgPdxMVSjbRFkkC87h12UAJLXa2QRZD6lAu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be8b79aa-a5b1-4ec7-2a6d-08da7f8660d4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 12:53:55.7117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qr+HQKbIk5A4DBIvx6iR3fnxD4q63N1jb5kqdCKdftnAz1p9Kd/P8tz6GUGSbMH2iHuL0cuMyaBUYaCBKXtOgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4060
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

The clock name should be per clock, not ipg clock.

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

