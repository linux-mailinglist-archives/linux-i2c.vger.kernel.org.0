Return-Path: <linux-i2c+bounces-12202-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FE1B1F979
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 11:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 187383B6CCD
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 09:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65214233714;
	Sun, 10 Aug 2025 09:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDJzLvtX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818CE1C8621;
	Sun, 10 Aug 2025 09:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754817768; cv=none; b=gA3o/INazfF+V5g94DuVOtwtQJ9niwRzUtq2PpPm6Xl7ompdOuQmlDq39dN0D1RKptTKnvdvL+NndMDSy9QoZF2F/fOdVRm8aES7X8Ty/3IdDT3d1Ksz+9E63elAlMzuinnog3gaU5sFJ9dIFZJbO4zbN/JdqFOs6+1/8ojLdTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754817768; c=relaxed/simple;
	bh=1wCBol2O8mCxhZYnzE/TjVifPhyYtuP1PIz7eFMcYmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bMJLP+g32KMCRtZRmwEuir9mPdi82yxoA2mHj1xOpMpyNBu6c3meQ0fj3UU4Yo9N2EnVOmxKSqzlKjGdSuv/5ZAQyOnUbEUcm0VjrLojPhbxfC3roqtu78UWhKqD8ogHzR+lL6btP8ztoYaDpc0QyvukKeNnwTsrS9JrmTSEMR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDJzLvtX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-459ddada9b1so32540665e9.0;
        Sun, 10 Aug 2025 02:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754817765; x=1755422565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TXDyunAubycIInM6unQPXngBeY7Dg0vrHzz+EdQslnk=;
        b=XDJzLvtXA8sFmRWeoUHq9bbpto8wbug9f2TLUEaVnPeZS10LYAYFEdTML80/wDSkNq
         gybWceWhWGiPnSCp6Qw9Z0dKzV/GsplysfF9dn4UTfvnZLRI/A5AbEpB/fjVBuXzEUod
         dzRTzOCHK4ES78IVmEAVdFoV+pYqxjNp8KKFEJJIUJcb2x10F1t43uD3zkI4TwNA2y5m
         zEz/2I7rc0lSeWBbES1EqZtBkow7PoyuaSReAfAUoQxhX/bzrezrNxjYJqkp1h5XX2uS
         VH3nOOP1Hw3xdXqxelTnlX1uR0BXVkTQ/dFJO4b2W19SwWQIedlFMam+PtM8O9wMR41k
         TB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754817765; x=1755422565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXDyunAubycIInM6unQPXngBeY7Dg0vrHzz+EdQslnk=;
        b=FofMZU3uI1bDNGnbyHDQRBdK80u4cfMshEt9/YYUTYUVvFVy/ylOtdsDoV7rgnW0nZ
         cQAd62Yd1TSeo7UWxjQTTezdLBIJHhZJSCENoYv17CrW1Eh/ePkjIkKjw4qc3f+isUtp
         zF7MqubjHz0jnVeIXNuuBlXFQg0gXG+m4VCU4N7Et7/mKr2z8aw6T7GI2Rzw1jGzZVYQ
         J5GrjpaFWPL5yrhAUv30jots84sPfQcgxaAtMCoFb0C8ii4GlYcwH8Mwv03iQc1BnOeq
         YkAi8L2dM3FdoHJhwxN0oOIA5Vo7GQUNZ8b5HxZEYrvQZ1ge6Jy29UWo0DBWUPfG1Otc
         uQVw==
X-Forwarded-Encrypted: i=1; AJvYcCUjzj2dEnhuGJVYgMq4CciUU52mUYToK1pRz112cseJiO+R75WnWU8uQ0Jv02ZeiDnmlbAqt7bak784fpMm@vger.kernel.org, AJvYcCXWzZ9Dy/O1WTJILCgOXoKw+wHSNP/rwz7/rWWaAKzUMdoOm+VSxxN1PH2+TGi3PCiZguydpzLUdLlC@vger.kernel.org, AJvYcCXYPZPxyuuvLV6GGbBtFWiJYPRhYUKE//Yb3AW8+IvXS4I8pq0/FYKyYqaNLK1SmT3rEcouDd6WkdtO@vger.kernel.org
X-Gm-Message-State: AOJu0YyzsSBQ0qJkCgvqCZXUbUbE+vd1fHW5GFjXf7KTl4wZThpQEGuW
	gScz2PPTG+HbbAhSAIhU5l7ljU0D27+IuHOxKH45XwSpaEwh2xUjRxbCR/6XrQ==
X-Gm-Gg: ASbGncv+QEmdeEE4K9ndEjHML6cUsVMAgYJxEBN6xGvpFdEBhiFH3pYvBUt7Gd1y8Ig
	9wbjrDvH/OW6Nx+Xr6pK+vh0JXOfDqwcZx4DQjcYroEMfxLZFOZxGh2i022j/VV0McM2RvNBte0
	rPCjx/JRGQUEC4xWY9Ktk+ybFDlxPNiVbwITJT0tjStBeZG2Oc1aeyIE3lFFWDKC8BH8fWSLBGx
	ONi4HrjfIDgll+XSLXblFvCyVAhy/WqEi00OYg6pfdG7XEhxr4VqTheG2otqlMKzlTcVpRMU3JU
	60m2ZrZVSNNGQTofRS3GAPsSqX4YC0qHua7HJ16nm6eeQGOWC0JxWEaktOt7Ztd3mAxDKVibjHx
	aUuqYRL7DCy9aCt3QApLUbCHBm2F8Efv2F/4bgPW4cLrHTaWCPIep7li/xvDysa2+lhOgdbih43
	uWunwAISWDC1x2IdrAlyd3kg==
X-Google-Smtp-Source: AGHT+IFl0LaO/9tJI3DF6BKyFuzagfY9yzYK+bQykoA7A9SISVYdNrgwyb1jIwx2T/hYfyhy3qMw8Q==
X-Received: by 2002:a05:600c:4e91:b0:453:6ca:16b1 with SMTP id 5b1f17b1804b1-459f4f144e5mr74723585e9.26.1754817764520;
        Sun, 10 Aug 2025 02:22:44 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f12c:bb32:3d75:9109:b5a7:a261? ([2001:9e8:f12c:bb32:3d75:9109:b5a7:a261])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e585430csm206445415e9.11.2025.08.10.02.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Aug 2025 02:22:44 -0700 (PDT)
Message-ID: <72f9bef0-5f4d-4eef-b853-9d3f6be07004@gmail.com>
Date: Sun, 10 Aug 2025 11:22:43 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/11] i2c: rtl9300: check if xfer length is valid
Content-Language: en-GB
To: Sven Eckelmann <sven@narfation.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Markus Stockhausen
 <markus.stockhausen@gmx.de>, Harshal Gohel <hg@simonwunderlich.de>
References: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
 <20250809220713.1038947-6-jelonek.jonas@gmail.com> <aJgzUFOzxxdNDrQa@shikoro>
 <10704304.nUPlyArG6x@sven-desktop>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <10704304.nUPlyArG6x@sven-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10.08.2025 09:01, Sven Eckelmann wrote:
> On Sunday, 10 August 2025 07:51:12 CEST Wolfram Sang wrote:
>> On Sat, Aug 09, 2025 at 10:07:06PM +0000, Jonas Jelonek wrote:
>>> Add an explicit check for the xfer length to 'rtl9300_i2c_config_xfer'
>>> to make sure a length < 1 or > 16 isn't accepted. While there shouldn't
>>> be a length > 16 because this is specified in the i2c_adapter_quirks, a
>>> length of 0 may be passed.
>> There is another quirk for this: I2C_AQ_NO_ZERO_LEN
>>
>> With that, you shouldn't need the code here.
> I am a little bit lost here. Let us assume that i2c_smbus_write_byte_data() is 
> called - for example by an in-kernel driver. We would then have following call 
> chain:
>
> * i2c_smbus_write_byte_data
> * i2c_smbus_xfer
> * __i2c_smbus_xfer
> * adapter->algo->smbus_xfer (aka rtl9300_i2c_smbus_xfer)
>
> But the quirk is only checked in i2c_check_for_quirks - and then on 
> `struct i2c_msg` and not `union i2c_smbus_data`. And this is only called by 
> __i2c_transfer (which is called by i2c_transfer, i2c_smbus_xfer_emulated, 
> ...). But on first glance, it didn't look like it will be called when using 
> i2c_smbus_write_byte_data - unless __i2c_smbus_xfer fails and must fall back 
> to i2c_smbus_xfer_emulated. I most likely missed something when doing a quick 
> check of the source code. Maybe you can point it out.

Thanks Sven.
I came to the same conclusion for now. The mentioned quirk doesn't seem to
prevent this for smbus_xfer. However, it doesn't harm to add it. This probably
applies to the existing quirks too, that they are not checked for.

So I think this check is necessary. It also ensures that [1] is kept in its purpose
more or less. To prevent any invalid length passed from everywhere. The
implementation of Quick in this driver is also problematic because it passes a
length of 0 internally. Thus, the next patch actually removes that completely.

> And I might have to point out that I am currently not next to the actual HW to 
> check if my statement that adapter->algo->smbus_xfer == rtl9300_i2c_smbus_xfer 
> is really true.

It's true, yes. See [2].

> Kind regards,
> 	Sven

Best regards,
Jonas

[1] https://lore.kernel.org/linux-i2c/20250809-i2c-rtl9300-multi-byte-v4-1-d71dd5eb6121@narfation.org/

