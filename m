Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D38C4D0661
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Mar 2022 19:22:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244770AbiCGSWu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Mar 2022 13:22:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244750AbiCGSWs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Mar 2022 13:22:48 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2057.outbound.protection.outlook.com [40.107.22.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23FE88EB62;
        Mon,  7 Mar 2022 10:21:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKu1h0YkEBpaSIj/LRTrApHQpXHTGQ8i6cy7x8o3mcC020TjArJHj3xbSRwoXr07qny5/NyCFTPKZ7zxRD/kFp0ZkR6DiWkgl6fp2k8aCcuy/JyNFBXdjZ8PNlxAjW6gc0ghjgH8FALW1PTWbB9nlTgX8IUOlDPjE3VPpwUscKjORFyO7sw30/H4u1kkyJ0mX0yqK/yeo2AxsWscJWi3VOH9V8ufPsZV1+GbWIYWsSPe+Egn/9KI0ZkeI1DbLhpRXnjlPT+pIZX3E4pSbkboi6TGyEb5uGB5vdyVOcTujrfkmyzRF1GsaY5lm1Qg8lipPC2jwmcmvYqITR01zlgIOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTwpdlm3WQOWuVKA7A3iq8vTeeshQul8+q9/nSglbwA=;
 b=XrJzsEV7fJf0Jxo4WOLnnPlHQgztzt3ds0/8ZW44kkN0ArEYMupajcwXpiHk7/lta/XyHaPrhoCRtiCUWyVvPfBsJ7jM91tO7PG+w+D1pGdBly6yi1tss79atZ2NQiMRwQ6PHycpzYPR2s3FTOWo5BrnC1QOg3L6XXpY+gRiRqRV4U8ce2Tdp5MC3gjNO4JuI/NfnXTOsKr1KeFr3rt7Mo8GObZqVFHrcdU516FIW7zxoKoZ4UEtCR2dA9IpOZtnzFv0fxo/EXarnXZ1xxgEbQrRNiJ/Wks/nHdZsQ/5BUiwXRroYVHhxTazZ0lk3/YF5kAOK8eQ1mrPwdlO1+cBlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTwpdlm3WQOWuVKA7A3iq8vTeeshQul8+q9/nSglbwA=;
 b=bheLpUo6vSJ8Zn/oe/lH3VdBvEZeH79BNvUKK4r5Tou337BH28ecCX0SO55obRlLUUS05pJtTL3D77dLXo9bolVwkktBVubtbGIXrx3Ye/EekqiHR57wDdUC+NMuSYcjKb88DaJxQe803W/WI+9758xe3wxNoZjgUQb7a273k6roCKGXhr5bOpvK96v5rEWjZXoThHwcvS//gEP7bmWFq0QMEmtIsWQCWUGQoGvtOyjgcI68vdMC/7iNPg0SrIMCHsvGqETiFZb22E0FJJunAMDGcBjqJJ2CVOOlhfn7ZRTLG30Nro///ih/OkKFRN0OliXefaZWKmXT3C4sv/oLxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:155::20)
 by AM0PR10MB1970.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:41::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 18:21:44 +0000
Received: from AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d433:79c4:958b:1551]) by AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d433:79c4:958b:1551%7]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 18:21:44 +0000
Date:   Mon, 7 Mar 2022 19:21:38 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v4 5/8] mfd: lpc_ich: Add support for pinctrl in
 non-ACPI system
Message-ID: <20220307192138.10f5fc32@md1za8fc.ad001.siemens.net>
In-Reply-To: <20220131151346.45792-6-andriy.shevchenko@linux.intel.com>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
        <20220131151346.45792-6-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0039.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::16) To AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:155::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 501aa817-39c6-48a6-520e-08da00675587
X-MS-TrafficTypeDiagnostic: AM0PR10MB1970:EE_
X-Microsoft-Antispam-PRVS: <AM0PR10MB1970CE62B0C132919C35068685089@AM0PR10MB1970.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AUEvlGp6Cr1IfD9wREo29VvgB1bpVjNQB1kTgIwKaoLbcNwJkNm6diOlKEw0WZtGzg9Z6YGyMCKK/ZFijVJ+m4T5gOOF4wvSF0JPyEQhRFQOmi6BN+CXAMAQOO8N+UBQuxg0TaXHzcEmtgzW/w8keWsJckqaAGxOVjp/Nwh7iYiz4buDEhDxBzdHedOjcAD5IU3N+lvZ3E+fQ9w3Iy9em7Bpbb1haMtdSUD3R7NFqKnbH6dIpGTfsWwyT1hYlYZsP9vvSG7eLaVB2hr4epVLTocU5swdP+8qaVyUt1HuaRqr4epHvjKFixDibGc3OC0Zm3JcH6LRnNvn0D/nlmpU1wmFUIZhq9PqLwKseSd+WrJ9Q1D92GQkpmzq+f5Q8xeE49sm6U21k2XmCEwFyRuUhoU6XXrT6clGtekyMFDJLoNTqbJt76ucqQhTn+tpvsXJJbUBbUmmCWzmBU+FHVAljKCdK0ZMnj3eY1SJ31cuElZW0aPI8sYsCCFW3pRNKQ67r2Xm3b9dFaXjHuGJ92WdOV/dTR3Nh2mZrCKD5WKOtMlCYGwzCH+JSVsYtlF6Qr48pyH2hQVv8RpI3wRnrhEBKfc0NpV3PNRmsUGLaXUDcft2dUmjRl0PUpDV9boHwUsid0DbJs/8L5NIwMH+YzcyyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(82960400001)(86362001)(38100700002)(316002)(54906003)(6916009)(2906002)(508600001)(7416002)(4326008)(8936002)(5660300002)(8676002)(44832011)(66556008)(66476007)(66946007)(6506007)(6512007)(6666004)(9686003)(83380400001)(26005)(186003)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zeS3DrAR58Wmglk59Ifbs6bTQuM2rCEeowucHbD4A90KXv1efh47Vf8YGlC1?=
 =?us-ascii?Q?ueY0NtJqHC/B0vmEPuzTGTpIohTNxP9YV1KCI0Rmkx7EgYQBQxBeMfkz3U+C?=
 =?us-ascii?Q?isDl/L25+DRY5CVJi5JLjYG1MGrBf0pdM25OeCzqGLo+VJPVqoZIufETF1uS?=
 =?us-ascii?Q?jd2paf/tX4I1YZ0HmqkWVk5L8wUd4UN6Kdp3S+hKuWv6l1DfFHvM4L5LXrKl?=
 =?us-ascii?Q?qkEoAxs0qTECVmfSFmmKsMsvKS8T3GXSA/K55lOl7Vtso+fu7aN7GlWgVXP9?=
 =?us-ascii?Q?tYL/isVKgpwyJ57iyF+gc2RE+9aloOByBCtpC1em1MJ3qrxChddTHim/69PY?=
 =?us-ascii?Q?kU5BZl0/bbdOmf4popqBDfLegWEIrNx7zinmtv6FjMTR1pU+K7SMAIpFbHl3?=
 =?us-ascii?Q?ds8LQcz8KnoHJsM8ZSNJE2leMMED/MWsc9CRqsn9FxH2ObnXVVCC6xz/PbkH?=
 =?us-ascii?Q?B3N6Hz1k3g3YU80AgPj2+PeK2jHQYyeNMBUOXHBAms4LPNSdKhgEX+aAu38A?=
 =?us-ascii?Q?uMgfmNJqSCAU3UGY5izHJzuW4S2r2ak94g7jQJ7PwF1VtOifYe0uMPrUkbbb?=
 =?us-ascii?Q?EkRubbTREn2yqPZIIbwowi1pPg8Kn9klLDFNtoLMsjLceIQXIvKwQ1V660I6?=
 =?us-ascii?Q?LTsqRgCe9yv8aK6k+QF8F+onZ1ebDSTXlly/rZoNNFSscjkqKq8WbScRHeZE?=
 =?us-ascii?Q?G5SKsSFvNwssFM1mc4Jb5YQpcZdeJ9Y5f8zNIdJyOXduLoMPFaM0nZVGlFCo?=
 =?us-ascii?Q?GMYEO1OovqR+z6LrOkepgFK+0S4UprBNvd52lR+oBko4+KQU8oEvWNjl3SXP?=
 =?us-ascii?Q?oSNuIqGDlCxUZng/G9PqtYid6qK/Uo4C4fMJcvuCBsDksXkX8WuMJ423Ddl/?=
 =?us-ascii?Q?Yhu+e7lMcMv/1MIIzKcCHSAFQMbQ0VyQfqz0lxMYT3gKls9NYbhxbVfGaJ45?=
 =?us-ascii?Q?mSNK0ixmYzAcFX24IzOE5CCoRL8iaiGIDvg6cCJhlyO/stB4WEoSFHFlePua?=
 =?us-ascii?Q?y+zCE6d/cTygM+ZILdO4J78uIiqHjIgCerxNiHEyBHI8L7GrT9Qc5W0uWn5Q?=
 =?us-ascii?Q?KG0J2fol1a8pY4y3rFK3gKUbAKyGMyvz6h+xTWxcpHHg2WNtwql4jL/aYjd8?=
 =?us-ascii?Q?IpKalHZ6KiLevbcE48AGFwEcdT3/zJmIbe0dJz3uRsrK5wYQFePKsZJakMve?=
 =?us-ascii?Q?eLi3eQvRM+ez6rCq4j0z5xF9H9+o2xyc/Bc26a669zRzd4Vrbj0MpE+vAbqf?=
 =?us-ascii?Q?fu2hUJTpCCgiHx9Qj1vVHJR9TlEkHjwoSplXipWD8HUkKCTHiTJt9WGjOkN4?=
 =?us-ascii?Q?moFtRbcxUTzrwYzWjRtsB4EErWa0nL1PV17hD9cnDJ4/Boi9vAN4ewFyMnv4?=
 =?us-ascii?Q?ZiW8HyyQ7PMNc2gNDTxMBdWeWft8bNmhYFm4rA4xx+kkAP0kR4PRCvd0n/Ae?=
 =?us-ascii?Q?4NlfmxAjpQUF+39q3/XE6KIZ/YxgWjjXj8qhMVKnTK4f0aKitlpCyxEVTR+t?=
 =?us-ascii?Q?it9UTkns65yO/7vifQAj+kPux4aeN/UlHdPIFIHV4PycApFfTCMyABnOlFTl?=
 =?us-ascii?Q?9qQH9MNmli0qlji9xTUQZho0d+mkjT1EdJTh3+AVwfQ/JzfBytbbuf/Gf4X5?=
 =?us-ascii?Q?C8k7xX3Rq4sVKPLBDKxkIOjFH/49C1tZq/0j/9nkIJBjTckvsBkuDLl/UCqM?=
 =?us-ascii?Q?HUOV2s3pip6lrxPgq+yGLmiqYZA=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 501aa817-39c6-48a6-520e-08da00675587
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB3459.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 18:21:44.4940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRfCuOVnMaO2oH2yXuNyAS44d2C4tJiECDkxlvIImEIN9s+Xk+GwRxeMD0695qc8k5Bn55knQAlx0obNHcL8C8aGnlfH7eDbYuinkrCEt7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB1970
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Can this patch not be proposed separately? Maybe i am wrong but it
seems unrelated to the p2sb story.

The whole p2sb base and size discovery is easy and switching the
simatic drivers is also. It is an interface change, where the old open
coding remains working.

But having to switch to GPIO in the same series is kind of weird. That
is a functional change which even might deserve its own cover letter. I
bet there are tons of out-of-tree modules which will stop working on
apl after that gets merged.

I still did not understand why apl is special and other boards do not
get their pinctrl brought up without ACPI/p2sb-visible.

I have patches floating around, but still would be happy if we could do
one thing at a time.

Or maybe it is strongly coupled and i do not understand why.

regards,
Henning

Am Mon, 31 Jan 2022 17:13:43 +0200
schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:

> From: Tan Jui Nee <jui.nee.tan@intel.com>
> 
> Add support for non-ACPI systems, such as system that uses
> Advanced Boot Loader (ABL) whereby a platform device has to be created
> in order to bind with pin control and GPIO.
> 
> At the moment, Intel Apollo Lake In-Vehicle Infotainment (IVI) system
> requires a driver to hide and unhide P2SB to lookup P2SB BAR and pass
> the PCI BAR address to GPIO.
> 
> Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
> Co-developed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mfd/lpc_ich.c | 101
> +++++++++++++++++++++++++++++++++++++++++- 1 file changed, 100
> insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
> index 95dca5434917..e1bca5325ce7 100644
> --- a/drivers/mfd/lpc_ich.c
> +++ b/drivers/mfd/lpc_ich.c
> @@ -8,7 +8,8 @@
>   *  Configuration Registers.
>   *
>   *  This driver is derived from lpc_sch.
> -
> + *
> + *  Copyright (c) 2017, 2021-2022 Intel Corporation
>   *  Copyright (c) 2011 Extreme Engineering Solution, Inc.
>   *  Author: Aaron Sierra <asierra@xes-inc.com>
>   *
> @@ -42,6 +43,7 @@
>  #include <linux/errno.h>
>  #include <linux/acpi.h>
>  #include <linux/pci.h>
> +#include <linux/pinctrl/pinctrl.h>
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/lpc_ich.h>
>  #include <linux/platform_data/itco_wdt.h>
> @@ -140,6 +142,70 @@ static struct mfd_cell lpc_ich_gpio_cell = {
>  	.ignore_resource_conflicts = true,
>  };
>  
> +#define APL_GPIO_NORTH		0
> +#define APL_GPIO_NORTHWEST	1
> +#define APL_GPIO_WEST		2
> +#define APL_GPIO_SOUTHWEST	3
> +#define APL_GPIO_NR_DEVICES	4
> +
> +/* Offset data for Apollo Lake GPIO controllers */
> +#define APL_GPIO_NORTH_OFFSET		0xc50000
> +#define APL_GPIO_NORTHWEST_OFFSET	0xc40000
> +#define APL_GPIO_WEST_OFFSET		0xc70000
> +#define APL_GPIO_SOUTHWEST_OFFSET	0xc00000
> +
> +#define APL_GPIO_IRQ			14
> +
> +static struct resource apl_gpio_resources[APL_GPIO_NR_DEVICES][2] = {
> +	[APL_GPIO_NORTH] = {
> +		DEFINE_RES_MEM(APL_GPIO_NORTH_OFFSET, 0x1000),
> +		DEFINE_RES_IRQ(APL_GPIO_IRQ),
> +	},
> +	[APL_GPIO_NORTHWEST] = {
> +		DEFINE_RES_MEM(APL_GPIO_NORTHWEST_OFFSET, 0x1000),
> +		DEFINE_RES_IRQ(APL_GPIO_IRQ),
> +	},
> +	[APL_GPIO_WEST] = {
> +		DEFINE_RES_MEM(APL_GPIO_WEST_OFFSET, 0x1000),
> +		DEFINE_RES_IRQ(APL_GPIO_IRQ),
> +	},
> +	[APL_GPIO_SOUTHWEST] = {
> +		DEFINE_RES_MEM(APL_GPIO_SOUTHWEST_OFFSET, 0x1000),
> +		DEFINE_RES_IRQ(APL_GPIO_IRQ),
> +	},
> +};
> +
> +/* The order must be in sync with apl_pinctrl_soc_data */
> +static const struct mfd_cell apl_gpio_devices[APL_GPIO_NR_DEVICES] =
> {
> +	[APL_GPIO_NORTH] = {
> +		.name = "apollolake-pinctrl",
> +		.id = APL_GPIO_NORTH,
> +		.num_resources =
> ARRAY_SIZE(apl_gpio_resources[APL_GPIO_NORTH]),
> +		.resources = apl_gpio_resources[APL_GPIO_NORTH],
> +		.ignore_resource_conflicts = true,
> +	},
> +	[APL_GPIO_NORTHWEST] = {
> +		.name = "apollolake-pinctrl",
> +		.id = APL_GPIO_NORTHWEST,
> +		.num_resources =
> ARRAY_SIZE(apl_gpio_resources[APL_GPIO_NORTHWEST]),
> +		.resources = apl_gpio_resources[APL_GPIO_NORTHWEST],
> +		.ignore_resource_conflicts = true,
> +	},
> +	[APL_GPIO_WEST] = {
> +		.name = "apollolake-pinctrl",
> +		.id = APL_GPIO_WEST,
> +		.num_resources =
> ARRAY_SIZE(apl_gpio_resources[APL_GPIO_WEST]),
> +		.resources = apl_gpio_resources[APL_GPIO_WEST],
> +		.ignore_resource_conflicts = true,
> +	},
> +	[APL_GPIO_SOUTHWEST] = {
> +		.name = "apollolake-pinctrl",
> +		.id = APL_GPIO_SOUTHWEST,
> +		.num_resources =
> ARRAY_SIZE(apl_gpio_resources[APL_GPIO_SOUTHWEST]),
> +		.resources = apl_gpio_resources[APL_GPIO_SOUTHWEST],
> +		.ignore_resource_conflicts = true,
> +	},
> +};
>  
>  static struct mfd_cell lpc_ich_spi_cell = {
>  	.name = "intel-spi",
> @@ -1083,6 +1149,33 @@ static int lpc_ich_init_wdt(struct pci_dev
> *dev) return ret;
>  }
>  
> +static int lpc_ich_init_pinctrl(struct pci_dev *dev)
> +{
> +	struct resource base;
> +	unsigned int i;
> +	int ret;
> +
> +	/* Check, if GPIO has been exported as an ACPI device */
> +	if (acpi_dev_present("INT3452", NULL, -1))
> +		return -EEXIST;
> +
> +	ret = p2sb_bar(dev->bus, 0, &base);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(apl_gpio_devices); i++) {
> +		struct resource *mem = &apl_gpio_resources[i][0];
> +
> +		/* Fill MEM resource */
> +		mem->start += base.start;
> +		mem->end += base.start;
> +		mem->flags = base.flags;
> +	}
> +
> +	return mfd_add_devices(&dev->dev, 0, apl_gpio_devices,
> +			       ARRAY_SIZE(apl_gpio_devices), NULL,
> 0, NULL); +}
> +
>  static void lpc_ich_test_spi_write(struct pci_dev *dev, unsigned int
> devfn, struct intel_spi_boardinfo *info)
>  {
> @@ -1199,6 +1292,12 @@ static int lpc_ich_probe(struct pci_dev *dev,
>  			cell_added = true;
>  	}
>  
> +	if (priv->chipset == LPC_APL) {
> +		ret = lpc_ich_init_pinctrl(dev);
> +		if (!ret)
> +			cell_added = true;
> +	}
> +
>  	if (lpc_chipset_info[priv->chipset].spi_type) {
>  		ret = lpc_ich_init_spi(dev);
>  		if (!ret)

