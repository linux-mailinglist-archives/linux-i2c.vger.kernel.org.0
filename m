Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B12AF76C609
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 09:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbjHBHDi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 03:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232249AbjHBHDh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 03:03:37 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A6C11A;
        Wed,  2 Aug 2023 00:03:36 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RG2vx10HbzVj6t;
        Wed,  2 Aug 2023 15:01:49 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 15:03:31 +0800
Message-ID: <25fe08ab-fb72-0b35-283a-ba86970ffd00@huawei.com>
Date:   Wed, 2 Aug 2023 15:03:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 9/9] i2c: synquacer: Use dev_err_probe in probe function
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     <florian.fainelli@broadcom.com>, <rjui@broadcom.com>,
        <sbranden@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
        <yangyicong@hisilicon.com>, <aisheng.dong@nxp.com>,
        <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
        <kblaiech@nvidia.com>, <asmaa@nvidia.com>,
        <loic.poulain@linaro.org>, <rfoss@kernel.org>, <ardb@kernel.org>,
        <gcherian@marvell.com>, <linux-i2c@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20230728013148.1720978-1-liaochang1@huawei.com>
 <20230728013148.1720978-10-liaochang1@huawei.com>
 <20230801214417.hivhbfhnmmgyxkes@intel.intel>
From:   "Liao, Chang" <liaochang1@huawei.com>
In-Reply-To: <20230801214417.hivhbfhnmmgyxkes@intel.intel>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



在 2023/8/2 5:44, Andi Shyti 写道:
> Hi Liao,
> 
> On Fri, Jul 28, 2023 at 09:31:48AM +0800, Liao Chang wrote:
>> Use the dev_err_probe function instead of dev_err in the probe function
>> so that the printed messge includes the return value and also handles
>> -EPROBE_DEFER nicely.
>>
>> Signed-off-by: Liao Chang <liaochang1@huawei.com>
>> ---
>>  drivers/i2c/busses/i2c-synquacer.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
>> index 4cc196ca8f6d..cc2af638bfdd 100644
>> --- a/drivers/i2c/busses/i2c-synquacer.c
>> +++ b/drivers/i2c/busses/i2c-synquacer.c
>> @@ -557,11 +557,8 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
>>  		dev_dbg(&pdev->dev, "clock source %p\n", i2c->pclk);
>>  
>>  		ret = clk_prepare_enable(i2c->pclk);
>> -		if (ret) {
>> -			dev_err(&pdev->dev, "failed to enable clock (%d)\n",
>> -				ret);
>> -			return ret;
>> -		}
>> +		if (ret)
>> +			return dev_err_probe(&pdev->dev, ret, "failed to enable clock\n");
>>  		i2c->pclkrate = clk_get_rate(i2c->pclk);
>>  	}
> 
> here you forgot a few, as well.

Thanks for your feedback, i will improve these patches in next revision.

> 
> Andi

-- 
BR
Liao, Chang
