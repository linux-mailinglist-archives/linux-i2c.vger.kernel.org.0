Return-Path: <linux-i2c+bounces-11250-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0C7ACDE39
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 14:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63DA63A6504
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 12:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1AAC28F944;
	Wed,  4 Jun 2025 12:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Py/AWMKV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36A528F519;
	Wed,  4 Jun 2025 12:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749040850; cv=none; b=JjFQmg+ZkCzcU9xdSgs9///G+FC5KwEpcubPSELoUzGXlPgiV3y7mXxzCcU3pNpvScAJMzfDIZ+F5jVOkgk3VU+JRhqNXv6AOwQU1PqExXDyINgt5szI481hTCZwuqXUnf/YvimjrvoRj9IoolIOEdKU3SULz8fuPxM+u+jmHrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749040850; c=relaxed/simple;
	bh=N8uiVae6oE1XXvRHce8cbIz1nvFVH2qSLdUR8H3ZAP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLISFQFgb65V8PFxYcTxWMUSasLlL1dT0oYBMED1vB8D9QTc5U13Gcm9TK+bWjfwd3OYRoRky1VwNXJnEuUnlvatRylS2YlJa74/MvckjbBJKNP7y5XLW18OtPCUeKDMaYEiZyXHKRbanUn+ULqJFvF5cCHtHCcL9e7ziZ9CHN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Py/AWMKV; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234b9dfb842so63824745ad.1;
        Wed, 04 Jun 2025 05:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749040848; x=1749645648; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YcEj/aWZNhqGZpBtE8sRSulKBrrHvintUVW8xwBX/OU=;
        b=Py/AWMKViHuAtW8TZz3hhYp/9otIMUiqDPo/V+6Dk4yNcwHEabinT4F7SU83Kdcri7
         UDEI0YPDxcbP6wZwU/eheM0Koal5DO8ydRkpcg3Z5XoIRb7Qw1MgZG227w0pRzhFQxam
         T5l6llkaJFKpF/7JIu2DeM8TttsGOEZiMGtC30ZKVqbmCL11gnTRM6vgUp7cLq2usxwf
         QlzhOPiow8YQrQGudut63MWCuqEFD3Ja8xQ8HUL10Jl0oMg2SABRuckiiD6mTtYoMKx7
         OgFN8faO7+bgOPKS7ghCPZeEsBkUoEmqn5OEYcNAdFQmdA5OhLa1glIJ/Dw0to3V/2Fw
         1flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749040848; x=1749645648;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcEj/aWZNhqGZpBtE8sRSulKBrrHvintUVW8xwBX/OU=;
        b=LgVS48X4PU0j3E1avlRUFYJfWPKgqMBpnslaYPNosUpZqIgUiZMe0VWm6ysTmwB/Ca
         Q6Hmse6h7OcwPpaWoVupdIXDfFS0qD1RtEepuW6jVI0Rt2R7Qfkur8Q5oNBRRfcJGI2/
         Kh0AwjK0UT6iwioX8HCCx9Mg+0PeyjszKvwbtvhBVEVLG2SNc2bybShiev1ezYn5HosQ
         3d3KrPinNB9y3xNHslf+aft0YRbk+Q02HIVvGkCQtzR2K+mAcdX5XPidyyeTaXjTaUA+
         QwdrIJliTKWKB/NHiTAq5ZBDBRm2y4kHH7yLC8iSVANZc5AH8yiert9llaXfY0m7v6Kt
         YCmg==
X-Forwarded-Encrypted: i=1; AJvYcCUD4VanUPzOCOh3dZed971yaOGqcQ+LbYHKvHpm1yg/D8YTiwJ1xNKIYhEEEKG6IdnxNWcb9w8BEAQR@vger.kernel.org, AJvYcCVEWokfpd+wnS4seIYOkIAF2d+qMqUqdcdQJ6CC6fxFoRBEVERh5MwtF0S2hUasVraXWLbSPDG79R4zJA==@vger.kernel.org, AJvYcCVUwurfT9NpOkImFYR3sX+S6ACrIch+RU4yb1MZ/Ae36as4fuIpUFEQjXAW+F/veXdZt+Ic+um6PuDmfO8=@vger.kernel.org, AJvYcCVl4QwRjZ7cbMVJtQ6b4ichJ98AoJxkGDrPzFHGvEgH/2AG0CErk6+JPUJweTavvDv/xQi/qeRq@vger.kernel.org, AJvYcCWHkwml0ipQ9/xbT00haEwC6UWSeThx+ueat4pRUK1i8b+Cy8wBjMz8gg/ieqXetZkQgV6E4qV1EfzG@vger.kernel.org, AJvYcCWlSIhTuWJZjnhaj3yz19a8b3slwceF1krBvvaSySU93olsXv3haF6rkLv5f2BpVjbmyj7hQKLqyLPgFpgvpOA=@vger.kernel.org, AJvYcCWmuI13FNiRBf9sPuUmBtrHINGlETz6YOSnCIMFtPcqadG4q3FfhbFcDhablaUoJ3cWcaxGykUYeIY=@vger.kernel.org, AJvYcCXBlZtuxxZCQKekiOa10rwZBYJh/teFXrAbcTHBtODTFIazthnigVE4tDGdwNCtciZqh/tVsXP5X8bn@vger.kernel.org
X-Gm-Message-State: AOJu0Yznub9MmIqACUPcW9xfsr3JslSbYKxQk5hqy6aSBfg+QV2/uYhS
	1AG7yWhII9gtdJg5M76PNstG77SkFcyKlpIhdBf3d3KrH5yeEolF2g76
X-Gm-Gg: ASbGnctEry1mhQB+5mHi+vxaBeyfP2cPXUiilk2KUHSl/Ch4qVvpBQfLNpJPeHrbB+p
	kK4xXIROKmsJozaGoctMwehXVuNGfwmaRExtFjhktddytvq8m5FW2+brH1U1lth9Kom5MV0Z4Ej
	6GFjYBiziUBIKAc34rGG7g/q3JE5lJTW5fvuu+A5syTZqNTcnCEdbGuIhgbG3Vwcxi9cmEb4xlT
	tRI1uXI806MPfZyuPC16tb+V2UpbsnZcemE5RK7ntXuNNYtj9CcH4avr6AbfxVyk8HE6mL0x8x4
	DfjxoNdTrICiJK1ulCRVxz9oRUiPXZsnovLE6HZu/UOgnAUl25+DbbhDeFZQMkTMCpZFS2W5rys
	qbWayYz1YMmfe7uqzAMh+W7d1
X-Google-Smtp-Source: AGHT+IERU/kiPfbUxJ4S1Wpefai0KxefbnmPlZ3YVymeooCAaPKk9C+duebTa/GriRuybAh8KfqKEQ==
X-Received: by 2002:a17:902:7c12:b0:234:98eb:8eda with SMTP id d9443c01a7336-235e11cb8e4mr32732355ad.28.1749040847880;
        Wed, 04 Jun 2025 05:40:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d22d0dsm102769895ad.257.2025.06.04.05.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 05:40:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <12098259-32c4-4524-813e-38aeced837a0@roeck-us.net>
Date: Wed, 4 Jun 2025 05:40:44 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Oliver Neukum <oneukum@suse.com>, a0282524688@gmail.com, lee@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
 mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wim@linux-watchdog.org, jdelvare@suse.com,
 alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org, Ming Yu <tmyu0@nuvoton.com>
References: <20250604041418.1188792-1-tmyu0@nuvoton.com>
 <20250604041418.1188792-2-tmyu0@nuvoton.com>
 <b4c15a6b-0906-4fea-b218-4467afdd8345@suse.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <b4c15a6b-0906-4fea-b218-4467afdd8345@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/4/25 03:11, Oliver Neukum wrote:
> On 04.06.25 06:14, a0282524688@gmail.com wrote:
>> From: Ming Yu <tmyu0@nuvoton.com>
>>
>> The Nuvoton NCT6694 provides an USB interface to the host to
>> access its features.
>>
>> Sub-devices can use the USB functions nct6694_read_msg() and
>> nct6694_write_msg() to issue a command. They can also request
>> interrupt that will be called when the USB device receives its
>> interrupt pipe.
>>
>> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
>> ---
...
>> +static void usb_int_callback(struct urb *urb)
>> +{
>> +    struct nct6694 *nct6694 = urb->context;
>> +    unsigned int *int_status = urb->transfer_buffer;
>> +    int ret;
>> +
>> +    switch (urb->status) {
>> +    case 0:
>> +        break;
>> +    case -ECONNRESET:
>> +    case -ENOENT:
>> +    case -ESHUTDOWN:
>> +        return;
>> +    default:
>> +        goto resubmit;
>> +    }
>> +
>> +    while (*int_status) {
>> +        int irq = __ffs(*int_status);
>> +
>> +        generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
>> +        *int_status &= ~BIT(irq);
>> +    }
> 
> Does modifying the byte have any benefit?
> 

Not sure if I understand the question, and assuming your question is regarding
*int_status: *int_status!=0 is the loop invariant, so, yes, modifying it does
have a benefit.

I'd be more concerned that transfer_buffer is the raw buffer, and that data
read from it is not endianness converted. That makes me wonder if and how the
code would work on a big endian system.

Guenter


