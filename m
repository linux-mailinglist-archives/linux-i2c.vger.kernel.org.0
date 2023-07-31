Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 141347689E9
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jul 2023 04:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjGaCQp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jul 2023 22:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjGaCQo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Jul 2023 22:16:44 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CECD218B;
        Sun, 30 Jul 2023 19:16:42 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RDhfh14BqzrRyr;
        Mon, 31 Jul 2023 10:15:40 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 10:16:38 +0800
Message-ID: <4ae70a67-6421-f1f6-f88f-163ee54b39bb@huawei.com>
Date:   Mon, 31 Jul 2023 10:16:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 8/9] i2c: imx-lpi2c: Use dev_err_probe in probe function
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
CC:     <andi.shyti@kernel.org>, <florian.fainelli@broadcom.com>,
        <rjui@broadcom.com>, <sbranden@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <yangyicong@hisilicon.com>, <aisheng.dong@nxp.com>,
        <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
        <kblaiech@nvidia.com>, <asmaa@nvidia.com>,
        <loic.poulain@linaro.org>, <rfoss@kernel.org>, <ardb@kernel.org>,
        <gcherian@marvell.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rpi-kernel@lists.infradead.org>
References: <20230728013148.1720978-1-liaochang1@huawei.com>
 <20230728013148.1720978-9-liaochang1@huawei.com>
 <20230728055535.qoqq5syketmtduoy@pengutronix.de>
From:   "Liao, Chang" <liaochang1@huawei.com>
In-Reply-To: <20230728055535.qoqq5syketmtduoy@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



在 2023/7/28 13:55, Uwe Kleine-König 写道:
> Hello,
> 
> On Fri, Jul 28, 2023 at 09:31:47AM +0800, Liao Chang wrote:
>> Use the dev_err_probe function instead of dev_err in the probe function
>> so that the printed messge includes the return value and also handles
>> -EPROBE_DEFER nicely.
>>
>> Signed-off-by: Liao Chang <liaochang1@huawei.com>
>> ---
>>  drivers/i2c/busses/i2c-imx-lpi2c.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
>> index c3287c887c6f..9021b8064ae4 100644
>> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
>> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
>> @@ -569,10 +569,8 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
>>  		sizeof(lpi2c_imx->adapter.name));
>>  
>>  	ret = devm_clk_bulk_get_all(&pdev->dev, &lpi2c_imx->clks);
>> -	if (ret < 0) {
>> -		dev_err(&pdev->dev, "can't get I2C peripheral clock, ret=%d\n", ret);
>> -		return ret;
>> -	}
>> +	if (ret < 0)
>> +		return dev_err_probe(&pdev->dev, ret, "can't get I2C peripheral clock\n");
> 
> The change looks good, however I wonder why you didn't convert the other
> dev_err() called by lpi2c_imx_probe() in the same way.

Sorry, I am in hurry and don't clean it up as much as.

Actually, I am not sure if I should convert all dev_err calls to dev_err_probe, or just
replace the ones that print the 'return value'. I know that dev_err_probe is better
suited for printing return values, but I am nore sure if it's worth the effort to convert
all of the calls, for example, the second dev_err in lpi2c_imx_probe():

ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, 0, pdev->name, lpi2c_imx);
if (ret)
    dev_err(&pdev->dev, "can't claim rqi %d\n", irq);
    return ret;
}

Thanks.

> 
> Best regards
> Uwe
> 

-- 
BR
Liao, Chang
