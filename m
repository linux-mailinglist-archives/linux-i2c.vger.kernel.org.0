Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9532577EECB
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 03:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244138AbjHQBjm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Aug 2023 21:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347577AbjHQBjl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Aug 2023 21:39:41 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B734C272B
        for <linux-i2c@vger.kernel.org>; Wed, 16 Aug 2023 18:39:40 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RR71j5xssz1GDVL;
        Thu, 17 Aug 2023 09:38:17 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 17 Aug 2023 09:39:38 +0800
Message-ID: <7932ba22-8f1d-745d-fbfd-2984e90c66c9@huawei.com>
Date:   Thu, 17 Aug 2023 09:39:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next] I2C: Use helper function IS_ERR_OR_NULL()
Content-Language: en-US
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
CC:     <linux-i2c@vger.kernel.org>,
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
        NXP Linux Team <linux-imx@nxp.com>
References: <20230816094618.2854084-1-ruanjinjie@huawei.com>
 <ZNyjSO5OFNWOshii@shell.armlinux.org.uk>
From:   Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <ZNyjSO5OFNWOshii@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2023/8/16 18:22, Russell King (Oracle) wrote:
> On Wed, Aug 16, 2023 at 05:46:18PM +0800, Ruan Jinjie wrote:
>> Use IS_ERR_OR_NULL() instead of open-coding it
>> to simplify the code.
>>
>> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
>> ---
>>  drivers/i2c/busses/i2c-at91-master.c | 2 +-
>>  drivers/i2c/busses/i2c-imx.c         | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
>> index 94cff1cd527e..0e454c04a145 100644
>> --- a/drivers/i2c/busses/i2c-at91-master.c
>> +++ b/drivers/i2c/busses/i2c-at91-master.c
>> @@ -831,7 +831,7 @@ static int at91_init_twi_recovery_gpio(struct platform_device *pdev,
>>  	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
>>  
>>  	rinfo->pinctrl = devm_pinctrl_get(&pdev->dev);
>> -	if (!rinfo->pinctrl || IS_ERR(rinfo->pinctrl)) {
>> +	if (IS_ERR_OR_NULL(rinfo->pinctrl)) {
>>  		dev_info(dev->dev, "can't get pinctrl, bus recovery not supported\n");
>>  		return PTR_ERR(rinfo->pinctrl);
>>  	}
>> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
>> index 10e89586ca72..8807c90df749 100644
>> --- a/drivers/i2c/busses/i2c-imx.c
>> +++ b/drivers/i2c/busses/i2c-imx.c
>> @@ -1388,7 +1388,7 @@ static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
>>  	struct i2c_bus_recovery_info *rinfo = &i2c_imx->rinfo;
>>  
>>  	i2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
>> -	if (!i2c_imx->pinctrl || IS_ERR(i2c_imx->pinctrl)) {
>> +	if (!IS_ERR_OR_NULL(i2c_imx->pinctrl)) {
>>  		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
>>  		return PTR_ERR(i2c_imx->pinctrl);
>>  	}
> 
> As stated in my previous reply to a similar patch, devm_pinctrl_get()
> can not return NULL, so it makes more sense to remove the test for NULL
> rather than "cleaning up" the buggy code, but leaving the bugs behind.

Right! I'll fix it sooner. Thank you very much.

> 
