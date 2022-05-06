Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C491C51D255
	for <lists+linux-i2c@lfdr.de>; Fri,  6 May 2022 09:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389558AbiEFHfo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 May 2022 03:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239921AbiEFHfk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 May 2022 03:35:40 -0400
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2103.outbound.protection.outlook.com [40.107.255.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB6C05C869;
        Fri,  6 May 2022 00:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+gW2JDwkTQpSPAgB+W4X2b/2RAYdk6UCAxmvFcCbLCYGNAae3QoCwjzTchltCqrhoi0xea+C7zKBA+zUkbY7jw2N3ewY6Si9EwpK1y1BP3M4VGv3IiRqTRPEV/M14EhFfGT+jPbJMqca6VMUKdPx9XIgFxgq2b0i5dfeWZ+pfxnClyuFdH9e0YqP9MH6o59SRcFtyxd8zSj7NxMM0CktUCwM/VR6/GyATGuxAtxT0WcwMZc9huGJ1oRGp/KQtNBlIyh71tWIRPjvt0Cd2pxKSO/swj+1Te31rMXEHL0zs/vFXT6fhNkRgIWPehXe5gRhoMQml9TxtY2BL62ZDyn2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fD0qmgtwIdpW+csUypRu/f/rgLDbsjkypALBiaPqcfg=;
 b=AyBvjhr9aPAlmxQXiACLqV63MYekuxVqmkuLWJlogdeZFx7oNh9Y07HZODKjU5rJeXALNXijglLidsUta9Q0veC9Dx4EIXzOeHzLFVLs3OgqLkWGboBe+NEIXOR+lYGNPkJ9vUmwnpXp4EdCEh36m4MXWsPC3pMMo+n+ZDEQIvvUy5vr4HCqs1d+WLohUVKuQajywJAR4+/GuLik5kdHuACn9XaMKZq+hdwpL7vzUYLgd5ZHFFVnAvlZtbb+BxnjXqw78GKGP5T/y0meeEzOzqFTd7Y1RAbVuVAaKSor7cJ1ztU8hHmAsNH1B5X9h+mywVGZX4V+DHOBPqx1CB+sBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fD0qmgtwIdpW+csUypRu/f/rgLDbsjkypALBiaPqcfg=;
 b=Btrn9zd5aatJYi0YKkgryRF0Az17+SNH0/0wx/VYVqzgGnD4m2wPkjrGOIg1PAuCcwGkzvVZS5DgA8YIkFue0+sHuHLVgE+tP4A1+Nh319Wxez2JtCRtRUJS4FsKbugjRhYr93pp6CWIwOfcOk8A4HBOGdNKnSj9rMCfCl/qjuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com (2603:1096:400:26::14)
 by KL1PR0601MB4812.apcprd06.prod.outlook.com (2603:1096:820:a4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Fri, 6 May
 2022 07:31:54 +0000
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::d4bd:64f4:e1c0:25cb]) by TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::d4bd:64f4:e1c0:25cb%4]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 07:31:54 +0000
From:   Yihao Han <hanyihao@vivo.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@vivo.com, Yihao Han <hanyihao@vivo.com>
Subject: [PATCH] i2c: s3c2410: fix returnvar.cocci warning
Date:   Fri,  6 May 2022 00:31:32 -0700
Message-Id: <20220506073134.6544-1-hanyihao@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HKAPR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:203:d0::15) To TYZPR06MB4173.apcprd06.prod.outlook.com
 (2603:1096:400:26::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cc7cb18-394d-4dd8-2525-08da2f327e56
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4812:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0601MB48122025901B9D16B7F53EEBA2C59@KL1PR0601MB4812.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vgj3BhtZ+xBhqAVhq7k3Wkcrq302cS89PhoMpAhVFW3VzKWB2ubDzMb5BW4OSTcHFGVDaAX/ACN98pB2JZsQI85BGILyByDmv6LsZVFnTVPCXoiOkRdbq3ncW+s7Qf9cAy+3FaiiM9zl8n0lyzD5u8L4GMLfV//Y0Vqx1pQz+S8MmY6blxac//cpUagWPQtmVS5zsUvAgatZyQhfpu80tfyrf8FFIVvnEeO4o8XDjp05bjHvqW1DJcPrQ29jIWW3+dlMX0T0XdngGelvM1W/l84ZOGfOlpwv9Mr3Ac/Nw8xnwBZatRtGmxN024a0WJBvwHMwaW9I8xZpBD7AEdq2kIaact9sH2Si4ML4Q34LjI2CRjv2DJwh8ef9LEsV7Gh7e3mBSGVNd5cbA277virKQOFdVAfMdtPwbA5TvqqIeAdQOYBvcvcWkY5h+Aj+qQzB8GAexPg12kbhJSa4X94YNtqhiC79dTli0tT5cAWxWHnJ+96w3Bz5rj465I8B6/iD3OCpN//3BJ8hR5hTudwOXfpdzO3twSd2mj0oVJ3YEfLaGVR2chFTxDyVwrPtNDNRhdNLL/zZTlTKUX0/UKVjlMpz2oqTHkeUU033HtzNH/ifLyxCQdcgUgoDrQ5dLzTCSV9GWz1lQbo/V6qvBO04ss0Q8YaGmaEjBFcKW4KAVIqVt3Haije1t/GDvwBFh5kNMiEkNoYC+tb82vkGWj19AQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4173.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(38350700002)(6506007)(8936002)(1076003)(6666004)(2906002)(316002)(6486002)(186003)(4744005)(36756003)(38100700002)(83380400001)(2616005)(107886003)(6512007)(86362001)(52116002)(5660300002)(26005)(66476007)(8676002)(66946007)(66556008)(4326008)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gkaWdVQIdGXTIV7cUSmakRKeuLq2TVEpM5LchxwoY0Lywpk5YYap56o+sgkJ?=
 =?us-ascii?Q?lGnrNdNTXjl4TNF3rl2SN5t+PphMn7MN8MdQoiXOFdF20EgiHi1W1N5Ct2xq?=
 =?us-ascii?Q?xC97ibecvTBmBU4O4gxfo6rT+2ZZ3mNfa30kQ3HZwn/mmE0AOD+8SRTZEe/a?=
 =?us-ascii?Q?5i8UAwLWlyT9IaUuIKziTHhh5YPrYf1N2ft7VVd9Z78llazj61owDxH5n/WZ?=
 =?us-ascii?Q?el2CGpPAufVq6PbaUfQQ8A1bwQ/bty51hGoaN5dLZbXjYpUsbiZIItAa/imT?=
 =?us-ascii?Q?2BULFPvcmTkU4oLz1mmwsMCaY1yKUMBjMxJIP2gsguyIsuRVvGFpkg/z5rqT?=
 =?us-ascii?Q?3JhY0h2mN2Lq17CD0p7aOdFBkDVTcKyn7RE3MAEVcssAI5AwGTn+P2G6S53n?=
 =?us-ascii?Q?XL0ADGSuadzF8xBLL5E2OCzApeLJxNCrkg3J5QiavBG//EikqCt6/0OifGYg?=
 =?us-ascii?Q?SG0JrqEKGgeJOD3ZXaFTyhg5v8gvBNE4V3LEePdP6eE97EOm2d5D0F8Sw3TV?=
 =?us-ascii?Q?zD6xMkJAfUBYxGL8REZUySaMAhQ8kEjfz6HabZnpcfigbXTu/x+XtgY5jFFx?=
 =?us-ascii?Q?g4IsjjLEmZGdRYn2ZaCwWWhkncHnhThFsnekdDVXG/bPqkJjFhSv4/rwac54?=
 =?us-ascii?Q?Kxpz48KTDslj+wgvDLulu9tWW+sVL8HPTDovWv/+HnCGwaIOkHpvjnpaz+bS?=
 =?us-ascii?Q?9r5zEcYV7CUt5DAucpTusjdTXI30cW3bTS44XnUXELwrlk8v6JgLTgK/JuZx?=
 =?us-ascii?Q?VV3sUat9JbTEiuNk/XQebdytfGEKgO9IBGKGgA/OpoH+PQuVRWdPO/XPe7pv?=
 =?us-ascii?Q?D7jHgazyBe8ZzAt/sDmLY4guD1S5eJW1KC9OjHlN3V5YE47FYEBRR1Z73Nvd?=
 =?us-ascii?Q?0PkoXkEia9T7K79pfGWSnV1ifHHjNQRdsC9ImpVIOB/l1UbgZWywNXm6+vJS?=
 =?us-ascii?Q?UnMQDxOsYEJOqPBS9U3G8c+0NJx5+U8RIGcztHfsfmYhVQcuASchrEvtgTBo?=
 =?us-ascii?Q?dO+PpbpGaobHfbTteGEMcXqlUuVxqZZrQZT1u8eX9KMP3tPPX2azoV/FjTqM?=
 =?us-ascii?Q?SLW10cd71WoMtItDcwN3lt5puhWwyCx5vMxG7zkmH66r6GrbS7r+N47RIuiF?=
 =?us-ascii?Q?Plzld+sEuq0PavxQlANnuSQOq85JTaurkUp0uE+mFHU6/ORj3sgIKW8ElAkD?=
 =?us-ascii?Q?QPvWhkEzeHV9dL/Zx7O5/GpqtBiW/T2V2E0B1QPsFQiU7/IC+j2caKRTyWP9?=
 =?us-ascii?Q?WTw+GtTCb3hx7AW4KYU+qsjnXlzwD3iPAhptXnCbdiW0zLakoGktH5/RMeMm?=
 =?us-ascii?Q?ittafe1tl97gzH4un8hqrNNILL7vEkgcAnQr/DUU3lTA/bDKhE0thMRKNlrr?=
 =?us-ascii?Q?v7+52G2+f0nSX1AueMOhCq18oyuGPpT2Dts2ap93/i/xTrPx3I8n1f/Ed0nU?=
 =?us-ascii?Q?88zf65uVlYqOBNfWrO939us6BKebqfCAUtpgjSYFBVP8Oi/IooItOcJD2pwz?=
 =?us-ascii?Q?ZsoRvLKnIDbCaQGKxGy8n6YL2kdBRK9MIIqEoio3BJWEhBTVqzMN7NLLnptA?=
 =?us-ascii?Q?dccd+F3o0kK+cH4+x/zIe+75NPj7sasgNrKC0Q7xVrAcBEII4Nx4sXItUIkl?=
 =?us-ascii?Q?GnYOY4MY3J+xVM4KC9FXd0a3c6IM8nNWRDj8HroLbUT+RCzLFIEq+Eg9oEwb?=
 =?us-ascii?Q?zJBTOAg2ltaVmjSWAXwBF9RjpWeWtEpAjg2UdJWxEwGxIWWAXx+Xy2K/irZl?=
 =?us-ascii?Q?6YM0mRYNGQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc7cb18-394d-4dd8-2525-08da2f327e56
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4173.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 07:31:54.2198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ciTfI0zXebadGRf4NqNL1yjamHCsEKWinWigb1UkOrfZjEtSLr7spxnOGI7jxJjtd28lkoPB5+4PdmlMbOTfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4812
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix the following coccicheck warning:

drivers/i2c/busses/i2c-s3c2410.c:388:5-8: Unneeded variable: "ret".
Return "0" on line 551

Signed-off-by: Yihao Han <hanyihao@vivo.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index b49a1b170bb2..6df85b23156c 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -385,7 +385,6 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 {
 	unsigned long tmp;
 	unsigned char byte;
-	int ret = 0;
 
 	switch (i2c->state) {
 
@@ -548,7 +547,7 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 	tmp &= ~S3C2410_IICCON_IRQPEND;
 	writel(tmp, i2c->regs + S3C2410_IICCON);
  out:
-	return ret;
+	return 0;
 }
 
 /*
-- 
2.17.1

