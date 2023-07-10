Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51A3974CD25
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jul 2023 08:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbjGJGgJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jul 2023 02:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbjGJGfs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jul 2023 02:35:48 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2121.outbound.protection.outlook.com [40.107.117.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84DECE7E;
        Sun,  9 Jul 2023 23:35:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XN0hxWgTuMg1ofTlw7dvVUD8Ku3s0dTW2Qd1UfATZNy+fyrvnNv7XH8nPYMsw5ZDypumC3bUzg0Z4gUKjVPFzaoltH8wrauu4Qr1Z4LiCIt4YF+Vm5Tmj9ROVoCklPsJ2mld0NRtTHtFx7pEd4n8ci0q6jCOqM45TKfPRMLtTzd5GwsegD0qPwZ3gUKa+QonXDf5ikd2NoDRmG5Ovid2odphqc48q/gQRZ1bSfAtayMWoHvgk3lCWgl+8ILONDvU3cWlzIPPTvGjg3cp8OnlBXiihwMQua1q939mBURC0+rwjRW94Y3vUTJAoKK7yatLo4D+Q0cjglSX91n/+AwoHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9V3E/S7EZrZHFawnqtiHHPJ3MITcasZo4yoCNxbo2Y=;
 b=R+XSIIwISF8rxQBDDudoYYOJokscpTiRw2QCKW/bD8Fki6qrBEYs77dOQd+6r9TkL5y3uzEeSOHSOnNzzuIVBqloKXRBtwsc3sFs5Uj6WPXuf6BVoul6ku4/LOkg6rThlarE55zFzSgnrf9iu9xE4wccilx04fWJ4W3NQxnbOaN2tZutEqD5q4Dju9D5pY3KUZ8A0lMBa/lKQBQZpF0gYkzaGeBkWkkHRbhISu1iVJRXOOl9zgELEmdrxYe9m3AgVNqwCQyAdP+lItLmkreUalvmcbVw3It/ND8BBQ712chzB4Gwk9vg8YjZ/d7lKyNAqB+JSGZKg/MPpr2tcMVJSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9V3E/S7EZrZHFawnqtiHHPJ3MITcasZo4yoCNxbo2Y=;
 b=SGZNAGDBtT9EfOlfGtmI/BadRhjtUPy4okRRGo7h1IaZXj2KG4uGLvNHRJyNOFekBAfXxaDoZE5UNArtBhBGU7SXOlhLKz/7d6JKfwuJDzku6catb2eggVMFGIerI8F2EO6gHceWuMQNthKQn+9DZojRGvAIShh0kh/tLB+wEcKrKiZLKd7bDPj9yAudfDzrtj2r78U2w5W5rCLIEjzxT28nR2j7fXDBiuBJYoaZQu5Y/wVNxmeCdl9SpFWR9qHurDa6rgElOiUFMeYWbJSP6yF7SjX4QruB9VoI6yDqH9WUsfUFSRqGey1smTW6ow5Wyc4RbW9IpG/msnYyLSKlrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6586.apcprd06.prod.outlook.com (2603:1096:101:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 06:34:25 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 06:34:25 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Vladimir Zapolskiy <vz@mleia.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Yangtao Li <frank.li@vivo.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/11] i2c: pnx: Use devm_platform_get_and_ioremap_resource()
Date:   Mon, 10 Jul 2023 14:33:50 +0800
Message-Id: <20230710063351.17490-11-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 93e526d7-fde4-4ced-aaee-08db810fb417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c4axZ3vPtkqiOf0Qj4SP5S6hviK8yv50Q4ZVxWpn7JL/KJ2b9RKeeja56OXMq0DPHr+kKMVo51UtyOBcOdWNfiOtwreI/M6N6tSpXWQDV+VvY9eVkTz0hkebPwmp47UVvfT7C0jJ6KyJV0AKdKdIFycC/ZahtmwihlX5mFXW+UF+WSh7dSGBEcj74XuB8fzUGEoI7NlJOQSxpjQckUOzbfmLvg1DBHXBa+c8nKdby/8FhfV94M0tD8reeNA06iqxfjSGe6KI8bNZrTsAIu6dkFRwNefynDdaLa1STFHMvCsq/+6UMiASeJGI9nQcTdbzc3+zHGixCt4eWgMC74F8k4j9wrA8gc0LaePwBdjMdd/9ZyZwNaxpLQrqP2mhNLwyR3GpcHzbPr/0I7XxlreNf4Mx6xCj5qEihXRMwdmVcP0Bry5XkjM5U6ELxDq2yxV0db/363rObWd/kjZ2at3Kd48qvQMHiY/eXrfLOwkLvsLVPwj0G5+oezKOYFCpzq5HfocEZ5p2EE3h405tnNpGI83Me6QXdTdG2+efTWSQ6FA9HS/KWCSZfmw/gJDLIcw3uSTVRrI5GRSkfWZszSsgRWDvaO2djmooSlTXVxS3G9KocPj1dbzvkTD6uvI+uU3ZKrDCazI6JBBLj8IxFetx8z70lBZFiRjxlTo7zQqkteI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(52116002)(6486002)(478600001)(6666004)(110136005)(83380400001)(36756003)(86362001)(2616005)(4744005)(2906002)(66946007)(186003)(6506007)(1076003)(26005)(6512007)(38350700002)(38100700002)(8676002)(4326008)(316002)(66556008)(66476007)(41300700001)(5660300002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OmqsTi7XGp86dnhznAIJ2OTeog0vS6AtoC24O16HENTdsv4Z/SurZc+i7zTZ?=
 =?us-ascii?Q?6cCYr4fB1NZtqH3zBEeUTWueEqB2KJzTVQJXgz1da7QM5pmgoGQUGdQxaQiU?=
 =?us-ascii?Q?q5Sj8KHUpYS8Zft8V420O4hzOXRnAkqDCT3MyPWka6WJ/VSdEZ36GOs2xzZI?=
 =?us-ascii?Q?xeSKO1AVGYuW6yc+kcQw6tZdBUGw7ANqbBplpv1y7l9dwVY2OAocVTsOeIG7?=
 =?us-ascii?Q?MCFebPzfH+VXOINVm+tK578EKO8wOSpGsgugvl8GSDRtoN0pPdsN0Q5xkwr/?=
 =?us-ascii?Q?dHi4ekEDdFW74P7vZPIg1Ccp9tFxGzC8UzgcXzXjAFQ1MB0i0LmO8rR7xQ2i?=
 =?us-ascii?Q?HkfD7I2PXvJXaA0YCuGV5Gf3gg/j2bzGmdvFzjRoOrZNBJk93KXOcdic4FmQ?=
 =?us-ascii?Q?QLlC9XljPWaRf+TELO4fn+FK5x2MLsqHGep1yvlmRMh5FOFJRLmbg3rQE6PS?=
 =?us-ascii?Q?/BO9zX3IGqK/jkLWHX0A/sZUyYbdOvMsNTjzxzynT6U+rx4XxXEnbZedLbyZ?=
 =?us-ascii?Q?B+kXCX+URuVDPMMpttgsj4W3WtvU7dQuvFXjW8fzLNvUREddV0JcGWAhfL0V?=
 =?us-ascii?Q?kHrjykHrodBfdyKuoYG2WN/fIGgj4CQgrfazq6VRiSKgpcvcSiEjUYQW6JlI?=
 =?us-ascii?Q?1z7rYrrU6PR7rH92465t7I0cnBzux4HpNFOUQrLk2KK+RqcqE8ZF9+JWj2kD?=
 =?us-ascii?Q?SYYCgnH2CWBcyX4df42REX6uXf74TJS9KpvlM8kAjJNkd821boeODiRI9hGJ?=
 =?us-ascii?Q?mKpaIxpzSHoxajGoeg9lf7Ecec3EnNsg9EDZ6VdNvTz18/enU1M3rbWAS+8o?=
 =?us-ascii?Q?HYoI7DJUSwncxO6TRNI5BGMMZd2Ch+fdiSzgntr3mUPgRBCeYOG0juGCoHS8?=
 =?us-ascii?Q?uQKhyfUPfNELqiKgXXMINTfhhEmN6D0aaLI7lN5qtXTHw74RV18LSOqIgVgw?=
 =?us-ascii?Q?X5PJB+uUsoLUh8pKvuU97m6UbVMDz9WksdEs3CAgzAYL6zQ85TzMSJpMi3DJ?=
 =?us-ascii?Q?vlrkEKKdG5hfbOYEyiDgx4lJUo+XZCROEmWWpKPNFYvEsvX+OKBc7FhClXLT?=
 =?us-ascii?Q?ar0KIHZaI0OyE3lxJ4FtM6+5GKIYnTa81NH5i6y3UfVHzsle29GSNJKz8BOR?=
 =?us-ascii?Q?icDKbDyzh8++Ppl7MPrQhyPNghhnFo5ZMUFnURM5aay+vIw8NOFHPJ2asng1?=
 =?us-ascii?Q?orlG75DV5XjY/l5KPzvHVsR734KFiRZ0hd2H1FCGbkCpEcXQZkP4ER1S/x3V?=
 =?us-ascii?Q?Csx4rDflgrJGNTUG2ECZoFRB+hHcjSpHdlSFsAPHicQFg0FFWFnX4xv/l+yi?=
 =?us-ascii?Q?AEEpT0DAHJGD+RZYWMfmbpUWI8NnDT3Rb0Zm+40CQcwQuhtc9wJFSQdzqv8y?=
 =?us-ascii?Q?GXUWxXSAyoF+wOyBZbC4TDGjQ3mz3KBcE7rbj3VjG6UcINSo+Tk1wUJOcTBT?=
 =?us-ascii?Q?1w+BWmVaYpL/eVXxNP37v9qyY/83G2pe2GNzo2dAAKgsJrxXcn6lW9mjgYm+?=
 =?us-ascii?Q?Lgo9KKlgA05DPNOhNTMxU2d1SARLtWSYTCvf3P4w55tDqaDdSN1RRUS04ZRl?=
 =?us-ascii?Q?CKCtx/+hSYCLw91TSkZZywLOz7VTck8I7rrANgRg?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e526d7-fde4-4ced-aaee-08db810fb417
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 06:34:25.1048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MoRNNU+a9JMERgpBX0vn9wrJ8TgrkpMPW7u+Gu/ZP/LHxONrz49/B/vBdwjw6SmTL2Pe1aCdYMIbS+wd3Yq6aQ==
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

