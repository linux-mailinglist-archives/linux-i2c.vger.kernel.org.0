Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E10151D6C1
	for <lists+linux-i2c@lfdr.de>; Fri,  6 May 2022 13:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234477AbiEFLiV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 May 2022 07:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1391380AbiEFLiU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 May 2022 07:38:20 -0400
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2097.outbound.protection.outlook.com [40.107.255.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A645B5F242;
        Fri,  6 May 2022 04:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaLNbEhsWvDnXJrzUSPlQ8N3kr8v16F9bbi50EckC5eI1JuxKyNTQ/VSUhaP79UM7Q9wZCgN92SYEhsHWynPsretLAHTJYrXc0llHXBcjj0qUlRpcgnV45/v3r2u1wftvafDAq69kG0ELCIU/3cxcjbioP44U2SI511pDucUfg3FapBX0frJs7jn01SOLj+7n83VK+6afRK+n9eVrp4AUR1JJed95OD42xbdTHQigRTdywhapSTdlWsq4VkL3kSDp3CHAurKXWCtLoW95c69u8hA6fsBS6giU43m2o+4debP+TeX1laK4Bmgkrjd/jMQ4z/bvsu+pzVjJnyFvAzilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxxiq3cnPprCpXgIBqLjL4Kl0hoy2UbJ1r8/8nqyiFA=;
 b=htiT007DEDpzfttUZL+PKSz9lvErktHxzBGle6cVB4VzwIbtsCYayIA0/gcIoNQlJ3CrgDG0ye0r2sP/nS1WGRjcRYTbvmR5bUvANxSnjfme4PCVvnPkBECYyFHRrtR/KqZlMc+2N8R63hxtmLuLDah7x9JNro+5sXjkxOvVr5Yhu6VUz7r/9NelQ8A8ha+KKVReMFOYNUZGQJt2/Z/s/qHc0uoX9vwqG4A4zJ+1u7pPP3GvtUzryAXENjAPht0pntuQnMqt0rzPvwTDYaXQ6yDgVtIh0mMh7OEQcEEtHfXhmpp2/soHTlyukBErElZmpkpYjcP9N8iXMAjSzhTHaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxxiq3cnPprCpXgIBqLjL4Kl0hoy2UbJ1r8/8nqyiFA=;
 b=o0Ptn+Ocu20mN4kB2qofMgOayuw+8FHDsxjQpRRA73bPxz52TSnTO4ddDM1zKPwR2NXaLWbB4SPujd0rcH91m7GYU6YLVZGFP5u4cu5RXV/qN3xKiqgmmxM6x4/c6Kfm4YjiTmuYEu7ajgsNwjkqePL/g684J2VvspSCWVSNN4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com (2603:1096:400:26::14)
 by TYAPR06MB2336.apcprd06.prod.outlook.com (2603:1096:404:26::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Fri, 6 May
 2022 11:34:29 +0000
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::d4bd:64f4:e1c0:25cb]) by TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::d4bd:64f4:e1c0:25cb%4]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 11:34:29 +0000
From:   Yihao Han <hanyihao@vivo.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@vivo.com, Yihao Han <hanyihao@vivo.com>
Subject: [PATCH] i2c: s3c2410: change return type of 'i2c_s3c_irq_nextbyte' from 'int' to 'void'
Date:   Fri,  6 May 2022 04:34:15 -0700
Message-Id: <20220506113415.10462-1-hanyihao@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0302CA0005.apcprd03.prod.outlook.com
 (2603:1096:202::15) To TYZPR06MB4173.apcprd06.prod.outlook.com
 (2603:1096:400:26::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a8d6e50-4536-413e-bda4-08da2f5461a8
X-MS-TrafficTypeDiagnostic: TYAPR06MB2336:EE_
X-Microsoft-Antispam-PRVS: <TYAPR06MB23369CDC3BD0EDE96A39E00CA2C59@TYAPR06MB2336.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CsFKFZtsEASjAHRhH0IbdRfneNb6u/TkucW+mv0Fuc3tdEriyyUuJ7Rm8zZCdwGBIiGxRwB2zr5G2IO7o4KIXkO2DHuSUDArtju8DL/BdZOKPM3/O/UUPmitsR0rsQONF/Jk5xaRNdf04Wvt8G7FxjQBI5ngo9ALL9tzN8Oia3ks00GQ/YfouYGL31kBC0NgckcESqzr/CPFDM9fPBoc8cVGjBIbVGkYVJZo9jNBhjOMf2pjAxas8ch+XNr/088knlJGJUIhX0+ienKjUIasuEhQ0OtN58ywHwzpElvuayu1p8PMu2Y4QGYOJqtAqydPjurY3IaMwgk479GO5jB3i2c4fowue5GhSfdgTGAmXDPDISKHCg3pQprAmZczMBHqfNuz6UgvEf8YyiDFH6Fa+rWmvTloDX9O147Z9BBT2H95aUam/NU0p+0cfZagBpSLTcibk030zzONrWhyLG1ZcZolgQuADCJtIZbwfuM8VEAaQwKMqYVyU53viKpSWAx0JpkTBX57egWamUIXvYgVlWNJmlDyM8ECMPAYCLwWTY+cudZePOKUxc8tAEbB2ScNuS7wJjs284XAxLr6E6tScWrgSCPbAWEAO3h48ojj2AH7Z4DqFh0EDCvHZjw18qgxhgBGTHrvAtcLteEYv0TDp01jpSn/3j5m1ooG6WzOiotqf1XONEtpvEKBy7c5MZk8YNvD4nAskoAo0C2Qjkp9xea1WOAZjBNFWdBoys/MwOZWOqvJbXn9nfZ4xI/QPJIN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4173.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(52116002)(2616005)(107886003)(1076003)(6506007)(5660300002)(83380400001)(2906002)(36756003)(8936002)(66476007)(8676002)(4326008)(66556008)(38350700002)(508600001)(6486002)(66946007)(38100700002)(26005)(6512007)(186003)(86362001)(110136005)(316002)(70780200001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fjIq6Fbx18ciJxjtdo9Pofq16AFSGJmuHiKYHKOLWhPbxZPsSFUEgX8bEfiu?=
 =?us-ascii?Q?Oe/v7j7x5VGU3dBVCmitDPTFyjRLK0MMfiTlmbMeHI2ihIDKrpW9vQLMVzqv?=
 =?us-ascii?Q?5wDug1Y8/zEcts1F2JQHr/QJq3qb9iu5rbyV5t8T4r+EYIvQMpaIi89A72U8?=
 =?us-ascii?Q?3EqSR7lCSP+Kj4+7o0MX3Mo3or6JK+S4TfOjIrcgKrT5RkC+FEZItIrYxz6r?=
 =?us-ascii?Q?8v1+sjhq+Ht9ciLN2G8Jj7Sep2HGa1fVmiriqf+ZLd5ET/7YEqKMGIjSgOOx?=
 =?us-ascii?Q?vYlf8RmyAg+09oYZ13KIrjP08+cZx1NlALfd3Hkr4BRvedebBjQLeiymNFmQ?=
 =?us-ascii?Q?KgjgcujpI5EO9BM7D2w/NOpyBDrszVKQr+rQNcR0MKl4RZZEogEh7ERe+BhT?=
 =?us-ascii?Q?KylSNNKabqOH2QPclHmx3nWyXewRqnTNy7U+yYKki8kibIC/s49Mm6kBON2I?=
 =?us-ascii?Q?FXV0Z96p9oJaVHzRNRbTukYBJDP1r6wAORp5Kd/UXqyTDDTHr9s9aZbQ9YpO?=
 =?us-ascii?Q?+YMiXr5/1mmB9dQxvXgyfyBLTSvAA8cQyKo02G7530hbZ77unqX0m0DNicLZ?=
 =?us-ascii?Q?i9hqIOcL8ecsiv4mDJoRR3R9c+zUx6JGY9RDDNp+CSP9TGBGfV4z6DuVJVkW?=
 =?us-ascii?Q?T2wFNYMytXVTXoa7f9bwft6FZOB/q2B4KivzlWqKsvqzv5rYCJBRotHtj2BX?=
 =?us-ascii?Q?oh79rG7tk3ggMdPSMubPnWJWgMFptXJ/14bjY+SfqmvGdFpX2pVDFTZMwNdL?=
 =?us-ascii?Q?GdIEYW6EqJibikrm0Yg6gmbN+HkMGWnS1R1lC3pVpILRA3K5pBQHRZvkR4Gz?=
 =?us-ascii?Q?cOVO/4xCubtGOvJ3kS1U/RqLMKp0TMqyPbg2/Nl4CAT1fatquN4eXNQjt5g1?=
 =?us-ascii?Q?0JBzhNGwA02ZkUBX4q6hFTjDj/4+SZHRd6kiZQOaQz8MLzBrgMgc/Y5HNKld?=
 =?us-ascii?Q?fy8/6WVLIhH7/pL48vDmcHdyDXjd1JQxXqOXG1oN8RoADawfLgRssNjP+sby?=
 =?us-ascii?Q?M946PRQhAbpSHK1MiAi99scCWHXqAAQO5/HplmyYFayqPj1bG3diueTjtBqX?=
 =?us-ascii?Q?AlWQu7y49PBJkkgKI3AusAjZ1gtqAzXgGqpjw3+asWtvqmiuMZMbPEZTtWB9?=
 =?us-ascii?Q?TWegIrJhhOwiuukuNO1tWV3Gz/NTX9LQ4AIpVKvupuCplFfZNbhwicIbrqwh?=
 =?us-ascii?Q?hw+zVhFUwZOEo5wnw6esq1+Ayeq4Uja63sNT2mOkc0Sf1cuy0e0C87PHnouY?=
 =?us-ascii?Q?Bk2mDFRhILscWbYsv7J+iwaySC8zJYmBeDXmmrd6wPs+ltVzyjox61pXGVx3?=
 =?us-ascii?Q?NoTht1Nq3yaRqI7AXOcKXCFJxuOYWIFffjRKs85es2spHOAPpJszkUfHA0GK?=
 =?us-ascii?Q?SRewg0htmCBRWqmzEX5HpvOs03o1TyUunmJlFmBPeI8Kx1DdMy2BTrFKOYJ7?=
 =?us-ascii?Q?fQE8pw84b6TkJlJ4vhxizdHFEJmObSGZL1Gg4XC9jHuikq42dyCe2qmAVd7/?=
 =?us-ascii?Q?wx1ReWGpU2K/ijY/PdoRRR6xBhbuJ0lr/H832oSyD2rHaMAMkbo00S4y13rQ?=
 =?us-ascii?Q?Y+3Aaw3p68eVNFUsrM4cSzWBLaA2l+lyNwgk/zaWZl8T5gK80ciN6wKFXnp/?=
 =?us-ascii?Q?rHBOFXrc+J6w4fdXNaeZhNvkNiWc7wpxuhu0V+dCqh4rsUUkF6HzHYKAZYeu?=
 =?us-ascii?Q?boUg93nOQLbLeIaJJiJkd59dThuRbQ96JFXbFPdHMSLl6voZvG+EQJ89k/mv?=
 =?us-ascii?Q?K9wQ+TqM3g=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8d6e50-4536-413e-bda4-08da2f5461a8
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4173.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 11:34:29.1677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MiuPGafa6Ik5pIuJFp88WF7Xg/jEKA4q6/p+KKfmqgA6IQ+tagl8JE9sZznb8woUEWzNGhp/NiOSNH1eP8FBag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR06MB2336
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
 drivers/i2c/busses/i2c-s3c2410.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index b49a1b170bb2..75ddf7ffb028 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -381,17 +381,15 @@ static inline int is_msgend(struct s3c24xx_i2c *i2c)
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
 
 	case STATE_STOP:
 		dev_err(i2c->dev, "%s: called in STATE_STOP\n", __func__);
@@ -547,8 +545,6 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 	tmp = readl(i2c->regs + S3C2410_IICCON);
 	tmp &= ~S3C2410_IICCON_IRQPEND;
 	writel(tmp, i2c->regs + S3C2410_IICCON);
- out:
-	return ret;
 }
 
 /*
-- 
2.17.1

