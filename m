Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E054835523D
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242932AbhDFLdo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:33:44 -0400
Received: from mail-db8eur05on2077.outbound.protection.outlook.com ([40.107.20.77]:22144
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242942AbhDFLdf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:33:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AACCwR4BQSBkkz8Ou8NdxKNupOeixilEOc43jHh3g6P702TLw9vDt866dYZZaImHrvTRUMjdXBaaQEEDruYPx75FYXfcuy5r9d5MMJ5NSGJmZXsDIItI0q6tDrK0TqCsDM09k/3hp+dfhuB8Eu7+YVG6DpvH59QVf3wPVR4RM6ELhv8wBByl/4AatK2cqimOaf5+HbtgVXJ2Wb/q5cXwzMCkba4gHPY9yU7fkji4P0XWrMdtmjySIUPTPlzqaCX2axdYjo0ON+ozuXeYlRaEwA8lRHDDTM94EMeoxoEmaAI+ytfJuJUG+yq1Fd7KqFDxEsnk+h6OYuJXi1uKgjw2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tJozU71mETkSwiNm9/aEAti6psIvOH41i55UiDVmrg=;
 b=cQXZMuv4tdyZK+xOrdthkW0mByR+cX8vEYatSSG0vKsAdIGK6mx5aimGX40Zllc6pZZf9pZ1YV3tBq9mdJWqu9DKOuWdLVmDuDMfE89yY0R2kaAxFplg71qwaSEGqa90liJI9oB8vulsg2cAl6eR1eXTRechDVmsMTyH51lyFJaQROWQxCM+gZa2Pyel9/Q+6Ig5LniISR/lctxRKUkJ5THHfF+9HN8lZIB8Tijh2CoHyGKYPtI8tf5dscAfeNyuEmgt+QJD8BCqSK3dk9mjJHw34XQGqTxVCpjc4t2TSIBIyJpQCsd0gEowDH5jCK3VwJg6glDSxwSYYhqur0jP7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tJozU71mETkSwiNm9/aEAti6psIvOH41i55UiDVmrg=;
 b=gG4bHa6vYw7xHqVkx+z7QOWboYJ4YMXeP1KTEwuiFCpUotfLZ7Ij+DXX64yFeb0wKRcG3hv7Rh3YJWAdS+UtRWA2mNUYseBzJhgXffRd/d19e14tGm8Z8M+jHfbR08hdHljKzPoPaDzYbNI1K4nhHVkDH9jX/gtJ/tWqqMEukHg=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM7PR04MB7142.eurprd04.prod.outlook.com (2603:10a6:20b:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 11:33:25 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:33:25 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 08/18] i2c: imx-lpi2c: add debug message when i2c peripheral clk doesn't work
Date:   Tue,  6 Apr 2021 19:32:56 +0800
Message-Id: <20210406113306.2633595-9-xiaoning.wang@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 11:33:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7816586e-58ad-47a8-9fc0-08d8f8efcaae
X-MS-TrafficTypeDiagnostic: AM7PR04MB7142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB7142CD23EDAF78F3ADD509D3F3769@AM7PR04MB7142.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R9dHxunvLRyWd/93xpp7+eSWvhHpxiTxmKhAE+mtHoj3MIm0vvgr8mtpq1dKSjlIh1gVMayVdtTSEbEq8PUTIGAzIcmc/Z2fFavcsl1XdK2/vporSUE7IvcmH0FuMrLgtN7LK7f1kXmUTCyVBX7RtZlfvvgHwSWKoOCvPFUzRWnWLgUssbVdQZ9/26gi/qM6uUaJX/pvF3oC05JIX8QQTs1EdT/nD0Csba3JZBnGsO9GCdRq2XWVL1msukk6YiXRcDSmbUhp7jQ+DI6Y+v/5yjn6dXZR1Z0N4bFgAtuBK32hIgWuEwjysg2P+03rOMGT+zTjPetpRS/pqjL/vSlfH1qfuPChkXQO4hpaxHXQ1QX2egwop7z/3Pa+XqwVRG5ukP6Cf3VqSJGY6JGSzdIeeoxG0mLZxGpy6zh7g1fC6x3V5GGuIU/brGAajpeh64/qgyL3lzJIFMChTwZhnNYaDHXtktYAQoZfCp1YdORMscC5JLtMhSRtfEXtnIY+GEPh/XRRSzcIxRJxILhy++KyHMBj+aakmNpAroMv3kO9y1zlNeM3El5F5XlmTBwg69hpvuh/w/NFp3mBYC1/ijHsBDg2HXO3C39iLV20jeRiFb0YT48loAEpyUmhYC9OxcUrNshCraJBpDHhxu0vQ5DHo2Gn+ONJh91nV2HUqYJ7ckFLddJu3uwlxhfefYbxTAkUG89mshw6jYsnIMdfNDZseg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(186003)(16526019)(86362001)(36756003)(26005)(66946007)(6486002)(6506007)(2906002)(66556008)(38100700001)(38350700001)(498600001)(69590400012)(8676002)(8936002)(2616005)(83380400001)(956004)(6666004)(4744005)(5660300002)(1076003)(4326008)(6512007)(66476007)(15650500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ua1fpgwJSlJK+gr7v7d9jevX/LK4hnDzp60HOFXbG52vVarxbCsBzo/2ne2p?=
 =?us-ascii?Q?JlXfZppqlscXrwzxxMrVtKTMp/hSlICYmmXy0vZWBCYanH3+bdUvrwvZLdiY?=
 =?us-ascii?Q?TLKssUiBXRG9vxix0fwjlrcw7NLkQtFkBYy9Xy9h4LDZjYU7WoPr3HMuhHIq?=
 =?us-ascii?Q?R9l3Zv70knlU+Hau/DxcdXHDLa0rvKXO4aJiQ5H7fi+phsNbIrulcfGXFfmy?=
 =?us-ascii?Q?NkiiElUbmPZMptJrAqMYSXwbfDNeicr3tSOxegJFa7z2/iWPgu3qtFNfXiY1?=
 =?us-ascii?Q?1GGlU/tUgvbwdhyeOdOS7TxFteWs3sNYoVhyi4bZeue2R5n8GPNYWwpKD9VK?=
 =?us-ascii?Q?dd7I7Y3yuctoyv4XE8c3eaen6nCopJeSGllWamMbVodoyb3o/D7P1EsYMqlv?=
 =?us-ascii?Q?fN7YkgqyB7UynHX3f9nn6YNfGzyjrl/U9WXGnJZULtKzC77f8GlvNeYp6HDJ?=
 =?us-ascii?Q?PhM/FZiWLwXyLlVufceSoclmU88K5a2mMv0dp8GIzVFW6wLx5bW5T3tN0ZAA?=
 =?us-ascii?Q?00hlP5B/T2OkC1jNh9Ya27rG6f5sl5rBX8CCgmBLO+L9WSlCz391EQCb6s+E?=
 =?us-ascii?Q?6QSvgTar2KHztlOoZeZHMdQDuOZfc0OKKt1FeTlhf5x/vafZnTNpwDxB4xML?=
 =?us-ascii?Q?m0Kns7bXRrH3v7Gn52uMfFHkQXr1oF9o8WUrJtQ7oZsjbcWTB23pwM54ZOij?=
 =?us-ascii?Q?xSx8oTPU0EmgObfpLgtTynoG4mKUm2UTLHprIxMEfWR5Bo+/HogL2kDEVIRb?=
 =?us-ascii?Q?o2etfAWRqvF5JtD6T03ONJkMx5KA9Gmbr7OXPhIKBAWBkQOUcYnRzCi0mHpg?=
 =?us-ascii?Q?AzT6eDh6XK80nB8X+pJB7mvBvO/dr1jsQaeNTX9UU5aXhCs5UGQUo3mPVLEu?=
 =?us-ascii?Q?RcO7cBpWqWPrc64ds4oXPYjj5TdkzFm33/Bmpne7lkJXeEMv1Kh49VdWHcc3?=
 =?us-ascii?Q?fUPXNnlwe/pmkv28guEFEjJ1jh7fGWPz0gkH/g4Zs43w2p5zXYIod+OHodE5?=
 =?us-ascii?Q?NONfWQBv9RQz4kU2/l22bFrZYkOWp+c7U0GYWhCJz08fcVCrpcpUYY685K9V?=
 =?us-ascii?Q?ltN53CLbBenXCHGcugC+FeQ3txg99vgihshOhJHmn5QzH7oToaI08XnSf8sM?=
 =?us-ascii?Q?m3JZG1kLVFB+H+4IEyzsuwiVMaupXFjTefNL+Et6gpnExFBeSdvKM500L/Ho?=
 =?us-ascii?Q?2aXin2NW3rBcQk9GjyvakvN0kio0pGjok4XJ61591OK04trv5XZ5i9PNx0sq?=
 =?us-ascii?Q?w2mgZiie4awMuu93TJcZbMCapQRlJ1KwEvq+htNZH6f4LlH8pWOr9Q80Imjb?=
 =?us-ascii?Q?5nLpF2i+BuXGZqzl/54m2lXT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7816586e-58ad-47a8-9fc0-08d8f8efcaae
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:33:25.7497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCLvT1KLUin1jR/aGuq+AP3jyFXj4x7GjLPNAzczdo+0pJtg/meaBbZG8mpVvpY0hSKdU0h6CBtNGq20bh7HEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7142
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Gao Pan <pandy.gao@nxp.com>

add debug message when i2c peripheral clk rate is 0, then
directly return -EINVAL.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Signed-off-by: Gao Pan <pandy.gao@nxp.com>
Reviewed-by: Andy Duan <fugang.duan@nxp.com>
---
V2 changes:
 - Add my signed-off.
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 333209ba81c1..dfec334712c2 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -210,6 +210,11 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 	lpi2c_imx_set_mode(lpi2c_imx);
 
 	clk_rate = clk_get_rate(lpi2c_imx->clk_per);
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

