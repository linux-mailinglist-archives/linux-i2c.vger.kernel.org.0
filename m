Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3929630FB8
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:25:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234264AbiKSRZq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:25:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233850AbiKSRZp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:25:45 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2117.outbound.protection.outlook.com [40.107.21.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 880DF1581D;
        Sat, 19 Nov 2022 09:25:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVSGzquMdO2UqTs5m9oMPexlk5TGceffjGRyxMnH5d7g2UlAZI/6M4DQrCozlphBDti1icqvEl2gHhEred6lPF4ZRygOJML8OsaPHAnsm1NXoblvHQEpcupypFOpuPD3QrgImMp6uoP8ZNn4CGi7cpypB3TmlNj8QQ/w16afgOv84Dc/hqwbZFTXNuO6/aCTzmDUJ6TaoJM24Uo2bLLMsH16X1sRmehoNF2kEwb/LyILyrM+yHjPnUhH92Zecf5nKM89Sw7+Fs9CTjBcLC5mzACMcSXZTLXcQFI3vANAq2g70SaIIkXqeRy1CWVHyDBeMnOiWzKxM8SCxIog5FncLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6yHrLvhvdG53ub1DJwMxX9oNoUrVBQsSDt/o0JShIo=;
 b=YQkbBJyVZ+liQzHXcOu2DbBcz39CWTnK+obk2qw17JMocri5P75fqwCrAYeIxrq6Vthe5KXiroK08vjuClI1vpmp3OfrGsr1ivCkYWB32cnbKA8ZrqVFMhHS5vZ6qKDYsSCQNwNAAOBqaT7Ydl+GDkf8EPCCfGBQAvQIFAN3SiZo/ehD+0nI41FmnbONhBFtKQ1McjTWIV5EZWcXUK7S3OuiHg1TKJX2uKJJPejC27t6cCBphahTNCe/V0UBXhwjfb1X85J9Uq7TDxOIkdF9sCc4zWMCWU/l+IN+frGJmDis4SugqbydP7/KAybzqDtw3muGnsxe5iOrFKh8nApIiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6yHrLvhvdG53ub1DJwMxX9oNoUrVBQsSDt/o0JShIo=;
 b=pcuHenqGCzhqzm+C4l3OO/BN/d+TENhM5rlApP46KzO3qIhPDh7M37AcVAdsj+ieW6Y3WVGNWbvHVhqxJCTIuV5xyXGHMMqngjeHjTpbVNoJGPY7MUbqwNTdwc9WTY5INECg0hOgKHP9/Xicpj/zaVsoKD8ziygHb+XRYoxL0xw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS8PR02MB9650.eurprd02.prod.outlook.com (2603:10a6:20b:5a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Sat, 19 Nov
 2022 17:25:41 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::a30:dce8:eaa4:7687]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::a30:dce8:eaa4:7687%6]) with mapi id 15.20.5813.022; Sat, 19 Nov 2022
 17:25:41 +0000
Message-ID: <1a38ae69-f807-5dc2-3d90-be3b42ca455c@axentia.se>
Date:   Sat, 19 Nov 2022 18:25:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 047/606] i2c: mux: pca9541: Convert to i2c's .probe_new()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-kernel@vger.kernel.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-48-uwe@kleine-koenig.org>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20221118224540.619276-48-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MM0P280CA0098.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::30) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS8PR02MB9650:EE_
X-MS-Office365-Filtering-Correlation-Id: d4734849-0bbb-41f7-6eb2-08daca531535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M3vYOHxUtW3L5ZMA6oYbBoHEosalz1qXWcKTNJmCad9qgFWopiC8x5MLd7UkN2T8ReYUEqwef6z+YC4NylZ916514QyeOcH6UqjLO+I/Z9dWNYSqIRCSxP0VLrETIrjfxxIDaNVI1NM5THHenRSLE+GfXdlUbet+5806SC9yttpdRbTRKb2TW+nxG/7QZMTUmnKxrQLPGoGHMr1GXPFJg/nK1FiYM4385o79LI3arFMOKlyoQJxdGjUMbEmBskr2VdmqFRPZMgCs1yHzw8Q/udd7iWDLDGTRMqCtc4zhpqk5OxYWr95eqct29JZSS8/rELRbnKhbuNmooJObiCaGOOUQ/hdvafbBslUshNwIzfjMQwK+1ZQK2nYM4FJ/XfYPWB4FVb+kWAYCGZGK1Pkxvd5fYuO185HGzMx/jB2UopqHBNeQJMOnBBEOUBbm0EgDpwTh0y7thKTJTfJ1z2ka21c+tiF9klHsT8a/IeYh9jE6Xg8gb9LA6Df87BJnzjU8SaAwGKZCkJ52flIk8icTN55KwgpoYeVK/5TcjDuua27mwZDT8CRUTR5F74kzRyyPbCg6h1fDtmJh5MocAu/C9DdROfHGXQX0S7SJvufaZMx6HfC+7AuH8cKlSxTExkG6RE4kt0ncb6UUeUiXUCo3ceIV/qMC7nk7xYs0xtxeVXnp683Gf1XNHDY1Whze1gwNT4+WT1wOhfW4lxAWSXhg1emZqd9yDcdUDMylnRxIoVogttShqgypLtOYcZ+roINl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(39830400003)(376002)(366004)(346002)(451199015)(6486002)(6506007)(66556008)(478600001)(66946007)(316002)(110136005)(36756003)(31686004)(86362001)(31696002)(2616005)(186003)(38100700002)(83380400001)(6512007)(26005)(8936002)(5660300002)(7416002)(66476007)(8676002)(4326008)(41300700001)(2906002)(4001150100001)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1lDNWZxZG5XYWNwTUNwOUp3SmlTTWNESWoyQ0l3bkZvUzdSUTJBMWtNZHJ4?=
 =?utf-8?B?SDNOQjhYVXRxaDZLODdpNmxidjUzV3pjaWE5ODY4VmVicjBNRDdiUWU1SmZu?=
 =?utf-8?B?VXhPbUdpalJyd1lWT0dRMGh1UldkcEhPbFRxY3JwMG05TGd2MGdtY1N1cGdP?=
 =?utf-8?B?bzIyRHlPMU91Qld3UXpyblRLekVJeU9YYVYzckh4b2FpTUFsVkY5RHNTVFIw?=
 =?utf-8?B?Z3FlOVovcyt0dDhOT2xIWDdheDdFRTNYWFdDSTBsbUFNOFRTOUFjK0ZNbzR2?=
 =?utf-8?B?V2VNcmxPUG90NFRBbEljVVMxNCtIZHh5bnM1R2lmd2NIVkxqM2VKQmpaNDRU?=
 =?utf-8?B?S3o1YzJtZ3M2VEw3UEd5UFRyUzRRUy9zRDRvUDFXMDc4T0dPc0R5K3BDQ1lz?=
 =?utf-8?B?QXlRaFprYitaSHZ4WmhKY0JuNnBRWk1iK2hoQjdjSEdBVHFBUmVNanNMUGtN?=
 =?utf-8?B?aFduQld1UFMzVXBqZXRuWVU3Y0hYeW1YZFMwMGVVUkU4QytXRnhpTE1sYitM?=
 =?utf-8?B?c0kzRGlGQm1nNzRtTm1ldnJ0eWc3Q25xRGZ1d3dXTVo2TldrdFJRNXNSOFdi?=
 =?utf-8?B?SjZsMmgyODRKYUh0Ly9RcGlrREthUnFhMjc0K1pncm9FZzk0TmZoWlVTSHFa?=
 =?utf-8?B?VTVjcnVxWXFPSmtKR2c2TFoyTWJmTVB3NEhxUDZGZTNxbk9uOU9aUWxOVGhX?=
 =?utf-8?B?QmcvVUNSYzRucDlMb0NDSXpiVTZpdHIwaTVPa1ZwelRTQmRuSm1YbFpwNlBR?=
 =?utf-8?B?L0dMWEpiYkpIRFVZOE9zVk43aSttaFV2emRLemQxTjNtazlocHh0ZU1ZTGcr?=
 =?utf-8?B?MTFpSHRrMlpIeXBCYU80N2pOOG9HaDZSZ0VWeFgwb0h0L2pNWmdDdkFFSTZm?=
 =?utf-8?B?VzE1Q29TSjcyWmVOTndBaUx0cjZoRElxeWJscUJlUS8rUkVWN0QxbjFJWDhP?=
 =?utf-8?B?SUhLVFNUbm4vRlNEcWFCVTVCajJZb0cxVE1jakg3QXNwYlNqUnh4aUk1SUc2?=
 =?utf-8?B?NGY5Lzh6a3dkM2puNmlrZkx0NVZUdTBUMnA1eE9FRFNiQkFrekVtTGthdkxU?=
 =?utf-8?B?bDJ5QTJhNzk4cjFCcXdLTTkyZlE1Y1N6NmN1Slg1Y0dvV204ZlZuY2VzY203?=
 =?utf-8?B?REZRQVhuakpYS09LTS9XWkUwYWdDK3Y4YUFsMW5SWjhiK2ZlTjNDdTR4U0FK?=
 =?utf-8?B?NGFhcllCOS8waUlYaGU1eGpjZlRwQjBmbEg0WWc5NHRIY0JHcGxMc3VYZEpW?=
 =?utf-8?B?TVRHZTdRTEFhZkhaTFh3T1ZSZnNrRDFOcGlJVnZmMTdrRzdSTkNFZWNkaEZi?=
 =?utf-8?B?YjQ4TUdaWlJQbEtyVm1xc2dKTThPOUR5VE01dTZRMmprTDhHdW1Xb1p6Z2ND?=
 =?utf-8?B?Y1d2ckIvZENuRkIvbkZFMUxXL0lJdlRaZ1NOQXFwMzB2aFNTa29qKzcvK2tw?=
 =?utf-8?B?VVpiUEtyM1pTT25BQTBVdnJHZUhvTjRFS2ZxUUhVVnBkTVhjbGJ5R1lFWUJt?=
 =?utf-8?B?ZEFraHFlVWQxbS9uSEdhVTgyaEJFVmJUL290bXlueWs1TTc5bUUzVDc3Tmxs?=
 =?utf-8?B?SGQ1aWF0ZnFaMFR3ajMvRGowT1hCRHpORmhRdmZCbUgxRDRXTmFlUThSUWNI?=
 =?utf-8?B?aG8yczJTYitVb1ZUYnFTNDRDRmxpd1luOWFQM1RkbzYvQnluQUdFQXE1Yi8v?=
 =?utf-8?B?TTQzWTVTSzJjL0RQZGZucnJQeFFyQit5NnVUQ3Y4cFE4ZVB4OG9vVXZwcFNN?=
 =?utf-8?B?MGhBbVc2SmNHNldtcEpCb3p2T2Y5c0NNWGpDd1ZpS1RyUFl6T1p6eHVrYitw?=
 =?utf-8?B?bXJYMXQvaUxrdXA5SGVPMGRmeVROa3VrdTNCM0xpUng2SDliaTYwTnBQV2FT?=
 =?utf-8?B?YnlITkRrRlE1VjdmMkRBWTFhM1h6RGpFclVJa094bGQ1cnVRRUMxZVhGdlFY?=
 =?utf-8?B?NXVwSEk5Vis1c3JhUGhIczNvUWZ0N2trUElXSEt5NUhvNTlodzlBc0gyRVBZ?=
 =?utf-8?B?REs2WkhrNjdtQzFlZkVGOC81SnJkVktudUVST0ZSbTRZVmxGUE5lRzZ3K25t?=
 =?utf-8?B?WndXdDNUdTFUbnRSZVNuRWpTM0R4SW8ra2pYUHQ0NjRaSForZGoram1ocEV1?=
 =?utf-8?Q?VqnAQgAPLc6kgbvhTWF5OcLd3?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: d4734849-0bbb-41f7-6eb2-08daca531535
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2022 17:25:41.4359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nthp1X3spIUBqTCREXD/gXzVj+Rh+vXF8LK1qUo3qmSgxiiDHxF9QQVdQKfCLJ8t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9650
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

2022-11-18 at 23:36, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Peter Rosin <peda@axentia.se>

> ---
>  drivers/i2c/muxes/i2c-mux-pca9541.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
> index ea83de78f52d..09d1d9e67e31 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca9541.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
> @@ -283,8 +283,7 @@ static int pca9541_release_chan(struct i2c_mux_core *muxc, u32 chan)
>  /*
>   * I2C init/probing/exit functions
>   */
> -static int pca9541_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int pca9541_probe(struct i2c_client *client)
>  {
>  	struct i2c_adapter *adap = client->adapter;
>  	struct i2c_mux_core *muxc;
> @@ -337,7 +336,7 @@ static struct i2c_driver pca9541_driver = {
>  		   .name = "pca9541",
>  		   .of_match_table = of_match_ptr(pca9541_of_match),
>  		   },
> -	.probe = pca9541_probe,
> +	.probe_new = pca9541_probe,
>  	.remove = pca9541_remove,
>  	.id_table = pca9541_id,
>  };
