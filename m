Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B71659BCE7
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 11:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233660AbiHVJd4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 05:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232306AbiHVJdz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 05:33:55 -0400
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00136.outbound.protection.outlook.com [40.107.0.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9BF10FC3
        for <linux-i2c@vger.kernel.org>; Mon, 22 Aug 2022 02:33:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Snk7VB2cSKrLPB4xEvkspUhUU5Pe2AtpjHDs7Vo7m/xjt4GYfy2D4gYn7FRpinI9H/XDwobRHozTaw9qJAXboztQfiW03EOjr9r7ptEeSsrcRWP58/M0rI2lCp58S1BillyrBdx8b8+N/+Z2p3BLCPVmEFadv7vJ+nxoo7WrKoR863u2inOcMnWXocR8f6Hqm1X/HGrMVdNGU0JbeU4+mmppz8SXNlU+J1oYBgLjqnkWKcUA7vn4g0tGT4gBDu7l6VS2dVn28SmUI8ba49BSsuYhDxzcY+GGzCqCfHdP9tEgnBJYCd5kVcAdV9syTcoxHvHbnTFYoEWqI4kSKVWWrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGQBrErpahYbGdrlcquyjdzCXgjefQd7bIYK/JAhLFU=;
 b=NEMQtpAyGdoQvE/M1dqE9O+EVx3+mwicRLQ9nOfmtlMMqHuvdJv40fvhlyjgLuz7PtpVc15R2MESB+Tw9PHkUT+M8Jnnbs0pifZ1qSYDBCyXxxgV3M32iHLXYisY3L1gcihdklmsgz88XipZMJz4inGA29Ce3MjRGvvW4f7ezWkQPVYwcls1DJfnaGvICxeTKvF4ouJPypoHlMynriEUsRPG92Ibt2pOfU6tQHr4ANpTkCTRWZDDGUizRqnHATs9qzw/1++5xEqZTqzh7IzoVNTB0EeqKApOnGUroBnx+HbOCs2pOp56KdfhikNz2SiDj3ap53O6wkQjlqi5S0IzRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGQBrErpahYbGdrlcquyjdzCXgjefQd7bIYK/JAhLFU=;
 b=CBo0/rB+cquB+eoDzsKxH00Vfp2YLnSNYcELatFAaz8l4mpDH5gGS6vvcBB1i4sjYNvcPU5ml4yh53eXww3TO+VoKnwPANQfGJ243TlVU8ZsiB9GfhcDyLnOx31xrvIxCrKAW5gHvX8jlZqs0qYRPe1CvDXV/rywHyad1SvGhnE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by DB7PR02MB5212.eurprd02.prod.outlook.com (2603:10a6:10:32::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Mon, 22 Aug
 2022 09:33:50 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179%6]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 09:33:50 +0000
Message-ID: <4cc75876-ca16-0878-4d20-4ad982dfd1b3@axentia.se>
Date:   Mon, 22 Aug 2022 11:33:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] i2c: muxes: Drop obsolete dependency on COMPILE_TEST
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
References: <20220804134545.141f464a@endymion.delvare>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20220804134545.141f464a@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0012.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::31) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e9bd3b2-fd5c-4f85-242a-08da84216bbc
X-MS-TrafficTypeDiagnostic: DB7PR02MB5212:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AXLkwu25SF3XsZChy0bBNhARl8EEqplr9EvcrrUvjZI1P+YIX1fV6JWmR7NPtvu4iV9UKZuuAlKO6xxqUt+HZmlvmdhDzcd+vXbra11JcqDktNW+sARDKwTesicdZUffDOkyHjsrOQiTdUSKT3UA43Go9ntePcQ6y/bsRJZK3Gdzbz2N6rq3N1mmJvizZREuharhr8nZL+rFn4b9cfSoXQ9CKGTqkPhersPpmDga0SkEx5OCaDzViZE6cKWZ0LCvJpKKfy4BZoe8Z+HYM9hv3owWgWI9Wj6hM69Hh56fTGgx+F8C48sRdA4aQQgNLyef1eh6B95gUXYsdjOGMa4gmwVSQkveEP/8rge3mQKf7dZpd3IXdR2jsirIRMfq1IHO4VmtjGBk1qnNzx7ABUH6um5Kntzunyy/ag7EYF3SZyD9Tk4ugYLfOu7yLKp4vghgzcPjw52UQW3LalWgAdKoOqhG/ZmHoyXeFtomxcb7UHe38QnvvbPpsh/G/7Bi+8iBjLZc1mBrSkj8AaDcUME6xUGFBCzmwUopVKfUXCkWGZEEFDshkySsighj7OFbQRYpK0GODDRCFFVhdTvo8dY69KoRyFUOrl2L3SmOI5UNixsYV64Qsys1B5oh0LF+TPiHC9703mtT3v0wWJ1rC3wL7oBydEfOEGdQlRNs9sg0QCKhNB+3uKCOF+yBZf5pCRg7a6++79fIdJnH7bFwS2VIvr5+I78hYtvZKBTzAjZuCw1NDCnahDOw9trhpKeGZDfdxzuHyIUaWjVNPfl91h7VJWPVhCewmSEi5Igk9gKIretCS/iJbU0JOQViQHcWgYTO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(136003)(39830400003)(346002)(396003)(316002)(6512007)(110136005)(66556008)(2616005)(2906002)(8676002)(83380400001)(6506007)(66946007)(186003)(36756003)(66476007)(31686004)(478600001)(84970400001)(6486002)(41300700001)(5660300002)(86362001)(31696002)(38100700002)(26005)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFo3K2xCd1E4T3IzQnVmSTNoNkZrb0lsamNBN3pSeXVwemM4MTlVWjB2VktF?=
 =?utf-8?B?M2ZHTmpxbVQydllXMFBkY3grY01ZMVgzNzhTQlJaeFBBck11U0JvTHFkZk9o?=
 =?utf-8?B?dnNiVDJTNkllVWdEcXM1N3pFL0locFdub0tiQ1VSWmZISFhZYlhyU1lJZzlH?=
 =?utf-8?B?OTlMaEVpdHBETSsybVBqa2tuMGpYeTkzaHBEbkZIRXNMQW80MWt2cGl3UmV0?=
 =?utf-8?B?THVpcjJzUEZsSGEvY2syYTdRaFhmWjR3ZEtzNTRtdFJsOVUzZ3cza3p4UlBr?=
 =?utf-8?B?dC9LaUxISk0wWnV0Wm5vcG9LaDZGWkdXcDJxTWVZZDhxbFNDT0x3U0Q3aE4y?=
 =?utf-8?B?N08yS0YyaWJpeGhCTVhNM3BHa09TSlE0QzFTZ01VZXA2MXg3amZMR24yWldu?=
 =?utf-8?B?SE1zVVpvdGZZVkxXWFNXWENTamJoQmh4azJYUUtUTmsrbElyeG43V1dSV3hV?=
 =?utf-8?B?ei93bzlEQjZSNm5oSnRKb0kzVjh0ajNLUVBlcVBWZ2NzLzQyd2lHdUIvbmpn?=
 =?utf-8?B?bUVEZDJoWXg3QXErNVBtVHpiVFlYc2NvZjNkc2hWSE1FMDZxRkFzQUlVRjNU?=
 =?utf-8?B?TXB3OUVJeXlxb29aSTFYdTh1UTlLUWpoKzJqOXZEQTJrbC9xQm8wNUNQd2sw?=
 =?utf-8?B?UFpaM2oxZ0srTi9YelZRY2kwNDVUR2dBdmpFSkYwUnlERHNvMmtKNGxwb1NS?=
 =?utf-8?B?UGZ3UEYzU3ZWVTl0Wko3L2czc3JaNHJTRkx0czF3NEpodnp2Wkl4TjlZZm03?=
 =?utf-8?B?MDRtYVdFTHRBMXlUS0xGUG5VTHZiaUZ0UE1GSE9ra0s4bkdTUUhqWkNqL1hM?=
 =?utf-8?B?aHpWNitLN3lqLzNILytuOVZLRjQySGxzeFNhQzVjbkpLcWh4NTRXYUNUbWds?=
 =?utf-8?B?OUVnMWU3eU95U1hYdUVKQUNkZHFUOHBlSzQvTURJR2F3b2FZc2tMWVZQUmJU?=
 =?utf-8?B?UENQYkpVbTFKKzE4cTBaYmZJR2FFQUFiaXZkYkk4eW96Y1hRSDNYMkxUdWtX?=
 =?utf-8?B?SGtmWTFzK1k5ZGdTUi9BcGcyV24vWFFuc0Q4WmZGdTNEN2QzMnNxbnhlYmVY?=
 =?utf-8?B?RjRBa3J2NzZBNlMzZGhPTDMwS0pwbjBFT1pLSHdHWmxMOSs1UksvNzQ3aUcz?=
 =?utf-8?B?SkFhQ281aDlwa3Fab2VpMEZ2Y1YvK09lMVpNY1lJMDdpZTZOQ3NpK29iWURN?=
 =?utf-8?B?MXgwV1F6WTh5eDA3QURWaXByZU5TV0xncEhKVUxhOFJVb1Jlb3B6bkx3U0hX?=
 =?utf-8?B?UzN0QW9ySk1JdThNNWoyaS9hdTVBYjE0Qzcrb1lneW1aUzNyQ0xkWGtNdzV5?=
 =?utf-8?B?Q2pYazR3azFmYzllV0hLZFZKbzZDYXREQlBBaGpyZlh0WFNNb3RLakFwL3k3?=
 =?utf-8?B?SWR5ekY3MHY3QWo1ckVrM1huakZQQWk5NElTOVhhcGFqZTE5anptaEJxdHdO?=
 =?utf-8?B?TmZ6ZlZsTFlVcWhXeWJhQjlrOW40ZkZ6aUp5dzd1Y2hLTGFNTGFXRFo2eHdi?=
 =?utf-8?B?V0FuOGVocms1WWRYRHBjT1E4VDZMSXRrWVhOSTdpNk82VmdUVWhTeGQzZFNl?=
 =?utf-8?B?K0hWTzdLVkF6Rk9NUlRNL1VTVUhkMHE0YWtnOHRVUTE3Uk9yR3AwRFFpYnBS?=
 =?utf-8?B?aWQvanZZYWxwQ1gzbVI5cVNaMjNTZUdGNGszMmYwNStuQjdzV1hvejV2U1hi?=
 =?utf-8?B?VGVQaGdsZHVydXIxMzNCa25NSHl3U1JTYWRmbmh3TFhMd1BHWkpCZTFVZ1FP?=
 =?utf-8?B?N0w5eVlSTGRLUzdZYURlVitRVHF2YlNsRWhNejF1L2orNGl1WXh3RElKQUR0?=
 =?utf-8?B?QVNCdXVaTFpHOTlDVHFLVVBpaFBySkZ2NGh3c1F0amE4bFhBZWcvTEg1OEMx?=
 =?utf-8?B?c2lIQWU5c1hWVkh0eWtjaGxOdUF5NFNhcE9JTWR2SW9uRC9yMENKRTUwWlhD?=
 =?utf-8?B?Uzhqb1o0TmRoWTZaazU2YzYrWHZQSUdWeFFUZEgxeFNUSndSN2QwT3hxQUNQ?=
 =?utf-8?B?dDVtSEVtT3M5WUFHNUFuOVpickJ5NktSclJlMUhrc2FKMG9pbkFZdGk2cFNK?=
 =?utf-8?B?V0N3Ry92bEg2WEFkWjN3Q1FMVzQrdWN5ZjdXOFJxRDdYQjM2ZmJqWm5rcm8x?=
 =?utf-8?Q?Lr1CZpdkMI2TkzLvYKO7mxExr?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9bd3b2-fd5c-4f85-242a-08da84216bbc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 09:33:50.5750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZuGm0dFepYPj+zefRdeEHNM4V/2EWt8iMiIDM3xItYbGUeuyQPhxpsvH2YzruRA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB5212
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

Sorry for the delay...

2022-08-04 at 13:45, Jean Delvare wrote:
> Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> is possible to test-build any driver which depends on OF on any
> architecture by explicitly selecting OF. Therefore depending on
> COMPILE_TEST as an alternative is no longer needed.
> 
> It is actually better to always build such drivers with OF enabled,
> so that the test builds are closer to how each driver will actually be
> built on its intended target. Building them without OF may not test
> much as the compiler will optimize out potentially large parts of the
> code. In the worst case, this could even pop false positive warnings.
> Dropping COMPILE_TEST here improves the quality of our testing and
> avoids wasting time on non-existent issues.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Peter Rosin <peda@axentia.se>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

> ---
> Changes since v1:
>  * Drop of_match_ptr() from i2c-mux-pinctrl. We know what it will
>    resolve to, so we might as well save cpp some work.
> 
>  drivers/i2c/muxes/Kconfig           |    6 +++---
>  drivers/i2c/muxes/i2c-mux-pinctrl.c |    2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> --- linux-5.18.orig/drivers/i2c/muxes/Kconfig	2022-05-22 21:52:31.000000000 +0200
> +++ linux-5.18/drivers/i2c/muxes/Kconfig	2022-07-31 12:21:32.776100442 +0200
> @@ -9,7 +9,7 @@ menu "Multiplexer I2C Chip support"
>  config I2C_ARB_GPIO_CHALLENGE
>  	tristate "GPIO-based I2C arbitration"
>  	depends on GPIOLIB || COMPILE_TEST
> -	depends on OF || COMPILE_TEST
> +	depends on OF
>  	help
>  	  If you say yes to this option, support will be included for an
>  	  I2C multimaster arbitration scheme using GPIOs and a challenge &
> @@ -34,7 +34,7 @@ config I2C_MUX_GPIO
>  config I2C_MUX_GPMUX
>  	tristate "General Purpose I2C multiplexer"
>  	select MULTIPLEXER
> -	depends on OF || COMPILE_TEST
> +	depends on OF
>  	help
>  	  If you say yes to this option, support will be included for a
>  	  general purpose I2C multiplexer. This driver provides access to
> @@ -77,7 +77,7 @@ config I2C_MUX_PCA954x
>  config I2C_MUX_PINCTRL
>  	tristate "pinctrl-based I2C multiplexer"
>  	depends on PINCTRL
> -	depends on OF || COMPILE_TEST
> +	depends on OF
>  	help
>  	  If you say yes to this option, support will be included for an I2C
>  	  multiplexer that uses the pinctrl subsystem, i.e. pin multiplexing.
> --- linux-5.18.orig/drivers/i2c/muxes/i2c-mux-pinctrl.c	2022-05-22 21:52:31.000000000 +0200
> +++ linux-5.18/drivers/i2c/muxes/i2c-mux-pinctrl.c	2022-08-04 13:35:50.169392003 +0200
> @@ -185,7 +185,7 @@ MODULE_DEVICE_TABLE(of, i2c_mux_pinctrl_
>  static struct platform_driver i2c_mux_pinctrl_driver = {
>  	.driver	= {
>  		.name	= "i2c-mux-pinctrl",
> -		.of_match_table = of_match_ptr(i2c_mux_pinctrl_of_match),
> +		.of_match_table = i2c_mux_pinctrl_of_match,
>  	},
>  	.probe	= i2c_mux_pinctrl_probe,
>  	.remove	= i2c_mux_pinctrl_remove,
> 
> 
