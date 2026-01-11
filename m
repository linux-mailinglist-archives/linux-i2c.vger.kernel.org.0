Return-Path: <linux-i2c+bounces-15027-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B9DD0FB53
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jan 2026 20:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABF6A3046FBB
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jan 2026 19:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E7834B1A0;
	Sun, 11 Jan 2026 19:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="so1bpWsW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA60E349B1E
	for <linux-i2c@vger.kernel.org>; Sun, 11 Jan 2026 19:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768161365; cv=none; b=aBAMmFbv+t6JuhL2meP+4A4cx1xyQkS/yhYedOVkOzeHywQAKxy6GTcxlGQtYA7WyoyGqVdNqnVR+lPJ6PEXTyn86lX9uderU+LUevTbiae0p6Ixu7NOj4i3iKJlt3NaWYRZTA/Fk4f4L91Pu5aI7BAXtQltX2x4pfYUyznTZIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768161365; c=relaxed/simple;
	bh=ZrfWh/ijxCDqCCWp/uJ7Kl1B1mKM00e4Rup8caSKxRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rezySpM9UO23md4wOfw/4fLt1ROiPTZ9kXvaZCukr3A6qo+ZMPbnfswe+uLMJMi4mSyAjQDKGIKpgIsAXAhT3n/cbEa+K2BK7vxBbZoKsEYEsk+zTfSZhWYXWsxeufxqpmlySPbAxeFHHWhw11TJgCAjvWKSvQNbMpwvE64C1oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=so1bpWsW; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b2627269d5so649955685a.2
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jan 2026 11:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768161362; x=1768766162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gOUBhbeaXMEYonUlyi3dh9viIlCbuv3hV4saX11FjGc=;
        b=so1bpWsWrsw7NiZLUnY1OT4NH49sKF5Yntu3vD0E214e4Ndh53f7BwklWchDqRaG/C
         Yw7EZy5d0VAhdoRsEkunTOnxhO8ub+bq+ydDc13UpP198EW/t0nwjnLhJHwvWAKGHLy9
         /8PyN7nlYUNS/YdcewWI7lREpmffwhmyesf1nZwwvK6OI1mJeDHUGkBlxNBdKfgwICvG
         jfbWrNXkGLG/wXuXbzuqbzbIe5nTR1acJAAsg4xdetJQWXYR376lWq32jvKswycMUD1K
         L/RsvxvMRePS5erXWrQNCPE49MXXfG6tv4D8kVSegi8njKVb0hMKXVccs+8oYGHjmkJj
         NFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768161362; x=1768766162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOUBhbeaXMEYonUlyi3dh9viIlCbuv3hV4saX11FjGc=;
        b=uDcExdqDgCTE2qx6LG5kG+PN7RHIaw96aevzZLJFUfB2XZ0EfxUJd5K/Ifg5f67lO6
         rGT7QCr+Z3xmw3WWJMkgmcsiH1x0f2phLQZeXlASdDkM+JvzQ9Rxhdl3bROSym5UZdcz
         vt+UsicKleCa5UodyBFnQFkpWIBwYYg8ggMc2MvL+I4/hiZ4PIpKXybrqAWUaT7XQArt
         mxQzaWEzAKw6ZkZhCBq+KjuXhj8fmZgjtJ/3mSXBEV6pY9RIK5uCZZ5TprYMI7WGDBNv
         VxFWzg3OhA6sYcdFYrHsGELZ832epxoax1JUcVVee+U47Iir0vLXmhzNeF9BP4LQGgbS
         GeEg==
X-Forwarded-Encrypted: i=1; AJvYcCXa7EQefEh46q6+X4/Ad7QUJNSJZydI7lo89qn9LfbXAykN4H4Ohx1MZX5kgHg7qhx1x12RUc0ZIv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqqW45TF4bO4nG4cQC+2f1BJ/cnlFHFbjpppGss8I0xzoalU3m
	jISeB4vOv6c3MevJolauFzKUr09ZWI/YDJyYF/1973PaVBATY1uTWKz8ju4+6fSe0g0=
X-Gm-Gg: AY/fxX62CD+CsZFqdobWMPdyGnq33EVhVkS65oVTezcYsbucY0eBe5srnPWeAG1D2DO
	t+xNL+ntkmXJ6zCpnEoI4O7e8n85cWQkFMSvr/5mFVBTLfXpMNNUJtTPq/Djx6US05B0JbAGN9q
	5V8BnDbu6heFi/kUW6t42vFT5iMKEbUMlyLgNPvu9ZOusK8cuTGs+ffIu7A5+HDUaqgxxFewnE3
	6tgSj/goI3ehEw+fbCNY0i63sPJT3NdEK/e//dsffvBAE7SBVK5HvOeNOzcf/+g/SFdLrStxhk5
	WQGXy0vsepTTtt6zmxkwHhRnLlO4W3JmMo7SkUpZoTZLDJeiXYvAEhPbhAIWjjXLyl+Cln2/0L7
	hi1tKa2v1RZCsozGMgf1a1yG6wn1wDwjvhlEG7hw/0EXR1Wo34syKsK0+xBfK14upC7vh16yBvi
	9+qF27VV44Rz8MSjm9DXQXz6bleRDCqena5H8ragaGLPLXYt636Ai78olaOjHVpMG1
X-Google-Smtp-Source: AGHT+IE59tdTZ/GflUoGe/9DlksdMPcDRktcTk1R3UIHBonEpxYes8KI9f6r/aWCmNZietl2oAn6tQ==
X-Received: by 2002:a05:620a:290c:b0:8b2:ef70:64e9 with SMTP id af79cd13be357-8c38940915emr2288627285a.51.1768161362565;
        Sun, 11 Jan 2026 11:56:02 -0800 (PST)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4b90c3sm1395290085a.19.2026.01.11.11.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 11:56:02 -0800 (PST)
Message-ID: <a383dbc8-5d14-4654-933d-5dfa73a23b12@riscstar.com>
Date: Sun, 11 Jan 2026 13:55:59 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] rtc: spacemit: default module when MFD_SPACEMIT_P1
 is enabled
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
 <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
 <202512251653368b33c7e7@mail.local>
 <4c7c0f69-4732-4f62-970a-2a9273b3b5c7@riscstar.com>
 <20251230005142d1bfc6f7@mail.local>
 <6ca28183-1687-4ddc-8b3c-5e5be4255561@riscstar.com>
 <20260109223627b566d2b0@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260109223627b566d2b0@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/26 4:36 PM, Alexandre Belloni wrote:
>> The purpose is to make the driver a module (not built-in)
>> when "defconfig" is used (without the need for any Kconfig
>> fragments to unselect things).
>>
>>
>> In arch/riscv/configs/defconfig, we have this:
>>      CONFIG_ARCH_SPACEMIT=y
>>
>> In drivers/mfd/Kconfig b/drivers/mfd/Kconfig, we have this
>> (added by patch 2 in this series):
>>      config MFD_SPACEMIT_P1
>> 	default m if ARCH_SPACEMIT
>>
>> So when using defconfig (alone), MFD_SPACEMIT_P1 is set to m,
>> to benefit non-SpacemiT RISC-V platforms.
>>
>> This patch is trying to do the same thing for the RTC,
>> i.e. having RTC_DRV_SPACEMIT_P1 be defined as a module
>> by default.
>>
>> I think you understand.
> I'm sorry, I must be dumb but I don't understand. The current behaviour

I think I'm the dumb one.  I think I finally understand your
point.

> is that when MFD_SPACEMIT_P1 is m, then the default value for
> RTC_DRV_SPACEMIT_P1 will be m. Since patch 2 makes it exactly that way
> (MFD_SPACEMIT_P set to m), I don't get why it is necessary to mess with
> the default of RTC_DRV_SPACEMIT_P1.

Your point is that patch has no real effect, at least not
on the scenario I was talking about.

I.e., I was saying this mattered for using defconfig alone.
But, as you point out, using defconfig alone gives us:

   ARCH_SPACMIT=y	(in defconfig)
   MFD_SPACEMIT_P1=m	(from patch 2)

And then, *without* this patch:
   RTC_DRV_SPACEMIT_P1=MFD_SPACEMIT_P1
meaning
   RTC_DRV_SPACEMIT_P1=m

And therefore there's no need for this patch to set the
default to m rather than MFD_SPACEMIT_P1.


> The current default behaviour of RTC_DRV_SPACEMIT_P1 seems to be the
> correct one and the proper fix is then patch 2.

Yes, now I understand.  I'm sorry about my confusion.

					-Alex

