Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20D3D74856A
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 15:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232360AbjGENwP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 09:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232331AbjGENwO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 09:52:14 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2118.outbound.protection.outlook.com [40.107.215.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D79111B;
        Wed,  5 Jul 2023 06:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhqH9XC1Q6vNsDKMseDj4DH6Wm+/4bOzZdMONjnC59QAERkyk+afevkyKK3AvRg03uup/AKvgH6nVbHZH2rvpwAVaSS9AAVG1XDKGdbvl6UhZsqVavOolRXU5ldF4xaDZT1hIQn0qSbGQi09fcT2y+Gu5/z82gngFNpnW3+gnDdCNV4miBo6fTwjnq+pCn4gBvA/CwfoVV37XZDZox/1B4oexMOGdKlG4KJZFbHzJDdqxfAw/kEx1im5czYoxwSJeGFxsKfl63PQtRNV/Nay4NnjmImYR9e8eSXsEbNJlTJYqOoOYYMVZoxGQvy+qdqMM5rbKkVRFmyQaNAmmPRDyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9t6QskThFSp8iFbL7euFZmsipjxCImrO/1Qs+sOCL+c=;
 b=D498s43dQ4cA9MITqdisMkSr1qngd1NTpfyEKNpbGwBGpD3OHN4XouzDgu27TpPAcFNKbTp+eXT3zGDgUwBW8/M17/8cKvt39JEoXjY80I0+7teekhbqDChlz9AtbbZzIFXC0cEF3j65JK69JnRCwVun1T8Q7/J0S2UEhYjFhQiv0nLCsGiD6locTK0NmyJ3dlflRVMQgZHbNjPn2zHpp3ef6f92QoJrOc7njE1hnlfgNPhn8q7ylmixJVC7MSNwGVJ6IA2qfzdY/0FRDZukPLsysuOk+JlfE8gB6hN31vuAwgnXlkqbnl1SaX7UI/VGPONPNGnVNTNmkf6O1fXa2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9t6QskThFSp8iFbL7euFZmsipjxCImrO/1Qs+sOCL+c=;
 b=j0XgzB9dPRCT5RKTVzhSPx9HeZ1C9/mmKdK+nvHoFUZjVOGB1jBgQoHdp2boheJN8NjmxKTQQO19bqzX+zIzYeVQbjwIM2iUo5zCVTcQJbzZHA2XktR8tIHHgw4qJCRbp/L+D7HhlzKN0ZH0EwQcANi1SsaUXy/XFQPZTetwAgTeIsKiIW5uuULauqwEkLkLisjyqImTTtthEw7I5Kj8NumLi+b9mzv0LsFe6RRSSCj486avZ2unIN44pa8IShzJ+VD/nwDuFYVHHJfXGeCbpUBiKIxY42YO7RAfMjNsPGXCg+Sjy5tHa3MyCzpOa22pNzmOthnlooLQBU6zyrcCzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB3991.apcprd06.prod.outlook.com (2603:1096:301:38::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 13:52:11 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 13:52:09 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>
Cc:     Yangtao Li <frank.li@vivo.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] i2c: iproc: Convert to devm_platform_ioremap_resource()
Date:   Wed,  5 Jul 2023 21:51:49 +0800
Message-Id: <20230705135159.33327-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230705135159.33327-1-frank.li@vivo.com>
References: <20230705135159.33327-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:405:2::13) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PSAPR06MB3991:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b66a2e-c64a-41df-7ebf-08db7d5f0713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /BbZGF4A0oJRmnRuuMl25j5mXXlQ+fmhzOb2Q2PAWolKovaBr7Dbix2yZi9l8CgAnIO+pQlVdstLTjWgIlmHhv345i1q80jOMJubZbMI4N1vd2IWcT1f69fAC1ypqWYReKvsa/k8SUOns4cS/jTJW3JmiHihriBWTW5RWNmf7/iUzaYp/4dP6VMU+bWt/h07Je4e4ONcvmkwYaj4KYILw6MJEqSOaUSjawXrGmaHz0XLPHTEgTcNqIMuAtDTwXZ+3lMI2IfN5YJjCNzx9uf9bDSos51YesldIxruQJEzxZhEkL66rWS6prTu0hhhjvUVkPmxfiwmu2wgamWvKOtuwRGakB/RDAfjdNKWS0ddw2hucrzbLCep68Dc+4GzmwarAGLbu0YpGld9c0bRGDudtLm+nEGKNXiGMYbb4jj4LsYxYAAzEr54f+4JRzOISyR3/6uU/vx+lpwOi0FAsqIJmxfkiK8iefyf/eXev3qxNZEGmNJenvAcBXK36vgDwvpiBZI8dh5bqyq8DLy7x57RrhdR2ATi6q1lnPVml7CcUBLGq7eU169QvnAywKxAEPuKgI5eKXLVwFceYS4ZIyhHaT9ceBKliomkhr5bY0BAN97farvH0Hd5Jr4rubJ6p5n8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199021)(38100700002)(38350700002)(66476007)(66556008)(4326008)(66946007)(2616005)(186003)(86362001)(6486002)(52116002)(6666004)(36756003)(6512007)(26005)(6506007)(478600001)(110136005)(1076003)(8936002)(8676002)(5660300002)(316002)(2906002)(41300700001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WWPohu1l4QSWaBWZyduJ9KPWlS2thA0GW7/mYs86O9UfjkIen2FkjGdDf4js?=
 =?us-ascii?Q?nL/2VNqION387EQ4BnHO8m54FUY1DAiQ0l5nOd4Xofkz1I04B448nRNTIXHh?=
 =?us-ascii?Q?s7/mCSJZP5z5TfndJjwSP1Xf1CPAOWG9I18fm31eer3s/vzobZZqM5BZ0kzU?=
 =?us-ascii?Q?vh19pheO0FbV+UfMs8MPVo+cxqk8kVy3RO6rWWL2sZWfUcY3TRW5UhLgxNBI?=
 =?us-ascii?Q?ISzul8t+Wv78caJzoa7Yc6lrnF5mJENDRr5gbbF8qG8IFwFPdQGvzrwMh11u?=
 =?us-ascii?Q?C13H4L6QTCQH7buhKAaKwbaYZwYjocGIR7rQLM/Pce6iPGB+bvGGyBhK7+EP?=
 =?us-ascii?Q?+vC/uVZeZEKudyNWNFQmNAqKW4y5RwnPuaeU99y/CsBJPZ17UjJjVQVO5CMf?=
 =?us-ascii?Q?7mGnxGfZve9phKfC76W1acnpA7ZRJvv72GLzNSE2hkxPdx+6p0uilEeljb2C?=
 =?us-ascii?Q?X09PcIMsZO2c6zo9nydKO/cgHCQ6DivvxpGVoWjOjnOrnIYWgDkQl6hnOxGA?=
 =?us-ascii?Q?b8r5V/qPJXf3wC/EFv42sLAuZF7Koqq/T1WPl1/ThE7Ps4LNhTi4Gd3SH9fw?=
 =?us-ascii?Q?3Gp/kvJyvuSZr/y+N9n4xWEfP1utv8ObJvwBQHqMKMMe6c0dLp0DHvDw7LfY?=
 =?us-ascii?Q?FzfAajzXEmQXNB/wHkTztesgWBqF/vjelqCfl84PsU7G/724jzwD2//YS900?=
 =?us-ascii?Q?5ZCILOIoLQocCdogahl0rFN8zSkbqfZJ32SsBtgrVG1xa+3xQQM2U3fc58gZ?=
 =?us-ascii?Q?+UX9jTbP2dW2oebKNgYvVlDQuAX8aRZES32LRAV1DRFghbxvwuVkIMJZZuDW?=
 =?us-ascii?Q?F+PjhpwbcxnLtjXQznMguqR12TkcxFODRpd1rOXK5vihGZq33NYO2R96elOn?=
 =?us-ascii?Q?bLPyY/svOPbBb7Wflz1zVGuDcfn9sxqoi8xABXC4KcRcSPPSw3Bk0mVrgXnz?=
 =?us-ascii?Q?2JGkb+fXSyjl0EguXFv219J2ZQKIhyqB9vyC5fjtXt5o4gcaCzOjPusGvJIh?=
 =?us-ascii?Q?fFX85BpCvKV476bZGtxFMrH/l4QMPLrBAvFQn28HnD8yw+o6LJVEAxA82Ked?=
 =?us-ascii?Q?HDklHQVpXn+V8FhaLd8fSKkwCsCLiKpqvheTcMzIJCtHfIqi/kei0Z9SxFQq?=
 =?us-ascii?Q?zGtRAZcFZ9BbgqdG9/5CevXbz7x00zyhNrMNZvpv+b2SLdqjCKTaoFZxZ4YC?=
 =?us-ascii?Q?a819tqGUdy3fbAuj50QSYtwJf6US0/W4w4L5A8IPD6onVTkQbOgzeytE06Pw?=
 =?us-ascii?Q?oEMRgg/npbf+CfPdD8q7qNAQZogt+yZ8xkH4D0WAQiJ2FxCENyZ/6MWndMx2?=
 =?us-ascii?Q?rMrOMLBdLN235NCm0ZAWd1N1p/fj/ritYdkIRgxxKwrB6y8XHm/FXmuJgC1Z?=
 =?us-ascii?Q?V5tlrG9C2jj/hqCOU3afLmzpu2H5Grpqt1yw12Y4YMEgVmf+n9VF2tzRO7BW?=
 =?us-ascii?Q?NYOmvTTH5pwoUPujSbh9WLqOCoFB2udde4i2BE4z3/gMpi1+R+VjQX8CpS6J?=
 =?us-ascii?Q?qygwTwNu4WVSvlh3yL2qIY4I8mIs9EkGXrguLJEbIz+9ExwxDkSu0SDOlGMp?=
 =?us-ascii?Q?Jc6HTL4fWgjauxHBK3QNOtAX2nL2osAeNUN8WG0s?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b66a2e-c64a-41df-7ebf-08db7d5f0713
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 13:52:09.8521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AS6VAk4HYCh9AX4QAbP0CxzZLCtlVQXDDwYUr+WZJHB66HISB4WZGkw+CA7HwoWVUvLxls2Cax40r8qlFii/bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB3991
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
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

