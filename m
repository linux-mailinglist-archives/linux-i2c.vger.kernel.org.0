Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0617A714557
	for <lists+linux-i2c@lfdr.de>; Mon, 29 May 2023 09:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjE2HUX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 May 2023 03:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjE2HUW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 May 2023 03:20:22 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2078.outbound.protection.outlook.com [40.107.22.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C16D0A6;
        Mon, 29 May 2023 00:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ln8XmlJfEMrEWArKLtBcEn7pn6S06g0SOSuduv25bVHbQwHsiqCmZ/XKuuczZCnDvb0BIh/Zc4oP6lXkbpEK5aNO8iJL6H4cIwDVY18NPaT5LNVLJB7Hz2tihKnnnxcnwqQc5fVYz3EeorsOblRuqGb4xsaFHOfLM+UXGIUIoCfOuuuXzhHt4dv2dihL65v3T8tSyJsUYbAvB32kQ/w3LXq7+9Nyf4B8lQ8fYf3CeYlOyBnkE/kRRjdrlNHQ2qQI+iqCXW7fnQRfiUTFbyK2OP8Hx5M9ZWpZwJwGev2dfNSomBgcWbadZAHGOrI8OEbo88gmZVyPBSEIqy3a1yGUbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmK4UQFe4vJS00+y19O7ZSBayNK21oH0iw15e9KcuWg=;
 b=ZpcEV56xB1jpJKolCNO9zXFTGOiPOtZWFctXwmy9ClDfKm0hrz67/puvcGGMc1u3xml5MlYYbrQSuVtkDnbABieMI8yJFOZrS+NkW6wvVqLriUw7sRMRbheeBW2etUKxuno7kDDAmWT58KQCwvZRDMcI2hqj4N0N1YBzQa2QGzg8UvW7LlBLlvCDUjBR7hD1zh7SGisreXoU/sUXdTuCmP67qNMeZXiJEXlK5uatbglGVZVtv+IyItiiOlpYCRz9kQCEgfOmnyR0Z0wmTi1mpWRQeCH7LgVuMpdGaxV1exmstfxe6isG9Bp/uajrPXpU6z+9m16YnzoDRG101i2clA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmK4UQFe4vJS00+y19O7ZSBayNK21oH0iw15e9KcuWg=;
 b=SaOSlOEqeNlHdgbYzRcwRv2zlx5g0tvXnehIz/STPGg8mu3xZK096ItmgSM6NI67LzB4YPMHKXFvDD3Apxh04PZZvz2sqoNqCcIkf50r9DC4XN9tjriO8jqndZe512pcmWtxxcR3va3Vlyz2Cje/akaZPWOkP/NepCVIvMmyuM8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by PAXPR04MB8288.eurprd04.prod.outlook.com (2603:10a6:102:1bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 07:20:17 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::c2d2:71f0:4080:dbb4]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::c2d2:71f0:4080:dbb4%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 07:20:17 +0000
From:   carlos.song@nxp.com
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com
Cc:     carlos.song@nxp.com, xiaoning.wang@nxp.com, haibo.chen@nxp.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: imx-lpi2c: add debug message when i2c peripheral clk doesn't work
Date:   Mon, 29 May 2023 15:23:16 +0800
Message-Id: <20230529072316.3605989-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:195::15) To AM6PR04MB5000.eurprd04.prod.outlook.com
 (2603:10a6:20b:7::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|PAXPR04MB8288:EE_
X-MS-Office365-Filtering-Correlation-Id: da741867-bd9e-4024-2964-08db601526e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SA9nFhesbn62Up0OmkEA1FAZFU5iTyU7n7aRKAaTc9ChY+CgLI5x45IZ1rrnLCB4RChOngBgyHtWn4iHP86uuqooGyiszlunucQwJkYYNn8za07jgoYlYl589CvTHSxp6uceRkA0Zoyr4sKvyj/OZcMNO+PzB6VyKg5lGbGNSz8PMFq3hHzbxDVbjxjJRin5yN0X5mVVxOaFkmDmEQVxIqPZZWH59Y2acbIrQlTMWx0JrgClVj9OoTwPOpeCOyv479UKA4StnqB+KD7YC1p5SwzaeyyG3YjVIt9tnYZiVMovjffFHcAj9T0OtKoafkZzbribCHdrbDub1ziMNjyvGBmNs9XRaUP/ulAM+5OmhPfLyNWdJiK/mjxnEuV3fzXyH1xRIKr8864Sh7M+IVjuNFSXPkOd0DvaU/5Tq4Rj/j1iEAnJgncIkbVvPSYGxG/lzegS6NTBTho/8LMh6m0/hWz265j3NfUwNXCSiRg2t72hKc8Vfia0ASunk5IO5zyH6re9xS/RrbsQP33I0EuCMpBnGVy2odKp0QkBET9+5j/qmQxHLYxVdmuQKx8rnBiQ8gNHJVXy0YAawT7p9NsNKhqoEbpwOn0LZzOeC5iZrNMBQnSeA8orxvVGpcgEWFLN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199021)(83380400001)(5660300002)(316002)(66946007)(66476007)(66556008)(4326008)(36756003)(6486002)(8676002)(8936002)(41300700001)(38100700002)(38350700002)(52116002)(86362001)(2906002)(2616005)(4744005)(6506007)(6512007)(9686003)(186003)(15650500001)(478600001)(1076003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B2q51tY0Qw0MVZ0O8vdS0mYOC7NDi0atXSvdeYU3prrJcuEYM5CE3Z38yeVf?=
 =?us-ascii?Q?6ZltARTuNob9URs/Z8cwETkzeWDlRjFClfYzKEfXgFOUU2B+hpHX/KOV1tjn?=
 =?us-ascii?Q?5jeUOZVevfL7WM6ttd2oaJmtY3DBkFAVg7s1w/F7Y8L45E+DWZmfW6shsbrJ?=
 =?us-ascii?Q?r+0j3MCoBcIKz24qHU13uGVRKp9B8XZ9cYVtCsEJvoEbepO4O158ITSgLw7c?=
 =?us-ascii?Q?FZnqMPScTgNAMsBx+NMdXXBRiOLe9g4iPvd/BVfvnE99xfF1GvW/ZEADxTry?=
 =?us-ascii?Q?AYjqN+ZDUh3GbYtE9wASuUcHovRD35UZ9/85b3dQ/FF77vVEnlkK51pDe+/Q?=
 =?us-ascii?Q?yN30Ca4Dw7RSL650oxYJ2PKa+N47XIV3Vp1zte1iBpF2YXdYoHpp5A+4e73h?=
 =?us-ascii?Q?FAtUWqQ8d+ChsBZX2qFc7ILyjq056WmZ49xMrS6+yyfNkTSW+cZNxffEThlA?=
 =?us-ascii?Q?id9sjfm33TZQN4jBVVNhL7U1pBGN189mXA9c+23V+cEXK6APlMt1eBlshtbr?=
 =?us-ascii?Q?QyBHJjy3sgYaubhkBHzYteeT/Z/aLR64+iG66PzNa4I/jsCyir8HLG96bgl1?=
 =?us-ascii?Q?m8hm+r0Gw2qPMk+QtpTT9JkHaUizrqcl+b42P1iaBfzvueUwmiPOCiHRSUXX?=
 =?us-ascii?Q?IntG0lz8NwLA0MtZGxtRhOQtr6vxAgUp63p0F10zFNA3fSb1WKkMJrMz5IU7?=
 =?us-ascii?Q?2g/Fxw4e6/NMEv9SP6NF1fDNOAM5RLEE6uRfu3kyB/GHwTXLsAu++HgHYW+Z?=
 =?us-ascii?Q?Qp2g86VCs7SFSaTL5wSe3VOIQM5G9Z45JWZgPRjift/v0HXIkam4JZXGFQAr?=
 =?us-ascii?Q?SkB7Khy1bhHWwewbG/8NohyEOWp9JXBIff+uarxH+geG63vA/IGjz0TvG6CO?=
 =?us-ascii?Q?3uTjBAlhenqSOR9h9uWUct4UWZGUGOhsO5uHRzOREEiAHLWU8YNypKeV0l1a?=
 =?us-ascii?Q?bOfNXAeFJlYhjxFQ5tdZ3jVRhkvDJZ0K57475hAI1eAsAFr1Ds3izeakB+sA?=
 =?us-ascii?Q?GouoRw7js/WPwgpGpnL3hbkIn6zZl0ihcVphb90d/LJeukuzaAlPRC7wUBgP?=
 =?us-ascii?Q?PYVwrRGFX4Qt3kMX2orJ8dcaxc/i7lP00I2qaWTxL18Zyb+3XEqAG2HiAmQs?=
 =?us-ascii?Q?wbrC7wpVTVa8759XPh4rUsWogY4Go1O3na1OI9XJWUi7Pl4+EMzLVyvoFqvt?=
 =?us-ascii?Q?I7/NSUh2CTGclXjSOjVo0op8dOFcSeg7UJKszcooR0a7PdikSurrPD7hjfN/?=
 =?us-ascii?Q?Sqtp/yQU6wNi4pMfxr+6WpDsEFDuhMJn2k+ytfggl62HNOVcgpufo/8Q2bFg?=
 =?us-ascii?Q?ebc4X/lakSTjDJ/+RGKPeveZ2p8IEFG8K88iSZKANXxGLmIp4rqdiyIRGw1c?=
 =?us-ascii?Q?u6aw25sguFq21X5sdYXyRM5KphLCM/6CwLlw9xTcef2nTyNLzO5YErxT0vBm?=
 =?us-ascii?Q?1t6c58TE+iRfhBW+Jf6iNGSe6ReqUq3a6g/dXLfcXygyBSY7T3vE8bh5dSng?=
 =?us-ascii?Q?1uF/8J+Iy31Yfb7oNYclN5OJnpNTmVYLSTdsZzxmF9vvuIpsgfRH61zQiKta?=
 =?us-ascii?Q?HYPLK3j80vG9uyF5cKWRDnRm7xdwbengApsmQzOq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da741867-bd9e-4024-2964-08db601526e6
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5000.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 07:20:17.4678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gld7t4rq3oYF0I1NEI/SLy+2sjLW0SvK5dKlFkS40B+lB7AfidDeU09fMtQT+VLvrZQjzf69MkmswsjuTjoYMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8288
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

Add debug message when i2c peripheral clk rate is 0, then
directly return -EINVAL.

Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
Signed-off-by: Gao Pan <pandy.gao@nxp.com>
Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 11240bf8e8e2..62111fe9f207 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -209,6 +209,11 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 	lpi2c_imx_set_mode(lpi2c_imx);
 
 	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
+	if (!clk_rate) {
+		dev_dbg(&lpi2c_imx->adapter.dev, "clk_per rate is 0\n");
+		return -EINVAL;
+	}
+
 	if (lpi2c_imx->mode == HS || lpi2c_imx->mode == ULTRA_FAST)
 		filt = 0;
 	else
-- 
2.34.1

