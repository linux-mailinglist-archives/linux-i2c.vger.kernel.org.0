Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76B57427A9
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 15:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408318AbfFLNdh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 09:33:37 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51406 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439479AbfFLNdg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jun 2019 09:33:36 -0400
Received: by mail-wm1-f67.google.com with SMTP id 207so6620732wma.1;
        Wed, 12 Jun 2019 06:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6QOmpDg170puBoKS+Qk9XDoHmsIWXzOrecd1kjwAOVs=;
        b=BNePCREstsBQaIaOd7BRgPJUwhItGBY/CSSQgPoOzMBsN8ldxSoQkO+yf9GBX9yjAg
         rSnl7cUHEqSuqLcMVqfIJmK+D6LmxfPP6FwxPj079GgLoO5rRfvIP8wHxpkCKF6a29nj
         /XTnGitcyKK+QXQMCZOmvpgzJihVNq6OnXzmv1xlljmli3mInnzhF9yShW7+2xUiYATQ
         qMJ1cJPgZ6xWMAEvf5hw9WrIUDRtKO/ewacENgHoMz2oWNV1iuf429wO3Yx7XxdIL+ts
         e78jWN7785JzW/7th6UWKgWru6hIlvkdccmxTJnoI8n9jn2TVyEt9nx799BUxHzLHIXL
         pLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6QOmpDg170puBoKS+Qk9XDoHmsIWXzOrecd1kjwAOVs=;
        b=tUminM+YaUlTxwztxhBhJmbBLZCSju0hdweYNBXKfE3X/KAiQ38lJFNg1XX2S0PKC5
         tNqRGIbEiHHFgElWI8Dxn3OaEN6bcLSgMt79pmzR5rj0J9ayvYaSLPTCP7kdzM84+6Fa
         tZKwZnNRPfuTCzkNtlDKNGplyXfqCCJkDqsPCsKBv9/sebkRGa3bYUF1fZ0eSIrdCgq/
         k9RvLSoNzSoj0wSYIm3ZMTrK5ckV69HysagDKvttgQxbM+jJpfc7kMKNpu+8klmd3McI
         5rxTaRjVXbjP0TSZBofucJS46IdLP7nuOiaZLfQGNCP7g5UZTUI7Gmzw661OMTKRFxaO
         5WrA==
X-Gm-Message-State: APjAAAVeuM5ntyzLZGxbzTwG75xyi+fG+G/Q0cHKiC28hT2jaqQ1RoKB
        DIU/3axTRXcLHjeszLkKKlY=
X-Google-Smtp-Source: APXvYqzidKRHmezXKLPZ/QzEAAg9UhlNnXGLsSsgSZzrIbHVdZUAxBNmjdwPZsQ8n32/ZvsZC7PurQ==
X-Received: by 2002:a1c:2907:: with SMTP id p7mr21837515wmp.100.1560346414548;
        Wed, 12 Jun 2019 06:33:34 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id 17sm4630819wmx.47.2019.06.12.06.33.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 06:33:33 -0700 (PDT)
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
 <e733bcb0-ea8c-61d1-e6b5-cee8b7696c70@gmail.com>
 <fe0a0cb2-73e3-8f5c-8115-f99c150bd5df@nvidia.com>
 <d29804b9-d3be-9eb2-ba06-f4de2aad3764@gmail.com>
 <acb7970e-b1b2-ce14-d822-fc74ca7751fb@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <740f00e5-728a-e31d-28bb-193c7061753c@gmail.com>
Date:   Wed, 12 Jun 2019 16:33:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <acb7970e-b1b2-ce14-d822-fc74ca7751fb@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

11.06.2019 21:22, Bitan Biswas пишет:
> 
> 
> On 6/11/19 4:34 AM, Dmitry Osipenko wrote:
>> 11.06.2019 10:38, Bitan Biswas пишет:
>>>
>>>
>>> On 6/10/19 2:00 PM, Dmitry Osipenko wrote:
>>>> 10.06.2019 22:41, Bitan Biswas пишет:
>>>>>
>>>>>
>>>>> On 6/10/19 11:12 AM, Dmitry Osipenko wrote:
>>>>>> 10.06.2019 20:08, Bitan Biswas пишет:
>>>>>>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>>>>>>> as needed. Remove BUG() and make Rx and Tx case handling
>>>>>>> similar.
>>>>>>>
>>>>>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>>>>>> ---
>>>>>>>     drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
>>>>>>>     1 file changed, 6 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> Looks that this is still not correct. What if it transfer-complete
>>>>>> flag
>>>>>> is set and buffer is full on RX? In this case the transfer will
>>>>>> succeed
>>>>>> while it was a failure.
>>>>>>
>>>>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>>>>>> b/drivers/i2c/busses/i2c-tegra.c
>>>>>>> index 4dfb4c1..30619d6 100644
>>>>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>>>>> @@ -515,7 +515,6 @@ static int tegra_i2c_empty_rx_fifo(struct
>>>>>>> tegra_i2c_dev *i2c_dev)
>>>>>>>          * prevent overwriting past the end of buf
>>>>>>>          */
>>>>>>>         if (rx_fifo_avail > 0 && buf_remaining > 0) {
>>>>>>> -        BUG_ON(buf_remaining > 3);
>>>>>>
>>>>>> Actually error should be returned here since out-of-bounds memory
>>>>>> accesses must be avoided, hence:
>>>>>>
>>>>>>       if (WARN_ON_ONCE(buf_remaining > 3))
>>>>>>           return -EINVAL;
>>>>> buf_remaining will be less than equal to 3 because of the expression
>>>>> earlier
>>>>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-tegra.c#L520
>>>>>
>>>>>
>>>>>
>>>>
>>>> Ah yes, indeed!
>>>>
>>> I see that I am wrong and buf_remaining > 3 needs to be prevented at
>>>
>>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-tegra.c#L528
>>>
>>>
>>>
>>> because of word_to_transfer is limited to rx_fifo_avail:
>>>
>>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-tegra.c#L515
>>>
>>>
>>>
>>> I shall add the check for less than 3 in both RX and TX cases in a
>>> separate patch in this series.
>>
>> When word_to_transfer is more than rx_fifo_avail, then the rx_fifo_avail
>> becomes zero and hence the nibbles won't be copied. Please take a closer
>> look, the current code is correct, but the buf_remaining > 3 is unneeded
>> because it can't ever happen.
>>
>> The code is structured the way that it's difficult to follow, apparently
>> the person who added the BUG_ON check in the first place couldn't follow
>> it either. Maybe it's worth to invest some more effort into refactoring
>> at least that part of the code. At minimum a clarifying comments would
>> be helpful.
>>
> I shall try to add some comments near the BUG_ON check.
> 
>> [snip]
>>
>>>>>> Then here:
>>>>>>
>>>>>>       if (WARN_ON_ONCE(!i2c_dev->msg_buf_remaining) ||
>>>>>>           tegra_i2c_empty_rx_fifo(i2c_dev)) {
>>>>>>           i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
>>>>>>           goto err;
>>>>>>       }
>>>>>>
>>>>> Can you please elaborate why the condition needs to be as follows
>>>>> instead of " if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) " ?
>>>>>
>>>>>>        if (WARN_ON_ONCE(!i2c_dev->msg_buf_remaining) ||
>>>>>>            tegra_i2c_empty_rx_fifo(i2c_dev)) {
>>>>
>>>> Because this is a "receive" transfer and hence it is a error condition
>>>> if the data-message was already fully received and then there is
>>>> another
>>>> request from hardware to receive more data. So
>>>> "!i2c_dev->msg_buf_remaining" is the error condition here because there
>>>> is no more space in the buffer.
>>>>
>>>> Looking at this again, seems checking for "if
>>>> (WARN_ON_ONCE(rx_fifo_avail))" in the above hunk [1] will be already
>>>> enough since a not fully drained RX FIFO means that there is no enough
>>>> space in the buffer. Then it could be:
>>>>
>>>>           if (tegra_i2c_empty_rx_fifo(i2c_dev)) {
>>>>                   i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
>>>>                   goto err;
>>>>      }
>>>>
>>> In the case "if (status & I2C_INT_PACKET_XFER_COMPLETE) {" , we do not
>>> have any tegra_i2c_empty_rx_fifo call today. In this current driver I do
>>> not see any code that checks for the buffer space and prevents RX FIFO
>>> from being drained. The transfer complete when seen must have already
>>> consumed all bytes of msg_buf_remaining in the call at the line
>>>
>>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-tegra.c#L860
>>>
>>>
>>>
>>> So we can put the "WARN_ON_ONCE(i2c_dev->msg_buf_remaining) with msg_err
>>> assignment and goto err" to confirm if some corner case is not handled.
>>>
>>> Planning to share updated patch.
>>
>> There are two possible error conditions:
>>
>> 1) Underflow: the XFER_COMPLETE happens before message is fully sent.
>>
>> 2) Overflow: message is fully sent, but there is no XFER_COMPLETE and
>> then hardware asks to transfer more.
>>
>> We are addressing the second case here, while you seems are confusing it
>> with the first case.
>>
> Is the Overflow case pointed above corresponding to when
> msg_buf_remaining is zero?

Yes!

 If no, what indicates that message is fully
> sent? I see that if msg_buf_remaining is already zero, the call
> tegra_i2c_empty_rx_fifo will not do any copy of the bytes from FIFO to buf.
> 
> One more point that is not clear to me is are the above suggestions you
> made is corresponding to replacing below line in linux-next ?
> 
> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-tegra.c#L888

That addresses the "underflow" case. I'm not suggesting to replace it at
all. I was talking about replacing this and nothing else:

https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-tegra.c#L862

> Can you please also review the newly added patch "V5 6/7 "that was newly
> posted? I think it is needed.

Sure.
