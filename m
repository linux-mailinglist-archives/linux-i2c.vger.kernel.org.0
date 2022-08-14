Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2609592674
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Aug 2022 23:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236704AbiHNVGf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Aug 2022 17:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231444AbiHNVGc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Aug 2022 17:06:32 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C157F640C;
        Sun, 14 Aug 2022 14:06:30 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id r4so7435312edi.8;
        Sun, 14 Aug 2022 14:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc;
        bh=U9zu/JtT0d8b3qRvVOQocUaAbgnWxV8K6AQ9ZDWSs+4=;
        b=IuVLFuDAzjNugdsduyZIXzAv+kSZrBleD/CaOhKMh90xCCkqL9C4pEZ76NFCqO5Rwx
         i5O57epZnfLeEQEme6TWgj/hEWZIuVPzRIn6JyCMlEWt6oq6H21LcWe+C5Kx+K5tdMmd
         1AC5MVxoEEipxlCx543cNaFEDb0/Q4oTE5n8ODmcPumt1nFe1yThnioxI3h4IKi60L1f
         LkW95Xo3veRSOgd1QjVShmVtdqZ2+A2lVmRXjlvbGr6l2Ywokolu9+herto+zTW4CV3F
         cgTFuh2ttpG+4f+4sxg/m7IkabqMNzLPbbu3WdxKSdMCBJYleuks0T0h5o4K7/eEKPoM
         79fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=U9zu/JtT0d8b3qRvVOQocUaAbgnWxV8K6AQ9ZDWSs+4=;
        b=lW38npwfiBvuoydtJATEnoSGuKZd/p1tioVhokyU6qi6TU7My7TZlDlW4QCxWp7+/i
         ni3+SylN7pmhmUK8vIut9S1FK6hb0/pAWEvWFBFerGjpL09rPFxtNjlMJ26DgKNNrIf7
         vjLrAx5UuOYzVczIR2vCaadNCmto/OCzd/8MizOyjv/MhIekdHbeXKizzYe6g9mkjBVy
         ZyXaHqKKOEbkqREdSwJNo6+Ayu7sL1m9hBc/ceheDjBcr1uNxD6O8Xfjh0XUy58/tBzZ
         mm7Lpo19cNU7HfhcdB/QYt6qD55haQ9xLBOXItHYYoM2QMxcUnZzUc67svvxMhTzIkbB
         x7uw==
X-Gm-Message-State: ACgBeo20/lRMvtIX8B+TSL5LylfWCJPRUiOzPTXjsEuUBMqP992QHDVu
        U+er58gQ2oJUvhXt3TwgMXI=
X-Google-Smtp-Source: AA6agR40E7soW7BH8KRzi+LNAv2/doovv1eAaH4VG6rbnTVqIayfAzXV7eg3lVpQJVFIaOBuNpqPhw==
X-Received: by 2002:aa7:c946:0:b0:43d:3038:1381 with SMTP id h6-20020aa7c946000000b0043d30381381mr12130254edt.354.1660511188967;
        Sun, 14 Aug 2022 14:06:28 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c1a2:1a00:2049:10ba:dbb:6620? (dynamic-2a01-0c23-c1a2-1a00-2049-10ba-0dbb-6620.c23.pool.telefonica.de. [2a01:c23:c1a2:1a00:2049:10ba:dbb:6620])
        by smtp.googlemail.com with ESMTPSA id bk19-20020a170906b0d300b0072a881b21d8sm3310789ejb.119.2022.08.14.14.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Aug 2022 14:06:28 -0700 (PDT)
Message-ID: <7a15288c-20df-5873-e982-28d200a2b471@gmail.com>
Date:   Sun, 14 Aug 2022 23:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <3e6c934e-5298-42c5-c346-31b1acaa06ba@gmail.com>
 <2adcd797-f3cc-c8c7-c18c-d3726b2db4c0@gmail.com> <YoKmmIz7qJbD+hPY@kunai>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 2/3] i2c: algo: bit: allow getsda to be NULL
In-Reply-To: <YoKmmIz7qJbD+hPY@kunai>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16.05.2022 21:31, Wolfram Sang wrote:
> Hi Heiner,
> 
Hi Wolfram,

sorry for answering quite late ..

>>  	/* read ack: SDA should be pulled down by slave, or it may
>>  	 * NAK (usually to report problems with the data we wrote).
>> +	 * Report ACK if SDA is write-only.
> 
> Minor nit: On first read, I didn't understand. "Always report ACK..." is
> maybe a tad clearer.
> 

OK

>>  	 */
>> @@ -203,6 +204,9 @@ static int i2c_inb(struct i2c_adapter *i2c_adap)
>>  	unsigned char indata = 0;
>>  	struct i2c_algo_bit_data *adap = i2c_adap->algo_data;
>>  
>> +	if (!adap->getsda)
>> +		return -EOPNOTSUPP;
> 
> Wouldn't it be better in 'readbytes' returning an errno there?
> 

I think that's something we can do in addition. We have other users of i2c_inb()
than readbytes() (in i2c_algo_pcf), therefore I'd prefer to let i2c_inb()
return an error instead of relying on upper layers only.

>> -	/* Complain if SCL can't be read */
>> -	if (bit_adap->getscl == NULL) {
>> +	if (bit_adap->getscl == NULL && bit_adap->getsda == NULL)
>> +		dev_info(&adap->dev, "I2C-like interface, SDA and SCL are write-only\n");
>> +	else if (bit_adap->getscl == NULL) {
>> +		/* Complain if SCL can't be read */
>>  		dev_warn(&adap->dev, "Not I2C compliant: can't read SCL\n");
>>  		dev_warn(&adap->dev, "Bus may be unreliable\n");
> 
> Hmm, this is a bit inconsistent with dev_warn and dev_info. How about
> this?
> 
Right, it would be a bit inconsistent. My thought was:
If both getscl and getsda are NULL, then the driver is intentionally used this way
and it reflects the design of the respective system.
It's expected that both are NULL and there's nothing wrong with it.
At least to me a warning means: Something isn't ok and requires an action.

However I could also understand the point of view that everything not being really
I2C-compliant should trigger a warning.

I'm fine with both options, please advise.

>  	if (bit_adap->getscl == NULL)
>   		dev_warn(&adap->dev, "Not I2C compliant: can't read SCL\n");
> 
>  	if (bit_adap->getsda == NULL)
>   		dev_warn(&adap->dev, "Not I2C compliant: can't read SDA\n");
> 
>  	if (bit_adap->getscl == NULL || bit_adap->getsda == NULL)
>   		dev_warn(&adap->dev, "Bus may be unreliable\n");
> 
> The above code can surely be simplified. I just wanted to show this
> simple approach so we can discuss my suggestion.
> 
> All the best,
> 
>    Wolfram
> 

