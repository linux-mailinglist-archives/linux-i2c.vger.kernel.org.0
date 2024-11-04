Return-Path: <linux-i2c+bounces-7757-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AE49BB6B4
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 14:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 451581F22EEB
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 13:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12DE84A35;
	Mon,  4 Nov 2024 13:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eP4oibdr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9358170805;
	Mon,  4 Nov 2024 13:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730728291; cv=none; b=dbXpktEvqr5gztR6BuKoNKA3I5UjzJdSKe9AyTpcLyaztXtJh0s18NqVUU67k1TreQfupfaRj/FwgrJvyC8+jvhf8EZ5OUX9NiqpOehXoua+27diAcbJwUVLlWv3dzPi1JLyrr3J229PLSZDMKG5vYevapCkZ1GQYsiwFn2qZ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730728291; c=relaxed/simple;
	bh=1w2eRE72QIY6UPS8PbgUFDNBykn84o7fCfcWxqfb9Ng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJ2AHASgZ16beLihUuhZmGIxmMjaeGMCteltDniUdDMsGTHhkZ4h/umyd6PNanZRcXnwOr/lqrPfdDxXg+UPgZTFRR1duwwzSfYpwpd/9FiESKtUyzTxZoFBcx1QNA+3ktDQOF+FXq+HSqfgJdoa6f7r6UwrlVqwTPFaplFazkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eP4oibdr; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e953f4e7cso3315603b3a.3;
        Mon, 04 Nov 2024 05:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730728289; x=1731333089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RisdBhDozfhIAK5Mme80AcSFBcqV8wUI4AjA2PHwUtc=;
        b=eP4oibdr+S4V+J/Yyb5+ZndTWPPnr3v9DkwJLzWgIYmG7gk/IxYQ0RdOjYY89C1mZQ
         19fSqi6luHvak9YoKXfLIHOIVu2+2JbfseVuucCuxvmp+m5Wu2cJYfi79vaJ26tEKKgE
         3hbaj9WqE/bLEBM4p3eWBvP/HrH5+xkDX6TrstUZrCBgRrcqNgOJ+24C2XU1OHY3c8UG
         H304yM9QNq0vwWAamlwRtAyvYBN3R2BHHCq1yfWHsj6P8Z1/liuFmaV5meQjN6pa7qPE
         u9MvCQ1Oxry2KDYIlj7gkN8Fs0vNAR3TtXNC2li89zwPSuJEzrLQAPc0CfDnJRGQQr75
         YuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730728289; x=1731333089;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RisdBhDozfhIAK5Mme80AcSFBcqV8wUI4AjA2PHwUtc=;
        b=tr7lC2z5ltf+pGaCHDXoAa3iO11llgOu/TmN+GTiUAAGPDFoB5IpKdMlQdFg09Tmuu
         bNGeGzIKDZsViQhSujLHaF31jEXkGFJBs/LpM7EnxTKXVOc7JPUhRhFjbJvG5xQcWnPJ
         3cp9wiLr9iPZ5+gIJomPMwyJy/KvLHpTGUdmhOfJLCAbXx4dZWMwiyuC9TQ5nrEpGSXu
         u8QneRU+Bi4/LeFUArt3KpFD5BJ4F/AYiPmGyctosjhcRwdB/n8Ity7Y+kWMY46ov7SK
         J9A0jz6AUAugt+aDKUUihxL9vYDwK7mnsxvxOE/VKkHTiOggmqbAUO4tPTKkUYkYzrLI
         oRlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIfZt/Gv58XMSKFW8QHG/GEisqNaXDrXD9WJZGUS/ky6D2SKIvta9rVPNZ3WeiBDaBeAACBz/jRg0aJb4=@vger.kernel.org, AJvYcCVTRBpt8sNAuBcaX1sb4azzO7kn5rfxYr3hDITlNFeU6HVKBIcgv+Dz+jgQQ6q8+2oz8Ll6+gyS4SeX@vger.kernel.org, AJvYcCWIi+BNZsxqyA8a2EjBhicLsb7D5TKS5R3dHXjRwQ3en6h7fF6wjwaGIO8h5C0CHqf8WFYrTJdWEu2l@vger.kernel.org, AJvYcCWx3AsyjxDBltN7oyqkf5gPOEKzKrvouw8Q+5yMosBgtdoLg2ogmbE+JFTUXyjniHnPe/rbbuIwekqUnZe6@vger.kernel.org, AJvYcCWxUg1YaeXcPl6BSYb+TW17Oi+0j7o2a6iAzMBz1tg/61UwqAeG7HOg+cTWkmSDAZx1QpSOGwCtSrDs@vger.kernel.org
X-Gm-Message-State: AOJu0YzGIIk7wdvWnCPmaU/Wr0Nv1n7FYF3fHAqQT4Wz7xMF/oHWzkvZ
	v1uTGenBBx60YiICu5pjctIJx6QuMPVg/ytVFJWbEsxMvlSvkLlN
X-Google-Smtp-Source: AGHT+IFT9MWN3Z5rfIFhSF9LIZsbbBcASg5951HhUUaBr+5y8PILt51QH8l3yj+ywBZD5Kub3Sm5ng==
X-Received: by 2002:a05:6a00:14d3:b0:71d:fe64:e3fa with SMTP id d2e1a72fcca58-720c9990cc3mr18918463b3a.19.1730728288694;
        Mon, 04 Nov 2024 05:51:28 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b91d3sm7397947b3a.38.2024.11.04.05.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 05:51:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2a5c17c9-db8c-492d-87e7-c9872b2d5100@roeck-us.net>
Date: Mon, 4 Nov 2024 05:51:26 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] hwmon: (pmbus/core) clear faults after setting
 smbalert mask
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Naresh Solanki <naresh.solanki@9elements.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
 <20241024-tps25990-v3-4-b6a6e9d4b506@baylibre.com>
 <fa3ccd3b-7dab-45b2-92ec-49400e39114c@roeck-us.net>
 <1jo72v5rnp.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <1jo72v5rnp.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/24 00:28, Jerome Brunet wrote:
> On Fri 01 Nov 2024 at 08:10, Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On Thu, Oct 24, 2024 at 08:10:38PM +0200, Jerome Brunet wrote:
>>> pmbus_write_smbalert_mask() ignores the errors if the chip can't set
>>> smbalert mask the standard way. It is not necessarily a problem for the irq
>>> support if the chip is otherwise properly setup but it may leave an
>>> uncleared fault behind.
>>>
>>> pmbus_core will pick the fault on the next register_check(). The register
>>> check will fails regardless of the actual register support by the chip.
>>>
>>> This leads to missing attributes or debugfs entries for chips that should
>>> provide them.
>>>
>>> We cannot rely on register_check() as PMBUS_SMBALERT_MASK may be read-only.
>>>
>>> Unconditionally clear the page fault after setting PMBUS_SMBALERT_MASK to
>>> avoid the problem.
>>>
>>> Suggested-by: Guenter Roeck <linux@roeck-us.net>
>>> Fixes: 221819ca4c36 ("hwmon: (pmbus/core) Add interrupt support")
>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>> ---
>>>   drivers/hwmon/pmbus/pmbus_core.c | 7 ++++++-
>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>>> index ce697ca03de01c0e5a352f8f6b72671137721868..a0a397d571caa1a6620ef095f9cf63d94e8bda1d 100644
>>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>>> @@ -3346,7 +3346,12 @@ static int pmbus_regulator_notify(struct pmbus_data *data, int page, int event)
>>>   
>>>   static int pmbus_write_smbalert_mask(struct i2c_client *client, u8 page, u8 reg, u8 val)
>>>   {
>>> -	return _pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK, reg | (val << 8));
>>> +	int ret;
>>> +
>>> +	ret = _pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK, reg | (val << 8));
>>> +	pmbus_clear_fault_page(client, -1);
>>
>> Why -1 and not page ?
> 
> The idea was to clear the fault on the page we are on, basically just skipping
> setting the page again.
> 
> I'll change to 'page'
> 
Or just add a comment explaining the '-1'.

Thanks,
Guenter


