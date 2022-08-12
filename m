Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7F0590B37
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Aug 2022 06:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236968AbiHLEda (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Aug 2022 00:33:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236973AbiHLEdY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Aug 2022 00:33:24 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D14F8A1A7D;
        Thu, 11 Aug 2022 21:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8pDNIDfrw1bueQZ6yZALO5GMJVwf96w0r5sHA9xwuxGIXw/SgXSPRamFTN1SNn24GB45f126OF0gkJFVsS/J77n0f1N1SI99gmWXS6VtSFDWOklKWBOapU1W9qMl5UG58C31DZY7PJPFyUlYNOSPDifIQue2Lk+ByMnPTVdDgCdGayWt4nGZt/EzuuHXTD1MeiIISz1i5SKzU/RDAa4SmK88IqHYAz2Tuix6kCISIDVmyYh49OAIP2PCUY4pBYQ7T/toBRFPXdRVHmPFH31UP1ySendu/4C8oyw2O+X89UO5g7T7LestgZyNgo9IcaQ3mZgIO6zweGBEs0yIwbOEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRqPpotnfQFz4Hw4ZJ9Z8fd+Y73wOxwinofWkWyDM14=;
 b=O/VT22OPW6ecix2ms0VCJ88Ul+NXHmvs6CAwxSaimu/337JJ950PdcXoE9+/8MBPpi+GyAVmwk3uA8eObSNHPO2JXAvGhEwTRAkSyci0vzGhpN3uHmmjjzKR5aUax5pAzv00Zc7IuVWejh6IUlN9CAuD1PADRuJJqhKR7tGaCtijIPVCAZRkYwXHAuypnoR/QXMUeM1Or5vLJSQ0nIPJh4HSbt1WqpvTGpRWbRgpllh0vpkUcqYdQc07VESAuPyAjyZPHzA5D5N5WQ6bM20gBRMArIuToJCAv+x8pW37Ij/DpU8EjsV2xV37+y7w1bhluoaL3GJqItMUCTES6NPlEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRqPpotnfQFz4Hw4ZJ9Z8fd+Y73wOxwinofWkWyDM14=;
 b=bOToA4QkQfAl1nmH8Bdxqvs8+1QLBJO0uyISW5xpC1D5B4eH0E25h7xUCyMH11Hr+o3Zrsjl36tIbiWRdNIAfKUp7PKpZBKJHDg5GrWSCxYaCmyil1gk0Ai3AQTOy3QGtwXOF4wKmT5azL3VOFS70g4LkgxQyrJfxONIMWIjWGY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM0PR04MB6243.eurprd04.prod.outlook.com (2603:10a6:208:13b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 04:33:09 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 04:33:09 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 5/6] ARM: dts: imx7ulp: Add PER clock for lpi2c
Date:   Fri, 12 Aug 2022 12:34:23 +0800
Message-Id: <20220812043424.4078034-6-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812043424.4078034-1-peng.fan@oss.nxp.com>
References: <20220812043424.4078034-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::12) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7911e08a-ff1b-4914-20de-08da7c1bc205
X-MS-TrafficTypeDiagnostic: AM0PR04MB6243:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MVCr96QAx4iuHYqP6gG9uwN5wJZ4anSczuYWFVUZyWchwMCzMxZrTP2iTfzQ/aEvAF2svMWxqiFbAeeHK+lXUXrUY2jCDfmvGDkERwFjvl3dOtbCJNwuycW8BkzvlONgRw6kGgu0UZgJsEqaxCPoaKI3+SOGamL4fJEBbhVX0PQbCNShRG4Ln1u56GzmBofyuVlLS+Clf0keH/iNqUQXXcAV4r0Id8IIUmhYLcBc8vjg+YArTWBpyHA56lW6bkqw6GKgHKibhqbcrCzQDx0XaqIwfZQcS/iwn84iFScMhOkhFdLkNcrZLSo0Z3VnMusAbL7P5F04AVRddsO6mM/AWMt2ImCr+iP7FHZJRFEIny0bG5GJYCFuOD4YAd7EFim96fkA2aX80ULzD87ytyPpc5sm96cVvxpTDB5hGFbF2UYjm/woUbieH2xYO2Y4/qCIXLZRsBOAGxfYM5X8tZn9TB05ZuUHTaleOQclnguKiRe6aBh2f8i5UjBeTJjH8i86VFR7bhy1JyM5R3zBtM1fT32z0vg6qdaFk0/B0tAgnpvFCRb0JIy7Q4HsdDWGsCQ1oak0zq158Jd0eq0wNjmUFKXABKNbwHgz3TxvxOS2tIlCRA4LVG26Kh0oK/54wJcP2zveK8mmUFeTVYwE33PtYOCjP/ZLVvNmmNTpsA/F7fZWnE7MhVsDM+LkCrJRrZo6gDNZI9Gacm3QIgWS83bYdb9osSqSs2hT36G5VQlh52KCzqNrFiFpJ60LAqxPh0mxQf6gGlGgLEzb+Pu5nCKLNGZKSeb9+6OQYdzu7X3rOxjSCptjbKlNyCfWFRZsgpQu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(86362001)(52116002)(6666004)(83380400001)(6512007)(1076003)(186003)(2616005)(6506007)(26005)(478600001)(38350700002)(316002)(41300700001)(6486002)(66946007)(66556008)(38100700002)(8676002)(8936002)(5660300002)(7416002)(66476007)(4326008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V2h7BpQPAPrplViYIu7KiFZhWNvQS8/SerTXJVpn9YZrwUxQu639MMuFnotd?=
 =?us-ascii?Q?n7gPhCP+PsxQ9nvYdd8IehXSfTqrxSr1EyRTJQ0wqCr4fDJSdRL8zQNRSO0U?=
 =?us-ascii?Q?7aYntYOrI0BlQXZ+Nr2XN2AEFhRvhcEPq6JFr/RTYpaFWgO0xQBv5AACeJDJ?=
 =?us-ascii?Q?EFcw57/WH7gkWLchAVp26LFlRyCqoYS9bSV9kBQBaNAMT682x00ByJEK4YCO?=
 =?us-ascii?Q?3MDo396wy+qwUGZxgxGapeEnwk3xiLgITtW6LEh0/8ybutPb8bzZ1GF1c9tr?=
 =?us-ascii?Q?Grtj2JQH9sIv2l5YTX6VeUxfuagG9WiOH9nKcMSG5Hfl8xKQVxf8sDAy0C5F?=
 =?us-ascii?Q?TK4gUX1H+QKhN6uh4/ADXT7q27ZSoLkLYzLYDjgMJZoF4CHbiYlWuFh5O2aB?=
 =?us-ascii?Q?ADY3WkFBIlFd+ObdwjnljJwWwZceY9+sag/ODf9dxLk/9qhjD9MBlgMfw5Hl?=
 =?us-ascii?Q?fEUYr4xObJJSSIbPbAmCIhcNhJqsEPYdYO1XJTAfGdTRwuhbFzFXNYDT4y4a?=
 =?us-ascii?Q?t1TaByJPx7pC/HamOfPji4fdh13P6Oe8ZVyql5lImJF4KYrYffOiSR8b74dD?=
 =?us-ascii?Q?POIec+IqPhzNIfutGQZpbRpI5NDjciVHB4c+/Wyrq4Tb/gUJdodREV/XnvNC?=
 =?us-ascii?Q?Y0iIGLMxMgLCthodgbuBaxHNqCE6BjTyIZD4u0WGYeo0VN8XsDPfP7BEhPBZ?=
 =?us-ascii?Q?5Ud4g9WpCNdTg9oPNV89rdJlOZZt59Eo6hay6T7xGyFy0m/rEex13R6jyqaS?=
 =?us-ascii?Q?eaIKvzZXZiPD8NX8q+GpyPR69WpSWC4HnabEp/kAAlD+TYSlAMBwFJQAnFjr?=
 =?us-ascii?Q?BH3phntgys3z/PAXzxi29HJqoBaDgMbyo/2x9Xz9YPoUouem9wQnBEFJoWXg?=
 =?us-ascii?Q?x+ydpHPO6gz4SOYsVE20J8Y0IY1h8qU457icPQ8tqiwmHNBKAVnKejHXHnlD?=
 =?us-ascii?Q?RmuGJ8fSlldawI0TM50roflhMVLiUeeILT/jJ8/VmBC0awIQo5JTLfMaI7lt?=
 =?us-ascii?Q?JMesqorxfwgUwAfMVkvEpLKOJZdvQmvu2rl+jhgfOMqZhGHvTqjlasKLUKmR?=
 =?us-ascii?Q?Rw02IasG0IqJlC8cpQu0CM7sAsaa+Ch9RyBVVh/vaCdHVgppsPUkZPwWqo6n?=
 =?us-ascii?Q?VoxqY7Jcu+ZBDEIeaq3Lmr8QW5i3zhpesfk65Bo0c1ZJSQA3x3WbjGnYFx2t?=
 =?us-ascii?Q?il2rNYxPp9gTzrxgYReePTAw8Njfm/JmfyGSGIxXlMWWAhX0zK34oMzIZZvb?=
 =?us-ascii?Q?LeeCvWX3uqloEqwfKQJwUe+rMoMgWRlRjwagQAv3QsTAG14iyFwB1oaYLWQb?=
 =?us-ascii?Q?gxwpFhjjpMalSn1lb1kXDev8IG2pm6nu6XMGYrBxJXCnoxxtZNJ95WCxTkPy?=
 =?us-ascii?Q?/ztlP+2r5FHoloJDJYXg3ZMsoUaCAymiP+fudwLNVMBqK/tp1gGUvLs6PLut?=
 =?us-ascii?Q?hc1KhWVVr3E1D3DyEI/Ud3TY7nJYFoZxECs0bSgHt2gYiizViP1g5He+L9Wt?=
 =?us-ascii?Q?1AgmrMALxUCGTtQytXTAXZpeHgilqpLzn+2EbknjpKP+ovLHMl9BOV6BK7xX?=
 =?us-ascii?Q?seVW7uT+UcriNaUSimLzOIAwEES46vKM9p+HmrG7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7911e08a-ff1b-4914-20de-08da7c1bc205
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 04:33:08.9610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yU2D1UPjyz53X27NgunGzxbRxf3QMUbu97jsqmQrtvS4+hwPZuNRRfZg1pTtwq0ar0l56W69UH4U3LrF6qgeHA==
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

The current IPG clk should be PER clk, and add a new clk as IPG clk.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/boot/dts/imx7ulp.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
index bcec98b96411..7f7d2d5122fb 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -328,8 +328,9 @@ lpi2c6: i2c@40a40000 {
 			compatible = "fsl,imx7ulp-lpi2c";
 			reg = <0x40a40000 0x10000>;
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&pcc3 IMX7ULP_CLK_LPI2C6>;
-			clock-names = "ipg";
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
-			clock-names = "ipg";
+			clocks = <&pcc3 IMX7ULP_CLK_LPI2C7>,
+				 <&scg1 IMX7ULP_CLK_NIC1_BUS_DIV>;
+			clock-names = "per", "ipg";
 			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPI2C7>;
 			assigned-clock-parents = <&scg1 IMX7ULP_CLK_FIRC>;
 			assigned-clock-rates = <48000000>;
-- 
2.37.1

