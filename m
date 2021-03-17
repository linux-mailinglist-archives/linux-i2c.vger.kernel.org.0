Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3934E33EA26
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Mar 2021 07:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbhCQGyZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Mar 2021 02:54:25 -0400
Received: from mail-eopbgr80047.outbound.protection.outlook.com ([40.107.8.47]:57027
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230241AbhCQGyN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Mar 2021 02:54:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmC6X4EC1lx/7aHzFr1KJpEqbhbqNRNi3UgZFKlUJPg8VjOR71yzR35TFgOMpysJZdG5G+k1ztvOX9S24RC1in/0kpS65AfdaFbLM94iEaGIhojUvEF+bcOLaM+VxJ7LryNooemo/rA4rk4KzuumWcUwylZfaUp01+NxQnHbh0ozBLcUMBOC09AqKQJmR9IJFUnximcpJz23VrDMui+iGO+N2FmEeTGMHc7vGTXa8W5dYgH9u7Cyo/z5F7JEeP54B6zO8hsKEaRjLSIZuCdLEvhgObR6gZp8igdnT0+gT0/B1zKpXiJSzc9HJVEJfUwur6rVwpDEV+frIZiJkkLppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzRv8MUSSO9tJB1wBGVQAJWYkqphr96Kj5zqbos6gsE=;
 b=JPBlJvpYzHtcfSjeN6d29hoiRb14JnZMYuRoVG1HgztD7HKM+VNS4+5/RNCP/cN15BFbPwX8En06Pdl18Xe37LyHwhXzLQfUh4CzDRhRnxJsEJv5hOp2S3B6z85nQGAqYoAjf7RGtsxFX5duY+UeJl60qSJvaZjx950irzK4kcGdngVrX/BwZqn7IbyhjSGAVyAQw5juNabL2HedEslOcmKboIzpilabSXThfP8d47hR2Hf8K7s3ocaPgmF9c9MSZ54Ngfn9RJJiPQvfQHaqj+A8XBHJUbmX4JtfNiqO0N6ecmos8zuJSHrAWZlZOZmOnCZ2p6wVG7FIG88I+sbAKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzRv8MUSSO9tJB1wBGVQAJWYkqphr96Kj5zqbos6gsE=;
 b=azDGliFpiw+Iooaigw41+9umP8oJTxBWIjHYEsrDM4fV2jlofGjihPg8SWhqGlG9jdDKSlKmjacMoRSocywIOyNevdJ7vz3+Zfi6cBBHDtvi/+X49GelNGHw8fasQYqsUldcEyp8h7Rslhj23EKF11RXSywOpEUIozxvmnx1kZI=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com (2603:10a6:208:123::11)
 by AM0PR04MB7091.eurprd04.prod.outlook.com (2603:10a6:208:197::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 06:54:10 +0000
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236]) by AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 06:54:10 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] i2c: imx-lpi2c: improve i2c driver probe priority
Date:   Wed, 17 Mar 2021 14:53:54 +0800
Message-Id: <20210317065359.3109394-7-xiaoning.wang@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by HK2PR02CA0215.apcprd02.prod.outlook.com (2603:1096:201:20::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 06:54:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e4fc1dc5-99c4-4696-a1e3-08d8e911775b
X-MS-TrafficTypeDiagnostic: AM0PR04MB7091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB7091D8ECA745182247E78155F36A9@AM0PR04MB7091.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dN8DtHG5adnYlIWOKZuc+DXYUFdw6dP6Zs37hMezQ1R0aXBE2GNAPeZLDLxDEL1hQkpO60pUjUv+PwM8EJfMk0YygPUM6eTzRFBmkA539MjvCI3rwAgHD9gr/LSsGbmXjy6tpDt0+eWPXf8iZWAvMKNxLtljAO4wRXCa137/gyz4OuRjTYspErw2Y8M1MkMWW9Utmt2VRMnzoxJpjsZ1GP1ZCOw0KyNVsKnt0rfyxIuFbmA/k/PZ4HWRkyE4T9JIH6YPidMx4dlG4AbewvWUYH4ZvthXmSQkjoD+o3s7DzzseL8huxmGsMjwBz+gM/FjXw07rcwbtg9AxtEWUW/LYXLNYgzbZID3NjElG6VvLQZxPrAqeVmCq51KgjIkgPqUrlJGU1Y5IW1HyAN7zc3+dsUJ1njpk/yJfEnedM5CDaSKK7uSEG9OIkWfbot+9SzX7knw4bFR+sQ/++m1Bl4iJ+RszRJ+HM116S82ow4kNoSqSFW4JXAKiIvdlo6/wuaFeT1w2wUbefK2DlFpY8j6AKTzlofnby6n3cFNEKEF6U85xfED6V228T41vsjit6MKFzN5mkM7cdtQltj6dXM/2sbHEx/Scpkej0IaQ+FHsMsUTjmmrf2QkYW5NYgF/gPi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5618.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(478600001)(4744005)(66556008)(66476007)(69590400012)(6506007)(66946007)(83380400001)(36756003)(16526019)(5660300002)(2616005)(316002)(2906002)(1076003)(8936002)(26005)(52116002)(186003)(956004)(4326008)(6512007)(6486002)(8676002)(6666004)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LbWkd/LXYTxbazK0ZezkOmZfldghVxtiYhk24kouA+OgW1mj7U3vFXe4rdxO?=
 =?us-ascii?Q?IBUQJunMp75TIpEkuizy7tXku+cJlhQwsuCeHdVDirpsgkA5dwOFEIa/lrJi?=
 =?us-ascii?Q?y+2g5zonIti37DwAnf7c3DeFPX9bMLi9BUHdlje12mf/wMnIsenspLb8HDLM?=
 =?us-ascii?Q?OQZQWHGrm1gw9WXM62hrMntlEaqiSWqqwqj/shK6aaqJfmNCdkPhmnyCv+bk?=
 =?us-ascii?Q?NUXJpl8pe6hlZfWypxenDK1fNeJvfvu2g4f0Z6TZTRx2CPIrcqXU02l0Sb/A?=
 =?us-ascii?Q?TB1NagRnXl+5UCKs5CUOmU0fxJkupEL98tCF+qzYbV45w5vfuj4NZdq+abpB?=
 =?us-ascii?Q?PqFKI9n+tE787IyNH+YCHkKci+EwQJH5ObYbIhNMMu4Cg2hwnbwLTaFvnong?=
 =?us-ascii?Q?NbwLvHkYPtWOwB+Pi7wVTvuts3uy5QUnYV1/C5YeT9DKIsUcUM2h9ZSP7UHt?=
 =?us-ascii?Q?PYYtk7qui6kDKDcVxS7KbGam8n8rAn03B+VE8xpu/YLDGGwBc/pOg3eKdmWf?=
 =?us-ascii?Q?SB97IMme+6v1Bo5AN02LGt0XIfdPCCF7ByhmktATcRPiNCchzJt3KYx11JTI?=
 =?us-ascii?Q?lXYx7P9JggK9h6tIZG9V+lDAGCQK0e0OZTxdywwvcZbZtvwfIJolkv5bOcER?=
 =?us-ascii?Q?+qBE6ymH1lMZFQUk6C/qBU0BUFsdEOLGWNMJIKmrScpI/x25YJOAeR2t3AIj?=
 =?us-ascii?Q?DiFZV2O55gr7ous91NSqJ+TwSrbT/TfEd5z1rrr13g/MHkhaocuFNSuuuoKM?=
 =?us-ascii?Q?opxmVRdWvVS/UCXl0nd0rw6NR5FSkeHoVnAX8njijuasvRrXUOJT2rhG55da?=
 =?us-ascii?Q?eO/KcIWa2czztZ6npKocCAPw1eAJ3hU+MFNlVeQ9BBawypgUGknFnWnfYyre?=
 =?us-ascii?Q?eLF4jwGJ4ylMzKCIfnUNeap0/gfb3tc27SSuhBWSV0Kq0cWputEA+pvn6tNp?=
 =?us-ascii?Q?o3iMnnA3gjIXrAnU87tKVfeu2qtqdBuk5WPRyDRzilNau/mOzuwYf/DVV6qc?=
 =?us-ascii?Q?J868stsUbyMVDV02OgkzcMEyQlnf4b+ZWl47qWLBZrSu+fKnU97HfsfCBgGl?=
 =?us-ascii?Q?EP7iknaEHIObrZOwUQVbsq90VSvlBnf7wOqVJnAa4Z1YV65NJp6lsVvVMJgT?=
 =?us-ascii?Q?KZcf5r3Z0QknNc0DwMBDPm4vaRVwGyeMlpUr1luo4J0uxiDLhTjnqssWRHiU?=
 =?us-ascii?Q?DnVoJTbU6t1RWH3UnLSefn8+9s9WEiIX22xheK9G1QdvOMHybNpft24bF1JT?=
 =?us-ascii?Q?nPGzKQKw30u9Qgyq7F16CaGI0i/dFxa+zDVSUvcfaHsjoQtbWVWfX0/drH+z?=
 =?us-ascii?Q?Jf/mbIuD/57PUQMpqoUNzmrV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4fc1dc5-99c4-4696-a1e3-08d8e911775b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5618.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 06:54:10.2612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pgq86uDsZB3a9lpqJ1LN1x0n70/Ww7fu68PtZ8gYiGQUIuV5N8kPqRFWWnxjztuuOIliMPudnGT+5WozPhc/mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7091
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Gao Pan <pandy.gao@nxp.com>

use subsys_initcall for i2c driver to improve i2c driver probe priority

Signed-off-by: Gao Pan <pandy.gao@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 8f9dd3dd2951..86b69852f7be 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -710,7 +710,17 @@ static struct platform_driver lpi2c_imx_driver = {
 	},
 };
 
-module_platform_driver(lpi2c_imx_driver);
+static int __init lpi2c_imx_init(void)
+{
+	return platform_driver_register(&lpi2c_imx_driver);
+}
+subsys_initcall(lpi2c_imx_init);
+
+static void __exit lpi2c_imx_exit(void)
+{
+	platform_driver_unregister(&lpi2c_imx_driver);
+}
+module_exit(lpi2c_imx_exit);
 
 MODULE_AUTHOR("Gao Pan <pandy.gao@nxp.com>");
 MODULE_DESCRIPTION("I2C adapter driver for LPI2C bus");
-- 
2.25.1

