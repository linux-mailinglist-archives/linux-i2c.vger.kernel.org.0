Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 047BF7AADA4
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 11:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233061AbjIVJQM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 05:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233072AbjIVJQC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 05:16:02 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2093.outbound.protection.outlook.com [40.107.15.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F36CF2;
        Fri, 22 Sep 2023 02:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqPgWfdPQHMl511zjD3KltJvfbOEsQovEewUyCofac3yQ6Sk4sxRbxxCVXVoj9kh/0h6Pd3CI7Sdni52GDtN0X51S//oBrDzP4riTxSkMqTqv2k1ubU8p4uSwPL0cu/gd2PFuWaF19ZTVVXs/G37YcloaWe5gbILfOgH8co5rO6lOkbCkoo34vPNVsbRNEGq3g6q7hDE06I68tqLeb6NmyUQtT3r3P5MZ0kWwflYoEGtHA5GvbvFFDhsIumqpMJF3RpshAW4eWLPcfctsfmjTMfnsztTXZcFcF9/YfimTdWT6CuM+gpE6P6RBIK8YjXhH/RyvHf6WqvDmdPwCzrupg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juh5o/rt9KY4myopxg0WEw1Km5PgUXR+kG1MXQu+iG4=;
 b=eB7gafRDW4b4ZPK4UEPrBPkBLmxqUt/kYyza+jOF2zJ+hD1Th7XRAUYtAqEyvH/v+WL9jkCO9J/pRNSPBJDr+TVuPDFPsnMb7en7N0o7o6u47bYjNsgkxe1xZvC0dXBwCVFQtK6uiyBsdlaCBFybajKXaYFrBK050a7w5JzRZCqBsWzJ2Zu2VGbxFsWM9wD19I4aT39j7oZI2dTT/XpT9Ig3EfR5Fr0D70A5wiiS4vGUx9/Ua16PcFs5jcKuEDxtItqEAZbbxxcSoEqrG6cx2C4n4fQ4rTMTfLR4luOP39dMQ5AlzS6wE4AEs5B1VfHUkc03Eyus9qkFEkbJZ5Qr9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=juh5o/rt9KY4myopxg0WEw1Km5PgUXR+kG1MXQu+iG4=;
 b=PvmB+mQHR0hbK2R0sur86eZbzaf9ub/AOHnejXxBFa/sldwHHSwypC/xXzyGQ4ULH7E8+6AMcH6dMTIW0Z6ezDN+EC44PfUioaDEH37WjT+tJWYNdOTKoEvErtRwoWs6kD8ufTFpqjkLRa1np+CDLR/FYXWcWN4eD/wrNtU7gPk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS8PR02MB9816.eurprd02.prod.outlook.com (2603:10a6:20b:61b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 09:15:41 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c%4]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 09:15:41 +0000
Message-ID: <115d5d08-c81d-6206-84fa-15b70d1ab4b3@axentia.se>
Date:   Fri, 22 Sep 2023 11:15:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] i2c: mux: gpio: adhere to coding style
Content-Language: sv-SE
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230921085752.8686-1-wsa+renesas@sang-engineering.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230921085752.8686-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0070.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::29) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS8PR02MB9816:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f151a0-c6b1-412a-4be3-08dbbb4c7e2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TjdZqvjLh5COC2gEIvxpoHl5XjhAFs7buLSTR8yR1w9QUMpSn9DP9XpT8Nr5534+8wm99BYKNjfniL2BU5iKUsLG3//LMr5POXMu8dlBNofuXqi1lExZc/HNHJGLPKsFfga+ny2NqamyqjHplyfMms2hLcUnySD1akr2h6XsKxkkKd9Rof7+XmYkFqo2r+zrQBmfgc0OJg+Zva7fWlWvx97L3xIATNIlBPrrsUkgx783X4H/Eq3dKFOAF9s0d2IekO2en8xj/jicZ3StDGvty4JE+hFIlWqAKBKU7w3yhHX66T51YMLSvLHtjO81UapF4R8dsK6Cz0gu1pwCiodg5MS6JPSqKvkFJ36jBnhyT+nFzV816FR4QQeZjSI+2woAgHCpZCQJ/Ca7Ne4dKOGB63LUxQaeMy9CiIkvTlzRMO1wL8LntBlJaJ8HcuyWdYYVnSyvrMXwQGBJtczZnoMMSEMbnhP9KKloFJg9aW4YZGXT9t9ZKN/mzfCbHSusd7PDzcConbgWTmDWQM8IynHW2mK+XO9me3+wCEejIduIQ+NqIjcKPPPNtW18cf8eDuWNR65asooJLTmCD5ImahYkvlTwiiv5P0ZUiCXsXxSwiiBDEf0xAQXmL9U/7PE6FunTtILol+BgHpSu+VaezcYOMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39840400004)(451199024)(186009)(1800799009)(2906002)(8676002)(8936002)(31696002)(4326008)(86362001)(41300700001)(5660300002)(31686004)(36756003)(83380400001)(6506007)(478600001)(6512007)(316002)(6486002)(66946007)(66476007)(26005)(2616005)(66556008)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ly9FOHZ0dEo4V2xLVERocWRNL0xnR3hxeGRpOWhXcmRmYzVVUDJ1WXFMNGhr?=
 =?utf-8?B?MXFTMWdUbGVRb2kyRGljZEIrQW1Wb2tzd1ZxVmNVOG0yVDVzSDMwc29LNy9x?=
 =?utf-8?B?S0FHOTQ3Um5sYzc4cFhiVS9QVFpXYVlUUVNBMmd5MVRSUUwxUnRZaHJ2Z0tX?=
 =?utf-8?B?UnFFVUZkVE4xTmI4MFlEWmgya1FYT05DanZTNElOVkVYb1prZ3ZqdldtL3ZM?=
 =?utf-8?B?Zit3WkJ6U0ltanRVUjlJaTVhOWNHTFZUazZrYitHaGZXdVovRkJJMUtOdG5a?=
 =?utf-8?B?SFBnNTg3T3J0Y2pCUStPUG96SGlicEsrYnJOcHEzS01ZcEVMTk5GMzdNV09R?=
 =?utf-8?B?cGNFeVlib3MxUC9SRUhLZkg1Wm8yRkl2UlZYRkpkd3hpZTI1MG1vTzRLTkxM?=
 =?utf-8?B?U2xhbGk1RmJCUmkxWEQvb3hacUhCSEdmN2hKbUt4ZTdOYllia1NESTBKZkRh?=
 =?utf-8?B?THhVZnFwNkJwWVJvbENwZ3M0RGtITXNIRzdRbVZQSjdpa2JHMWRtMGdPNXlF?=
 =?utf-8?B?SkRLdDFoNlNwNXFDdng3eWN6dklJcUYrSVBYSGV5WjBXL0t4UDExd0UyT05P?=
 =?utf-8?B?dG4xaEwzbzVmbUFCL3BnaHl1TGtFbGl3ekJSanJXbVdUZC9rdzNvU1d3cGxl?=
 =?utf-8?B?Q0VjYTQ4QnhzMzlvYlpQams4NnN1SUFLUFlubkRsVVlpR0MweHRtK2xvZ0JC?=
 =?utf-8?B?aklvWEloV1F1QnpCaWxKaHllRGltVDQ5cnFJWGtST3lyK2x3ZjZUYmJsMlFW?=
 =?utf-8?B?d0hnOC9KbWJsam9yMmtOMEhUMVRwVXlub2xXRTJEUEMyL0Rlck9SOHpMRVo1?=
 =?utf-8?B?TmQyUVBlQTdBMzE1TlRRZm5DNWptMTFGaXh1MGVJdlp2MlA0MkMvWGt5TlhM?=
 =?utf-8?B?VWlRK0VQbmtQVHZ4UFNaM21PaDg2SkVvMTRZbXhuTFZOZ1dZbWU2L0UwUU9R?=
 =?utf-8?B?eVdtQnZTOGpKRzY4R3lYUDJ0SDhoN3BHaXEvQ0hWVC9jRnQyK3RIdGhKNWt4?=
 =?utf-8?B?cXNiUjFLVjR4MkxpNHB5V05XQ1c1L011RFZyY3hJTDNSaFZlQlhTdmIwaEU0?=
 =?utf-8?B?YkwyKzM2ZXpHL3J6UTU2WXhaZGs4Q0hNUi9sTUsvc3JqUTg5TGFRUFBXOHl3?=
 =?utf-8?B?eEx5c2lqbmxjZ2pCUGlvM09jcnBtQ3RUVENxaUF6UUZpNTlRMy92bTlzNnJI?=
 =?utf-8?B?djNmYjVLTjMwVzB6dnNOTkJYY1NFWnNpNlpZeVhLMWtzbDV4LzE4V095Rk1W?=
 =?utf-8?B?OUpwQVRudEpJM29vRER6TTVhRVlYOUJRNkprYmtKV3JxNkFoSEE3blRMNTVj?=
 =?utf-8?B?WTVtN0lPQzBEU2tnYmZDWWRFbzFMZm1mcjBiWnZPSzJaOGRoWmJoVU4xRE5l?=
 =?utf-8?B?QmhwVDNqTWV2aUVaMnp0d3B4YmNPQWkrKzJmdWdrOWtnNDhuYUdFOEp6S1N5?=
 =?utf-8?B?QkFzZEVkYThFcHMwWkZITzB4UHNFN0k0Q3h1MERRT2c3N283cDkyWk9PQ1pw?=
 =?utf-8?B?LzZnVjJpSkZMeHBaZUNhS3EzdzIrRGYydFNiZTFGajFQdklyZWdUTG9jY2Zy?=
 =?utf-8?B?OUJhSDRoL3d6V3d0dHh3SXN1djZkYXF4ajFBSVdZTGZBczRRMDAyWUJlUGUz?=
 =?utf-8?B?VXFrcnhTWTZSZHQveE85NFUvMmZ6UHV1MDlSSTNOa2hwcjdoUnQ0MmV0b3B3?=
 =?utf-8?B?ak56VEw3TmU0NEJSSG9MRXVPSEk2aGt2QVZ0SVJXeEVZeitSZmFKd2xYVU1t?=
 =?utf-8?B?UWx6Rm8wUU9JYXJ6OXhZNVZWRGVKTVNmdlFDcmFJVmlsZ0pldjg0VGF6RFZk?=
 =?utf-8?B?ODQ4Q1lkZ0l5M1U4ZjllZ0huOGxSelNwTzFWckRWM29XZzlSekFGemdiWE1K?=
 =?utf-8?B?TDM2TU40VGtTZXNENnlmVkFxYlk3aTBjRUpkc0NEOXo5SnJEMWhYVFlQUzhq?=
 =?utf-8?B?ZzF6VUV4d3g0dWxlTlJLcGpBakNpdXNsRWVDZFBycUV5ajFXTmhuczZ3N2tn?=
 =?utf-8?B?dXlmbG1ZNWhYWTliSnV6QlVxRldLampGZGxtYmpwamJra2tSaWZubE5CTUJP?=
 =?utf-8?B?NHlHZEVWMXBhamptaTJzVGxHRVlqWWJldVEzcjdpaEhEZ05jMCtLc0RtTmlQ?=
 =?utf-8?Q?vhPUSqoCbHfI0EXX4C3Y7H3la?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f151a0-c6b1-412a-4be3-08dbbb4c7e2a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 09:15:41.3372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LoRJSmIGLR8ZAnLIDEUtmmN+Doh93YClb6kcZIgl58hvnoMyIRfWPbTmmSEq4qmH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9816
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

2023-09-21 at 10:57, Wolfram Sang wrote:
> Advertise our coding style by following it :)
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

A no-brainer...

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

> ---
>  drivers/i2c/muxes/i2c-mux-gpio.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
> index 5ca03bd34c8d..0419c7453281 100644
> --- a/drivers/i2c/muxes/i2c-mux-gpio.c
> +++ b/drivers/i2c/muxes/i2c-mux-gpio.c
> @@ -23,7 +23,7 @@ struct gpiomux {
>  	struct gpio_desc **gpios;
>  };
>  
> -static void i2c_mux_gpio_set(const struct gpiomux *mux, unsigned val)
> +static void i2c_mux_gpio_set(const struct gpiomux *mux, unsigned int val)
>  {
>  	DECLARE_BITMAP(values, BITS_PER_TYPE(val));
>  
> @@ -59,7 +59,7 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
>  	struct device_node *adapter_np;
>  	struct i2c_adapter *adapter = NULL;
>  	struct fwnode_handle *child;
> -	unsigned *values;
> +	unsigned int *values;
>  	int rc, i = 0;
>  
>  	if (is_of_node(fwnode)) {
> @@ -102,7 +102,6 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
>  	device_for_each_child_node(dev, child) {
>  		if (is_of_node(child)) {
>  			fwnode_property_read_u32(child, "reg", values + i);
> -
>  		} else if (is_acpi_node(child)) {
>  			rc = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), values + i);
>  			if (rc) {
> @@ -127,7 +126,7 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
>  	struct gpiomux *mux;
>  	struct i2c_adapter *parent;
>  	struct i2c_adapter *root;
> -	unsigned initial_state;
> +	unsigned int initial_state;
>  	int i, ngpios, ret;
>  
>  	mux = devm_kzalloc(&pdev->dev, sizeof(*mux), GFP_KERNEL);
