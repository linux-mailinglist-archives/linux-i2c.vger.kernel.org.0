Return-Path: <linux-i2c+bounces-4747-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC78929B7F
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 07:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 411FA1F215B3
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 05:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D99B101E2;
	Mon,  8 Jul 2024 05:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bMfYhjyH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26FF8488
	for <linux-i2c@vger.kernel.org>; Mon,  8 Jul 2024 05:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720415966; cv=none; b=uRnXxBkk6SITNcr3fbevYx6FVMF93tRpDnrBLxliKgyT79awT7oLZAV7cpEsZ9vegZdB0ljor9MORYQxK3b6c/aNKAOogpSOLnRdOOMVuaiKEBShJUXbHgPjBAZE7Wz/MytOOVEv9+U3lBqC+Gsqnyon4ZBsSNakrEjOd+NP7Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720415966; c=relaxed/simple;
	bh=obAmZQjKYTR4UL87PjfxdDYKt/Cd4nommN23G2lJ6Zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mOpoV2LF6QbnccObg3LPjm9W+hYzWXm8BPkKrgph0eG+DcLheIcpj73VEvgsvzl6eoRl2g026mytakOb2NRMxJurIjR+DQDWQ2BrvJX7nNLzzAb2sVX/+1qGJUbz3kFqC0c3g4jVV2Vww41kJcHMm0/0hSudscMCgyWdLVHh3A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bMfYhjyH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-426602e8050so9568295e9.2
        for <linux-i2c@vger.kernel.org>; Sun, 07 Jul 2024 22:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720415962; x=1721020762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=st0ZPkxd5F2MKlXcA3s5v8aNC1YTG+RQErMhWa4hH14=;
        b=bMfYhjyHrOpHJTemmUiHIfnwoSuq4Lb1JBn35+xc6WPW52xUTfafC5Noq5GqnWCFjs
         K1bb5eBNnFyfQffnS93vuI0/Zb53uVen+6MsIjBldxvmTq8YRQuqb2Fi9LZx8vC9rCGc
         oP6xGNVz+1MZ2Eu4CIFF9J+Ug0pQ9SHAL1r0C16cFdwzuBN5VGp7niiKpc/a6aSOYzRU
         vcsCAUh3I/3KatWqRTJ5TQlHLZpSE/6ZZGe6A4qQODm2wKMSf/i97S7jRuCXphnalje7
         e0zfyGLTDRfBfh7NMUTeSZ62k+5sRrLOHUe4c7x+wRJ1nRnnzuhi4fjZsSPmj7TjdtHM
         aYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720415962; x=1721020762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=st0ZPkxd5F2MKlXcA3s5v8aNC1YTG+RQErMhWa4hH14=;
        b=Erw7La0GsMtRnxtzWnaRHnLmvAlauOdIo17eOhY0697YIVYLpKf52O/CAaGJJq1N8l
         r7C953CTn1gzvl8UvclRIESYpkvD3mqX9MiT5jHBpUNBgPTNzovB5AaPE0yytveDwD48
         7GnuKN30v1KQj1loX/W7MMu/w+8tWiocCMOe5O2PV/+jEtdwu6ML7+iel63f/T31+P2q
         E1ObIkhgDnYQr19qQBiK8NfmaQ2+ss0SfBwS9P3QYYI+PFLBURTKZR+Qvz+J/6yhdKde
         KGbyTDa3NiPp4fXhaUEF7i0jZlv/ObP4xRnBD+w7v10+txuvzuVNDoYTEvgjLJ6I/Ueo
         pygw==
X-Forwarded-Encrypted: i=1; AJvYcCXt2rU/LqlnfpArO18CD/GHF64OfU6UtK/fsnpwkl0pdtqdVKkEaHQpaRuqn0h8ZntM/GQJSlwJx0FMQeyWl6X/E79R1ZW3YnTy
X-Gm-Message-State: AOJu0YzsZVT7XzCzSFD9LD8TfdMqcy+7qn1pel4phOPAGpm+iEdPxr46
	ciDvdk59mriRweXiSIDbshAVuHzA+XfilBayLJEtrkzNGdQaGPkr3nGGtltE3iw=
X-Google-Smtp-Source: AGHT+IETsBIsaljp9EWGAGT81NQ2T8WGDGmhewcJPHsOXa8m0v7dKcV/UUR92Qj8s3oEWCOzEEaNvQ==
X-Received: by 2002:a05:600c:4289:b0:426:627e:37a7 with SMTP id 5b1f17b1804b1-426627e3bf2mr27955515e9.8.1720415962157;
        Sun, 07 Jul 2024 22:19:22 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266a38f5a5sm21441355e9.43.2024.07.07.22.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jul 2024 22:19:21 -0700 (PDT)
Message-ID: <dc232ee9-b28d-486f-a878-0320be84d1b9@tuxon.dev>
Date: Mon, 8 Jul 2024 08:19:18 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: chris.brandt@renesas.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com,
 linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-5-claudiu.beznea.uj@bp.renesas.com>
 <2wm6vd4dib7tqpdq2eusjhyvfl3sofyvy65w6axvdjbkmgm5cn@bjltpbwwilc2>
 <CAMuHMdV=Uhqar6k_z_wo5jzge_7oY4tBK5zNiBbpsWa39Wvabw@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdV=Uhqar6k_z_wo5jzge_7oY4tBK5zNiBbpsWa39Wvabw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 05.07.2024 10:19, Geert Uytterhoeven wrote:
> Hi Andi,
> 
> On Fri, Jul 5, 2024 at 12:42 AM Andi Shyti <andi.shyti@kernel.org> wrote:
>>> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
>>> index 83e4d5e14ab6..002b11b020fa 100644
>>> --- a/drivers/i2c/busses/i2c-riic.c
>>> +++ b/drivers/i2c/busses/i2c-riic.c
>>> @@ -113,6 +113,8 @@ struct riic_irq_desc {
>>>       char *name;
>>>  };
>>>
>>> +static const char * const riic_rpm_err_msg = "Failed to runtime resume";
>>
>> Please, don't do this. Much clearer to write the message
>> explicitly.
> 
> And the compiler will merge all identical strings, emitting
> just a single string.
> 
>>
>>> +
>>>  static inline void riic_writeb(struct riic_dev *riic, u8 val, u8 offset)
>>>  {
>>>       writeb(val, riic->base + riic->info->regs[offset]);
>>> @@ -133,10 +135,14 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>>>       struct riic_dev *riic = i2c_get_adapdata(adap);
>>>       struct device *dev = adap->dev.parent;
>>>       unsigned long time_left;
>>> -     int i;
>>> +     int i, ret;
>>>       u8 start_bit;
>>>
>>> -     pm_runtime_get_sync(dev);
>>> +     ret = pm_runtime_resume_and_get(dev);
>>
>> In principle I like the error message to be always checked and I
> 
> s/message/condition/?
> 
>> will always approve it. Whenever there is a return value, even
>> when we are sure it's always '0', it needs to be checked.
>>
>> I had lots of discussions in the past about this topic but I
>> haven't always found support. I'd love to have the ack from a
>> renesas maintainer here.
> 
> I don't mind checking for the error here.
> 
>>
>>> +     if (ret) {
>>> +             dev_err(dev, riic_rpm_err_msg);
> 
> Do you need to print these error messages?

No. I have it here as a result of some internal reviews.

Thank you,
Claudiu Beznea

> AFAIU, this cannot happen anyway.
> Ultimately, I expect the device driver that requested the transfer to
> handle failures, and print a message when needed.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

