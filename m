Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDFB1590B39
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Aug 2022 06:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236926AbiHLEdH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Aug 2022 00:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236844AbiHLEdF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Aug 2022 00:33:05 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2078.outbound.protection.outlook.com [40.107.21.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B1A9C8C6;
        Thu, 11 Aug 2022 21:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPSquIZlsaapQJtSSp0ehCLbxo9FklVeDyU1oo1v/vrFqcOVyT6Jhf+KJUHOvJcTWj+svsVp2FQ3eTDjVsCQwqMEgZ48qBiwV4COzvM9isl0mTDinX6k+73V9rVloLPRQW1cf2ziZpxOytE1zQ4l39GYmIHYteE0EXoFEetdqiENCv78GV67aduVmdEL9EJLgfr87n3j8f02V4gw2e+3TE3x4ruTy0eKKr9xLxUzUG4Dqn7ZqdG+9kvfsKJaTgr2oUCC2Qm5mo3frB0qe8RrARgf4Gu8NDOjjhThOBdX/XbKoWtHLRf2ud2XLoatmC4NmKMFDmtTUW0SX+A1fPbbRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tVZ4dgVoZ62UQEOPSuhoLMktMmIXcWD1WLzWtvxr0U=;
 b=JKWoxzFDvk9OG0bc9KuN4MitP5VdvSzYXnqNRyHJrb/0JyifAzSObqrXIyQuv6ZxUdS4oktyQ5cb33dmrMubXuWcEi2RdeYpJbuP01AeFayMONdTbvBEovuMoCnM6Qi34q7i5JUQ0dGlyT1JICfrEpdGtaN0wQ4NqIVgHxFq1YQwbsqSzrV00S0+cH3HyODyqYDs7a+7iHXGfaMEq0rAzJgLLrjaLkOZsnw+qHK1v686Pu/CybENtMTc2c1UV7COmEoEgobct4LgvnJGYzKnixwuF/EO8uhRtG45owrw3G79XMxj5+DVmhCwOkDp3uN+0N5sDxRUWDHp8IakcwPEYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tVZ4dgVoZ62UQEOPSuhoLMktMmIXcWD1WLzWtvxr0U=;
 b=QfbIRyzNciaxqbPfmIeWtozWDMGJyzInAS3ZpD4/BK6c4s8s4BDctDEILjDevVVsb20KXci3+Gu1GSV47zM97nvvT+FI1dNev6Xr6bdcU/EEua8Rlrbdvw9/rnfcXd6ZDtbjor+gmH/udwlghaLW+1mgOa3/XsP7e3UE/KDFT7o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM0PR04MB6243.eurprd04.prod.outlook.com (2603:10a6:208:13b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 04:33:00 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 04:33:00 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 3/6] dt-bindings: i2c: i2c-imx-lpi2c: add i.MX93
Date:   Fri, 12 Aug 2022 12:34:21 +0800
Message-Id: <20220812043424.4078034-4-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: c3251c03-7e1c-4beb-daeb-08da7c1bbcdf
X-MS-TrafficTypeDiagnostic: AM0PR04MB6243:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B6OjBoYbKZz2sHhfAEnnR9PaQ21AurX6pNw40h3BfidC1KT8QACWrD3Yw309TDaca3betdgfKAbcW7wUUHsX0wG+t2vqOw1CIyKnu0sW5KR8/+YXSqJwPk38cD8W1HsRB/kvkGxMeIWfRm+Y9GmxQS/5kmA06iFZfTL/SzSflXY5fXBCuWQccVFfj2Qb8zWFUXVSFr+JfSZnX0HrYYZ9E5eXRButW5nL7dgeV/KofqYi/7T2znt9Xr/ANz81QIUKigaV4+QASXwlyXJBDbcVBU1CApgxNbt1IoZ2JJ4x86qU3S+gjVJAl70XsP2LsA9QiFy3azlunki0YxtHCRbZ0SS3RBxEDOUa9BQA9vZlYi62ySYXLy3q2jfQ6KaoMo4qUHdHNjQFpcuiBMM1CFGa6er7Cye3DYWRDLtcEXd/a1ox1L7dUwhSm3bnBpx/arB0+vsz0+BjQ+HBf4yu5fTwZSPwg+oknktKCXuE1hPpAHFgzGcJYWjUGa6G7HWkE23AnwDpRJkOrYACc6YFS0dvjog24bDKqq8ReBvwp1UeHVm1BrmKkPXCWS++kDLIURcV03Ti0YNGYy7y/WRH5JKeQrnVrsLH3Qik83grgYpqAtDvaew4O1kMv0Im4WiCj/q2xViCS1VoYFS5XZ7UWZBi4ZU+DjMbuRtc2GKPgih/X7vZK3YLFCOehCIIjgdFGWSoqoc5894ZdoMJHQ7UwLGWys9gtYm4ytIVquMN7WtuhLFjWcSdFOEsINTXtBXPtzSUOu79s8Iv79Y7Euj4bP5HjKeYmknUF11hnG8L51l+TERcU2Wsuich4bK/WUQoS5m5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(86362001)(52116002)(6666004)(6512007)(1076003)(186003)(2616005)(6506007)(26005)(478600001)(38350700002)(316002)(4744005)(41300700001)(6486002)(66946007)(66556008)(38100700002)(8676002)(8936002)(5660300002)(7416002)(66476007)(4326008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yi0f8IZhPtty5+Bt3owt3ZzCCAxLLP8luKMSYX0dFT5uZFI1Z4pzX0eXjk67?=
 =?us-ascii?Q?hyWHV8/r4GffEQP2ExzBsqgIJ1P6WigAMYTLYzEU68JzkpsRdb6OZlkrkexk?=
 =?us-ascii?Q?BKQr9/M+XnopsznU/Dgwf11nJF0SpGxVbiUIwrVuTTwtJA8f98JMYlzTEwB6?=
 =?us-ascii?Q?G/kn54FNoS5KlSuNpoPfUJxSIlho8Q6SPiNfUTXsHOsA1Sj2iIEzg/SeN/h1?=
 =?us-ascii?Q?7KC37/uszPJpIRqechLXe3c4UM+KIvc+nudGDSMRQKy3jCLLhf+6SD346SVf?=
 =?us-ascii?Q?L1LBn7l4OXX2lXngyQgJT+GFjsSrR40kBeptduoKj7JXyVnRfhdLQ0MEDUkZ?=
 =?us-ascii?Q?T5TLPLTWG5WzwHgctCr1MpIXk35LwkUOEn+nhkpB4GX5cG8Cp4yGpUttFP3G?=
 =?us-ascii?Q?0Du+CYKNG/xZfZHFoy1nRNBWYu0ZVB6ZYEWq5wQ2WVQuGsYcl4M+w5rj0EN0?=
 =?us-ascii?Q?XtEg3oU/9aeBtcolJMk16Nut+cVQDWBxTHX95EKFtNb+q+cedknTQM42yKn5?=
 =?us-ascii?Q?p2hWxgdlO3ZwmcwIMKO9vAQpezzo0ACcLlPe+4zxqt9kCLOJC+571439QRYo?=
 =?us-ascii?Q?lzC47uaZTatvlYL5VTAPz0N3O+R8tgBoBRRS9mRJK0JBv4/5XmV6cigby1GY?=
 =?us-ascii?Q?9oWZR/J3DpkVFPcuFaSgZeTtZit15+MjGWjPay6laY/RKfeYyM9wk5t9bNPh?=
 =?us-ascii?Q?uyvypi9Y7oeG58xKC/ey/OMujMDZW9erjg+3fgFQrgd2djk0M8bt84l2lE/D?=
 =?us-ascii?Q?yD+hA3xXcRAvY2MasoREKQADpTKtoWJI+1gtw210Hv7IUz1gMjnBYUnxkzVf?=
 =?us-ascii?Q?pBceFmIoBULwUVwRpTqGoxHvNbNl7m8MefLSLYhDUncdT6NyO7DFTyuGwTIj?=
 =?us-ascii?Q?/mSn/cyTOxg/o2g5LqUz0T3UijrhTBLKpa2W3SQ9IV/+eKV135aw7OIW7Jpp?=
 =?us-ascii?Q?axTnmtLxEPNI8B4uWBnfe5S1VEU7qHwEftd4lD902enweGSJbb0VqWfPihLn?=
 =?us-ascii?Q?zGyeu3BWjerNNBP3P/1OxwrI0yPlNXY+MqNGByq4UALFdUwxeFNhbvR3UZ/R?=
 =?us-ascii?Q?Szlqq0rLT/TTj0src/9o1bbuWAlSNF+NmjfvIBnptd76OvH5uCOxGYe/gZoO?=
 =?us-ascii?Q?wE3CDl5230XLNZ0aboxnw5l2kNAXO/lQMNnFRJOSqHhSW+OHDJjLWxPfqTYk?=
 =?us-ascii?Q?/AG+tWdS9CLyEV1qOLt8AZwy57PwKkYFJJ1y7hA7eN/CtsPytqME3O2danCr?=
 =?us-ascii?Q?FIG18cM92q+y6Oq8JCvhF+UdfS2cBzvv1HJM3TQkP79RJty/kj99q8LUiKCU?=
 =?us-ascii?Q?5YhBNW7nHBy1Q1q9lsXTPg2uqtXB63+gP3GYmBH48huIGznYffwI4InHUJEM?=
 =?us-ascii?Q?aXs06R8Gd8vTspTXMv3aymjouIHzSWjKheNv2letGAyeOwGv0P0qLyBYi+sy?=
 =?us-ascii?Q?lzp2S4jTS+4WJUqWwYveyw9+ROTgIkqQ8ztKyK63S3MRMQe6VwU6fOBSbK6d?=
 =?us-ascii?Q?97WPm23K/R0i3wXjGfh0TZs/r7V9T9zKFDKbFTDKT1qx533QOSoEOKlvxaAN?=
 =?us-ascii?Q?voxFpUszb5S4Y4XXVRajDF1Bnd0jXFpYr3nCdWcj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3251c03-7e1c-4beb-daeb-08da7c1bbcdf
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 04:33:00.4219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +TW35iApLwdye+6JslrqBdKlLZ9MmhvS0avpKSN2jXqBrcqMTu0j0jrUQ/4EhMEjAHM4xEOW7MKL8NkM84Sb3A==
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

Add i.MX93 LPI2C compatible string.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
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

