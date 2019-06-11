Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF823CA19
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 13:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389757AbfFKLeb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 07:34:31 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35188 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389464AbfFKLe2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jun 2019 07:34:28 -0400
Received: by mail-wm1-f67.google.com with SMTP id c6so2548935wml.0;
        Tue, 11 Jun 2019 04:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xR4/a7WNVnNdjKkXcp0HNzgqcmAgdkLcmZguQx5VvlQ=;
        b=qzo+X11GrhC5BDiJLSpozKbqeKqNvhq2jKTCVZm083pNo2Ihhx93TCoxtntHPfevkg
         4hM2iviNBsCIq+6zmcmcli980dNUme6a3mTf9NNKirMJEihwX6w+oopE4oFtk9V8VkOO
         RQ5D2qgydIadpFJoq+1887jK2JDzIcTgAR9qdkrkpNlI2IlpR5R5N2M25ouXYL9Gykuz
         bw2Do20eoNl0rlQo4aupvj+ASGXqJUzl+fUVFc1gSdun7W7jnaA2ZQow7ULhro/3Cji9
         r27+F7/O47b0B4Sgbie+8wIrdt8cnZH923A7Z/hQXhbQtVfcBOjFyWsFzw/nnwrldiin
         A/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xR4/a7WNVnNdjKkXcp0HNzgqcmAgdkLcmZguQx5VvlQ=;
        b=SE2EqR3LJfiLAa/UjnLre3PYOB+Iw09XPZwtcum2EQxYSOZngFsWLX9cXSLQ4L6xzk
         M48efmZh7Wi0FDOGnU8G4XlWZpYKXMeyZXOWKd/NuHf+qFdW8rj8yieyVtL9B5DLrKl+
         k+K9ij1SS9o6fTkl3dVDZVgZUF3PJcsaC4sc4Tsh6p1hoBStjjsBSUY/6bBX8YBo4DiX
         IJbANx3iIMtBD7PkVm/G9wNmLwY894sjdVAauczybEFCQx+8LXQ50MvipqJzPCQrcSeD
         fwzGnZMIxS9PhznUuUcT2yo+TvJafgvKelpweIC2zm5t9XIDXEJetlltoazXL4jO7Oxl
         taPg==
X-Gm-Message-State: APjAAAX9JmIK7MY0on7VxzVgb+hoJ6un0tRgvK/BC4iKj5lJZGJW+yGg
        6hS6DvgA6ooeguvjsLPIZj0=
X-Google-Smtp-Source: APXvYqzdFvEtmnkJFJOhgbFmhecGdB6F6cGpfC6vK5Qgf9dE5cH3VgDNQpTq9HloLsQfZPJX4J/4hA==
X-Received: by 2002:a1c:a783:: with SMTP id q125mr18264200wme.94.1560252866238;
        Tue, 11 Jun 2019 04:34:26 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id l1sm2795180wmg.13.2019.06.11.04.34.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 04:34:25 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d29804b9-d3be-9eb2-ba06-f4de2aad3764@gmail.com>
Date:   Tue, 11 Jun 2019 14:34:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <fe0a0cb2-73e3-8f5c-8115-f99c150bd5df@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

11.06.2019 10:38, Bitan Biswas пишет:
> 
> 
> On 6/10/19 2:00 PM, Dmitry Osipenko wrote:
>> 10.06.2019 22:41, Bitan Biswas пишет:
>>>
>>>
>>> On 6/10/19 11:12 AM, Dmitry Osipenko wrote:
>>>> 10.06.2019 20:08, Bitan Biswas пишет:
>>>>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>>>>> as needed. Remove BUG() and make Rx and Tx case handling
>>>>> similar.
>>>>>
>>>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>>>> ---
>>>>>    drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
>>>>>    1 file changed, 6 insertions(+), 5 deletions(-)
>>>>
>>>> Looks that this is still not correct. What if it transfer-complete flag
>>>> is set and buffer is full on RX? In this case the transfer will succeed
>>>> while it was a failure.
>>>>
>>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>>>> b/drivers/i2c/busses/i2c-tegra.c
>>>>> index 4dfb4c1..30619d6 100644
>>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>>> @@ -515,7 +515,6 @@ static int tegra_i2c_empty_rx_fifo(struct
>>>>> tegra_i2c_dev *i2c_dev)
>>>>>         * prevent overwriting past the end of buf
>>>>>         */
>>>>>        if (rx_fifo_avail > 0 && buf_remaining > 0) {
>>>>> -        BUG_ON(buf_remaining > 3);
>>>>
>>>> Actually error should be returned here since out-of-bounds memory
>>>> accesses must be avoided, hence:
>>>>
>>>>      if (WARN_ON_ONCE(buf_remaining > 3))
>>>>          return -EINVAL;
>>> buf_remaining will be less than equal to 3 because of the expression
>>> earlier
>>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-tegra.c#L520
>>>
>>>
>>
>> Ah yes, indeed!
>>
> I see that I am wrong and buf_remaining > 3 needs to be prevented at
> 
> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-tegra.c#L528
> 
> 
> because of word_to_transfer is limited to rx_fifo_avail:
> 
> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-tegra.c#L515
> 
> 
> I shall add the check for less than 3 in both RX and TX cases in a
> separate patch in this series.

When word_to_transfer is more than rx_fifo_avail, then the rx_fifo_avail
becomes zero and hence the nibbles won't be copied. Please take a closer
look, the current code is correct, but the buf_remaining > 3 is unneeded
because it can't ever happen.

The code is structured the way that it's difficult to follow, apparently
the person who added the BUG_ON check in the first place couldn't follow
it either. Maybe it's worth to invest some more effort into refactoring
at least that part of the code. At minimum a clarifying comments would
be helpful.

[snip]

>>>> Then here:
>>>>
>>>>      if (WARN_ON_ONCE(!i2c_dev->msg_buf_remaining) ||
>>>>          tegra_i2c_empty_rx_fifo(i2c_dev)) {
>>>>          i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
>>>>          goto err;
>>>>      }
>>>>
>>> Can you please elaborate why the condition needs to be as follows
>>> instead of " if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) " ?
>>>
>>>>       if (WARN_ON_ONCE(!i2c_dev->msg_buf_remaining) ||
>>>>           tegra_i2c_empty_rx_fifo(i2c_dev)) {
>>
>> Because this is a "receive" transfer and hence it is a error condition
>> if the data-message was already fully received and then there is another
>> request from hardware to receive more data. So
>> "!i2c_dev->msg_buf_remaining" is the error condition here because there
>> is no more space in the buffer.
>>
>> Looking at this again, seems checking for "if
>> (WARN_ON_ONCE(rx_fifo_avail))" in the above hunk [1] will be already
>> enough since a not fully drained RX FIFO means that there is no enough
>> space in the buffer. Then it could be:
>>
>>          if (tegra_i2c_empty_rx_fifo(i2c_dev)) {
>>                  i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
>>                  goto err;
>>     }
>>
> In the case "if (status & I2C_INT_PACKET_XFER_COMPLETE) {" , we do not
> have any tegra_i2c_empty_rx_fifo call today. In this current driver I do
> not see any code that checks for the buffer space and prevents RX FIFO
> from being drained. The transfer complete when seen must have already
> consumed all bytes of msg_buf_remaining in the call at the line
> 
> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-tegra.c#L860
> 
> 
> So we can put the "WARN_ON_ONCE(i2c_dev->msg_buf_remaining) with msg_err
> assignment and goto err" to confirm if some corner case is not handled.
> 
> Planning to share updated patch.

There are two possible error conditions:

1) Underflow: the XFER_COMPLETE happens before message is fully sent.

2) Overflow: message is fully sent, but there is no XFER_COMPLETE and
then hardware asks to transfer more.

We are addressing the second case here, while you seems are confusing it
with the first case.
