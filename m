Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F96664F848
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Dec 2022 09:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiLQIkq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Dec 2022 03:40:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiLQIkp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Dec 2022 03:40:45 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12681013
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 00:40:42 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id m14so4525806wrh.7
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 00:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfH1AQM/jgGPBy8ar/T4Yrcbm2oFzXwiP//YoXvnn8E=;
        b=DE+eXQE5/uZxMkVVP5+SdfakevzT/AVec24OzQcVNYZl1/IOWdgF2cfzsNJaby0XB1
         YTQpH+nhBweyeRs0XCGWEMsl5Kcq+tTPiefLZlxkpYNuv1x7df295WlXMldiI0+u4O6A
         pq6PTL3RNYRAyRpnxXfUmjpB8/nUU/9WBfRiAfgeuWhB2VkO6t+dDsci++FXPOYdGkLU
         BKxq9LNb+77iuMrZce3NobUTMNvpMrZdcisKssMEaJETg3iPRoy5XAY3c+s1/YLWD92b
         gD9B8ZQxXHQfjvfD8V+IsdM+ntv3Yvlwdpzgf3Vo7qP04FpeW8ocZ99McgBUhCd9evgK
         U/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UfH1AQM/jgGPBy8ar/T4Yrcbm2oFzXwiP//YoXvnn8E=;
        b=iwzTQsOyAcgdVh9cfE7BqlpSH3QDKVO1ooZkqC8DqdWHtsyokSlLHfrrsol3QKejg8
         xZyQTEgVZ4SfvHWfymxPhvbYmGclcVhysZMUugs96E0Q5uqEgomt8ky4PQOSD4mw/+6V
         XgTh6jc3GjSWMP6kLAgshpLxjJlfhSerUYPW5HgHxibQ4cOYhsErxH+ZpXBzFIkjQWYa
         opAYQHVCbRa6X7v7d9fCKQtNmjLX1l70iEu9LTU8dRSSLBjC8Hhy6/FenHt3qwz5WDmh
         F62w9yG1kJYim3SqrN176a7mVSRveW/vPxKQeXr+2nnb9Rk2cCnlntu+UUicz6b2Q/wk
         KW/Q==
X-Gm-Message-State: ANoB5pkH+/KE7SBZVhzSuxUYa8VyN1rfHVT2eIciwkHYESklpaWW4eKO
        tDBdiHCpElYaOiGfk4t+n2A=
X-Google-Smtp-Source: AA0mqf6ftrzZAmApElTfE+2h8BXSyihB6bEg0bllxmg9uxhbekqpLocWIUVcIj+XO145s8zisZuk1w==
X-Received: by 2002:a05:6000:98c:b0:24e:b177:ba78 with SMTP id by12-20020a056000098c00b0024eb177ba78mr12439725wrb.51.1671266440615;
        Sat, 17 Dec 2022 00:40:40 -0800 (PST)
Received: from ?IPV6:2a01:c22:7af7:5300:8868:b389:215f:d1? (dynamic-2a01-0c22-7af7-5300-8868-b389-215f-00d1.c22.pool.telefonica.de. [2a01:c22:7af7:5300:8868:b389:215f:d1])
        by smtp.googlemail.com with ESMTPSA id w1-20020adfec41000000b002422b462975sm4299168wrn.34.2022.12.17.00.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 00:40:40 -0800 (PST)
Message-ID: <ea1a64c4-b5f7-d25d-daba-6294a9e3dba8@gmail.com>
Date:   Fri, 16 Dec 2022 21:57:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
 <5e5774c2-26a2-dd4b-29ca-e1eca32ef889@gmail.com>
 <20220607161320.6ce0db40@endymion.delvare>
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 3/8] i2c: i801: make FEATURE_BLOCK_PROC dependent on
 FEATURE_BLOCK_BUFFER
In-Reply-To: <20220607161320.6ce0db40@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 07.06.2022 16:13, Jean Delvare wrote:
> Hi Heiner,
> 
> On Fri, 15 Apr 2022 18:55:46 +0200, Heiner Kallweit wrote:
>> According to the datasheet the block process call requires block
>> buffer mode. The user may disable block buffer mode by module
>> parameter disable_features, in such a case we have to clear
>> FEATURE_BLOCK_PROC.
> 
> In which datasheet are you seeing this? Can you point me to the
> specific section and/or quote the statement? I can't find it in the
> datasheet I'm looking at (ICH9, Intel document 316972-002) but it is
> huge and I may just be missing it.
> 

I used the following datasheet:
Intel 9 Series Chipset Family PCH
330550-002

On page 211 the block process call is described.
There's a note: E32B bit in the Auxiliary Control register must be set when using this protocol.
The same note can be found on page 663.

> Also, same request as previous patch, I'd like a comment in the code,
> so that developers don't have to read the git log to figure out why this
> piece of code is there.
> 
OK

> Furthermore, as far as I can see, the FEATURE_BLOCK_PROC flag only
> affects the value returned by i801_func(). i801_access() does not
> verify whether this flag is set before processing a command where size
> == I2C_SMBUS_BLOCK_PROC_CALL. I think it should? Otherwise your fix is
> only partial (will work if the device driver calls .functionality as it
> is supposed to, will fail with - I suppose - unpredictable results if
> the device driver calls .smbus_xfer directly).
> 
If FEATURE_BLOCK_PROC isn't set then we would call
i801_block_transaction_byte_by_byte() according to the following code
in i801_block_transaction().

        if ((priv->features & FEATURE_BLOCK_BUFFER) &&
            command != I2C_SMBUS_I2C_BLOCK_DATA)
                result = i801_block_transaction_by_block(priv, data,
                                                         read_write,
                                                         command);
        else
                result = i801_block_transaction_byte_by_byte(priv, data,
                                                             read_write,
                                                             command);

And i801_block_transaction_byte_by_byte() immediately returns
-EOPNOTSUPP in case of command == I2C_SMBUS_BLOCK_PROC_CALL.

Having said that the requested check is there, it's just executed
a little bit later.

>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index eccdc7035..1d8182901 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -1675,6 +1675,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>  	}
>>  	priv->features &= ~disable_features;
>>  
>> +	if (!(priv->features & FEATURE_BLOCK_BUFFER))
>> +		priv->features &= ~FEATURE_BLOCK_PROC;
>> +
>>  	err = pcim_enable_device(dev);
>>  	if (err) {
>>  		dev_err(&dev->dev, "Failed to enable SMBus PCI device (%d)\n",
> 
> Thanks,

