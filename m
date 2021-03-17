Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAA5333EA25
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Mar 2021 07:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbhCQGyX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Mar 2021 02:54:23 -0400
Received: from mail-eopbgr80059.outbound.protection.outlook.com ([40.107.8.59]:40017
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230224AbhCQGyB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Mar 2021 02:54:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gISrt13dCZUFZO4eVbO9ctQn22ruluP0hWiuAaLNRU1943kvzTWYIKlqzGg07jtPFkEz2dCTShqD4g8wgbdAWV7i44nWEDTHGoRTOooV2GOOwIViayaD2JLnT1uHyFRavAyhOJZzmAQO/zGPdOWbtpL2gmY+7RYu+PlvOykjj8gR6ufCYTOKOfCVlRjc8lbzeAyPfksi94g+rDnJYTZnsEhLVBnpAE8MfQj4u1hTHDs7Y0M1IjBM8ZKUxdnGdS3YXkFUnAb/zSyZt6Yr5J32QsGToUpOM57NrpVdJjklSVqLlYG49MAv3iW3lgzHdfX9TyUG7NMyWRPVMaCirZyBVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJZXvAPB4JFtFYVB8ctM2LZCEtm9/HphDpEZmAwLhbg=;
 b=ndG+HLvcaDFkv+HJ+2dCJjz0y7Fy63No3zhaO2W0NQ4lIgAW/Phw1AtV6oKdxLB/7aOcF2nRtSFfPY0FYoJK6yhzIVjWDGbH3HMfXxYYnG34U4+hjEwHRgpzcORGBati/gyVCKo58DtcSVi66ApMe7vfnwFhuCedYiOsJSKRT4OthRmuJzHiG0ublAqyEg54xVgM0+o9s+91/BqrthdNd1A0bEr3Z8oK4ak2Grf3x/Riv5WPpFY6YdIG1HTORIadYHWuwM13DHnpLt9wLOARBwXPhGQ7ML9IHbbDKlEpp075VedL7CcdqtbAwhNbu4FLu0DRq+N7k1JKzv9AvZmIQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJZXvAPB4JFtFYVB8ctM2LZCEtm9/HphDpEZmAwLhbg=;
 b=sJJuwST/cIPFabTT8V3aQzMTP5+zSwxS67X1sP1SAVgtLroRPBVIG6gt+f3kJVf0JCc2gmmxN5cUe72UZ7igqJQ79LKNVrrxvab+2ybDijvEDlBa1lXCSCdvhrVqxSUirYJrhOPK5QK8u8wRQz9hmjwCgPKlDHNdV4E7uiKtq5s=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com (2603:10a6:208:123::11)
 by AM0PR04MB7091.eurprd04.prod.outlook.com (2603:10a6:208:197::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 06:53:59 +0000
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236]) by AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 06:53:59 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] i2c: imx-lpi2c: add ipg clk for lpi2c driver
Date:   Wed, 17 Mar 2021 14:53:51 +0800
Message-Id: <20210317065359.3109394-4-xiaoning.wang@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by HK2PR02CA0215.apcprd02.prod.outlook.com (2603:1096:201:20::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 06:53:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c28b101a-82bf-42e2-315e-08d8e91170fa
X-MS-TrafficTypeDiagnostic: AM0PR04MB7091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB70916E4E526CED966A740FB1F36A9@AM0PR04MB7091.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 50+K/JUGsVvZjg7Zw4nTBTiDxkhjOV1Rba0NcB6uXAAeFw0T0VH4ySOKEyNfo1MT3wQZgX5Yz6EYpJZKUkteVnNZi0OgvroHU7Dg0T59uwuHkFs6ooQqrYbFqsk9Bonrukb2ILCQLOvwZLgxpK8ALr3n8sDJt9TDpRyTud4DugpDrPdAVwXCM9hnDwdWouz/ThhovZvZBTF444D3EDPvdmdUj9L9ENkSaLUkKsD2G7TE1OEourYWXoZ39JTrq2C5Tc5I+YkQqrXPWVV68YatiLU8afpGgptgWbBVIq5gTYmMbiZ7lEQw8FbN0uj3pexdLRZ7ax1dK+usj2etc3WzqnbttDauSw4MfuKvvVRrr3b0KThrkwW3nsYczHBfBPiYEp36x4vCjKPU3pwpxVkynfN/qiqZ3zp7ujgTOMyMbqYImRZ+bur5RddkRTRuWskk42xJUyVXdc7RQGh7Il0BC2skhgZp4/a5Q+f10CwuxhKz2rd1XnCAemlv8tzUhpOzfHgBPGkpqGtfwzMUB28V7AzHRBLujSBn0Q5o5ofKv5oCyN8iCG8ZP2RBULWn5DYC/H/l04u2nHrqXbLH2C/J9hU/P+yQB0nzwvpLOTi+UDlu+Kq45AS0ZMkXHp0DhkdR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5618.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(478600001)(66556008)(66476007)(69590400012)(6506007)(66946007)(83380400001)(36756003)(16526019)(5660300002)(2616005)(316002)(2906002)(1076003)(8936002)(26005)(52116002)(186003)(956004)(4326008)(6512007)(6486002)(8676002)(6666004)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZpG5FI/QHtWIzUgNOziPaKHVm5cBwW0xK/Za8dtbP1rpYr2qaTKLmakArNvP?=
 =?us-ascii?Q?3atfI7oc8Hj1KeIoNH0EBz+JsEd42iPcySpNYGP2QJVYcZf1K6QbSo7EbnI1?=
 =?us-ascii?Q?eYbNrZdUETOyE5yzzQQlC9KwldmkpmcAB5rTgqdZMCH4kulxE6ic5UCdL/pd?=
 =?us-ascii?Q?h9yGrJDSp1MbQcDoIbX3w0xO2aDYrCFvddX2eSdUReppVBHw6k3yjAOOOkZD?=
 =?us-ascii?Q?ynu7fZ6CW0/7m1/oZf/LnfPqYcVA2gKonf9OPjWj+7VV06pksE/AMZU7ATCV?=
 =?us-ascii?Q?pglsCXY62Tvx0lPPW9IxeTu7DaXr0ge/RQi6Lwgw/q8HcNB17d3wuQxN1eUz?=
 =?us-ascii?Q?hbywadpaC7c9hyuvSsaZwpdJ1wl44AMN08e+9L70uYahPSrja6cjYmTXZk6h?=
 =?us-ascii?Q?jKlWeDcNO7NS+vUDGQ2k0p8NAtCmFfl7ptKA/WJTVXVs3HxULnAX8947hUxd?=
 =?us-ascii?Q?N7Io7Hrzj97NFrkG9rXmGSAu4qEfZEb5qSnTA1Fj7m1qhVM+oDBHcdNsfaI8?=
 =?us-ascii?Q?ZXnC+6eULPQVYy6NDh5g9m0oxN1eE3xjnTKEC4ohCsn+Z5v/1Ws+b9M1Crb9?=
 =?us-ascii?Q?uPo4eCXJ/PHSKNfBVTm3L9qHVW51/+DLiviRngFRDSYo+Rb5FylnKrsYNWz+?=
 =?us-ascii?Q?McMm45MdQngp961aR/P4XCZ5y/AKnYk8+z8RuyS/dhXZBk6Tw9t/DtajGr/Q?=
 =?us-ascii?Q?WU8eF8Q7noOMqB46iWuELJ2SghEVLp6zGcbWmE3ps7rlIW3k2IOFyGvsu1SH?=
 =?us-ascii?Q?81kB0MJwrtlSVBFvXOGeIip/BgvQEpAXgXS3ZvZXwFf+h/NwVpHgNx0R5sRc?=
 =?us-ascii?Q?1iNm3JyVLh+2l5Zd711DkxHJEBsR6ZUpf64QeWIWv5L4WAIwiBnBoNAyJ6A3?=
 =?us-ascii?Q?LsZ6xhSgxYrkVbu7L21a9o+Pz9INqfCay+7ueZlvXpVEM9p7AX0o5rrJtT3z?=
 =?us-ascii?Q?5Mr/59IHpK4zK9s0Y7FPKpd5j8JzbDniP9HojNUWmLew+SMQYOxH+PBlyFpS?=
 =?us-ascii?Q?rgLoPRfo5y3+O7WRdpLxqyJoplespeb2Nor9hxAEpwrISpwiR2TryeS053vt?=
 =?us-ascii?Q?YczuJytsnDixM9HYjSJeKFS7piy0EJAFU+CpCdslkpRz3/+q/wjiV/LQ+F6L?=
 =?us-ascii?Q?0tPEXcIVTtDFFwnRve7A3VIMZ7BfDpTEg1XOYICqaUFi/KLR1Jb7MuExJAJq?=
 =?us-ascii?Q?fFReQSaS6mLuPVyeLw1XY0AHqZKjew8MhFOPjnzdj7zMXC6BMDppszDrW0xV?=
 =?us-ascii?Q?MRd4l0Rqfyfqtv69hO7d+GHeZnqE1Z8mr68CSH5rFU5RTWCyv+66CwxgEWSx?=
 =?us-ascii?Q?swgCttfp+QvnJakEpW+/emXH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c28b101a-82bf-42e2-315e-08d8e91170fa
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5618.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 06:53:59.3425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hrn4Un24S9o/5ZdNMuzBryaRoiZbQQ8Yi7Qpq1wWinJPNJ768q8r9oPTsSNYJ3io1z7nZ5ozYpCGH9m4cDRAKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7091
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The lpi2c IP needs two clks: ipg clk and per clk. The old lpi2c
driver missed ipg clk. This patch adds ipg clk for lpi2c driver.

Signed-off-by: Gao Pan <pandy.gao@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Acked-by: Fugang Duan <fugang.duan@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 1e920e7ac7c1..664fcc0dba51 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -94,7 +94,8 @@ enum lpi2c_imx_pincfg {
 
 struct lpi2c_imx_struct {
 	struct i2c_adapter	adapter;
-	struct clk		*clk;
+	struct clk		*clk_per;
+	struct clk		*clk_ipg;
 	void __iomem		*base;
 	__u8			*rx_buf;
 	__u8			*tx_buf;
@@ -563,10 +564,16 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	strlcpy(lpi2c_imx->adapter.name, pdev->name,
 		sizeof(lpi2c_imx->adapter.name));
 
-	lpi2c_imx->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(lpi2c_imx->clk)) {
+	lpi2c_imx->clk_per = devm_clk_get(&pdev->dev, "per");
+	if (IS_ERR(lpi2c_imx->clk_per)) {
 		dev_err(&pdev->dev, "can't get I2C peripheral clock\n");
-		return PTR_ERR(lpi2c_imx->clk);
+		return PTR_ERR(lpi2c_imx->clk_per);
+	}
+
+	lpi2c_imx->clk_ipg = devm_clk_get(&pdev->dev, "ipg");
+	if (IS_ERR(lpi2c_imx->clk_ipg)) {
+		dev_err(&pdev->dev, "can't get I2C ipg clock\n");
+		return PTR_ERR(lpi2c_imx->clk_ipg);
 	}
 
 	ret = of_property_read_u32(pdev->dev.of_node,
@@ -633,7 +640,8 @@ static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
 
-	clk_disable_unprepare(lpi2c_imx->clk);
+	clk_disable_unprepare(lpi2c_imx->clk_ipg);
+	clk_disable_unprepare(lpi2c_imx->clk_per);
 	pinctrl_pm_select_idle_state(dev);
 
 	return 0;
@@ -645,12 +653,18 @@ static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
 	int ret;
 
 	pinctrl_pm_select_default_state(dev);
-	ret = clk_prepare_enable(lpi2c_imx->clk);
+	ret = clk_prepare_enable(lpi2c_imx->clk_per);
 	if (ret) {
-		dev_err(dev, "can't enable I2C clock, ret=%d\n", ret);
+		dev_err(dev, "can't enable I2C per clock, ret=%d\n", ret);
 		return ret;
 	}
 
+	ret = clk_prepare_enable(lpi2c_imx->clk_ipg);
+	if (ret) {
+		clk_disable_unprepare(lpi2c_imx->clk_per);
+		dev_err(dev, "can't enable I2C ipg clock, ret=%d\n", ret);
+	}
+
 	return ret;
 }
 
-- 
2.25.1

