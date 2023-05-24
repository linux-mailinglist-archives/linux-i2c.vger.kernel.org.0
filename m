Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55A7070EB62
	for <lists+linux-i2c@lfdr.de>; Wed, 24 May 2023 04:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239037AbjEXCht (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 May 2023 22:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbjEXChs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 May 2023 22:37:48 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192AB186;
        Tue, 23 May 2023 19:37:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGN35b3YVHPEeOMAwZ6bqYUqgaEZAw5QlTaGgsHZ7Pr4lzKL/c0y2DUoy5gNnHj2mvid1DkAMmhB1u3qfhPn9nezaGuz4mSw8rzMuI7UwHh34wH1gbzVVoo4De8DLL2C4zXK5nBLa7bF82o1+ooO1uTVuHjTnv0JgKUB7WdSnbNQt+7X8pwQkMaSp55lZe0E3vA5GuFf5EiL2fn0LBn5NELaZWlRSYs5zHAn4WjYos4x6qOQbK/yB4uw5yzMdkf1YST3bmjtmld3FHFwt+yftLjmoxhYV/g52QP2++nmbHM/7mTljrVOLCtpnr+8QJ+5MdMQWy1MH5RSx8XVumkk8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLd2UX0irpMa/fpILA47F8OYXTN2Li6UbvUZaE/NHCo=;
 b=OTwSl5gKleNZS32VGAeRz0CSaTlFyLVnSBu+nSXQb3/45cRZ6FQef9Dlqcx/5UrIxZsEP0R2axtRVzFXFaLhOKnFBP31v5wE1/QdzuXpCbzTijNJH8O3A46krWPvgABJhIz9ZVhB5du+4VVEi67b+oACGWemQDJWN6lZA7VnIdtDB1Re9tAaa9yPRfZxT+ex/ZCkr/9xmE7GFRzvN5v3XaRw+6OKsFYd/R2UCgggmc9TAKdC321LiHyUDYBhOwats979MbF0EPsSHhOQy6hRIB/6hLHbPMuza7vwbbQQuv+bltuVN5qaE72+SNOsu5PbTxT/NWq7qb3c2/iAPg69NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLd2UX0irpMa/fpILA47F8OYXTN2Li6UbvUZaE/NHCo=;
 b=K9GkbLc7mAz+PzfyKcZKfd+zvmfmJS7pDQkkuw33F9CKN7sil6Y0iKyAb1BZhN1Sq2I/AyohCEWQdL3N90ThIJD7ojl9/NcxgOUxqGctYOGhg02qWwARm0qLYDM7DoMy/ifggfTWC5HP/kEfNRa2yqMG8e8XVP8flVLbuFon3lg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 02:37:44 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::c2d2:71f0:4080:dbb4]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::c2d2:71f0:4080:dbb4%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 02:37:44 +0000
From:   carlos.song@nxp.com
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com
Cc:     carlos.song@nxp.com, xiaoning.wang@nxp.com, haibo.chen@nxp.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: imx-lpi2c: directly return ISR when detect a NACK
Date:   Wed, 24 May 2023 10:40:02 +0800
Message-Id: <20230524024002.1790405-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::21) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|DB8PR04MB6795:EE_
X-MS-Office365-Filtering-Correlation-Id: e7dcd57c-bd9d-4242-ac1b-08db5bffda20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iEVpo8iU5+gQ5IxtV1X+DjBM7MiLuYOn259urzao1KHUQ7yhyWd4Qp4ilof8GMLwReixr6frc19Ta7jWZoRvxSca9WDwxTI6KzTtNd/SW8AY+o4Q2ywkhxdMYWF0+X/H2EgTjzMi8R3USNgMqvlytoHmGO/20Yexcry8nvxV4orltfvkoVxxohRL1S3JRicUpMpTZVYw7hsdQ+Vsh3rTtmxXHWBDtGF1X91tMf6JnT9uEOhl3QoEDn7RjrOd2y6sUa8+tzCF3Fdm96fRGm99ZkLZJIgZTSDtzIj3IJXV0oCgqsh+sMQ5GdVO5FB6+DnNFx7n3zaK9YBZU7b0EffUBhla91LAeClhnI6NjrCS4hYCDIkhHLf/4L0Lh/7Q05DtQ/bANZmqcL6H8VA1EgcyKPn3k/hs7kNNr8bQ46hhR0ziRUDgKyLC3CvTUvL3PfZMd5HCGPZLdCUUiUMc3Sdq1/H86vTeRh8JEpFPODf3tPl4/8xyZQah0Uajt/vkJKfXvxWSC9ueWmJ9FVQXBkek7ZfoV/52SrfHgL5moJibha+eZBQq1FPnNDNGUBWcKcHpp5j59OuIWCUbEkuSkR2ZXCwZV3QDAWizyNqxNNZyRsi26mxeVVYd17XBDez4SqTJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199021)(86362001)(8676002)(8936002)(2906002)(66556008)(66476007)(66946007)(4326008)(316002)(478600001)(5660300002)(41300700001)(38350700002)(38100700002)(6486002)(6666004)(52116002)(2616005)(1076003)(186003)(26005)(6512007)(6506007)(9686003)(36756003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EIc/ReDt8s3Dhs9mGxbYhK2RGIlfaFNAakpTQoQ0Dq7NRmRY54ayIq7EZuhd?=
 =?us-ascii?Q?Vp3xCTbd1qamq4CI1mh5oofMrocK5p5yxSlbnWRRaJ2/09xTkk7Eg/sQbwTq?=
 =?us-ascii?Q?7JdDSg3ixvh9/NW0B0iDcODwUj9iYeLzeTzADoXRQP7RVnOkFFfy9Vj+1bGf?=
 =?us-ascii?Q?5fgBHZPtCzpTMOSTcfXf40LAyZW2v7NTS6S2edwp0IoIqrOFgdQUPOMWDdIf?=
 =?us-ascii?Q?gmsugfwrIuholtYZYH11wXSI5S8tGZR4cUqnVCFV2NlNEg3ZVSjUB4zh4rO5?=
 =?us-ascii?Q?kVvXvjgCb2UqnY3fAPgFJFMl5VmjN9Y/iEekodiz4u3+bmtIfhHFAVBcPVOk?=
 =?us-ascii?Q?gpRJYM9hVH3aiqFE79I/RERKk7N5qj8vQXOpRzVSqh84cHCVk87/zkUW8hRU?=
 =?us-ascii?Q?lh9HWwVQoucnAFP1Llc29E7H80IQcv63tmYCaoYLHg+PB9EMp0JSrfGSW+ac?=
 =?us-ascii?Q?x2aezrhDoRP5UE425xapBAp/KzL3Shc980+RjaMogk0ZM/vy+MLVQET56/XW?=
 =?us-ascii?Q?/7/XBWqT9922UJ0uRp+nMSkBZVYQ4gM02l/wJvQtbR8vWJ4yjjnCnNiZcJJY?=
 =?us-ascii?Q?AGDuuJ7K8/WXOzF87hMeHg+vj4T+KEiZHDhIlMxGxKQ83OVawpff+oFJGfZJ?=
 =?us-ascii?Q?vWTlMlQi4xGXHvlyAmAR2lENAty9bDOlQgdgGFjg/R0FZzZ4xvc7nYjROFgI?=
 =?us-ascii?Q?bHRazzwIGicSLpYozS2IZFNf8eEfslS4A3c02OSLPAncBguLUHnZkbYlXect?=
 =?us-ascii?Q?ojRM5v+HJKb5df6udi1QCW5nzpNlTfdCFWp5uN461OymMibV9cRj6m32lIE6?=
 =?us-ascii?Q?xqd1KBl/2kN4NHxDdo3x2wXKwgzZHBEyJX3oYyQ+BvncMQPrugCekF36dYSF?=
 =?us-ascii?Q?3iovx61FJIaB566zIdmEdkJ3+iD4ef4hwkXcwbFjNeHfeyxc9Nuy7xsL3uwn?=
 =?us-ascii?Q?qFm1RrsfRlSDPW7qYtt48JRAAOBYVBDwSswUMyjj0Ng1HhQl17ZAVw6aLjB+?=
 =?us-ascii?Q?VdnWn/y3Zjwe3ncVa9YaUjs0qjpcjWOX2dMdrHViB8q6jPFNQW3SKbhV3dX7?=
 =?us-ascii?Q?coVRRIUVRgKgIgMYj6dDDEBURsKw0yuP2pnCc1z43Zs6+ygH9s+XKn0fO2Xx?=
 =?us-ascii?Q?03ykex87c5TNyqAvwuO7Th+GsqDaI3vzjtTmLDgfkckQ/QNfy3/ev2SyJtGW?=
 =?us-ascii?Q?TWm3CtjEdgPajM4rAURPbsSEBYxMkoHceAlSjZMaWUgTtrzu3zvERtElxqZZ?=
 =?us-ascii?Q?GfGe4lDHZ41z2wc/HY8VpfKEMmCELrfy31DaaTVMxvaG0omHoR2k/pir1s7P?=
 =?us-ascii?Q?xBYiLgiFXdVD7vRKJ9xWQIOUWdpcLZzoySEbggFKa+x1U24ChkGmaF3TY+ru?=
 =?us-ascii?Q?/D0cyfcdrWYXVh3khGaWg9diiTJTuv8n5TY6AH+E5yY8qX6nNo1KCvgD4XV1?=
 =?us-ascii?Q?DHC/Iihb9ne2fZbahHJMDg3slsHH+3L4Te24wo5CxrfQ8AtmaEKlXKzYXu4K?=
 =?us-ascii?Q?NY8o+JwD2bhtBqOiZgS2acUShHvhhJSKDrwfUsekBI75v/HnbGKtP3DaFGps?=
 =?us-ascii?Q?PMHdv8JWOd7iJ3KgQGeJP0Huhm/ZnO2pDBOAzzlU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7dcd57c-bd9d-4242-ac1b-08db5bffda20
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 02:37:44.1863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgeWukTLhJ1T8Hpvvwe4CvibqndoUDHBkC22IX/u9OdD46XpPv2ozPgXjq5AzhmtBnh8COxl4xFV214GD+MgvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6795
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Gao Pan <pandy.gao@nxp.com>

A NACK flag in ISR means i2c bus error. In such codition,
there is no need to do read/write operation. It's better
to return ISR directly and then stop i2c transfer.

Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
Signed-off-by: Gao Pan <pandy.gao@nxp.com>
Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 1af0a637d7f1..11240bf8e8e2 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -514,15 +514,17 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
 	temp = readl(lpi2c_imx->base + LPI2C_MSR);
 	temp &= enabled;
 
+	if (temp & MSR_NDF) {
+		complete(&lpi2c_imx->complete);
+		goto ret;
+	}
+
 	if (temp & MSR_RDF)
 		lpi2c_imx_read_rxfifo(lpi2c_imx);
-
-	if (temp & MSR_TDF)
+	else if (temp & MSR_TDF)
 		lpi2c_imx_write_txfifo(lpi2c_imx);
 
-	if (temp & MSR_NDF)
-		complete(&lpi2c_imx->complete);
-
+ret:
 	return IRQ_HANDLED;
 }
 
-- 
2.34.1

