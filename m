Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FFBB3BDF2
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 23:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389655AbfFJVAa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 17:00:30 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38401 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389601AbfFJVA3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 17:00:29 -0400
Received: by mail-lj1-f195.google.com with SMTP id o13so9350392lji.5;
        Mon, 10 Jun 2019 14:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g39p7pRbpSMDIScu67WyJzsZf6+u/by8lux69Jz2cl8=;
        b=QXXUVR6QusQtKBkGw7HTMu/34srrz9pCvPEa4akXuQPbujOakR7RHqKsJchjjTfReI
         eJJFDpW9UcUFJf+Tl03K8dr3cOGVjCD2BOLCe+rPUZ9XjBqPVZSu42qldz79rwdpERW/
         RFawvmqH9SKjv9tTnWV871sVOMUdqTPGXcNaeQyvl94UBf9wH6mZEWa2kKxL+DXqodWv
         hxut4ACxkEehrW14zX1UnCC5MpE8RlECl/XrEMFubK6YG+ESugvOlfSBKq7bgnPN3VwG
         KnnvwdZ+4S4YdTNpaIaPP7NtlrKSVquZ4VxssTMxTRBtgh3P+fPlW7WYp8v5FVfy2Xox
         BCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g39p7pRbpSMDIScu67WyJzsZf6+u/by8lux69Jz2cl8=;
        b=sTzVfw5AW5WsiW10IwQOh8Vy8uWYLTECqT2/21ayj3SUyaFx6+kE/LYjlaJwEDds/Y
         5otF1Be1cSTedAzmsxPidfrh38HyhN2TiCcxTOMYlEf84xh1dtVCBhizpFLIacYOHjBs
         eDCfaVl8As/m+Sign/i9MJv6llvjBPQ0PA+dN9na3qOLn1mz8D4nd2zUdR7yGBkWFt8V
         vjdC8jeocfwnMZrsXhL2aKokVFw5Cy1vWXrAMWNTjmUbP44mFFYX6DpLQktxrXY6X0mA
         4OGJLqdKr8XnAcrGMz9srGP5grTKdqXhJ1LFIWNNUZuVWbzmylJdg8OJQSrVKe41pcc3
         fDxg==
X-Gm-Message-State: APjAAAVZ/qKhJkBXO7+CEk+T0pzA8gDnvr4bmOoS6BjVxXXPA1JxJhps
        lQx61wAIB6LqBbT95YxI7vQ=
X-Google-Smtp-Source: APXvYqzErDgp4F/CXL3VLNDHYkwE8ezP/+CchX6/UREHrJR5e5TWTFaYaVBWCXkQKgw4LdVR1j6DmA==
X-Received: by 2002:a2e:5b0f:: with SMTP id p15mr19533438ljb.82.1560200426706;
        Mon, 10 Jun 2019 14:00:26 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id m25sm2192641lfp.97.2019.06.10.14.00.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 14:00:25 -0700 (PDT)
Subject: Re: [PATCH V4 6/6] i2c: tegra: remove BUG, BUG_ON
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1560186515-30797-1-git-send-email-bbiswas@nvidia.com>
 <1560186515-30797-6-git-send-email-bbiswas@nvidia.com>
 <06ab30b6-bf79-c628-0a04-d0307511a06f@gmail.com>
 <851d7837-5b98-228e-d8c9-3c41be1fb2e0@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e733bcb0-ea8c-61d1-e6b5-cee8b7696c70@gmail.com>
Date:   Tue, 11 Jun 2019 00:00:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <851d7837-5b98-228e-d8c9-3c41be1fb2e0@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

10.06.2019 22:41, Bitan Biswas пишет:
> 
> 
> On 6/10/19 11:12 AM, Dmitry Osipenko wrote:
>> 10.06.2019 20:08, Bitan Biswas пишет:
>>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>>> as needed. Remove BUG() and make Rx and Tx case handling
>>> similar.
>>>
>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>> ---
>>>   drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
>>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> Looks that this is still not correct. What if it transfer-complete flag
>> is set and buffer is full on RX? In this case the transfer will succeed
>> while it was a failure.
>>
>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>> b/drivers/i2c/busses/i2c-tegra.c
>>> index 4dfb4c1..30619d6 100644
>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> @@ -515,7 +515,6 @@ static int tegra_i2c_empty_rx_fifo(struct
>>> tegra_i2c_dev *i2c_dev)
>>>        * prevent overwriting past the end of buf
>>>        */
>>>       if (rx_fifo_avail > 0 && buf_remaining > 0) {
>>> -        BUG_ON(buf_remaining > 3);
>>
>> Actually error should be returned here since out-of-bounds memory
>> accesses must be avoided, hence:
>>
>>     if (WARN_ON_ONCE(buf_remaining > 3))
>>         return -EINVAL;
> buf_remaining will be less than equal to 3 because of the expression
> earlier
> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-tegra.c#L520
> 

Ah yes, indeed!

> 
>>
>>>           val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>>>           val = cpu_to_le32(val);
>>>           memcpy(buf, &val, buf_remaining);
>>> @@ -523,7 +522,6 @@ static int tegra_i2c_empty_rx_fifo(struct
>>> tegra_i2c_dev *i2c_dev)
>>>           rx_fifo_avail--;
>>>       }
>>>   -    BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
>>
>> Better not to ignore this as well:
>>
>>     if (WARN_ON_ONCE(rx_fifo_avail > 0 &&
>>              buf_remaining > 0))
>>         return -EINVAL;
>>
> Please check below line.
> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-tegra.c#L532
> 
> 
> It ensures that buf_remaining will be 0 and we never hit the BUG_ON as
> follows:

[1] Okay, but it doesn't ensure about rx_fifo_avail. So it could be:

	if (WARN_ON_ONCE(rx_fifo_avail))
		return -EINVAL;

>>> -    BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
> 
>>>       i2c_dev->msg_buf_remaining = buf_remaining;
>>>       i2c_dev->msg_buf = buf;
>>>   @@ -581,7 +579,6 @@ static int tegra_i2c_fill_tx_fifo(struct
>>> tegra_i2c_dev *i2c_dev)
>>>        * boundary and fault.
>>>        */
>>>       if (tx_fifo_avail > 0 && buf_remaining > 0) {
>>> -        BUG_ON(buf_remaining > 3);
>>
>> And here, cause this will corrupt stack:
>>
>>         if (WARN_ON_ONCE(buf_remaining > 3))
>>             return -EINVAL;
>>
> Please check the line
> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-tegra.c#L576
> 
> 
> It ensures buf_remaining will be less or equal to 3.

Okay, agree here.

>>>           memcpy(&val, buf, buf_remaining);
>>>           val = le32_to_cpu(val);
>>>   @@ -850,7 +847,8 @@ static irqreturn_t tegra_i2c_isr(int irq, void
>>> *dev_id)
>>>               if (i2c_dev->msg_buf_remaining)
>>>                   tegra_i2c_empty_rx_fifo(i2c_dev);
>>>               else
>>> -                BUG();
>>> +                tegra_i2c_mask_irq(i2c_dev,
>>> +                           I2C_INT_RX_FIFO_DATA_REQ);
>>
>> Then here:
>>
>>     if (WARN_ON_ONCE(!i2c_dev->msg_buf_remaining) ||
>>         tegra_i2c_empty_rx_fifo(i2c_dev)) {
>>         i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
>>         goto err;
>>     }
>>
> Can you please elaborate why the condition needs to be as follows
> instead of " if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) " ?
> 
>>     if (WARN_ON_ONCE(!i2c_dev->msg_buf_remaining) ||
>>         tegra_i2c_empty_rx_fifo(i2c_dev)) {

Because this is a "receive" transfer and hence it is a error condition
if the data-message was already fully received and then there is another
request from hardware to receive more data. So
"!i2c_dev->msg_buf_remaining" is the error condition here because there
is no more space in the buffer.

Looking at this again, seems checking for "if
(WARN_ON_ONCE(rx_fifo_avail))" in the above hunk [1] will be already
enough since a not fully drained RX FIFO means that there is no enough
space in the buffer. Then it could be:

        if (tegra_i2c_empty_rx_fifo(i2c_dev)) {
                i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
                goto err;
	}
