Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8C53E30AF
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 23:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234709AbhHFVLD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 17:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbhHFVLD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 17:11:03 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9B9C0613CF
        for <linux-i2c@vger.kernel.org>; Fri,  6 Aug 2021 14:10:46 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id h13so12662321wrp.1
        for <linux-i2c@vger.kernel.org>; Fri, 06 Aug 2021 14:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mUTZ9cdZGxexqWJGIlo3+KSQ2zNtN088Dd5VoIGmoWA=;
        b=PJaM9gUUMYevxPfbJ23t06smKjimtMzMrXpuxmmdjiI4Kx965/MKi1PzRcxwqIFQWM
         ZUXHWZoBZlqRONbuad7v8h0wT7s5w7Ekrd84lAbcwO50vkZJA1gXUV1VI2XooMBlJZG2
         cIBZZSPfN7c1c/On4GMT+95zXnM5aE1CEn2AM85gUePEuiBM9OLwZWBSh9lMvKkEuTDF
         dcNiSJmjeORTmaAZAApaN5YO837SKrrCWZRij69PRYZMqsJD9QD9ZnUSPqLapa87WQmT
         mHEEg7b5XLJ/64OcPfj4B+FVZGBTu10ksUjSZy24eiL9VxuA/xCuSkrPTigV5P/WyRWg
         Qg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mUTZ9cdZGxexqWJGIlo3+KSQ2zNtN088Dd5VoIGmoWA=;
        b=bF7Rr+k81l382QwZeFRSyo5dfBxpo9ZZf9Pgo51VFScJ3gEyKLh7Pt6PvrgAOGLcji
         hSG5qVfjIzPN3wslj6dm3yVisAPIP/bWDfzUV3k7/Pp23BQSxC68KdWvRKfNfNI7WaKR
         JxW7hlgN9cFw/SRvuwLbVRrjdmXVJ5aEsoDtUBEhv7nu6z60Xh7l0Q2GhsBvnxIB0HSG
         X6hqoadO/kiYTzq9AO7QgRXMN0RbxLUiuGxc0Nb5BYiy8e5VLM+RRdDw7tPY+JPaPqZW
         iJrcxWKJpAwoFd+UnciRz3FJZ1ZENJ1Uggs5j+eEz8iuulN6rAe9lgnmVpfkX9dZaKcC
         3Yxg==
X-Gm-Message-State: AOAM530yHuEaoxP7O1UtR5XCYuMo9MEUrolN4xWZ7xT5GFgi/v/+pU1O
        UsSlBGvmlDMnYLS56YKpHyNbU0Fr97hl6Q==
X-Google-Smtp-Source: ABdhPJwUJdEQ5Js7KFOJKOTu5E8UAUEO4PKPp/fjtt5BaSPrYiZR9YTfvfr1vUORDL9GOuEZ3ut8VA==
X-Received: by 2002:adf:ed51:: with SMTP id u17mr12543291wro.416.1628284245150;
        Fri, 06 Aug 2021 14:10:45 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:cc6d:4891:c067:bf7b? (p200300ea8f10c200cc6d4891c067bf7b.dip0.t-ipconnect.de. [2003:ea:8f10:c200:cc6d:4891:c067:bf7b])
        by smtp.googlemail.com with ESMTPSA id l18sm359460wmc.30.2021.08.06.14.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 14:10:44 -0700 (PDT)
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
 <5d8e72e2-085b-32ea-0a86-eeecfe1e94f3@gmail.com>
 <20210805162309.14dbaf63@endymion>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 09/10] i2c: i801: Improve
 register_dell_lis3lv02d_i2c_device
Message-ID: <72f456d2-8b6c-16b1-23c6-e117bbf5b3ee@gmail.com>
Date:   Fri, 6 Aug 2021 22:49:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805162309.14dbaf63@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05.08.2021 16:23, Jean Delvare wrote:
> On Sun, 01 Aug 2021 16:23:34 +0200, Heiner Kallweit wrote:
>> - Use an initializer for struct i2c_board_info info
>> - Use dmi_match()
>> - Simplify loop logic
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 28 +++++++++-------------------
>>  1 file changed, 9 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index 958b2e14b..1ca92a1e0 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -1245,28 +1245,18 @@ static const struct {
>>  
>>  static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
>>  {
>> -	struct i2c_board_info info;
>> -	const char *dmi_product_name;
>> +	struct i2c_board_info info = { .type = "lis3lv02d" };
> 
> Can it be moved to the inner loop where it is used, so that
> initialization only takes place when needed? I don't know how the
> compiler handles that, to be honest.
> 
>>  	int i;
>>  
>> -	dmi_product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
>> -	for (i = 0; i < ARRAY_SIZE(dell_lis3lv02d_devices); ++i) {
>> -		if (strcmp(dmi_product_name,
>> -			   dell_lis3lv02d_devices[i].dmi_product_name) == 0)
>> -			break;
>> -	}
>> -
>> -	if (i == ARRAY_SIZE(dell_lis3lv02d_devices)) {
>> -		dev_warn(&priv->pci_dev->dev,
>> -			 "Accelerometer lis3lv02d is present on SMBus but its"
>> -			 " address is unknown, skipping registration\n");
>> -		return;
>> -	}
>> +	for (i = 0; i < ARRAY_SIZE(dell_lis3lv02d_devices); ++i)
> 
> Outer block without curly braces is discouraged for readability and
> maintenance reasons (see Documentation/process/coding-style.rst section
> 3).
> 
>> +		if (dmi_match(DMI_PRODUCT_NAME, dell_lis3lv02d_devices[i].dmi_product_name)) {
> 
> This causes dmi_get_system_info(DMI_PRODUCT_NAME) to be called for
> every iteration of the loop, slowing down the lookup. It's an exported
> function so it can't be inlined by the compiler. I know this happens
> only once, but we try to keep boot times as short as possible.
> 
I'm aware of this. However we just talk about a small in-memory operation and
the performance impact should be neglectable. dmi_get_system_info() is just
the following:

const char *dmi_get_system_info(int field)
{
	return dmi_ident[field];
}
EXPORT_SYMBOL(dmi_get_system_info);

I'd rate the simpler and better maintainable code higher.
But that's just a personal opinion and mileage may vary.


>> +			info.addr = dell_lis3lv02d_devices[i].i2c_addr;
>> +			i2c_new_client_device(&priv->adapter, &info);
>> +			return;
>> +		}
>>  
>> -	memset(&info, 0, sizeof(struct i2c_board_info));
>> -	info.addr = dell_lis3lv02d_devices[i].i2c_addr;
>> -	strlcpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
>> -	i2c_new_client_device(&priv->adapter, &info);
>> +	pci_warn(priv->pci_dev,
>> +		 "Accelerometer lis3lv02d is present on SMBus but its address is unknown, skipping registration\n");
>>  }
>>  
>>  /* Register optional slaves */
> 
> 

