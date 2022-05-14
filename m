Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDDD526EF9
	for <lists+linux-i2c@lfdr.de>; Sat, 14 May 2022 09:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbiENC4T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 May 2022 22:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbiENC4B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 May 2022 22:56:01 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE12E2F0A2A;
        Fri, 13 May 2022 19:11:41 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L0TTF0NSQzGpXB;
        Sat, 14 May 2022 10:08:49 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 14 May 2022 10:11:39 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 14 May 2022 10:11:39 +0800
Subject: Re: [PATCH -next 1/2] i2c: mt7621: fix missing
 clk_disable_unprepare() on error in mtk_i2c_probe()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
CC:     <matthias.bgg@gmail.com>, <sr@denx.de>, <wsa@the-dreams.de>
References: <20220513100819.2711845-1-yangyingliang@huawei.com>
 <0fa271ed-e61e-4415-a78f-b2dee74b2f98@wanadoo.fr>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <4958c580-bcdb-c4bf-7669-b4ced4c2ec2f@huawei.com>
Date:   Sat, 14 May 2022 10:11:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0fa271ed-e61e-4415-a78f-b2dee74b2f98@wanadoo.fr>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2022/5/14 0:15, Christophe JAILLET wrote:
> Le 13/05/2022 à 12:08, Yang Yingliang a écrit :
>> Fix the missing clk_disable_unprepare() before return
>> from mtk_i2c_probe() in the error handling case.
>>
>> Fixes: d04913ec5f89 ("i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C 
>> driver")
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/i2c/busses/i2c-mt7621.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-mt7621.c 
>> b/drivers/i2c/busses/i2c-mt7621.c
>> index 45fe4a7fe0c0..f117c3d9ca19 100644
>> --- a/drivers/i2c/busses/i2c-mt7621.c
>> +++ b/drivers/i2c/busses/i2c-mt7621.c
>> @@ -304,7 +304,8 @@ static int mtk_i2c_probe(struct platform_device 
>> *pdev)
>>         if (i2c->bus_freq == 0) {
>>           dev_warn(i2c->dev, "clock-frequency 0 not supported\n");
>> -        return -EINVAL;
>> +        ret = -EINVAL;
>> +        goto err_disable_clk;
>>       }
>>         adap = &i2c->adap;
>> @@ -322,10 +323,13 @@ static int mtk_i2c_probe(struct platform_device 
>> *pdev)
>>         ret = i2c_add_adapter(adap);
>>       if (ret < 0)
>> -        return ret;
>> +        goto err_disable_clk;
>>         dev_info(&pdev->dev, "clock %u kHz\n", i2c->bus_freq / 1000);
>
> Hi,
>
> should'nt we have a:
>     return 0;
> here?
>
> otherwise we will call clk_disable_unprepare() even on the normal path.
Yes, I missed that.

Thanks,
Yang
>
> CJ
>
>>   +err_disable_clk:
>> +    clk_disable_unprepare(i2c->clk);
>> +
>>       return ret;
>>   }
>
> .
