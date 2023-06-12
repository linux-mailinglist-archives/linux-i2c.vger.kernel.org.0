Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6EF72B9D2
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 10:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbjFLII6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jun 2023 04:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231932AbjFLIIk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 04:08:40 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1917D30DB
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jun 2023 01:07:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+HqwN4y1FLAEwETbCelQx/BZnVn3owhiBzRFAjktoEyJlQxi7SWw3uWo/fbh7Ztz11NI8stKSyOz1VXGcF8rmV2F3R5KMTEDqNRReRa9AKXBRynP/Tq3rFfZwA7An+QRqw5Oy6gjsXVpAoPN2lfIxf4ifCfQcP2+Fqtbzjw4zAZuHLKrnHmQ4OAfNrpuX2Al1k8dki5dNkTddMknb9jhamjnRk+ymbTYdS/K1g6g2Wz2bpckx5tMMbE2L3s4JhuILmAbcMquYKcWfksb2m31o0rAvK2la20uC3fPXLCRtx0lB78UGnT95kjPr8xENP/tFd9bhQdiRiCFtDlhvZrnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/P3bAl3QtaV4oM8cZ37vkXH3dkLqR3qvjnfBF1huzs=;
 b=go9hWPb8pWCw7MTCgUOTo4qIX2uQ/LXyZb9K8vO3dNtPjGNyWojfOKATviJiwNqUYKHaBvZ49nuoGyk0aWxT4S90mQhNd7sISvaBe0s9oGNYkzSKT7brC5cPgwcF/sCb5ka4xf8DQUO9kw90eI5UZQjzYNpKu3fhjHw3/pM9wnSR43OZ+VOoBSvcDR3HI3pMa8pg9JsXrYlpj4/+etxu9OkwDlDj7bjbV3EmsdLOj8GUAWsMRKppZ4HIahQKXaVtRQLMrySVuw54taXRkoUsaq4S1FbKV4H/ZEsGFzQcpnmhx/RUWYDa4vqPQCMw/QdS1biEEzBwl4faoxQNM5Iwzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/P3bAl3QtaV4oM8cZ37vkXH3dkLqR3qvjnfBF1huzs=;
 b=dLIRmExL6a8UrJo9R9XWRRtIl5071sQDuIKEg3yc3dT0qhawNB17BBXmG8xKqu4XJz8O0fe/EFMNkMDPpZtpluIe0063ppebd7tovY5cKocAvCVfHySIUt4QYRM9CZSYhFmcEoETNqqvLBZjZJKk7C469BRWjmUGwquffzPr1mc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by BN9PR12MB5083.namprd12.prod.outlook.com (2603:10b6:408:134::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 08:07:56 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::6ad5:3607:d622:669]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::6ad5:3607:d622:669%3]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 08:07:55 +0000
Message-ID: <f87bc5c4-d3d4-ea86-4f52-9883c0e053de@amd.com>
Date:   Mon, 12 Jun 2023 10:07:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 02/15] i2c: busses: xiic: Use devm_clk_get_enabled()
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-3-andi.shyti@kernel.org>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230611225702.891856-3-andi.shyti@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::21) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|BN9PR12MB5083:EE_
X-MS-Office365-Filtering-Correlation-Id: 727ef07c-26ef-44d4-ad1d-08db6b1c20cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gqpnVEye9FXkQBkw1oTAusLkuKLn5cpK+7ogCUfV99oH6SJ4AhBR7WaRXjFlaHgY0KP10EnHNMAU1wLUbNb9mdoVRp8gKIiigprlDi0dvEVdFEXNymNoO4mwcjnKiCFwO2a2E2xvWiQKLyUDxy5XeKkwQPGDoy5dWUwr0M3Ab0VRt2H56vRaHYDOF81fhCzuAV6ojIH+kT+oKyveJbnn5VJvFIWFr+NHxHZuMmdjutKsqUUqSECCl8+VlNEc4ObamKsG2Qx3gu6VHb+qSFwJxquJAwsnvxmOlCDxx9/IETKjgpJj1BQa6+mz/g57DQ5AinNNQ6G+y/4x5ZPxNL0fRyKrk7GKAlJGuqgy6GgsrgXLtcFfCEJ5B3bqb+0Zh7jQFSXkwKKqNEhijnx38SuS3HO822o5k+H+BZCkxly1jnam1x5L636P+b0AWk7MliilzqFfUgUJucxI2pH9HHbu1Ls4w9XNLMPHa7lI54pbzZj/Y4JznOxb3Omin4DkMQjGhTu4vNR+jjXP80YFrPlznckhg6lRKm43ByBLzKzMmoZBv2ihlgXnKQki+tqVQccQ7V8Yu5efhOGa1lL+sPiZdQJZMOCVuUBxBRMscpSTMlhu83ORhsh+Chv5ffbKoHRdzDUqomeIVaEGW2GzL1IaSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4758.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(451199021)(316002)(41300700001)(8936002)(8676002)(2906002)(5660300002)(31686004)(110136005)(44832011)(66476007)(66556008)(66946007)(6666004)(478600001)(6486002)(26005)(6512007)(6506007)(53546011)(36756003)(83380400001)(186003)(2616005)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0tOS2pEK3FNR0JGblhLcFdXTFdnRDA2OHdUSTRUY29lLzNncEkxcHpZZUti?=
 =?utf-8?B?VmtaQ0hidkpvN2I2QnkrckZPWEk5Qis4ZDhERFlTSnYwUkxWY05FbXdoLzcv?=
 =?utf-8?B?OWJKL0lkbGV2VGdZUWNLbEc1YWxsMnV4RDQxZmE2UkdUWEk5WFRZN1NBRWpy?=
 =?utf-8?B?eXphT2pPMjZwMkpKKzlaMC9jOGd2cTBxUGZrU3dtZ0NvLzlKZ3U2UmlwZ2hr?=
 =?utf-8?B?SnFNYUFrTzFCQUV0UXRPakhIdUdpcXlyUDBYV1NJcDlMZGlHKzBUZExUTHlw?=
 =?utf-8?B?UGpkRm5tTmRQd1hmQXovSEFON2l0eDBSRGI4VVZsYnM3Qi9HVlJhdXN2b0pa?=
 =?utf-8?B?bTlpc2c5b0FKN0tHWjNtTWE2cngxRERJbWFkRlFxellmcmRQTDMvK2tTZGxW?=
 =?utf-8?B?MytuTHU3Y0MxSXNpN3k2SVd0blRUYkwzZDBoNC9pbFVqRW9lUEJoTG9neFJj?=
 =?utf-8?B?eVRoRCtySFBOOVFEbTYvKzcxMVB0SjlrcFM3VEExZ29GKy8wOFVLSng0V0hm?=
 =?utf-8?B?S3JibDFhQ000bFRQc1o2WnM1ODJIQ1B4aTd5ZWUrVm5XZXA2dEl3UFdUTEtO?=
 =?utf-8?B?cXNpK3F0MFN6OENjWUpmZDJGc21aQkFxZFpvL2V4NDBkOXN0a284ZUVJVjRo?=
 =?utf-8?B?MHc0aHdIK010UGt4cE5lUXlRM3pZMUtMcS9nbFBpNG5vWHNwVjBKMzRXdmtD?=
 =?utf-8?B?Z2dZVDVOYW9NYmNDSUttZFQ5QmYyMHlIQTgyL3cwK3haVG5lMjFBZU5yVnJi?=
 =?utf-8?B?akNaNHlEOUxWNEM5UjRVaUxmaTVoMW5KTGtqU2FmaXoyRFlxUS9HZHBka0x1?=
 =?utf-8?B?eE5VN3ZGV2l0MExBcndJVUxkK2VaK3hmZ09GNzhVVUVDV3BuZlN3dkhoU3BF?=
 =?utf-8?B?S1BRdExUbTdVRWp6UEFieVNCYkZzeWM4ODFraFd5Rkd2MzZ1OUw0c3hwUFh1?=
 =?utf-8?B?cFZWWU01Z1FWNForLzIrQndBckZGWittQXZzYVNvUnFIaWJIalFJVnJjUnEx?=
 =?utf-8?B?ZUxnTit0dHNjMlFtY1VTdXFBcU5wUlM3dUw5TWp4SURmYmUyV21yUzdXTDRl?=
 =?utf-8?B?NGVkbGZCSDhta0tiaENsdERWU3h6TGd2bEErUVMyd2VKK2E3VmdGbU0rdXRv?=
 =?utf-8?B?U3hPYXIzYWc1c2cxSVdYN3JqMi9pM2FvekJDNTdZMjhPVG13SDdiSFZZMVph?=
 =?utf-8?B?SElEREJsRkhuR2x5NWw0ZXBqSjVnK2pubElIMTlqeVQ3aE5XNWt3d1BHSHNV?=
 =?utf-8?B?RFRkN2tsYnppK2NUWTJMNWs4NGZ6YUV3akM1c2RUd09iUGp6S2pIL0UrZEhn?=
 =?utf-8?B?RXFNNWI4bERBbjhKdktuYm5hS0ZHT2lFUlZqcjF4QVVLSEE1ZEpFNXpScU9C?=
 =?utf-8?B?QUNhSlVyWWR3dkNJcG4wVjloTFVjK2xtOVlaQXNldFI4bmM1QVFsUkI2eFdp?=
 =?utf-8?B?YUFJSGwyZzVwTjVub2JHSlRYanIvOUhGTGlVTWdkRUdLc2ZWQVpGQWl6UGJy?=
 =?utf-8?B?aHkwUXJYRzhlalFGMDlqRG1Zc0gyVHBFVkE0d0hCZXlIeHZHNGt0MEV1Vk9P?=
 =?utf-8?B?d2QrNVQvZ1R2MlRraUJvN0I4d2FuVWlJUW15Vk56dHhRU1Y0VTFvZkQ3cmwv?=
 =?utf-8?B?MGpRR1FoY0taOHpnVWNGSkZvWGRNVG85cnJVRHJLbGF0RytxNE1QS2JMU012?=
 =?utf-8?B?cnIvZnZQbE92TGpiR2lQU2NyLzFtTUQwc25ad1Z2aDhVa2JPTWt4a1VGTG8z?=
 =?utf-8?B?T3l2cjZ4Y0JkeWhjQ0VzZFhrQzE1aEl1T3BaSVdleU9yaUJYejZOZUptWEN5?=
 =?utf-8?B?ZHJlc1Z5c0VFWEhpa2ZIanZDcy9wUEpRS2ZyS1U0ZVFEQzFWeXgrZXhpWitP?=
 =?utf-8?B?dzRwNno4czU5UU1TbTZpY1AxNEZDV2VnRG1lMVhmNU1GaFl0ZDMzeU9KNzBI?=
 =?utf-8?B?V2sxWU1iZ3JES2pQcVQ1TktDUHl3UTNML0p4Rk4yci9kYkNwaEJhN2dDaXRR?=
 =?utf-8?B?YU5JZVdnekN3NEFQT2JBZkNYUlFMLzJQQndIT0tUNVBSRmVLK1I0dk1QajFY?=
 =?utf-8?B?OHNOMTE5ZFBiNEtscFZFTEJ3ZjU3NkNkSEs3Tmd6bkRMeTI1MWpLUTBaTCtr?=
 =?utf-8?Q?Eq5oE2/YTD69aaL99qPWHSRlw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 727ef07c-26ef-44d4-ad1d-08db6b1c20cb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 08:07:55.9116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3gcWZwI6qW7l0mDS/K7iwkPiVcGitKVmGy/z4ktyYIcWHngPZ31A2KfcFwQHaN8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5083
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/12/23 00:56, Andi Shyti wrote:
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Michal Simek <michal.simek@amd.com>
> ---
>   drivers/i2c/busses/i2c-xiic.c | 20 +++++++-------------
>   1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 61288f8dd0672..f879af4def5ed 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -1256,16 +1256,11 @@ static int xiic_i2c_probe(struct platform_device *pdev)
>   
>   	mutex_init(&i2c->lock);
>   
> -	i2c->clk = devm_clk_get(&pdev->dev, NULL);
> +	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>   	if (IS_ERR(i2c->clk))
>   		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
> -				     "input clock not found.\n");
> +				     "failed to enable input clock.\n");
>   
> -	ret = clk_prepare_enable(i2c->clk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Unable to enable clock.\n");
> -		return ret;
> -	}
>   	i2c->dev = &pdev->dev;
>   	pm_runtime_set_autosuspend_delay(i2c->dev, XIIC_PM_TIMEOUT);
>   	pm_runtime_use_autosuspend(i2c->dev);
> @@ -1286,7 +1281,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
>   
>   	if (ret < 0) {
>   		dev_err(&pdev->dev, "Cannot claim IRQ\n");
> -		goto err_clk_dis;
> +		goto err_pm_disable;
>   	}
>   
>   	i2c->singlemaster =
> @@ -1307,14 +1302,14 @@ static int xiic_i2c_probe(struct platform_device *pdev)
>   	ret = xiic_reinit(i2c);
>   	if (ret < 0) {
>   		dev_err(&pdev->dev, "Cannot xiic_reinit\n");
> -		goto err_clk_dis;
> +		goto err_pm_disable;
>   	}
>   
>   	/* add i2c adapter to i2c tree */
>   	ret = i2c_add_adapter(&i2c->adap);
>   	if (ret) {
>   		xiic_deinit(i2c);
> -		goto err_clk_dis;
> +		goto err_pm_disable;
>   	}
>   
>   	if (pdata) {
> @@ -1328,10 +1323,10 @@ static int xiic_i2c_probe(struct platform_device *pdev)
>   
>   	return 0;
>   
> -err_clk_dis:
> +err_pm_disable:
>   	pm_runtime_set_suspended(&pdev->dev);
>   	pm_runtime_disable(&pdev->dev);
> -	clk_disable_unprepare(i2c->clk);
> +
>   	return ret;
>   }
>   
> @@ -1352,7 +1347,6 @@ static void xiic_i2c_remove(struct platform_device *pdev)
>   		xiic_deinit(i2c);
>   
>   	pm_runtime_put_sync(i2c->dev);
> -	clk_disable_unprepare(i2c->clk);
>   	pm_runtime_disable(&pdev->dev);
>   	pm_runtime_set_suspended(&pdev->dev);
>   	pm_runtime_dont_use_autosuspend(&pdev->dev);

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
