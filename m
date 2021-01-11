Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACD92F11EE
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 12:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730059AbhAKLvY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 06:51:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730043AbhAKLvY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Jan 2021 06:51:24 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76CF2C061786;
        Mon, 11 Jan 2021 03:50:43 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id m10so3200997lji.1;
        Mon, 11 Jan 2021 03:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vTI1WxAXAyZoc0sbljogjkNd8YVaWdhlqCbqUQn2+ig=;
        b=kzyL6iKdlZ2m3sRhxGKafAeR1sbG44X4GxfOIjokf1uNAb6EhK2IBmvKSV3B78oGM5
         wpXkDceDs0rbSovdhCpsIb4MjWsaDonk2srdBrL9tgjBGdxR2dpxeLAWsbgk0NgtdpZF
         8W10CTUfqvx74OrQ+COkB/OE1cC/F3brLkmnbo7Uw/gv9Ojjf/iN06zsDcEmxTZF5uG4
         2OyzD/XPOLK56j7aqnMj8v1Rx42bixbXt3szRvtL7dMu0w8jx5EhCdFjIftlUfzFOK0g
         LfIDV68ZJT9QPN9cDw5RZdonuFANC9P6anuV9dloBtxdYabdyoufR5s6Qb074bBbPJ78
         vxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vTI1WxAXAyZoc0sbljogjkNd8YVaWdhlqCbqUQn2+ig=;
        b=f1H6KTN3L+AmzeLTAATspAG9KrpCF7wPf6ZYZL4QW0EpOgD9hQ1ccogkNf6dszjBQA
         u8ZbrO1GSrKKC4OnuNXEzwkcoAaYLWuJLBxNCVvuB7r/uW1y57CYXU1eBRIKpvdznVi3
         +o5l4gahFLFcziqnxBmeoHMycFiyywyaSe10YjtwXeUv8hw0TfuPOTW3rNHuyrdk90O/
         LBOFxlsI9tD9SAMwUvs9LhxEGofcddCD9TQFYqCYeJ/McS2sN4VLdGihjt7j/chDcMO6
         IE1a58UzUTesj3CvDPBUaqWYV+SKQuKwWMAxj1SbOrOlDtI8/U1r+HhDSPCupkTXPeCj
         9eNQ==
X-Gm-Message-State: AOAM532RUqTl4QNwvhtVlOQ4t3wmYWSq2jCeKYmCiCuiqQDKhgLTfso6
        QfZPD0Xj6EDPXomWmbj8LbjClQU1rKg=
X-Google-Smtp-Source: ABdhPJyQWudebd9/Js074jVrL4zhfhBZvQJHV/ikewtGd3LA5wElbGRkKVEB7hPP/9rNtDzgbBjmTQ==
X-Received: by 2002:a2e:780d:: with SMTP id t13mr7015117ljc.144.1610365841904;
        Mon, 11 Jan 2021 03:50:41 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id n133sm3079342lfd.152.2021.01.11.03.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 03:50:41 -0800 (PST)
Subject: Re: [PATCH v1] i2c: tegra: Fix i2c_writesl() to use writel() instead
 of writesl()
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <1603166634-13639-1-git-send-email-skomatineni@nvidia.com>
 <20201020074846.GA1877013@ulmo>
 <538d8436-260d-40a8-b0a3-a822a0f9c909@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c37f8618-5100-4087-3bc3-fe421d40f3b8@gmail.com>
Date:   Mon, 11 Jan 2021 14:50:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <538d8436-260d-40a8-b0a3-a822a0f9c909@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

20.10.2020 19:37, Sowjanya Komatineni пишет:
> 
> On 10/20/20 12:48 AM, Thierry Reding wrote:
>> On Mon, Oct 19, 2020 at 09:03:54PM -0700, Sowjanya Komatineni wrote:
>>> VI I2C don't have DMA support and uses PIO mode all the time.
>>>
>>> Current driver uses writesl() to fill TX FIFO based on available
>>> empty slots and with this seeing strange silent hang during any I2C
>>> register access after filling TX FIFO with 8 words.
>>>
>>> Using writel() followed by i2c_readl() in a loop to write all words
>>> to TX FIFO instead of using writesl() helps for large transfers in
>>> PIO mode.
>>>
>>> So, this patch updates i2c_writesl() API to use writel() in a loop
>>> instead of writesl().
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   drivers/i2c/busses/i2c-tegra.c | 9 ++++++---
>>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>> b/drivers/i2c/busses/i2c-tegra.c
>>> index 6f08c0c..274bf3a 100644
>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> @@ -333,10 +333,13 @@ static u32 i2c_readl(struct tegra_i2c_dev
>>> *i2c_dev, unsigned int reg)
>>>       return readl_relaxed(i2c_dev->base +
>>> tegra_i2c_reg_addr(i2c_dev, reg));
>>>   }
>>>   -static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
>>> +static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, u32 *data,
>>>               unsigned int reg, unsigned int len)
>>>   {
>>> -    writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data,
>>> len);
>>> +    while (len--) {
>>> +        writel(*data++, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev,
>>> reg));
>>> +        i2c_readl(i2c_dev, I2C_INT_STATUS);
>>> +    }
>>>   }
>>>     static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
>>> @@ -811,7 +814,7 @@ static int tegra_i2c_fill_tx_fifo(struct
>>> tegra_i2c_dev *i2c_dev)
>>>           i2c_dev->msg_buf_remaining = buf_remaining;
>>>           i2c_dev->msg_buf = buf + words_to_transfer *
>>> BYTES_PER_FIFO_WORD;
>>>   -        i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
>>> +        i2c_writesl(i2c_dev, (u32 *)buf, I2C_TX_FIFO,
>>> words_to_transfer);
>> I've thought a bit more about this and I wonder if we're simply reading
>> out the wrong value for tx_fifo_avail and therefore end up overflowing
>> the TX FIFO. Have you checked what the value is for tx_fifo_avail when
>> this silent hang occurs? Given that this is specific to the VI I2C I'm
>> wondering if this is perhaps a hardware bug where we read the wrong TX
>> FIFO available count.
>>
>> Thierry
> 
> Yes FIFO status shows all 8 slots available.

Please explain how you checked that 8 slots are available, provide
example code.
