Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F44E77182F
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Aug 2023 04:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjHGCNg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Aug 2023 22:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjHGCNf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Aug 2023 22:13:35 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD081703;
        Sun,  6 Aug 2023 19:13:34 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RK0C06q6XztRtR;
        Mon,  7 Aug 2023 10:10:04 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 10:13:30 +0800
Message-ID: <758b882e-31a5-1f73-7fd2-945a8a2e9558@huawei.com>
Date:   Mon, 7 Aug 2023 10:13:30 +0800
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
From:   "Liao, Chang" <liaochang1@huawei.com>
In-Reply-To: <20230804221644.cqmoin6u22mxvouk@intel.intel>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-9.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi, Andi

在 2023/8/5 6:16, Andi Shyti 写道:
> On Wed, Aug 02, 2023 at 05:57:36PM +0800, Liao Chang wrote:
>> Use the dev_err_probe function instead of dev_err in the probe function
>> so that the printed messge includes the return value and also handles
>> -EPROBE_DEFER nicely.
>>
>> Signed-off-by: Liao Chang <liaochang1@huawei.com>
>> ---
>>  drivers/i2c/busses/i2c-imx-lpi2c.c | 12 ++++--------
>>  1 file changed, 4 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
>> index c3287c887c6f..bfa788b3775b 100644
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
> you cut on this because the line was going over 100 characters? :)
> 
> In theory you shouldn't change the print message when doing such
> changes and you can still split it as:
> 
> 		return dev_err_probe(&pdev->dev, ret,
> 				     "can't get I2C peripheral clock, ret=%d\n",
> 				     ret);
> 
> and you're even within the 80 characters.

Since dev_err_probe always print the second parameter that happens to be the return value,
I remove the "ret=%d" from the original message to avoid a redundant error message.

So is it better to keep the original message unchanged, even though dev_err_probe also prints
the return error value? Or is it better to make this change so that all error messages printed
in the probe function include the return value in a consistent style?

> 
> Sorry, I missed it in the previous version, mind resending it?

Sure, I will resend it in v3.

Thanks.

> 
> Andi

-- 
BR
Liao, Chang
