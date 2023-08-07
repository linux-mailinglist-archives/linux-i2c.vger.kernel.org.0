Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6305D771E6D
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Aug 2023 12:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbjHGKob (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Aug 2023 06:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbjHGKo3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Aug 2023 06:44:29 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A29C5E70;
        Mon,  7 Aug 2023 03:44:27 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RKCb72BVWzfbmg;
        Mon,  7 Aug 2023 18:43:15 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 18:44:23 +0800
Message-ID: <042c6eb7-cf31-79e1-51c7-c229e2582c0c@huawei.com>
Date:   Mon, 7 Aug 2023 18:44:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 8/9] i2c: imx-lpi2c: Use dev_err_probe in probe function
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     <florian.fainelli@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <rjui@broadcom.com>,
        <sbranden@broadcom.com>, <yangyicong@hisilicon.com>,
        <aisheng.dong@nxp.com>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <linux-imx@nxp.com>, <kblaiech@nvidia.com>,
        <asmaa@nvidia.com>, <loic.poulain@linaro.org>, <rfoss@kernel.org>,
        <ardb@kernel.org>, <gcherian@marvell.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20230802095737.3957587-1-liaochang1@huawei.com>
 <20230802095737.3957587-9-liaochang1@huawei.com>
 <20230804221644.cqmoin6u22mxvouk@intel.intel>
 <758b882e-31a5-1f73-7fd2-945a8a2e9558@huawei.com>
 <20230807081725.fmjvdp3gxjs2ijee@intel.intel>
From:   "Liao, Chang" <liaochang1@huawei.com>
In-Reply-To: <20230807081725.fmjvdp3gxjs2ijee@intel.intel>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi, Andi

在 2023/8/7 16:17, Andi Shyti 写道:
> On Mon, Aug 07, 2023 at 10:13:30AM +0800, Liao, Chang wrote:
>> Hi, Andi
>>
>> 在 2023/8/5 6:16, Andi Shyti 写道:
>>> On Wed, Aug 02, 2023 at 05:57:36PM +0800, Liao Chang wrote:
>>>> Use the dev_err_probe function instead of dev_err in the probe function
>>>> so that the printed messge includes the return value and also handles
>>>> -EPROBE_DEFER nicely.
>>>>
>>>> Signed-off-by: Liao Chang <liaochang1@huawei.com>
>>>> ---
>>>>  drivers/i2c/busses/i2c-imx-lpi2c.c | 12 ++++--------
>>>>  1 file changed, 4 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
>>>> index c3287c887c6f..bfa788b3775b 100644
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
>>> you cut on this because the line was going over 100 characters? :)
>>>
>>> In theory you shouldn't change the print message when doing such
>>> changes and you can still split it as:
>>>
>>> 		return dev_err_probe(&pdev->dev, ret,
>>> 				     "can't get I2C peripheral clock, ret=%d\n",
>>> 				     ret);
>>>
>>> and you're even within the 80 characters.
>>
>> Since dev_err_probe always print the second parameter that happens to be the return value,
>> I remove the "ret=%d" from the original message to avoid a redundant error message.
>>
>> So is it better to keep the original message unchanged, even though dev_err_probe also prints
>> the return error value? Or is it better to make this change so that all error messages printed
>> in the probe function include the return value in a consistent style?
> 
> yes, you are right! Then please ignore this comment, but...
> 
>>>   	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, 0,
>>>   		pdev->name, lpi2c_imx);
>>> - 	if (ret) {
>>> - 		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
>>> - 		return ret;
>>> - 	}
>>> + 	if (ret)
>>> + 		return dev_err_probe(&pdev->dev, ret, "can't claim irq %d\n", irq);
> 
> please make it coherent to this second part, as well, where the
> error number is printed.

Do you mean to convert it to the following?

    if (ret)
        return dev_err_probe(&pdev->dev, ret, "can't claim irq\n");

I understand that the style of error message printed by dev_err_probe is like
"error [ERRNO]: [customized message]", the [ERRNO] comes from 2nd parameter,
[customized message] comes from 3rd paramter, if the original [customized message]it
also print ERRNO, i intend to remove it in this patch, otherwise, I will just keep it.
In the above code, [customized message] intend to print irq but return value, so it is
better to keep the original message, right?

Thanks.

> 
> Thank you,
> Andi

-- 
BR
Liao, Chang
