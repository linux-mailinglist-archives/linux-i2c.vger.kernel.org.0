Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1147548F7C
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 21:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbfFQTcU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 15:32:20 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38798 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727795AbfFQTcT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jun 2019 15:32:19 -0400
Received: by mail-wr1-f66.google.com with SMTP id d18so11282236wrs.5;
        Mon, 17 Jun 2019 12:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dpXSPuWpIMPnZbn0YA08V2hRW5djBjq/4Coqd/XvlZ8=;
        b=O2BkvZ4aIrzqi3WsiJ/rU/Lv30O3FLgMpFrt+I7pKe3LHs4/Qkem+iYfMbG6xzqO9u
         XLpbXxHJxBrHqJQr0rJE+EcM1CLtU7I/S8KRKg/fxuSVm2crx849MAANSPj+Dfy7Gwen
         wOf3fM+NQydLpkbvH8mTJ+RROfOnwMrcgTauAGCDgQz1QM90Icv0E2WJ3h1QyLA0kPWj
         SVnjKqhEjf9wSoqkqMBsCJtbSwkV6xTCYRuva8r5KBvw5no/TcqmYJjLrarVVhaRSty0
         7t13891W6TsC/f/wWAJJAysgkWkP8v7pz8F+2HFdU1sTG25mBtRPt+wIeHDffMTaY+mV
         +IcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dpXSPuWpIMPnZbn0YA08V2hRW5djBjq/4Coqd/XvlZ8=;
        b=tR5Ese+hY3i2bU3XmpTNLa438RPR1rYsH7ihWllSA6X8IxY1dLK1ZcHKm8seRYJKJi
         34iHT8hWuUBh0JOZjQcdOLWWmBnSON066x3oScyemep+LpJWi7I+/tlRRUEHl9AFqFHR
         yosCY3avKDhaWO88iDsQOO8ks7A5OC3UOsc/FXDr9VGi4OOjWdExr1WougkSaxjAj98u
         fGuGJPBSihHgG8HqzpueO87nlJzM+CcRu91QOop3z/Fh+UiNksc8VOXCi25ORTcv9YG2
         K2HkLdY8yKrUmoZSVEXOZoHpVDj+GGjgV0vWIf9gQ9z0zUrl8UHU05tXSjZJTcsT3TDN
         AVTg==
X-Gm-Message-State: APjAAAVQAWtPMN2xq4QjIyLCgv7HlBwM0k/1pZg5P4vK+6tEn8ZXGXWb
        7DssI4sALYlr3ZXcpItXSZQ=
X-Google-Smtp-Source: APXvYqzmsinawMQIxqHIyYLJqzsjKmExMDxH3ru1lgHn5Z3kuqsb847XhlLzhPkKZGIO2b7KgSLjLg==
X-Received: by 2002:adf:ce03:: with SMTP id p3mr52969392wrn.94.1560799936441;
        Mon, 17 Jun 2019 12:32:16 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id g2sm229244wmh.0.2019.06.17.12.32.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 12:32:15 -0700 (PDT)
Subject: Re: [PATCH V6] i2c: tegra: remove BUG, BUG_ON
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
References: <1560527438-30150-1-git-send-email-bbiswas@nvidia.com>
 <504e19d0-05dd-dc80-3aaf-cdab8f88002d@gmail.com>
 <fee98b4f-630e-1685-05e3-e8dae0f412bd@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cadd6687-7b1b-ccce-b34b-a175adafa675@gmail.com>
Date:   Mon, 17 Jun 2019 22:32:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <fee98b4f-630e-1685-05e3-e8dae0f412bd@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.06.2019 22:08, Bitan Biswas пишет:
> 
> 
> On 6/14/19 10:51 AM, Dmitry Osipenko wrote:
>> 14.06.2019 18:50, Bitan Biswas пишет:
>>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>>> as needed. Remove BUG() and mask Rx interrupt similar as Tx
>>> for message fully sent case. Add WARN_ON_ONCE check
>>> for non-zero rx_fifo_avail in tegra_i2c_empty_rx_fifo()
>>> after all processing. Error handling in tegra_i2c_empty_rx_fifo
>>> caller is also added.
>>>
>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>> ---
>>>   drivers/i2c/busses/i2c-tegra.c | 46 ++++++++++++++++++++++++++++++++++--------
>>>   1 file changed, 38 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>> index 4dfb4c1..26a7c8c 100644
>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> @@ -73,6 +73,7 @@
>>>   #define I2C_ERR_NO_ACK                BIT(0)
>>>   #define I2C_ERR_ARBITRATION_LOST        BIT(1)
>>>   #define I2C_ERR_UNKNOWN_INTERRUPT        BIT(2)
>>> +#define I2C_ERR_UNEXPECTED_STATUS        BIT(3)
>>
>> What about I2C_ERR_RX_BUFFER_OVERFLOW?
> OK.
> 
>>
>>>   #define PACKET_HEADER0_HEADER_SIZE_SHIFT    28
>>>   #define PACKET_HEADER0_PACKET_ID_SHIFT        16
>>> @@ -515,15 +516,23 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev
>>> *i2c_dev)
>>>        * prevent overwriting past the end of buf
>>>        */
>>>       if (rx_fifo_avail > 0 && buf_remaining > 0) {
>>> -        BUG_ON(buf_remaining > 3);
>>> +        /* buf_remaining > 3 check not needed as rx_fifo_avail == 0
>>> +         * when (words_to_transfer was > rx_fifo_avail) earlier
>>> +         * in this function
>>> +         */
>>
>> Please start all multiline comments with an empty "/*", it should be the correct
>> style. There are some places in the kernel where style like yours is used, but I
>> assume they are not very correct. Besides, yours variant is not consistent with the
>> style of the rest of comments in this source file. And put a dot in the end for
>> completeness. Same for the other comments in this patch.
>>
> OK
> 
>>>           val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>>>           val = cpu_to_le32(val);
>>>           memcpy(buf, &val, buf_remaining);
>>>           buf_remaining = 0;
>>>           rx_fifo_avail--;
>>>       }
>>
>> Please add a newline here. All logical parts of the code should be separated to ease
>> reading and following.
> OK
> 
>>
>>> +    if (WARN_ON_ONCE(rx_fifo_avail))
>>> +        return -EINVAL;
>>>   -    BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
>>> +    /* buf_remaining > 0 at this point can only have rx_fifo_avail == 0
>>> +     * as this corresponds to (words_to_transfer was > rx_fifo_avail)
>>> +     * case earlier in this function
>>> +     */
>>>       i2c_dev->msg_buf_remaining = buf_remaining;
>>>       i2c_dev->msg_buf = buf;
>>>   @@ -581,7 +590,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev
>>> *i2c_dev)
>>>        * boundary and fault.
>>>        */
>>>       if (tx_fifo_avail > 0 && buf_remaining > 0) {
>>> -        BUG_ON(buf_remaining > 3);
>>> +        /* buf_remaining > 3 check not needed as tx_fifo_avail == 0
>>> +         * when (words_to_transfer was > tx_fifo_avail) earlier
>>> +         * in this function for non-zero words_to_transfer
>>> +         */
>>>           memcpy(&val, buf, buf_remaining);
>>>           val = le32_to_cpu(val);
>>>   @@ -811,6 +823,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>>>       u32 status;
>>>       const u32 status_err = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
>>>       struct tegra_i2c_dev *i2c_dev = dev_id;
>>> +    int err_val;
>>>         status = i2c_readl(i2c_dev, I2C_INT_STATUS);
>>>   @@ -847,10 +860,21 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>>>         if (!i2c_dev->is_curr_dma_xfer) {
>>>           if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
>>> -            if (i2c_dev->msg_buf_remaining)
>>> -                tegra_i2c_empty_rx_fifo(i2c_dev);
>>> -            else
>>> -                BUG();
>>> +            err_val = tegra_i2c_empty_rx_fifo(i2c_dev);
>>> +            if ((!(i2c_dev->msg_buf_remaining)) &&
>>
>> Let's move this check into tegra_i2c_empty_rx_fifo() and return -EINVAL for that case.
>> This will make code to look cleaner.
> OK.
> 
> 
>>
>>> +                (!(status & I2C_INT_PACKET_XFER_COMPLETE)) &&
>>
>> It shouldn't matter that XFER_COMPLETE is set if RX FIFO isn't fully emptied because
>> it always shall be emptied. Hence this check is not needed and we should error out
>> regardless.
> OK
> 
>>
>>> +                err_val) {
>>> +                /*
>>> +                 * Overflow error condition: message fully sent,
>>> +                 * with no XFER_COMPLETE interrupt but hardware
>>> +                 * asks to transfer more.
>>> +                 */
>>> +                tegra_i2c_mask_irq(i2c_dev,
>>> +                           I2C_INT_RX_FIFO_DATA_REQ);
>>
>> No need to mask RX_FIFO_DATA_REQ here because all interrupts are masked on "goto
>> err:", hence just remove the tegra_i2c_mask_irq().
>>
>>> +                i2c_dev->msg_err |=
>>> +                    I2C_ERR_UNEXPECTED_STATUS;
>>
>> No need to split this into two lines because it's less than 80 chars, write this in a
>> single line.
> OK
> 
>>
>>> +                goto err;
>>> +            }
>>>           }
>>>             if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
>>> @@ -876,7 +900,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>>>       if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>>>           if (i2c_dev->is_curr_dma_xfer)
>>>               i2c_dev->msg_buf_remaining = 0;
>>> -        BUG_ON(i2c_dev->msg_buf_remaining);
>>> +        /* Underflow error condition: XFER_COMPLETE before message
>>> +         * fully sent.
>>> +         */
>>> +        if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) {
>>> +            i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
>>> +            goto err;
>>> +        }
>>>           complete(&i2c_dev->msg_complete);
>>>       }
>>>       goto done;
>>>
>>
>> Please address comments in the next revision.
>>
> 
> Sorry for the delayed reply. I shared Patch V7 with above changes earlier today.

No problems, please take your time. The V7 is almost good, looking forward to v8!
