Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 191A77821B4
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Aug 2023 04:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbjHUC5A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Aug 2023 22:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbjHUC47 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Aug 2023 22:56:59 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6821F9C
        for <linux-i2c@vger.kernel.org>; Sun, 20 Aug 2023 19:56:57 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RTcW41BlMzLp5k;
        Mon, 21 Aug 2023 10:53:52 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 21 Aug 2023 10:56:53 +0800
Message-ID: <31cc1b22-188d-d01b-c370-9678c188d191@huawei.com>
Date:   Mon, 21 Aug 2023 10:56:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v2 RESEND] I2C: Fix return value check for
 devm_pinctrl_get()
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <o.rempel@pengutronix.de>,
        <nicolas.ferre@microchip.com>, <leoyang.li@nxp.com>,
        <s.hauer@pengutronix.de>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230818074509.295220-1-ruanjinjie@huawei.com>
 <ZN8ptWv6Dn2pdWtF@shell.armlinux.org.uk>
 <CACRpkdY=1XOo24u6m1xRxWM_JNUtwQZoomWCTTwgufB7kbPfwg@mail.gmail.com>
 <20230818192034.bgjmurn2rp7ngyel@intel.intel>
 <ZN/QDI9ZHZAWa575@shell.armlinux.org.uk>
 <20230819144533.dc3t777ggcnfq3rh@intel.intel>
From:   Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <20230819144533.dc3t777ggcnfq3rh@intel.intel>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2023/8/19 22:45, Andi Shyti wrote:
> Hi Russel,
> 
>>>>>>       i2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
>>>>>> -     if (!i2c_imx->pinctrl || IS_ERR(i2c_imx->pinctrl)) {
>>>>>> +     if (IS_ERR(i2c_imx->pinctrl)) {
>>>>>>               dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
>>>>>>               return PTR_ERR(i2c_imx->pinctrl);
>>>>>>       }
>>>>>
>>>>> I haven't looked at the AT91 version, but... isn't the original code
>>>>> entirely correct?
>>>>>
>>>>> If pinctrl is not available (thus devm_pinctrl_get() returns NULL) then
>>>>> recovery can't work, because we can't switch the I2C pins between the
>>>>> I2C controller and GPIO. So, isn't it quite correct to print
>>>>> "can't get pinctrl, bus recovery not supported" because the I2C bus
>>>>> can't be recovered without pinctrl?
>>>>>
>>>>> The PTR_ERR() is also fine - because if pinctrl is not present and
>>>>> returns NULL, we'll end up returning zero, which is exactly what we
>>>>> want.
>>>>
>>>> Oh, you're probably absolutely right about that.
>>>>
>>>>> The alternative would be to open code that, maybe with a more accurate
>>>>> message:
>>>>>
>>>>>         if (!i2c_imx->pinctrl) {
>>>>>                 dev_info(&pdev->dev, "pinctrl unavailable, bus recovery not supported\n");
>>>>>                 return 0;
>>>>>         }
>>>>>         if (IS_ERR(i2c_imx->pinctrl) {
>>>>>                 ...
>>>>
>>>> This is a way better patch. It makes the implicit explicit.
>>>
>>> we could also use
>>>
>>> 	if (IS_ERR_OR_NULL(i2c_imx->pinctrl))
>>> 		...
>>>
>>> without changing any logic in the driver.
>>
>> IS_ERR_OR_NULL() - is a macro I personally hate, it causes a lot of
>> trouble. I have mutt setup to mark IS_ERR_OR_NULL with a red background
>> so it stands out in patches. It is utterly evil, and I really wish we
>> could get rid of that damn macro.
>>
>> It also looks wrong.
>>
>> 	if (IS_ERR_OR_NULL(x))
>> 		return PTR_ERR(x);
>>
>> rings alarm bells for some people, because if x is NULL, then
>> PTR_ERR(x) is zero.
>>
>> While this may be what is intended in this case, for a great many
>> places in the kernel, this is a bug. So I can guarantee that
>> _someone_ will come along and want to "fix" that to make the NULL
>> case return an error code, and in doing so end up breaking the
>> driver.
>>
>> So... no, just don't.
>>
>> This is why having two if() statements are a good idea, and is
>> what Linus means by "making the implicit explicit" - because it
>> then becomes absolutely obvious what we want to do in the NULL
>> case, and what we want to do in the error case.
>>
>> There is none of this ambiguity that I point out above.
> 
> Yes, I fully agree, IS_ERR_OR_NULL() shoud be almost never be
> used in an exit path (unless you are in a void function and few
> other cases, like (borderline) this one).
> 
> I'm OK also if Ruan goes with what you suggested.

I'll do as what Russel suggested. Thank you!

> 
> Andi
