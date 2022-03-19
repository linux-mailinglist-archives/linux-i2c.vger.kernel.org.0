Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA3C4DE8B0
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Mar 2022 15:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243260AbiCSOmb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Mar 2022 10:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243259AbiCSOma (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Mar 2022 10:42:30 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130093.outbound.protection.outlook.com [40.107.13.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC53174B9E;
        Sat, 19 Mar 2022 07:41:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOT/TEJ0B+y8xjcm5/sWLYNkGUIeOoeJ8iIEoFHOfZmKu1v8DAfK5a1h4ck2mUxv+hvsRrrX5v9eUAREOVu3PxdS4oyeRPo8kL2y0VGu1gwi9QqBN6zxRAHL1yX4BkJFugjiISMw4Hk+HMUY5EhUYMeL+UHpCtcAauHtZ6s/HMvCASGw6VqU++dxcrsj6lVKgbOAlpLsRIGvDIwQlD5IAUsa4ouRPl5xOyGJAhUmtvOhMZ93N4qMhaQUDD1gdbgXC+bIDEQFH/jf3WX1drOPbjPfvuJ4QnEXxuOiPdZPtfo+Q48NAktfyqwFdc94dt2sw5yq0Z78nZVCB+g65PJNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBaLXzJ1scfdcWGelZeNm1a4+68szt0bHh+y9TYAbmA=;
 b=jxlRyrDIitHX9u9rLf/jmjEnTmjVlq4Axku4oLCBIOKUr5PGmG1/t3DtKhL/VzNfs+z9kEY7VKLmjkBLpl0B/6mpmuNoDx7Wyrr0W6OIi4oIuANsqZTqF2HBzMn+xmx0d6y2N86WoqPFwy35r5X3KMctxhIjj2vxgLaQ9frBh2iR9K+mj+6EsV5KljOV4No2KWx3CEnD9qxkLQywpnq/ddBHWvAbHiufmS68r1WgxP5lCUEFwHp9YXXrDRnj3mNxcvl6wx+8b77swedkyWgBbaVHgTGolH8Yyc7m4VyBD5qEGhehNaSUna9jfIGDdQCtmIOur6svQ833al5V851Cgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBaLXzJ1scfdcWGelZeNm1a4+68szt0bHh+y9TYAbmA=;
 b=LPq1zo5hr3qPDn+GLvjFafgU4h44sS6Y0vq4+7eKqErQv8llZoys0WcVocSXqfVcnHYLJPePclWGSxcFe0Pgswf3BopQKnY6LMRHYa2x0xhEFrBbOnT5fuMNVvB8YGgh1whGSdrhBwY08nZJ0lvZWtr+Bgl7thoJFFkp/ZBo2Jc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (20.178.17.143) by
 DBAPR02MB6102.eurprd02.prod.outlook.com (20.181.41.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.21; Sat, 19 Mar 2022 14:41:05 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::cc:370f:ef33:4de3]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::cc:370f:ef33:4de3%3]) with mapi id 15.20.5081.019; Sat, 19 Mar 2022
 14:41:04 +0000
Message-ID: <5658941a-bf81-4ecf-3317-82d2a8244021@axentia.se>
Date:   Sat, 19 Mar 2022 15:41:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [v6 2/3] i2c: muxes: pca954x: Add MAX735x/MAX736x support
Content-Language: en-US
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220216074613.235725-1-patrick.rudolph@9elements.com>
 <20220216074613.235725-3-patrick.rudolph@9elements.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <20220216074613.235725-3-patrick.rudolph@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0042.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::10) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a27b65c-5b29-4b2c-9c81-08da09b67ec0
X-MS-TrafficTypeDiagnostic: DBAPR02MB6102:EE_
X-Microsoft-Antispam-PRVS: <DBAPR02MB6102C5825461DD4C88D7DDDDBC149@DBAPR02MB6102.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 91m6yzEM6r5G2uPj99wnBjYThcJrjV/DluLN/PZ7QjA8AZtuzvEpRhpA4jU3FjDIgsJLw55TGwGaoQTUnZC5+pY3+uCH1PZVBIMJtgXL0XEGdMeMVyCHjWk/d8QDHlBw+01jxgtxCcp36JwTpTmTQu/P8zrJm3y7E1ShFSHnMTwtmOTvTjWFvAWDI8aTUFHV2iMKbg/38y7mbpfLVJ8lJnir21y4cX1MlEv2j8UjPeb5FD0YvfMG4RbfqztSICKCx4vxbXLSwfZ5Y6ERfN5Ur59t4nBD5pekOZ6eoapxjLVUNrGwbSfq4UEXn9ILnBB95do6PyYoMWw0ASUBX4pbNsT3JjJ+NnXy7k0ojdhJYTf57ktVtWu5jrvvy2j3xmkaE+xdnQMVXokEX40glL9n0Mz5exvxD5oBrBGkv6aaodOYHRCrQGw8uoM+qYyZYaalYDdLd9K9p4ksco1Khbzs7E/+CFI/1gTeSLrG6emPH6oR/yHYWdA0vML8+4zjTig6P0nfCbnyccEfcSpI333jdAEd3+cJDAX4dDrnkIRxcsw9gkezNnv/lePw4hunCsLizwIxFmC8rlllNi4YQToak7SyvCz5h9a9ZwX9x83joGGMZMKVGKvE9RWbmBMZpdxGlPfPOaQMxw46dG1t051kjhiTdugh2UtbrWhDlyttckbw2wfK2u/vMx9H9Abxu3Ajg/AXDY2jOomDvvzgOUFA30orGV+altyMe/mnqDHWWTU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(396003)(136003)(376002)(346002)(39830400003)(4326008)(2616005)(66476007)(6512007)(316002)(8676002)(66556008)(66946007)(6916009)(8936002)(36916002)(36756003)(5660300002)(31696002)(86362001)(6506007)(38100700002)(186003)(6486002)(83380400001)(53546011)(508600001)(2906002)(31686004)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qko4SFlucms4WGFoNWV1SXpZZ1hhdjdVS20xUTFxQi9iVFRycEtiRi90eVVD?=
 =?utf-8?B?MzFFZ1ZWYXZGS01UcDg4WGJjV0ZCRExrNDlXWlNjbGduNEtRZU9UVlpKUHFO?=
 =?utf-8?B?ZjNBR1MyZklnblo4RTQ4RW1qYnZwOFZ4RmpVUUc0L0tvdXFBSTV5bWRnc1F5?=
 =?utf-8?B?ekdYYnhHaFhKQ1ZsbTN0cjFRRkIya0hDNlRXMkErMllMMHZtdUg2RHV2MlJt?=
 =?utf-8?B?V0F0Y29qeU8yTHE3TTFXa20wSGdKQWZLZWdNWGpXQmlGNy9hNHVUOUJlc3Zx?=
 =?utf-8?B?OWJ3Mm8vczc1WTBHNmdoNWhyUHJ2V2NjTjROWnF0bW9HRHd0RkxEa3JyaXpP?=
 =?utf-8?B?WFgxR1Z0V3R4TXhMNkExTVpWRFFvNGI0QzBMcW80SkdqZ2xNUW1RNHl2Ulgv?=
 =?utf-8?B?M2tmUlU5S0w4enFCRW1sWWZMQ1JtSTY5VWs2Zys2NGNLdzI5NHRuUFZYc2xI?=
 =?utf-8?B?Ny9POVI3NUQzV05wSCt4Y0dCQUxpSEZIUlZUckhuZ1RWd2Y1cUIxUUlaa1ZB?=
 =?utf-8?B?Yk4wMlZ6U3R5ZGtqbnRTRlVra2RHMitNMTZNSVFZbGtlREo3b3VXcm1ZNEd1?=
 =?utf-8?B?L0NyZk1ycUpTRUlCb3JSd1NsN0xzTVNuWkE4WDFaWElwbHYrZWpSVytVMFhq?=
 =?utf-8?B?YnUwbCtBTTlSclVqL1QvTlBib0Y5ckdIQjJrMUNsRUNjZXNKSEk1d3QrUjBw?=
 =?utf-8?B?NVlRY1JoLzFSeTdLdVRHTitLdTNCN0NBeWJGU09RK3NqaEQ4TlV5bmc3Z0tq?=
 =?utf-8?B?YlFtc3lQK01MQ3NTdWozc2taMk1QVzV2UEFRNlpMY1NMUWRiY2JoVHIvaDdj?=
 =?utf-8?B?N0V2ekNKYlF5R0hSMlh4c1NpRHhCRXhpclVhS0JxYzhGWGtPUnRNcU1LaWtH?=
 =?utf-8?B?N0hKelBrdDAxMW9yRW9HcXdtM0tMbmppd1ZlbzFFUTdPV2JrdHhBcG1kejBV?=
 =?utf-8?B?RkRSMkZHUHVBYllkcXhFU3g3Y3RQaGJYbzJyeWVFdlpwYTg3enRyYzlLZnlp?=
 =?utf-8?B?dGFiWmhDUEtZOFA1Y09vL1k5bkZBdVhlS2oxZDdTaGR1WE1rVGxORGZjRWtY?=
 =?utf-8?B?aC9RN0ZNYmlCNm41TktENlgzK0RDL2kwVFlHZjVPVVJuMHI4VWFGdHZUMi9s?=
 =?utf-8?B?WlYxd05Nb3ZWWFVEbmN5QWhHUTR2N0I3OWxDdGhxb2UxYjZHOWdHTXRlZitx?=
 =?utf-8?B?Vi95aXhkek1wYitXWEQ0YVQwV2UyNFV1ejRhcldxYjZ6WTFRNlV4Z0dWUFJF?=
 =?utf-8?B?b1RGWmduamVKVUVtWWQ1QUtCWjJTQU4xR082cGtFZFpwMDNsRlNkb1p0WDVx?=
 =?utf-8?B?TzE3dlM0RlM2cTFMdlU1UmhYTFRqVk9tWVlxR0JXcmtPS0wvZUE5QXFIU1ZJ?=
 =?utf-8?B?M0tyR2RwNGVjdlVzajh4L016S05BOHdyYi81MUhGNGdUZ2J2cmVIaUxrNGRO?=
 =?utf-8?B?YkFiejZTRlhHTWEyL0NoaDNISnM3UWRmVUxmR0dKOENlQlErZjRRMDJhZ1hU?=
 =?utf-8?B?SDBVWjRES2E3QjVOeEhjYzhPUFhOMHVGOWlXYnY0bWdyb0g3Tk5lcWhvZkVP?=
 =?utf-8?B?aHcybFAxdEJ6Q21PaXAxS1d0b3hpVmhRSWc4Zi8wdzRtY0ozTTh3eGtFZDJn?=
 =?utf-8?B?YURJZ2NwdUNBbkZzdGhORm5RMERZYXFqS1lNbnVMVTIxWFU3dW5Tbm0xQ2Jn?=
 =?utf-8?B?Rm9aN1p3SzBLVkVyVkIzdjNYQWpQZ3A4ZlRzajM1K2hXbGhZcW45QXpkbG0v?=
 =?utf-8?B?NGJRdUJ4VnJ6YU5BUjZQNjI1VGtFS0FZWnJMTjMwcG1IUEJiR0NVVUFnQy9n?=
 =?utf-8?B?YmhLaHMvanYvemROc1pRL1BMSzRDOEkvY2tENXU5NkdmZGRmdWszdldncnls?=
 =?utf-8?B?d2dlbnRISVRmZWFWOGR1bzhHaEwyL3Q4a0k5dnlhZC9hbzBEQTJ6K2dLblRk?=
 =?utf-8?Q?ZcZqk2DzpBioNWaQQwWzf01wcSPngJVE?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a27b65c-5b29-4b2c-9c81-08da09b67ec0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2022 14:41:04.4252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNluTou8pqpcsju4UuRDxJp9k6w1UpFsA1dj32kJItGV6DIl67ePPFbtGprHZaCP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6102
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

Sorry for the slow review and thanks for your patience...

On 2022-02-16 08:46, Patrick Rudolph wrote:
> Add support for the following Maxim chips using the existing PCA954x
> driver:
> - MAX7356
> - MAX7357
> - MAX7358
> - MAX7367
> - MAX7368
> - MAX7369
> 
> All added Maxim chips behave like the PCA954x, where a single SMBUS byte
> write selects up to 8 channels to be bridged to the primary bus.
> 
> The MAX7357 exposes 6 additional registers at Power-On-Reset and is

MAX7358 also has the same enhanced mode as the 7357, no?

And what do you mean that they are exposed at POR? I can see why they
are not exposed /before/ POR, but are they ever /not/ exposed? If they
are always exposed when the chip is "alive", then I suggest that the
POR wording is dropped, otherwise that the above is reworded to
describe when the register are no longer exposed.

> configured to:
>  - Disabled interrupts on bus locked up detection
>  - Enable bus locked-up clearing
>  - Disconnect only locked bus instead of all channels
> 
> While the MAX7357/MAX7358 have interrupt support, they don't act as
> interrupt controller like the PCA9545 does. Thus don't enable IRQ support
> and handle them like the PCA9548.
> 
> Tested using the MAX7357 and verified that the stalled bus is disconnected
> while the other channels remain operational.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  drivers/i2c/muxes/Kconfig           |  4 +-
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 92 +++++++++++++++++++++++++++--
>  2 files changed, 90 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
> index 1708b1a82da2..2ac99d044199 100644
> --- a/drivers/i2c/muxes/Kconfig
> +++ b/drivers/i2c/muxes/Kconfig
> @@ -65,11 +65,11 @@ config I2C_MUX_PCA9541
>  	  will be called i2c-mux-pca9541.
>  
>  config I2C_MUX_PCA954x
> -	tristate "NXP PCA954x and PCA984x I2C Mux/switches"
> +	tristate "NXP PCA954x/PCA984x and Maxim MAX735x/MAX736x I2C Mux/switches"
>  	depends on GPIOLIB || COMPILE_TEST
>  	help
>  	  If you say yes here you get support for the NXP PCA954x
> -	  and PCA984x I2C mux/switch devices.
> +	  and PCA984x and Maxim MAX735x/MAX736x I2C mux/switch devices.

and and and... :-) Maybe like this?

	  If you say yes here you get support for NXP PCA954x/PCA984x
	  and Maxim MAX735x/MAX736x I2C mux/switch devices.

>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-mux-pca954x.
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 4ad665757dd8..33b9a6a1fffa 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (c) 2008-2009 Rodolfo Giometti <giometti@linux.it>
>   * Copyright (c) 2008-2009 Eurotech S.p.A. <info@eurotech.it>
> + * Copyright (c) 2022 Patrick Rudolph <patrick.rudolph@9elements.com>
>   *
>   * This module supports the PCA954x and PCA984x series of I2C multiplexer/switch
>   * chips made by NXP Semiconductors.
> @@ -11,6 +12,12 @@
>   *	 PCA9540, PCA9542, PCA9543, PCA9544, PCA9545, PCA9546, PCA9547,
>   *	 PCA9548, PCA9846, PCA9847, PCA9848 and PCA9849.
>   *
> + * It's also compatible to Maxims MAX735x I2C switch chips, which are controlled
> + * as the NXP PCA9548 and the MAX736x chips that act like the PCA9544.
> + *
> + * This includes the:
> + *	 MAX7356, MAX7357, MAX7358, MAX7367, MAX7368 and MAX7369
> + *
>   * These chips are all controlled via the I2C bus itself, and all have a
>   * single 8-bit register. The upstream "parent" bus fans out to two,
>   * four, or eight downstream busses or channels; which of these
> @@ -50,7 +57,30 @@
>  
>  #define PCA954X_IRQ_OFFSET 4
>  
> +/*
> + * MAX7357 exposes 7 registers on POR which allow to configure additional
> + * features. Disable interrupts, enable bus locked-up clearing,
> + * isolate only the locked channel instead of all channels.

Same MAX7358 and POR comments as above.

The way I understands things are:

 * MAX7357/MAX7358 exposes 7 registers which allow setup of
 * enhanced mode features. The first of these registers is the
 * switch control register that is present in some form on all
 * chips supported by this driver.
 * The second register is the configuration register, which allows
 * to configure additional features. E.g. disable interrupts,
 * enable bus locked-up clearing and isolate only the locked
 * channel instead of all channels.
 * The remaining 5 registers are left as is by this driver.

> + */
> +#define MAX7357_CONF_INT_ENABLE			BIT(0)
> +#define MAX7357_CONF_FLUSH_OUT			BIT(1)
> +#define MAX7357_CONF_RELEASE_INT		BIT(2)
> +#define MAX7357_CONF_LOCK_UP_CLEAR		BIT(3)
> +#define MAX7357_CONF_DISCON_SINGLE_CHAN		BIT(4)
> +#define MAX7357_CONF_BUS_LOCKUP_DETECTION	BIT(5)
> +#define MAX7357_CONF_ENABLE_BASIC_MODE		BIT(6)
> +#define MAX7357_CONF_PRECONNECT_TEST		BIT(7)
> +
> +#define MAX7357_CONF_DEFAULTS (MAX7357_CONF_FLUSH_OUT | \
> +	 MAX7357_CONF_DISCON_SINGLE_CHAN)
> +
>  enum pca_type {
> +	max_7367,
> +	max_7368,
> +	max_7369,
> +	max_7356,
> +	max_7357,
> +	max_7358,
>  	pca_9540,
>  	pca_9542,
>  	pca_9543,
> @@ -69,6 +99,7 @@ struct chip_desc {
>  	u8 nchans;
>  	u8 enable;	/* used for muxes only */
>  	u8 has_irq;
> +	u8 max7357;

Perhaps maxim_enhanced_mode is a better name?

>  	enum muxtype {
>  		pca954x_ismux = 0,
>  		pca954x_isswi
> @@ -90,8 +121,42 @@ struct pca954x {
>  	raw_spinlock_t lock;
>  };
>  
> -/* Provide specs for the PCA954x types we know about */
> +/* Provide specs for the PCA954x and MAX735x types we know about */
>  static const struct chip_desc chips[] = {
> +	[max_7356] = {
> +		.nchans = 8,
> +		.muxtype = pca954x_isswi,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +	},
> +	[max_7357] = {
> +		.nchans = 8,
> +		.muxtype = pca954x_isswi,
> +		.max7357 = 1,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +	},
> +	[max_7358] = {
> +		.nchans = 8,
> +		.muxtype = pca954x_isswi,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +	},
> +	[max_7367] = {
> +		.nchans = 4,
> +		.muxtype = pca954x_isswi,
> +		.has_irq = 1,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +	},
> +	[max_7368] = {
> +		.nchans = 4,
> +		.muxtype = pca954x_isswi,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +	},
> +	[max_7369] = {
> +		.nchans = 4,
> +		.enable = 0x4,
> +		.muxtype = pca954x_ismux,
> +		.has_irq = 1,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +	},
>  	[pca_9540] = {
>  		.nchans = 2,
>  		.enable = 0x4,
> @@ -177,6 +242,12 @@ static const struct chip_desc chips[] = {
>  };
>  
>  static const struct i2c_device_id pca954x_id[] = {
> +	{ "max7356", max_7356 },
> +	{ "max7357", max_7357 },
> +	{ "max7358", max_7358 },
> +	{ "max7367", max_7367 },
> +	{ "max7368", max_7368 },
> +	{ "max7369", max_7369 },
>  	{ "pca9540", pca_9540 },
>  	{ "pca9542", pca_9542 },
>  	{ "pca9543", pca_9543 },
> @@ -194,6 +265,12 @@ static const struct i2c_device_id pca954x_id[] = {
>  MODULE_DEVICE_TABLE(i2c, pca954x_id);
>  
>  static const struct of_device_id pca954x_of_match[] = {
> +	{ .compatible = "maxim,max7356", .data = &chips[max_7356] },
> +	{ .compatible = "maxim,max7357", .data = &chips[max_7357] },
> +	{ .compatible = "maxim,max7358", .data = &chips[max_7358] },
> +	{ .compatible = "maxim,max7367", .data = &chips[max_7367] },
> +	{ .compatible = "maxim,max7368", .data = &chips[max_7368] },
> +	{ .compatible = "maxim,max7369", .data = &chips[max_7369] },
>  	{ .compatible = "nxp,pca9540", .data = &chips[pca_9540] },
>  	{ .compatible = "nxp,pca9542", .data = &chips[pca_9542] },
>  	{ .compatible = "nxp,pca9543", .data = &chips[pca_9543] },
> @@ -401,9 +478,16 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
>  	else
>  		data->last_chan = 0; /* Disconnect multiplexer */
>  
> -	ret = i2c_smbus_write_byte(client, data->last_chan);
> -	if (ret < 0)
> -		data->last_chan = 0;
> +	if (data->chip->max7357) {
> +		ret = i2c_smbus_write_byte_data(client, data->last_chan,
> +						MAX7357_CONF_DEFAULTS);
> +		if (ret < 0)
> +			data->last_chan = 0;
> +	} else {
> +		ret = i2c_smbus_write_byte(client, data->last_chan);
> +		if (ret < 0)
> +			data->last_chan = 0;
> +	}
>  
>  	return ret;
>  }

The actual code is simple enough, and looks good.

Cheers,
Peter
