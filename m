Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5572375F3DE
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 12:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbjGXKws (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 06:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232789AbjGXKwq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 06:52:46 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51BBB137;
        Mon, 24 Jul 2023 03:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=laNZv9UYGAkNUlY6igyjL9HEhNHjEtpz4gTT8y8/ikciN+DKMD//8KMAObxtb5hYz78pXQ5zkIDSbsTGlbQbyjpP19lVrN+t9JLzISVqyRrIZFoiC35C+d7wGtRvaf8IX90Tux2P+3STLWxd3rkaHbEReroIZNOSXD/gxzXyBlj1CeJydI9dWxYiM7qZiScedPmdhrDSjcNDJ4zSTrIdYI/YEGWk68vIk+kvc36t0qWI8vc2ZFFv4GMmjgOqHTu/Uj+dITxLRBfzOmwty7jU+fe0g42X5UXtB3WrM63/gtB5nbbrUs1zYjWT/FPUOeOOKekiPFHCSBXS1oUIwQayUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tt13Gr4lkfhyfyHS3/RmyHaHEyl3PBdolcUbDX0pLh8=;
 b=RAOH9bRGPCI8puSchAPBCrzeVCKTX45dTTdYLDh6LyaEsmvZ8LIydW6zay+yooR3ybJgFzJptsCzQIsjNe4Yun08YmUNEGAA0XFD1W2X4RRyVh6SvmFr/EesgMmAdjTbGe0OXwScbtKt6CH/bLlQQALbbrXu/k+lkw9qjVkBdV+ukrqTk1AfPODMBbDbvookhEcXMy7+/mKxArIgDu3tQe13KF6bColY3UPxyfuGdW8nHm0XFRRHUUPxNh0ji7Z/vxni2MKGHLRj0/c+rMj+Hm/IeLjKRsdl5AoROxrun5BIcd8GFWjFRhP9boP9gRESl0Pa3L1lkBnqYuK0YkE5zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tt13Gr4lkfhyfyHS3/RmyHaHEyl3PBdolcUbDX0pLh8=;
 b=JhsW9BXqHWrvDrfbuzmLSmmuNYj67hpxOhlr4tUvnSzuHkGOSDDANQh+Qq4NGGvYGFYsIoJhWbuP+7M0uY0Nov1rT73dlpjLN1PKk69ugSPa5EbPP1sCQt1t52OAWvcQu0ooel9albfbTOWoNanRU7t/uZVs5X04AeD0dHiu/YQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by DBAPR04MB7288.eurprd04.prod.outlook.com (2603:10a6:10:1a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 10:52:27 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::7f26:a98a:b8c5:f620]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::7f26:a98a:b8c5:f620%4]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 10:52:27 +0000
From:   carlos.song@nxp.com
To:     andi.shyti@kernel.org, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc:     carlos.song@nxp.com, xiaoning.wang@nxp.com, haibo.chen@nxp.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] i2c: imx-lpi2c: add debug message when i2c peripheral clk doesn't work
Date:   Mon, 24 Jul 2023 18:55:46 +0800
Message-Id: <20230724105546.1964059-3-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724105546.1964059-1-carlos.song@nxp.com>
References: <20230724105546.1964059-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|DBAPR04MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: aac45896-638d-4a2a-2598-08db8c3411b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iVx7HcqIeC/HIk07G31r6qsNBxakyZG7McaC+JwnlQyBPyxPo6mlR8q8+T6eKyphlj2QgxbIokxfgocrS9HisqExAF2t7NWVfMAdgpPQdQwaqlioY/9ySR4YfNN72/1BrFOTCAs8RFGWG466pLwmMpdA3XscA7OovigaA8ID7rPnkdFwHkR0UprGZtsX/d7erXX2Xg1tL6TodGXPQ2Lv8tUAM1aduIwBwesr39VG4oaQLGZQSX+gPcwkP1+BzwGHZNdQramDmM/SzCK4sym94Razl8GRhSZ4og9wyHUmT0uJbES0nzxWVEVnPHzvBX9oRmaZFswl690FxK+UEjW0G29WSxWcSDVrLf0rh7DxLM9kJvnDpBC8OOuPZDSTLb2+CJBfeimnKj/8wjgvhWgl+DBy8oEGa4OVVnGtGK0v0Fx/yK0IdoORQxLlh0SFNb1AulzMt3YGlwsKsxa4w1I/wSJNJDI16gQ5RsjlPaHN8UBf+1PXa+mBO0QfN2loIAe595tMygDFuzXM5kdX8yRWgopsP/KqhekIhT5y+RlBMhcSzMpGQhg7tzGTeN282SwEFqHPRoWtGESCuTwGfsvJ58wPfkIB2pP4cUrrYVKL1kVED5chA8wmPV8loJgTxhbP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199021)(41300700001)(8936002)(8676002)(316002)(66556008)(66476007)(66946007)(4326008)(2906002)(4744005)(478600001)(86362001)(5660300002)(2616005)(6666004)(9686003)(6512007)(6486002)(52116002)(38350700002)(38100700002)(36756003)(26005)(186003)(1076003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n2cKOuDipS8LF+MlJuDSt6JLMbpn5Tml37NGeVL9axtE8skKrqZ/Ar5R/5Ca?=
 =?us-ascii?Q?V9xopMsCCAJNdPQLET7MEkfG9bNdjhk2WomIw5vNScs72yQPUyO1SKFW86MI?=
 =?us-ascii?Q?b5p0J/Fnaip9wo6bUguL0lIF8ljBxgpnmzzq37q7ENHRNdnSZSPk4SvprIAi?=
 =?us-ascii?Q?XDkYYtBVxeZ9vk8+EyRjMiXNsoccKdrM24qsZ3USChk42Wqgw+ZvUVCfSMJE?=
 =?us-ascii?Q?bWTvCiQr+cYqKZydzW1t/8qREC7taPNCzeGi3zVx+Pf4SyFmPWSPRCk3nM0A?=
 =?us-ascii?Q?/iTiCSZjlUeke3FP2knLrODhF6Qt18BZxP1lk35BN00xNhLtBwtt2M56d/OC?=
 =?us-ascii?Q?o0oNU5Hatt7qKQ2QrJUywWBzXszvxv5KRO7W/JZVmilSXIoq2/NtfNtwVwZq?=
 =?us-ascii?Q?5DCpVvd8PUsRntL1T0SS7KXuSXyMarfxbLp1NJyX8bu7UzpCMnAy+3as4wKA?=
 =?us-ascii?Q?jWu6NYk+KB2UqhPIzppHEJnTp4Mpmq1HGGR4jlun7oVsa/uK387wUowFOadS?=
 =?us-ascii?Q?7BcIEu41t4Mvld7MGP7JooLTQd8GLFKVHv1zvRAcPLaTthNS7w4eKONoB7F3?=
 =?us-ascii?Q?8ZP1uPTQyt/Of0Mg4IKXLhVds1xs3fvfGwoxHoeN8YWSkStK/KmmhA5okZKl?=
 =?us-ascii?Q?mbUQHnfVCdDe9qPcKHuOEydX/ElXMI+i0uM+EnsQBoCGIEKC+GYCO3mE480f?=
 =?us-ascii?Q?RYlE0b5mIkvbGcM6RbfWrFzNaaVJwrCMw+6khcc5DuI3sE6P1uiUAIZKSxxe?=
 =?us-ascii?Q?D8VelOrzpZofL0xYTvQvh35Ft8Ti8E0XB17n0fk+4JmmZlbvyTSoyjmwZafd?=
 =?us-ascii?Q?ZKurqmbfT4/xH/VCik/pfRy6ziJPlRlWG5evXp8lanGhu9MSTfjZtVhEFDa5?=
 =?us-ascii?Q?qIdzCUUuonjY2r/8B8/B5lDb0JzwTxn6umbfLx8ZdbnI+1Ei7JCIsh+3Q/9L?=
 =?us-ascii?Q?sqB1nhiE+COLV2mAKZSQVLbI/UvgDpKE5AYw0GZK2/Dd7c1U/IRWabUbgefd?=
 =?us-ascii?Q?IoYDR3nZYfDGICz1BAYR701coUej9Gc98JUNzy9dksqW/mFkOGBimF/8jiSf?=
 =?us-ascii?Q?FSfBwP1HXiTroCptGZ1r37NogzCnNBJh6sJrNBfZ3rNfV2KXr/7DbZJEhnzo?=
 =?us-ascii?Q?F9CBVJuUUphjQILgzxOvOF65aWVauhLSrb3dN0fqAZnXdY5x5h7z41DLH11D?=
 =?us-ascii?Q?JqWTKflyB9s5UUo8vzSzEQDrZzPk/mRpt36TfUAOvbw7cvIEWFx02/KWc1m4?=
 =?us-ascii?Q?2cwBys3JUMI2f7eWVndtZckj4I+cXpajIwE4PIVFPHODhdf3lq5CsrI/Ts4G?=
 =?us-ascii?Q?NBlv+R6m6WEkBpN77rDbhiSD/F/DDrGgq2osd/OLxeQxoac8mINW+S4zsi5p?=
 =?us-ascii?Q?g/BakzI/0Ht85xt4g1lzB8BuGE4uiPMk5xgNP1ABGItam3xdxyQ3ptyWPHB1?=
 =?us-ascii?Q?oTk5fShylDZ2yzljJZcX8oLeWIF14llu2Vngoeo0lDSqK6J4jARfH4DQPpeq?=
 =?us-ascii?Q?mFUWdkjslbuwvJYQSRvcgNPBAKG21Xb5KOIKlHGbZNNminj0D7UWVG6vmvKf?=
 =?us-ascii?Q?vnqrwoGJSJMJaxCUzIF4fX4gKsMRqsmzI64HjYrs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aac45896-638d-4a2a-2598-08db8c3411b9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 10:52:26.9813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQ2AeugJc0pM6TKSJSjHw4YhzV/jwPPdf0Ttu7/XfQ7isysN2VAJmrw6dX+0ly/6Vu+nHq0IO1cnrzmocNYuAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7288
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Gao Pan <pandy.gao@nxp.com>

Output error log when i2c peripheral clk rate is 0, then
directly return -EINVAL.

Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
Signed-off-by: Gao Pan <pandy.gao@nxp.com>
Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index e93ff3b5373c..12b4f2a89343 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -214,6 +214,11 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 	lpi2c_imx_set_mode(lpi2c_imx);
 
 	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
+	if (!clk_rate) {
+		dev_err(&lpi2c_imx->adapter.dev, "clk_per rate is 0\n");
+		return -EINVAL;
+	}
+
 	if (lpi2c_imx->mode == HS || lpi2c_imx->mode == ULTRA_FAST)
 		filt = 0;
 	else
-- 
2.34.1

