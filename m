Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4A84CA384
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Mar 2022 12:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239972AbiCBLXh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Mar 2022 06:23:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241337AbiCBLXf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Mar 2022 06:23:35 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80123.outbound.protection.outlook.com [40.107.8.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D8A17A92;
        Wed,  2 Mar 2022 03:22:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evnSWsiBGU/FV68CRqMW/jrNYeQaL+jHBWmM2dzHxO2wFnOustuj1NiA5Lry9lthkdULd0lNqkppuQVwtR50PYjCQyosK95l5/1EKw/XgHyWNzvwOJFTmJq5usxTtUDEsi5vZ+lxzUdZq0jyf+Wif46z/YFCG+YeS4MclgGK4QFYw6Jzg2HTvQwT1LKXeFYxvo0T+GS3NjKUCOBTBNA5K5KXv0wRn2Bmyp61vbuEiM7YeL9kJ7Ak6D1kEYXL0jfTJF5nHBZ6QOcjFO+ivMv0irkjrulJj9fV9TlGu1wjz4mF6RiC3ecGYXwuIvafvUY6qrQnwMHKdWZHxIzwoHVjzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWe9msmbx7rQdPXorMBit/p7pX07DWZkAD8qYNYHH5U=;
 b=fFz3fz5+exhhSOu0LALEWPxdjYmHbT69lRKStx2qoteZM/yf8QwuFF6sng+xr2ZrrPXsqjqMN9NKiL7WXQhWflcTis5juxDKhjqLXOJJmWUkNRSJYpuVuTvnAgQi3o4qyFB1HnHNZtmhnd4qjww5M/91xaiXRqbskO4bsBNHpkArqaZTFu2p2C+L0tI8LYizQc9i2kFzu1VLIkG0yASNASCRH/NRWfAChSAOHxqQykOVhmsmFNeR0ZWlu2l9NygMWlRDG3La9JdYLBwy8dvux7hkj1jhqBija9SLDM2TbGizEAEMZgc2TXjBGT+v7tEONQa5Qrl5Bcu+jYAsvUA23Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWe9msmbx7rQdPXorMBit/p7pX07DWZkAD8qYNYHH5U=;
 b=Ozq4pmQAwggXLFFkCfZFfT/fojyvz4SGlXIcHFJfkxuKK3wpfzIq9HZHYHQViJE+4oRFIGpmkDwXuuvCGH45LzxsnAvyFhKjOMIFQxGsKQirx/bh1nKCN9Mj8zsWaMe9lXX3piSh6p68vQHd8KXBC90mXDzq+1G400y0ZU6ZKPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by VI1PR02MB5904.eurprd02.prod.outlook.com (2603:10a6:803:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Wed, 2 Mar
 2022 11:22:44 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7d29:dd84:d2bf:a1a0]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7d29:dd84:d2bf:a1a0%4]) with mapi id 15.20.5017.027; Wed, 2 Mar 2022
 11:22:37 +0000
Message-ID: <eca2bf56-7abd-55c0-a423-dce47c38fd66@axentia.se>
Date:   Wed, 2 Mar 2022 12:22:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From:   Peter Rosin <peda@axentia.se>
Subject: [PATCH] i2c: mux: demux-pinctrl: do not deactivate a master that is
 not active
Organization: Axentia Technologies AB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0077.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::33) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51dd6a13-b639-41cd-9af4-08d9fc3ef4bc
X-MS-TrafficTypeDiagnostic: VI1PR02MB5904:EE_
X-Microsoft-Antispam-PRVS: <VI1PR02MB59041D5F82589E1C91E4A586BC039@VI1PR02MB5904.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qMTzdltIb+ypZ0caJ307my1HeL6bHnHO8axO1R5lqajSvBjFny/u/p7LuOYgOobogJSySaXn9BSSoOixGcgFAGFkAOM8v6X3U1+IQMNcLOAwNvwMpb7apDXMPuybil+bAgC0SqHdW2wtyifss9PYZOZ/UAbe46BrUpdrFYJ/u01VFKMFx/fsMMSKfL08Z52DV+Q2+bCk5BvR8PkcXzkhAwi+hLRn1iSjKuN6Ubkrha799uGultVGdnFlRCXt9PWYqJvZTGmam8r3TQXgiQtzDNoSRlth4sghgw58JOucW40W1L8xxYhQBq1hooV9mwDWwwti65ISoSIEavP/r0ozvQMurgiBEj6jETtuAub++wu0te3RiFwaoV3ox/7wN7gEWnmKojvg/UjLWU85fvlAgtYmfmjrSWTN7x11e2TevBFNe5BgMqQ5x7YyMUd5+me4AZduzQDvZOSrx9jIPiWJ+mptttEqvpZKvlpv//EuEZYm8Aysz3aChR12bE0/i+c9PliXyL1gIaiqUu8bB4nFhmIbfiOXkjxYvXOtfgKy0OKNISNNc2lJYINpgB2YyFHQEdtgUrikhn+yej5Xnkm03pwLaJhClsyw8TarP3gFelyhxTNBNHB/XnDMChXRtmo4nEEjspa9wzVoxShvhl5vPFo9la4ipMzy8poz+Qli5/t6SW2yiSoagP4SRyuH7kJF5wO9I+MMQy7YfLxzG1PMIRMNGZl/9STKCFgYe4GjGrk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(39840400004)(346002)(366004)(396003)(136003)(376002)(316002)(6916009)(54906003)(31686004)(2616005)(66556008)(66946007)(66476007)(186003)(2906002)(83380400001)(26005)(4326008)(8676002)(86362001)(6486002)(508600001)(8936002)(31696002)(6512007)(6506007)(36916002)(36756003)(5660300002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEJGMUhEYUV2Nkg0L0EveGo5VE82c1NLY2VXYUZIVzlmUUxTL2UzcW9COXND?=
 =?utf-8?B?b2p4Uk9mbWpKelNPUFFjeVZ2eDc2RitOR2h5eG9YZ2tzSm93SzFya0xrTDB5?=
 =?utf-8?B?UGpMalh5emRiRVBwL0N6aUcyRFF5bHN5WW5helJyZnVNRVpXUVJlMzJGYmpD?=
 =?utf-8?B?ck9QeTI2ZFlxSzV4S3A3NnVYYzdHRnpEVVpHTkRFWGp6L01uTUg1bExIOUla?=
 =?utf-8?B?clUyOFdDK052ak1DdVdqenJ6d3N6U3lvVnJjeXd5SXN2YXFkZGhFc1JsYzNk?=
 =?utf-8?B?ZkpYU0RHUXRldTh3RmttWUdEY3Z6cUNBNHROa1hucEdqb3dKcUE2TjhaQXA3?=
 =?utf-8?B?UkVFY2ZpajZJZ3BVWXpLQWhNU0VpSVdoaEY0N2tKblZudkpIQkxndkRLLzRV?=
 =?utf-8?B?UTJTdkN2VHlVK2ZvSzg0bTJqVXVXcE1SeHhNL2hZdndKczc5bVJGMEhLbDE4?=
 =?utf-8?B?SWJ4S3haLzI1Tk9zYnlMZ3g5UEthNXJWNHY0NmFHL05VM0RVOElyU0wvdXpE?=
 =?utf-8?B?YnMxbGRLMXJsdzJEVVBKMjN4cVZIamg3Vy81TTRrdTlUZk5xRjRGL1F6bUlo?=
 =?utf-8?B?TU1JY1ZIcDhTNzhyMU91UFh6U0g1NXJHeVZHNzVoQ0tFc2d4L3lTU2o3N083?=
 =?utf-8?B?OXZxWlJPRnlCZTIwRndUamN3dzkva2ppZ0hlZkUzN0h3NWVPUkkrMWJUVUpN?=
 =?utf-8?B?cXFsazYrL3N6ZCt2V1FoNDNBcWlxRklXTnFhVDlVOWYvenRPK1RIWUY4Y2tr?=
 =?utf-8?B?Y3lZcVN3N1FhVlI0Yi9uRVJxZVZ6WjJPaVhRbWdNT0IwRFFidExzRFhFUVhZ?=
 =?utf-8?B?SWU5SlJIVEJhSEg0dDMxcFlFYWNMaHFSY0RnSjVEK29UK0gxWDlHVjZZYVJm?=
 =?utf-8?B?WGZSM2JaMUxtWmZWUzYvRUV1MmowalY4OU91MGJXOHpMNGZnd3RBQ0JOVlBO?=
 =?utf-8?B?SjdDeGoxUExPeFA5eS9VNzdpSnc3d1N0a3IxcDV1MWZCeDg0d1ZObHZKS0xa?=
 =?utf-8?B?SklkeWJZSnBmcGR2bXhjT0M0ZGx6ZExDOS9qcXd6UzJTYXpOL0p4L24zVjY1?=
 =?utf-8?B?dEVCc09HdmdDY010Sm1lY0pRQ1Znc2pxN1pHZzBzc0cxeG5rOXh2NDZCRHdB?=
 =?utf-8?B?LzVSb21raVV5TVNsSXkva3QvUk9sTlBoV3pZRVA4by9DUFNzYnY2bGdiYnRT?=
 =?utf-8?B?UStwVXlRZzdrNHlQa05wcDgzQnVZWC85Y0M2TXlxYXh5Q1oycU9OWUVUbnB5?=
 =?utf-8?B?MEMvOGN3MmtGdFQ2R1kwQUFzWEppa0NGM3ZVMjk5dVhQbnJiYjVITU5DUllL?=
 =?utf-8?B?cTNRQlY0UnlQcGVRR0hZdTBFOW4xaEFQbzh6TUE0d3RlYnMyMGl3SElrdFJp?=
 =?utf-8?B?MzYyOGF3SXJpZVNlbHdZRHIzdlNlNnFnRGNpQk1obXB0OHIrU0FFSWdZWVVo?=
 =?utf-8?B?aDFyMlVpNU1vZCtBZUl3N1BKcEZoOTZEWEdoa1YxOXlMTVU3K3psandhVFBk?=
 =?utf-8?B?VUhNMkVJYjNKcjVWTUxsQVF3QkdPUitCbXRzNUNjSHlXY0wwaXVWUkxac0RC?=
 =?utf-8?B?V1BiZGpRaDkrck5SV0N2cU1aazV1aEc2ajdTbWFBVFI0SDZjVTV5WWFtNnlm?=
 =?utf-8?B?YmxaQzRYd0Z3QVRIeE5oUHRwam5xVndPVDZWOFp1eUVjK0owcXFkR29SdjVq?=
 =?utf-8?B?VGZoRVpLb1dMY2taUi9vdG53S01ETHYxSkdsOXpsNkFoVm4yZDEzeVM1YUhr?=
 =?utf-8?B?cGU0eDluWDdFcGJrYlJ2WERycnFHemRTaTlEZ3lNaC9SY0hzdEhVSnphNFV6?=
 =?utf-8?B?Ui9xRWlJczNudWdnNEpQK2xoQlVIL09rcVZvRGlTdnVYcStwZDM2a2xIYmVh?=
 =?utf-8?B?RjJodm03dkJDSjJ2WWtQMy9TRVkwQjNMa3BQZ1lPT1hiOTdtRkxCR1cybCts?=
 =?utf-8?B?bEY4QzVFRXErTkE2NjI0c1NxSk8zOUUwWGR1bXhCbUZNUlNjWXMyYTJFaFND?=
 =?utf-8?B?RlE2bzd1VnMxaUFRQXR0aXMvVTFlUEF4aFZxQUJ3V2JlV3UxQ1E4N09aYkFE?=
 =?utf-8?B?a1BUOEs2ZjNaNzdraktXZHFRNFJ0Z05XcjVXOU50VTdVNHJjdGpjYUNPb0cy?=
 =?utf-8?Q?7fxQ=3D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 51dd6a13-b639-41cd-9af4-08d9fc3ef4bc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 11:22:37.7558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jh4KSWH5Jk+5HJCbJkOeQnJSUbtz0t+GcIyj12qV2N++JHpBJna3CRcXHHIMXAea
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5904
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Attempting to rollback the activation of the current master when
the current master has not been activated is bad. priv->cur_chan
and priv->cur_adap are both still zeroed out and the rollback
may result in attempts to revert an of changeset that has not been
applied and do result in calls to both del and put the zeroed out
i2c_adapter. Maybe it crashes, or whatever, but it's bad in any
case.

Fixes: e9d1a0a41d44 ("i2c: mux: demux-pinctrl: Fix an error handling path in 'i2c_demux_pinctrl_probe()'")
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/i2c/muxes/i2c-demux-pinctrl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

Hi!

Either that, or I'm missing something. I found this issue when
reading code, and have made no tests to verify if my analysis
is correct.

Cheers,
Peter

diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
index 5365199a31f4..f7a7405d4350 100644
--- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
@@ -261,7 +261,7 @@ static int i2c_demux_pinctrl_probe(struct platform_device *pdev)
 
 	err = device_create_file(&pdev->dev, &dev_attr_available_masters);
 	if (err)
-		goto err_rollback;
+		goto err_rollback_activation;
 
 	err = device_create_file(&pdev->dev, &dev_attr_current_master);
 	if (err)
@@ -271,8 +271,9 @@ static int i2c_demux_pinctrl_probe(struct platform_device *pdev)
 
 err_rollback_available:
 	device_remove_file(&pdev->dev, &dev_attr_available_masters);
-err_rollback:
+err_rollback_activation:
 	i2c_demux_deactivate_master(priv);
+err_rollback:
 	for (j = 0; j < i; j++) {
 		of_node_put(priv->chan[j].parent_np);
 		of_changeset_destroy(&priv->chan[j].chgset);
-- 
2.20.1


