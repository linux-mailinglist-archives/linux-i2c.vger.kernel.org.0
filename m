Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29C2C355242
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241614AbhDFLds (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:33:48 -0400
Received: from mail-db8eur05on2077.outbound.protection.outlook.com ([40.107.20.77]:22144
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233103AbhDFLdo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:33:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuIZ/ClPR/1qTwy0RRgOVOK/lJrTPAxTZxHLDEl0WRvdkOGYls2GxYodM5Vw/PQBKU9soAhYkcALsO6Ap5xV0YsKp865fWsocaFLtooGEkb5jrXCgrSIlgV9CFc5zEc+q3IEq7BbsnboTEhALhoNxXqzo+XLzvIZn468CQ0BMWTVDKRhzGgfjfokcig6pP73KudsqAxZPMgWXErNorMOXEA16BZcIwwYDL0ahBZGFwra0dly8i6Zz08/q7O36Q9AfeSywD15nMZykSFFG88uDzr7OYbTcN99AcW0KgvOhM+v2aMTcRV/f2Xq7WgHpFAoAtGeVQped7xqtWiNmwkhbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JSppjieFHxMsU8F7jhZqMFlfT3NPEnAN6j+6fUDx6A=;
 b=R5z4PdSU7U3Pm8q/anILa9kynE5WirC7HiIMLQ+9NlsDI/4vlXXymVoWThQCC0VxIyJC6piDkOQIBjIteoO42xw2KL+5dtBSkylRzDZj/Q3NqOBLGdGh3uu838L12iqxYFme8JCFuSkavdb5OgXjbWiV24eKkTxJn2IVktSkTCrBTCoe8oqR3yViphKZ8kjCclDuhkHd4jIz1e/rAOuCugdIs/ALzU0yWCcAEdzrIentf1r6vuHvMXVD8C3w2vbe6GfnnPmLtgExJ+nr9MFnXvPkprP0dAiSy7op+TguK6WRTqP6Ay1VK9s/hiQtAqLmNUWcjWMt8RUIMd0isRd2IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JSppjieFHxMsU8F7jhZqMFlfT3NPEnAN6j+6fUDx6A=;
 b=qPHPJKMec3AuHHulHpMFMv8LeC4D8dcMC7ebwPCKOkNpBIwsQCQy9pngELgcJwblFtMXx+KIUgAGSkot6DhCyvgWtXuQ2bswaf+9yfjqjpAUUn8/JaW5/C3PQQt+LMhhwNJFjKg7y6YcVbJB81xgbHiBa57n4dYOgnF9+h9j6AI=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM7PR04MB7142.eurprd04.prod.outlook.com (2603:10a6:20b:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 11:33:29 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:33:29 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 09/18] i2c: imx-lpi2c: increase PM timeout to avoid operate clk frequently
Date:   Tue,  6 Apr 2021 19:32:57 +0800
Message-Id: <20210406113306.2633595-10-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
References: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR0401CA0010.apcprd04.prod.outlook.com
 (2603:1096:202:2::20) To AM6PR04MB5623.eurprd04.prod.outlook.com
 (2603:10a6:20b:a9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 11:33:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10be54ff-f995-4eb3-d2c7-08d8f8efcce8
X-MS-TrafficTypeDiagnostic: AM7PR04MB7142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB71422A8B3CF30890C1D7AE74F3769@AM7PR04MB7142.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kgMD5QwbHV7ddR66OIyzhEmPMbj124tE9iQxrKmyWEEsfy5rA/6d5h/5BCGtCZsLZP4lDZFUXcPVSVb7b0pFA5MWRy+oY8mEhJ9FmW/AWlB89cK85RWrzR8GrFh199/91jN/WA16tmn6STycK0JR6SpeFO03AcjD2Xi/95QrEwo+tPrz4HkCokm8LlrAVp96kOWIc63eNAHxbC7lS9XbhqtRBzCYL4FudgZS9Xxvai2OrgLFU7Pdt50tAR4oWZQ7Ka44qhl7epjFG3tclwBR2PpW1XQ9UHrLpXXzqO7lDujoxEpSBcju8Zb/ahhgYPOhmeahALwLt99ZFG4Isq5emGkkxR4pCVZr+UHJL3Mf3wGRAAf+16G3fthUjlW2ml7cKkmxCJYcNNXlNUeio03bRLgEihc61hUqqLYZyLkgfLmXbK8T0nKy+HF+2Q7Jm2v0ZNWMlvZgUrgHigs1YDcGko7iw+ZHTEWEX84ZPf9CHxzVuktFnziqVs2BoSN3WAUwBEc9ZlTrPNhCoDRfxN7yGFdDgWA+lP02rttTcz+YQPQm7FuWt5rkaaS6X8l4pnR383uy20zgSmsl0BrfD7i8priQDIjnjYyl9VsXcVen3E5AAGI9bhyhchOo16ExN0YvJjyP4Co7N14NoRmoL+9Wa01fbmr88u7zt/KaT8rv3qZ3P3/K6B2Gp/VLH0ktLxIUmCNEzOjxZM3blUz6cwVJ6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(186003)(16526019)(86362001)(36756003)(26005)(66946007)(6486002)(6506007)(2906002)(66556008)(38100700001)(38350700001)(498600001)(69590400012)(8676002)(8936002)(2616005)(83380400001)(956004)(6666004)(4744005)(5660300002)(1076003)(4326008)(6512007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UMov8cucExiWdelhcgHBKeV0iOhp2lNO0xm/f8D0UGRc2iHVf6MahAXf1ziP?=
 =?us-ascii?Q?TqrTpHWtJm4W9TfJAbm2zb6F/gZSG66ysRRQmciGGoGEiOkz0KHCzza5dmR/?=
 =?us-ascii?Q?iFcSiCw10JASiAcIqBaqiU7cdywGgXzBSmLtu7qz12f7sPjFtHmhVUqrLE0d?=
 =?us-ascii?Q?EDpUQzi2LxIVu0fwFVZJ+xV7I2eCIk64xQ7Z4Fu07RHn5PSAgj8kUoQbvAtE?=
 =?us-ascii?Q?T+zeqhQtNnPxIvpyvfVvkFcA/RJ4GkJCmB7WZi3Wk40pr0jYnzJMSaDUjZL+?=
 =?us-ascii?Q?3RlDQJWWeq5E4WpC9wF/Td1ZbZDs0nVijDKTSgagydN17J0ZllT1+FuLzkui?=
 =?us-ascii?Q?YcZrUiE9W694AfhI56p80uLNGlARHyanv4if3nqzbp/d2GtPeKF9ajvYqB4F?=
 =?us-ascii?Q?tAdEkAhcVV94NS7K0Om/n1Sqb/S61kPCr/zIQhNnYJGFyyfEa3I9y/hJR2Yi?=
 =?us-ascii?Q?kVobzTJtNnX/fB66J553OwSNnZEtaKrcQ8waIAAr9USUc8camWFMXpN2qzPD?=
 =?us-ascii?Q?lRR3vikci96FD5vbcnLH6/PgFC0JuEtiIDsKzUbPumKB9qvAFYO10bLYcR89?=
 =?us-ascii?Q?MHOe7O8bmpoTAw1MtssiyZk2HJQLTYMe3oQjUIXjICwq7tYRlaI7Gg98hJhN?=
 =?us-ascii?Q?MIUe4l1FQzD/F6/Jw4wo5pocazN2YJhSeIdEPinsPMi2gSpZmdTWXd8LYwEt?=
 =?us-ascii?Q?w5tXyZLrUyO32zSeGdvHcJM+QpKOLT8YG4lbJXzqU6HdVMfmUtHKwaJYWuqJ?=
 =?us-ascii?Q?wPEC63pA9oimBcS1Ti63TJ0d0xpWyVqVsHeybfUkn+d+FxdWniZhv+d2pOCt?=
 =?us-ascii?Q?F9LLNJbUEofxRGKGjNzYwy2KlfO9ze9llB+nZWyCPwllIbWmB84SFxXO+aI5?=
 =?us-ascii?Q?WdYwY4n8S+qaX+ZHnB0kycQX46qXOANplsr18sHfOHXIg6pLWb2NV4KuX7/G?=
 =?us-ascii?Q?DRn8eBMKpF6oXGiINhkPK0vSQVVCbDyv9THhsOa+QWduvrWy5TvjM7tJx+Kr?=
 =?us-ascii?Q?Mg0olPX8EoVwOa3MuAKBIeBBSdWAYXZJ3Wjwc3/kcz9xauRTqS6JketGljJP?=
 =?us-ascii?Q?Nc5PnlU5wTMj75qrlDRpwkvf/bYkTrNBBxGLBmwfgjgxvM9bHPRlUlwRWKLW?=
 =?us-ascii?Q?AGPvAmIdvMe+ek+vqmLL5tC+NevPeG/TQfVkuCum8gxInKxYbuJ/e6cpN44x?=
 =?us-ascii?Q?NGmvzPc53LRFjs0pFfca8rvpVv4Qz7BolLzE8ahiIv6BYjVQQmwI+e2DjRud?=
 =?us-ascii?Q?ofAaeteDU5hdWM3sZu0pvKlwUzxPYNWrA+CuhP7EGujNeWILgq4huMTxCTj8?=
 =?us-ascii?Q?DRwDWfrWfZ4v4lLjGJz8iWye?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10be54ff-f995-4eb3-d2c7-08d8f8efcce8
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:33:29.4885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9buxdUVzh7C1JeE2LTzquWKGQSOEmhUAC1CNrp3JlzwzZDQqFE8bMl/kfhQ657pyrzpsxr4ePlX67YPeXDrKVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7142
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Switching the clock frequently will affect the data transmission
efficiency, and prolong the timeout to reduce autosuspend times for
lpi2c.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Acked-by: Fugang Duan <fugang.duan@nxp.com>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
---
V2 changes:
 - No change. Has been reviewed by Dong Aisheng <aisheng.dong@nxp.com> in V1.
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index dfec334712c2..77ceb743b282 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -75,7 +75,7 @@
 #define I2C_CLK_RATIO	2
 #define CHUNK_DATA	256
 
-#define I2C_PM_TIMEOUT		10 /* ms */
+#define I2C_PM_TIMEOUT		1000 /* ms */
 
 enum lpi2c_imx_mode {
 	STANDARD,	/* 100+Kbps */
-- 
2.25.1

