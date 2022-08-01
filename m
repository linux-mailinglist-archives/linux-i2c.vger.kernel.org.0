Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4D0D586C9A
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Aug 2022 16:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232351AbiHAOJ5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Aug 2022 10:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbiHAOJ4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Aug 2022 10:09:56 -0400
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10048.outbound.protection.outlook.com [40.107.1.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5978422503;
        Mon,  1 Aug 2022 07:09:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9eY19nqnkuKvoRoQFFDxSUIwafynOntrasLT99vl+OPma6CRv6bJvT36NhhNyYPD29XNXgUjrJvl9oke8cWOpbeGVa8IUQCcD6rvr8CwkSAAR80lloiMpNiaR//siylExxNnLvhfVQNXblFtbuIApn90M1HZU7NUCWk1jHBKB6IQUYtV0mBrE440NPIOVqn+lpkaSQwIz6G8vv1+bWEGq2/fPI1o+SrPFtujzk70sEBvyDp51Bs4mVnwDCUSjCWvc6o4i6Pw6UGThXo3AZHdnJgZyKFqB2MyzGlFamqyNent4LP3QbKWV4yUil9BS8xP5Ymyp2pFTsRozPBiTulKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lO2ti0xrXuiUpEgghWxqTJun3FuMKD4J0qbpuUs7wU=;
 b=G3z1M+OTXAJdxJ+G78gIiLFPq855cnMBvHgyn7aHHPVoSPvJdt0EDikSIAz5RFxrgtkmD/LjTOfqwNkLQiLZuBVn0s/nyG6Om8fcfC03lTeP9i7pM9oxVqRcs8XCkqLkWycY9DxAKfY1ztAUJ+rQgZj+P1mUlhpFWMAzlvnieNgRPr9xJBerPiix7W1vfQg3qin5hxq0RclOUXGBDh+laI4JW1VZzhcMmzcf3kP4+3ZMV0JOW6vXImo8H3BbbLqb9qi5Ae4+NMS16ZFrNY0jkzprM0EZ7Yb9FIh/AKGwDwijbJS7dXGizAA033P8yRo7/8IfE5wDUnRH02ywGGORew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lO2ti0xrXuiUpEgghWxqTJun3FuMKD4J0qbpuUs7wU=;
 b=Mv7wisxXC5kXialBBWxzpS9eeOkKZhG483oLhTGdAT76ZxYyad0EA0p/gSI7SL88mZu4S1uudRsvTBTr37AT3LKw5S21ocM5QybuEEaBmPMCQgtHoNyr2X24n/U/0CiXmnR+sn3gFaTLFiTYkRLawNfZHIqc/jPBI1CxHYlLUaWhatTCf7IBK+zCHD8AXCP2XsuShWzQOY5RBdq/1CVTFzImMx3QAFTwMAoYNUjYFRVaPK4xlTYcbxBJJiojqqjyIaUsBLk8gKpdxnTUVjQj/XupPjkwxeBEkPtJM0KxQBLXyUMcymr/M64eBVs2Njuutk0GkSQ7jmj/dy76eFebOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by DU0PR10MB6020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Mon, 1 Aug
 2022 14:09:51 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::75ee:d5d2:6b1d:150b]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::75ee:d5d2:6b1d:150b%3]) with mapi id 15.20.5482.012; Mon, 1 Aug 2022
 14:09:51 +0000
Date:   Mon, 1 Aug 2022 16:09:48 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v6 12/12] leds: simatic-ipc-leds-gpio: add GPIO version
 of Siemens driver
Message-ID: <20220801160948.1bb59da2@md1za8fc.ad001.siemens.net>
In-Reply-To: <20220606164138.66535-13-andriy.shevchenko@linux.intel.com>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
        <20220606164138.66535-13-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::10) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 517d2377-81ec-4d5c-ca82-08da73c78029
X-MS-TrafficTypeDiagnostic: DU0PR10MB6020:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 45eXAGW/MvtIHRMyNQrEu9oOJOiA3kDbXD4KLYSXSArWtmkdL/J2VjkA2nMGjEvSFVb5zKx6FOZNyenk0UNgBMovjfyKYQi/GxI7ClTNPgO4TQpXLsBvU0+4m0yBivtvtdSlZu9MSs0ukYqRuHq4BN56Vre6I5Vvm5Eiy9XFc/bpSTJIXrTjScrp7X+PNNbcFiaHKyeD2rmbcStEfLYwt8LFK73h/5BIP3elr3YhIlpUj3LbExHDINUOgmYip8ZRRRXmMXIUnAk6WOp7q1FuyblkpEn49tW9gAE7qUQQIppS13rmpWWdVl347FFCnZeoEcmaDmCCTcCCaY8FkCoJqJjIW+jasqlwbcWKz7Msic08WRfkHdLjMIxnuQ3H3HNc8A8K6syIVGTRD0IYtEEBfJ/YuNmhzhx/46UTjh/aYSI0YYufp1nNvPlh7xuHSoRKLJ35Ouyu/iRVROpWYT2pR826MG8txSuwBe2cmOaAsEetfGU2EZuM7YLqgKIjdXBxZW5TkjCpW8Nixqd6MY/lT9IP4+rEUEImbZ191q2+hS+F4eC3K0NBwgjKgepNCrVqJ8FAWQffunJmHN1Bw5vbg6KtZraSF3tvy7Xi/KPTYwle3Isk/RDsvdmEh3zxZRkv/iKzfxOsM2y+QJubcBryh2BrISIBjW/1g4DO3ZvUaiX547rn8ndZdJ66YTuiMLJ0R6fi4udyxdIh7hcXDO4IfrQYRug8DUUJbQEuICqaeobMq3G25Ojn9j0CI0YusDor
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(6666004)(6486002)(41300700001)(478600001)(26005)(6506007)(6512007)(9686003)(83380400001)(1076003)(44832011)(8936002)(5660300002)(30864003)(186003)(7416002)(316002)(6916009)(54906003)(66476007)(66946007)(66556008)(4326008)(8676002)(2906002)(38100700002)(82960400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rM3b8P6/VM9tNeL1b0Ny8BkSm/eWZmGzX7jPx2XJhKjF/zvWgGF+S6hpwP75?=
 =?us-ascii?Q?iImUA1YQ0n3jjm89DMEZ+JmQrkdglQ7zFSQ87uTSBKHAZLOI7Iblr9Oqv792?=
 =?us-ascii?Q?+OLZY6h0BP1t116+tPIIpXhudXq1hjOD0hEXME2mcDVJPzf29kwEDN0BpDbo?=
 =?us-ascii?Q?Af9WIm7CG3QRduZThcWYgpvYiktLLkM4S8dklv4xoM2msWILfCA010GT26Gx?=
 =?us-ascii?Q?NIrv2abxOv8X2Too6kKriick83iXZ6usVgJ16TWfFLXiP3TGLqQ86MSpEK4g?=
 =?us-ascii?Q?Z+t4xuuPhU+qruW28xHm9r0Udb0HTRc6hXAhs/J5/hBgpevXA2sF8nNAyvOA?=
 =?us-ascii?Q?/ZtC2WTQ0NX6v9WKbAQEpr7QWxXOkbRydZtA7Y0V9g0RTV6wqzzo2ngvwO61?=
 =?us-ascii?Q?l5g5JBSjYgsthVKZgpjz5D8RBUQ1PyURar4ToeRNHlgcb0gQxAnv59/6tCW2?=
 =?us-ascii?Q?n8hp5/UxLP+NU58rkmzPK/POY5ZrRIM2W40QU0Yq3IH+q7s8RavHKAIa7V64?=
 =?us-ascii?Q?zhYtap2DScttFxj65Z6M5rALY6JcLbQLbZVU7K8ewZpAosdcwhoU/wY/a4WQ?=
 =?us-ascii?Q?fzheAWNpw96irIJSU8rllQwJl0LrqpVIRwm8d/rpSgucfu/WLrb5+3clBUpd?=
 =?us-ascii?Q?vZjFpzLFlTG6gZuvOnXZqPmcj409hJ534sbpK/iVXPWnhMBa8Y/BNfALGZnv?=
 =?us-ascii?Q?RRiJ9vLHHqNkLY8fTKKXBoUYMKk5/4et23zaKi+MhBVYzNf2zKIKXEtMzHbU?=
 =?us-ascii?Q?2AMwJli60yyyoiwwANI5TxcQQdd9y+kjBeEX7GWWv6YbBU1UBZxJQc03nmI2?=
 =?us-ascii?Q?dKZ/rmYNwqBhytHQarA1uGQG9zriu6fIJP2ZpWZUc5/T0e2cRY9ZxioTfYfe?=
 =?us-ascii?Q?yjndinDy1bV+Sbqr8ozFPFQia5i006GgoMN0m2ZTuzpi2M5prWHN9P16igPs?=
 =?us-ascii?Q?cP+A5b5oSHw+Y2HJX7fWTkg5G3l+ms6ndPbSSvT0iYQsau4fdQ0S/hHLoQOU?=
 =?us-ascii?Q?2k5XM9twKSFzP+j07zNljUBcw183KAttJUu2hRubi8xZdgPGdT+ALwgthYw+?=
 =?us-ascii?Q?egrQnOhyviZ2oUe2WTQc767/IuGmoYx49h6I6UL9kQuoo8NAzdUs/VBrQzOG?=
 =?us-ascii?Q?hK+Z+XOkxf97IwfMRBmifXSSOLoy+zrPPY5Pr06uyLGuPij6HBFs7GLY+pNH?=
 =?us-ascii?Q?Rk2jtg0wZiqcJ2rk4MFWILnSq6/rXk0ENHe5DlF7jiOzbTVSqvBaxUwg/crY?=
 =?us-ascii?Q?/sN27UxWBkNp39FYFrDMo8cHS2qLGU0nG2QfzgMqAYH91OSGUWz7vO+xdxQp?=
 =?us-ascii?Q?egmurVNCct3YWpt9o8IICQ2OjD6oRPKIbKfFWrNUOtRrDqNGpxP6X83yXFgY?=
 =?us-ascii?Q?0esfWMfimazgix0hJ47WQXUza3jWR7oh/hwLbHeQtbuazHniyMy/pwh1ZI4j?=
 =?us-ascii?Q?frBTQOSJzsxj+S0NzqxhMazHOuJRVN6EcvAGHDykVUhT6SKSczi0qCa9D8zN?=
 =?us-ascii?Q?XMwMhQo/6Z88RzrtG8zIDXAd67hK2rDl8VjjNJ72BUA851dqecEpnAa/c7pS?=
 =?us-ascii?Q?x184jdRkTw4nD4EVVIoW/z3NeAS4s1YcvaJqhbqzrjYu9vfgkR0fdfw+uhUM?=
 =?us-ascii?Q?lg=3D=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 517d2377-81ec-4d5c-ca82-08da73c78029
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 14:09:51.3973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2op8EbdR/0TilD9AQf0idMmO93i96vLy2DyjDIewPeqdrgWG+eqLlysomCocS2RxbAXEZYciE5TaAY5ZxlScZoAJK+IRktm8tt8cpysGjoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6020
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Mon,  6 Jun 2022 19:41:38 +0300
schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:

> From: Henning Schild <henning.schild@siemens.com>
> 
> On Apollo Lake the pinctrl drivers will now come up without ACPI. Use
> that instead of open coding it.
> Create a new driver for that which can later be filled with more GPIO
> based models, and which has different dependencies.
> 
> Signed-off-by: Henning Schild <henning.schild@siemens.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/leds/simple/Kconfig                 |   7 +-
>  drivers/leds/simple/Makefile                |   1 +
>  drivers/leds/simple/simatic-ipc-leds-gpio.c | 105
> ++++++++++++++++++++ drivers/leds/simple/simatic-ipc-leds.c      |
> 80 +-------------- drivers/platform/x86/simatic-ipc.c          |   5
> +- 5 files changed, 117 insertions(+), 81 deletions(-)
>  create mode 100644 drivers/leds/simple/simatic-ipc-leds-gpio.c
> 
> diff --git a/drivers/leds/simple/Kconfig b/drivers/leds/simple/Kconfig
> index bbf8cff3c3f6..fd2b8225d926 100644
> --- a/drivers/leds/simple/Kconfig
> +++ b/drivers/leds/simple/Kconfig
> @@ -1,12 +1,11 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config LEDS_SIEMENS_SIMATIC_IPC
>  	tristate "LED driver for Siemens Simatic IPCs"
> -	depends on LEDS_CLASS
> +	depends on LEDS_GPIO
>  	depends on SIEMENS_SIMATIC_IPC
> -	select P2SB
>  	help
>  	  This option enables support for the LEDs of several
> Industrial PCs from Siemens.
>  
> -	  To compile this driver as a module, choose M here: the
> module
> -	  will be called simatic-ipc-leds.
> +	  To compile this driver as a module, choose M here: the
> modules
> +	  will be called simatic-ipc-leds and simatic-ipc-leds-gpio.
> diff --git a/drivers/leds/simple/Makefile
> b/drivers/leds/simple/Makefile index 8481f1e9e360..1c7ef5e1324b 100644
> --- a/drivers/leds/simple/Makefile
> +++ b/drivers/leds/simple/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+= simatic-ipc-leds.o
> +obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+=
> simatic-ipc-leds-gpio.o diff --git
> a/drivers/leds/simple/simatic-ipc-leds-gpio.c
> b/drivers/leds/simple/simatic-ipc-leds-gpio.c new file mode 100644
> index 000000000000..4c9e663a90ba --- /dev/null
> +++ b/drivers/leds/simple/simatic-ipc-leds-gpio.c
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Siemens SIMATIC IPC driver for GPIO based LEDs
> + *
> + * Copyright (c) Siemens AG, 2022
> + *
> + * Authors:
> + *  Henning Schild <henning.schild@siemens.com>
> + */
> +
> +#include <linux/gpio/machine.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +static struct gpiod_lookup_table simatic_ipc_led_gpio_table = {
> +	.dev_id = "leds-gpio",
> +	.table = {
> +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 51, NULL, 0,
> GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 52, NULL, 1,
> GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 53, NULL, 2,
> GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 57, NULL, 3,
> GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 58, NULL, 4,
> GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 60, NULL, 5,
> GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 56, NULL, 6,
> GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 59, NULL, 7,
> GPIO_ACTIVE_HIGH),
> +	},
> +};
> +
> +static const struct gpio_led simatic_ipc_gpio_leds[] = {
> +	{ .name = "green:" LED_FUNCTION_STATUS "-3" },
> +	{ .name = "red:" LED_FUNCTION_STATUS "-1" },
> +	{ .name = "green:" LED_FUNCTION_STATUS "-1" },
> +	{ .name = "red:" LED_FUNCTION_STATUS "-2" },
> +	{ .name = "green:" LED_FUNCTION_STATUS "-2" },
> +	{ .name = "red:" LED_FUNCTION_STATUS "-3" },
> +};
> +
> +static const struct gpio_led_platform_data
> simatic_ipc_gpio_leds_pdata = {
> +	.num_leds	= ARRAY_SIZE(simatic_ipc_gpio_leds),
> +	.leds		= simatic_ipc_gpio_leds,
> +};
> +
> +static struct platform_device *simatic_leds_pdev;
> +
> +static int simatic_ipc_leds_gpio_remove(struct platform_device *pdev)
> +{
> +	gpiod_remove_lookup_table(&simatic_ipc_led_gpio_table);
> +	platform_device_unregister(simatic_leds_pdev);
> +
> +	return 0;
> +}
> +
> +static int simatic_ipc_leds_gpio_probe(struct platform_device *pdev)
> +{
> +	struct gpio_desc *gpiod;
> +	int err;
> +
> +	gpiod_add_lookup_table(&simatic_ipc_led_gpio_table);
> +	simatic_leds_pdev = platform_device_register_resndata(NULL,
> +		"leds-gpio", PLATFORM_DEVID_NONE, NULL, 0,
> +		&simatic_ipc_gpio_leds_pdata,
> +		sizeof(simatic_ipc_gpio_leds_pdata));

If those GPIOs can not be found that leads to a pretty severe
logging/polling endless loop.

...
[   34.017017] leds-gpio leds-gpio: Skipping unavailable LED gpio 0 (red:status-2)
[   34.017038] leds-gpio leds-gpio: cannot find GPIO chip apollolake-pinctrl.0, deferring
[   34.017158] leds-gpio leds-gpio: Skipping unavailable LED gpio 0 (red:status-2)
[   34.017161] leds-gpio leds-gpio: cannot find GPIO chip apollolake-pinctrl.0, deferring
[   34.017163] leds-gpio leds-gpio: Skipping unavailable LED gpio 0 (green:status-2)
[   34.017166] leds-gpio leds-gpio: cannot find GPIO chip apollolake-pinctrl.0, deferring
[   34.017168] leds-gpio leds-gpio: Skipping unavailable LED gpio 0 (red:status-3)
[   34.017179] leds-gpio leds-gpio: cannot find GPIO chip apollolake-pinctrl.0, deferring
[   34.017275] leds-gpio leds-gpio: cannot find GPIO chip apollolake-pinctrl.0, deferring
[   34.017279] leds-gpio leds-gpio: Skipping unavailable LED gpio 0 (green:status-3)
... 

This can be seen when the kernel is build without
CONFIG_PINCTRL_BROXTON. Can anyone please give advise on how to proceed
here.

I could do something like i proposed in "[PATCH 3/4] leds:
simatic-ipc-leds-gpio: add new model 227G".

if (!IS_ENABLED(CONFIG_PINCTRL_BROXTON)) return -ENO...

before registering the platform device.

An alternative could be to try and handle that -EPROBE_DEFER but that
might be hard because it might well fail a couple of times before
eventually that gpio driver is up, so i think i will send an update
implementing that !IS_ENABLED.

Ideally the gpio subsystem or leds-gpio would break that
polling/printing loop for me, or make sure it would not happen in the
first place.

regards,
Henning

> +	if (IS_ERR(simatic_leds_pdev)) {
> +		err = PTR_ERR(simatic_leds_pdev);
> +		goto out;
> +	}
> +
> +	/* PM_BIOS_BOOT_N */
> +	gpiod = gpiod_get_index(&simatic_leds_pdev->dev, NULL, 6,
> GPIOD_OUT_LOW);
> +	if (IS_ERR(gpiod)) {
> +		err = PTR_ERR(gpiod);
> +		goto out;
> +	}
> +	gpiod_put(gpiod);
> +
> +	/* PM_WDT_OUT */
> +	gpiod = gpiod_get_index(&simatic_leds_pdev->dev, NULL, 7,
> GPIOD_OUT_LOW);
> +	if (IS_ERR(gpiod)) {
> +		err = PTR_ERR(gpiod);
> +		goto out;
> +	}
> +	gpiod_put(gpiod);
> +
> +	return 0;
> +out:
> +	simatic_ipc_leds_gpio_remove(pdev);
> +
> +	return err;
> +}
> +
> +static struct platform_driver simatic_ipc_led_gpio_driver = {
> +	.probe = simatic_ipc_leds_gpio_probe,
> +	.remove = simatic_ipc_leds_gpio_remove,
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +	}
> +};
> +module_platform_driver(simatic_ipc_led_gpio_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:" KBUILD_MODNAME);
> +MODULE_SOFTDEP("pre: platform:leds-gpio");
> +MODULE_AUTHOR("Henning Schild <henning.schild@siemens.com>");
> diff --git a/drivers/leds/simple/simatic-ipc-leds.c
> b/drivers/leds/simple/simatic-ipc-leds.c index
> 2e7597c143d8..4894c228c165 100644 ---
> a/drivers/leds/simple/simatic-ipc-leds.c +++
> b/drivers/leds/simple/simatic-ipc-leds.c @@ -15,7 +15,6 @@
>  #include <linux/leds.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> -#include <linux/platform_data/x86/p2sb.h>
>  #include <linux/platform_data/x86/simatic-ipc-base.h>
>  #include <linux/platform_device.h>
>  #include <linux/sizes.h>
> @@ -24,7 +23,7 @@
>  #define SIMATIC_IPC_LED_PORT_BASE	0x404E
>  
>  struct simatic_ipc_led {
> -	unsigned int value; /* mask for io and offset for mem */
> +	unsigned int value; /* mask for io */
>  	char *name;
>  	struct led_classdev cdev;
>  };
> @@ -39,21 +38,6 @@ static struct simatic_ipc_led
> simatic_ipc_leds_io[] = { { }
>  };
>  
> -/* the actual start will be discovered with p2sb, 0 is a placeholder
> */ -static struct resource simatic_ipc_led_mem_res =
> DEFINE_RES_MEM_NAMED(0, 0, KBUILD_MODNAME); -
> -static void __iomem *simatic_ipc_led_memory;
> -
> -static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
> -	{0x500 + 0x1A0, "red:" LED_FUNCTION_STATUS "-1"},
> -	{0x500 + 0x1A8, "green:" LED_FUNCTION_STATUS "-1"},
> -	{0x500 + 0x1C8, "red:" LED_FUNCTION_STATUS "-2"},
> -	{0x500 + 0x1D0, "green:" LED_FUNCTION_STATUS "-2"},
> -	{0x500 + 0x1E0, "red:" LED_FUNCTION_STATUS "-3"},
> -	{0x500 + 0x198, "green:" LED_FUNCTION_STATUS "-3"},
> -	{ }
> -};
> -
>  static struct resource simatic_ipc_led_io_res =
>  	DEFINE_RES_IO_NAMED(SIMATIC_IPC_LED_PORT_BASE, SZ_2,
> KBUILD_MODNAME); 
> @@ -89,28 +73,6 @@ static enum led_brightness
> simatic_ipc_led_get_io(struct led_classdev *led_cd) return
> inw(SIMATIC_IPC_LED_PORT_BASE) & led->value ? LED_OFF :
> led_cd->max_brightness; } 
> -static void simatic_ipc_led_set_mem(struct led_classdev *led_cd,
> -				    enum led_brightness brightness)
> -{
> -	struct simatic_ipc_led *led = cdev_to_led(led_cd);
> -	void __iomem *reg = simatic_ipc_led_memory + led->value;
> -	u32 val;
> -
> -	val = readl(reg);
> -	val = (val & ~1) | (brightness == LED_OFF);
> -	writel(val, reg);
> -}
> -
> -static enum led_brightness simatic_ipc_led_get_mem(struct
> led_classdev *led_cd) -{
> -	struct simatic_ipc_led *led = cdev_to_led(led_cd);
> -	void __iomem *reg = simatic_ipc_led_memory + led->value;
> -	u32 val;
> -
> -	val = readl(reg);
> -	return (val & 1) ? LED_OFF : led_cd->max_brightness;
> -}
> -
>  static int simatic_ipc_leds_probe(struct platform_device *pdev)
>  {
>  	const struct simatic_ipc_platform *plat =
> pdev->dev.platform_data; @@ -118,9 +80,7 @@ static int
> simatic_ipc_leds_probe(struct platform_device *pdev) struct
> simatic_ipc_led *ipcled; struct led_classdev *cdev;
>  	struct resource *res;
> -	void __iomem *reg;
> -	int err, type;
> -	u32 val;
> +	int err;
>  
>  	switch (plat->devmode) {
>  	case SIMATIC_IPC_DEVICE_227D:
> @@ -135,51 +95,19 @@ static int simatic_ipc_leds_probe(struct
> platform_device *pdev) }
>  			ipcled = simatic_ipc_leds_io;
>  		}
> -		type = IORESOURCE_IO;
>  		if (!devm_request_region(dev, res->start,
> resource_size(res), KBUILD_MODNAME)) { dev_err(dev, "Unable to
> register IO resource at %pR\n", res); return -EBUSY;
>  		}
>  		break;
> -	case SIMATIC_IPC_DEVICE_127E:
> -		res = &simatic_ipc_led_mem_res;
> -		ipcled = simatic_ipc_leds_mem;
> -		type = IORESOURCE_MEM;
> -
> -		err = p2sb_bar(NULL, 0, res);
> -		if (err)
> -			return err;
> -
> -		/* do the final address calculation */
> -		res->start = res->start + (0xC5 << 16);
> -		res->end = res->start + SZ_4K - 1;
> -
> -		simatic_ipc_led_memory = devm_ioremap_resource(dev,
> res);
> -		if (IS_ERR(simatic_ipc_led_memory))
> -			return PTR_ERR(simatic_ipc_led_memory);
> -
> -		/* initialize power/watchdog LED */
> -		reg = simatic_ipc_led_memory + 0x500 + 0x1D8; /*
> PM_WDT_OUT */
> -		val = readl(reg);
> -		writel(val & ~1, reg);
> -
> -		reg = simatic_ipc_led_memory + 0x500 + 0x1C0; /*
> PM_BIOS_BOOT_N */
> -		val = readl(reg);
> -		writel(val | 1, reg);
> -		break;
>  	default:
>  		return -ENODEV;
>  	}
>  
>  	while (ipcled->value) {
>  		cdev = &ipcled->cdev;
> -		if (type == IORESOURCE_MEM) {
> -			cdev->brightness_set =
> simatic_ipc_led_set_mem;
> -			cdev->brightness_get =
> simatic_ipc_led_get_mem;
> -		} else {
> -			cdev->brightness_set =
> simatic_ipc_led_set_io;
> -			cdev->brightness_get =
> simatic_ipc_led_get_io;
> -		}
> +		cdev->brightness_set = simatic_ipc_led_set_io;
> +		cdev->brightness_get = simatic_ipc_led_get_io;
>  		cdev->max_brightness = LED_ON;
>  		cdev->name = ipcled->name;
>  
> diff --git a/drivers/platform/x86/simatic-ipc.c
> b/drivers/platform/x86/simatic-ipc.c index 26c35e1660cb..ca3647b751d5
> 100644 --- a/drivers/platform/x86/simatic-ipc.c
> +++ b/drivers/platform/x86/simatic-ipc.c
> @@ -51,6 +51,7 @@ static int register_platform_devices(u32 station_id)
>  {
>  	u8 ledmode = SIMATIC_IPC_DEVICE_NONE;
>  	u8 wdtmode = SIMATIC_IPC_DEVICE_NONE;
> +	char *pdevname = KBUILD_MODNAME "_leds";
>  	int i;
>  
>  	platform_data.devmode = SIMATIC_IPC_DEVICE_NONE;
> @@ -64,10 +65,12 @@ static int register_platform_devices(u32
> station_id) }
>  
>  	if (ledmode != SIMATIC_IPC_DEVICE_NONE) {
> +		if (ledmode == SIMATIC_IPC_DEVICE_127E)
> +			pdevname = KBUILD_MODNAME "_leds_gpio";
>  		platform_data.devmode = ledmode;
>  		ipc_led_platform_device =
>  			platform_device_register_data(NULL,
> -				KBUILD_MODNAME "_leds",
> PLATFORM_DEVID_NONE,
> +				pdevname, PLATFORM_DEVID_NONE,
>  				&platform_data,
>  				sizeof(struct simatic_ipc_platform));
>  		if (IS_ERR(ipc_led_platform_device))

