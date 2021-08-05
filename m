Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3E073E1D27
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Aug 2021 22:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240525AbhHEUGY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Aug 2021 16:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240406AbhHEUGY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Aug 2021 16:06:24 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E00C061765
        for <linux-i2c@vger.kernel.org>; Thu,  5 Aug 2021 13:06:09 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id j2so8058403wrx.9
        for <linux-i2c@vger.kernel.org>; Thu, 05 Aug 2021 13:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AUb76+wPgJL3EgjtyKKGQDpog6HmmoNnbGQpptaeVWc=;
        b=kS6vQZkyF9VmjiANa2rDGP7nFAtauiweuB443QeH6WTqVw2EJauUf0fXH+TL3fQkwe
         P3GUoUvDOrX4G0DemmOsRLSvqsGj0XNawMfpP6ISZt7NbkwW4btro6rG8E8fVDHsYLTS
         06nFNzXZSK+a/3RQzhZvT25HBBJL54yufIRSlMNQSmZntzQN+njRniW7t0Y/9hR6Dc1N
         wj4mJa+HnVMABKY88gWRphF48aSIwPg6J+aX24Vj35arci5GF7xbVwOwH4seMu2VSTQt
         ldZIi90IPtKD/U7wptgfdL4M1Lir/yw2gzkZd4lYLHNdAcMLRfYb1VA5CitBBL0hZiv3
         giIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AUb76+wPgJL3EgjtyKKGQDpog6HmmoNnbGQpptaeVWc=;
        b=PpP3sCxN/Tz6C2mXhvzyodn47Oq2K3V6HZsaW39sG0XRNwTIXcbUgXMvwYK6qpk5QU
         mTHKXtvE6H3qTvLNtpREJXTbHWwFlpShY76obe6+LcgLgUmdJbzS+jBdfue+y5aKMG+8
         XO4z6+llgCNQhZmfWulzQt9J2njeOTVa6ZbW0eQbVRFn1pvoQgszxWrYNB4dmi9Mj1Kc
         ohdHZyutLpE0n5NtYPxcXNhO1F39LiGt2uHfqii7n18et4QDcSxyM+jhJt/+KWEmP9MT
         b8rysYI3Ray/3zl0pOnZ0wuq2VVjDHl/yxWAYOejcwDN17ykn6FOtGaKsAZNdlEmhXnq
         wMuQ==
X-Gm-Message-State: AOAM532gpm8Eaj1+57GIwIUmQHP6HXKTLfPO7R/EnGz0TjEB8Cl0CogW
        8RQbydCNY/mhUF4Io8BNzrBA5RrRONoQXg==
X-Google-Smtp-Source: ABdhPJzHp/Z9ZqUI+kh6ca3UBbUzIlCoDQfcxKF8ZqNf6olB9BVfi850vC5nC3QiUJnaAEwyb6diIA==
X-Received: by 2002:a5d:684a:: with SMTP id o10mr7022307wrw.384.1628193967926;
        Thu, 05 Aug 2021 13:06:07 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:75d1:7bfc:8928:d5ba? (p200300ea8f10c20075d17bfc8928d5ba.dip0.t-ipconnect.de. [2003:ea:8f10:c200:75d1:7bfc:8928:d5ba])
        by smtp.googlemail.com with ESMTPSA id k17sm9767016wmj.0.2021.08.05.13.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 13:06:07 -0700 (PDT)
Subject: Re: [PATCH 10/10] i2c: i801: Improve handling platform data for tco
 device
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
 <cf0ba833-8fdb-42ca-3b6f-b305bf28516a@gmail.com>
 <20210805203230.35058c09@endymion>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <09238749-cc4b-a689-b87f-affc95ee0bfe@gmail.com>
Date:   Thu, 5 Aug 2021 21:44:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805203230.35058c09@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05.08.2021 20:32, Jean Delvare wrote:
> On Sun, 01 Aug 2021 16:24:30 +0200, Heiner Kallweit wrote:
>> The platform data structures are used in the respective i801_add_tco
>> functions only. Therefore we can make the definitions local to these
>> functions.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 27 ++++++++++++---------------
>>  1 file changed, 12 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index 1ca92a1e0..64217479a 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -1464,15 +1464,14 @@ static inline unsigned int i801_get_adapter_class(struct i801_priv *priv)
>>  }
>>  #endif
>>  
>> -static const struct itco_wdt_platform_data spt_tco_platform_data = {
>> -	.name = "Intel PCH",
>> -	.version = 4,
>> -};
>> -
>>  static struct platform_device *
>>  i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
>>  		 struct resource *tco_res)
>>  {
>> +	static const struct itco_wdt_platform_data pldata = {
>> +		.name = "Intel PCH",
>> +		.version = 4,
>> +	};
>>  	static DEFINE_MUTEX(p2sb_mutex);
>>  	struct resource *res;
>>  	unsigned int devfn;
>> @@ -1516,22 +1515,20 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
>>  	res->flags = IORESOURCE_MEM;
>>  
>>  	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
>> -					tco_res, 2, &spt_tco_platform_data,
>> -					sizeof(spt_tco_platform_data));
>> +					tco_res, 2, &pldata, sizeof(pldata));
>>  }
>>  
>> -static const struct itco_wdt_platform_data cnl_tco_platform_data = {
>> -	.name = "Intel PCH",
>> -	.version = 6,
>> -};
>> -
>>  static struct platform_device *
>>  i801_add_tco_cnl(struct i801_priv *priv, struct pci_dev *pci_dev,
>>  		 struct resource *tco_res)
>>  {
>> -	return platform_device_register_resndata(&pci_dev->dev,
>> -			"iTCO_wdt", -1, tco_res, 1, &cnl_tco_platform_data,
>> -			sizeof(cnl_tco_platform_data));
>> +	static const struct itco_wdt_platform_data pldata = {
>> +		.name = "Intel PCH",
>> +		.version = 6,
>> +	};
>> +
>> +	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
>> +						 tco_res, 1, &pldata, sizeof(pldata));
>>  }
>>  
>>  static void i801_add_tco(struct i801_priv *priv)
> 
> I don't really care either way, to be honest. But fine with me.
> 
To explain the motivation: I try to restrict visibility of a variable as much
as possible. This reduces risk of misuse / mistakes / name collisions.

> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 

