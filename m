Return-Path: <linux-i2c+bounces-1433-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0832E838959
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 09:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AC5B1F2A802
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 08:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79AB56B8F;
	Tue, 23 Jan 2024 08:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t50ntD9r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AFB53812
	for <linux-i2c@vger.kernel.org>; Tue, 23 Jan 2024 08:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705999456; cv=none; b=XEDVuQweDlMSpi5mPnX5fBGg/3rCheWrsV46A5/vOeSzEBqWi9JjMjjuGqsKTEOR5p+3nKW6qNsIrOWBsRyk1KiV8eQMzwIDL6iKB89d789LBU8kTHADhhNQ6wsgiCXespc74ZzUYkSdBAGacH91tevVeOfSLkeg3I8kPuEma2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705999456; c=relaxed/simple;
	bh=XSNvohCgV32XPbdJ4I5vxeLwZq6rkyLtN+BZ5kBxXFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AAwTfyrPFfgMdxuF0KRR8xL060SfuUa5VCT80TTI69qlmPH+e6jsCBwefqjOrmXuimic2n9+9vR7cBuIUHmpeWx43EAk0if6+RCwqlnULpm4mgx6cn6kD/6toIv6FC3kwFWOzEbiMqpIvh1j3t5b2r2IJL+WIDaJwyRxSHWcvFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t50ntD9r; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-337d99f9cdfso3573832f8f.0
        for <linux-i2c@vger.kernel.org>; Tue, 23 Jan 2024 00:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705999453; x=1706604253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ma5Kq0bHkD89bVvP36sa3XpLa+3324OtVXoHXXzuuhQ=;
        b=t50ntD9rQ11tb3olifDO30RTSGFNIna+h5F3slUXQcBbfbzM7ZDQb2MHfhbr8gHpeL
         SDejdDarTc9jKqlIvZTN1X1zdUZaZMjtujaaiWFo4O8C9/yqDxkGFtxDPOF7hJtipNWx
         BCBW0ISGdVQqSDTBcnBbbP/rEu18QdSUYf06wvD8JHbvueuSY557mhhZAU9PqeOaonAg
         9Co9LLrt6dHiMnWI5I0sBSetS8Q8Geku5u5z43e0+MWGbVnG1mseIupuQERmmSJ0g8mO
         pKnkQVswloMNVUndFUnNhWaHGINi/EKBUhQHfGlpmlRDcxo5mkw3nK0L6nuYfBGKAdoX
         xeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705999453; x=1706604253;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ma5Kq0bHkD89bVvP36sa3XpLa+3324OtVXoHXXzuuhQ=;
        b=YoUn0F9TlN6YEtKt2tAS/nB7fcADEi0xvQ3gQB7lT0220H6UJvi3mQ2B6Pc2s7yVxf
         sGObSi4mzweiVWAWot0T+lDotM+byeNRq3fArffS1Z3KXwTuWT5Nz08hNxhLRTKMs0gS
         Dl9I6fP860Uufm+7VFDUlaa/ONDWOreBEPXKgI8V8tyXSRRsgdTgo/TJdCR9UVBsasyc
         09JKUJEG0/PJ+zJQndhr8ahK6+HhnHq7xrg8FTPmt+eWqgRLI535FS7YKtFTZd5no3zr
         kLwckG3cSq35zOqtxe13dA9kAtiYBPrBkEENpPGAnn1nzRDaWH6SMZwXEovRUtLp0jwg
         JlzA==
X-Gm-Message-State: AOJu0YyxOKsXh2EVsrcjxg32+zrbm87QDm/hq2U3VDoV/mI8gQZY6HXZ
	BFBfoPNYJ+9Zqcr/8425ekjfTOGNpdE2psYKT12e4Y+x3d2wPVjx+a9l5Y0Ses8=
X-Google-Smtp-Source: AGHT+IG9PBVRz0dQ2rSoN//HLB0yJeK1aumb6sZ9GfxpHdrXQd5I8uNEgskVud+OAnrofzcNMPxNJA==
X-Received: by 2002:a05:6000:18a4:b0:337:c4ec:9d55 with SMTP id b4-20020a05600018a400b00337c4ec9d55mr3341615wri.132.1705999453016;
        Tue, 23 Jan 2024 00:44:13 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id cp9-20020a056000400900b003392ded41c7sm6371364wrb.39.2024.01.23.00.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 00:44:12 -0800 (PST)
Message-ID: <a2c64a9f-4467-44ef-a13d-0af80abf4dfd@linaro.org>
Date: Tue, 23 Jan 2024 08:44:10 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] arm64: dts: exynos: gs101: define USI8 with I2C
 configuration
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: andi.shyti@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 andre.draszik@linaro.org, semen.protsenko@linaro.org,
 willmcvicker@google.com, kernel-team@android.com
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
 <20240119111132.1290455-8-tudor.ambarus@linaro.org>
 <9d12f4f9-1892-48f3-b8d1-8f59788cc91d@linaro.org>
 <6ddbf20c-6929-4cb0-9fdb-570cc7170b9c@linaro.org>
 <7fdc00e1-0a93-43a6-8fb6-c447ad8aef64@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <7fdc00e1-0a93-43a6-8fb6-c447ad8aef64@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/23/24 08:39, Krzysztof Kozlowski wrote:
> On 23/01/2024 09:34, Tudor Ambarus wrote:
>>
>>
>> On 1/23/24 07:52, Krzysztof Kozlowski wrote:
>>> On 19/01/2024 12:11, Tudor Ambarus wrote:
>>>> USI8 I2C is used to communicate with an eeprom found on the battery
>>>> connector. Define USI8 in I2C configuration.
>>>>
>>>> USI8 CONFIG register comes with a 0x0 reset value, meaning that USI8
>>>> doesn't have a default protocol (I2C, SPI, UART) at reset. Thus the
>>>> selection of the protocol is intentionally left for the board dts file.
>>>
>>> ... and dropped, because this patch does not build:
>>> https://krzk.eu/#/builders/29/builds/3869
>>> and I missed weird dependency mentioned in cover letter:
>>>
>>> "This patch set shall be queued after the cmu_misc clock name fixes from:"
>>>
>>> Sorry, this cannot work like that. DTS for new features cannot build
>>> depend on driver changes.
>>
>> No worries. What shall I do so that you re-consider the dropped patches?
>> I'm not yet familiar with your release management, but I guess that if
>> you submit your "fixes-clk" branch for integration into v6.8-rc2, and
>> then merge v6.8-rc2 into your "next/dt64", you'll then be able to queue
>> the dropped patches as well.
> 
> It is nothing specific to my release management but years old rule: DTS
> branch cannot contain driver commits. It is nothing new, discussed on
> mailing lists for various SoC architectures many times.

Okay, thanks for the explanation.

> 
> However I don't fully understand why that dependency - except patch hunk
> context - exists. You shouldn't have such dependency.
> 

Let me try offline, I'll get back to you.

