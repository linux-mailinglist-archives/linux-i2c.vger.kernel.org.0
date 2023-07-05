Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 049EB748583
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 15:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231539AbjGENxd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 09:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231937AbjGENxc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 09:53:32 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2122.outbound.protection.outlook.com [40.107.117.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA9BF7;
        Wed,  5 Jul 2023 06:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/9kNx3mlXFP2z7V+s//vBUH2zkFZjiYVjrBWwba/j8hxRpIM/Q6kA+ufBtkU6DJdgtudBujZ/Io1KjyNY6kSZ++tuF/qeULd9jK1W4KGI62ZU47pvbaOfJxZ4EGoeLFuE6zdI2H+PGu2LTBPTvoEGCIAECr96tpPQVl6lNFWc2Ug2rLlaSInWH6KwoglpZs2JAWHX/ybFN5bxT833QAseTVwNZDWmnC5Q26tJmXZH4FUIsKV0AFhMIAHK/yF/NvYhByOCI0dFjHYRSn8IBb0q0ev0E4YzP9vCoVZXlgKap53df36d/ERBut0g/z/IHcRoXoZtKZrnsqAMNSTRJHvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9V3E/S7EZrZHFawnqtiHHPJ3MITcasZo4yoCNxbo2Y=;
 b=cf63vqLtZV3KlXJIaL1A/reppQQqRMfOViEqXT2JCIikVCdslGt1YtrgT6NFC5aMXMr5cvDOg4wVibBxundxKqv9r9lV0OK/WaqK5zr7lNsuHh7YHns5eibogmk9VNJdE+jYMLz6Bex6s9unYB6z6Q45kBiEbpQfjfyPS0tGHYVfh2EeqqnHfY7txULOiToZLC+ugkD4VGeD0t9X8bqsext90uic3uEHlLatZII5nwWEeLGQEpdPbU/jjf7xaTr4UAGpsOSWC7RHm/eLWUu3rE6DU2C+prQxQfT6ZC7HlqMCK+7v+VlX7MugPQJxJRUB54VflhK2ya2SWQRHjcpe1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9V3E/S7EZrZHFawnqtiHHPJ3MITcasZo4yoCNxbo2Y=;
 b=kywE9m0AFIKZ8cB+RlU47gvL4cNsKoXSIUZp5KPVAgyvilLqGHrakcn8a+IG0tH38ffuRnyWQclvl+V7WfgT3Wfjaa/0bLBNZhsisYM1roxniZoEBDp7VNjIzhWXqCCCGvFCS0GR6MmMqlchv3x8FWWDgkW1NwAZ/PuCHTEdxdigh79z86q36IjwCCHGPFBir00DvgFWc/5vQUGXWmD2sceSXtDTkzD6VQT1jq55ysF+UK0D7PgU5o8ienUlOrFZF42qhbWQo6BmoiNy+s3UCKSOCChBQh7wAeCjGc0BuKKOYWF7aALb1ZdrDkR7a/ej+5uEA/L10oI+BiiPMizH/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB3991.apcprd06.prod.outlook.com (2603:1096:301:38::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 13:52:21 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 13:52:21 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Vladimir Zapolskiy <vz@mleia.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Yangtao Li <frank.li@vivo.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/11]  i2c: pnx: Use devm_platform_get_and_ioremap_resource()
Date:   Wed,  5 Jul 2023 21:51:58 +0800
Message-Id: <20230705135159.33327-11-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2bba23f5-80a7-4aa1-3f88-08db7d5f0ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d7E/Y58kTsU82SytuNDM9TKvTtqee4nNY7cyz5dAaxNAGUhgn5je9nwgTHSsssVpH6TzzkoKamVGXhnvPx6ZCdks5Y+TzECkuqYACDyyrdOd6ZQc+Dc12FuO64CiRW7sRGp7NjBIBUIj1s6Nki68n7aCeZV24Y99u4voBgCGSOSGVH9rAzIurHczMs2kTAp8lVO9XNPMpCDDMokXGvIbv+HIVexTl58p7QfT/yhqEsLq7CjOinHFenNEJLzGabDIE7+MRMre7oONj3T6iyf9393CeRu9t1jqIULirbEConKEMnRXGiJMec2mb3umoNc04IJS9KcRgkWV5FrSqm5MT17Uz6GiyGSnXAKLDAEMV8Nj0gMHb5YmkIH7LnVyNfkWjeT/DdbzhIuip2yNTMRSf5KRIKDO7XyVeBTcsXMqwnJwLJa35cMD8s3MrWzsjEdpX21wlQjuxTlYpMbT3mBGbq8b6vvfDWip+nwQXq3J+jw4i7sW1E0uGAXgmDbQEF+Nlo9Hh472RAWIFECAMGKRnIQMIApboleQWREWQj/2s+AYqwW8S9pMVoiU8baQgGcW6P4LjMhZKMb5wiCfE4DH2NWQJOUMr7Di9f/sLEOS1JzzScQhsoYL14ZMjx0taJ6K
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199021)(38100700002)(38350700002)(66476007)(66556008)(4326008)(66946007)(2616005)(186003)(86362001)(6486002)(52116002)(6666004)(36756003)(6512007)(26005)(6506007)(478600001)(110136005)(1076003)(8936002)(8676002)(4744005)(5660300002)(316002)(2906002)(41300700001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ANmr+GGKfJuZtPGhZApUYLYB1YK5rLVAHumcRYcDftu39H81oFyuDvfl477g?=
 =?us-ascii?Q?wJyIpVeft9v6L21gjyifDVY7jZ1SwjgVE0RC1WiXAzwvinso9wBASSgmAR18?=
 =?us-ascii?Q?/5hxAB15nmk/tXGqvcKSrMLhqckPEmpem7J3XwUqVFKrrw2ovj2JAW9xvOwY?=
 =?us-ascii?Q?e/oorYOuQXUnXIbxOQwPBndpTRhEcFSJjiXngN6ZhGtsJpmM+jHjZGQ2ZR/i?=
 =?us-ascii?Q?8yQT1XLj2kwbnf50+7PamXenzSuBZBX/T607xrVcsyVmN6FcmxPzz0MPSwuk?=
 =?us-ascii?Q?SdoEl+fa3/VlAdVqKWaR9Jvjb4Iiijbct5i3Q6ZAsPSRJOFSHHgGQaW0demZ?=
 =?us-ascii?Q?Zd9nwYP12oy7f61bb2C7tb3vX1btNIUsBZy47MzCeZnm0ZRyfrCcTYga5q2u?=
 =?us-ascii?Q?Vh4h4+HekhBMQD2Bv070v3M3+4qKaCBuaRiRdS0cAQvkoahoswgyRypD5VEg?=
 =?us-ascii?Q?ierQzg084KK+nka18hQS8YY59SB/oh5syG/I0NrlQmn01ByPj5R6c1G1rU3W?=
 =?us-ascii?Q?t845QC2ND+TneI/PnqFACcULO4FtuGARp3EfEotXAPjHjr7mQIl+oLIjnOhc?=
 =?us-ascii?Q?E6cYEyN5bbQRkpxkEDC3ffM4vnaQ9ofZUW80YPwgE9rG39Vcc0AAlrl/YudU?=
 =?us-ascii?Q?fuZeYoqv4JmGMT4M/CylNCvYU5yznJKmbJpn3aRNyC4ZUfyE8PN+FOl6ahPK?=
 =?us-ascii?Q?FrKGPqhXhBum8fIx+MUktGThsXp8FVavFHxCTxuGu4U7ZGM/KuDdEhHgSw3Q?=
 =?us-ascii?Q?v51tI1bNkSsV97Yd67nCaUBKf8XaUfWTqxoV1TSwc4wstmEzDPNJCiSb2KEp?=
 =?us-ascii?Q?V7wGF7YGsQleTPP/rL173oHLqkkrbZ2eg1ScsUPQCy3fwMR3Lrleaw/aEf6q?=
 =?us-ascii?Q?PYvSHGDIvAsWkVdujPymQAprai9hNAIuQKnE224NZr9I5PKLtGRrRKFmTp0f?=
 =?us-ascii?Q?jBFs6STRd9afS0nkQ73j+9xnbqyidy357SX1RHE5pCBJI8lnR+bf5O2w5j5n?=
 =?us-ascii?Q?oYaKtAGxkFcFpdhQ84w91RnGrTU3HIQTlkvSI5cP+4fi9HPPHOkQc+dUf0dM?=
 =?us-ascii?Q?tetvWkWX2jQx+NhzwEiCbbNtdPcqEnpj5YmDfzXx5vOXx8AlIegprtryYb+m?=
 =?us-ascii?Q?OaQg9kCljVb9tKoPLgbmfq8mXdl0b3rDFSIuxEDh38K+GY1RE2PhmFrqnlLX?=
 =?us-ascii?Q?n9oI+aRaitE+assiUP9QiSt4dQDzFYNvoK2wfuFVWNP1oGhga5CyYa6Bi9tZ?=
 =?us-ascii?Q?QKHcRy5IstfK23kShzJnDReawGnsZp+fQZGD5AWi9FgNAMhoPavEVUqedJyJ?=
 =?us-ascii?Q?9VqY1nLOcZwek+lAJv6nDuhfcI6cjKT7ZaDUr3fXmjslxahXftICLkpyHun3?=
 =?us-ascii?Q?cnlPg17EGvAFXxCnt7qtk2E4pjJZYHCCzBrEAoW5HDtCc3LxUgfB34np9Orl?=
 =?us-ascii?Q?ZJqPxialiWz6rVZ7uLjIZVIWJc+Qj3X7NImyV8793gSrkbUU9QcwPr4UjXOQ?=
 =?us-ascii?Q?ZC+GBhzOpriRpurs5nyqOjmX7CTA6NuaUSDEnP2dEQFhVT9cU3z+oJ84b7sY?=
 =?us-ascii?Q?bKkfH7boAPH+/IGPPVk0RuSEzZzNqU0h0eFdVmfB?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bba23f5-80a7-4aa1-3f88-08db7d5f0ddd
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 13:52:21.2581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfnDQLqK2Afkvlpkc1Py80Qa1cMeo8i9Ha23QHdoZaByx9JJ4oDDg4RzObigG+Des0t6rBGEYc5U4DLSOWwbTw==
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

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/i2c/busses/i2c-pnx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index 82400057f810..ecbbb60407c3 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -683,8 +683,7 @@ static int i2c_pnx_probe(struct platform_device *pdev)
 		 "%s", pdev->name);
 
 	/* Register I/O resource */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	alg_data->ioaddr = devm_ioremap_resource(&pdev->dev, res);
+	alg_data->ioaddr = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(alg_data->ioaddr))
 		return PTR_ERR(alg_data->ioaddr);
 
-- 
2.39.0

