Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8F637803F1
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Aug 2023 04:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357288AbjHRCrY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 22:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357365AbjHRCrM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 22:47:12 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86AA10C8
        for <linux-i2c@vger.kernel.org>; Thu, 17 Aug 2023 19:47:10 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RRmRD433DzFqjK;
        Fri, 18 Aug 2023 10:44:08 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 18 Aug 2023 10:47:07 +0800
Message-ID: <18e103b7-98f2-90e8-3395-171f2bdd3f9c@huawei.com>
Date:   Fri, 18 Aug 2023 10:47:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v2] I2C: Fix return value check for
 devm_pinctrl_get()
Content-Language: en-US
To:     Leo Li <leoyang.li@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>, Wolfram Sang <wsa@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230817022018.3527570-1-ruanjinjie@huawei.com>
 <AM0PR04MB6289593A2149C9411FA9D5858F1AA@AM0PR04MB6289.eurprd04.prod.outlook.com>
From:   Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <AM0PR04MB6289593A2149C9411FA9D5858F1AA@AM0PR04MB6289.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2023/8/18 1:30, Leo Li wrote:
> 
> 
>> -----Original Message-----
>> From: Ruan Jinjie <ruanjinjie@huawei.com>
>> Sent: Wednesday, August 16, 2023 9:20 PM
>> To: linux-i2c@vger.kernel.org; linux-arm-kernel@lists.infradead.org; Codrin
>> Ciubotariu <codrin.ciubotariu@microchip.com>; Andi Shyti
>> <andi.shyti@kernel.org>; Nicolas Ferre <nicolas.ferre@microchip.com>;
>> Alexandre Belloni <alexandre.belloni@bootlin.com>; Claudiu Beznea
>> <claudiu.beznea@tuxon.dev>; Oleksij Rempel <linux@rempel-privat.de>;
>> Pengutronix Kernel Team <kernel@pengutronix.de>; Shawn Guo
>> <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>; Fabio
>> Estevam <festevam@gmail.com>; dl-linux-imx <linux-imx@nxp.com>;
>> Wolfram Sang <wsa@kernel.org>; Linus Walleij <linus.walleij@linaro.org>;
>> Uwe Kleine-König <u.kleine-koenig@pengutronix.de>; Leo Li
>> <leoyang.li@nxp.com>
>> Cc: ruanjinjie@huawei.com
>> Subject: [PATCH -next v2] I2C: Fix return value check for devm_pinctrl_get()
>>
>> The devm_pinctrl_get() function returns error pointers and never returns
>> NULL. Update the checks accordingly.
> 
> Not exactly.  It can return NULL when CONFIG_PINCTRL is not defined.  We probably should fix that API too.
> 
> include/linux/pinctrl/consumer.h:
> static inline struct pinctrl * __must_check devm_pinctrl_get(struct device *dev)
> {
>         return NULL;
> }

As ARCH_AT91 select PINCTRL and I2C_AT91 depends on ARCH_AT91, it can
not be NULL except for I2C_AT91  is selected by COMPILE_TEST.

And ARCH_MXC select PINCTRL and I2C_IMX depends on ARCH_MXC it can not
be NULL except for I2C_IMX is selected by ARCH_LAYERSCAPE or COLDFIRE or
COMPILE_TEST.

In general, it is possible to be null.

> 
> Regards,
> Leo
>>
>> Fixes: 543aa2c4da8b ("i2c: at91: Move to generic GPIO bus recovery")
>> Fixes: fd8961c5ba9e ("i2c: imx: make bus recovery through pinctrl optional")
>> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
>> ---
>> v2:
>> - Remove NULL check instead of using IS_ERR_OR_NULL() to avoid leaving
>> them behind.
>> - Update the commit title and message.
>> ---
>>  drivers/i2c/busses/i2c-at91-master.c | 2 +-
>>  drivers/i2c/busses/i2c-imx.c         | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-
>> at91-master.c
>> index 94cff1cd527e..2bf1df5ef473 100644
>> --- a/drivers/i2c/busses/i2c-at91-master.c
>> +++ b/drivers/i2c/busses/i2c-at91-master.c
>> @@ -831,7 +831,7 @@ static int at91_init_twi_recovery_gpio(struct
>> platform_device *pdev,
>>  	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
>>
>>  	rinfo->pinctrl = devm_pinctrl_get(&pdev->dev);
>> -	if (!rinfo->pinctrl || IS_ERR(rinfo->pinctrl)) {
>> +	if (IS_ERR(rinfo->pinctrl)) {
>>  		dev_info(dev->dev, "can't get pinctrl, bus recovery not
>> supported\n");
>>  		return PTR_ERR(rinfo->pinctrl);
>>  	}
>> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c index
>> 10e89586ca72..05d55893f04e 100644
>> --- a/drivers/i2c/busses/i2c-imx.c
>> +++ b/drivers/i2c/busses/i2c-imx.c
>> @@ -1388,7 +1388,7 @@ static int i2c_imx_init_recovery_info(struct
>> imx_i2c_struct *i2c_imx,
>>  	struct i2c_bus_recovery_info *rinfo = &i2c_imx->rinfo;
>>
>>  	i2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
>> -	if (!i2c_imx->pinctrl || IS_ERR(i2c_imx->pinctrl)) {
>> +	if (IS_ERR(i2c_imx->pinctrl)) {
>>  		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not
>> supported\n");
>>  		return PTR_ERR(i2c_imx->pinctrl);
>>  	}
>> --
>> 2.34.1
> 
