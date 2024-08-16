Return-Path: <linux-i2c+bounces-5452-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 822FF95481C
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 13:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A665D1C2187E
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 11:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70B61ABEC5;
	Fri, 16 Aug 2024 11:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9SV1Zf+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5F11AAE07
	for <linux-i2c@vger.kernel.org>; Fri, 16 Aug 2024 11:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723808028; cv=none; b=ouKOOVTxCBuToAPEstDChDjCEM8WmZFWbE3RkTcN2WTxy4JGNBtely3BbmIopKrytdZFxDS5/UlezOIwPHwaF8Vz52CWGWmt1zmGmE99GEwEKgs7+7NWDMgjNbMf/G1eSvGrhnULC4mns8vsyV+FGoA/zcQdrx5zCDDXB1Ge9Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723808028; c=relaxed/simple;
	bh=geHkddDo8qf39g528iDXPzlcDOeCWrANb8KD3zIVbog=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OftYceupTSO4oGtYpaw0TfrSIRCgRahPnn7jCBgirE7JE5rBDFmY8ILBJyBK4Zf40Hx4QLtLnlcjRovj534JOZQ3UiDExFh/pEWZG7KY6uCOv0k/+WKCuYAHf77MKzAypxJF+/YzMlhxj7w+N4ZMd8PjFgVv6moHNqUafjfUKJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9SV1Zf+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42803bbf842so18912325e9.1
        for <linux-i2c@vger.kernel.org>; Fri, 16 Aug 2024 04:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723808025; x=1724412825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u1bXmw8OiaU3qUHo8sLVq1D9FSKePmfLP8sFfySXixE=;
        b=a9SV1Zf+RT0V8zq8hx8N+gCkfP7qragnqM6p/JuAJOl7enMsXjutLa27ND/vMU/rsi
         lAghM+QG4GfKPkx/a20Tx+W0+MdhexsMcV8goafKmPFjgZi751mJVgNrEWjQUt5obAlZ
         LPOYEpq9zv8nSUMpSmGYu8acb1q6HsNjXyiF2lUA/qYM0hlNcD6gF1AdViABOS2JJRoC
         V57rHDC0V5EwH2s4+Q94hkDFbIp5WmsEHfdDmqoewoZ2ZKrasUCgqfOMuhyfk8BcS1qk
         gboqqEkgVs+xuYsL7YXK25v7DgPdK5WKybhtPReKWuoWxb9dA852Rfa25vR5fNcJzuTk
         iquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723808025; x=1724412825;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1bXmw8OiaU3qUHo8sLVq1D9FSKePmfLP8sFfySXixE=;
        b=f7Jir3kc5Rq4bXSGj/PVNDjMxuX4HFnrmHLmYarP2gfYJ7pDTMFpeqamKUg4CJjPhj
         IxgI6xF5kL4Zvl44cayCkAlR74U+xwpfScFf31nbo2CwHLxS10gHr1vY/AWYrU4Rfu+R
         DztDFOiUbmzSduhdxneth4AKf3wDEawlsT92nXkNHSkrIff7G/nwuO+Dg2Mjw1Etpc2N
         BdIF752mI0/AInSiovbyklBdX0yyG1eERA8sDQC86qDGD+aYbnOT+qpDe9MAko/o3s1Q
         WM0NfWhrPIcWfnsqmIHSeyIXe8Bx6fNJBwcciyX/mKsU1fxg64Jgcu06bYzmi8wOsjVx
         6VkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNUlM5Lk2JNpmL8Bq9KI2Vy1apORnESW+BasohJlL7L99JNu1fUlvVgGNivrQPGjvPlFv0mCysbl4WFKiDIwcVPrpaWE1xs633
X-Gm-Message-State: AOJu0YyFcjSYJyE5RL0hJLJ7HIUTRekuL/KpY9ueZpeC2vM1DGie7pdD
	Xv4/bFH63fwCpN0Tc+TulT/MbMYDMl/2L3R17mbR2lp7jYhjTZmH
X-Google-Smtp-Source: AGHT+IG5Nx0tp9exKbrnNNLBfeEgI3URXcC8fNeOpUFR9mjYnIyc37eB9DAC30FnqiCdB6BILweiWQ==
X-Received: by 2002:a05:600c:4753:b0:426:593c:9359 with SMTP id 5b1f17b1804b1-429ed7ed62fmr20742515e9.32.1723808024909;
        Fri, 16 Aug 2024 04:33:44 -0700 (PDT)
Received: from ?IPV6:2a01:c22:73d1:9100:397d:bf1a:2ddd:38ac? (dynamic-2a01-0c22-73d1-9100-397d-bf1a-2ddd-38ac.c22.pool.telefonica.de. [2a01:c22:73d1:9100:397d:bf1a:2ddd:38ac])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ed794739sm20240795e9.43.2024.08.16.04.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 04:33:44 -0700 (PDT)
Message-ID: <271bc1f6-966d-4567-88e7-4bfb82d979aa@gmail.com>
Date: Fri, 16 Aug 2024 13:33:45 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: core: Lock address during client device
 instantiation
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Wolfram Sang <wsa@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Krzysztof Piotr Oledzki <ole@ans.pl>
References: <3b1964fa-56fd-464f-93d3-98d46c70b872@gmail.com>
 <ZryRqVexisiS-SGp@shikoro> <dfbe5afa-daf6-4366-8f53-c8f7434b0748@gmail.com>
 <Zr8ar4SCtYAiq-U0@shikoro>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <Zr8ar4SCtYAiq-U0@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.08.2024 11:23, Wolfram Sang wrote:
> Hi Heiner,
> 
>> I didn't find a single dts(i) with a 10bit i2c device. Because you said
> 
> In all those years, I didn't even find a device supporting 10 bit
> addresses. And I really looked especially for them. Some controllers
> offer 10-bit support in target mode, but that's all I found.
> 
I found LM8330 which supports 10 bit addressing. However the upper three
bits of supported addresses are always zero, so there's no benefit in
using 10 bit addressing.

> Also, there is only one user of I2C_CLIENT_TEN, and this is only a hack
> to allow instantiating the device at address 0x00. No actual 10-bit
> usage involved. I will remove this as a first step, because this hack is
> terrible anyhow.
> 
>> that you're tempted to remove 10 bit support: Could the device tree part
>> be a starting point?
> 
> I don't really have a roadmap how to deprecate 10 bit support. Because
> it is exported to userspace, the first question is if we can deprecate
> it, after all. But not much bandwidth even for that, currently.
> 
Yes, removing UAPI functionality may be tricky.
What I meant was that as a starting point we could replace the following in
of_i2c_get_board_info() with an error message stating that 10 bit mode
support has been removed.

	if (addr & I2C_TEN_BIT_ADDRESS) {
		addr &= ~I2C_TEN_BIT_ADDRESS;
		info->flags |= I2C_CLIENT_TEN;
	}

> Happy hacking,
> 
>    Wolfram
> 
Heiner

