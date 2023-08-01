Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC2E176A63E
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Aug 2023 03:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbjHABXk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jul 2023 21:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjHABXj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jul 2023 21:23:39 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AD76114;
        Mon, 31 Jul 2023 18:23:38 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RFHP31cs2zLp0H;
        Tue,  1 Aug 2023 09:20:55 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 09:23:34 +0800
Message-ID: <97e82278-5414-f1ab-3c52-1c9658c3f6e2@huawei.com>
Date:   Tue, 1 Aug 2023 09:23:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 8/9] i2c: imx-lpi2c: Use dev_err_probe in probe function
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
CC:     <yangyicong@hisilicon.com>, <linux-i2c@vger.kernel.org>,
        <festevam@gmail.com>, <ardb@kernel.org>, <asmaa@nvidia.com>,
        <rfoss@kernel.org>, <florian.fainelli@broadcom.com>,
        <kblaiech@nvidia.com>, <bcm-kernel-feedback-list@broadcom.com>,
        <linux-imx@nxp.com>, <linux-arm-msm@vger.kernel.org>,
        <andi.shyti@kernel.org>, <rjui@broadcom.com>,
        <s.hauer@pengutronix.de>, <gcherian@marvell.com>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <aisheng.dong@nxp.com>,
        <loic.poulain@linaro.org>, <sbranden@broadcom.com>,
        <kernel@pengutronix.de>, <shawnguo@kernel.org>
References: <20230728013148.1720978-1-liaochang1@huawei.com>
 <20230728013148.1720978-9-liaochang1@huawei.com>
 <20230728055535.qoqq5syketmtduoy@pengutronix.de>
 <4ae70a67-6421-f1f6-f88f-163ee54b39bb@huawei.com>
 <20230731073456.zqg6adnyogtojyiv@pengutronix.de>
From:   "Liao, Chang" <liaochang1@huawei.com>
In-Reply-To: <20230731073456.zqg6adnyogtojyiv@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



在 2023/7/31 15:34, Uwe Kleine-König 写道:
> Hello,
> 
> On Mon, Jul 31, 2023 at 10:16:38AM +0800, Liao, Chang wrote:
>> 在 2023/7/28 13:55, Uwe Kleine-König 写道:
>>> On Fri, Jul 28, 2023 at 09:31:47AM +0800, Liao Chang wrote:
>>>> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
>>>> index c3287c887c6f..9021b8064ae4 100644
>>>> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
>>>> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
>>>> @@ -569,10 +569,8 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
>>>>  		sizeof(lpi2c_imx->adapter.name));
>>>>  
>>>>  	ret = devm_clk_bulk_get_all(&pdev->dev, &lpi2c_imx->clks);
>>>> -	if (ret < 0) {
>>>> -		dev_err(&pdev->dev, "can't get I2C peripheral clock, ret=%d\n", ret);
>>>> -		return ret;
>>>> -	}
>>>> +	if (ret < 0)
>>>> +		return dev_err_probe(&pdev->dev, ret, "can't get I2C peripheral clock\n");
>>>
>>> The change looks good, however I wonder why you didn't convert the other
>>> dev_err() called by lpi2c_imx_probe() in the same way.
>>
>> Sorry, I am in hurry and don't clean it up as much as.
>>
>> Actually, I am not sure if I should convert all dev_err calls to dev_err_probe, or just
>> replace the ones that print the 'return value'. I know that dev_err_probe is better
>> suited for printing return values, but I am nore sure if it's worth the effort to convert
>> all of the calls, for example, the second dev_err in lpi2c_imx_probe():
>>
>> ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, 0, pdev->name, lpi2c_imx);
>> if (ret)
>>     dev_err(&pdev->dev, "can't claim rqi %d\n", irq);
>>     return ret;
>> }
> 
> I'd say yes. The return value of devm_request_irq() might be interesting
> in the error message. Also emitting error messages in a consistent style
> is nice.

Sounds good, I will convert them all in the next revision.

Thanks.

> 
> Best regards
> Uwe
> 

-- 
BR
Liao, Chang
