Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1F4456494
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Nov 2021 21:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbhKRVBN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 16:01:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbhKRVBM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Nov 2021 16:01:12 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39D7CC061574
        for <linux-i2c@vger.kernel.org>; Thu, 18 Nov 2021 12:58:11 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id o29so6543293wms.2
        for <linux-i2c@vger.kernel.org>; Thu, 18 Nov 2021 12:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=n08UY1vtvOikHIVXHL9pYopc2uCEOhoXFtNPwnx/dPs=;
        b=B1WWo3PSPpdzsPi9BTK7mmwWkEyjL1LFDzjIWzXG2xf+QFvsSuwfWyMk7uohzxT6BA
         BA/GNDzViMW1UDOb/oNBxRpnN8OJxaegd7UAciPtODS4p/x10Iw3QjZsOpema2wf9g/N
         Ancv9u7djLbHHU6NDL4/vI7h5iWC6V8YtAqOZLwJT2qGNe3s5wDky5qWOlCbws77vni2
         NXi09zVClqgEKyXrAtiFHMu54/lUiuJHiLHo3ItOtay2+Z9PMBi0pvR5uLRVn4ixo7Ai
         sK81r9t24oWPSGV7/DDes/Gg7d8ans+HZkXaK1DlHBWiSovyrkYOQv8mnEuzBW+3GsMQ
         DzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=n08UY1vtvOikHIVXHL9pYopc2uCEOhoXFtNPwnx/dPs=;
        b=3Opr01aI6yu3vpCmUzui+GsBRmjWeF8rsj1PU05UwZ0kcxBDWTt6UKceSJ5m/n5O8V
         +YjKRxfa7m41gfZ7PRWA8DZcQjYsg3URQUh6PffiTLIqOVw6yIuCB+7w7nP4pXn8/qtM
         9mKqiMgYtkMqHQ8LBtW7x4RUEJysebnh2Ocs5f+YjvohQxzfW/15r1K85DlRQ0j47NzA
         +cVTFeYMp2C4ydlckieWqOJ3RGORB6qSGVj89okCSGUNx/tZZPOtebS7kPy/69jqcCnt
         Vk9nxas8WgKiShkX5dFJ9XmiDTG9H+9+YfahZHwk2265DxXeq/GOnX+t7vuC+llykvFy
         5Yvg==
X-Gm-Message-State: AOAM532Jup0IRgJHEPCi+hk7mT6KcQLuRB+vGTqfy4cFD48qYs4QroHz
        BxHEw8g7yHPo4lCIKZeA3g+POMWCm9I=
X-Google-Smtp-Source: ABdhPJzsVtdha0+Ga5NCKQCnT7J7e0H+2vhn24NUuOr/dTA6qI+TUurSl1nkbTpbSn0b+JatgYOM/w==
X-Received: by 2002:a05:600c:1d97:: with SMTP id p23mr40654wms.186.1637269089377;
        Thu, 18 Nov 2021 12:58:09 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:fc8d:4de8:c1d1:9213? (p200300ea8f1a0f00fc8d4de8c1d19213.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:fc8d:4de8:c1d1:9213])
        by smtp.googlemail.com with ESMTPSA id i17sm932180wmq.48.2021.11.18.12.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 12:58:08 -0800 (PST)
Message-ID: <57eaa7c7-61a8-a428-04ba-7d455aab49f0@gmail.com>
Date:   Thu, 18 Nov 2021 21:58:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] i2c: i801: Remove i801_set_block_buffer_mode
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <ab295fad-3f5a-5cc9-14fe-5bfaea8099a9@gmail.com>
 <20211118112308.62e3c2b3@endymion>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20211118112308.62e3c2b3@endymion>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18.11.2021 11:23, Jean Delvare wrote:
> Hi Heiner,
> 
> On Thu, 11 Nov 2021 22:43:35 +0100, Heiner Kallweit wrote:
>> If FEATURE_BLOCK_BUFFER is set I don't see how setting this bit could
>> fail. Reading it back seems to be overly paranoid. Origin of this
>> check seems to be 14 yrs ago when people were not completely sure
>> which chip versions support block buffer mode.
> 
> Your reading of the history is correct, although "overly paranoid"
> might be a somewhat exaggerated statement. When you modify a driver
> used by millions and have been bitten by undocumented restrictions in
> the same area, being cautious not to cause a regression doesn't seem
> that bad to me.

Indeed my statement could be read as: The guys back then didn't know
what they were doing. It definitely wasn't meant this way.

> 
> What was wrong in that approach, I would think retrospectively, is that
> i801_set_block_buffer_mode() should have been made verbose on failure,
> so that we learned over time if any chipset actually failed to support
> the feature in question. Because 14 years later we in fact still don't
> know if the test was needed or not.
> 
ICH4 spec mentions the block buffer mode and it's hard to imagine
(even though not impossible) that single later versions dropped
this feature.

> I'm fine with your change nevertheless, it should be fine, and if
> anything breaks then we'll fix it.
> 
> I'll test it on my system later today.
> 
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 17 +++++------------
>>  1 file changed, 5 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index 4c96f1b47..608e928e9 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -521,9 +521,11 @@ static int i801_block_transaction_by_block(struct i801_priv *priv,
>>  		return -EOPNOTSUPP;
>>  	}
>>  
>> +	/* Set block buffer mode */
>> +	outb_p(inb_p(SMBAUXCTL(priv)) | SMBAUXCTL_E32B, SMBAUXCTL(priv));
>> +
>>  	inb_p(SMBHSTCNT(priv)); /* reset the data buffer index */
>>  
>> -	/* Use 32-byte buffer to process this transaction */
>>  	if (read_write == I2C_SMBUS_WRITE) {
>>  		len = data->block[0];
>>  		outb_p(len, SMBHSTDAT0(priv));
>> @@ -750,14 +752,6 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
>>  	return i801_check_post(priv, status);
>>  }
>>  
>> -static int i801_set_block_buffer_mode(struct i801_priv *priv)
>> -{
>> -	outb_p(inb_p(SMBAUXCTL(priv)) | SMBAUXCTL_E32B, SMBAUXCTL(priv));
>> -	if ((inb_p(SMBAUXCTL(priv)) & SMBAUXCTL_E32B) == 0)
>> -		return -EIO;
>> -	return 0;
>> -}
>> -
>>  /* Block transaction function */
>>  static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
>>  				  char read_write, int command)
>> @@ -786,9 +780,8 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
>>  	/* Experience has shown that the block buffer can only be used for
>>  	   SMBus (not I2C) block transactions, even though the datasheet
>>  	   doesn't mention this limitation. */
>> -	if ((priv->features & FEATURE_BLOCK_BUFFER)
>> -	 && command != I2C_SMBUS_I2C_BLOCK_DATA
>> -	 && i801_set_block_buffer_mode(priv) == 0)
>> +	if (priv->features & FEATURE_BLOCK_BUFFER &&
> 
> No, please preserve the parentheses. Mixing "&" and "&&" without
> parentheses is highly confusing (to me at least, but I suspect I'm not
> alone).
> 
Shall I send a v2 with an adjusted commit message and these
parentheses re-added?

>> +	    command != I2C_SMBUS_I2C_BLOCK_DATA)
>>  		result = i801_block_transaction_by_block(priv, data,
>>  							 read_write,
>>  							 command);
> 
> 

