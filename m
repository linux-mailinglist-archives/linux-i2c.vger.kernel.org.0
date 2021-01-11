Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E672F1224
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 13:10:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbhAKMJs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 07:09:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbhAKMJs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Jan 2021 07:09:48 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D45C061794;
        Mon, 11 Jan 2021 04:09:07 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id p13so3259934ljg.2;
        Mon, 11 Jan 2021 04:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=goLhuBSCjKadHRs/kb9mxrURANG8pwV/Lx3k7y9BRdA=;
        b=AqnKiTZUVK21X8370FNmUj3Sz2Iey1OZNY4uXHU5eMX4HnREgpIfp/s0lXDBwPnRwi
         VO0nk8mZj8GMm8U1hGauT3MZz5+P9fbXI/WRZunC3fVpzS79VCcFebfVEdf30/Va5AsE
         2wbGQl+1Dx4Ns1aD4rVYr7wszSs4Qqfd/zi64R5tTOyzq5M2R6pO2JN1AWQ7zH7KKDCy
         Wzy9nRBcawAGSw64n0r6i6BE1WJT5Tl3cGVh5/iPZ3k7Vog5ffvuE5p51egXxp3Q1ZJL
         xbiCCxKznS+bhTAH/PCUtRB3DVUk1jAmjw0d/vXjMK+F8z1uCFb6QuUYmxVuvFKmncPs
         NAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=goLhuBSCjKadHRs/kb9mxrURANG8pwV/Lx3k7y9BRdA=;
        b=T0QvNbUhww2cTEq5l0LSLNbAPqvGrmEcFkk2otlhgGRWHPKQymGq0enE7t2i6CTOOw
         N+KG9e8STdYVyIX6edkVUy+mob0d3HE5w6RcbX9oW+E5XMNWJr9IrHCrlXTDqv82uBw6
         1lKAtbP4U8KMmY4fiFBwtVvUY7Vyy+R9nCKnyBHY9VFDZVxv3I9tMX6iRiJU2kHcSTzM
         Q1QD9fwoARKWdoPq86bGk2Wfcxrqtpx5vIXTjSo9w3ap1YBtVIH1dg3KOV9uOZA7zlE9
         RZworaOUQGGvxZgFreJFhJi0CXrz61//sfXdtcGucJ603hrr+kk6cbqBlKj0pvArzxmv
         4hZg==
X-Gm-Message-State: AOAM533kTDFuMUJc/cQDDQYmj/Wr9mq5NE1QKHpnMM/r7oci52/Szdme
        HGRDiwsT+4M6rhPVsEIO5IB9qoEiuPs=
X-Google-Smtp-Source: ABdhPJzyrAsqPpGUb6s4idPzfk61xUlntL22/9SRtL6KPIbtrwZfj0kayGdZlP8w0WhHUxcZnJLc8Q==
X-Received: by 2002:a2e:7102:: with SMTP id m2mr7610037ljc.245.1610366945794;
        Mon, 11 Jan 2021 04:09:05 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id q9sm3432947ljm.113.2021.01.11.04.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 04:09:05 -0800 (PST)
Subject: Re: [PATCH v1] i2c: tegra: Fix i2c_writesl() to use writel() instead
 of writesl()
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <1603166634-13639-1-git-send-email-skomatineni@nvidia.com>
 <20201020074846.GA1877013@ulmo>
 <538d8436-260d-40a8-b0a3-a822a0f9c909@nvidia.com>
 <c37f8618-5100-4087-3bc3-fe421d40f3b8@gmail.com>
Message-ID: <2212a21b-7dff-4ba0-a193-badd5a1770c8@gmail.com>
Date:   Mon, 11 Jan 2021 15:09:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <c37f8618-5100-4087-3bc3-fe421d40f3b8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

11.01.2021 14:50, Dmitry Osipenko пишет:
> 20.10.2020 19:37, Sowjanya Komatineni пишет:
>>
>> On 10/20/20 12:48 AM, Thierry Reding wrote:
>>> On Mon, Oct 19, 2020 at 09:03:54PM -0700, Sowjanya Komatineni wrote:
>>>> VI I2C don't have DMA support and uses PIO mode all the time.
>>>>
>>>> Current driver uses writesl() to fill TX FIFO based on available
>>>> empty slots and with this seeing strange silent hang during any I2C
>>>> register access after filling TX FIFO with 8 words.
>>>>
>>>> Using writel() followed by i2c_readl() in a loop to write all words
>>>> to TX FIFO instead of using writesl() helps for large transfers in
>>>> PIO mode.
>>>>
>>>> So, this patch updates i2c_writesl() API to use writel() in a loop
>>>> instead of writesl().
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>   drivers/i2c/busses/i2c-tegra.c | 9 ++++++---
>>>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>>> b/drivers/i2c/busses/i2c-tegra.c
>>>> index 6f08c0c..274bf3a 100644
>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>> @@ -333,10 +333,13 @@ static u32 i2c_readl(struct tegra_i2c_dev
>>>> *i2c_dev, unsigned int reg)
>>>>       return readl_relaxed(i2c_dev->base +
>>>> tegra_i2c_reg_addr(i2c_dev, reg));
>>>>   }
>>>>   -static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
>>>> +static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, u32 *data,
>>>>               unsigned int reg, unsigned int len)
>>>>   {
>>>> -    writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data,
>>>> len);
>>>> +    while (len--) {
>>>> +        writel(*data++, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev,
>>>> reg));
>>>> +        i2c_readl(i2c_dev, I2C_INT_STATUS);
>>>> +    }
>>>>   }
>>>>     static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
>>>> @@ -811,7 +814,7 @@ static int tegra_i2c_fill_tx_fifo(struct
>>>> tegra_i2c_dev *i2c_dev)
>>>>           i2c_dev->msg_buf_remaining = buf_remaining;
>>>>           i2c_dev->msg_buf = buf + words_to_transfer *
>>>> BYTES_PER_FIFO_WORD;
>>>>   -        i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
>>>> +        i2c_writesl(i2c_dev, (u32 *)buf, I2C_TX_FIFO,
>>>> words_to_transfer);
>>> I've thought a bit more about this and I wonder if we're simply reading
>>> out the wrong value for tx_fifo_avail and therefore end up overflowing
>>> the TX FIFO. Have you checked what the value is for tx_fifo_avail when
>>> this silent hang occurs? Given that this is specific to the VI I2C I'm
>>> wondering if this is perhaps a hardware bug where we read the wrong TX
>>> FIFO available count.
>>>
>>> Thierry
>>
>> Yes FIFO status shows all 8 slots available.
> 
> Please explain how you checked that 8 slots are available, provide
> example code.
> 

Have you checked the FIFO overflow interrupt?
