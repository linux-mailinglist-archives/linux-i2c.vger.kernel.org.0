Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3DE26FAB6
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Sep 2020 12:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgIRKhd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Sep 2020 06:37:33 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:48420 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725941AbgIRKhd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 18 Sep 2020 06:37:33 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id DCCD93B05D18F5165875;
        Fri, 18 Sep 2020 18:37:30 +0800 (CST)
Received: from [10.174.179.63] (10.174.179.63) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Fri, 18 Sep 2020 18:37:24 +0800
Subject: Re: [PATCH -next] i2c: efm32: Use
 devm_platform_get_and_ioremap_resource()
To:     Yicong Yang <yangyicong@hisilicon.com>
CC:     <cj.chengjian@huawei.com>, <huawei.libin@huawei.com>,
        <wsa@kernel.org>, <u.kleine-koenig@pengutronix.de>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200918082508.32427-1-bobo.shaobowang@huawei.com>
 <961c1feb-f818-f98c-f618-57c643bac04c@hisilicon.com>
From:   "Wangshaobo (bobo)" <bobo.shaobowang@huawei.com>
Message-ID: <01032e87-f334-c586-2baa-78919310d736@huawei.com>
Date:   Fri, 18 Sep 2020 18:37:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <961c1feb-f818-f98c-f618-57c643bac04c@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.63]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


在 2020/9/18 18:01, Yicong Yang 写道:
> On 2020/9/18 16:25, Wang ShaoBo wrote:
>> Make use of devm_platform_get_and_ioremap_resource() provided by
>> driver core platform instead of duplicated analogue. dev_err() is
>> removed because it has been done in devm_ioremap_resource().
>>
>> Signed-off-by: Wang ShaoBo <bobo.shaobowang@huawei.com>
>> ---
>>   drivers/i2c/busses/i2c-efm32.c | 12 +++---------
>>   1 file changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-efm32.c b/drivers/i2c/busses/i2c-efm32.c
>> index 838ce0947191..f6e13ceeb2b3 100644
>> --- a/drivers/i2c/busses/i2c-efm32.c
>> +++ b/drivers/i2c/busses/i2c-efm32.c
>> @@ -332,21 +332,15 @@ static int efm32_i2c_probe(struct platform_device *pdev)
>>   		return ret;
>>   	}
>>   
>> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -	if (!res) {
>> -		dev_err(&pdev->dev, "failed to determine base address\n");
>> -		return -ENODEV;
>> -	}
>> +	ddata->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>> +	if (IS_ERR(ddata->base))
>> +		return PTR_ERR(ddata->base);
>>   
>>   	if (resource_size(res) < 0x42) {
> res is not assigned. should it be removed?

I am not sure what you want to ask, but devm_platform_get_and_ioremap_resource() will
assign variable res a value, if it is NULL, internal devm_ioremap_resource() will return error
at the begining, so at this time if(IS_ERR(ddata->base)) true and terminate the process,
which is as same as the original sentences work.

>>   		dev_err(&pdev->dev, "memory resource too small\n");
>>   		return -EINVAL;
>>   	}
>>   
>> -	ddata->base = devm_ioremap_resource(&pdev->dev, res);
>> -	if (IS_ERR(ddata->base))
>> -		return PTR_ERR(ddata->base);
>> -
>>   	ret = platform_get_irq(pdev, 0);
>>   	if (ret <= 0) {
>>   		if (!ret)
> .
