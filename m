Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D412751D7AC
	for <lists+linux-i2c@lfdr.de>; Fri,  6 May 2022 14:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1391895AbiEFMbx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 May 2022 08:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1391943AbiEFMb0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 May 2022 08:31:26 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2110.outbound.protection.outlook.com [40.107.215.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6895F69CE4;
        Fri,  6 May 2022 05:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wcv49QRo8LHmiqQiGldPgdasbCMQcPCPN+VfDZTPIBJLI3H7c/udZv8R6j3XQxOR+6smRl5AuVt3MMoKrwthBtH6No0kFr5S71Vi+vrpqapiRCnqSSnaGBeYO+UAad610GwKt/TC1q90/U/uvdElHsJGpMTzd9lQL5EcLphaopJohrdwAJABOMg9dBCtJBZ8LWjsoCAbwNvEJ96OH+U0zQZ2VCijHcKPphEAW1v5Yd6jyH15WgLRi6IW3p+SHxuGnTwg6HC0aTDnJUCZnRba01zPXj56zOrsW+VgrBK+aXyTTRr65e0CcqX1IKPSdcAj86+cK7WNh0+YYHnST0JryA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0QvJouEviv0FHXV/docBT7i913AGwNOBUojitCWRAY=;
 b=CE91+aqPjvuiqVIz7DeQCKvjSGUHGQ3eP1OgXH19Nqf5lIs9IwYK+0bxyhZgeonSWSWpySeB2UH7oNV2to7JTHeKNFOLm0mNw50Nbee95BR0hRLwoGPrJv7L00jA8LsPQqzN15JnQPFbO0jcCLihaP0kWwT1VTFPK2zK+swBdLNSu8LdTWi1kVIWy+i5rRLx9Hon3oNdJO4pq+Ul+U23JtRM+g8kNgPWmtTm0S4JFWqrX3z6U4+eSoioMgmq4JUnj3k8fcsxor3iTwk/KcyLtzUK/LfLvFYlDnQLz8g31lYKJBJZBRdV4iQVP0pmRV2q1layFm1Calv3AlnEYy3dJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0QvJouEviv0FHXV/docBT7i913AGwNOBUojitCWRAY=;
 b=GMwKRHWufMat8oajuIoXpxRixrl0OCultiWETDAmYGW/byUUEhlXDTuWFrQwb9rGRiDpSp8e2wTjobX0Va9e78EVC+HdgndcA4U/IXXZjLrHR0lD9ZhHflwiBmc2uV5p0564gLqctFoN/tfeP3OrZoJ3/WIQN9ZLhHn4naMhsjY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com (2603:1096:400:26::14)
 by TY2PR06MB2669.apcprd06.prod.outlook.com (2603:1096:404:40::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 6 May
 2022 12:26:58 +0000
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::d4bd:64f4:e1c0:25cb]) by TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::d4bd:64f4:e1c0:25cb%4]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 12:26:58 +0000
From:   Yihao Han <hanyihao@vivo.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@vivo.com, Yihao Han <hanyihao@vivo.com>
Subject: [PATCH v2] i2c: s3c2410: change return type of 'i2c_s3c_irq_nextbyte' from 'int' to 'void'
Date:   Fri,  6 May 2022 05:26:39 -0700
Message-Id: <20220506122639.2544-1-hanyihao@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: TYBP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::20) To TYZPR06MB4173.apcprd06.prod.outlook.com
 (2603:1096:400:26::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa97e45b-8ca2-4c5f-bb04-08da2f5bb71c
X-MS-TrafficTypeDiagnostic: TY2PR06MB2669:EE_
X-Microsoft-Antispam-PRVS: <TY2PR06MB2669D0C6BCCF2AA4B9D1860EA2C59@TY2PR06MB2669.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DhtVUfT2JOKgQKLg1icn2zDW6dXjLBdB1LOLB3FRdhR0/1c9s6ZdFsNocsxTzSe6WNLfSDfX/qpIxs4mDOd5vABvFMYCUZ7wpeeEh/iaJc2eHQeSs0CbavbOiqAYCFLjkU1QkK/fcKvqrBZyiJTzvqQ0tCJ34HMf+9iHMgsEpAU2sxIN0HkyTKYdKTEp3+dntrVVZIpMzfwdKXh0rY2Ky0028DQJYg/tvgh7mBwgmK97HXAUn/+8eWmPswJ9kwd9eNUkXP2UY0JAg4tSJZHn7ZezE8jXVDEHE69UXEqZQb1yLYnd7J09Fk9tLOaXZEx+GKbJO5MoZIV3PgPWUvwDlPxyOwWOB0KhfG2k0d+zKi3NHaHPsukasNhGEoA3kn0C2O7yxqLbhsUIk4holUHX5/y458MFkpgVsy+rwL+JfILIuLRQ/ZfLokl8//D8Mn3WGAUMQuH6v+D+lt5cLL0ghUxZtSUT9THK1Rxf7zXu2TR2PF5/9EDkUKXH9x3emraZ/5pgcUSkIUXwTWud3hx2sTM8prHiUvj8HneE2GhC4ofZfEyad/hTWqo4PS+5i90jdk2r4yJy8mVCQKFpPPpOLVkoViQx38u2DYuHs4ZHSUTE378vfNsR1kCoHOEOnaUCn7vYGFKJkHk9125CV/HCoN5MOmJvYpTihpq1O/ANAR3dK7k0NDt7Drt2WOM/84ZQ8/ywPQtV4PRwhwyGWEhoWeLfy5BOVygez5Ldfb/PFfczkVyhcFB2G1Kz03DBusF7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4173.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(4326008)(52116002)(86362001)(8936002)(1076003)(508600001)(38100700002)(38350700002)(36756003)(66946007)(5660300002)(66556008)(66476007)(2906002)(26005)(6486002)(83380400001)(107886003)(316002)(6666004)(110136005)(6512007)(6506007)(2616005)(186003)(70780200001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YWfvuiADDYz/Z4mFO6IVuKkyIoLSlK4oCoONmNjKIvv9EmN2UiO1dJE8GQf7?=
 =?us-ascii?Q?9g50G689tstDuZTkmik+KMJ78gnvKIknZmCF39jm3cK3hbaSWsGwhXA//K3o?=
 =?us-ascii?Q?gTkPbRgXPr5ZARhGw80AtITANrv/PZUsFtNNLwz+fUHJpmC9DYkLzWIqfzEg?=
 =?us-ascii?Q?dfwquev2kN7HvbrS/WerxrpVlbffVapn/1/g1viZDZb+SjbTsVQUq6T/K8tV?=
 =?us-ascii?Q?d4YE9f2dDDGbrZ9R3gV7wzU08+pis9PQWnyo03mMvLshlC96eOAatT+nhpCU?=
 =?us-ascii?Q?n9SmivPUHgGHtlu8EGwqlAK5xUyZ5tJ97+j6H2NMwrVpK/8qaTLWGoemZMN5?=
 =?us-ascii?Q?ak7PDyJidtMKy4pxrmrzRZljsNA3EjgxkG+UdkUU07uE0uqYX1xUlmTDDjwQ?=
 =?us-ascii?Q?T/4+hWnJkRiAQl8pq8o44+lJxef+EVPL1iyr4H4mV6OuH0zgg5CeOBs36T+0?=
 =?us-ascii?Q?I5tPCuS8Fg8MMQptzKSGK6f0jB9l/gSzBIOEq20g12M1CV5wqRL+bhHUHk6S?=
 =?us-ascii?Q?LhqW+Qg0B91JwkCnV3nwNms56BvhwFuW2J/P+B0KnXr/gXlswG/34PDiznfn?=
 =?us-ascii?Q?ZeNaQ8Okl1V9b8F/qv28+NquzLUlZAmWle7fjuETnRle3JlN1cHMjlB9yYJg?=
 =?us-ascii?Q?MGhyuNF59RUCsn1m0G2gyBVJHawOs2fMfy+0V1I2bXGI2dHBWS94jUtpm4fS?=
 =?us-ascii?Q?zqa0wvab6RcjNd8FzqppOlT4gXez7UjU8YyU0HgJeWNw8CbDMbCNevd4qsJM?=
 =?us-ascii?Q?mKbvOcw7etbJq08SVm/PpP/ai6gJOw1VKKyKzZl7MubJLFZ1X2fcsNoPBwEQ?=
 =?us-ascii?Q?W+Z2voYzVtXBaCt73ONNPDDyfSfzkYQ7PC7DymkdHJsuiU6f2ghd4JoEUhTn?=
 =?us-ascii?Q?D4WLrpqHVFED1LpwBimbqAk/4OvppBqvGtdjrz8ngml8juSI4+EjfcBnwSVu?=
 =?us-ascii?Q?y5lGTtqWkZL1M5tPYSGmeCUpblDSQyyVIYcV7Tm5rlS6xoWwSc7C64ErtvnG?=
 =?us-ascii?Q?Awb+jb//unXmohlWQ8TH3kl92apN74S89BlKl56AxIfIaRVt8iTW2s2auMQd?=
 =?us-ascii?Q?Gy02/oyseBTZO4h2hImi7eOI7yLmGtt/k2HdHWV7b1zJymxfOBii1jAckdXk?=
 =?us-ascii?Q?vLH5isc7pAKSvF6S2eePcHnXqGojB9RNKGZNKYkgfb/qJyf3f/9RfYc2lQmV?=
 =?us-ascii?Q?QtCHt2ZtRJ07lMSAeq62ueBy13du26YMdwIbWtZj+Zb3xBQ0NUlfM+OCEg+O?=
 =?us-ascii?Q?jfYXNstOrT5L73g/OT6FyFYpzzcaRRb3HL3QOKQzllUM/Jims4ttyHSpUer4?=
 =?us-ascii?Q?H/gBNjeGrpKEyoEKtU0vxuGz+ivgJnNCykd7K6DT1LeCC62rXGfj2jyNEM6c?=
 =?us-ascii?Q?3aWSL6IPWgnHaMVCkIPsIB76WexR21h0/1cqbTW+jRZo+1IwX0AzImldYgln?=
 =?us-ascii?Q?QGow63guHvBVJvLE5ywO5YaVGooyWGGCXFIMV5hes8t0NY+1IbDdqjPvF6bc?=
 =?us-ascii?Q?je6ciAVtOJwofl8LRgqZvwXpflpknZhWcbM+Y06ngLg8cao2objnMLOYOM+i?=
 =?us-ascii?Q?Q2rjxuHaXg1PiWi7on68Bcuvmp7hayng3tqhotFedleZVGd3rlkQ7idk+d29?=
 =?us-ascii?Q?0KOQKncb8biR0k20g71o1zO3Y+uN1+APj8vHjvTG5ZVNkgLYUk5HwYzL5QJS?=
 =?us-ascii?Q?Prgh0+MUy37Nio673byte4bFQN9GPIm+y/QYxaTbXccceFH2J8cxKIY6FCdT?=
 =?us-ascii?Q?+AAtJ0HBcQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa97e45b-8ca2-4c5f-bb04-08da2f5bb71c
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4173.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 12:26:58.8395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMXsO48mZ9VbFbljG7CCZ556DGStBwutcNkWPD7FDkWznrCKoEBfj8LzdzbU463+nPCWFwLCeukZSdIIQC01BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB2669
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since ret is a redundant variable, and none of the callers check
for return, so remove ret variable and change return type of
'i2c_s3c_irq_nextbyte' from 'int' to 'void'

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yihao Han <hanyihao@vivo.com>
---
v2: add return in STATE_IDLE case
---
 drivers/i2c/busses/i2c-s3c2410.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index b49a1b170bb2..d2a1fd2aa7a0 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -381,17 +381,16 @@ static inline int is_msgend(struct s3c24xx_i2c *i2c)
 /*
  * process an interrupt and work out what to do
  */
-static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
+static void i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 {
 	unsigned long tmp;
 	unsigned char byte;
-	int ret = 0;
 
 	switch (i2c->state) {
 
 	case STATE_IDLE:
 		dev_err(i2c->dev, "%s: called in STATE_IDLE\n", __func__);
-		goto out;
+		return;
 
 	case STATE_STOP:
 		dev_err(i2c->dev, "%s: called in STATE_STOP\n", __func__);
@@ -547,8 +546,6 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 	tmp = readl(i2c->regs + S3C2410_IICCON);
 	tmp &= ~S3C2410_IICCON_IRQPEND;
 	writel(tmp, i2c->regs + S3C2410_IICCON);
- out:
-	return ret;
 }
 
 /*
-- 
2.17.1

