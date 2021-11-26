Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00B6245E8B5
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 08:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359318AbhKZHrU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Nov 2021 02:47:20 -0500
Received: from mail-eopbgr80077.outbound.protection.outlook.com ([40.107.8.77]:45699
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1359304AbhKZHpU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Nov 2021 02:45:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zgu7tOE6KXMoB1/kbpdEMDsSjgsJ6Bl9I6knPIHIFSON0fXSZLBt7e4xsiHbqjV99bJ1E65l5Eg2lfzlNwCRNjN9DKxIxMcIVw8Gjn6TIeKLB9D9fFOBrTQMXnoSln1NZuLEH9DHwkszJfDpe7FPeaqESaHqugIPtAZHwh3ZRp7GU0htQiYj5lBeUUpkHooirBnpl6yvupC4f/aVYUvR9nLEcCQ8bLUAUMagCg5jVhcRGyqQx9GTQe2lteSe6011YqqbRJl8O9T9qUR1AfFBTSWs4JWDfXxHR7K8ki4X40uy7yEw3/0XosNL7y1wAboolL6siD1G+oqmRCTVLKCJUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibmmA+t7a31yynoN+//MS2JDNPxUqQFBjpAReDm55Xk=;
 b=Bqo5V7Sd645RObzIMBIZZyinLtGzYcF8sH4nlFkLMKuI5BXgHicEGuSPEfX6gsLbF/wY7OZLuUMMdsOk+cWJkrhlnS43on5I9g57V0i/jsoRpuJnA4zG22WPO2cq/iGNBb3+2c+elMhjVlgj0GkFuRhdBlK6thESKxkteIybAR8VmFQVZTQ60+Z7g19N58z2KR6RCj8K1S89Idy2meLBMGgtAjn6kRjDrZmKHNJV+bvoZzS1v6+c8M5hkrSdvvGuQp41fdJ/bVSiS1w3l8cgdUHiPNfMcMGZ7js0GYT3KNb0VyUoNiPzqMvPyqeXdsUXSNCKa5rerYn9m3wjvLYC1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibmmA+t7a31yynoN+//MS2JDNPxUqQFBjpAReDm55Xk=;
 b=BDUr8w/dfjusrOIYCnx5oqC23jREX0ByT1E9CqQUkRND/D1O9ZdXZA/whbRvVdM7HXNMcQtQGhyiLDGQ8Pg8Mc7uj6K2GleqjboCq2+EleNbHvNja0MCBqx5dx+p09qFUBUdXA0HtD0uAn+zPGYkAdQDd5xAEi5NVFx+RFWTbJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 07:41:09 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4713.027; Fri, 26 Nov 2021
 07:41:09 +0000
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
Subject: [PATCH V6 2/7] dt-bindings: serial: fsl-lpuart: Add imx8ulp compatible string
Date:   Fri, 26 Nov 2021 15:39:57 +0800
Message-Id: <20211126074002.1535696-3-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126074002.1535696-1-peng.fan@oss.nxp.com>
References: <20211126074002.1535696-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0139.apcprd04.prod.outlook.com
 (2603:1096:3:16::23) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0139.apcprd04.prod.outlook.com (2603:1096:3:16::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend Transport; Fri, 26 Nov 2021 07:41:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a43f86ad-597d-4084-2ea1-08d9b0b01cdf
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB879015825FEFAA1B32AA12CBC9639@DU2PR04MB8790.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RuTKKxx0VZqYvBS/0fIhi1dogE2x+vkfI3VZ+B6dgQWKb2Xn9t93ld8gaZBXbownbBlQkHTpuPfNaqHHlXTbasDDBBdfaWsvAukinbve/cEUGV1ZsbfWwtGT3mZJIZb4OzmLZEqxrMDdNS7oGHVeMvEP4kMUOFaRoNh9gZTkSTtBWVRCMLy6BKuncSeX2LkRJWAF8eGT70o0EyS3vh+wziVZewgc0ebG4X4lGpSKd+mCcyXw1dk6hGD9NTvgq6mBK61RG9R4gpPNwvGd51SjpyoYj87ClGVusow4JVbWmOv0zMI2a1A/VMnmVHLY/Dcq7/cVEpdfb5AZ4MsVyMARuUPZHZ/gwdLnuo2jwRcoxKfCnHxATG1IETQYKmtgMhdaHr6qTh2KvHrRe2odKfWQJxBvYv/jytoplleb05iwew11wDB7lyqs8a01hfHDGPiWrO5vzzc05w7H2Ra2xwA3OOFjmaaOzZerCv5ZrSMcFWtGJeIMRvSJ+kb0nuXEu5TS6do18SQ5TyAm/mAXjWiZa7fU79dbt9sM/wqYGoH/0HuHoZtSMeW/NxYzPVey5/ov8YDdvaMgRSZirn/y3TlqO1DGJj/eO51zSLtKRx2WZpNuEpFlOJRrhtpQQ2yqdQsSQi3FQ7v28wEe02ZFoachYpZRGfA1KeDL4qdJgzWZ8krQgcnD2XNIisic6ryROFsy/XUUOR5SsoXrAjTrnvRu7yZ+2IyIlRLV1wQUsbX2RGc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66556008)(83380400001)(6506007)(66476007)(6512007)(316002)(186003)(956004)(86362001)(66946007)(38100700002)(2906002)(1076003)(508600001)(4326008)(8936002)(6666004)(26005)(54906003)(8676002)(52116002)(5660300002)(2616005)(38350700002)(7416002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AebHtN7ezWA2aAVi89Bp9qRtIALJ0PpsrVvPGqEq7LXoU/H/d303dzUARw1e?=
 =?us-ascii?Q?o8KJ5Ad+AZ7jEtKuG9mvE8+00d6cKkiIauJGNy+jTl/P78U37sWTVuv15Tig?=
 =?us-ascii?Q?jQtWUiZUU91FkyfUdkdPUpxA7nKIzK+P5idCtwSEZ4AJ5ax2r7lUF3d96nsY?=
 =?us-ascii?Q?A6X+t5NdCui+wuWrR7P4N3S9zn7B9HDyLOLl4sbREF/mmjTMnSGO4B/jL4Jj?=
 =?us-ascii?Q?60681HyuG0td+LcpPSfxXDzeSiucy+Pbhu7wHquFUm79docFMT+sr2I2OaG3?=
 =?us-ascii?Q?v5Pd1w2hZFq3EiC0ESVYcC0HOV8clNGnT93LTBG3soC9NO2sWkREn8kVZzIE?=
 =?us-ascii?Q?cCPWlxfmEqImZTTkcz538+JLy+JPPHCscQWFhKAV9gN/DKMfiM5dL6v6e8M5?=
 =?us-ascii?Q?i+MWwUhgmJYbW7HGZX13tHkA+Zb012tn5CSfpl73TfeKo8n/8ICJwPkNia35?=
 =?us-ascii?Q?ojMHiB9JczrWkRf0eVkhAlribhXT0ugRg18Mpen63jnl/PTInBaA6JVeZWGx?=
 =?us-ascii?Q?Z6uB99bAnuQDu7r9EgWZygA1SFfFwLhfsQ6WUEROso7/ZcwjZwzRAHazSNlj?=
 =?us-ascii?Q?4mses6UeXuyP+DgGXwOF0N23IiPyq3LTYUhUrhkulTm0kEkkk7OfNFEZsPDj?=
 =?us-ascii?Q?b3adjRgseUz3AILKWv8JZIgavxc+VcVEOZnRms1BtaDrFI9wf9E2oc865xuV?=
 =?us-ascii?Q?l5nD+SmRwa/55hPZacIpr2M36nR2vc5fI4ttf5jg9cIyVIb+TGFxwzRhnanL?=
 =?us-ascii?Q?KTFswyvJ4kRLcLfDtrV05SxDWRWejYetu3D05skcqvYPfmQ9N1pAXdTRr/HO?=
 =?us-ascii?Q?xWP0qA4FAbNvUCDo0Lg/y8E/jGR3Ph22cqkx/eJ7Jo19rqQRVl4XXmwpRSYo?=
 =?us-ascii?Q?AscVpq9+wIhD6S+M/RBlPvT63vafqplHDmLbu4xe+fa0xOgdbOavRjKNyXS3?=
 =?us-ascii?Q?8PXd9qE6azBx4qAnfuz/aCQqPtPy/PgxtOGW3ikv+2J3LvpaJYPRbT6oBHqG?=
 =?us-ascii?Q?tCUcho3197D4wEChWChR6gFgiyr8G8OfOIRSTaTLs4foJGOC1zCcmEs8n6uj?=
 =?us-ascii?Q?3N9SgneE+2ufy2s5zkrq7hgqC4c92Btomq3wnQMvdp8KKfZZjo22ojxfYZY5?=
 =?us-ascii?Q?8av0b05yHUY7yHGKls/7Lh85l+JIK5Y0hQxMfHOS7xG52EAFcIZ1rU3LeY/N?=
 =?us-ascii?Q?EuGxuXKKRAcD1CllhwPBWqUUjcACtxbKke2L/Doqnh4MF/4V4ChHgwZqqEjc?=
 =?us-ascii?Q?OAG6RmYlpJCjd6L2+5gnEBl6rxG+iRc6O/QoVMhT+AI6J4yPhAlQXk4q30Xm?=
 =?us-ascii?Q?PR8fFJBQMlwG/Ct50juhGaK/iQ08mEePfR2Fettbg0tQsipq+vECDtKqx+bJ?=
 =?us-ascii?Q?c4o4Lq86ywVacb0mjxjwfy7V+DGc7yXelWFGGhRRV8kv2sKQ+rgCGesr2rsC?=
 =?us-ascii?Q?CXZRqlzGKHpiGfke2n1bajP0D0XJ1Syx9yZSqxqJl0BoS7Be98Dq3EPMdBsI?=
 =?us-ascii?Q?hDaQsBtOrxUxc028vHVEW1DqlL7hFR6qYuIv1OOrWdqOxCSNgKvsgMYocjpA?=
 =?us-ascii?Q?2NTqhuEL9KWecbKorm5o7U+bcKo9H8L3nyS4em7ywsJbCALk2U4H+ixWD4IN?=
 =?us-ascii?Q?LL/GkAi4ILkRuQTSkxoC+2E=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a43f86ad-597d-4084-2ea1-08d9b0b01cdf
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 07:41:09.8092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ft6sfdyr/KZuWj9kGIb+WNRC4x5YfH5r+bnjObEQZl1YvuNJ/YxFjhI41pnC5foPq/wabgPbd71gxbrqZmYISg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8790
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jacky Bai <ping.bai@nxp.com>

The lpuart on i.MX8ULP is derived from i.MX7ULP, it uses two compatible
strings, so update the compatible string for i.MX8ULP.

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

 - v6 changes:
   rebase

 - v5 changes:
   no

 - v4 changes:
   no

 - v3 changes:
   no

 - v2 changes:
   refine the commit messages

 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index a90c971b4f1f..e7ac63dd1469 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -22,7 +22,9 @@ properties:
           - fsl,imx7ulp-lpuart
           - fsl,imx8qm-lpuart
       - items:
-          - const: fsl,imx8qxp-lpuart
+          - enum:
+              - fsl,imx8qxp-lpuart
+              - fsl,imx8ulp-lpuart
           - const: fsl,imx7ulp-lpuart
 
   reg:
-- 
2.25.1

