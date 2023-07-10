Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38EDC74CD0D
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jul 2023 08:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbjGJGeW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jul 2023 02:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbjGJGeR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jul 2023 02:34:17 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2121.outbound.protection.outlook.com [40.107.117.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC5F19A;
        Sun,  9 Jul 2023 23:34:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3dTnPMLtHSqghhbiKGe0IzPQL0nZSfrzbLLjZ2rCUxAF+iZ5xIvi6rDt4HnTmPPYu/9TKy0k+laBuWuS/s2+54ehHUEQWzmETcqpCyT1/FOMqoEyhWEy4G5xHO9BamKwwqigCI3GZXBU8GTviZvOHB77ZSq+EigNGX9vlK25KLx8v0zm4csP9rq/NmfL6PneU/EwGBKTzEKSd/KralJwsjjTfjegL4JWMWTwgmBv95nKl7oy/PCRlXVxPg0mvn9DdwFdzbsMoNf9wHkxbYSCXDBn3E7GIHZy68HJLUPj8BcNF8BZ1QobBFI3k/9vDyeEoaGyNmtS94JOE3WCqCHeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hN73gP+t6EMRGrVL35P8x/pQjqmbtVPaQJg1ASEgUUU=;
 b=M0vMhPxYRusrOEv2vy6WnabbRYGul7m7QRbEmYek7jxWLVt8hd/zJHqoiO4Q6JYPUFMafVtI01zPaDdm6QLE85FtYZwpTDHtsUhuklLBOqbf9hifxQkH+h5TnMcIoTXYZ3P8FwADU4O8DQ8739MoWeTLhaNSGn2X5ug/gOKde14J2KvJrKJy/BrutU07N3L/VhfSmyoR+vinl7A6G3GDDKZSC1bxKTbPrVZO/YFXsQrbnfW0ESPuDe47xmI/+FszJCl0uBViLtQ4XG67pOVUXREjKpJe9rnek7WCIrBU47UmRPBmKjfCXSNb2l+Z7q7v6GUcPGvyDcuzGM8uJ/cqcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hN73gP+t6EMRGrVL35P8x/pQjqmbtVPaQJg1ASEgUUU=;
 b=fCqjq38Yx3arq5dmPnkiBQOaCWjXm3kDnQoegW5n92UtmVWrxM+0AOnrv3eTxGsfhH7mTgbYCSV6fkqYmlgASgTj7YXZGsPcoQjTSl9AHg83eb7iFIw5EVCOqmhl+xCLsUkpGc2qycy9k3/RkWbAdWlw1mSg3UTA4R9J7za2xM13ZwvRL38AtMskpcAI5jg60kIlXMRSq6jFfePRaHQ3UE1kYzdqbuSvvADjBIuxtDYwam/lPxr7Wtmh5ITDWfpJcnxJYmx6w+25SMlYANfo6WDW9YD8xNv2b3+qXlvyUt66z0QWHHq+nTiRBAOwi8qrNvKwOqCawB3yhN4Qx5EnWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6586.apcprd06.prod.outlook.com (2603:1096:101:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 06:34:04 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 06:34:04 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>
Cc:     Yangtao Li <frank.li@vivo.com>, Ray Jui <ray.jui@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/11] i2c: iproc: Convert to devm_platform_ioremap_resource()
Date:   Mon, 10 Jul 2023 14:33:41 +0800
Message-Id: <20230710063351.17490-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710063351.17490-1-frank.li@vivo.com>
References: <20230710063351.17490-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6586:EE_
X-MS-Office365-Filtering-Correlation-Id: c41690a8-400f-4ca3-fc14-08db810fa7c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XdiKIrX1hL5BpJZOdobWVdGiLqqVo5D/2ZIYRvzaPTCS3eWwBW3gIRzGf7ynyofFIEflVoPuNyThKwsienva6Rtgh3D9xUFikocML+z7ilIq1Y4KbrGPwlyf+1s+ZazmZyZipPO/xUmiefeI/0sotQhZ/XosDc2QU9PwJ/psmIdPRe/QEkpWSjhBjQ0OW+PiExcwUmrrNF5J3t6/zduU01z0I0l+UR87dur0625dfCyxgKrLhZU0vKQdlJnm9OyAkF269VzajKKsjrQxLVr0ZfKC1IwpN/djyQJDAXGrmjiObghvR8fpcquY88Kednpn3l8E10D1vrTkEcyYiyHb8sky/RL1CQd638nI7bKxyAloO0/8kg0aC6ivq30d291H9JFCp5xO4Q+eFjxqVkmCrSpTRjY1FQAQmsfv7/xWNc4gia8lD6OgmiR66UPOBT6okf6tfsfyzJ533eXqq+nyf21RhSApBW9FbKdM29sp7NoZf+BuRZ6GrXnVwKPQJ4S+6G4ZtbsuhhvZx5lFmevihAalFDwGDxjQxqZNFx+RbV6EGkPsylKS79KOcCQgQG3MHBsplSkx5B/1ggVRwdCF8bk/lw8F1OyFD/2hLET6Y0/UsMdWcRezx8NJhdpHj6bC+JJ/b+Mu3XHN+uKPPhxSegv4itP2Xk9dYXZR8FCpY6E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(52116002)(6486002)(478600001)(6666004)(110136005)(54906003)(83380400001)(36756003)(86362001)(2616005)(2906002)(66946007)(186003)(6506007)(1076003)(26005)(6512007)(38350700002)(38100700002)(8676002)(4326008)(316002)(66556008)(66476007)(41300700001)(5660300002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jzNz9PBWuiMiWznAWeXQV82fr/weF1T9oINowbiAZ0nE1TbHLwU9Ap8ihWfy?=
 =?us-ascii?Q?J08+wxz2R8Y3l4f6AUunNOE5D6VHbZcLeXJ5rBTZ1fWs8y2k1r79+5/G1xaU?=
 =?us-ascii?Q?tnIi9s/WrvBKkLgKLS6sR6EQIoiA0vkzJO4xsBgix+YaO/E9KME3s5H602AY?=
 =?us-ascii?Q?bBreA37KYH4daxEOdXxZ6HOI+jMvbI5Vt52sJPSsRv4dWHAaGYi2VYCvMI+g?=
 =?us-ascii?Q?7MBx7YjgqsoJtHaPCq3Oz0JRhDTxuVYWC1Jy09yMD8XVN+j0hxo3q61IGcid?=
 =?us-ascii?Q?lP8d4mrxW0IfWio3mORjbMIp52cMtT2mDGjzlkYZg2/BKICwBfWnfmFBTXyQ?=
 =?us-ascii?Q?pZf/5uLPd6NAalWHBSTYn+Osj5oCmZvCb06yEAadg4L5+r0zxNXJiq1/jYHZ?=
 =?us-ascii?Q?qKxOR/GCptET4D3shyKBdnOJLo2hH38u0DJ08ycnTNUT1ywtMe8vL3x2I2bZ?=
 =?us-ascii?Q?esTxT28Fq+HaXlIoHRI4xVlpDccKFzUHUFyJNln0HHhveeAdRfAcma0ZY30w?=
 =?us-ascii?Q?sidx21IHJVY601yKrLcxZTjc1buZmVBKJGjEEtGyCjUfVi1Z/yIz8gagLCy7?=
 =?us-ascii?Q?wglfo9ZgPtK1zTdALs8zPeXo5/pkJ5ydwn7nYpxjmPyEW7VI7iaMcIGmjiQr?=
 =?us-ascii?Q?uJjjtNaRh1u+1cZzCzgE5trVtBQJNIj2Nc/PZ20jJioKz5fyadkvbWcpkOA9?=
 =?us-ascii?Q?YNMEes03wUANX5U9+BW5sudetgOBmNiDd7PJZ+ZtXbNonHYTkPJ9Ew+XK2Qm?=
 =?us-ascii?Q?r7Ha+Rin9kb7jc15mgmRv/LXEqLENUkK8Vs2IhY6Pau7dTttxcizwvQvJ9ch?=
 =?us-ascii?Q?SHN8KMUf3EuRgaRNuTtC1sehLIW3vrWl5FomcOe/fHeGIeQ4Rn/XxXy4lsDv?=
 =?us-ascii?Q?0VrNeZiQ4tOj+sYrTXUq1cHRMb6uGqDvIuhH5QXbxf0bHlZZPaTCxzL1v0vA?=
 =?us-ascii?Q?F74CqZmj6NFJE1XXah1/UrqRigMSaKEGVK1Ocke2HnVJITiSpMMVQYInyE4S?=
 =?us-ascii?Q?bjP18vNIw62+zEN9wa9JUF7ER15eZW8ne/tuj5x5Z0trY27cqEznPd/3iHu5?=
 =?us-ascii?Q?4BBlDN93zF9wHRFNjjklx23mWYxggR0kfQRKVuMp+dYZD768Svr0zYFl5C7e?=
 =?us-ascii?Q?fgPkO8oEdCEJq2XZrlBPhJXeIA7KLujvf5zCj+w3pPUVlDCM3BupTBLCnrXj?=
 =?us-ascii?Q?+YkZvE5JLxIkNZg0VrobSxcTTtXvjE0yFuQlZKfjuzIOX5Rn/j6vqcvlmQnT?=
 =?us-ascii?Q?JUdqUgC5XfbwC5GdSH4Jaxt7XuCydr2UJUKeyfA7YhM6gesbZNV4gUlQTf6X?=
 =?us-ascii?Q?J1+k8BlyZjRxfPx8GRtI1ZoQP04wvb8Qurpah3AOdrg6ka3aWbJd83dI0aVu?=
 =?us-ascii?Q?WA+/1ig1nLE2fr1Y2vjfm53tJYuSLP/0l89AJAwuH+C0+3wLn9x4BrUwjqYU?=
 =?us-ascii?Q?F+hMDIRHcuNKvuwlwHArH1ziHkvsIXvX9B1KEXE65PcPs7JtF8VMyI+QAv2V?=
 =?us-ascii?Q?9jphVMobYzWfGoSBBIC74TXfgpPl2g6MZtKSDqfPv2MwUPdjTXm3q8si3s+F?=
 =?us-ascii?Q?C0hl+sEhZ7Au2mkFSnYjdgstp0IdNt0R4dOXyyLp?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c41690a8-400f-4ca3-fc14-08db810fa7c5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 06:34:04.3849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEhuyslz8pindEG8HfdRwdanNCPxWjbwyvW8tkS9CJde1m/CdoZbLW9kMUzbI6NGX/aQz6Lb/cobUM0yHNV+zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6586
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
Acked-by: Ray Jui <ray.jui@broadcom.com>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 2d8342fdc25d..3fac85be543a 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -1026,7 +1026,6 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
 	int irq, ret = 0;
 	struct bcm_iproc_i2c_dev *iproc_i2c;
 	struct i2c_adapter *adap;
-	struct resource *res;
 
 	iproc_i2c = devm_kzalloc(&pdev->dev, sizeof(*iproc_i2c),
 				 GFP_KERNEL);
@@ -1039,15 +1038,12 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
 		(enum bcm_iproc_i2c_type)of_device_get_match_data(&pdev->dev);
 	init_completion(&iproc_i2c->done);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	iproc_i2c->base = devm_ioremap_resource(iproc_i2c->device, res);
+	iproc_i2c->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(iproc_i2c->base))
 		return PTR_ERR(iproc_i2c->base);
 
 	if (iproc_i2c->type == IPROC_I2C_NIC) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-		iproc_i2c->idm_base = devm_ioremap_resource(iproc_i2c->device,
-							    res);
+		iproc_i2c->idm_base = devm_platform_ioremap_resource(pdev, 1);
 		if (IS_ERR(iproc_i2c->idm_base))
 			return PTR_ERR(iproc_i2c->idm_base);
 
-- 
2.39.0

