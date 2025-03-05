Return-Path: <linux-i2c+bounces-9729-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C13A4F5DA
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Mar 2025 05:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64BFC1891062
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Mar 2025 04:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136A719CC27;
	Wed,  5 Mar 2025 04:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="JE/tQQ8g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F3619ADBA
	for <linux-i2c@vger.kernel.org>; Wed,  5 Mar 2025 04:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741147274; cv=none; b=kue+makPXem9vhWmPw+u9yjhX8gOWW7s+VXmUDQqRXmJadCInTcrgkgY47K8DmN9zINm1nNtlD6bzcXEN8mcA70eCjuhxoPGhg1KZVwCAQ1wEkD9HIxlVHqf07APmig86qNjZnMbZ32eeVJc41ofStN1YZ+UPkV/awIpy3pMjOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741147274; c=relaxed/simple;
	bh=c7n8loHullD7JXhQoqt6oq4ipwinlvGcRtIih2cRmuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ou0xlGEEMW4d07Pq8K4mUg+gF/XoKWnBoRJGTnQ/uK9cuOMDZ0a1a26GWC6HWLdhi+2xpKJ8UIqVGyUxuFal3VhBb108cEkeXXYoY74Xl6W+fXPVDc7Y+zQz5c8W71YzW4Sm6E+8y9rp//dSQju2InilpntW2ssvGGpIPdyflrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=JE/tQQ8g; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d03d2bd7d2so59938575ab.0
        for <linux-i2c@vger.kernel.org>; Tue, 04 Mar 2025 20:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741147272; x=1741752072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IAzReoWSx6Ky4BsTRXhDGhpk0Fac7rFxEYq0+DJkXWk=;
        b=JE/tQQ8gc3jCIThWwVi4CmL4JWvBnCjnZqAvM8koaa4HM2bjJFN2ZTzG2E51M9axRb
         ey99aAz++qTWCIoRAtNexdqyEbUPemRj91rx1/i5LJ/x+e4E4kx+bH6fU4PDYy6QWlWX
         LikSn04wes2ly5JJCvUqE9Yb9JFrrkfCxJOTzl7uN9eFFkFWGVOebFYo0ytimGtsvpnQ
         xEi6OSYg/afhFtLNu21qZsN0ReBhbFmhQ+gRKT2VA4AWc1ZKuwTPraJaxXc72lwBp7DH
         mJ+NT0tOOhyk8Y2yeiRRlnGfftP5mpPdt5hisVupL/EOO+1aNcoDiPH63tjTAZopissd
         5F9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741147272; x=1741752072;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IAzReoWSx6Ky4BsTRXhDGhpk0Fac7rFxEYq0+DJkXWk=;
        b=kTkQ1N5ZoFmHC8nlIhosK1W8CQVPmjCajWBwTGZc32F5tCyUBm+OTx3v+xbjlc8K6f
         ETxD+tlXmTrUK5lw7DkUKrU2LjPrbuqUrK1hkI9eGIBjcc9xBWJCbo0kOcmqPJdxVwIj
         sLFVnUOzUdbtwVwQ1mL31R0ACL6Yyb3jL8tfpxs7Nah9ZsFJy6UgMP4vbW3/zEQ31r4F
         tK1/DiZW+Yf2f807DjbRQZw3kII1K1L0SyHjaiYR+BdPuuS8ld8uxnAHHxR662QRIsYB
         r3ggj5j8TPGyif9d5mKf9a4XTdfcRpKJKYSg6unVX9DYb710pjVqNEdUQG4H3x/ojnVx
         wyIA==
X-Forwarded-Encrypted: i=1; AJvYcCUsWGL5KrmvqprQX0R5pZItvMHfU5zsbvXGZPa7nb0KC2INYHMgqsXYuBA+rX16A2gIBuepyNTH0o8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzto021EeZeymJndAMZjrg1189qGr8pa0OLBQbH3Ye3FuprbTnU
	IaR4HzSfd8L/J6s0/25hySh8bCSC4c4U7SWWi+Zi1OmtK6I7QLfUZcrGZKllSyM=
X-Gm-Gg: ASbGncvjI53a4FenRBZV2i+yiLXxvwTcPi2N1J1yY2Qn/IWlLnz4e2+gQfyPupEA1vO
	BabR1pxqaeofL6kbISicsihOBY0E0wzix+yJGHnx9G0gw1wxEiZD7JwvJDHLIuKxjoO3V/HDnED
	1hyek1UP5tYJpEGC8bza7YIqcqRySMqrT8UD2v9fEK4x6ZDCrLN/KXr4yud4iMmIqY2rTtJT+ru
	X3+1zSY7J3Y6MJpAYcE7aEVWfaFMUlHsNoKWq82j6/wgR/OLZFbqtI77MuilaK0UrvDqZAVnhc0
	P46rJ4AGa0RGFwx6auTJEDySlawwsp5OK3rKEk4=
X-Google-Smtp-Source: AGHT+IHu3MJTjF5+qGVR/U5nf98lXZ/G6BYq/rEMfIvyKQ41zfGyelWGxeEJNcGMavArNtzdZ37kIw==
X-Received: by 2002:a05:6e02:1d03:b0:3d3:e2d9:5a58 with SMTP id e9e14a558f8ab-3d42b97c976mr17539195ab.17.1741147271939;
        Tue, 04 Mar 2025 20:01:11 -0800 (PST)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d3deee5121sm34666245ab.65.2025.03.04.20.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 20:01:11 -0800 (PST)
Message-ID: <eda41d6d-fa08-413b-8f3c-ce044e171615@sifive.com>
Date: Tue, 4 Mar 2025 22:01:09 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 1/2] dt-bindings: i2c: spacemit: add support for
 K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Troy Mitchell <troymitchell988@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
 <20250303-k1-i2c-master-v5-1-21dfc7adfe37@gmail.com>
 <20250303093506-GYA58937@gentoo>
 <ab10e069-d9e1-4df7-9454-8b0fc910443d@sifive.com>
 <20250305030540-GYA62563@gentoo>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250305030540-GYA62563@gentoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-03-04 9:05 PM, Yixun Lan wrote:
>>>> +        clocks = <&ccu 176>, <&ccu 90>;
>>>> +        clock-names = "apb", "twsi";
>>> 9.1.4.61 TWSI0 CLOCK RESET CONTROL REGISTER(APBC_TWSI0_CLK_RST)
>>> https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb#part594
>>> from above docs, there are two clocks 
>>> bit[1] - FNCLK, TWSI0 Functional Clock Enable/Disable
>>> bit[0] - APBCLK, TWSI0 APB Bus Clock Enable/Disable
>>>
>>> I'd suggest to name it according to the functionality, thus 'func', 'bus'
>>> clock, not its source.. which would make it more system wide consistent
>>
>> Also in that same register is:
>>
>> 2	RST	RW	0x1	TWSI0 Reset Generation
>> This field resets both the APB and functional domain.
>> - 0: No Reset
>> - 1: Reset
>>
>> Which means you need a 'resets' property in the binding as well.
>>
> right, there is reset needed
> 
> I'd suggest to add it as an incremental patch later, when we
> implement real reset driver, and also complete the calling reset
> consumer API in i2c driver
> 
> but, let me know if this is not the right way to go

If you add the resets property later, that's a breaking change to the DT,
because existing devicetrees will not have that property. So you would have to
make the reset consumer in the driver optional, even if it's not really
optional, to work with older DTs. So it is _possible_ to add incrementally, but
not recommended because it adds "legacy" code that never really goes away.

It's okay to define the binding as requiring the resets property now, even
before the reset controller driver is merged. You just won't be able to add the
I2C controller to the DTS until the reset controller binding is merged. But
since the reset controller is the same IP block as the clock controller, its
binding should be available soon anyway.

Regards,
Samuel


