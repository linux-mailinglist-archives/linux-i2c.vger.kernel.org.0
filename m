Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5294C64FB35
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Dec 2022 18:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbiLQRWH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Dec 2022 12:22:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbiLQRWF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Dec 2022 12:22:05 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D71FADD
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 09:22:04 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id h16so5185998wrz.12
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 09:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J/HcfCqYcxJMHbAOcAjELp8fA8svV504O1OhkRwDbE4=;
        b=cdhYFNMkxMLJTvj0KqB+H4W46k2odIroi0yiLuhkLqVvZ/9W3sD35tvdICibQWBOXD
         VLEtYboqJulW/FGkjkbbdxOHaW5ra7bKXNLHQqvbgBGT1trnn5EPohviRzG/FFqHp8io
         dEtVOaH/gRxfjwZeZWiLT2uyBgRjh+yx+/NePe68UfTQEvrXciXwXjXHtWp2Zh4myYrj
         M/yPMrZh76uftQogBae4XwHhWNbKCumoeWhLizPJNdka/Zews/1N75Z6Veg2zoYW223b
         HRpO4MmUfU9aNRTdxjkWhBnvhfwfpcVK0xeQ5iWzg+ggP+lRsVeTA6eplgFbNlwKYorB
         ysdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/HcfCqYcxJMHbAOcAjELp8fA8svV504O1OhkRwDbE4=;
        b=mij1BUykzq87745v219m9p9BGC0BvEoTCg0np2AAnRAL/Eergi6pV8u4BlEc4WZiNk
         E07z0lzGgyX0KGQaKZNBtsjy/zpgbe9+jAWixuTlmUwh9yeN8fBIYLxTeLbYvA3WhISW
         bL2Mio1vKIAzX74XfAzXaFVsFu0/yBZ6FouwriAaXdplFuEgBLu4SF+j6fd2KZzE63dL
         lRxycpuubEsuGFajmOEdWS3lp61KYtKGpSKuNsH/MqQDvdE+qM+9kBSdBpRcDHKUSRXv
         G3agBdFOFl4dJoYtS2cdV534muIWFNgqIr14vcibyVKLEqPrRNRqcrVoX/JBaKRjsUwe
         bFIA==
X-Gm-Message-State: ANoB5pnl1vSFmDt4p2qGTuZF09X0OBN8J5k3eNiyVLqcuiws4vtS2HGo
        Fq3EQ0QTKFmVh0Bwt5Cke04K/285jOE=
X-Google-Smtp-Source: AA0mqf6Vm+El6ESXwNufBDsuUL5goye7cnViugdGCzEnKgHnnTLfZhQqIhFuDh9cIdYU6blDaRzNQA==
X-Received: by 2002:a5d:4c43:0:b0:242:290c:34e8 with SMTP id n3-20020a5d4c43000000b00242290c34e8mr23343867wrt.31.1671297722724;
        Sat, 17 Dec 2022 09:22:02 -0800 (PST)
Received: from ?IPV6:2a01:c22:7af7:5300:8868:b389:215f:d1? (dynamic-2a01-0c22-7af7-5300-8868-b389-215f-00d1.c22.pool.telefonica.de. [2a01:c22:7af7:5300:8868:b389:215f:d1])
        by smtp.googlemail.com with ESMTPSA id x13-20020a5d6b4d000000b00241ce5d605dsm5407718wrw.110.2022.12.17.09.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 09:22:02 -0800 (PST)
Message-ID: <97cc53c9-040b-df62-ab29-77cea7913ae1@gmail.com>
Date:   Sat, 17 Dec 2022 18:21:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 8/8] i2c: i801: call i801_check_post() from i801_access()
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
 <9103e680-6436-42a3-d4be-39edf851aaf9@gmail.com>
 <20220610163110.28d50ae6@endymion.delvare>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20220610163110.28d50ae6@endymion.delvare>
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

On 10.06.2022 16:31, Jean Delvare wrote:
> Hi Heiner,
> 
> On Fri, 15 Apr 2022 18:59:46 +0200, Heiner Kallweit wrote:
>> Avoid code duplication by calling i801_check_post() from i801_access().
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 20 +++++++++-----------
>>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> Overall I like the idea. I only have one question to make sure I'm not
> missing something.
> 
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index 9061333f2..ecec7a3a8 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -432,7 +432,7 @@ static int i801_wait_intr(struct i801_priv *priv)
>>  		busy = status & SMBHSTSTS_HOST_BUSY;
>>  		status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
>>  		if (!busy && status)
>> -			return status;
>> +			return status & STATUS_ERROR_FLAGS;
>>  	} while (time_is_after_eq_jiffies(timeout));
> 
> Do I understand correctly that this change isn't really related to the
> rest of the patch, and could have been done independently?
> 
> You are filtering out SMBHSTSTS_INTR simply because i801_check_post()
> will never check it anyway, right? If so, I wonder if that's really
> something we want to do, as ultimately this adds code with no
> functional benefit just to be "cleaner". But please correct me if I'm
> wrong.
> 
Reason is that in few places we check whether return value of
i801_wait_intr() is zero, this would fail if not filtering out SMBHSTSTS_INTR.
Example:
i801_transaction() returns the return value of i801_wait_intr() now.
And in i801_block_transaction_by_block() we check whether return value of
i801_transaction() is zero.

