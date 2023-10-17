Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38DEB7CCE18
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Oct 2023 22:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232228AbjJQUcY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Oct 2023 16:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231944AbjJQUcX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Oct 2023 16:32:23 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2102.outbound.protection.outlook.com [40.107.7.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B60892;
        Tue, 17 Oct 2023 13:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amKZNAT7BJ7UNF7jYKzmBVggsr+2Vw4sxaLhAbLXEexsuVbZh9bjFNMAs67lniI0IwKlKU2IAOJuWxdzRb1hEX9AaKfiZMmi86YWNiO877TVUgqY9IBzLyUPx9MGRn3AyEXqTnuGSw3MUo0O+7a1D/4oJhKwDdCW0XeuOC7/6oRyewK6thdCVWjZepGLCFWfZEBLNUehHn3BnPxaNHOCitk97N4Nt95CUAGcmpyEIHXxKS71opxqZP0yed7L0eCvOsZBkKHpYKXIdJJCGqQ87iZ3HBD15W1kDsfS4I5LsRynsmDjhUWw92aPMG6BaBNuEpDrPCA4v6XqahvJ8jJXgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIxWAoVgzTWiBnUJ4t/7R2PB8Ue3fnzRwtgvuO4/pRA=;
 b=j+Ga8L/z729nfzUa65E2akGLKp/r0YxLhY/VsD6e0DVKEPGdwt0gQVIrIp0EI2vOzIhDe/bskSFbeNwcXqrcy54xyYVhK4smdiBRYDav4oO7aFwcwrGWxGSAdMKmRkSquZnPoj4wkdNE22jjgdh2XH0l/bFNhY8rlqafpeAFYl23rdWE6JubJNqpTk3JCOyGVrDayXj4f47f40gsa8i84hlszWDJo0gMlyPVDjOOZhKY2kgDCVDcTKo0KVRIS817EHSyQ48lFL0bDjWjrJA0q6eBxB50Om3TwCweuuwL83htjQRFyQLkh4QcHyJVvmYjGmQQs2aCgQDmOFND0NBq0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIxWAoVgzTWiBnUJ4t/7R2PB8Ue3fnzRwtgvuO4/pRA=;
 b=K9Ey8vw/NCkEhKNGwmf81QIYscVXyTX2Rszka49iW/fDr2gD2QBR6JNvfidAXA5Ylfy+ZTfB7b51I8jAeuiEecOcAi8VxZRxhXJNbWe8qdWGEN8TEMiBT6paXPr8X0F//diLNk06XiRwldZt7KnNil2kMSAteLnnLvkczo6EGjA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by VI1PR02MB5759.eurprd02.prod.outlook.com (2603:10a6:803:138::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Tue, 17 Oct
 2023 20:32:16 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d%7]) with mapi id 15.20.6907.021; Tue, 17 Oct 2023
 20:32:16 +0000
Message-ID: <4ece4a98-ff35-6a95-6f06-cbb9eaa50e8c@axentia.se>
Date:   Tue, 17 Oct 2023 22:32:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/2] i2c: mv64xxx: add an optional reset-gpios property
Content-Language: sv-SE, en-US
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        gregory.clement@bootlin.com, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231016023504.3976746-1-chris.packham@alliedtelesis.co.nz>
 <20231016023504.3976746-3-chris.packham@alliedtelesis.co.nz>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20231016023504.3976746-3-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0065.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::19) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|VI1PR02MB5759:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c528ee-f66e-41b6-d23b-08dbcf5026d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6xI7tRz7ADR7WhscU3NzhyPRPtxSgI/Judecj0jQAabKJpdO5uauMya+XCdQnC9dARR3x7yxJivsDgetMDIC0wD/LaXzJ0395Kb3E88DYSAwVdHB9CdHYCll6lDnTwx5un/zUj+qv2fdaAHRQmaOpJzWcLEi3znBR5/rSYDzICHsblHNZprrEOQ9KWcF3eu/vzaAjtNvGcKC5Z53nhtdPbG/93TVXgIWr2I/Jh3SBHIN3HW2SPdqPR6hrArqB+iiWOWC6ghYv8Rz7txrg5TS9AYzKdfGoywrxxV4owF+I34kjtJ7eR0IDoNgZ1uApD24PwY1zAjjWxBtfIRmVDP1mDLCiClC9OwXutEIVz4LM9aWxHbvL+J6zTXXlMO/FpM2t7jrKzGmrnT8WIK6In2/d1t2wvaw2CKwTRCWVRbHk/1HMxSoyFnrQ+bRrLfKSFMkdIaIyQ//meDVf8pEoCcFX2dafpZBNiOqW+lTIgNw3N1ydvNxH+7c+tKyuCWjsXnZCeCgA3Tg0c6hYgZ/Ck6Xdcq7y6cJM5dWUtG8tfCqqcEn/4QyAjTuXp8avnqxe8y9Utxm61EW51S/I9lVNjce4jb+QIui7kS5QS/Mk3M19ZzbA7Y5UMY80x0d0so7XEmVRUqyRMe/3cQbmHWegjhXrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(39830400003)(136003)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6512007)(2616005)(26005)(6506007)(36756003)(478600001)(38100700002)(2906002)(83380400001)(4001150100001)(41300700001)(6486002)(5660300002)(66476007)(31696002)(66556008)(66946007)(316002)(8676002)(8936002)(31686004)(4326008)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzlSVnVZSDNTVzZWTTdpZzRGT2dFMkdOLzlCeUt2TmFYR0llWFNxayt4amxB?=
 =?utf-8?B?cGl2d2xCQkVWeUEyVHJZZUxibXlxejRVWTBqWXEwYXp0S2U2S0EwWTVmQkJ1?=
 =?utf-8?B?TE8xRGgrb1J4TDRRS0ZOdk5xTFFUeFRTckE1OTA3N1JtVkdzWWVHTWVoSG9u?=
 =?utf-8?B?U3NIZ2RkMXJGSEhobVEvdjltazYzdE5XMy9oc0tKZGo2bWM3TzF4SzlzVHBU?=
 =?utf-8?B?MkJTYmlMMVIzM3ExWldnRFltUzAvMTdrNWpSUGFrSzdKUUZwbG1uZHRNOERX?=
 =?utf-8?B?OHYwUFRSRmttWGFmYzQzWTJaNk4zU0VKNm4wSDRONlBraS9FbGQwcEFvMEpr?=
 =?utf-8?B?U3BseENQYVdUVWpEMUkwWWxKLzF6enBaZTlSWDRyaWNmMGtnbXFWR003VkM5?=
 =?utf-8?B?c25ad3ZkTDdyc2FxWHlWNmZ3SjlPdjlCTjdDODZIQVJVSHBlRVluV0U0NDda?=
 =?utf-8?B?ck44NmpYU05jU0c1dUJjZkFlZHRZTCswYk1mVlk4OFFncXhWMzVmZGdnOFB3?=
 =?utf-8?B?WGpSOUFuc3IzNU0rMm1JRXVwWmVuTTJXRUFNZHBSakRENkZaNnhlVmFKK3Jl?=
 =?utf-8?B?Z0Vody90c01TTmJGQyt6VEVZT3VjeXFLQ3VGTHVXM2o3TUdhL3VBYldadHkz?=
 =?utf-8?B?SDJ6b0FRL2hKanVkb0JUdnVJZmhjSzhnWEZyZjZiKzJWNVhQbGdxbENnSUdu?=
 =?utf-8?B?azdKbGF1M0daSll0NjZPWDk5MUdkTVd1YnZQclFtby9kR0UrbldvYWxjQWdC?=
 =?utf-8?B?OStZOEpyZENUbm5SVnU1U2RSS2p3ZS9JU216OE9xbENVSnc1aUM5VnBDYmJM?=
 =?utf-8?B?V1ZWZTVWWCtvRyt6Y01VMTBiRTJxQndkRjZhSngvU0dNbUMrWWRKQTZ4dEp5?=
 =?utf-8?B?U3JLRjMrUG1oQzE4ZXpuL0IvNkxOc2JsOVpVTlcyTzZ1OGk3RkFHS3poeW9x?=
 =?utf-8?B?L3lZRmhFS3pIeFYzclFzcUdmSDJVQnpyOGVLYnROOEFpN2VKQ1pFVm9tT2JR?=
 =?utf-8?B?eUdlWTRqbVpRRjNCVlNJMHdBaU9LV0hYci9ZYTgycE5pV0JrYlU2NExvc1kx?=
 =?utf-8?B?NVhZL3poV2dPZEVKQ3dBblVhdXdxOEUwNEdEUFdXOExGOW5pYklvRW5xWVkz?=
 =?utf-8?B?OHdTbFJON3owUWRKSlE5dnJsMXpJQmMvVDcyZE5idGUzcXdRNHdYRFV6ZnZB?=
 =?utf-8?B?TkdlQ014KzJUWjhjOWp4M1FkQzZhOFYrY2ZxN2hjem93VEsxL0trZlRkbXBt?=
 =?utf-8?B?enRNSmJueTA2b1BKZHc0VU1wS1hvNmF1aDBGbXA5eUVNb25VaHBOcThDVE56?=
 =?utf-8?B?NHBzL0JhZjFsQ0xDL1ZtSCtVUHZXV2ZGaGY1OWMvbktjVDhFSU9Cb2lFbCtO?=
 =?utf-8?B?NHJxMFp4OU1sMXJKcytyci8xcTBUMXljRlpiR1phV1llSUl6MmhNSXpNUXNM?=
 =?utf-8?B?Q0R4WUhyNFh0NFdjREJVOTNWaEJnU0hKUWcxaEZXMjVxZWhaL3F6TkhOYWFC?=
 =?utf-8?B?ODROZFFqZTdQMXdWeU9zdUsvN0lXVUFKQy9jVTRvZVMzdXd2VnBUTnJrblNR?=
 =?utf-8?B?ZHp2ZjhkV3k0aGl4KzhJRDhPVzhMeGVEdExYU0VnK0pmSFY2dFlqcVRNeEhU?=
 =?utf-8?B?aFdjTGJId0lBL3FULzE0RlRsTEY2MEJyRTZuNHZGUk9CMXFRcHJUZ1R4cjY4?=
 =?utf-8?B?d1ZUM2lxeFA4U3JGSjh4dVRyMjhieStZTVk5ZlRBZ04vb2F6cmU0bFZTL2ha?=
 =?utf-8?B?UW9YRmJIbW1tYlNXN1U0clJVUzB1R1FuWjVTSlZaeVE2MmVFRStzeUY2eU5H?=
 =?utf-8?B?aEkwZDdOd3VkaFlrY1NFRm1BV2xZZlZ5NzZJM3d2cEtvTTVYUlU4djdWYzh2?=
 =?utf-8?B?dEJ2T0xYUGVWVzU1cTV0c1YwTGUrRzVEaHdzZjVZQk10SnNNTm5rcjlYNkdr?=
 =?utf-8?B?WmY3V01SRVVJWVl6T09oNXZWNjhnVjh5MHdvQXVidk5ZZWxzZnBTSjA5NUo2?=
 =?utf-8?B?cFdFZWxjWlFUVzNQODdkQmY5OS9ONEhHYnl4SHpYb0ZPVjk0c2hQTWczSkts?=
 =?utf-8?B?K0EvNzVIUFZGajNHSXozblYvL09DS1VwSUp0ZVhhZEY1QjBDSkpmV3NRVU5y?=
 =?utf-8?Q?1BtbjnJk5Wpt0tEVzFtzyv4UL?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c528ee-f66e-41b6-d23b-08dbcf5026d7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 20:32:16.0511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfVXaIXmHIpUy47ikLZI338oPFVg3Ju2pwxHJe+P5/Zk+FvndwBEBN4eXZTU9MAn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5759
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-10-16 at 04:35, Chris Packham wrote:
> Some hardware designs have a GPIO used to control the reset of all the
> devices on and I2C bus. It's not possible for every child node to
> declare a reset-gpios property as only the first device probed would be
> able to successfully request it (the others will get -EBUSY). Represent
> this kind of hardware design by associating the reset-gpios with the
> parent I2C bus. The reset line will be released prior to the child I2C
> devices being probed.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v2:
>     - Add a property to cover the length of delay after releasing the reset
>       GPIO
>     - Use dev_err_probe() when requesing the GPIO fails
> 
>  drivers/i2c/busses/i2c-mv64xxx.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
> index efd28bbecf61..50c470e5c4be 100644
> --- a/drivers/i2c/busses/i2c-mv64xxx.c
> +++ b/drivers/i2c/busses/i2c-mv64xxx.c
> @@ -160,6 +160,7 @@ struct mv64xxx_i2c_data {
>  	bool			clk_n_base_0;
>  	struct i2c_bus_recovery_info	rinfo;
>  	bool			atomic;
> +	struct gpio_desc	*reset_gpio;
>  };
>  
>  static struct mv64xxx_i2c_regs mv64xxx_i2c_regs_mv64xxx = {
> @@ -1036,6 +1037,7 @@ mv64xxx_i2c_probe(struct platform_device *pd)
>  	struct mv64xxx_i2c_data		*drv_data;
>  	struct mv64xxx_i2c_pdata	*pdata = dev_get_platdata(&pd->dev);
>  	struct resource *res;
> +	u32	reset_udelay;
>  	int	rc;
>  
>  	if ((!pdata && !pd->dev.of_node))
> @@ -1083,6 +1085,14 @@ mv64xxx_i2c_probe(struct platform_device *pd)
>  	if (drv_data->irq < 0)
>  		return drv_data->irq;
>  
> +	drv_data->reset_gpio = devm_gpiod_get_optional(&pd->dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(drv_data->reset_gpio))
> +		return dev_err_probe(&pd->dev, PTR_ERR(drv_data->reset_gpio),
> +				     "Cannot get reset gpio\n");
> +	rc = device_property_read_u32(&pd->dev, "reset-delay-us", &reset_udelay);
> +	if (rc)
> +		reset_udelay = 1;
> +
>  	if (pdata) {
>  		drv_data->freq_m = pdata->freq_m;
>  		drv_data->freq_n = pdata->freq_n;
> @@ -1121,6 +1131,11 @@ mv64xxx_i2c_probe(struct platform_device *pd)
>  			goto exit_disable_pm;
>  	}
>  
> +	if (drv_data->reset_gpio) {
> +		gpiod_set_value_cansleep(drv_data->reset_gpio, 0);

There is no limit to how short the reset pulse will be with this
implementation. What I was requesting in my comment for v1 was
a way to control the length of the reset pulse (not the delay
after the pulse). There are devices that behave very badly if
the reset pulse is too short for their liking, others might not
react at all...

Some delay after the pulse might also be needed, of course.

Cheers,
Peter

> +		usleep_range(reset_udelay, reset_udelay + 10);
> +	}
> +
>  	rc = request_irq(drv_data->irq, mv64xxx_i2c_intr, 0,
>  			 MV64XXX_I2C_CTLR_NAME, drv_data);
>  	if (rc) {
