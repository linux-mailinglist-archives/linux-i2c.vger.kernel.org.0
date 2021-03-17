Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D822333EA28
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Mar 2021 07:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbhCQGyY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Mar 2021 02:54:24 -0400
Received: from mail-vi1eur05on2075.outbound.protection.outlook.com ([40.107.21.75]:1377
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229904AbhCQGyI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Mar 2021 02:54:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPeY8SBnuER2qLiDzt0ixN18MkoIwx5gE/OoE3i+CxtPMl44STFNppqGnZlUEWUggsMMIaAqwxiY9MXdpanTXAapFETAeHkOotWBkh0+UdxTv9J1KQ2PbpWbA7J2qAGFcyCPZJAzvnH7RH5sFhVbxtO1P2ZMzZdJKCLqIp6gexE0UjCVlDfcPNIlTvYB6gw2vVxEgzJiNoZ1DgPg4DGvRzvYo9KGi5onaKumlKKwCj+Na4UbGsRQQdHavUXzJBaI+NE1Bl0If5gk2fWcAclC279eneJbZxMfKGIyBYZUaCidIryWniM/kwXWvwLMtUmEfhFTjraNzZRk5G2+9ate4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDxjwFrFhj+Xb4ZbEYW9R0HtG+uvExh/1+L0PbKZQgo=;
 b=XDybOakP7/w69NR4gu/3FJVNnJoq8Z/xukF/t3a6FmjohWkYgToUQ+x6Jsb01lsqiCtZIzfdXIzRTNxpcXlD3K+uEJZYpC8KGHKInfSRLtpAQqAcH3Lwds6079xLFApCHgUN7u2oP9voH+2BPbFuQm/QUdSPdbKFClpIzW/ALNw9F+lFVStp0jDhBm6rxWMHt1kO/Aq1Cew+pgEzuFnJrGOE6QQbwx1h+LFY8Vl6i1wOQZTmwGDS1IVRn28ivL3y71EhZ8HLljkVb3h/kFNX/4MxzngltgES6P79DBcDDARF2siYR69s7vUYD6ldXNoQH0A19SDij39HqWV3tF64VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDxjwFrFhj+Xb4ZbEYW9R0HtG+uvExh/1+L0PbKZQgo=;
 b=keyfHUMtzu6bJSBFR7kC26uJrvtp24tFjezzioe4xMh8asLqYqp/jH3PkVFCrV7O2rHbrLJ5JukJsBEr6e5FAn3HRPYSz9hHxiABSASEnhEfcRK7+Uf6otoXYi9q9Ju/jGuCO9i2j94m7JBMFVdAOE9S+YCepiMZdlIjOK5diU0=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com (2603:10a6:208:123::11)
 by AM0PR04MB7091.eurprd04.prod.outlook.com (2603:10a6:208:197::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 06:54:06 +0000
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236]) by AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 06:54:06 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] i2c: imx-lpi2c: add debug message when i2c peripheral clk doesn't work
Date:   Wed, 17 Mar 2021 14:53:53 +0800
Message-Id: <20210317065359.3109394-6-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR02CA0215.apcprd02.prod.outlook.com
 (2603:1096:201:20::27) To AM0PR04MB5618.eurprd04.prod.outlook.com
 (2603:10a6:208:123::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by HK2PR02CA0215.apcprd02.prod.outlook.com (2603:1096:201:20::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 06:54:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 27f2fe57-cc8d-4472-b736-08d8e911752c
X-MS-TrafficTypeDiagnostic: AM0PR04MB7091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB70912B0C294B0C77C2854EE7F36A9@AM0PR04MB7091.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XJoAXeGe0TSpeF7+iLiUNJRMnS2nU+Nw+kYl5OVyzz8JymT9s201gSNlLdIzPoPTsTRxewW7F+k6VqRyOMODmZGP3OKxg7VmGk1TKHjAdcgDOlXpJqkqVeNiZygka6p6uxSc+o+eqxJxk3JIReCIroQ0JQKrEO3kOXLhBTTgURpNPYN4UelRxj0ZUI6HAww+xY/D1v3VPXpK9m3e4kI0PJRJUIefkh/S+RLg12NI7BuKKVmuh78iC3KFv3+m9Pyy4FgnUM65cwEAOOhZPMoaaCz2SxkuATHTUzdv8tWCkNYLqSBsXKKYHkp+GcxrM/GQ9l6qlk4gx4yYMY4ogE56yTKSHunrru9PblXhIbBKDT1GhW7cMYpa8s3jXgYhv1KDL1AVUC6n8W3nE/TjVI8Rtn1N0HN3VR7Zg0lBgmxbxKMOtjLvlDNV/uNS9v9WkqSpfp4Nl/1oPQgI7FGMyyVBBQZ2AAhKetsjuoBGzk1iQ01IxU1N6hn3aO60GDlHJmF7nguV5zaBc/3VcHimun1iRypZbk55o0m8rzEKIZ5N4Ma0FgY7kdtIhL4f8aZ15Q+T0qJM1GxenxR0nCOGSU/hXBRkQrOfKFg6A0/k59FlWsqQxsogyWacXVYFRyWDfKHU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5618.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(478600001)(4744005)(66556008)(66476007)(69590400012)(6506007)(66946007)(83380400001)(36756003)(16526019)(5660300002)(2616005)(316002)(15650500001)(2906002)(1076003)(8936002)(26005)(52116002)(186003)(956004)(4326008)(6512007)(6486002)(8676002)(6666004)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dWa8ln4BD12slHdt5kN9keTtpTN5ciuqxuQqgvmKe7qWC82RdBzaH6rGheum?=
 =?us-ascii?Q?2CXzhZa9gWtOaFmyoSknVHQh0WuFWChzOOyWyZtmSEpcR7C1N72u0YTwe9kU?=
 =?us-ascii?Q?h7pGcDcN+v1VflJyb1W2k5yODtm3j1Jm2Auf/IAU8XmkbqKqIqB23vU1MrFr?=
 =?us-ascii?Q?8wLgGQI/xvMJsD+SlmNniksR8xwpIfE2JBuYA8vwoKL0FzI1XXfViG00hBJS?=
 =?us-ascii?Q?1yt6V8aJi9Qc/8s7FJ+HnmZncQ0DbENaOWJtQig0lZCWNlhYTf3Vk6yb+6SB?=
 =?us-ascii?Q?+UpBWJdZQj3/sNhRRAbqXjLrjiloXLrUsNPOU/JORElpxaHl1OQAmvURIq0v?=
 =?us-ascii?Q?60qHndX9q1A9oShGm7kUjC6XBM6X1JcwMwKrzbLwlnqPlEC9q1jesGgJdaN5?=
 =?us-ascii?Q?RRch/G9fz6zJbZsA3VBpldb36mKb5+yecIFi1XQ49wQRN7hYa6vzvxMvsaCg?=
 =?us-ascii?Q?PWlRtYOdQ5soahTq894KZK55mN9m1uJLP2pen9dV4JaG3FWg5lJbLRwHLew+?=
 =?us-ascii?Q?6KQ6njZuf35cZHRLDTgnB0wPBdbG+4mVlVd4+EW/dB2jHttz/iGE4QlkJTxu?=
 =?us-ascii?Q?p4bt1nO5oKyVXLoxe4psSJMN4sWiN6P6qvwZPnpCNVflMbEBhkFbzJTpxf+w?=
 =?us-ascii?Q?Z2vICG7tZAvr1cl3Iy0163cwzv4JHnJrGfaAzIUNkq4mQCKORts9SmcqlwW1?=
 =?us-ascii?Q?hFhaAhHTdq1KAKA1cQmmU0saPj/t73E6W1E6lCKHkU/3inTXdDVWGPl97Jae?=
 =?us-ascii?Q?KM+54td4ImFi58iTYpBPkiRMvS9HAUgeKTupfp4ZPX6qWXWyU6xU1Q810ctU?=
 =?us-ascii?Q?Blt13tvmjabRJLn5K+dL6rwRT4WKxzzGnfuJve0w1fcLq6Di3t2UYSPWGr8w?=
 =?us-ascii?Q?DfhcKNYQ1wApv5ioa6D6RO+55tmGyQNYTP9t+/g9JhGwm7hXq1uSWW6rO+5r?=
 =?us-ascii?Q?dNMnDhyRo3J5Flk78yb3tf2yz3MxOZaUFtvFzUMdoJh7NU81n+rf44H5z4d5?=
 =?us-ascii?Q?nV6bFSolH+mk2KPIEIRx0ia9qoo72m2QKvsFriqL12kTJc6nX0Zw29dhhUic?=
 =?us-ascii?Q?YHOgenFpTIz5DWc11hFy7xPv0jwwHJPkN2OcJq6Sz/6E7XK5ZTl2hNs9YPVj?=
 =?us-ascii?Q?rjOSr7hn4IMXOl3ooAjbNjb4bIHwUOkXgxNY/e49rnMf05C2OIwZqTO/mnQp?=
 =?us-ascii?Q?efc783PQrqrFSaLK6kDqDNqxDvEvhVX8+8uGtXF4O2y/UfjOzFaOfmn9TV14?=
 =?us-ascii?Q?suCuZW2Gu5BlWL6tLVzi9gxQWuOhhbRgoCmHMYAS77uRffCSecZvdB3cEUv6?=
 =?us-ascii?Q?vjAbyBUoyQ20eLRgybjLAGXf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f2fe57-cc8d-4472-b736-08d8e911752c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5618.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 06:54:06.5524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrXj7joMJFP7k5cxp6/4Yf6JLv+pYG9owXdqJjj/3iWmXu4MyaWh0iFLcQrycf1BFyX8d6oBdqDhJLbrmWV9kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7091
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Gao Pan <pandy.gao@nxp.com>

add debug message when i2c peripheral clk rate is 0, then
directly return -EINVAL.

Signed-off-by: Gao Pan <pandy.gao@nxp.com>
Reviewed-by: Andy Duan <fugang.duan@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index e718bb6b2387..8f9dd3dd2951 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -209,7 +209,12 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 
 	lpi2c_imx_set_mode(lpi2c_imx);
 
-	clk_rate = clk_get_rate(lpi2c_imx->clk);
+	clk_rate = clk_get_rate(lpi2c_imx->clk_per);
+	if (!clk_rate) {
+		dev_dbg(&lpi2c_imx->adapter.dev, "clk_per rate is 0\n");
+		return -EINVAL;
+	}
+
 	if (lpi2c_imx->mode == HS || lpi2c_imx->mode == ULTRA_FAST)
 		filt = 0;
 	else
-- 
2.25.1

