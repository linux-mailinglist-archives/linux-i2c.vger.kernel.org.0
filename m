Return-Path: <linux-i2c+bounces-11759-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD25AF0FDD
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 11:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24234520486
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 09:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39E9245038;
	Wed,  2 Jul 2025 09:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmpID0Xd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F409C2459C7
	for <linux-i2c@vger.kernel.org>; Wed,  2 Jul 2025 09:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448271; cv=none; b=cUNxkI0COraPbmjj3LQB0AW68RjeQUV3LVjYwA9wR0SmtuvuGzrccXnePxlgMUyXb1qJyAJ7zjLSBItC2P2aD3SqC65S+rR9eA1xxOrtGtIYCs8wDqjLhrN5o32PEjN5R8P3lfhGNUod05XLyWbOd/8CIVeNB+ooDvb02RofHD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448271; c=relaxed/simple;
	bh=t1LJl9fgbHM7oihswjiUwXqSmTt05CLXFvrpwrmvbGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XfHGyr5K0PjV853PaA7CleUnkzL4KZ7WXiFh4pxfKH/4XeAH8thhuUyrmGzgs+HNg2FRKSpk02E7MeNf+BqE1Ibzf9fXf970c15lrf9v5EmlR7Dj0Vr0sfetdyeV7cnsOS+pcCwOMFXhrQ00LHfS2PmT4y3jYiAEg1PAv7XDmns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmpID0Xd; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a53359dea5so2345144f8f.0
        for <linux-i2c@vger.kernel.org>; Wed, 02 Jul 2025 02:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751448268; x=1752053068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JHmXA1mcw8iycoDGMjfS/tIO4GDUWGaEmRaA+JJNRSc=;
        b=SmpID0XdQgs4m25TFByHxGG/zz5xwzO5owj/BAuieoDOeWchBSHHtYDxZV2lb9hhCo
         sJq7xQigw+jF+HbBuwo7UKxccNffB3BxX++IBPFKks7t4T8CkvY2g24WftRt+NPQk0us
         vuWGcIbLP7U8ilZ/NsP/Nzrw3muxPYAonT9h50ryC8RdtDUfn6G73NCqkhUZfNojGvvQ
         fyUkf3maZibB/TvX7KdJ+eZ2w72lTElquYnozdaWHRw1QAyNz2ff9z6LR6oJln21Tl4E
         X2yt6s/m6l9gbGaffPrX9eKoTwJz2hMrwTh4Kb4jcOX7BR44dtnth6/+52N8M7S3+7+b
         cQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448268; x=1752053068;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JHmXA1mcw8iycoDGMjfS/tIO4GDUWGaEmRaA+JJNRSc=;
        b=PZB867UEe6g9w+Iupr0fGT6ONQ6yyH8DF16LHe/HObKotAMBSwQccCiSGZHQ1tEPT7
         Phwk004HR2XQjToQp6f2uae/D1QfqrXBI/4UDnjmDAiCkb2HGwMkSd8DyZ6XZa6e03Ha
         hzlNeKlOHZt4b95mCIMRviM2U4oGNUz4+3bmGgYfL+yhUUK32FLJxHz3IrSv0IiwDVSa
         fDT15kAdgG2ZsT8bo+QZrRfR8ULoHuYlEtnk27mNib20et9wlHP95Z+sR/fnf7FRwjd8
         SsvOfqm4uHql8oZ+R5NsgyoNcDTW3H8MCbUHk8gG/pxZslxLA0mzvlo4D0VxJOaFl4L7
         PhPA==
X-Forwarded-Encrypted: i=1; AJvYcCW748LZ7N3s2g3UuPDvc9q3/8KOcdtAvRYpdmieAGpryPK/VTeI/cyXntoFPhbkzwfOOHeEVR6Fiz4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9kLkJg4cNtFb1R+GXx2LlQ6MMzH/Og2qxtMx6OSjY/0LZOcwC
	50RdC9/PKWBgt/4ZUKjplmwVAQTZPDbhaRhpnJF25TMq9FROqva8fQFg
X-Gm-Gg: ASbGncu9Bz/AsW/9Alma2Hod2onbbczr1vZlDyDyCquW4m/yRMwkfq0Xshi0MQo46Yy
	EWBaNR6yhDJTJDk8FmV64gW/UBczmBGsisSkwup+lTw5jQ64wew/eZaWzXDNscOWFCZYUSjxXAf
	UseDERUFEpUOzqS2y1BKuliXwkl84Gah+JG+ZqMCL7U40Vo2JTix460YaYCv+TTUFJr4mbE2ISA
	cwraBYdaUc08BYSDnBTvh8AwWgqScjcve6v9VI71be8K5lrXWmNiLWHtvT3t0Owf8KHiYXUXFcn
	QVJo27XNBeMjT8CCgs/+l+7mUEh+L7f146Ww51uz4q21fs0tqiP1442Omdz1JeFB+5CDREat4I6
	lTde1AO0nHdxVcufZt5bAScBsTwp7ckwcJJE=
X-Google-Smtp-Source: AGHT+IEyo1dTT2H0Vx8koSEXq/8sHfJXdzJW0/ajLg/+Qv/FD87OTXcfCh21/xC9sUUt3pzlE8s6vw==
X-Received: by 2002:a05:6000:200e:b0:3a3:7cbd:39b1 with SMTP id ffacd0b85a97d-3b1ff527396mr1609593f8f.24.1751448267956;
        Wed, 02 Jul 2025 02:24:27 -0700 (PDT)
Received: from [192.168.44.44] (24-10-142-46.pool.kielnet.net. [46.142.10.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a87e947431sm15562877f8f.0.2025.07.02.02.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 02:24:27 -0700 (PDT)
Message-ID: <2873450e-468c-4d63-8cc2-060724227e52@gmail.com>
Date: Wed, 2 Jul 2025 11:24:26 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: i2c: realtek,rtl9301-i2c: extend for
 RTL9310 support
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-i2c@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Markus Stockhausen <markus.stockhausen@gmx.de>
References: <20250701091737.3430-1-jelonek.jonas@gmail.com>
 <20250701091737.3430-4-jelonek.jonas@gmail.com>
 <d123375e-48ec-43f1-bc5a-1256c2f377ec@kernel.org>
 <ad8d7f0b-1c25-4a1b-89db-6631d918f9a1@gmail.com>
 <b3e58bf1-d51b-481c-892c-4115bd106ed9@kernel.org>
 <123042be-63dc-46bf-b781-6da022a8f4c5@gmail.com>
 <8d671dcc-bcc2-4b1d-9063-f7d69d52d29d@kernel.org>
 <3b357cd4-017e-43d9-a662-4f26fb9b8d68@gmail.com>
 <07cd4e2c-0419-4877-9a2a-d66f8dbe4279@kernel.org>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <07cd4e2c-0419-4877-9a2a-d66f8dbe4279@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

(sorry for double sending, previous one had HTML)

Hi Krzysztof,

On 02.07.2025 09:49, Krzysztof Kozlowski wrote:
> If people sent complete bindings, they would see that you are now in
> tricky spot and this maybe has to be redone to standard approach - I2C
> is not a child of syscon block, but separate device. When it is a
> separate device we solve it (plenty of examples) with phandle to syscon
> with offset or value argument.

Was this assumption probably made based on that the I2C peripherals are
controlled via mapped registers within the address space that is
designated to that 'switchcore'/syscon node?

If using a phandle instead solves this, I'd be fine. Moving the I2C
controller out of the syscon shouldn't be an issue. Is changing this
behavior fine with changing the dt-bindings then? IIRC there's a rule
that dt-bindings must not be changed once they are published.

>
> But no! Some incomplete hardware description was sent, stuffing
> everything into syscon and claiming that everything is child of syscon,
> and now you are stuck with this:
>
> system controller
>         |
>         |
>    i2c-controller-for-multiple-SDA
>            |
>            |
>        i2c-controllers-for-each-SDA
>
> This is not only just confusing but maybe even not correct.

At least I'm confused already.

To make sure we're talking about the same hardware architecture:
RTL93xx have two I2C controllers each having a hardwired SCL and being
able to use any of the 8/12 SDA lines.

As far as I understood, the 'i2c-controller-for-each-SDA' you
mention is meant to handle the muxing behavior (being able to use each
SDA on either controller). Being more like a channel than a dedicated
controller.

In comparison, downstream in OpenWrt there's currently a separate
driver i2c-rtl9300-mux. The child nodes belong to the Mux node there
instead of to the I2C controller. The mux node has a reference to the
I2C controller it uses.

> I understand that either i2c controller can take any SCL line. If so,
> that could be a pinctrl, but again this is child of that device, so
> pinctrl to parent would be odd.

Either I2C controller can take any SDA line, SCL line is fixed.
I see that adding the property implies the opposite, so I agree
if this is not acceptable.

>
> Vendor (not generic) property seems the only solution, but then this
> should not be part of the existing binding or you should clearly narrow
> this per variant. 

Based on the previous comment, I could completely omit this property
and somehow hardcode it in the driver based on e.g. the address of the
I2C controller. But I need advice in this case. Either use a property
to explicitly mention this in the device tree or infer it from an
already used property. 

> It was made very clear that rtl9301-family has only
> one SCL per controller and you cannot choose.

This hasn't changed in RTL9310 family.

And to clarify since this is already confusing for me in how the
compatibles are named: there is no rtl9301-family, RTL9301X SoCs (among
RTL9302X and RTL9303X) are part of the RTL9300 / longan family.Similarly, RTL9311X, RTL9312X and RTL9313X SoCs are part of the RTL9310 / mango family.
> Best regards,
> Krzysztof

Best regards,
Jonas

