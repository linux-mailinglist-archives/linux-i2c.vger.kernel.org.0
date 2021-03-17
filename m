Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADDF733EA36
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Mar 2021 07:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhCQGyz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Mar 2021 02:54:55 -0400
Received: from mail-vi1eur05on2070.outbound.protection.outlook.com ([40.107.21.70]:53088
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230433AbhCQGy2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Mar 2021 02:54:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLD72RxoK4tXryKMHmk6gt6Ji3hsuRhoQ9uEHVsQVgguwUZWHo9gHC2gBxhv9Vj0eVDa58CLuDNUqwkoDxjnO6+xBEtfzmybzRlge46i3IfTyp8d5R5LQMs1j+ooo3MwewY2wD0377kc3vfPdm3FFRPrho649z3YO3bDd5g1IgVCGFIUNfEXhSO5HyDHTh8QFXIQZ+wTyPci1lfdZB3FBd3k1h38viXCT/5dnG+Hw64C1yxupHdT1CNzVqzMvLcFWhFpbfT33p9hJ0q8+UKGCg14HBpesOWuCT2pbyZQ2te2KmPQsrO43eegthhwUEbyNKMiO4pRtqdFlEswhFaPcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BagA/Axfg8Zv4aALC4CkXudKzO2dNPuET78QEzdF6Ho=;
 b=WvcEsM0C1xorAgMRT1apKKqjGnlnUEpbTq8CqpRz970lXmanwS4+dDTTZyuS7BOyx+zT0T58gCqBBM5ctQB3lK7XjT/c0cLFBSQr2ganNpWmIui0X8YC8IIaGerH+pPLuU/5XfihQgxKMTlMQ3bDjwjZBUjsZSYixNoVIz81ghXIXtzUZWJi8idBGxALwuDNZotMmYYC9/4S9zQk6xUc8ET8O+E+HzDBYXqiCiz1zmAllganV6fV4BmdXuNhBE/4xkHkvhtxQRM++vVS3icB2hwVPalFjv3Q/IYxrQ7nNpQ0IwNTl1cL3xukpOxmAGCh+molA0btEIGWCLXyPaw6GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BagA/Axfg8Zv4aALC4CkXudKzO2dNPuET78QEzdF6Ho=;
 b=ELUQf81zZvfuP/deXF8udVPMlBo17mkQbg8op5KUxl6J/5xF1oRrqpxRPxMkSpXd2hXbROI3QWeAPrgRkGF8dL4WzO8E5lvl5n2CMisuXqm2CyE7VL1yWP6aDemaYbpSH97VDgJSSoRVVQplx6vUabj19p74uIyheAKZs2bDCIY=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com (2603:10a6:208:123::11)
 by AM0PR04MB4196.eurprd04.prod.outlook.com (2603:10a6:208:56::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 06:54:24 +0000
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236]) by AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 06:54:24 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] i2c: imx-lpi2c: fix type char overflow issue when calculating the clock cycle
Date:   Wed, 17 Mar 2021 14:53:58 +0800
Message-Id: <20210317065359.3109394-11-xiaoning.wang@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by HK2PR02CA0215.apcprd02.prod.outlook.com (2603:1096:201:20::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 06:54:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e668afdf-2df3-4371-9b24-08d8e911800e
X-MS-TrafficTypeDiagnostic: AM0PR04MB4196:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB41965BAC41FFE75636AD6E0EF36A9@AM0PR04MB4196.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NRev2lVsWHr1HrhbLXLdpJWFu3fSOKjyxBfZnkir2RtH7ZsRoF3DibxOOyr0z12JP5ACI+F4E7TYuZa62CkudjfWKnH5inOn2EPuPyISRGD1YHl90ZYxbS+nGZDU7RiEvWijIkY9PrZBuayDa5rrNBhDATZW34MUEYmhlKfL620JPI06HAI4PNk+DCWl11mp6V5YnbLtOHZRImgU+Fvbw+xjseQmWtRCgiZOu7REL0ffJ9R/ieFvSn51/9mJm1huEaMCsPFdPOMwmn6L8pNnmIkeAa2A8irWlXY+i71peFcEHZH9+jAvWKAJMALVru4u6sBSqEkhkY5dod1AFKdz7JYWbIxXh5RKd3NQbKAmxvqHUgEL9sTFo1619hM/i7G/QOrySTwnjI+JUeZ6f2OMRwc0V7ZkGLqCcLjCltri7UZw+IzSMSjs0H8ct0fmGY6CTsbDY8RVFE2Pa7tp0+39lsOJPkR7F2slarTiZwJsFbDKlc3DpE8MWUD1e+e+huaZb8yodAvbnq7F6NSKh/yq7fp/wSWDTeEAqQfZ/tcAE5DXFneKfH8PXb+CijA0Hzzq/BeJb2E18CAXdFrvYNoJHYLpAOxF4xZduXEGNOHvJhNMEj3Mv/jf6AIB2GXgZ2ae
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5618.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(66946007)(6512007)(69590400012)(52116002)(26005)(6506007)(2906002)(36756003)(2616005)(8936002)(956004)(86362001)(4326008)(5660300002)(8676002)(66476007)(66556008)(478600001)(1076003)(6486002)(83380400001)(6666004)(316002)(16526019)(186003)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+MJpi/7tp5sUcZ86NHY+BvEe+PqHFaCTZ0Vf3lDcQjCL/6J96KrxZ4iZpjzW?=
 =?us-ascii?Q?PJaVWkbPLyb5xnfsmYe6gcsD18Mr6x5cTbMLB6Cv6tFXG0BefE0kpWeJVBnA?=
 =?us-ascii?Q?EC+1m39B0geNy5Zn8KIEaJAnHWGTij6FfpC8eiCNN7t57v9ab6bHeTsRrODO?=
 =?us-ascii?Q?VnbeIda1eAiGRQcyYIGJZJnkDTG/U8lHqKkVWaw2VMwrz3f2JoourIz1HxCM?=
 =?us-ascii?Q?uKNL0KLSd9MoWksi+pA0nJl+rJ/YOV07EkkJ7uKRNo+r2+3k1/+wkXroWxnO?=
 =?us-ascii?Q?/meFaVTeVvqgtFfi04Fk3aNst+wA0a6CVXQ5std8Xx8bPbLxITZOtuO2bLST?=
 =?us-ascii?Q?T3BDHPC8TYY6z36jDeUTbbV9zG4mK+yFM70CnJ5bGgE3lvWtrdgHSJpnMUio?=
 =?us-ascii?Q?SPTQfDatZFWb9PCuHJ5V/qaz+FH867FYrpF9xcdCGQAmwRW4KZurwpQYLZA7?=
 =?us-ascii?Q?gE4YgENBnKR2c2Y6YhtYwQbQIPxjG9oiLsLDw69QlLKiY/K58nI8dF3gVBaV?=
 =?us-ascii?Q?PRrcfWOoKfY0+KG9KjPXvoMykPuV/aqs/I5J6l4sWO+OMhAIoQ6NsVWqVmR6?=
 =?us-ascii?Q?GyVattogxMdZbo61laKHZnVkRuei3CY1hK7l0MtdKU7oWjWP+FJFlOLERKUc?=
 =?us-ascii?Q?Jt9ntLlGW5bLkuQJ1FxKX0H0wiEkls9D4O49zxlNRkx9mkhsAhV6H+aM35cC?=
 =?us-ascii?Q?H2Ho8PER3z/vihv1FYOc/i4sWOYv42LU9gu9nhMA4FKo++xhBEZL3VxsCxL5?=
 =?us-ascii?Q?3G12pGQpgcypF/B8bKFvrkO+e1+2n7D/XM7A+SDZWN1TTiwHbhwJNEvTBkeL?=
 =?us-ascii?Q?y+KG9AN2kI8wTgmhX5umjH6SVYzR+rj9ZHCNIWawT6qNqTtLo8GnRoQ7u4/f?=
 =?us-ascii?Q?r5BVmDjU+TGencJcbdCkgB/ntRx/Hd6B9oKI9L4fmNKSuteClrrVKG8+P4Eg?=
 =?us-ascii?Q?hViySKiOKm6Y72xAu8E1Q3azhLQ7MOobRSvnEH5DeflBvSEOeYDN6qHlJQOU?=
 =?us-ascii?Q?7sBVA4DtXxjwhz83DjGQfw0B7ZgX5MExjw/iVN9zFhXzQka2EGYdBlDn6yPF?=
 =?us-ascii?Q?aNYCvvulphRJNoEv0fFmsCelSw0WNkPKwOdeWr5wVs4COcXkBOzgeVSyC/8W?=
 =?us-ascii?Q?D7DqUj3zziUBeYrYTmNWjm47km/PYIog9DPL7svtC42KZx7+YdzAfi7noO8E?=
 =?us-ascii?Q?FoG7nvgyXbMTRDGErCGmTtEqpLCM9sUap2QlxWbLuo8kJUxrz1Im5393L4eS?=
 =?us-ascii?Q?zWeaxlrwwQ0jzOL82pHhNyVuMAyiNWxllXiplc3x7z+Je1YabOACKmvNnTbI?=
 =?us-ascii?Q?Xdsm0LfhT1fWuiwUFYPwALJp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e668afdf-2df3-4371-9b24-08d8e911800e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5618.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 06:54:24.8200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGJf1H4JNg/EbA4wZPqhAd/bVWNee2oLoenTFnjZcMQRLKeHCzbk/W54gOMYze5RqzYPHOsxWhDDSMudYszlxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4196
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Claim clkhi and clklo as integer type to avoid possible calculation
errors caused by data overflow.

Reviewed-by: Fugang Duan <fugang.duan@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 5dbe85126f24..1e26672d47bf 100644
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

