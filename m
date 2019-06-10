Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFC83BBB6
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 20:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728317AbfFJSSV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 14:18:21 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35221 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbfFJSSV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 14:18:21 -0400
Received: by mail-lj1-f193.google.com with SMTP id x25so4298698ljh.2;
        Mon, 10 Jun 2019 11:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7hNv4fPoQRf0w56ueT0FTRmP0T/UGcysee2X4L7hpfQ=;
        b=YhhEbyoOR6LrYPASQJH86uJ1MQKh6+WTYJ+ZiQZ/8A3IposRt2oIoA4YXTwo/kFfwA
         KZiXq3GJS9r6KsExqt6J49p4+wSSWwkYOeDzVJkcbEOcG7EacdA0TcyVDAhlbCBLIB6I
         1xrQ7TUXy0ynKeNhTT1u9GGMwrHm5KoDB3lryu17P1afJZIJCASTObOvkamPstgjsyLi
         M/p4xNLyTRm8x52WVS07dI2iPV04QTnktjUzFvuYDo39Wmdu4/1+0svkuOCrDRrDmsII
         FPbMBSqDFa8jbf+xliPURPYqnVChSqB7nZI2v8DjjaQGVN/MeDAz1px4yK0GocIpxYSE
         ixeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7hNv4fPoQRf0w56ueT0FTRmP0T/UGcysee2X4L7hpfQ=;
        b=aZTFzRpCpO7DM3hx1W06m3c1F7ReNQ0TZc12LmmorvTm+pXS06Hbvv/Bg9Pwhb5IVh
         uSg5GBKrw4B6Th0ibdgM6phokqBmz3XnEHrW1yTOplvR/FKbJJlOsfTuKC1IE7gDScAd
         lBHsjfLdKaJmuxKIITlSEWXDZwIE1ZvcEAsM/YZ7QILa7+nKr+549dP+p0Y1x7EykWRS
         cgAayMt9btOAHUFLarTJ9oNV5PR/IEaUjy8ZVHzX0v2BqDNz/CtDSFyLwmC7sMR/mYpD
         lgLK0StffNapTQ9v+RgRzF+BaUe91hEB73vOMfy4QsRVIT+xBwt2M5vkrZe76htB/OTA
         mQbA==
X-Gm-Message-State: APjAAAUtxrszoWwOs46O6Fo2l5+hbfa8e167Fl5Pw0kC84tjvR3ERjHt
        yiUio2CoED+ejL+xCwTJkhc=
X-Google-Smtp-Source: APXvYqxJ94662NBWcj1amxICtUs678oec1Ql42N8bg31m57oNLxfT6Xhi5kZz0LJjbjLaqMvv/k0uA==
X-Received: by 2002:a2e:1510:: with SMTP id s16mr8614966ljd.19.1560190698662;
        Mon, 10 Jun 2019 11:18:18 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id 24sm2575458ljs.63.2019.06.10.11.18.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 11:18:17 -0700 (PDT)
Subject: Re: [PATCH V4 6/6] i2c: tegra: remove BUG, BUG_ON
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
References: <1560186515-30797-1-git-send-email-bbiswas@nvidia.com>
 <1560186515-30797-6-git-send-email-bbiswas@nvidia.com>
 <06ab30b6-bf79-c628-0a04-d0307511a06f@gmail.com>
Message-ID: <e41fc7cc-6e7f-4c29-6650-d984bb26336c@gmail.com>
Date:   Mon, 10 Jun 2019 21:18:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <06ab30b6-bf79-c628-0a04-d0307511a06f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

10.06.2019 21:12, Dmitry Osipenko пишет:
> 10.06.2019 20:08, Bitan Biswas пишет:
>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>> as needed. Remove BUG() and make Rx and Tx case handling
>> similar.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> Looks that this is still not correct. What if it transfer-complete flag
> is set and buffer is full on RX? In this case the transfer will succeed
> while it was a failure.
> 
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 4dfb4c1..30619d6 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -515,7 +515,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>>  	 * prevent overwriting past the end of buf
>>  	 */
>>  	if (rx_fifo_avail > 0 && buf_remaining > 0) {
>> -		BUG_ON(buf_remaining > 3);
> 
> Actually error should be returned here since out-of-bounds memory
> accesses must be avoided, hence:
> 
> 	if (WARN_ON_ONCE(buf_remaining > 3))
> 		return -EINVAL;
> 
>>  		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>>  		val = cpu_to_le32(val);
>>  		memcpy(buf, &val, buf_remaining);
>> @@ -523,7 +522,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>>  		rx_fifo_avail--;
>>  	}
>>  
>> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
> 
> Better not to ignore this as well:
> 
> 	if (WARN_ON_ONCE(rx_fifo_avail > 0 &&
> 			 buf_remaining > 0))
> 		return -EINVAL;
> 
>>  	i2c_dev->msg_buf_remaining = buf_remaining;
>>  	i2c_dev->msg_buf = buf;
>>  
>> @@ -581,7 +579,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>>  	 * boundary and fault.
>>  	 */
>>  	if (tx_fifo_avail > 0 && buf_remaining > 0) {
>> -		BUG_ON(buf_remaining > 3);
> 
> And here, cause this will corrupt stack:
> 
> 		if (WARN_ON_ONCE(buf_remaining > 3))
> 			return -EINVAL;
> 
>>  		memcpy(&val, buf, buf_remaining);
>>  		val = le32_to_cpu(val);
>>  
>> @@ -850,7 +847,8 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>>  			if (i2c_dev->msg_buf_remaining)
>>  				tegra_i2c_empty_rx_fifo(i2c_dev);
>>  			else
>> -				BUG();
>> +				tegra_i2c_mask_irq(i2c_dev,
>> +						   I2C_INT_RX_FIFO_DATA_REQ);
> 
> Then here:
> 
> 	if (WARN_ON_ONCE(!i2c_dev->msg_buf_remaining) ||

Also note that this check could be moved out to the beginning of
tegra_i2c_empty_rx_fifo().
