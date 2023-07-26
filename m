Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EADF7631B1
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 11:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232517AbjGZJWN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 05:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232511AbjGZJVy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 05:21:54 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301B64227;
        Wed, 26 Jul 2023 02:18:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PvYJdXxJKQ3ZFGJvs5ziOhGPq9jrAVzO/Xo0mpGGVzrOutbxK+txRpX/tYXkqXkVXw55gr1Xb/Kf80BVyEVZvhQ591+AbZenGResSRNPr9JmOvXcb1IJbZq6eftILsSyjnpiow+mbKusMu7MgojFWL2RlJnk9cUE1pnH08fsANcZXZDVEO7Vq5NZAWEqxJ/rvPSCsIJYq2qdFclMPE3ru+b5idy8Rt2r9XNMtvZW2Z8emEzRalYyiMJ/9OQg1J9Ypp1vnOaO2djylh2SK+NbAk49dRn8Gi1gbosKxv7nmu19OG0pQ5ML8n4lYNM6iNaJ9ahkun+MwkVyUGVf54nFVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07v7NS9ZvnJH3P6vEXkf9vX+H/1aoox7/mhrQBMg2ek=;
 b=M4OaYPYT5Pn6GsAsjYefszQrZTUzGDfBV0yQm7GU7bDqTt4mIiRYkLMAMi2IJX/7CTmtCJ2kJsdY1MTzg798Dedp52kwMOA3VNCPMlTNfgkKJ7Qlq1nRTTCMApz6LPmrFZe1Eh1fUHxkD0kPdVpUzRGU+9XyigU9SOam5aOUyuPPAKWnXRfhBJyq0xAeIPwLnJPGFxx5N4aYcScj/tV6ffR1I7a6WFi41wfNJ/r1PeZ1wixTLkylEaFv/Nh2w6XgPP1OUYQ54tCdqUNYebZqNzrwhwfL4eBI+KYKG9vBl/tol+XVSOLS2m+hoHNPIQzJSA/P38WrLX4MOoIoSHMgCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07v7NS9ZvnJH3P6vEXkf9vX+H/1aoox7/mhrQBMg2ek=;
 b=Fu0QIzQk3B2OaIPQOD9/pybJuud9Upn610XxwQUpJzIe0qjWRhF1TeyR+xiQXPCDSG3a8vF4/PXbcZlrI1xBYceo+VCI8+7DoxFPdf4IUkEv51DH+5pfneltSbiX9VQ81RNJlwtfYsJE01QYZp2OpPfUzOGgc/ekG4s6o8mUwdw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by AM9PR04MB8953.eurprd04.prod.outlook.com (2603:10a6:20b:408::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 09:18:49 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::ea2b:9b70:e669:f0e4]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::ea2b:9b70:e669:f0e4%3]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 09:18:49 +0000
From:   carlos.song@nxp.com
To:     andi.shyti@kernel.org, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc:     carlos.song@nxp.com, xiaoning.wang@nxp.com, haibo.chen@nxp.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5] i2c: imx-lpi2c: return -EINVAL when i2c peripheral clk doesn't work
Date:   Wed, 26 Jul 2023 17:22:38 +0800
Message-Id: <20230726092238.3424116-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0115.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::19) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|AM9PR04MB8953:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f86480-6b0a-4a9d-d2cf-08db8db951e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FVq9R4v5CeHo66vGSH/PH5zZm/NBUw4gQIXrjDBLh7GTZTZtlTPxLPVSmHAmfa55H7AdKeYebWkiQBu9rdnuCyxtEWzGmKzj+XrZo+F2ZPva08mLVSul0l8cyZebtsy+z8eTfzr0us2gKxx1cQtE6UgTm4tm1lzCIltjASNsZdCXunKxREbWcjHbc7qF79phfjyU4vHT+YdRm+yhx2nRbWdNX5aZOzkWATPVURXhxNDhOCSyEUpprJ5vRM9SBKcnmP/dH+y+ZJnyDL1iy2WUXIoOIqBxIlCTgzuSRHcIEUObOK5Y5eqqji6EpOJrSzMcZmOZ3KtHu0qJVHCL/MM7nMtxfsbAshjBocqJOwEXV4opDp84ZgJWw/R8yzyAajrdkQXpuZSNXmgRD5vB/E1Qn9BGza7yoCCRXJbwpP4L6Dp9v/7JY1szDwiLPS5kxpw4NiejbPXEM/xYG5KAm23ZXUJ/FZviaWipwVyunQExs70u8tLOO7VRpNKl10lZu2ktkvp0l4Ggtm6vSG0IDQgqBZ8Cp+uDVy1NiXu+/1YmR2IwwnISVhRBc6NbtCi7dJIqFW7oIr62L52JUh2wiFDj8dRw5SzP1QaKeamxp8yU7cHAT6uHKermsp5vJ2Wk49B7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(9686003)(6666004)(6512007)(6486002)(52116002)(66946007)(66556008)(4326008)(316002)(478600001)(38350700002)(38100700002)(83380400001)(66476007)(186003)(26005)(1076003)(6506007)(2616005)(36756003)(2906002)(8676002)(8936002)(5660300002)(86362001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h1Zgi21/aa/b81uq/XwdakQjL52psZnSYo+rRBRGQYik88zV6ER0HJJjbiSF?=
 =?us-ascii?Q?9XhTaGLz7XMjuZ7ufMbkO0SqgQwUQ+1yHpJqTopTQ3zwYeaewlWfi0/qbL7X?=
 =?us-ascii?Q?HX03RO66SWflZVwIvF5ralaEv2//0ICsN87vVq5fjT8ijTERhsrUrjN4JqUK?=
 =?us-ascii?Q?rQxwrA+TGbP9TKZdFbTznXnml0iVoAlnjIGZ+mPlaK3PJj5q/44xLRgmew+t?=
 =?us-ascii?Q?PuflvTisyICclg1nFYgf5vDP8ztiE6n7n8eChshFQlrinEwfxFHF7FpjTIDn?=
 =?us-ascii?Q?CALT+C7HlrxQNjvXuZ/sKH9yx7ygr/ykNbo60Nt67+8HnM9hjdu7Ig/KWKqr?=
 =?us-ascii?Q?S5AP1Toc1Zy6RYjy/ubzut+30TFi5A1llSS63MNvbKGY5vdRl/q6rh8Dl4bB?=
 =?us-ascii?Q?X67oiJl0ps+/h8qTBdHwMaCfkAw0bZvzQbrQlf/+qdRHIqbGfuwQzK6uGrub?=
 =?us-ascii?Q?H9KsZdo2UG9RgmGG07FV0ZRG+4/2IIljMXiUhMWPPAvoe4xwYEuolPjEM9EP?=
 =?us-ascii?Q?GsVp+sP6r5aFLpR4uJOFc8FRgdDwywAtwcp9QuKk9QKNbDZHdSKiLIoLEYsL?=
 =?us-ascii?Q?Rrv54wWnGDswF1c3hkynty9r/vnWq7xGOC1bm+WAX2M31eVE6RXVBd9Vdr1a?=
 =?us-ascii?Q?oMXRSO6sziyqdh8jep0EeezEBwrSFJTVXhxdFXduU7PhkAJhwR4yJ2bvGVMp?=
 =?us-ascii?Q?j9/0pP7kzyatddjaVYeryweU5+bHDz2ajKaJy/4eT3aq7ry9Hl7yu73Mi0h6?=
 =?us-ascii?Q?gfdRLsVLvWZLkZi32DBro0Mi2jtaB3NlOSt0ALBu96tMRVuDqqx5bMSF8D+h?=
 =?us-ascii?Q?40bz7DGeLI9z7mu8AMowTqtVTZ0KxFl6glYfgjeCPuf2HCZgs6ukSujSEzlx?=
 =?us-ascii?Q?pIzZwb7+QhaBpr6iiQiXNnSHCg+VpKnx19rtT2usav5szVv33wBw1FI5RNBG?=
 =?us-ascii?Q?TH95CKpLY9qG/0I/IO5jbW/+Xw18vNQFFy10VquNu+xYSkWn1IK0FmQSsGu4?=
 =?us-ascii?Q?7ScRQlz+DuTHBzL6iSSLT4IRpsd7y613OqG7wCxy45bexjIR3k420JZsv6dc?=
 =?us-ascii?Q?F2/XyTi9kmJG7SW9naSaCLgz8SfFJpfwcNM6E9q69sMnOYU3DIKI9dDDfTpM?=
 =?us-ascii?Q?PcmQjXubSJ+RvKChuBQFgFvN2zjzUmgHLAHZ4l92j9/rARaa0Y62v7xPA1Pp?=
 =?us-ascii?Q?LgwtrmeTeFPuwzvrqE3vE5kM7f9S1eD/KYwLMxx6IVgh6VdWaMuynD5b2+w/?=
 =?us-ascii?Q?MHYGDiLP2443Z02Lf0jESbTn6jjQ3g20Pc4HvT7LTt0S+w7xnXtS+ZGLs/rb?=
 =?us-ascii?Q?/4OvpA1cbb68I2mai4apFluQnL9aBWPtnn1tfojlDK9zB+OCALKA4O2RFmkV?=
 =?us-ascii?Q?QLvAELWpF0M5eFfrX/DBG+bsR0I8a0jstY64YQTLFJwrnJBEfBhOwG632cdE?=
 =?us-ascii?Q?EomkE+IbuFSci/LNlmvgDqeJpZh8um/E2Q3e3St2lRndGZw0cOjmsUwO8csK?=
 =?us-ascii?Q?NlzkKhwC2OQ8oeh4jGcxhZfCp8wvaANO/S5+IkmVGfYCWNtImSbPOySeQBo0?=
 =?us-ascii?Q?Vtww6+WBXirfo5XTlgtHqO+XXIao5puQ9FQnZNGR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f86480-6b0a-4a9d-d2cf-08db8db951e9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 09:18:48.9092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIepc2tCAQlWXGrYbMSGqSe/a5AIfCO3U7itQgXIooDRWyLzxEIcomhlXYJvi7d20b2j6w+ZeQdQN8Rr1+GoAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8953
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Carlos Song <carlos.song@nxp.com>

On MX8X platforms, the default clock rate is 0 if without explicit
clock setting in dts nodes. I2c can't work when i2c peripheral clk
rate is 0.

Add a i2c peripheral clk rate check before configuring the clock
register. When i2c peripheral clk rate is 0 and directly return
-EINVAL.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
Changes for V5:
- modify commit log
- modify Signed-off-by list
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index c3287c887c6f..150d923ca7f1 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -209,6 +209,9 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 	lpi2c_imx_set_mode(lpi2c_imx);
 
 	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
+	if (!clk_rate)
+		return -EINVAL;
+
 	if (lpi2c_imx->mode == HS || lpi2c_imx->mode == ULTRA_FAST)
 		filt = 0;
 	else
-- 
2.34.1

