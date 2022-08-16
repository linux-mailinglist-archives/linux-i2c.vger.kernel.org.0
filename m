Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6D7D595C6E
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 14:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbiHPMye (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 08:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234512AbiHPMyT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 08:54:19 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140075.outbound.protection.outlook.com [40.107.14.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED6A6DACD;
        Tue, 16 Aug 2022 05:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7njoR/h9aQzg5xqs1HmLAEjX51PZGyPfxxkUBNSk73h68VHrHHG+kJQy/m+H3EAhmqHiAt1kzNL/NuA9zsmVIpKJdZYIAvErH6zPPAq8mIg31urnoGBzzvfW9P3xcTzQGKUacOMuuHlt+fgKN8Sp8g4Iw6CU9sVjAW4/YqUd5Ds82XtSJ+JSKS2mPoTNlNizsHdycvcyFZyLdJQbpsmNgnU4z93F/yLorym2l7b1iZfPDNtBtFA/2m9fIw2dIspLJ0n0tAnpPJSzOvih6epFYh2E+HuCVCJyq2HGjQWdw0yf1QWhFJADcabFJ2JBMnITgRTyIrcMmLZ3007L7MSYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jK6yDfbBOXjQ7MvI5RQGilV9dgA+/QW6aWhrOz8b08=;
 b=BnM9BSJDDuQrOoZsrz+IOIgf23Jpg91nd61cUnd+VfTAcr9HEB4tqkalS0NVEoNu440c+ggaegUSnfZ9HXVxtUGC7QlGxQYXIvir90GuCGCK8U0y5Ny3DVhF9aTV0L0VwXx6MDufxveC2iYN4n6TZmxEadNPjKhxfY/Gq9a8CGbIWWZy51A0DY/73oN+BhDtdJV0ensgBIa+b9beVtsq/3i9ooWaZL148G6WsHIXg/GTstiGpRQsw2Oz7rVUwKfOfEJLMg2gLjl2YhEtoWrPi98rfkqefmyRQsXcbxTrM7jHISrllPQvQ/3nmhm7QaEUN9GCmO5naSPZFshTY/SB/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jK6yDfbBOXjQ7MvI5RQGilV9dgA+/QW6aWhrOz8b08=;
 b=P7jQ+YhZgsm0DVM8MJQLUWDnRpo0i0PxztACs06wv9r1Tmzy8AsXBWZe2Y0lmIkSP92VUUrxpmVv243FH+jVUKf6g4/bzuXJ39z6H4yfwECUEru9RPwROZ70QvoLCT+lNmxWGjNoLiktCum3LL/G/ouXiqAHIjQ8LGXM07LJXDg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB8PR04MB6666.eurprd04.prod.outlook.com (2603:10a6:10:108::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.27; Tue, 16 Aug
 2022 12:54:09 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 12:54:09 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V2 4/7] dt-bindings: i2c: i2c-imx-lpi2c: add i.MX93
Date:   Tue, 16 Aug 2022 20:55:23 +0800
Message-Id: <20220816125526.2978895-5-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0fa5a625-273e-4836-5be9-08da7f86694d
X-MS-TrafficTypeDiagnostic: DB8PR04MB6666:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z4/rDdpkNx/BIu5tvtwMa05D53x+0eHYDW3vpOXo1TnMsmpO8dV8y8uqDKz/vw2GdOgDLOEcSy9+cpRPEOKp7RXAFwAAsqzZju3GBgLImE5ZVQBZyxiCrFY5nsgzGv0MAZmY0wYI8jvc8YjxZJztVNfPLd9XN9Tf5G+ORkgjrbtZN9751QDfFotB2lkLI+UPzf75sy3TakX7YGekNrYucdBvGLtv39TxZPYx67n/JyH7H9kLna1++ZxuiKijXBmy6JSRn/XxIYrIOoWHS98eaQthPM/2aHLxqsPfGBR3dya/jb2OiYgPZzUz8Id0TIp1qhSOamRrkuedttF/ocVh3xnpjZj9ebMekj/94cBD6pUz0WpudjCbOCCvF2JPRG3DKZkOc/PGS2MiGNvavfEjVrH3Lsuh7+GbFUjq9WTUjDzENknn6WAQaonEvB3M0HarV3rz7i8Y8aas+BFUQ/kVD0UA3LKX4peaa3hiPzifg1uFUlGFD8fEwuMigMdHFN9c/XomFlj3EloKI2rPPFfvXF6880bT3G8kKA1LC0zzzAg87S3LZxOnAOCnI8Ql47SKR73VKnC+aAzDDhoQSg+KSN3vuWaOOJteT0JwI0ZancJ7uwZVcn0mhYwvQXzGhzo4PhS+MSGTdQ69wFXKthvMp0vFVgy/9vBByui3l+ONZoNzJYNpZwbRKjMmlzJ49N+5f2NAaaer9tLLh9fy4wib01cEC0eFRlWjx9589DWXsnaaEzqunQLRO+pgRIvXQxJIDpCSceXC1l8U0Ic3zT13T/ehXniMtIgYrlc7q1JeGYtny+rpJQgwJH/Ux1dUSfyT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(8676002)(316002)(66476007)(54906003)(66556008)(66946007)(4744005)(8936002)(38350700002)(5660300002)(7416002)(38100700002)(4326008)(2906002)(86362001)(478600001)(6666004)(6506007)(52116002)(41300700001)(6486002)(6512007)(2616005)(26005)(1076003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MTILR3xwEorX6GAnsD2tigpNU6HMIkohkeyXv4tiEdxa7VH0Ebd38xe/Ie13?=
 =?us-ascii?Q?J8B2cLZsCsxDQOlvRXSgvxfp2QuKd6TLFOLZiAEtbOy6G9d1U6XOijuL+8CQ?=
 =?us-ascii?Q?kzQyVDv3tUd1HWfH/Ce7mF7YwoEq55ponD6rogRgWp9y2RtUq0RcXpEI6bIp?=
 =?us-ascii?Q?Tp64vHAju3fO/7U2uYihATl6Qs5/ZVFicArjrvVMx0+fGxffn6sF22lq8T1y?=
 =?us-ascii?Q?XbDBxFXysMOVmYmq2dBiQw+pz1zkBDmT0CZSAytnnej9QjL1CPrhMAHUa4Fp?=
 =?us-ascii?Q?r1PvaKfi+Hrsgl1PFXlJFa3npRHsO5crUSjCwLXipM+aS5CFwBlesaA4z00x?=
 =?us-ascii?Q?9Zi00GMu0oU+L+L9l7Y33bAfeqG/Uw2RqwT8e2y8WYNNoMvZU46MqT7nc14N?=
 =?us-ascii?Q?gtV7K/AJCXKJU3AqRFsI2oTSwivEVooEEFMT4TEkXIo/ggrPKyO3VEUwJo/k?=
 =?us-ascii?Q?lUU7Ot+CIxxyIMdGdwaULlyD2RtlXS/aewjLNZ/HtJIssbLjSwgAis40KPBN?=
 =?us-ascii?Q?OxMAWH8saUzv+saaFglyg4egas1Zhuq4DzTZH/wx5qdPk6K4hBzUaYp7DdYX?=
 =?us-ascii?Q?hNMGJSdMlbcCO/SOZwLnl/80k7SeeKHhh5gujZgy/82bY7fNTnO/OjF8Fbf5?=
 =?us-ascii?Q?ofGkQaHYcssVvRIYyvGovFhwBWl7uOA8A0HDkk3hPSrWM3Da7u9/VTAxiRGp?=
 =?us-ascii?Q?oxeVqTKHtKq2LYOHuJdV5/+7BQx3XBsCPIAnZqwQ7izi9VvemzGeJ3yXPIeG?=
 =?us-ascii?Q?YVODCh+TZD730NBYe8gQYQcwxagq5RbWZBMUkPFCliYxg7Ns9zYUYxi3MDk9?=
 =?us-ascii?Q?K0Cy6fnyygvF3EexG9Ma8m9rqgMxz0uG1cjomWGBGONI8gt18EG/1fgJm3IT?=
 =?us-ascii?Q?kJQYU/WLdJIWhFXbn+VGqN8LZ4EcgaC+0kSh48co7wUgY+y8DbET8sXZjBqY?=
 =?us-ascii?Q?T/dyvyEqdIs/Xtgj150Z9Q0NpxOhL9fnBYtV2kNv7nl2exhLoFIK3ihI5zMk?=
 =?us-ascii?Q?GCrjj4tTWFUl8Snm2u+8VQflevFA9lz5+4B74bnc55Ztc6UeqStgMAOIrGfM?=
 =?us-ascii?Q?8bJEGhpOT5TIeI41d+3sJHssXlc3Xy2z7YBU1OjnQmwMv9wBphpgx35ISJC9?=
 =?us-ascii?Q?LHAz9UZo1Rxwb9GmNkDAKTZqQ7qbtIay30euNiouKWuQJgoYNFErLc87FfgK?=
 =?us-ascii?Q?XnHk+GHKOjRh1nlevuqXGOharJ7KYVbY7HK8INUpxCjrE1vRqvhA81V0aEwc?=
 =?us-ascii?Q?aSt3ceZlEegq0wjLtu3kUECUf3QxvVvzhUGyAxxd4qSzSWpaNjdF1gEh0/AX?=
 =?us-ascii?Q?tA+KvBkIdgO2iSQ5KREBikI1Ewqy7LeOFVztMfWmiHx3AT0iMbX0PJNYVQtp?=
 =?us-ascii?Q?bwkHPoxU/ttsF+qoDJmBTGDECGh+sZrxuwNV6RG3nINnQwbn/cPktcAuOLFk?=
 =?us-ascii?Q?9hjCBtIB21EpDm3GgywsuX5VUL7x8wM5MYmcol6VfV/k081B08FKUYHAXv1x?=
 =?us-ascii?Q?pXscBfy8ZZnQ+dG8l0mdaJbioLK2C+kQlT7byOUYPkkjbKB1JlbIcNLDTdPp?=
 =?us-ascii?Q?5us3BV5UwW4KuXaxDplHk6PgmmW13gURUNRQuAcv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa5a625-273e-4836-5be9-08da7f86694d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 12:54:09.8337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNn+pIVpvbDGL+SOTZqoiC+nFfrjd9LRyjp9lnIHbCZL5g8gqCNBrFJkR/LdOz/2CsE3zad1NEqepob6VHjf9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6666
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX93 LPI2C compatible string.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index 08b81d57d7e1..4656f5112b84 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
@@ -23,6 +23,7 @@ properties:
               - fsl,imx8dxl-lpi2c
               - fsl,imx8qm-lpi2c
               - fsl,imx8ulp-lpi2c
+              - fsl,imx93-lpi2c
           - const: fsl,imx7ulp-lpi2c
 
   reg:
-- 
2.37.1

