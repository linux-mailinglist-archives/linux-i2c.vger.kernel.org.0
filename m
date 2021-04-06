Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E12ED35524B
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhDFLeC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:34:02 -0400
Received: from mail-db8eur05on2042.outbound.protection.outlook.com ([40.107.20.42]:42593
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245630AbhDFLdy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:33:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gS3K5hu2xX5QDAS+8KSUY87mAf9eTrjiexwdCqVFhiBE5XvmCwMc73CxavNQbwr/dbpdDFiAgQzp5m179JgioyBbJsIHTNhAc5NfC9OcSW24WtXcOWHhHp04N35fHhSQEhonb1XCFwEn2cFc3GaEGEU1n2w2zTGIRPbFugi+ay+/4c5yNtJTnNBthd+x668l0Qyhwx05bdeQwLYRUvX2F+7I1latqjhYMf+4HwVztZ0hDUvovtqKXyWbLXLsAgpw9NDD7FVdhK8nq5C4rP+1WRQ17TMqg6Uf0/a7Tmu8I2YyBG71YGoX1rEtM2jrz4rmgo91BYuWjPk+FbU3Nyl/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0DJbMGP5jtQt8jmC7BVVzD6nrFLd/WlXnJLdGk67fA=;
 b=oOFxnOdN7I4vcpvnXKgKzqiOPGsfVJuH8Xqmr0sEi0EFZGKmVw+YbxAyz+LXsVmOoXEGqMY0nT4frHqbRachrDmKOTqJ193yA511UB7fx9XoIMqlzG3u2jTqPEzat3v+afG67Z9x5Mkq+XskVncV4G3DUDFw14WZTLrY58oVJ4ChpT+el+g5G1DNIvdti+J7kRrjXpVlHcl9Td5uMRSmrfDRt/oqD/Akx+VavNgYqOb7JgLttb9z8s4xDi8iSXtR/M7E2UKbiqEGyaN8/ZdMOSxp83LESuf0m7AGXU75tprpev9Ph51PAcFqgtl1ueekS1JpiWJzoY7PGGXFujJx+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0DJbMGP5jtQt8jmC7BVVzD6nrFLd/WlXnJLdGk67fA=;
 b=gO8zaECKHbutYwUyWMODF6CMgagPGCYPAI10LWSUNarNocqqCAA/BXFm9zckiA0igRJfiyRNpkVUOeX8kBsEnJVCUP3x6S2zui1lQy7rOhbw7mmpfc/m6K+ptlmw24x+RawwyBDMeCH+7Kv9Q57qaIpQZOIFwhmQ6q8hEu5SpSM=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM6PR0402MB3765.eurprd04.prod.outlook.com (2603:10a6:209:19::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 11:33:44 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:33:44 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 13/18] i2c: imx-lpi2c: fix type char overflow issue when calculating the clock cycle
Date:   Tue,  6 Apr 2021 19:33:01 +0800
Message-Id: <20210406113306.2633595-14-xiaoning.wang@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 11:33:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b24d3e50-0d76-4d8a-f0b5-08d8f8efd59b
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB376560432E92B35B5CC7EDB5F3769@AM6PR0402MB3765.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /PDyrBOmssV35Kqpvb+4J75Y7uTev3Uat5aJd3uyKtJa/QKGn8lOdnnOKHn/hOE+77xek1szeUlI2mum6iM5EKpGML8PzIyw3bGEPHX5rJdxwKBPa5hsoLn3LanjO17vqtfc6cxgHpEhlbjQ2IVmHn6EPoQ0gd2EmIdexA4h4wpvCAfx7N8ZN7Ygb9GU5ANVuQ06jMGh3vvhThzy/S2+BXAuP3Ot+zSjQgmm9/3eIJramRu752mTjN0wW+WA+H4I+R8cqFMC1NKim5JTBP1aR5h3S/GkIhS6+XtIznwUSEkxribkkjbUKSY5a0EG2xbvfdaVtccPq09Dm20HmilAQwyLPs17+zxo03K0iTaGjrSgyt0JiUn/tTDSU3yypJaH8LyisKGupIM7y02daAtpRmZFpZFuumfUXGawNhfHsqozE9ARy86PqtMxMUXwLhkJjQ4Yu43LGllkXWuXSLuT4+c2RgTy6IyLhwlMuZxvULIMUpkhBKDDzShuEjUQlYPXFA3QwsXn26chPtEAK21uI+zTp10630mXsfPn8rMDBva6Mx7CTj4lB823cKNkZTEbx3Lld1lukUnSPOajtaS0E8+2QFIw9fRv3j8zEwTDAHcen1WPi0x5ZL+FAeiuElHFqSlGDnmOqEqmDuxufuYo7Bb6FZDKd9saV/kHtz2xgCQB+o4m+Isl7VMP5chn5KHkDK1V4C9E3Av/xXI5MY1VBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(69590400012)(66946007)(36756003)(6666004)(38350700001)(66476007)(66556008)(498600001)(83380400001)(52116002)(1076003)(26005)(38100700001)(4326008)(956004)(16526019)(2616005)(186003)(86362001)(6506007)(6512007)(2906002)(6486002)(8936002)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6umrCu5npt5Meqb9QbGL/5VagcqBgQznm4R2WPWMJQIccIwQoHnp24e2u2k7?=
 =?us-ascii?Q?r+7dHZeGhQ4FSsHOcUjzppubxfnj/EB9FqRIE/Lh232XwYBv1MLqIvCU/dAn?=
 =?us-ascii?Q?s8UePqFxfaBcN4whPzeIr6SYBhWL+h6O7xRMjANjV535OjvOHUGylPaEW77d?=
 =?us-ascii?Q?l5PnPMDM6DDnN21vxBmSvcZnoxmwFEx7Eev7M7cqU4+rd8ersUpgF+/xmUqc?=
 =?us-ascii?Q?1uWyHBPA6+o8Vo8+Cur0dQtiRT1ovYo46vzpGwOC+Y96eWOQvs9zc9kOY1uJ?=
 =?us-ascii?Q?HiUwCc4cQlzr0K3OUI78qgp6kMLjRamDAJFL31nqXZPdU8KfFBMA1n6byBTH?=
 =?us-ascii?Q?LhlUSZ72CdjVEIeOTozCmrkwAUHSaWoWPqaTta+DKB4deRg2z8UWD4iCv8MO?=
 =?us-ascii?Q?07Ra6c8vXIbhBOOAC+26q+jUyCJ1Kjoj2rIZNGoyJf2Cb8fBWwAsaLjBaZiD?=
 =?us-ascii?Q?2QfWQzfYukgMwYtgD7L5iX0milQrxLPNqP8sjZ051o9X9wq3RPLXJ46LO1QQ?=
 =?us-ascii?Q?p0B39tdeWwjjCGBW/+lRU3Hcszz6FHRObuNAtA0mPOwY3ZTbyn0EOdsDDTcE?=
 =?us-ascii?Q?BELLtPNkF87xyXNwblXfEUsHO5rTPjSH7EX5ftpiOTwE6p8dI80uuud2dNTw?=
 =?us-ascii?Q?xXcDvSfIrMvZA4NfMyTl0Opk4yXI2LgK+0mctg8/Hqk4Y4dxZKAhLqGIEt+u?=
 =?us-ascii?Q?usuIfdCiNmsIZKBwKU2FQqu00AHelpRbvSMQZDblYBJKaSNWlcQ/9f+elNwQ?=
 =?us-ascii?Q?aGkJpVFMwkA4h55yW5BnRwNsna9SztKSJdqMtUxxNlPukjtYQxhbgBEuxP4T?=
 =?us-ascii?Q?xmNtOv+bzspGUC7NMvVYy2Uj/b4MFwK3um5uLd4Sd9TcB9ylodtCKmxhON84?=
 =?us-ascii?Q?DmgT1MXDuG89ivwEkC8cC4owSvKDYTx2ZZ+N290ATjXyuhB85koSC+nrTx53?=
 =?us-ascii?Q?JPaIQ2w3jZ7TT9p5I4dfgr9OAZjrmcc2C0XOvaNloIZmZY6dUS4n3d1/bHBd?=
 =?us-ascii?Q?7fmxumyZwrFhw/pi4JVtb9FdU1NspOM/fuy2DWb0ad3915g9IU9jWxABVxSw?=
 =?us-ascii?Q?EYwy/d9fPzSxnRl8ATP6ueuPqsN8FSrS9vL1cr/BQGUMMrxd4//GTLDUT+dH?=
 =?us-ascii?Q?pPfNgKvyRi/ViTYcP778SWH+NdaTQCsZ8X5+4DPKT8l0gxR+WjB7aGa+WMXE?=
 =?us-ascii?Q?rHBYqRt2hzdPA2etBL4rTW8gGlPydiYQWnhWOCNhBSUtDp4fYZ7phmsKI/u1?=
 =?us-ascii?Q?U3vMmZ+uFRPhoV+hS3rGgWzUz1Wk4Z83JUny5PxozhR0UIgKtCP0tFGiLhMW?=
 =?us-ascii?Q?lTTtsFQGmIM7fiv06lt+w7zn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b24d3e50-0d76-4d8a-f0b5-08d8f8efd59b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:33:44.1132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFo7ad7xsZCViapz7oVu3AVRJlljmTC0yC7L1u9BWWEipzrg2ylXcZc5I2A4gFiNN2eKYfxR9CW4z2Iiz4AIhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3765
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Claim clkhi and clklo as integer type to avoid possible calculation
errors caused by data overflow.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Reviewed-by: Fugang Duan <fugang.duan@nxp.com>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
---
V2 changes:
 - No change. Has been reviewed by Dong Aisheng <aisheng.dong@nxp.com> in V1.
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index d124c4000823..c2f8e49660ea 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -213,8 +213,8 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx)
    CLKHI = I2C_CLK_RATIO * clk_cycle */
 static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 {
-	u8 prescale, filt, sethold, clkhi, clklo, datavd;
-	unsigned int clk_rate, clk_cycle;
+	u8 prescale, filt, sethold, datavd;
+	unsigned int clk_rate, clk_cycle, clkhi, clklo;
 	enum lpi2c_imx_pincfg pincfg;
 	unsigned int temp;
 
-- 
2.25.1

