Return-Path: <linux-i2c+bounces-9701-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E53D5A4CD63
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 22:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8050D1898408
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 21:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9261EE021;
	Mon,  3 Mar 2025 21:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="Rlx6fcOX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092411E22FA
	for <linux-i2c@vger.kernel.org>; Mon,  3 Mar 2025 21:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741036703; cv=none; b=Qexq3Kch3ZPB1Ww0bNWmyHmVJHsx4mNRGv3rzwjpUJIhI4kI9FhtOapi8xKFJjW3e/vZhbFrmb3AoTY8ioLDXMWLkgh9xrVUDosZ/7mniBRFgFhBp4fbI26E74Q4sl1G4XzhId+a2wqOXXhr0MZkTq1e8q3Y+bOOucp6YhR0Tyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741036703; c=relaxed/simple;
	bh=mhsZCkAXteIkUNGXUUyXT7ka61rByaO+aLOVUHg77nE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rKsFT78gWP0zKWQmCeBFp5yjI/v+XOoeXAis7dpja84gl3vEaMVq0esQaiwSz3cD7FKcWh2ikcOjmd22VzcNJOrmelKGj1S9N+SMggW3nLRizAodx8SWtM7R6z/m7DH1lYbsXaLoDRf7edDFT8b4T92XPPvLpd/geaqq1ciqY/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=Rlx6fcOX; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5febd389342so1025032eaf.1
        for <linux-i2c@vger.kernel.org>; Mon, 03 Mar 2025 13:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1741036700; x=1741641500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o7o0ZnZGkhKLAl8r9EcaDkNi1fNStdM81lHiXwCtjRk=;
        b=Rlx6fcOXtxO3lTF3UiSPVCukjxoHd3xaJBq7+sRphf5NzNX0yPV8XFY4j9DuT13GL0
         o60XWJpuKiAcqYdumKuut1K8ZzQNoTiNfXcveTDrWuBCRYhFPe8zHESQZF2LFfU7TbjW
         Py9wIqCVPeFPqlHeDg1DpzULHnQeBS5cT1BGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741036700; x=1741641500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7o0ZnZGkhKLAl8r9EcaDkNi1fNStdM81lHiXwCtjRk=;
        b=DVdT9Z1TR7LsMM6cseanJXEfwgH28KRKw4Oh+4fDQaa7sOQbgY1t4wRRn8ZRinaSs6
         qtrReT4/Gtn7UiOVDHcff7+xJ0zBNA0SG/NCI9Zblx34WL2isBQBL+tQqeKUpAiKCo9+
         WPljkhlcyw7GP81TICeDpAsP/iYWswJr65fcIANvCc+7yomXyRKH3zvzkOTN3k8nxJCn
         T04+mj/8OhBKCzOmcveeya1+9SGCxcdaHY6gSU29i6Ret0DEPfvbShk/8z0eXtEN4zfj
         dxUt2Rc4c8Jtxan2Y+lSIkEKSBSgoN1v4Y0Mj9KR6P0RESmsQDTJGW5WNrH5ZJk0cuK4
         OEXA==
X-Forwarded-Encrypted: i=1; AJvYcCUy8+0D+LD3b+77R4em71wOABXpWFOj/OZGMlBGQvGEHTDXcRQYMok6GVNPAAraxzJqR7YKgOovgxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHdyBTZKqb8Il5FdaiWNfC/UUE9eVr6RR5HrEXMSZOpufwN68K
	yzv8KnvhQcLduWZGGcZoIse1FFjfr5sNOVNnhizsAfQvKrNVn/Bk7NZpLiL4HQ==
X-Gm-Gg: ASbGncv+VNUHuR/sHzZ663S5AojiE0pxJgRThn22abrqXnoT7A5JvQGfMYrRDecWaBK
	T4DcgancP1/qa3555F8aDTX7VQaEI31EUZSe06jik1WhaGv1KmAZTd9SI/XsT3ascE74AHI1igQ
	MYhpUN2ZR2rjZZmjS3lVswjaahYscJay+upOwSmVmmI2MIEsEFF3UIfxRm6JOOj1zwlmUzRIhq7
	fN2vVA06OnzGDLP0QlRjs3NIJ6hnEXPa9EuDa183f3VL804fIiNpp74BTxTlRSvWDJGy0fphmzs
	hNuQJs9iA0CYLstW8k815FNJFZIvkwwVNrl34DURe7Ly1bhbp+jAwY/McxeOxytTPRvyfVoeDDI
	Pwk4=
X-Google-Smtp-Source: AGHT+IHaXIw8Q1xBCYMju5mE7+8jQ/Lhtut+dcRq9zrVtLwEHWofWNCYKTsNd7ID5kPbX0tl1xXraw==
X-Received: by 2002:a05:6820:8c6:b0:600:248a:436b with SMTP id 006d021491bc7-600248a44d8mr720221eaf.7.1741036699897;
        Mon, 03 Mar 2025 13:18:19 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-600252e8091sm58591eaf.40.2025.03.03.13.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 13:18:18 -0800 (PST)
Message-ID: <92f1cc50-53bb-44f4-b339-a1abd5fdd37a@ieee.org>
Date: Mon, 3 Mar 2025 15:18:16 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Troy Mitchell <troymitchell988@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com>
 <20241125-k1-i2c-master-v4-2-0f3d5886336b@gmail.com>
 <4658f274-5df6-4055-82db-118217f28447@ieee.org>
 <8ccec6ba-4897-424e-8ff1-cfc663dfa2b5@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <8ccec6ba-4897-424e-8ff1-cfc663dfa2b5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/13/25 5:38 AM, Troy Mitchell wrote:
> Hi! Alex.
> Thanks for ur detailed review.

Troy, I see you've sent a new version, and I'm going to
provide a review for it today.  But I somehow missed
this message, and it looks like I should have responded.

I know it's late, but I'm doing that now anyway.

> On 2025/2/12 05:39, Alex Elder wrote:
>> On 11/25/24 12:49 AM, Troy Mitchell wrote:
>>> From: Troy Mitchell <troymitchell988@gmail.com>
>>>
>>> This patch introduces basic I2C support for the SpacemiT K1 SoC,
>>> utilizing interrupts for transfers.
>>>
>>> The driver has been tested using i2c-tools on a Bananapi-F3 board,
>>> and basic I2C read/write operations have been confirmed to work.
>>>
>>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>

. . .

>> The descriptions below are also good.  Maybe be consistent
>> with your capitalization in comments?  (Though I suppose
>> the capitalization above is to explain the name of the
>> register.)
>>
> Yes. The above is to explain the full name.
> So I still need to keep them consistent?

You'll never get everything consistent, and even getting
two people to agree on what things should be consistent
might be difficult.

I think what you have is OK, but I might (for example)
capitalize every comment (or *not* capitalize).

Not a big deal.

>>> +#define CR_START        BIT(0)        /* start bit */
>>> +#define CR_STOP         BIT(1)        /* stop bit */

. . .

>> For the *IE symbols that follow, why not use *_IE as the spec
>> does?
> The symbols follow the datasheet of SpacemiT.
> Even if the data sheet doesn't have IE, should I add it myself?

I think it's good to use naming that matches what the hardware
specifications say.  That said, it doesn't always work well.
I worked on a driver where most of the hardware names were
30 or more characters wide.  That leads to unreadable code.

I would *much* rather have code readability than have the
symbol names match the hardware spec.  So I personally
focus on that, and just try to ensure it's easy to map
the name in the code back to what it represents in the
hardware.

>>> +#define CR_ALDIE        BIT(18)        /* enable arbitration interrupt */
>>> +#define CR_DTEIE        BIT(19)        /* enable tx interrupts */
>>> +#define CR_DRFIE        BIT(20)        /* enable rx interrupts */

. . .

>> Is it simply assumed to be already configured that way?  (This
>> driver doesn't set it at initialization time.)  Someday
>> we should set things up explicitly.
> yes. by dts.
> I will handle frequency that is from dts in next version.

In general it is a bad idea to add new features between
versions of a patch series--unless specifically requested
by a reviewer.  Once the series is accepted it should be easy
to add features later.

>> The only place the next symbol is used is in computing a
>> custom timeout period before initiating a transfer.
> Yes, but I wanna explain the freq number is fast mode.
> So I define it here.
> But don't worry, I will drop it in next version and accept freq from dts.

. . .

>> The next function only resets the bus if it's not idle (where
>> "idle" means both SCL and SDA are high).  Based on the name
>> of the function, I'd expect it to always reset.  In other
>> words, I'd rather this be named something slightly different,
>> or have the check of SDA and SCL be done in the caller(s).
> How about `spacemit_i2c_conditional_reset`?

That name is fine, though I think I'll be commenting on it
in my review shortly.

> Because I am worried that in the future, when the fifo or other reset is called,
> SDA and SCL will always be checked.

If you add a feature in the future that makes the current code not
make sense, you can change the code *then* to be more suitable.
Don't get too far ahead of yourself.

Write code that does the job, and is readable and simple.

>>> +static void spacemit_i2c_bus_reset(struct spacemit_i2c_dev *i2c)
>>> +{
>>> +    u32 status;
>>> +
>>> +    /* if bus is locked, reset unit. 0: locked */
>>> +    status = readl(i2c->base + IBMR);
>>> +    if ((status & BMR_SDA) && (status & BMR_SCL))
>>> +        return;
>>> +
>>> +    spacemit_i2c_reset(i2c);
>>> +    usleep_range(10, 20);
>>> +
>>> +    /* check scl status again */
>>> +    status = readl(i2c->base + IBMR);
>>> +    if (!(status & BMR_SCL))
>>> +        dev_warn_ratelimited(i2c->dev, "unit reset failed\n");
>>> +}
>>> +
>>> +static int spacemit_i2c_recover_bus_busy(struct spacemit_i2c_dev *i2c)
>>> +{
>>> +    int ret = 0;
>>> +    u32 val;
>>> +
>>
>> I think the next 4 lines can be deleted.  The readl_poll_timeout()
>> immediately does what they do, without delay.
> The register value is always returned directly。
> but it needs to be judged if the bus is busy by !(val & (SR_UB | SR_IBB).

I might be wrong, but my point was that the readl_poll_timeout()
call does exactly what you're doing here.  So you could simply
do the readl_poll_timeout() without doing this readl() call first.

>>
>>> +    val = readl(i2c->base + ISR);
>>> +    if (likely(!(val & (SR_UB | SR_IBB))))
>>> +        return 0;
>>> +
>>> +    ret = readl_poll_timeout(i2c->base + ISR, val, !(val & (SR_UB | SR_IBB)),
>>> +                 1500, I2C_BUS_RECOVER_TIMEOUT);
>>> +    if (unlikely(ret)) {
>>> +        spacemit_i2c_reset(i2c);
>>
>> If readl_poll_timeout() returns non-zero, it is -ETIMEDOUT.
>> Why change it to -EAGAIN?  (It ultimately gets consumed by
>> spacemit_i2c_xfer(), which handles -ETIMEDOUT and -EAGAIN
>> identically.
> I will drop it.

. . .

>> The following function is used in two places, but I don't think
>> it really adds any value.  Just open-code the writel() call in
>> those two spots.
> I want to explain more clearly what is done in the init phase, so I put them
> into a function and assign values step by step.
> Is it not necessary?
> or maybe I can add `inline`.

No.  People accustomed to reading kernel code know exactly
what a call to writel() does.  When you wrap that in a
function like this, it seems like you might be doing
something more complicated than that--and it's distracting.

It is best to simply use writel() (in this case) and get
rid of this trivial wrapper function.  Rely on well-named
variables to make things clearer, and if you think there's
something more, say so in a comment.

Also, much like the likely() and unlikely() calls, it is
almost never warranted to use an inline function in a C
file.  There are some cases where it serves a purpose,
but in general you can depend on the compiler to do the
inlining if it improves the way the code executes.

>>> +static inline void
>>> +spacemit_i2c_clear_int_status(struct spacemit_i2c_dev *i2c, u32 mask)
>>> +{
>>> +    writel(mask & I2C_INT_STATUS_MASK, i2c->base + ISR);
>>> +}

. . .

That's enough.  I'm going to review your new version now.

					-Alex

