Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB4D2F1F5B
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 20:30:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390890AbhAKTaT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 14:30:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390829AbhAKTaT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Jan 2021 14:30:19 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D8DFC061786;
        Mon, 11 Jan 2021 11:29:38 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id m13so127424ljo.11;
        Mon, 11 Jan 2021 11:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=khvcoUktv4FtIeSDa05HRiR7l98Wsp0Qz1MN3btBwP4=;
        b=cSZWG9pjLxBex4ZagkNXtDoBjUtPOkbF2SWVgbogd9Vn+iwWx79deI6A6OAiMEzJYv
         GvqfWCqXcPNcFukiq8qcHDXXZfjTq1gxpKaqJ7lb0ESHKbky5AcndeUlajQ86FzQojGk
         puXS2vICfzzxzxYkqolYjLLSo2+iwRGYRiN3jt3Z9wBPSpZRa9FJ1NKZMTFXNVM9tuNM
         dMgfVpIGc5iMmBUY8huDh5JPXdCYomcx7mfhOw1YnfljiorcO/17H7V/amgWhptF1mFj
         wf2KVe6DXFR2Z6aJAvh+LCrGfd/F5BL1nZspsuFEzK8/SQKtk8PvvY6ukTBAV9lmeG0v
         XuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=khvcoUktv4FtIeSDa05HRiR7l98Wsp0Qz1MN3btBwP4=;
        b=CVbJfTbwXM94MYC83Vp4rBfZwTEm9rnkQND4d1hdI0OgKNNbG3kN1wx0EYCOO+qoV9
         roDFZuo8KSjTXYAhEcw2Hp4s5vmtW1nKEYiU1LCNq3Hq9MssZWtIGODUl0YZBKbfLZdL
         S6/OXaePfgoE5e55/fjDuvMfb6WD4d2uN9DWrwOiKc862//zXZeUHnbkgbVCGJBWYodW
         Vd7RdUMKjOzBRTNqPIIWk60MmhHD+sG+EXnvZ+Kxmv3HMJjdWpVRNMmAFFYzxY2rkrjk
         FDX6gZKALrpWCjusEuNNCl3Mb61uNqQWHoZ+nFAA1W+TKEbaaoKaKWPjPsPN0w8Aa+ry
         Gz5w==
X-Gm-Message-State: AOAM533gLZY3f6JPzrQv/QLFjMWG1tYY1zcymMQcT2vWo0Kfd0lR8/Rj
        PiucioaBQRRF4YjAs8vuKnQ+Mz88LR4=
X-Google-Smtp-Source: ABdhPJx/9l/HSpXTanZp3O83Gn2IONIcxPaddUR+Qs5aibifaMJqHNJ0Z2mDpUtj+kvccikSIkLJnQ==
X-Received: by 2002:a05:651c:217:: with SMTP id y23mr398976ljn.247.1610393376845;
        Mon, 11 Jan 2021 11:29:36 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id t28sm72734ljo.45.2021.01.11.11.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 11:29:36 -0800 (PST)
Subject: Re: [PATCH v1] i2c: tegra: Fix i2c_writesl() to use writel() instead
 of writesl()
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <1603166634-13639-1-git-send-email-skomatineni@nvidia.com>
 <20201020074846.GA1877013@ulmo>
 <538d8436-260d-40a8-b0a3-a822a0f9c909@nvidia.com>
 <c37f8618-5100-4087-3bc3-fe421d40f3b8@gmail.com>
 <2212a21b-7dff-4ba0-a193-badd5a1770c8@gmail.com>
 <6373bc13-a53d-2bb2-98f5-f6f01b0b8b69@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c961f8a4-17dd-f90a-53f5-e33196627fb3@gmail.com>
Date:   Mon, 11 Jan 2021 22:29:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <6373bc13-a53d-2bb2-98f5-f6f01b0b8b69@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

11.01.2021 20:38, Sowjanya Komatineni пишет:
> 
> On 1/11/21 4:09 AM, Dmitry Osipenko wrote:
>> 11.01.2021 14:50, Dmitry Osipenko пишет:
>>> 20.10.2020 19:37, Sowjanya Komatineni пишет:
>>>> On 10/20/20 12:48 AM, Thierry Reding wrote:
>>>>> On Mon, Oct 19, 2020 at 09:03:54PM -0700, Sowjanya Komatineni wrote:
>>>>>> VI I2C don't have DMA support and uses PIO mode all the time.
>>>>>>
>>>>>> Current driver uses writesl() to fill TX FIFO based on available
>>>>>> empty slots and with this seeing strange silent hang during any I2C
>>>>>> register access after filling TX FIFO with 8 words.
>>>>>>
>>>>>> Using writel() followed by i2c_readl() in a loop to write all words
>>>>>> to TX FIFO instead of using writesl() helps for large transfers in
>>>>>> PIO mode.
>>>>>>
>>>>>> So, this patch updates i2c_writesl() API to use writel() in a loop
>>>>>> instead of writesl().
>>>>>>
>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>> ---
>>>>>>    drivers/i2c/busses/i2c-tegra.c | 9 ++++++---
>>>>>>    1 file changed, 6 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>>>>> b/drivers/i2c/busses/i2c-tegra.c
>>>>>> index 6f08c0c..274bf3a 100644
>>>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>>>> @@ -333,10 +333,13 @@ static u32 i2c_readl(struct tegra_i2c_dev
>>>>>> *i2c_dev, unsigned int reg)
>>>>>>        return readl_relaxed(i2c_dev->base +
>>>>>> tegra_i2c_reg_addr(i2c_dev, reg));
>>>>>>    }
>>>>>>    -static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void
>>>>>> *data,
>>>>>> +static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, u32 *data,
>>>>>>                unsigned int reg, unsigned int len)
>>>>>>    {
>>>>>> -    writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data,
>>>>>> len);
>>>>>> +    while (len--) {
>>>>>> +        writel(*data++, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev,
>>>>>> reg));
>>>>>> +        i2c_readl(i2c_dev, I2C_INT_STATUS);
>>>>>> +    }
>>>>>>    }
>>>>>>      static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void
>>>>>> *data,
>>>>>> @@ -811,7 +814,7 @@ static int tegra_i2c_fill_tx_fifo(struct
>>>>>> tegra_i2c_dev *i2c_dev)
>>>>>>            i2c_dev->msg_buf_remaining = buf_remaining;
>>>>>>            i2c_dev->msg_buf = buf + words_to_transfer *
>>>>>> BYTES_PER_FIFO_WORD;
>>>>>>    -        i2c_writesl(i2c_dev, buf, I2C_TX_FIFO,
>>>>>> words_to_transfer);
>>>>>> +        i2c_writesl(i2c_dev, (u32 *)buf, I2C_TX_FIFO,
>>>>>> words_to_transfer);
>>>>> I've thought a bit more about this and I wonder if we're simply
>>>>> reading
>>>>> out the wrong value for tx_fifo_avail and therefore end up overflowing
>>>>> the TX FIFO. Have you checked what the value is for tx_fifo_avail when
>>>>> this silent hang occurs? Given that this is specific to the VI I2C I'm
>>>>> wondering if this is perhaps a hardware bug where we read the wrong TX
>>>>> FIFO available count.
>>>>>
>>>>> Thierry
>>>> Yes FIFO status shows all 8 slots available.
>>> Please explain how you checked that 8 slots are available, provide
>>> example code.
>>>
>> Have you checked the FIFO overflow interrupt?
> 
> This is seen with VI I2C (which is under host1x) as we use PIO mode
> always even for large transfers.
> HW wise VI I2C is similar to other I2C and FIFO depth is also 8 words.
> 
> tegra_i2c_fill_tx_fifo() reads I2C_FIFO_STATUS register field
> TX_FIFO_EMPTY_CNT which tells empty slots available in TX_FIFO that can
> be filled.
> Added debug message to print empty count and, during beginning of
> transfer when it executes tegra_i2c_fill_tx_fifo(), empty slots are 8
> 
> 
> Using writesl() for filling TX_FIFO causing silent hang immediate on any
> i2c register access after filling FIFO with 8 words and some times with
> 6 words as well.
> 
> So couldn't INTERRUPT_STATUS registers to check for TX FIFO Overflows
> when this silent hang happens.
> 
> Tried to read thru back-door (JTAG path) but could not connect to JTAG
> either. Looks like Tegra chip is in some weird state.
> 
> But using writel() followed by i2c_readl helps. Not sure if any thing
> related to register access delay or some other issue.
> 
> 

Does downstream kernel have this problem?

If there is really no good alternative right now, then perhaps should be
a bit cleaner to add i2c_writesl_vi(), which should contain explanatory
comment telling why it's needed and then it should be used only for the
VI I2C controller.
