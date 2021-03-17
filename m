Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8635F33EA2A
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Mar 2021 07:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhCQGyZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Mar 2021 02:54:25 -0400
Received: from mail-eopbgr80049.outbound.protection.outlook.com ([40.107.8.49]:29255
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229613AbhCQGyR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Mar 2021 02:54:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HG3GE7YuDacdYmzfLwIhwEvVcW6SgLrwk8GJHPG4bxjeeO9FdPILcJt7kFC2cIS2RlKif05FfOadycWx9/Fjx6UUPTMe3M1dUywQrW3cYZpKAzbDegbMXQRnbVpPBODEBAF44tPcNFMgWUDwo0xNSwroEz9grBaU+VqN6JnXwEPll8Qef5NCIKLdlilcTCbGcss4Zqh+FY1QKYANHm7f67X/2xR4mzWfLkp+jsixSMYWky3GpRNYm2hhDRuU9K/wDUGzXsdsTEiKEA0FAn0yu8Is9yvObCVR067XbHFyHHlOb5xzlNh3qUys22kJgKns0iS40G13FLlLl2At1WnBdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9i3nQH7+71iMs/WFQuZ/Ffy/uBGsJ8hTRVVtVVxavU=;
 b=CcCTooiill7ZuhB7SHrFjcqTNx0MtsSde+cTq+S0bciifk4RNimg7RjmpXd0DKzxcqMY9ZiMr5wjTUSg4i1ODudVdDi9qkkDzbvNNEq4Xj9skjryBAQvF4kvlINt01wGchaux+MGaVrZZLw23DT/xGjE0mh0yXnB2d3VZLY0IgCMLeVhEhZGSGojfxc4Mlo+2Yszl/RDxklRblzvPOZZS2NowZQdXJA+i9IZ2LX3Zhao/UYwGj8Rm8vs2b8PWdgsRsr0IkxVse6/wB9hT/90OEIyIVbcIJ4Kt7j1kHkJXTegHwmPUv8HbdJBOXaQU+H+q+mgdpNs6B95iUVlO29NKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9i3nQH7+71iMs/WFQuZ/Ffy/uBGsJ8hTRVVtVVxavU=;
 b=dPJo+vZVd+c5GPDs9LiLG80RswFkOpnaTyYcayiHEcFFyAowSc8FJLirsMFTzr8Poaa5Qxr+w89z4Q45s1a9BEz3rqKw4imsEpBfnz9fMkbVMvS6IzuykiDSeGXQlrrf+TOfvldbpTW7cA66Yl4eUmsqAX9hLqF4UMfE0DeCDyM=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com (2603:10a6:208:123::11)
 by AM0PR04MB7091.eurprd04.prod.outlook.com (2603:10a6:208:197::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 06:54:14 +0000
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236]) by AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 06:54:14 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] i2c: imx-lpi2c: increase PM timeout to avoid operate clk frequently
Date:   Wed, 17 Mar 2021 14:53:55 +0800
Message-Id: <20210317065359.3109394-8-xiaoning.wang@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by HK2PR02CA0215.apcprd02.prod.outlook.com (2603:1096:201:20::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 06:54:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fad57526-5e49-40e2-82f4-08d8e9117997
X-MS-TrafficTypeDiagnostic: AM0PR04MB7091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB709100D2D7A3B5A8846D43AAF36A9@AM0PR04MB7091.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RJAb/TiLPhiBKsatbnzMcpb8CJg5F1QvmB2VVlNZ28iYqfbF/mgFVRUB4vh4z4vMfZ7e3saGfm/Oh0H9v7VtSwtq5DSdUuXaJx2Fj3RpnGWIO4FuJnW7O0+A8Yis1HttkxdSq8K8tEREiAG+s1s/Y/kZracmzqNsTkDmvw1sLspxLzT9cDGLJ7CRF9JId7ts9suLnsUZVS9PKNFvzoMlhxBXX/u24fd/s9QguDUvfZyWFmEw79WCl/uFikNI4wK/csC9U1cSkq8MKIW8cMTZADrL7CJEkxHqWL3OjMkJqywLFpsAhbhAfBBJEtiabVFwM66bik+DNyaNcHfoA61v5HfKxFYbkWQFHqRa4nktIkHncVxmi0vAsGM5mnz7iEyAQ5ih83s8HG3/lyD+2vPqkgN66OtbQtrlEEmHSTdUMxqohY8vTcbsD3nc/yCm32JKarSm5m21u8VHIzjmhylm0mH6IxN+iVGsMNkhqkLaVVmnmB9BagjXQqG7tpolsQBHpBLFoKEd2IIgaw0YhFsvmRllFeFNvmIDV01NYzUl7aH+L0VCRpGJiIuwfE26KMfUjab3yeQ69PLwxf0oYqCh63l2Tw49YaD5kMU+vUsXxLmgimzQPasUwS/2w9n5hoql
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5618.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(478600001)(4744005)(66556008)(66476007)(69590400012)(6506007)(66946007)(83380400001)(36756003)(16526019)(5660300002)(2616005)(316002)(2906002)(1076003)(8936002)(26005)(52116002)(186003)(956004)(4326008)(6512007)(6486002)(8676002)(6666004)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SIrTMaCTH7QpPtotguuUmr7ov89r9GFBWxEVZmmRokZiDoZKwJ+JdTBffTFr?=
 =?us-ascii?Q?eeU0whW4RThmD0WYNK6Wwn2UfoBYcBE2MWr9vsY9J7qQMhwMV1zl+VIaWPvF?=
 =?us-ascii?Q?GuaM5angxekBcobQz+7M8A0ufbXhp+uYOizdf7V9z0stQE6cGcMv8M92Edvr?=
 =?us-ascii?Q?PvklvJMmsbH5si5nZ8biEQynFAUCMebuamtx9HFCVj649l4Jwwmy3YJSGYp8?=
 =?us-ascii?Q?7J+70VEEVSqsGqySqfzXizLATN7Wirl5UcqBeqAVyERZNeMRO+Aki5Cszkkl?=
 =?us-ascii?Q?2EUFEuoKDmil9k+6XKVlZlBpZpGg38iuEh4tVl4uDelS6jOQDkZFRkQ76GdA?=
 =?us-ascii?Q?jQ4O6RTzPE+gfL4xFlykRziIcKT+S4pNFm7JjyQ0XKuLGjQ/tjXcZYmNszxo?=
 =?us-ascii?Q?dwiOUGZPhA0Q8hHeHB/Ad9lr5WSkupi/WcFwvvrbAn+1N/2Uht9j6GNLES5c?=
 =?us-ascii?Q?f0Pfp/yI3CeJMxnwqviZY7DAnaAyCLVSpgJwstORclLQvvpX3bqf4Yez0Qsg?=
 =?us-ascii?Q?snrSpRRmlq9/jsG/UfHgRtvWB68cRq2hEjXGG1A3r8L1L5jWhcjVQsKHD2X3?=
 =?us-ascii?Q?hJ2ToqnjCSkZTaV2Rcw4k8183H0rRAc+I4sjoPYTUMoUyzSmILvEpehiAy44?=
 =?us-ascii?Q?LqIn9GnyULbc0WvseZu3QGDJbkhfrz2wHVkywfCOmbVwnG5At9rVpcg3+oGe?=
 =?us-ascii?Q?yrEfQ+qlGKDp/SJlIBYsmdm+S3v2KltFJedqwd5MJ2oSDt6jlxmEahTMvOzI?=
 =?us-ascii?Q?ZWYlJAjF7Vcg8jJ39t4sKgHfcFkjDAaN+qRqzjRw3JZLe+lX4DsDKs5dYgsv?=
 =?us-ascii?Q?XCgxpQBfLPl8YHejY/pRHUlYIpwcnmXxhGWJaAbThd+R+g0oKh9scf9fcWEg?=
 =?us-ascii?Q?aQ62HkCuo0j7/ZZo9pyKrKSwOYTLzoHwiKGj79+Z2Ox7FWQ9k0/tUSxP/Mgj?=
 =?us-ascii?Q?xoPE2CLyqRxlVOpbDgHs9CqhxVkYdYupYA2aJls0JBm6FelFqVqxlS34NLw0?=
 =?us-ascii?Q?B184tq792J1zplANHTufc53odzWix3BIxvw274pNLzzMZuwo0feYCjKkbnbw?=
 =?us-ascii?Q?cX8aDqN2bOk7n+g/SxMqHy+BowT9wa7pi5rELCg5UrW6GqfQ3UEP+pFDO7gW?=
 =?us-ascii?Q?n1FvkRD21xjpuO4VbuKEyGQynQx9VZemnwRJJEYrF+HlV5gki7dDdR/rCHVQ?=
 =?us-ascii?Q?sz3PNhw1y804AhkFDoImTkqzsYtgDhsH1vlOeTQHYy5R41cSxo485l1OavBa?=
 =?us-ascii?Q?oTk6dYdt/HbDyXL0QIKBAV4Rio2o+uwm+hKft8Uq6rTj6oQ8LZEMNOyTa98/?=
 =?us-ascii?Q?GNiHNbxC6eSeSjEpOwojHCUq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad57526-5e49-40e2-82f4-08d8e9117997
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5618.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 06:54:14.0021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXrXRuV+5qPR/4WFqG42AqYrAFUG0maeIiHfCeM52yKIlhTc5KewikV2eCg53wMoNiZEOoq7om7zfp3Q1yIQig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7091
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Switching the clock frequently will affect the data transmission
efficiency, and prolong the timeout to reduce autosuspend times for
lpi2c.

Acked-by: Fugang Duan <fugang.duan@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 86b69852f7be..c0cb77c66090 100644
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

