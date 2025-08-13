Return-Path: <linux-i2c+bounces-12271-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B30B24D39
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 17:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B6C717C77E
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 15:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1934E201006;
	Wed, 13 Aug 2025 15:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cw5QK7pP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896821FDE09;
	Wed, 13 Aug 2025 15:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755098253; cv=none; b=Nl//jBsxOOEgSfuW6CniWN2maedOU6blF2rc6fG/Mts3jxQbc2P5gzcOVsD5NbdZTIsXDacPUmoa9jexSzxPCDnhLwFoz9LDRMB0tRfO15dWyy9/JCB7PO7hbCo1UrQbdt90JXt/4LbGInQm0tZkVpj+6WGiR14AefPgbqbR0LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755098253; c=relaxed/simple;
	bh=Q+mjl9s6d8i+VV8csuaRx+iX/KWEPZmIvaZMQSBL71U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ro+68vlKkaJm9aG7zr1dI90LtRO1RrPQ0tQpna9m3fBg4Y7dWsZrBMe4Vrw3oxu8etQfNlT1hpWDFn/71/Cco/Q8m7RXA78xOd7xGVDGVSklBnfToakgjEzwdIf/Jck94/SH0WWHuu1SVAk3SmTuKigDLuur+LYTj4k/Ye1xOto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cw5QK7pP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-459e1338565so62699075e9.2;
        Wed, 13 Aug 2025 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755098249; x=1755703049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7NgH/qwxoTNWkh0Im/sLiD/T4hQEX/261YmLQy0amXU=;
        b=Cw5QK7pPSHTC9ctOwB0mU35WFDb6g05UovEqLNPRk74bLGj37DVVrmS3K+b2u+idfY
         sMnSnc87VVAtJd5gXXKhtFCtFOwQGQsQpKAY03LYiY5SV1q7J5lxvSB/hY2K7ZU5eoGq
         tw5BXQVgT3sEkvPul62sMB5TTDrn+f78F0dWwCkpE3q+0QJz2Hlz4teY0T8neTxbptXQ
         EkcFNoZpUBewMJxn4ypxCrLAwanvrS9Q7QivIGYA2LJU4ZnsTWXStCPPCvsw871zyMWz
         ICgMhsqKh2mLT6J9YL+OKo73LYbWLDohqUDg2rZxcheYNlqjnr+n3788soG+yZCJxAi6
         1a/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755098249; x=1755703049;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7NgH/qwxoTNWkh0Im/sLiD/T4hQEX/261YmLQy0amXU=;
        b=XlQwGIs4P/VDcWUCqHPFDSfPO5b1pvkpa+e6d9czPMxCImGE1R6MmUZjgmY0s/1CIW
         KC5WN8EwIaP21eWog0g1ovQxwKXLa3g1pTAFP54amfwz3gYpO3Zv3j8aNB3NfR+MEZga
         /2xl8eIMrtrECXruINg62oBH3tyPi4SJMm1VJzwZKlU37hNSZ6wgiyg5Tcv+l6ozQsDn
         tjMW4GcntL2/6FXMfXprV+ByKrARgbuGHmzNhZgKNitMne+JsNiTjBynMqo42uYkaxXn
         MmlvUxHO1q3+GBnUbi/8Hui82NGEMzHFmop1ZbqMvpyFtrEL1b0VwVi4wJhZ5ePYlrEj
         FCJg==
X-Forwarded-Encrypted: i=1; AJvYcCW1gDJmlcJIpOYji9Ujc9DmNeJkwdSlL1ctlJ09pXxUW/tV/uB63zmjwSyMD8upQ28aAaiHMz9qpv6eBMcN@vger.kernel.org, AJvYcCWFM9CtKBvJN/X6Lz7SnfqHhXq+G95q6v6Rushy/GYHLujkg0m5RFm/JyVp9W5uB4B2FsiZHLuK@vger.kernel.org, AJvYcCWIX6fvphdRUEbqAJ1XsVuyPDT+b0/ZW7DsJfJHu/rCLMpk6i8WqL/ozb41jcXeeiiFzloIn23hqhE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZwmhRmMmehaMZ24XPOazHxzFat23x7p/1OPZJ0V+SPuhY7nEd
	zbG1PHAN9umx4NXl5Uf4ki/+eL1pOhrMVEQVLTRIwLceIipdE/l0DAQqbb0mHw==
X-Gm-Gg: ASbGncsFzhIToXKtTqA0hYGH3UXNgrVZ+8lHoRFzKFvk8GRDTabYSLJyryvnGluaCmD
	CNbB139Pn8I/WRcop/Ng5Ut7gMMwDjHFpQmiV3e6JxECgabP8UcI+RydAjZHCxdtJcscadJ9ZyS
	GBo/7GeRFIH2JEaeVyVmWvmG6qBph8kRE3EEn20Dmpc8DsP1+PQEJSiNSdcZ0AvWUe0ca6Qi9l8
	hJHxs5OweoGG132OfPtm8AMNJZZCi8YnZ+fSeDHJ5preNxSCuPjLA9Wj7i1wzyUZaapb9Es6LEG
	3tvjII6bwhxzDYYKeUBgxFBLFoxp4h004zXOVsfD/wiR40bFKWCsUyRR3eP0ShWqMExoutxv8hF
	jOe8xkyMHgJ7Xf7cGmf36LxRVAM82/mYNVBu1ARHnTCBH+1zf1D5mOK7GT0rQhOs=
X-Google-Smtp-Source: AGHT+IEU9KRhWGBF5usbRwgZ04Gy+x5ZxR0mwGBb2OxGZWNW1+E4gzMZFQnZut4o6iu6J3gcMERIlw==
X-Received: by 2002:a05:600c:1c0c:b0:456:dc0:7d4e with SMTP id 5b1f17b1804b1-45a1a822aeamr5298495e9.18.1755098248485;
        Wed, 13 Aug 2025 08:17:28 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a50a42asm6062785e9.1.2025.08.13.08.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 08:17:27 -0700 (PDT)
Message-ID: <0bfcb570-dab3-4038-a1aa-8bc7fe2feee8@gmail.com>
Date: Wed, 13 Aug 2025 17:17:28 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] i2c: pxa: prevent calling of the generic recovery
 init code
Content-Language: hu
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Russell King
 <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Hanna Hawa <hhhawa@amazon.com>, Robert Marko <robert.marko@sartura.hr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-2-ca42ea818dc9@gmail.com>
 <aJpR96Kkj12BwW-M@smile.fi.intel.com>
 <8cb62eb9-9137-44b4-86f6-82f69813e83f@gmail.com>
 <aJyOu_GUlDPuJXO5@smile.fi.intel.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <aJyOu_GUlDPuJXO5@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2025. 08. 13. 15:10 keltezéssel, Andy Shevchenko írta:
> On Wed, Aug 13, 2025 at 12:36:45PM +0200, Gabor Juhos wrote:
>> 2025. 08. 11. 22:26 keltezéssel, Andy Shevchenko írta:
>>> On Mon, Aug 11, 2025 at 09:49:56PM +0200, Gabor Juhos wrote:
> 
> ...
> 
>>> TBH this sounds to me like trying to hack the solution and as you pointed out
>>> the problem is in pinctrl state changes. I think it may affect not only I2C case.
>>
>> It is not an error in the pinctrl code. I have checked and even fixed a few bugs
>> in that.
>>
>>> And I didn't get how recovery code affects the initialisation (enumeration).
>>
>> Without the fix, it is not possible to initiate a transaction on the bus, which
>> in turn prevents enumeration.
> 
> But why? As you said below the first pin control state is changed during the
> probe, which is fine, and the culprit one happens on the recovery.

Erm, no. Both happens during probe, before the I2C core tries to enumerate the
devices on the bus.

> Why is recovery involved in probe? This is quite confusing...
Let me try to explain it differently. Here is the simplified call chain:

  i2c_pxa_probe()
     ...
     i2c_pxa_init_recovery()
        pinctrl_select_state()                  <- selects GPIO state
        pinctrl_select_state()                  <- selects default (I2C) state
     ...
     i2c_add_numbered_adapter()
         i2c_register_adapter()
             ...
             i2c_init_recovery()
                 i2c_gpio_init_recovery()
                     i2c_gpio_init_generic_recovery()
                         pinctrl_select_state() <- selects GPIO state***
                         ...
                         pinctrl_select_state() <- selects default (I2C) state
             ...
             bus_for_each_drv()
                 __process_new_adapter()
                     i2c_do_add_adapter()
                         i2c_detect()           <- enumerates the devices

The culprit is the first pinctrl_select_state() call in
i2c_gpio_init_generic_recovery() marked with '***'.

That call causes the controller to go stuck, which makes it impossible to
transfer anything on the bus.

> 
>>> Do we set pin control state back and forth during probe? May be this is a root cause?
>>
>> Yes, basically. The state gets changed back and forth twice. Once in driver
>> probe before the controller gets initialized, then once again in
>> i2c_gpio_init_generic_recovery(). The problem is caused by the second state
>> change as it runs after the controller gets enabled which confuses the hardware.
> 
> ...
> 
>>>>  static int i2c_pxa_init_recovery(struct pxa_i2c *i2c)
>>>>  {
>>>>  	struct i2c_bus_recovery_info *bri = &i2c->recovery;
>>>
>>>>  		return 0;
>>>>  	}
>>>>  
>>>> +	bri->init_recovery = i2c_pxa_init_recovery_cb;
>>>
>>> This is unfortunate. I would keep the naming schema consistent, i.e. rename
>>> existing function and use its original name for the new callback.
>>
>> I agree, but since the change is targeted also to stable kernels, I wanted to
>> keep the change as minimal as possible.
> 
> Renaming is not a big deal AFAICS, but leaving this _cb will be confusing in a
> long term. I prefer name to be changed.

Ok, will change the name.

Regards,
Gabor

