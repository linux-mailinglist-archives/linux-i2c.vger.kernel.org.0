Return-Path: <linux-i2c+bounces-12505-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C212B3A7A7
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 19:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D746189B69B
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 17:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6793375C3;
	Thu, 28 Aug 2025 17:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5r9gwhU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E89322DB3;
	Thu, 28 Aug 2025 17:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756401546; cv=none; b=sMlOxL3BJQvzd6eqYIHLPRFjN7EZT5FPRH4c3aYB/f8qTB8H+ux+ttIV6xg988bI4xnlWtlfnXC0DG+wGye7ZZ31nWB3dKQmEGduAUYI/36n1TYG5KMMKLlvUMLF9NYbqvSGt0JuxVJtQkx1hAf5Ou+M2pc7/llYntJZH1VH9/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756401546; c=relaxed/simple;
	bh=SS4pv8uyaXLZEUMjbC2GJgsLUt5PP91S4SC3iNr8JIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iiddvf3EIHd5vF6ZfJeFTsCwNiDJOVgTZukqGoieHxzZR8QWk7KMf4WMw41M8f+4Tj03nRAyFhMZhYYrGNd+VmRiHmoUTUuZKYVeqzX865b7ZKoEcRdDmZRwzQ7ICka4bxi/mFkoX/QohAE7G6HtESs+dcXT+IO8IBZCxy7ZIKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5r9gwhU; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-244582738b5so10962595ad.3;
        Thu, 28 Aug 2025 10:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756401544; x=1757006344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SS4pv8uyaXLZEUMjbC2GJgsLUt5PP91S4SC3iNr8JIE=;
        b=a5r9gwhU3OZ7+sie3vFCnu5KUoHlLiq8Fda10SVQKy3KY5E0TfZT3HnHYacMzrAd9G
         4oDSRC42Wp020yOLlxfrHgXRW8lABMsdsVfaL9PBrn045pSVevt6Ig5BnSXVkm+PxAcH
         eXJD/mczQxUWiXWYNtcFszV/JVJ34kverJ4fwTGINbY354Jv6sLpy44bT/ZABHP3utFV
         ZbfrCHPFGqhRrtzGvTS7rd2LPcnO7D1BinpEiSkpUSGxzuUgCspo94w2jRvkVl9+pQOe
         eER9rvU++mTqwSMkUWBF5P5HhVHwjG37aNkK+uw9g0+uowJCMaErb30x7sQ4xl6Fjv4h
         5lEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756401544; x=1757006344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SS4pv8uyaXLZEUMjbC2GJgsLUt5PP91S4SC3iNr8JIE=;
        b=n/JTgC4I3IW6814pe/YiTW/PnJ2bqEr/XY71snk70r8Rdt2OV6tpLLTlsVKx/UNnbR
         Q/TXefjQt3KWGK0aOTzGCYF/ZgHYOTJZUjCp7h1I7cpMQq3mFi8xsLSlXPzpOz/IVcbc
         QjDJUVS7fICjSv80S5151K1C0RETqyEHCvFx+rH9OaoVOD+Hkv42dd4h9wPC3yIeRh+E
         w1Q2iHqAyuiQpfJGxX0XTCHw1KEC9ctQJhl4Q8m6Xt5jUlHp0icvfZ99Mz1kPrfzoLmX
         T1SfX7uQrIgrg7xrXWs0oVYLIuThIS7EoFktx1QzcCsptU7SR+L4XtkZT/XFW3Cp5g8V
         UpEw==
X-Forwarded-Encrypted: i=1; AJvYcCUBa5k+mZQiDt0S0ZTIhWgv7noMtqIj+PFRcEjioo/MEbva+BvTyDRwxJvOYKL0n/YH14HSX+q7JszW@vger.kernel.org, AJvYcCUXZLgZNpZAjTMSealn1HQMnxDD8iFszliZWn0C4V2ilTveq+qvda7siVf/MwsSNH9qj6NxJWdlzB7P@vger.kernel.org, AJvYcCV9RAoS8gNgfyTjTNcn6R4rOUfsxIUbBHXigItqshuIYSeIScTop6b2KWJ6LYK6kKC6AzbMoWIuwkNqvw1u@vger.kernel.org, AJvYcCVSJdinKHvPCX1wpjlobmaRyzIcazfGoEqqPpik6yhcT7sOq5odu1Q7sLxDCuLwigXGtebViR9q9y95@vger.kernel.org, AJvYcCVp8ixI2tQY4z8ky1mYOoMNMEexHKYOk7OYirIKdHBSGMhCkeQQY1T1eJlkHP5JPg1MILXc0h100O4=@vger.kernel.org, AJvYcCVtXDMPfUlvbxNu3fP+pKjbBlNOZCKTPfyjqG0F8ItcqU+qWpY1n3pyRoSN7IDsUpiC0H/iPLTxbXmd@vger.kernel.org, AJvYcCW65DBx7BAMTLd85Ul5qOgMJG/luZ/5DVXEYs+YGhKPGldV2Oe10UDjoGI9Nb7iWQ2SL2ZAbHhKzat5bqO4Oa5k@vger.kernel.org, AJvYcCWd6W8zmw45ijKWJ5+PpuwW1Or22QLB3mDfVPvyFxpVCD6fiy+7gHkRrRdqDGEjc70WDXZeRTeswETo@vger.kernel.org, AJvYcCWnzpZufkX6uylH5sfx1xvj/DkL1cyMEi3bPh23EaTkSei0+3VE+12K5te/wzIEUN4c+QJGjPEv9AWUmg==@vger.kernel.org, AJvYcCWokkqmb28MSp6aPx3LMZCk34o5zu+5
 IsNCTRWYEw5lwPhbJ/f8+I9N4zSqvhQEQrDmTGCEV7pH3kH09jjJ3y8=@vger.kernel.org, AJvYcCWzIIxyZ+7WWV7IEXk0OUMjXUlS22fOYcnhAsj4P/cO9D4yP+Pw9TbVOtRjwpZMkaKNhjbBiWT7YbB1@vger.kernel.org, AJvYcCXEmmsOKb+AD5PcpVEIwafxQfvlI4JuJ7VCshwKcQOsN/WpPCDSsiEwnnHnP3FJfJ7+KEx36n6UN6RFLKY=@vger.kernel.org, AJvYcCXMwnfQ1IUK8MITtCnwYIvWs7nOy/ffePPv6VlK2RGB5IE3j1SLQjhlArHbdh16kos/8v+eEFhweOmEXndxKoE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy6norp54vk4rnN353sWnVHYIze17dMDiKXCG0XErk3TH+pPBG
	P/xHQyC96nQzazue4wHmmF6XTrbMRPSLYbASQngUxQMme3uPx+GhqIy5
X-Gm-Gg: ASbGncvo+kSc+4xPfdAFl/qzPtj8VURi9+u5sHNq099Fwm8UmxDEjnBEzTozl1nqGXN
	ws6rOqX0nM3YWqAes9vel31GRfwE/kWArV9jQzWuH1QWn5UdijT3ZtTh/oXWm82aDEIfk77k1Uw
	75WRCKSNOC/kz6pNLaPRKPqiGxxqAE7J4Zr8SdsFpkYlHIn+4QftR/Bmw1m4dBBZT8c2fEV0nPX
	x08UnlDOFACE4E/F3l9NpE6aZ8wdG8TP3gIRRx0g1C69KMDitetX32HALNqpyZPvd3Gg0d9iGdD
	B4hgtHvvp2xmgqsx9EfjPEDAwoG55WZ6zG7o7YChrVLGHVCbdfU1CnmtiVB2gC4moo1V3i+1+hM
	UKVp+dIjCmZAxW/sgDGXSmEGd2uJYHxBqRCbkhmGGYIEiPSVR8PORUQ==
X-Google-Smtp-Source: AGHT+IFPj3GBG1tXe0w52JDhOrrrStWKIT6zs8hpAEsM8UEVZqo8QCtKE2lg8olsPKFlf0oBzRgObQ==
X-Received: by 2002:a17:903:2391:b0:249:308:353 with SMTP id d9443c01a7336-2490308048fmr5489935ad.41.1756401543466;
        Thu, 28 Aug 2025 10:19:03 -0700 (PDT)
Received: from [192.168.1.111] ([59.188.211.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24905da2f20sm739185ad.82.2025.08.28.10.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 10:19:02 -0700 (PDT)
Message-ID: <86ab9bd4-9a4f-4ae9-930f-5fb9ef69c963@gmail.com>
Date: Fri, 29 Aug 2025 01:18:47 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/37] arm64: Add initial device trees for Apple M2
 Pro/Max/Ultra devices
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>,
 Lee Jones <lee@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Michael Turquette <mturquette@baylibre.com>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-nvme@lists.infradead.org
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
 <932e0085-c901-40f8-b0d5-67f8f0b934e6@gmail.com>
 <20250828165012.GC204299@robin.jannau.net>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250828165012.GC204299@robin.jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Janne Grunau 於 2025/8/29 凌晨12:50 寫道:
> On Fri, Aug 29, 2025 at 12:11:40AM +0800, Nick Chan wrote:
>> Janne Grunau 於 2025/8/28 晚上10:01 寫道:
>>> This series adds device trees for Apple's M2 Pro, Max and Ultra based
>>> devices. The M2 Pro (t6020), M2 Max (t6021) and M2 Ultra (t6022) SoCs
>>> follow design of the t600x family so copy the structure of SoC *.dtsi
>>> files.
>> [...]
>>> After discussion with the devicetree maintainers we agreed to not extend
>>> lists with the generic compatibles anymore [1]. Instead either the first
>>> compatible SoC or t8103 is used as fallback compatible supported by the
>>> drivers. t8103 is used as default since most drivers and bindings were
>>> initially written for M1 based devices.
>>>
>>> The series adds those fallback compatibles to drivers where necessary,
>>> annotates the SoC lists for generic compatibles as "do not extend" and
>>> adds t6020 per-SoC compatibles.
>> The series is inconsistent about the use of generic fallback compatibles.
>>
>> "apple,aic2", "apple,s5l-fpwm", "apple,asc-mailbox-v4" is still used.
> Those are less generic than say "apple,spi". For "apple,aic2" especially
> it's clear which SoCs use it and the set is closed (ignoring iphone SoCs
> which very likely will never run linux). For the interrupt controller
> the fallout of not using the "apple,aic2" is larger since even m1n1
> expect that. irq driver is special in so far as it requires more than
> adding a compatible.
> I think "apple,s5l-fpwm" and "apple,asc-mailbox-v4" are specific enough
> and describe simple hardware so the will not cause issues unlike the
> complex firmware based "apple,nvme-ans2".

All of these compatibles has around the same specificity as "apple,nvme-ans2" which is
a mistake of using A11's version (ans2) to describe the M1 nvme (ans3). Though I do agree
"apple,asc-mailbox-v4", "apple,s5l-fpwm" and "apple,aic2" should be fine compatibility-wise.

Although AIC2 compatible should be fine that may not hold for later versions since Linux's
AIC driver is actually AIC + core complex FIQ stuff, so when you do add newer AICs it is
probably better to use SoC-specific compatible there.

>
> Janne
>
Best regards,
Nick Chan

