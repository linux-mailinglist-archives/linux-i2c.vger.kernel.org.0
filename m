Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5B6038A06
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 14:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728265AbfFGMTE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 08:19:04 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:55952 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727693AbfFGMTE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 08:19:04 -0400
Received: by mail-it1-f195.google.com with SMTP id i21so2343941ita.5;
        Fri, 07 Jun 2019 05:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7zwU0V/rQ4ZpVODrsZiGW6vlf43mofPG/+nVbaGPJPU=;
        b=V0cYAgmXRqFaHd3VwPwslM84k1MBpBNZO+Z3/aK4OSWw6FS83JtA04JH2FY48OfP1j
         M7oIkfOqitBuMZNy1YRKjRSST1cy6ywGOH5weddfg8og38ADrI87PHcAxPL/l++NZ1gY
         RIWnap7ZdhfA+ggFbnWjUZEZ8sO3SligX8eU4xi8zyCVVQLwbON92OpoXp2caZuAbTcy
         6LFR4ucKp03g8aB0QkuV90tvgs43kryOadvUQIpasQ701QnbUFjDmgCz3aJ4TFv6gfsa
         xLW1/o48NrFbwjDewFdWR86GtnWU0qPTK86DLCcmg8uDpjX1sn+Ihh2lX1UiNFnMcom5
         OE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7zwU0V/rQ4ZpVODrsZiGW6vlf43mofPG/+nVbaGPJPU=;
        b=lZq0gW7JwMT4mGHWuN3pvsq/7EXaGlBI3ChpJ7a0rO4nOoeb919qsQtryKiIBtxUON
         2m0N2V7GusgjF9fCLokmLKvDw1d/zBt/dyOnC+akFkoiru29P95jgxOYQCeR2T/T8sBn
         TWRv43Hil7ZmP2X3WCO06Jg6zXH1ShdqpGqf9o8XuFbm57PwvY6jMzrWx6sVtFMCrejw
         Ii/ndLBS6SdERv2rIa33yiP9OWiFcR+Iwl7zfoIf/U8E//Ej6uMTLRq2Aga6A8pMVIgW
         tjL+hp9NZ8lE3Uq9RzPFSYDSWqYlqyT1hMM4He0AzW7m6V1bcz0N1SO2In8FwSO4WQwY
         Rs9g==
X-Gm-Message-State: APjAAAXuZ7ZnY9MPf7Jn6T6urvy12BT4DHwA5OIg7T8IPcf8mjJTWFKz
        wgM976kEnjHjO9O1WZY8eIGEkPDr
X-Google-Smtp-Source: APXvYqyyb02VTJ/VtSk+ZialJbHvhXnDTgG4/c7hSnDUB9UN1C73DlPMMX76GEVNX2rKPS0DXvU4ZQ==
X-Received: by 2002:a02:b817:: with SMTP id o23mr19238447jam.134.1559909942863;
        Fri, 07 Jun 2019 05:19:02 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-170-54.pppoe.mtu-net.ru. [91.76.170.54])
        by smtp.googlemail.com with ESMTPSA id t19sm617477iog.41.2019.06.07.05.19.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 05:19:02 -0700 (PDT)
Subject: Re: [PATCH V1 6/6] i2c: tegra: remove BUG, BUG_ON
From:   Dmitry Osipenko <digetx@gmail.com>
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
References: <1559908507-31192-1-git-send-email-bbiswas@nvidia.com>
 <1559908507-31192-6-git-send-email-bbiswas@nvidia.com>
 <4aec6d7a-0dea-18c9-efde-96cc1a54b945@gmail.com>
 <2281ef29-6e69-78e7-4d07-77f33c2f2d5a@gmail.com>
Message-ID: <9adcde41-2450-27dc-36a0-b3b99022b43d@gmail.com>
Date:   Fri, 7 Jun 2019 15:18:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2281ef29-6e69-78e7-4d07-77f33c2f2d5a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

07.06.2019 15:12, Dmitry Osipenko пишет:
> 07.06.2019 15:08, Dmitry Osipenko пишет:
>> 07.06.2019 14:55, Bitan Biswas пишет:
>>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>>> as needed. Replace BUG() with error handling code.
>>> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
>>>
>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>> ---
>>>  drivers/i2c/busses/i2c-tegra.c | 15 ++++++++-------
>>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>> index 4dfb4c1..c407bd7 100644
>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> @@ -73,6 +73,7 @@
>>>  #define I2C_ERR_NO_ACK				BIT(0)
>>>  #define I2C_ERR_ARBITRATION_LOST		BIT(1)
>>>  #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
>>> +#define I2C_ERR_UNEXPECTED_STATUS		BIT(3)
>>>  
>>>  #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>>>  #define PACKET_HEADER0_PACKET_ID_SHIFT		16
>>> @@ -515,7 +516,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>>>  	 * prevent overwriting past the end of buf
>>>  	 */
>>>  	if (rx_fifo_avail > 0 && buf_remaining > 0) {
>>> -		BUG_ON(buf_remaining > 3);
>>>  		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>>>  		val = cpu_to_le32(val);
>>>  		memcpy(buf, &val, buf_remaining);
>>> @@ -523,7 +523,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>>>  		rx_fifo_avail--;
>>>  	}
>>>  
>>> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
>>>  	i2c_dev->msg_buf_remaining = buf_remaining;
>>>  	i2c_dev->msg_buf = buf;
>>>  
>>> @@ -581,7 +580,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>>>  	 * boundary and fault.
>>>  	 */
>>>  	if (tx_fifo_avail > 0 && buf_remaining > 0) {
>>> -		BUG_ON(buf_remaining > 3);
>>>  		memcpy(&val, buf, buf_remaining);
>>>  		val = le32_to_cpu(val);
>>>  
>>> @@ -847,10 +845,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>>>  
>>>  	if (!i2c_dev->is_curr_dma_xfer) {
>>>  		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
>>> -			if (i2c_dev->msg_buf_remaining)
>>> +			if (i2c_dev->msg_buf_remaining) {
>>>  				tegra_i2c_empty_rx_fifo(i2c_dev);
>>> -			else
>>> -				BUG();
>>> +			} else {
>>> +				dev_err(i2c_dev->dev, "unexpected rx data request\n");
>>> +				i2c_dev->msg_err |= I2C_ERR_UNEXPECTED_STATUS;
>>> +				goto err;
>>> +			}
>>>  		}
>>>  
>>>  		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
>>> @@ -876,7 +877,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>>>  	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>>>  		if (i2c_dev->is_curr_dma_xfer)
>>>  			i2c_dev->msg_buf_remaining = 0;
>>> -		BUG_ON(i2c_dev->msg_buf_remaining);
>>> +		WARN_ON_ONCE(i2c_dev->msg_buf_remaining);
>>>  		complete(&i2c_dev->msg_complete);
>>>  	}
>>>  	goto done;
>>>
>>
>> Very nice, thank you very much! BTW, I think it may worth to add another
>> patch that will reset hardware state in a case of the warning since we
>> know that something gone wrong.
>>
>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>>
> 
> Something like that:
> 
>  	complete(&i2c_dev->msg_complete);
> 
> 	if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining))
> 		goto err;
> 

Ah, that's inside the ISR, so maybe will make sense to just not complete
the transfer and let it timeout:

	if (!WARN_ON_ONCE(i2c_dev->msg_buf_remaining))
		complete(&i2c_dev->msg_complete);

