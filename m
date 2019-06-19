Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C492D4B4B0
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2019 11:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731347AbfFSJK7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jun 2019 05:10:59 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41126 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731321AbfFSJK7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jun 2019 05:10:59 -0400
Received: by mail-lf1-f68.google.com with SMTP id 136so11507475lfa.8;
        Wed, 19 Jun 2019 02:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3SIX09875uxUo1XhtKRNTRHSV68SKvXocMxJP/0aUoY=;
        b=Nro2yjMgyfsgeuZHCwgAwVegS5Ar8Bgbwrbey/E5rrepHjy3swRq0Z1kLnw/VYe+I1
         3Tgwpc3mZdY+fMoFW7JmI7IkSs0jRxY14TupOTLwZqxOSW/DlZHQMv1/XfIYTYSuolaO
         kR84EkMowhArx0Hx7D4GJ6W3K+Z+H2FcF5VWwbgR0D8FN3X+0HBNE7tpN2+mCeDG8Z5K
         0hPJnBuvwMqdDpe0MF6n2HakuRScXDqpSLzWc4PUPr76Jwxr0eTF8pN5jy489xOtpCTu
         HINUCFLxORsI96S0m+Fz3M1+wiA2PV/A5dPdiWR5rmXX4Gj+D0IY8MOiBmhn8+StG/Ra
         BsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3SIX09875uxUo1XhtKRNTRHSV68SKvXocMxJP/0aUoY=;
        b=nOoSpJ0rzWzz4kqGbQbdimlOC+vTJuOOO0/g0Vh4/n02fjFYc1M8gfzTwS6CJVKcbn
         Q7qgoQORocQzvt0dLvdxGRcAWBxXEABSKcAg9/7LVDeXqK4W21Xrs/xcmf+vzdmTPBVB
         2VINrS6Fxpzeo68rKhvFIBVdCq3qkFpyLM6FexG/FeyPqiRGiq37OskQPlr+rIgnX3xA
         gXh5sRnADNlaL2t53XCZhdWW6wzFOKLZ+9x2a87Tq0GYmqFdPOjSBb90PLNYeMrOa/NL
         nlUCBKofFzZeMR63Y8CUzirDElAl97vIP61O3BqSXLaKGIjvj9B/dnqjUyUxGcZOYrmj
         9WUw==
X-Gm-Message-State: APjAAAWdJeOhmTwO30N9VuN1zK5z5r1F1EJ20vydC1VBd9RIN6rzlt/Q
        Zqg2VamXldDc0mbnd41nvddxlaso
X-Google-Smtp-Source: APXvYqyqjOlFtCg2fWKVh/UcrhzRsQxY8RAWJikNYKacC2Fc4GcjQ9G5cagQPOEB3gfsKTOMfRI5EA==
X-Received: by 2002:ac2:5b05:: with SMTP id v5mr62359725lfn.38.1560935456171;
        Wed, 19 Jun 2019 02:10:56 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id j23sm1876689lfb.93.2019.06.19.02.10.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 02:10:55 -0700 (PDT)
Subject: Re: [PATCH V2] i2c: tegra: disable irq in tegra_i2c_xfer_msg
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1560847368-16069-1-git-send-email-bbiswas@nvidia.com>
 <cda89c10-c597-ce90-98dd-5cc13ee9b83d@gmail.com>
 <d29aa32d-55ef-c98b-00cd-f836bf003662@nvidia.com>
 <698b4903-0580-8a68-88f8-fba3e2cbe6c7@gmail.com>
Message-ID: <30386276-d5cc-7a74-9f2f-b773b9f3e7a4@gmail.com>
Date:   Wed, 19 Jun 2019 12:10:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <698b4903-0580-8a68-88f8-fba3e2cbe6c7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

19.06.2019 12:02, Dmitry Osipenko пишет:
> 19.06.2019 11:58, Jon Hunter пишет:
>>
>> On 18/06/2019 19:26, Dmitry Osipenko wrote:
>>> 18.06.2019 11:42, Bitan Biswas пишет:
>>>> tegra_i2c_xfer_msg initiates the I2C transfer in DMA
>>>> or PIO mode. It involves steps that need FIFO register
>>>> access, DMA API calls like dma_sync_single_for_device, etc.
>>>> Tegra I2C ISR has calls to tegra_i2c_empty_rx_fifo in PIO mode
>>>> and in DMA/PIO mode writes different I2C registers including
>>>> I2C interrupt status. ISR cannot start processing
>>>> before the preparation step at tegra_i2c_xfer_msg is complete.
>>>> Hence, a synchronization between ISR and tegra_i2c_xfer_msg
>>>> is in place today using spinlock.
>>>
>>> Please use full 75 chars per-line, this should make commit message to look better.
>>>
>>>> Spinlock busy waits and can add avoidable delays.
>>>>
>>>> In this patch needed synchronization is achieved by disabling
>>>> I2C interrupt during preparation step and enabling interrupt
>>>> once preparation is over and spinlock is no longer needed.
>>>>
>>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>>> ---
>>>>  drivers/i2c/busses/i2c-tegra.c | 17 ++++++++---------
>>>>  1 file changed, 8 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>>> index 6fb545e..ccc7fae 100644
>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>> @@ -240,7 +240,6 @@ struct tegra_i2c_hw_feature {
>>>>   * @bus_clk_rate: current I2C bus clock rate
>>>>   * @clk_divisor_non_hs_mode: clock divider for non-high-speed modes
>>>>   * @is_multimaster_mode: track if I2C controller is in multi-master mode
>>>> - * @xfer_lock: lock to serialize transfer submission and processing
>>>>   * @tx_dma_chan: DMA transmit channel
>>>>   * @rx_dma_chan: DMA receive channel
>>>>   * @dma_phys: handle to DMA resources
>>>> @@ -270,8 +269,6 @@ struct tegra_i2c_dev {
>>>>  	u32 bus_clk_rate;
>>>>  	u16 clk_divisor_non_hs_mode;
>>>>  	bool is_multimaster_mode;
>>>> -	/* xfer_lock: lock to serialize transfer submission and processing */
>>>> -	spinlock_t xfer_lock;
>>>>  	struct dma_chan *tx_dma_chan;
>>>>  	struct dma_chan *rx_dma_chan;
>>>>  	dma_addr_t dma_phys;
>>>> @@ -835,7 +832,6 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>>>>  
>>>>  	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
>>>>  
>>>> -	spin_lock(&i2c_dev->xfer_lock);
>>>>  	if (status == 0) {
>>>>  		dev_warn(i2c_dev->dev, "irq status 0 %08x %08x %08x\n",
>>>>  			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
>>>> @@ -935,7 +931,6 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>>>>  
>>>>  	complete(&i2c_dev->msg_complete);
>>>>  done:
>>>> -	spin_unlock(&i2c_dev->xfer_lock);
>>>>  	return IRQ_HANDLED;
>>>>  }
>>>>  
>>>> @@ -1054,7 +1049,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>>>>  	u32 packet_header;
>>>>  	u32 int_mask;
>>>>  	unsigned long time_left;
>>>> -	unsigned long flags;
>>>>  	size_t xfer_size;
>>>>  	u32 *buffer = NULL;
>>>>  	int err = 0;
>>>> @@ -1085,7 +1079,10 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>>>>  	 */
>>>>  	xfer_time += DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * MSEC_PER_SEC,
>>>>  					i2c_dev->bus_clk_rate);
>>>> -	spin_lock_irqsave(&i2c_dev->xfer_lock, flags);
>>>> +	if (!i2c_dev->irq_disabled) {
>>>> +		disable_irq_nosync(i2c_dev->irq);
>>>> +		i2c_dev->irq_disabled = true;
>>>> +	}
>>>
>>> 1) Peter correctly pointed out in the other email that the disabling should be synced.
>>> But see more below in 3.
>>>
>>> 2) i2c_dev->irq_disabled == true can't ever be the case here because tegra_i2c_init()
>>> re-enables interrupt in a case of error condition. Hence interrupt always enabled at
>>> the beginning of the transfer.
>>>
>>> 3) In my previous answer I was suggesting to request IRQ in a disabled state, this
>>> will allow to remove i2c_dev->irq_disabled completely.
>>>
>>> Then the tegra_i2c_xfer_msg() will have to enable IRQ after completion of the
>>> transfer-preparation process and disable IRQ once transfer is done (both success and
>>> failure cases). This is actually not a bad additional motivation for this patch, to
>>> keep CPU's interrupt disabled while idling and not to only rely on interrupt masking
>>> of the I2C hardware.
>>>
>>> 4) ISR should simply return IRQ_NONE when interrupt status is 0 and allow kernel core
>>> to disable the faulty interrupt itself. There will be "unhandled interrupt" error
>>> message in KMSG log, following the disabling.
>>>
>>> 5) In order to request IRQ in a disabled state, the IRQ_NOAUTOEN flag need to be set
>>> before the requesting, like this:
>>>
>>>     irq_set_status_flags(irq, IRQ_NOAUTOEN);
>>>
>>>     devm_request_irq(&pdev->dev, irq...);
>>>
>>> In a result of combining 3-5, both i2c_dev->irq_disabled and i2c_dev->irq variables
>>> become obsolete and could be removed in addition to xfer_lock. That all is a good
>>> cleanup in my opinion.


Ah, actually looks like i2c_dev->irq won't be obsoleted, but not a big deal.

Also, please note that it won't be the least to change the type of "irq" to unsigned int for
consistency. I know that Thierry is picky about it.
