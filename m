Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C552940A0
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Oct 2020 18:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394724AbgJTQg3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Oct 2020 12:36:29 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:15657 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394696AbgJTQg3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Oct 2020 12:36:29 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f8f11b00000>; Tue, 20 Oct 2020 09:34:56 -0700
Received: from [10.2.48.229] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct
 2020 16:36:28 +0000
Subject: Re: [PATCH v1] i2c: tegra: Fix i2c_writesl() to use writel() instead
 of writesl()
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <digetx@gmail.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <1603166634-13639-1-git-send-email-skomatineni@nvidia.com>
 <20201020074846.GA1877013@ulmo>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <538d8436-260d-40a8-b0a3-a822a0f9c909@nvidia.com>
Date:   Tue, 20 Oct 2020 09:37:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201020074846.GA1877013@ulmo>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603211696; bh=IRzx7toziwfEhCB0R8L4ncX6WNEWaogumr5debjdP10=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=h5ZsEBibHk2k0cNQ1TDHX1bj5qAuK2CkUOESSVGGNHGLDZ2oJKLIkTpoT50QVFcV9
         f45FrWGH9pf9JSIst1zTso8FtGwmXurkWQo1ZZ2yWhSsi1/xICDtbtCnpoerBS3SDz
         Wl4hAqM6zHyMSUlNTHCdEQpodJ8G+ljxaTQpK1ps3bTsp1dakFR6Tr4nh4qiOHURes
         ei3mhCg5l+5j8zHPmYmyBudRJKprWEneBfj3Ks8uZl5cw2vX4lB9EzGZKl986BC3bH
         bKkvrmxYO/zKx3gE4YQtWGxmMQdv1F2fMoT6WvrfcwpPqv9SREmMq15D0EE7h2tqGl
         QCrqq5uoywTiw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 10/20/20 12:48 AM, Thierry Reding wrote:
> On Mon, Oct 19, 2020 at 09:03:54PM -0700, Sowjanya Komatineni wrote:
>> VI I2C don't have DMA support and uses PIO mode all the time.
>>
>> Current driver uses writesl() to fill TX FIFO based on available
>> empty slots and with this seeing strange silent hang during any I2C
>> register access after filling TX FIFO with 8 words.
>>
>> Using writel() followed by i2c_readl() in a loop to write all words
>> to TX FIFO instead of using writesl() helps for large transfers in
>> PIO mode.
>>
>> So, this patch updates i2c_writesl() API to use writel() in a loop
>> instead of writesl().
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 6f08c0c..274bf3a 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -333,10 +333,13 @@ static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
>>   	return readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
>>   }
>>   
>> -static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
>> +static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, u32 *data,
>>   			unsigned int reg, unsigned int len)
>>   {
>> -	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
>> +	while (len--) {
>> +		writel(*data++, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
>> +		i2c_readl(i2c_dev, I2C_INT_STATUS);
>> +	}
>>   }
>>   
>>   static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
>> @@ -811,7 +814,7 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>>   		i2c_dev->msg_buf_remaining = buf_remaining;
>>   		i2c_dev->msg_buf = buf + words_to_transfer * BYTES_PER_FIFO_WORD;
>>   
>> -		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
>> +		i2c_writesl(i2c_dev, (u32 *)buf, I2C_TX_FIFO, words_to_transfer);
> I've thought a bit more about this and I wonder if we're simply reading
> out the wrong value for tx_fifo_avail and therefore end up overflowing
> the TX FIFO. Have you checked what the value is for tx_fifo_avail when
> this silent hang occurs? Given that this is specific to the VI I2C I'm
> wondering if this is perhaps a hardware bug where we read the wrong TX
> FIFO available count.
>
> Thierry

Yes FIFO status shows all 8 slots available.

Also, HW wise VI I2C is similar to other I2C and FIFO depth is also 8 
words. Confirmed from HW designers as well.

Using writesl() causes silent hang after filling some words in FIFO and 
most of time after filling 8 words and sometime after filling it with 
around 6 words.

I am not sure if this issue is specific to VI I2C alone as other I2C 
mostly use DMA for more than 8 words and I am not sure if we ever used 
other I2C in PIO mode for ~8 words transfer for slave devices we have on 
the platform.


Thanks

Sowjanya

