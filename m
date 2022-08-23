Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E292F59CEF7
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 05:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239476AbiHWDBP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 23:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239812AbiHWDBN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 23:01:13 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2061.outbound.protection.outlook.com [40.107.21.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC755A834;
        Mon, 22 Aug 2022 20:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SodtREjxDJlKYGkc2SVq5KhZ/EiQ8lHJItsop3Gz6id1QHmO5/VcsbQ3F6MkFdPNCJad5DAJG0LazhOrCJtlblMQQA+pqgJXujnTyh0ZbBDuS3FULU0XU/pPqQqBXSgVbpKYPaZMHinsEL+5S8/K8XBILsKWCjac72xs5UtTInQsyUVf++Ly7493TtlEPGoPFffHVyygC40Os8TPOpfltS61H/ZxfNl9cl3XrsJ0Fc/ga5e1JQoE7jMYa8z0JC+9a4yTsiiQlbJwtVreYSxCJx3NxQDihWdmgs5Cm8lcmiCEWPJzjYImkUEDFam09Xfl4Ac5ewWvReS4rv+dsnU9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+ZxzUzt2PqKDOb7142SzFLdvDu0tNTHEecM0eVden4=;
 b=C6XxMiu6qdkVRAkyWn5O1fchDZ5Vq6tQJjTX1cz9q9V+2zF82zAU/OqxvsfdT4vqswO8VZIGv7IILR2zCjRMrFbo7+GIkKJZ0RH8r+eWN4dixibHjVp1ITJEQ2C4A4VHx57vLAz083PKVtuqMXL146tf7GdpgWHxSmNIBzdlqseZ6tEUpmmkYxX9sRd7xxxPn2lW6JbuMow35bhijYh4NgDep7D19t9OvgstyA8W8yuI07hhXqXJRRwDGMdXwLEJZC+GxhR8S8mtaYC2Nu8Durtd/vMhqCVmlozH3x1hE8oDY77ZP86uZQz9C4vDaSmdNtYxJbe+U6zLoxpynBCoVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+ZxzUzt2PqKDOb7142SzFLdvDu0tNTHEecM0eVden4=;
 b=E9Kqps/kzXv+13v2yCujg+BnCt0CnVpddFmMELojQ+3aFjfjRvs5IlrXrV/NMnVMVKft//ooqu0du6mzsdp9XurAAkMd61Xbru8KAWs3IAozzYxj4uBom3p2Akd3RLA1/BttdCBEqwu45HjDBwZBxWuwIQaA6CVwxVWNfP1TNVw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 23 Aug
 2022 03:01:09 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 03:01:09 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     wsa@kernel.org, aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 5/7] arm64: dts: imx8-ss-dma: add IPG clock for i2c
Date:   Tue, 23 Aug 2022 11:02:13 +0800
Message-Id: <20220823030215.870414-6-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: c7b92651-e353-4062-2d13-08da84b3bac3
X-MS-TrafficTypeDiagnostic: DU2PR04MB8824:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aIIygnkuSpPrAuUcHKDaRdCk7AjCVG3gJ7qplfUF7PgcVQteHeMNaktheaGQK1gfFFFV33UHvjGDoON2UQONTKH3KVGAkHNvyED+XG+S9Fj7HpVisOh6OoBrYMgy6ZjbgiKs8qCwlwokP9Bj/uaIQp8208YBEGEko/hHIRxNh+K1wfvAvAAnv2G7fqtTk1IUP+QOoWPKavOGVSBvb7iuAT+GCaiIWq0OefB++oFHjbDtom4DkCPLcd1m050jFhNFDGjziPzqZi5lirGFEslQTshvgIK9AHKMencwf7eMc5we9+7Xn6N0LTqwqJdp1oigx80nrnIqYzNB9Kiae5SMpXfz1kuN33gJuQty02tp7EqG0/HuzSD6SKd1DnkWE9v7a2a4KRV6iuJA9MtktViWQgkA45oqIQhY39ygIjIrTGldM8sArvrqXQ9tBVrOy+11D2WZMVU/qjIghzysXR611rCH582gBxdGw0Xxmt0LISf53d/h+9PgbNjYDvJ76ueLiBOEwfhH7R3C8gVKwfwqtVgP9d6XZZxyTSXONQ2SsP5HZfy8dzTef8bRJ5x/7Y2pSl+d2T+fkoAAdVkxKJi5+W/8VipF9GyVDvb9lUCB/NJA+Xfk5R1yAUILOVg2xZSa4DcuMKGutUD1V0Yq789FEjc0vpQPsfpSM/3E9/wU0Yb5rCSHMDURD20lqh3PI5Qyw8sqzStGZ6jQhUgVdewQrh0o7++Vu/lItWbNjikq++UMo5uu9wOyuP2pgq7ywRObt9xTwv9HwjreYGZNMN63qQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(83380400001)(38350700002)(8676002)(38100700002)(5660300002)(4326008)(66556008)(66476007)(66946007)(186003)(52116002)(8936002)(6486002)(478600001)(7416002)(316002)(26005)(6512007)(6666004)(41300700001)(1076003)(2616005)(6506007)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ySdIuWyTvIc5TS0rTK7DD6EQQJ1iBAJqQoKKo+by1ZqmippYqVd39JyMTuBx?=
 =?us-ascii?Q?8juRt0b1uLk2ysDQrOz3swqGcXTv9l0iBtptiBnKdK88u867aoZqn0/d/PY8?=
 =?us-ascii?Q?IQlPz308eRq6IsE/4PpobZo0xUoCWQ6kjp/W9U57jbtsBAHFHUNkEBAHxgD8?=
 =?us-ascii?Q?AV8R8nYgcqcjsBe9GecIlFkijDDfTbDrUt0/dNB2nLhFM9VhJGEp3lFaGmK1?=
 =?us-ascii?Q?1TyYYFSsiBWHu2r5tw7HLFuFS7128M6DR3Zxw81buiPCFuGBl6XbpAqmqifj?=
 =?us-ascii?Q?bfM5VdlDNy6Squb7BYIOw4z36t4Vh9i3oX5Dgk5ljsdd1IFTQUsIOVHPCCOl?=
 =?us-ascii?Q?Pk2f1YVJvbRXkYj/7JpU75tsdhdlLzYOW4Qxa4AKNTpjD7y/seXp2pzLXg8Q?=
 =?us-ascii?Q?YznXqzpLIF4ev2YQ1Cp+gVfGvU14WkS6J8ADXq15ZJw4vb2N07u9Aylz+Cwp?=
 =?us-ascii?Q?3VhgBXrl+Fi+GqAYjtpEOl0ypFJgd9dks5/6fTQDu/IasvKCMxIiXPYvUZjk?=
 =?us-ascii?Q?ok17vASLZMmx6rPXcQykVdtGrF6XAP6Sq4mTRekbzbDUG+jHNA4rpZNbaRJS?=
 =?us-ascii?Q?O5u4zld8gSIZqYZ9upbIRKliGv3TnSaVssFMRz5ze/WBzb7q3d1iVTyd5dN3?=
 =?us-ascii?Q?xS6L9qtVXNZeBmnGx2E8ys0K8HNIllCMnM16G3fFkel9vut+GYxqpRgDfrCa?=
 =?us-ascii?Q?RDYIC5HO7TmdUPD54E4ejAsgOV7SYQU28I8Vj32zYtYDOJJnu49gqXe6dQBK?=
 =?us-ascii?Q?KtzgYGlVsPWgg94ucrF1+jhCcERXVfNolS1dfstvjOtfv1KgdvKdlldMRrMn?=
 =?us-ascii?Q?+AK//SfrQ+7k2LxJKZcDRddR9ulQv3oFvomEW2uzEKvEGRHpibtFeORf0OZX?=
 =?us-ascii?Q?iSQATd7gsYAmnGJ/zPHNLd5iy40SWNUVgasDMDxMOr1a29CVRxw6t3LY2e4n?=
 =?us-ascii?Q?cfCJbNnFcpZSNax3as0iKXlEsCf+VFQPQ/vn32BbURiZflgOAhIA1GBh8hj2?=
 =?us-ascii?Q?QliMSwbgMC2oAjw9dWSNfwrcSumVUnyOTs2nLPPktw8Ev9H6+WBI2XYMo0O3?=
 =?us-ascii?Q?gan5dj9eEUuNWdoZdCSnn2mfxVAjsvvdQao/M7RRM38BIWaDRs6LuGOZU20e?=
 =?us-ascii?Q?kl9DxZlxhsa/nn6+/jJONgC95kv9q43S+SAN8/Eo63uqBx9upgMOg1yXjy+4?=
 =?us-ascii?Q?ReJ8q+tbKqo+ukPcjLlHJLsuRCjyNAuc+fK7ZPCTGUohj298HW8mvZIw0LBq?=
 =?us-ascii?Q?W2Df/1mNBOysVEyt7YJ23b9Oy731zJ9GIOpIK6HbQ5QlcGe+3CXTW6BX4gbx?=
 =?us-ascii?Q?pAfShhCvzwrZ/0194vlZ+ofHLrmJqApewTA7kDHHxbAZW7vTZMmtDrDXbz4V?=
 =?us-ascii?Q?Q5qtdUqK90hKZj0Q5fVRIEE7UxMNbqxsSBxpjJ4j43d5ddHw7Vbsvg5WTEfw?=
 =?us-ascii?Q?5LQcxoz0BYnLtQLe0j4bBnj0rjgFirHev+RIJxP6SS42BPAIU4np6dUEmeg6?=
 =?us-ascii?Q?6NkPQpIe6/jWaaxxqBqCJdoexz7gYCFKx3iPUdq6TilCx/qkEnwPbiqxzM+5?=
 =?us-ascii?Q?zASyVXAridnwHAu4pkLT8rKuWaNGRiMyZgmc+sas?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b92651-e353-4062-2d13-08da84b3bac3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 03:01:09.5430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gd2IGEFHY3l5dwYskOlkPYgi8YDnf4oqaOF7y0ch2mMqjUcBzo9kKZQOlmwVA8D8ZF8rQnck9MM8UdpLqx5dTw==
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

i.MX8 LPI2C requires both PER and IPG clock, so add the missed IPG clk.

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../arm64/boot/dts/freescale/imx8-ss-dma.dtsi | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
index 960a802b8b6e..d7b4229bb4a2 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
@@ -111,8 +111,9 @@ uart3_lpcg: clock-controller@5a490000 {
 	i2c0: i2c@5a800000 {
 		reg = <0x5a800000 0x4000>;
 		interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&i2c0_lpcg IMX_LPCG_CLK_0>;
-		clock-names = "per";
+		clocks = <&i2c0_lpcg IMX_LPCG_CLK_0>,
+			 <&i2c0_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
 		assigned-clocks = <&clk IMX_SC_R_I2C_0 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_0>;
@@ -122,8 +123,9 @@ i2c0: i2c@5a800000 {
 	i2c1: i2c@5a810000 {
 		reg = <0x5a810000 0x4000>;
 		interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&i2c1_lpcg IMX_LPCG_CLK_0>;
-		clock-names = "per";
+		clocks = <&i2c1_lpcg IMX_LPCG_CLK_0>,
+			 <&i2c1_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
 		assigned-clocks = <&clk IMX_SC_R_I2C_1 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_1>;
@@ -133,8 +135,9 @@ i2c1: i2c@5a810000 {
 	i2c2: i2c@5a820000 {
 		reg = <0x5a820000 0x4000>;
 		interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&i2c2_lpcg IMX_LPCG_CLK_0>;
-		clock-names = "per";
+		clocks = <&i2c2_lpcg IMX_LPCG_CLK_0>,
+			 <&i2c2_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
 		assigned-clocks = <&clk IMX_SC_R_I2C_2 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_2>;
@@ -144,8 +147,9 @@ i2c2: i2c@5a820000 {
 	i2c3: i2c@5a830000 {
 		reg = <0x5a830000 0x4000>;
 		interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&i2c3_lpcg IMX_LPCG_CLK_0>;
-		clock-names = "per";
+		clocks = <&i2c3_lpcg IMX_LPCG_CLK_0>,
+			 <&i2c3_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
 		assigned-clocks = <&clk IMX_SC_R_I2C_3 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_3>;
-- 
2.37.1

