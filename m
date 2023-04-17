Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 892096E4B78
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Apr 2023 16:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbjDQO3j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Apr 2023 10:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbjDQO3i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Apr 2023 10:29:38 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2090.outbound.protection.outlook.com [40.107.14.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5E510C0;
        Mon, 17 Apr 2023 07:29:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5Xvd/uyv5+/JFU7IYAvIn7h3UAGkfiXMqcaz+e9LIcoi9Bk7DKH/HcXnkDDe5NzEwzOUY65hvyh7e+7gXAHYXdYSuc16D6zPO5TXfj/CJPI1mfqVBkdfLa5oMSmAyoIoHYrPH5fUHmxvBEbikUKJBIQVJ7znV4VwnM4f3+1g6WcdpnWn+++Ia/CnHoC0C4vAD/SgBzDIe1/FX0qB1Gq9X1icjP/cGsJUxzrR48MV7DJtThpWkVHI6CP6WLlIEsR2nTr2osrQp8fUgEP0VgrisDfenBj3ZTvAU0V8AUVowaL4nVelO9epDHxvszO7Pl5SBsiSIGLRMa7+rnLNDvyiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEPEFudmvfzuXlhPBnZaEoqlCR5nZHp6SgY7vwzmjx8=;
 b=Em/eYc7UPqJFml3iGF8I++96Tsd14w8LxGra0m7reGegEzA+DFaHpYpI1Ld9uQ2zPfkJDLC64HC8Li2S4XyM47nBzyia+pgR06YwJM0uPT8Bcw7sVvmssjWWKPbRy1J9nkYyIy+lesAxKR9P05pAuuuKKeuqTedOGtnYmcLf2dHNrGuA2sbTtk0GJeJtV5ZDwh/dX1+uRoPDPn2R0clL6/oW8hk4GEmv2EPu0xCJSS+lXxPjyiePkZGMXxSlhPfraSL+1BfZFCvKNrPZENrc7kj8bV2uhBiPcHvuS600JRhxDA7NV7Db8J5yiGtGl0n/sCUmk12F7O5BHOhCrwZy8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEPEFudmvfzuXlhPBnZaEoqlCR5nZHp6SgY7vwzmjx8=;
 b=XyMz9TSTPFX+IQoJFbS90my+QizrVUr6zk119up+8VH3GQDjUHzjfaTcntz9wqXuK0h4plsZYaCFPNknxXIZ/1UDpEX58WGK393CmW+gSZIi5z2DEnBpJVjKm1NvCPOOBelf/z1e8tsvAhRCGKV+T+WNcbriz0KnnkwCbN7itQA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by DB9PR02MB9828.eurprd02.prod.outlook.com (2603:10a6:10:456::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 14:29:30 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa%5]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 14:29:30 +0000
Message-ID: <6a74c457-5186-2735-a0c9-c661f666322f@axentia.se>
Date:   Mon, 17 Apr 2023 16:29:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] i2c: ocores: use devm_ managed clks
Content-Language: sv-SE
To:     Wang Zhang <silver_code@hust.edu.cn>,
        Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>
Cc:     hust-os-kernel-patches@googlegroups.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <843fab4d-0fdd-4610-91ed-1d8e9accbd25@lunn.ch>
 <20230417140531.81853-1-silver_code@hust.edu.cn>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230417140531.81853-1-silver_code@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P193CA0012.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::17) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|DB9PR02MB9828:EE_
X-MS-Office365-Filtering-Correlation-Id: 689db68a-1510-4148-7db0-08db3f502791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dChpw0Gp6P0KLZDnRUByKttyPIwdEbEAewqwqivBiI59CoyiS3QB9Y/k1Yn8+ECkjMs9qy6DpJGgwdNAwChAhMZt+uaSnQOz/QfdfynPejKVAT7FS10RKFdp3uqBah+zno1pkpwNzaN3Ki2i6+mqMovxJG+hxmxuKxkd/b1hNIF4LTrTVGnsSEKfSukh+aH/mdLe7h/ahuKWeY01ivA3qM8UdKcmLXSztzmceevgsR2spZq6Mfmt1KXmvPG0n+f4iJu2r+RDcNpBY6BMuDrC24G9iMl138AYHJgOTZQCsT23Q9zzvIefWXPRnpgMi00Ii1osUyFuPtHWPS3x8/CtjTBwoHVsoHW4M7a8HCiBoIUmBuPc173/SyWdMwQTIrE8pTRfF7uZigIW32TlEA+VnbOIiU3o7CSeGWaJ0kIU3qu2UDK7fiyYjs6JTg0yTKmUloJ9KERTHEu+HYlqNRF1/ryFxbPrb13RHHHdvQaMfoP9PfH5/qyNJ/v1LGOvEToowyitMeJ/PUjI/J3fsi1q+VYO5LPZXXcjx2wD7EQ04y07rOqMql03+4KpkFGM7/TqTY0V7I8e+8XAUbHDiRGEdtciaNbLWbz60sEWkrhUqVVh/PoG43bxPcZWEJYWa5v72KPcAQtXzBRI4HfAQY2deA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(376002)(39840400004)(366004)(451199021)(5660300002)(2616005)(86362001)(31696002)(83380400001)(186003)(26005)(6506007)(6512007)(38100700002)(8676002)(8936002)(110136005)(478600001)(6666004)(6486002)(316002)(41300700001)(36756003)(66476007)(66556008)(4326008)(66946007)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmk5Znd6YzQ4djc3ekJGK3dudmh2d2h2R2NZeDJuQm5BUUdFOGM0NlNqazk4?=
 =?utf-8?B?T3pOU1Bmcm5xemE5MnY0Y2Yxc0xIcFBJR0M2WVBKUFJsSVdra2RTUUpCa3Ro?=
 =?utf-8?B?LytZYlBTeHpYSU0vTFcxY2NZT0luM3g4bEN1Z0xROHU0dFJISUFWT3phelc4?=
 =?utf-8?B?d0JwOFhMMVB6cmpnY0VPWVpTTXE0YTBsTi9nc1kwRVJTMTV4QkJWR1BSTGtk?=
 =?utf-8?B?My8xNzh5aGZqVEtSbmFCd1pxakpPbkd0ODhMVlZLU093SFZUMlpqYkYyY3Bu?=
 =?utf-8?B?bk9JL0hITmovZFhHL25QUE9Vdi9teGh6UmhGa0ZRR3J6NWxYVURBekp6V1Ev?=
 =?utf-8?B?MkF5OUJ5djh5VjZ6dTdIejl1Nm9lL0pRNURVNENrWWZzQXZXQkNuc3IxcjVn?=
 =?utf-8?B?YmdSMEVRa1BPZ1pLTTR3UzJIUFlweHZEYkNKSHkrdjhFRXBaSzhnUlNzRUdC?=
 =?utf-8?B?Wkg1S3FPZGlaMUppUzZmS2ZzbXlRQ21PM1pLVDRiVDh1VXJFN2ZwOUxObE5J?=
 =?utf-8?B?NWR1VU1FdVNveXZBRDlWVVVHcUdiT3ZLaktQK2wyQjI2WmZlZzV2WmtOSDR6?=
 =?utf-8?B?WjB5T3BEWXpNSzFYTkVxVmRpVUh3TWRxOXhySTZaY2hrRWhvb2tYZFFyZitZ?=
 =?utf-8?B?alBHc2tzemQyY1JROFl4TjYxOTh2MjRhWjNRbFBtSTYrQTRBUGNIYTlKSGFM?=
 =?utf-8?B?UUhrMnV0UmR2RXR6RWVrYkZSa1BldmlscFZNeklsZmhJVTR1dXlFUHBMMWJ0?=
 =?utf-8?B?ZXcwOGVyWm5PdE9IcXVzQndHRGZIODl6RFFRNm9lak9OdzNUMXhqemFldVNY?=
 =?utf-8?B?bEVmdjY0NjROQlNRZUltQlNONmlMSmlITkVHZnAyT3VtMkNORkUwL1piNmpn?=
 =?utf-8?B?SkswWkNpdlpycDkvU2ozeFRMMlczU0hKYXRJbEJPNUk1a3JVNWN4MjZiME9S?=
 =?utf-8?B?RHl4YUMza1dSOFVrdnA2d1lHcUtOSG95Z3pqb2dUcTVqSnorT0lNNC9qVXQv?=
 =?utf-8?B?ckwrUzRxalpwN1B6bHNOaWJ5SW1hOC9PazJTd3dBQUllTU40b1FUNm9KRkFY?=
 =?utf-8?B?UDhrWm4yeTFGU1dueG1tbWJxVlJWVXZmOEY5WldPMHlGeE1LdlNSNFJJQ1p3?=
 =?utf-8?B?SzR2clFTRldHbC9zNkJSaVNMRHplOENmMkpxejFZRWpjMkF2QXRXL3Fya0ti?=
 =?utf-8?B?cUdDaXRsOFJVdkQxd1dJZXlFQkMwalpqVjdMQkduQmdZSFI0QlppeCt2Yis2?=
 =?utf-8?B?S0NtajNZd04vVUN3eFEwTVYwNENtQVh0RG5GRm5RVHJNeWtSZGMyVmRaZFc4?=
 =?utf-8?B?RDNNaVdsODN4MFkvZHhud0hMMTNqU202Z243RXZmWEhESWVRQjFLUHc2Tkx6?=
 =?utf-8?B?UzlYM1hoSjB4T1o0bTViY1lhM1UrOEovL0ZNVHBPYmZxbElINmFzbnlKZnJw?=
 =?utf-8?B?cC9RdEZLT3BuTFFmRWk5VHkyYkxFWlNrVk10TnYwdytZSkpIaDBTTE1GQk1w?=
 =?utf-8?B?aFpLbkp0aUFWakdxT2JZN1pXdVZBZlRFbTN4UkRCVkRTZkNPWTZQUkNGM2hV?=
 =?utf-8?B?ZEl4dnZoOERqV2RjVXlicVAyd094dXYyb0gvUldUbWs4M1U3Ym55aGdrUXVx?=
 =?utf-8?B?d3BacU02RzhiaU1ERWZ0S0UwMEVPZTFaWTVqZTl5OFduK1FVdm9Ba041dTBp?=
 =?utf-8?B?OHk1VkRIRzZoR0NQb2ZKQm4zTXNWK3hJUzU2WXRmSTZCWTE4MnVLS1NKY2Jz?=
 =?utf-8?B?eFVqWUl5TUhmOWxsUEJiS3ZMcStHWEcramNGQUZvVWNvK2R3cDJpWThlOFBS?=
 =?utf-8?B?UmxqaG5DVko1aWkvMTRxcjBJMURPc0x1MzNyMHBmZ1I3bGY2OU0wTWVpdzVI?=
 =?utf-8?B?S3Jtb3lIaURHZ1c1RVJFNWl1cVJ4MzVRQmRBZTBTRTB4czRmOUxNLzdmenNI?=
 =?utf-8?B?MWdNalFBTVlmbE8vV2hOWnZ0OFZjVEUvcW5OSjR4WUFxdFVuY251L1NMV2ts?=
 =?utf-8?B?QU9wb0RHUTJXa01IY01XajJ5R3NkRW5oQ3hNMUJ4a3dXVks5V1AvMnZTT0p3?=
 =?utf-8?B?dlRqNVk2aTVZb2dsRndtaUxKNFVyNkwvbWVmMjh5TjdmYkVlOHRIWkxlQWxv?=
 =?utf-8?Q?JH527mzXT0ThmFhKJBXTXopuN?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 689db68a-1510-4148-7db0-08db3f502791
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 14:29:29.9004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cyjT0aTIYmNDSv9YDnG1jGySHT5ey39UUS474Bt8Ex1ULE7onqaA4slEX+gh4V0a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB9828
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



2023-04-17 at 16:05, Wang Zhang wrote:
> Smatch Warns:
> drivers/i2c/busses/i2c-ocores.c:701 ocores_i2c_probe() warn:
> missing unwind goto?
> 
> If any wrong occurs in ocores_i2c_of_probe, the i2c->clk needs to be
> released. But the function returns directly in line 701 without freeing
> the clock. Even though we can fix it by freeing the clock manually if
> platform_get_irq_optional fails, it may not be following the best practice.
> The original code for this driver contains if (IS_ERR()) checks 
> throughout, explicitly allowing the driver to continue loading even if 
> devm_clk_get() fails.
> 
> While it is not entirely clear why the original author implemented this
> behavior, there may have been certain circumstances or issues that were not
> apparent to us. It's possible that they were trying to work around a bug by
> employing an unconventional solution.Using `devm_clk_get_enabled()` rather
> than devm_clk_get() can automatically track the usage of clocks and free
> them when they are no longer needed or an error occurs.
> 
> fixing it by changing `ocores_i2c_of_probe` to use `devm_clk_get_enabled()`
> rather than `devm_clk_get()`, changing `goto err_clk' to direct return and
> removing `err_clk`.
> 
> Signed-off-by: Wang Zhang <silver_code@hust.edu.cn>
> ---
> v1->v2: change `ocores_i2c_of_probe` to use `devm_clk_get_enabled()`
>  
>  drivers/i2c/busses/i2c-ocores.c | 62 +++++++++++++--------------------
>  1 file changed, 24 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
> index a0af027db04c..1dcb1af1ad13 100644
> --- a/drivers/i2c/busses/i2c-ocores.c
> +++ b/drivers/i2c/busses/i2c-ocores.c
> @@ -549,28 +549,24 @@ static int ocores_i2c_of_probe(struct platform_device *pdev,
>  							&clock_frequency);
>  	i2c->bus_clock_khz = 100;
>  
> -	i2c->clk = devm_clk_get(&pdev->dev, NULL);
> +	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  
> -	if (!IS_ERR(i2c->clk)) {
> -		int ret = clk_prepare_enable(i2c->clk);
> -
> -		if (ret) {
> -			dev_err(&pdev->dev,
> -				"clk_prepare_enable failed: %d\n", ret);
> -			return ret;
> -		}
> -		i2c->ip_clock_khz = clk_get_rate(i2c->clk) / 1000;
> -		if (clock_frequency_present)
> -			i2c->bus_clock_khz = clock_frequency / 1000;
> +	if (IS_ERR(i2c->clk)) {
> +		dev_err(&pdev->dev,
> +			"devm_clk_get_enabled failed\n");
> +		return PTR_ERR(i2c->clk);
>  	}
>  
> +	i2c->ip_clock_khz = clk_get_rate(i2c->clk) / 1000;
> +	if (clock_frequency_present)
> +		i2c->bus_clock_khz = clock_frequency / 1000;
> +
>  	if (i2c->ip_clock_khz == 0) {

This branch seems hard to hit with this patch.

Cheers,
Peter

>  		if (of_property_read_u32(np, "opencores,ip-clock-frequency",
>  						&val)) {
>  			if (!clock_frequency_present) {
>  				dev_err(&pdev->dev,
>  					"Missing required parameter 'opencores,ip-clock-frequency'\n");
> -				clk_disable_unprepare(i2c->clk);
>  				return -ENODEV;
>  			}
>  			i2c->ip_clock_khz = clock_frequency / 1000;
> @@ -675,8 +671,7 @@ static int ocores_i2c_probe(struct platform_device *pdev)
>  		default:
>  			dev_err(&pdev->dev, "Unsupported I/O width (%d)\n",
>  				i2c->reg_io_width);
> -			ret = -EINVAL;
> -			goto err_clk;
> +			return -EINVAL;
>  		}
>  	}
>  
> @@ -707,13 +702,13 @@ static int ocores_i2c_probe(struct platform_device *pdev)
>  						   pdev->name, i2c);
>  		if (ret) {
>  			dev_err(&pdev->dev, "Cannot claim IRQ\n");
> -			goto err_clk;
> +			return ret;
>  		}
>  	}
>  
>  	ret = ocores_init(&pdev->dev, i2c);
>  	if (ret)
> -		goto err_clk;
> +		return ret;
>  
>  	/* hook up driver to tree */
>  	platform_set_drvdata(pdev, i2c);
> @@ -725,7 +720,7 @@ static int ocores_i2c_probe(struct platform_device *pdev)
>  	/* add i2c adapter to i2c tree */
>  	ret = i2c_add_adapter(&i2c->adap);
>  	if (ret)
> -		goto err_clk;
> +		return ret;
>  
>  	/* add in known devices to the bus */
>  	if (pdata) {
> @@ -734,10 +729,6 @@ static int ocores_i2c_probe(struct platform_device *pdev)
>  	}
>  
>  	return 0;
> -
> -err_clk:
> -	clk_disable_unprepare(i2c->clk);
> -	return ret;
>  }
>  
>  static int ocores_i2c_remove(struct platform_device *pdev)
> @@ -752,9 +743,6 @@ static int ocores_i2c_remove(struct platform_device *pdev)
>  	/* remove adapter & data */
>  	i2c_del_adapter(&i2c->adap);
>  
> -	if (!IS_ERR(i2c->clk))
> -		clk_disable_unprepare(i2c->clk);
> -
>  	return 0;
>  }
>  
> @@ -768,8 +756,7 @@ static int ocores_i2c_suspend(struct device *dev)
>  	ctrl &= ~(OCI2C_CTRL_EN | OCI2C_CTRL_IEN);
>  	oc_setreg(i2c, OCI2C_CONTROL, ctrl);
>  
> -	if (!IS_ERR(i2c->clk))
> -		clk_disable_unprepare(i2c->clk);
> +	clk_disable_unprepare(i2c->clk);
>  	return 0;
>  }
>  
> @@ -777,19 +764,18 @@ static int ocores_i2c_resume(struct device *dev)
>  {
>  	struct ocores_i2c *i2c = dev_get_drvdata(dev);
>  
> -	if (!IS_ERR(i2c->clk)) {
> -		unsigned long rate;
> -		int ret = clk_prepare_enable(i2c->clk);
> +	unsigned long rate;
> +	int ret = clk_prepare_enable(i2c->clk);
>  
> -		if (ret) {
> -			dev_err(dev,
> -				"clk_prepare_enable failed: %d\n", ret);
> -			return ret;
> -		}
> -		rate = clk_get_rate(i2c->clk) / 1000;
> -		if (rate)
> -			i2c->ip_clock_khz = rate;
> +	if (ret) {
> +		dev_err(dev,
> +			"clk_prepare_enable failed: %d\n", ret);
> +		return ret;
>  	}
> +	rate = clk_get_rate(i2c->clk) / 1000;
> +	if (rate)
> +		i2c->ip_clock_khz = rate;
> +
>  	return ocores_init(dev, i2c);
>  }
>  
