Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87FB978038E
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Aug 2023 03:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353068AbjHRByX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 21:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351230AbjHRBxy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 21:53:54 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB25100;
        Thu, 17 Aug 2023 18:53:53 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RRlGk5XHtzVk4T;
        Fri, 18 Aug 2023 09:51:42 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 18 Aug 2023 09:53:49 +0800
Message-ID: <fe0d14a3-a890-8602-5be7-4e58ef0d8d1a@huawei.com>
Date:   Fri, 18 Aug 2023 09:53:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v2] I2C: Fix return value check for
 devm_pinctrl_get()
Content-Language: en-US
To:     Yann Sionneau <yann@sionneau.net>, Leo Li <leoyang.li@nxp.com>,
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
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        <linux@armlinux.org.uk>
CC:     <linux-gpio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <20230817022018.3527570-1-ruanjinjie@huawei.com>
 <AM0PR04MB6289593A2149C9411FA9D5858F1AA@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <6b508343-7b7f-0fd5-d83f-92dc88a9510d@sionneau.net>
From:   Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <6b508343-7b7f-0fd5-d83f-92dc88a9510d@sionneau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2023/8/18 7:07, Yann Sionneau wrote:
> Hi,
> 
> Le 17/08/2023 à 19:30, Leo Li a écrit :
> 
>>> The devm_pinctrl_get() function returns error pointers and never returns
>>> NULL. Update the checks accordingly.
>> Not exactly.  It can return NULL when CONFIG_PINCTRL is not defined. 
>> We probably should fix that API too.
>>
>> include/linux/pinctrl/consumer.h:
>> static inline struct pinctrl * __must_check devm_pinctrl_get(struct
>> device *dev)
>> {
>>          return NULL;
>> }
> 
> So, as Leo pointed out it seems devm_pinctrl_get() can in fact return
> NULL, when CONFIG_PINCTRL is not defined.
> 
> What do we do about this?
> 
> Proposals:
> 
> 1/ make sure all call sites of devm_pinctrl_get() do check for error
> with IS_ERR *and* check for NULL => therefore using IS_ERR_OR_NULL

I think it's the best.

> 
> 2/ change the fallback implementation in
> include/linux/pinctrl/consumer.h to return ERR_PTR(-Esomething) (which
> errno?)

It seems a convention to return NULL if the related macro is not defined.

> 
> 3/ another solution?

Make I2C_IMX and I2C_AT91 config depends on PINCTRL config is another
option. However it seems that the function call devm_pinctrl_get() has
an optional recovery feature from the following notes and dev_info(). So
this dependency is not necessary.

1378 /*
1379  * We switch SCL and SDA to their GPIO function and do some bitbanging
1380  * for bus recovery. These alternative pinmux settings can be
1381  * described in the device tree by a separate pinctrl state "gpio". If
1382  * this is missing this is not a big problem, the only implication is
1383  * that we can't do bus recovery.
1384  */
1385 static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
1386         struct platform_device *pdev)
1387 {
1388     struct i2c_bus_recovery_info *rinfo = &i2c_imx->rinfo;
1389
1390     i2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);

828 static int at91_init_twi_recovery_gpio(struct platform_device *pdev,
829                        struct at91_twi_dev *dev)
830 {
831     struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
832
833     rinfo->pinctrl = devm_pinctrl_get(&pdev->dev);
834     if (!rinfo->pinctrl || IS_ERR(rinfo->pinctrl)) {
835         dev_info(dev->dev, "can't get pinctrl, bus recovery not
supported\n");
836         return PTR_ERR(rinfo->pinctrl);
837     }


> 
> Regards,
> 
