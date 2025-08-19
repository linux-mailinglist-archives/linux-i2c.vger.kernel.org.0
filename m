Return-Path: <linux-i2c+bounces-12336-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 124B2B2BB64
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Aug 2025 10:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2CD63B2302
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Aug 2025 08:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92C41F0E53;
	Tue, 19 Aug 2025 08:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJj9C3ap"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8A023E34C;
	Tue, 19 Aug 2025 08:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755590868; cv=none; b=JNKjBHZmy8NyxhNTZ07YV58QRHqhQ8i9x9vGYXaOwBZXdHB/ssdP/cPEIW4Aud72rzQ0+aWT1PJZ7lzgJqh1A06XQtZdGQ9f3/lmwYB4C3mzpqDo+OtNg9f85LWDRG40U0f9gLMbB4fk0o/Q5JtY8QNZAkrqnIKxAj+Jy4N0aUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755590868; c=relaxed/simple;
	bh=sGUUw6LOvKfNRGIW7A9NNKDDH4bQsEEaWsH9vwxGp2w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oLnMnWrDMwNhBxziO4ve1Jt5IO4DkB0Wyhp8b0iUmWbYY3fH0AtjyPyINcHyC/kRoxO5nMHSID5aDStKWQZvTQQq2wr65Qg0bOb25V0Lh0ws5/T021Jwd6GXj/S3sof/batNb1KEb5VpSKr5xO3RGqAgXzr3/YWm9ukqQ6nXbJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJj9C3ap; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45a1b0becf5so26937655e9.2;
        Tue, 19 Aug 2025 01:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755590865; x=1756195665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A0A+ysSRX0BDGHubAfWN6+x/GTCkfulb6z+OLk3j05E=;
        b=nJj9C3apjINDgQdSNbuDUGPtWhPDNtOn/A80jYa/ruY/QdA0dPdVuf+WBZB9rjHSaz
         KzetIhur7n52IIT3mCWfSeVtsSKScRksjLwNFURQcPbsR6lUqJJpANs1gt+QItF8t7df
         O1IBTICEQ6z4eLfsWMi3pa0BfMRDzpUL3Jq4G2axqVGZaJ+utEDB8/h/fUMZfhMOiDpf
         UOpq+K2WLaPzrvGEYo3NtYGuDJDpqEAr8hYzSVR7q9VXWdXp664KdUjI7ZwKm0E0fdFC
         dYTxXf1KLazLRPwNaTbC3xFtkB3xE0SPoTZr3Ugjr/epOGLbh6VfZodyhmMeHXexXUeK
         gtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755590865; x=1756195665;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A0A+ysSRX0BDGHubAfWN6+x/GTCkfulb6z+OLk3j05E=;
        b=gk7K/BtmJfXv0i50NMf3QhqYyrbBAf4pvACMALKZ8svAKuzmO3fhfIUpgdZTNtzCd5
         YWIkne7OWZI8y4u8zmn8MvEi8kEWtfFexfY9IivpWD6cQnLiFsHVV7ljghbhw8oIdqN5
         YxTehSvQYsgiaZxGzEBRa/9XeGxwUaul29H5Qu/WKREKA0WrJpzP25qxfq32l/cYlcTS
         c+GcEztlF+fvzIjrjgwtmWBWXEgmsGM8Tb3viv38SXRwOxx7nYMj8nsRgYxV8dCgrQSy
         NGs99EuAw8yw8x9T1wpZia4XcdhZZNVa6J53gi/qQigECeS5oceSgogNdpWJPIXxBjp5
         791A==
X-Forwarded-Encrypted: i=1; AJvYcCVqRj/g+IlWc1IkOotv2dKzyVrwCEnE5BJDiWBi9lxw7J2g/WJt4LM7XCALBT8V+YCUtHcC7gQlfnYe/NAb@vger.kernel.org, AJvYcCWFxjcGFBKd8PawdsU5TCpuzYUjGbRmJUwRHQklgiJOXWBJNNkipbXzjgyTr69nXxxOBMbJh8LH@vger.kernel.org, AJvYcCWa8feEmYY3XBfwNejH3RrYBd+VzZtrm/ApXNBPcoKGICYym1Xd45Yx7Ces5CguVxV+sE5nQjwqJAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzImOfcyF6kPoe2HnLo7Q8dUrQ+Z2S7cTH41XIPVJMEq4qkurjD
	BN+HYwNFpDcetPPy5HemuL9A3Dtc44PpLrcUh+/S9TY4wZYtwmXmehq1
X-Gm-Gg: ASbGnctFH4Nyv2jWAmTpPuUMMehf1J3TUC9ZYRLQXcnjvN4F4zTwAEqCq71LsWZDQ7m
	3F+tQu6o6o1/CK1GJ79dHXdRH0pqNCn/QJa5uq7lGkpXLWWbBY9W2uzCNIL4XTqWB/fXd5Ym5q1
	8nZT9pb/pqD9I9dM+Et2a2e/DpvwRfvbMD5uKjp69NJoTogvKSSV2FKAkiJiHIUdNyed33mG/Yx
	tpSZ9xth1DJCgELLP5hYnQ6N3mxFezSG14GBICJnojkrLQkCWWALa/SnD+QrVnO0t1jkZpLScvK
	azYl+akEL6+bPO+sgSCTFHGGHPoBc5iR1RvXrvL0MhRxxoXMAru5B+bEz1vKKqUdodjr9lewfwP
	0G9cl3DgxaD9z2W2VtVfGiBJXKOyMrlskz19BScG2lGIfTdCJdQomXpBT4OPSCDMmayU5bg5P3/
	G3NvtoSKDv
X-Google-Smtp-Source: AGHT+IF0qT3S6QaRDTOtnywHkyQYjn24FhQXcdmgCV+CyKQOdIZxlhlDgAdk84rMMEvWXj0xBF+10Q==
X-Received: by 2002:a05:600c:4587:b0:459:d645:bff7 with SMTP id 5b1f17b1804b1-45b43dc654cmr13172695e9.12.1755590864562;
        Tue, 19 Aug 2025 01:07:44 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b42a771ecsm30719785e9.9.2025.08.19.01.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 01:07:43 -0700 (PDT)
Message-ID: <0e0a0da5-8953-4238-af89-687fb5a34c9f@gmail.com>
Date: Tue, 19 Aug 2025 10:07:41 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH v2 2/3] i2c: pxa: prevent calling of the generic recovery
 init code
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Hanna Hawa <hhhawa@amazon.com>, Robert Marko <robert.marko@sartura.hr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-2-ca42ea818dc9@gmail.com>
 <aJpR96Kkj12BwW-M@smile.fi.intel.com>
 <8cb62eb9-9137-44b4-86f6-82f69813e83f@gmail.com>
 <aJyOu_GUlDPuJXO5@smile.fi.intel.com>
 <0bfcb570-dab3-4038-a1aa-8bc7fe2feee8@gmail.com>
 <aJyvHnLS-A3F2gN7@shell.armlinux.org.uk>
 <1261d3ed-e057-45b1-913e-f8bf1cd5d7bc@gmail.com>
 <aKH6_1MRqD24QTq5@shell.armlinux.org.uk>
Content-Language: hu
In-Reply-To: <aKH6_1MRqD24QTq5@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2025. 08. 17. 17:53 keltezéssel, Russell King (Oracle) írta:
> On Sun, Aug 17, 2025 at 04:59:22PM +0200, Gabor Juhos wrote:
>> 2025. 08. 13. 17:28 keltezéssel, Russell King (Oracle) írta:
>>> On Wed, Aug 13, 2025 at 05:17:28PM +0200, Gabor Juhos wrote:
>>>> 2025. 08. 13. 15:10 keltezéssel, Andy Shevchenko írta:
>>>>> On Wed, Aug 13, 2025 at 12:36:45PM +0200, Gabor Juhos wrote:
>>>>>> 2025. 08. 11. 22:26 keltezéssel, Andy Shevchenko írta:
>>>>>>> On Mon, Aug 11, 2025 at 09:49:56PM +0200, Gabor Juhos wrote:
>>>>>
>>>>> ...
>>>>>
>>>>>>> TBH this sounds to me like trying to hack the solution and as you pointed out
>>>>>>> the problem is in pinctrl state changes. I think it may affect not only I2C case.
>>>>>>
>>>>>> It is not an error in the pinctrl code. I have checked and even fixed a few bugs
>>>>>> in that.
>>>>>>
>>>>>>> And I didn't get how recovery code affects the initialisation (enumeration).
>>>>>>
>>>>>> Without the fix, it is not possible to initiate a transaction on the bus, which
>>>>>> in turn prevents enumeration.
>>>>>
>>>>> But why? As you said below the first pin control state is changed during the
>>>>> probe, which is fine, and the culprit one happens on the recovery.
>>>>
>>>> Erm, no. Both happens during probe, before the I2C core tries to enumerate the
>>>> devices on the bus.
>>>>
>>>>> Why is recovery involved in probe? This is quite confusing...
>>>> Let me try to explain it differently. Here is the simplified call chain:
>>>>
>>>>   i2c_pxa_probe()
>>>>      ...
>>>>      i2c_pxa_init_recovery()
>>>>         pinctrl_select_state()                  <- selects GPIO state
>>>>         pinctrl_select_state()                  <- selects default (I2C) state
>>>>      ...
>>>>      i2c_add_numbered_adapter()
>>>>          i2c_register_adapter()
>>>>              ...
>>>>              i2c_init_recovery()
>>>>                  i2c_gpio_init_recovery()
>>>>                      i2c_gpio_init_generic_recovery()
>>>>                          pinctrl_select_state() <- selects GPIO state***
>>>>                          ...
>>>>                          pinctrl_select_state() <- selects default (I2C) state
>>>>              ...
>>>>              bus_for_each_drv()
>>>>                  __process_new_adapter()
>>>>                      i2c_do_add_adapter()
>>>>                          i2c_detect()           <- enumerates the devices
>>>>
>>>> The culprit is the first pinctrl_select_state() call in
>>>> i2c_gpio_init_generic_recovery() marked with '***'.
>>>>
>>>> That call causes the controller to go stuck, which makes it impossible to
>>>> transfer anything on the bus.
>>>
>>> Probably because when GPIO state is selected, the I2C bus pins end up
>>> being set low, which the I2C controller sees, so it thinks there's
>>> another device communicating on the bus.
>>
>> Yes, it seems so.
>>
>> When GPIO state is selected, the bits in the Bus Monitor register which are
>> continuously reflecting the value of the SCL and SDA pins contains zeros.
>>
>> Additionally, the Status register indicates an 'Early Bus Busy' condition, which
>> means that 'The SCL or SDA line is low, without a Start condition'.
>>
>>
>>> I could be wrong, as I don't have the hardware to hand to research
>>> the issue again.
>>>
>>> I have a vague memory that the GPIO state must _always_ reflect the
>>> actual pin state before switching to it to avoid glitches and avoid
>>> inadvertently changing the I2C controller state.
>>
>> Unfortunately, it only helps to avoid glitches on the external lines. At least,
>> in the current case the controller hungs no matter which value combination is
>> being set on the GPIO pins before switching to GPIO state.
> 
> Note that my original i2c-pxa recovery implementation was proven
> functional on the uDPU, both by myself and Telus.
> 

No doubt, and that is why we want to restore the original behaviour.

I just wanted to indicate, that the approach used during recovery, does not help
to avoid the current hung.

In other words, the i2c_gpio_init_generic_recovery() simply does this:

        pinctrl_select_state(bri->pinctrl, bri->pins_gpio);

But even if we replace that with the following code (copied from
i2c_pxa_prepare_recovery()) ...

        u32 ibmr = readl(_IBMR(i2c));

        /*
         * Program the GPIOs to reflect the current I2C bus state while
         * we transition to recovery; this avoids glitching the bus.
         */
        gpiod_set_value(i2c->recovery.scl_gpiod, ibmr & IBMR_SCLS);
        gpiod_set_value(i2c->recovery.sda_gpiod, ibmr & IBMR_SDAS);

        WARN_ON(pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_recovery));

... the controller still hangs once the pinctrl state is changed.



