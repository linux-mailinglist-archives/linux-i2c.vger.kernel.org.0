Return-Path: <linux-i2c+bounces-12314-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FFDB293B0
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Aug 2025 16:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AD62480E6C
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Aug 2025 14:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B6A1C5F37;
	Sun, 17 Aug 2025 14:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKVVq5XU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1481114;
	Sun, 17 Aug 2025 14:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755442767; cv=none; b=CcjywiLVunE7htGF3f0dmJNR9H3ws2ISZECtIMDzc2Yy+rxbaPl/wAB3c6Q+cdmeXlnIcMRa6mJgqpA7cRdgAS0X8/mT3q5jTW9AuD2M4EQTeHDXmD0VNHj1LCaa+6Eh3u5hEHyb4/gJOO3snh0PwqMEbc4uibmBqZzckXKVqzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755442767; c=relaxed/simple;
	bh=3gXA8nz4upgA+Xu01B9HmmTYBdWY32y52K7IPWdmH7U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MvpgyNVimACSW77vS5uAnaUhDMtXMRfzWkCT0B74wUmW8awgtS+Wx4bbr67KloUHEVoLqNYap++dijxg76vT/c+Ykx2YY7gTq3M4OHAl2eW/wk+TYhLye3AEyRNFMYaHl71zcHJbkLND31oMJaDZSMMOR3S+E5qdAiTrAammvR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKVVq5XU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b0c8867so25749345e9.3;
        Sun, 17 Aug 2025 07:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755442764; x=1756047564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/dEYir/2XuerYR/zFtfA1ekaCfjn07xS7trKmwd+Ix4=;
        b=lKVVq5XU77AA2DVapPqwhhq0wPHBJrzXgv8GGQpaKZ/vj5Cb7zGlnd+XKjvtMKMuK5
         QFT427+YDaFVvIdwR4zpc1sATF36lsh20m5zZ6kzG9J684WII7G1pw38cdP6pW2RtlOV
         Cst05PsVdWSQGIU3gp5rWYjPci0x1Mn30m1rMhNDJ2Ol5A/ZUTO225kGirtJF/OnEuzh
         w5eoyPZdIKUGIj51iglV0Q5zwJLJg23sfXe4lLXo/guMHyonlA796oQ6Sw3rw29ZzYOU
         DrVLin2wSjwoLslUWs9kEfZomnI6nZcouCIeMtMHlH28Gs0FP8uwNzJULFhNrRF01BST
         1QfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755442764; x=1756047564;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dEYir/2XuerYR/zFtfA1ekaCfjn07xS7trKmwd+Ix4=;
        b=chKNVtbwf9HtDA/49hGpDSOy/Qv3hca3OlblS9Nw/Bn6NM+oDdc8HPVJIWL5YK63zw
         pQlnOXX0ScQmKP5vja7tboDccCb2VJYkm2w8MqP7JIA1tTPVNxlLMet5T+AzQ89xejKU
         +x4nA/b3AyIzJubtqwBLr8nmzMFAUw1VftusEQBA6s/YPtogWeSQw7+Mmvbu0EXwukaz
         lEqrVlhBi8ciwFj04igGPRoBtxdFk8Z+Kzko7/IBoppIidXsfIbJ1sXPvtY1XBlkK7p4
         F9ExXjo+YYxxs2+45872hLsJeV1fl2CBdxWAbnif+uBN73gs/L4DntHzfJz7K9Zi85eD
         JsIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7gzhdG9nF2jV1PgSbyxdqvVocoxJT7wKzr26pt8ImraAgDDcE0fPpanJCH+K0a0KRNyhJhFYkqUuMSO+h@vger.kernel.org, AJvYcCVT0zARThpil/bLBeHyDH2FWA0nJVbKr71Ih9lXKx18vo6/7wXBW+lWfbEati/Rf/RcXDtfIdvy@vger.kernel.org, AJvYcCXDm5uYcejUs3P0PDwCYp0EcGJVnFPriHbSZsO7z7dfSg78vASJMq08p8DwLGf0BVUxCRD0TfkCCQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+UIE1fB+6BeZzBx/WA8kXCpjW6VGXyL81kXTCiSE9tRmEIIxG
	u/HietRh+2cpmQtfuDWR62Td5HgXs0nrf0tvtnL8JCzA99jkxKjWjs/h
X-Gm-Gg: ASbGncsBfswy0LmWjI37GnpIkERf9tkW//PjScu5KJbRUmBZRg0b+aMOBaGbxL7fwqB
	bW72ZwKQr5xzkCbI3rjokVMDtQq20x4zSlkAm+IqDCs5KEze5+uIXdEnIiY4E6xBwSObFaojU7M
	jR9FJah2N4eyDvFO4uct0lkvhvqLO1aJ/x3eZCxOedfXrICkUC0xGr6sYzt36g0NkEWbFNYUEqY
	+vFx7gzZdsspVrT2pnRvAMz0CsScbIrcTZNzw/AWJgsnCZNsPdX/iXZvvozGIvD+ggqiG0Xky4B
	zhj6c8wOME2Lnh2tqSsTFNerhgBCtbrTGcEvzbNejT+aymxZ44JgHCE4NxTfgUSXOb8BAXt75Wi
	ow26U/b59qNQGvqGDR1eq3aMtL0GxktLxq6/IAY6O/+oyILnBcoeDekXpR2+kgUcTYpRUxqjiPg
	==
X-Google-Smtp-Source: AGHT+IE8VMEyAyKM1RYCnl/iUCoCK2kvUjYv8GNQ/YgCG5kPP/YXGV/SAOA23GQyvuL0j8cyPJRDOw==
X-Received: by 2002:a05:600c:c16e:b0:458:bf9c:274f with SMTP id 5b1f17b1804b1-45a29740947mr24555155e9.29.1755442763572;
        Sun, 17 Aug 2025 07:59:23 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6d89b9sm140585425e9.12.2025.08.17.07.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 07:59:23 -0700 (PDT)
Message-ID: <1261d3ed-e057-45b1-913e-f8bf1cd5d7bc@gmail.com>
Date: Sun, 17 Aug 2025 16:59:22 +0200
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
Content-Language: hu
In-Reply-To: <aJyvHnLS-A3F2gN7@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2025. 08. 13. 17:28 keltezéssel, Russell King (Oracle) írta:
> On Wed, Aug 13, 2025 at 05:17:28PM +0200, Gabor Juhos wrote:
>> 2025. 08. 13. 15:10 keltezéssel, Andy Shevchenko írta:
>>> On Wed, Aug 13, 2025 at 12:36:45PM +0200, Gabor Juhos wrote:
>>>> 2025. 08. 11. 22:26 keltezéssel, Andy Shevchenko írta:
>>>>> On Mon, Aug 11, 2025 at 09:49:56PM +0200, Gabor Juhos wrote:
>>>
>>> ...
>>>
>>>>> TBH this sounds to me like trying to hack the solution and as you pointed out
>>>>> the problem is in pinctrl state changes. I think it may affect not only I2C case.
>>>>
>>>> It is not an error in the pinctrl code. I have checked and even fixed a few bugs
>>>> in that.
>>>>
>>>>> And I didn't get how recovery code affects the initialisation (enumeration).
>>>>
>>>> Without the fix, it is not possible to initiate a transaction on the bus, which
>>>> in turn prevents enumeration.
>>>
>>> But why? As you said below the first pin control state is changed during the
>>> probe, which is fine, and the culprit one happens on the recovery.
>>
>> Erm, no. Both happens during probe, before the I2C core tries to enumerate the
>> devices on the bus.
>>
>>> Why is recovery involved in probe? This is quite confusing...
>> Let me try to explain it differently. Here is the simplified call chain:
>>
>>   i2c_pxa_probe()
>>      ...
>>      i2c_pxa_init_recovery()
>>         pinctrl_select_state()                  <- selects GPIO state
>>         pinctrl_select_state()                  <- selects default (I2C) state
>>      ...
>>      i2c_add_numbered_adapter()
>>          i2c_register_adapter()
>>              ...
>>              i2c_init_recovery()
>>                  i2c_gpio_init_recovery()
>>                      i2c_gpio_init_generic_recovery()
>>                          pinctrl_select_state() <- selects GPIO state***
>>                          ...
>>                          pinctrl_select_state() <- selects default (I2C) state
>>              ...
>>              bus_for_each_drv()
>>                  __process_new_adapter()
>>                      i2c_do_add_adapter()
>>                          i2c_detect()           <- enumerates the devices
>>
>> The culprit is the first pinctrl_select_state() call in
>> i2c_gpio_init_generic_recovery() marked with '***'.
>>
>> That call causes the controller to go stuck, which makes it impossible to
>> transfer anything on the bus.
> 
> Probably because when GPIO state is selected, the I2C bus pins end up
> being set low, which the I2C controller sees, so it thinks there's
> another device communicating on the bus.

Yes, it seems so.

When GPIO state is selected, the bits in the Bus Monitor register which are
continuously reflecting the value of the SCL and SDA pins contains zeros.

Additionally, the Status register indicates an 'Early Bus Busy' condition, which
means that 'The SCL or SDA line is low, without a Start condition'.


> I could be wrong, as I don't have the hardware to hand to research
> the issue again.
> 
> I have a vague memory that the GPIO state must _always_ reflect the
> actual pin state before switching to it to avoid glitches and avoid
> inadvertently changing the I2C controller state.

Unfortunately, it only helps to avoid glitches on the external lines. At least,
in the current case the controller hungs no matter which value combination is
being set on the GPIO pins before switching to GPIO state.


Regards,
Gabor




