Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABFD46494BD
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Dec 2022 15:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbiLKOxA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Dec 2022 09:53:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiLKOw7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Dec 2022 09:52:59 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A5C5BC28
        for <linux-i2c@vger.kernel.org>; Sun, 11 Dec 2022 06:52:57 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id kw15so22107990ejc.10
        for <linux-i2c@vger.kernel.org>; Sun, 11 Dec 2022 06:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:cc:content-language
         :references:to:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3wPiqXwIsT4o0vGevGiTEJ2ZPa30YrreETSXO8Pje3I=;
        b=WQlLmxpEZsDsLsEXSdO75kf33NfzHMBWNxzuj/1Ij465qj0Xk3BgEGA/qECUF853bJ
         P74THntdq41dy1iYX9cQIGaJUuKK5OlOVikNgEafX6qd5s5kxBPsdefqYss+Hh3qdXDA
         bVfFU2hrpmZAIxdpVDnIYWzAXspSmQ/nasbiHVfn5cHzt0ArMuCi3/1A2XMwkTGm3dxN
         JtcGB4b2rQbm/BRI4uYhxijOIVQFqvn/cZ5VInRW3w6vXGeJn5LcYR6uGH5YhOVVGLTN
         79xq8c/no9Fyth/0hSbLttRxXMc7CKW4LALAhQCC8sNZKa6HkzWozbqn51BE6fuWLeuK
         jpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:cc:content-language
         :references:to:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3wPiqXwIsT4o0vGevGiTEJ2ZPa30YrreETSXO8Pje3I=;
        b=CcDCrufyZRoGXSbLeGGqBV5X78PSS8yhzJPOZh1slWOy2qN8meVNJ2RLrkkeHf4q66
         aLb+m5qLRQ1AkTG1OP6dG+5PF2yBRmWd6Z/nUlakmY3SeSuJTS11BwzbnCrl4//lbZwd
         L89jSFv8W+6l5rX1S51BYNDC8aO/bKoogjTL6HgBn7RgChP9Z87xafTjI/MlcblfejCk
         ozeRYvo8MkJAHI9Z8iw7GVko+WSYy+RyvWfELdTdzEZXhL5HBgm3KKIv64QX5mN3k101
         MkAeA1kh0VhuSmVUoQd71kf8lpqcthP5C+zMPbniX0DWjyn1rwDd65dN+PvHptf6dANQ
         BNag==
X-Gm-Message-State: ANoB5pm9iOQ6CodEMLHYHHNOE7HPGqarM7uUmHQuWOtHAe7LG5akfdIj
        4aHJo9zmITSTNN4nyNs+heXRvVjmQ+c=
X-Google-Smtp-Source: AA0mqf6BmmXZDmBDhrhpC49yMbFrBAsnQP08N0m+pfsgV41zDNn8OOj/PLzBSE942SAqSrEYEkvPSA==
X-Received: by 2002:a17:907:3e14:b0:7c0:f719:838d with SMTP id hp20-20020a1709073e1400b007c0f719838dmr14385373ejc.36.1670770375698;
        Sun, 11 Dec 2022 06:52:55 -0800 (PST)
Received: from ?IPV6:2a01:c23:b8e1:2200:1956:d6ee:60e0:6ee2? (dynamic-2a01-0c23-b8e1-2200-1956-d6ee-60e0-6ee2.c23.pool.telefonica.de. [2a01:c23:b8e1:2200:1956:d6ee:60e0:6ee2])
        by smtp.googlemail.com with ESMTPSA id gg9-20020a170906e28900b0078db5bddd9csm2152895ejb.22.2022.12.11.06.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Dec 2022 06:52:55 -0800 (PST)
Message-ID: <0cca5d12-cd15-213e-138b-c7791d5e4849@gmail.com>
Date:   Sun, 11 Dec 2022 15:52:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>
References: <3e6c934e-5298-42c5-c346-31b1acaa06ba@gmail.com>
 <2adcd797-f3cc-c8c7-c18c-d3726b2db4c0@gmail.com> <YoKmmIz7qJbD+hPY@kunai>
 <7a15288c-20df-5873-e982-28d200a2b471@gmail.com>
Content-Language: en-US
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] i2c: algo: bit: allow getsda to be NULL
In-Reply-To: <7a15288c-20df-5873-e982-28d200a2b471@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 14.08.2022 23:06, Heiner Kallweit wrote:
> On 16.05.2022 21:31, Wolfram Sang wrote:
>> Hi Heiner,
>>
> Hi Wolfram,
> 
> sorry for answering quite late ..
> 
>>>  	/* read ack: SDA should be pulled down by slave, or it may
>>>  	 * NAK (usually to report problems with the data we wrote).
>>> +	 * Report ACK if SDA is write-only.
>>
>> Minor nit: On first read, I didn't understand. "Always report ACK..." is
>> maybe a tad clearer.
>>
> 
> OK
> 
>>>  	 */
>>> @@ -203,6 +204,9 @@ static int i2c_inb(struct i2c_adapter *i2c_adap)
>>>  	unsigned char indata = 0;
>>>  	struct i2c_algo_bit_data *adap = i2c_adap->algo_data;
>>>  
>>> +	if (!adap->getsda)
>>> +		return -EOPNOTSUPP;
>>
>> Wouldn't it be better in 'readbytes' returning an errno there?
>>
> 
> I think that's something we can do in addition. We have other users of i2c_inb()
> than readbytes() (in i2c_algo_pcf), therefore I'd prefer to let i2c_inb()
> return an error instead of relying on upper layers only.
> 
>>> -	/* Complain if SCL can't be read */
>>> -	if (bit_adap->getscl == NULL) {
>>> +	if (bit_adap->getscl == NULL && bit_adap->getsda == NULL)
>>> +		dev_info(&adap->dev, "I2C-like interface, SDA and SCL are write-only\n");
>>> +	else if (bit_adap->getscl == NULL) {
>>> +		/* Complain if SCL can't be read */
>>>  		dev_warn(&adap->dev, "Not I2C compliant: can't read SCL\n");
>>>  		dev_warn(&adap->dev, "Bus may be unreliable\n");
>>
>> Hmm, this is a bit inconsistent with dev_warn and dev_info. How about
>> this?
>>
> Right, it would be a bit inconsistent. My thought was:
> If both getscl and getsda are NULL, then the driver is intentionally used this way
> and it reflects the design of the respective system.
> It's expected that both are NULL and there's nothing wrong with it.
> At least to me a warning means: Something isn't ok and requires an action.
> 
> However I could also understand the point of view that everything not being really
> I2C-compliant should trigger a warning.
> 
> I'm fine with both options, please advise.
> 
>>  	if (bit_adap->getscl == NULL)
>>   		dev_warn(&adap->dev, "Not I2C compliant: can't read SCL\n");
>>
>>  	if (bit_adap->getsda == NULL)
>>   		dev_warn(&adap->dev, "Not I2C compliant: can't read SDA\n");
>>
>>  	if (bit_adap->getscl == NULL || bit_adap->getsda == NULL)
>>   		dev_warn(&adap->dev, "Bus may be unreliable\n");
>>
>> The above code can surely be simplified. I just wanted to show this
>> simple approach so we can discuss my suggestion.
>>
>> All the best,
>>
>>    Wolfram
>>
> 
Just stumbled across this open discussion. Could you please have a look
at my feedback to your review comments?
Thanks

