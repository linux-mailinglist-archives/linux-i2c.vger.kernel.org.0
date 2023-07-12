Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6A597505E7
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jul 2023 13:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbjGLLWu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jul 2023 07:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231545AbjGLLWt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jul 2023 07:22:49 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2093.outbound.protection.outlook.com [40.107.215.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60AE3173A;
        Wed, 12 Jul 2023 04:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPgiz54X247ZPCRu38F7IjoSOowNJsOYy5SUygTU37MBLjnQj6kwGTyL87hvIn5XEO0WzfUgqU84NXnbftfH3oaLHlECv4UGvM1LR0TYssyGy9i5WIVMCiVTItfhA+iNufkctifB/oDkf4M+PzNcHT0/cKX84tWqtfRPkxhwLfe5iAuKBsGJSYnxiGEHFOg/wc0IqO6Tqp/U9udayHFTdaNnlvCVbZyT9n6NdxDkvku1ooWdnOvyAn55WH4hJY1F5OqB8X//C3kTaUHgpfjpHURU5KOVazERAuHNd3NSWcBcm48WteAc75rcgNQRX6gBrJzp6WkE1OA8wov4Y/MHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKTfvMGXtquCSvUeIHdv5MKtTdYiZSHCeM7FXbtp2w4=;
 b=Fs8H71esFTna+NTUGz0hOmn7Kk2JV//48TcOUyZMtx09UhiwG2e4bYbEVILnkNrs+ec/8SERJlkl7webHG0tK3wCOcOXb/vcaf076zabXDbmPHaTMHeZdJxn9/LNrR7CtSwmpbxQTuLfDOy8EhS/OoRDkBr1T4xDRfhvzK8IWRRLoObIX6KMFRuL2yC34p1oFJtqA6REo2eYP+1ixqiiI7Y8ZtbCEDemGUuOrKDvm5SKidlI5JiMHb/qnLljzUubk6ulT0SFfX59EDgqyFtJdmVWMDX+c6k+skcbNUaerB6CuvJHi58vwN5oJH/NOqA8QEVAavx3frSuof+zfUeTMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKTfvMGXtquCSvUeIHdv5MKtTdYiZSHCeM7FXbtp2w4=;
 b=egQEujFA6HzHAUg3g+L2mbOaZFkHl+xo/3MUDlX+LEIPBdSN5PW77wHE+Oc/UiR2i1XbHp/P5yo7fpqTqQy0yCVvvM3Eu8/7RzNRkgMsrIXdnX/TqazdJAidafrYFYwhyQZYRlohC+t5UxSFuGn36ZIuZ+XnkI3Zfk+IMqOyXzRfar8gFJz+Gjv1j5S3BDQseYpG4mV2FbKN8Xh+l+DKB1C5cT0C2DLIQkJTj3h0nlkVvX8s4/cQpQiPaPj6XJEy/f7UVeR26InwCiLM4qMGz3RUORZG7tbQ7hajNUlwwkqDzrAXU7GbbpGc5CQfd30uAOAfg1kO97KyOm24Qbh0Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com (2603:1096:4:1dc::9) by
 TYSPR06MB6544.apcprd06.prod.outlook.com (2603:1096:400:477::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 11:22:38 +0000
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a]) by SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 11:22:38 +0000
From:   Minjie Du <duminjie@vivo.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Cc:     opensource.kernel@vivo.com, Minjie Du <duminjie@vivo.com>
Subject: [PATCH v2] i2c: busses: fix parameter check in i2c_gpio_fault_injector_init()
Date:   Wed, 12 Jul 2023 19:22:22 +0800
Message-Id: <20230712112223.12286-1-duminjie@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 SG2PR06MB5288.apcprd06.prod.outlook.com (2603:1096:4:1dc::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR06MB5288:EE_|TYSPR06MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 624c4a04-2139-4f0f-002c-08db82ca4c52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BV5bE3OBszopofexmHM/uxIIOQmNL5Q4U+VqCx+6K7m0XLcMFzhCp38iPf6JNK4002W3tAZD8icigyxzlcF1L/7DTS0PyrcjmRc/UzHioB3PKw15bgprZnwEnQjksQRQ/SBOYYJA1moA3WG+daH4D1WJ5gdbo1hNVIO1q9AwQxHxfEUQGaSK9N4PXcLrlFKFNJcy8unXhHqQ8KEWTndi+Ed8O0k44a5h15JAZAXxZwljSYcGacp7tlXEH3wj8QrkmMYIiTKWSDVNZNr3uqLD7pQmSrRqcNUt//wfQ4WXAfRC752vMNIwizdxHZ14GWLLlcfMirjfYvPL/4SMR02h5dDLF5q3i9mHJEz5kYmmNtwO1HXowojZRzbYFJW8IRb/m0g6wt/ALVIXIYmjfCVhIP1L9avbbOyrtpU266N6kf5al0VJ5ncG9YfCoMC43IqG+NXHvrTAj/cc6fikMUOyPUy7/TviGXV8124vMMKayVFk3HBvg/H9tu+evt4W7ZVYowVUiS9I/ruz5U0Qyl165KuumRfnf1fhzpxUPpvdAX6G5r26pS5WOMoS5etDcwjr6rq8B/yZoE5+KMT6ZjEkVIikxJSsIZYAdIRD4JahoHdVNUXAXDn+tNOg0xXYV7qJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB5288.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199021)(38100700002)(2616005)(38350700002)(4744005)(41300700001)(316002)(2906002)(8676002)(8936002)(5660300002)(66476007)(4326008)(66556008)(66946007)(6666004)(6486002)(52116002)(6512007)(83380400001)(478600001)(36756003)(110136005)(1076003)(6506007)(107886003)(186003)(26005)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qjHPXcfzWNpc7fc1EA5zo4fvqE0T3+VgQ1OdUuHezoJS5ug5ssKJoonsmBvg?=
 =?us-ascii?Q?tY6CEohburZx4VvGunlHwjj18XQuVgohmuaR/tU7C4w798ElYbDi6YmZuYG9?=
 =?us-ascii?Q?CiXVzout271nbl3BKsuD9YxgufJ2qocEVcZZ3orhCdDdpZUCdXmDymEdptFo?=
 =?us-ascii?Q?MzZ8QDkexxN1kklI2qX4pwSMF/UxH4ZJQBnMd0HnPabD46QUSQ4hf5/btb0I?=
 =?us-ascii?Q?3209j1onWkplpUoQR48Qd80qQZqWAse2KQ7sJ1RSdSz3ZyEqDDIA0DU0UgTO?=
 =?us-ascii?Q?3NlJekeckT7mZjj71olOaXV27tukyTUtux9JXIz+ZDYwQVQxmEtG/yBLhYLS?=
 =?us-ascii?Q?kSH0sQH/OXHiYaulX9n8R4d3udWvzvWLe+w2VTxDPn1yZ4YTPv9+LnMcI/+Y?=
 =?us-ascii?Q?SyqxxRswlbgLz8VySQ8mGYyuU3SVzpe03hu1pW2V6mCa2vkMKLmeJ3Qnf69R?=
 =?us-ascii?Q?03rb+oLSwNcs3xkGMkaZYrGSXKwBRJ2DRc2TLSr4jngPIG/RNYG6ykJRmQhG?=
 =?us-ascii?Q?K/6zvl7NC+HEdwrk538Pe19C+hwCNB8Rw0J2Rs0tPIvdwOx0PTE4lxe24G7f?=
 =?us-ascii?Q?MfwIJgyS3uDRpGPuZKWwQ6m/980VQpsw0hHhE2ZgpCG9VZQP1W478PZpLWBR?=
 =?us-ascii?Q?KHSCAM9e9oSinA3TjQ9CIPlbHkljpsVKNXl/oQAO504USAzLgPvkqJMvnHjk?=
 =?us-ascii?Q?0M8AeN/Z8BzVMx8ZaJBmzhc9aeNECQHv4WzhLr0kq3/t1FDn8Aojp9dVWy9n?=
 =?us-ascii?Q?k6pYeDBe/hvC6gYhOaoHXHlcGCBfUj4deMVAmYhn5BHw55cHQZDMC6m9OrOS?=
 =?us-ascii?Q?FPTpkYrlVuotsDNEO3GQeSiXavmJdQNghhqROuO2fQDrxSCDxr7C9EWUYSn6?=
 =?us-ascii?Q?4XObeDxxlpVUCk0MYKo/4bC2B/3k8Z7LOqlbselaWRhvijw2BVeNHGsQglG7?=
 =?us-ascii?Q?QI7l82a1wsfHErBRLqwoa0gvv1M+7lJCLUrAMWDIxAtaWzah54FDaSy0AbnP?=
 =?us-ascii?Q?SGBFN5RDWQ6+SLvIsblzrIJro9bD+0ojFk6bbpIbCOiLg0vo0cVckLUQtY0m?=
 =?us-ascii?Q?iwvCeUwktjYsNDlxd6I8ikuMPlnjq80Z7KBXgF2Ggs2TaSqnmBmfbunN0czX?=
 =?us-ascii?Q?XEKhNsXcdti0Daop5YQGXp9ZxILBT0x3oSCG1beEqPKhNeGi7y2iwU4e5MY8?=
 =?us-ascii?Q?TBbLW5WrZxOe/LT2FBMtmeNz9aTLlVF9T/8/NHqF0bbaU7xDjVAksuzkLxVE?=
 =?us-ascii?Q?yJWBMQKBLo+oKGSVulCl2Q1JjEiX5OQdb8H4Rqk97EIN318234cAOhJ83h9O?=
 =?us-ascii?Q?MHQqrHDVqZ1yaWFI0XL5n/AczctFNUk+DHe1SWdIG1Ul2tfTEXn+OzQndJNW?=
 =?us-ascii?Q?oyWQd3n6v9vlz3Iscc1C9dkekVCQnh2lzxpkABcXSTOmy6Hdd6y7KrbnamPT?=
 =?us-ascii?Q?eiUzqA+vNAJIFv+EpCYRLwTtg4PE6igFKH0bGsLPtMO04lCl/M2RpJ4KVPLe?=
 =?us-ascii?Q?LJZlg/O7ZN12u6bqGt2hEjczVhlBrtcCv1pVatTjwj3jJdXxcbN7yGZ06zcG?=
 =?us-ascii?Q?JCVJsaxKxw2XKdUT8YwNP5p6YK5qwvAUTOUCCfyz?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 624c4a04-2139-4f0f-002c-08db82ca4c52
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB5288.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 11:22:37.9806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dyOtumAixdK3E/6Aswogc2szJVyJ4xYFlQFF8KM2EKbMpW+Snzw//HC9b+eii/rhjrZy9++vtU4PgG+z2z8WRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6544
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Make IS_ERR() judge the debugfs_create_dir() function return.

Signed-off-by: Minjie Du <duminjie@vivo.com>

v1-v2:
Fix judge typo.
---
 drivers/i2c/busses/i2c-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index e5a5b9e8b..545927b96 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -265,7 +265,7 @@ static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
 	 */
 	if (!i2c_gpio_debug_dir) {
 		i2c_gpio_debug_dir = debugfs_create_dir("i2c-fault-injector", NULL);
-		if (!i2c_gpio_debug_dir)
+		if (IS_ERR(i2c_gpio_debug_dir))
 			return;
 	}
 
-- 
2.39.0

