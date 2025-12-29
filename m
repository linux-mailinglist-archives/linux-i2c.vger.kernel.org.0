Return-Path: <linux-i2c+bounces-14851-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D89BCE7C9E
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 19:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87FB83016CD0
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 18:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6CB241696;
	Mon, 29 Dec 2025 18:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="t2wdZ+4w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574901D95A3
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 18:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767031348; cv=none; b=tJoC56Y3/VVfePOKRT8OhWT6TCycUUaUuv46fJJDw9OBxmFp2KuxGEi8NulmT/h/OC1C20i3Kumvt4dPEvozDugoLND83BiUoQNceuY0O9PI9uqKcIhtr2r31OK7LKIYDOiF9sBd9V6oFq6UDfafQhDErxJfjK2HakebD2TPATE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767031348; c=relaxed/simple;
	bh=Wq4FNyNXdL2dOO4wrLWKkEOSeqpU9XuvsacZ1Is3UGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2eoerhzK2+2VNeKZlMkH5KXa5UA+WmmRzzMGNX7f9hJ+3G3sLr9kcsPnSkHgV7hwVudNkr5/3hF0C5yYziE/Fzo9AX/W5Z0iJM6tbgkCIZU0VzvR3zu/hqUo8v0aJKdVHFSJ82CF91zGjxRCjqohxjOvvUadBkwHUmBooiNZqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=t2wdZ+4w; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88888c41a13so118393366d6.3
        for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 10:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767031345; x=1767636145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xDy1M86lySMiZB+6e+NfnSGr5v4JHWbEjB5Zb9z5vPo=;
        b=t2wdZ+4w7Ajz9fevd3tA4lUf7mV2qblpu2vBsU0ua3j5homu2HKBkWKh9wqHlG8Y8g
         rVMsep/LABt5BBO3IcpeuuMFidISDOcw/xMp53tE6lmr+G3HNFx6Z/apYh3HWMruQ2ru
         Uk4ppvmmIGOOB3vfa3zfKTgRh/lltcPtlgd3wNKuzGHJ0s66P0BAhMGBZRrOFqcWLtNj
         zSxioC9zTU92v8EaPz6Q2O0P2qGYDlRmrXmXkTvOYNIOm0Hm7ep5HqVbSFS65XuFAZpo
         bWwZ3r6zlncjEBGD015G3GZwpKOWFLTAQ5ytNnJX8n4wgl6SvwEstNcDvzCr/VhRSd70
         8Aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767031345; x=1767636145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDy1M86lySMiZB+6e+NfnSGr5v4JHWbEjB5Zb9z5vPo=;
        b=d0gGtqJa0uTKY/WdRz/zAdWJB5Zig+4ZGg3bEChUx9Jh1BINk3EM6VUAUwlQLFnqNa
         3fxLEoSMJciODAy1zEimb70+e6dmlZbzNpb7ys5E8PtDJC2Az6uP/+9oOk9yTSoW9JS1
         1QKtuylC/gCji08CFM+Kz7qGmabv1J26R3Al5mHQv6rDhIl7Loql0gRUoCgcpALQAv87
         CfG15FrKJ6WezF6KALMzkDnMSvj+XZ2nChgOxav6vl0E4AuSHzRbnZYyZRT6IQrueha7
         6dzz6s420k748O/S1Jqebczv7Ho0DXXx0WXZt1ICVWAIUsF93XHn/ifCJEHQFBue7N5w
         X2+w==
X-Forwarded-Encrypted: i=1; AJvYcCW7dB6rNz07Mbe5yIQnvztW+o9xEIxeYo34n8sLhklpetvKxtmf3eLPLPDxIdqpz//L/ZcfmibDIqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIxTDhXVHBzprBhEgIfyzmZoGGaoDC/+rQiCdCCCiXQXm2C1o3
	wcQT/WRPzWCapgRKTc5fMoSDAA2JN58bT8tadMiSm6MXILDTMRIWQ5JcNLeC50aWX/E=
X-Gm-Gg: AY/fxX4qlsdCi32CbBkDM4i3h+OaEngCOs78goxTxKYV8Lv8NS9n9bEBaMvVHcBaxgz
	IfsoxQC7kQW0byPJXQ8M6n4Maa1uvTPGF/sDb7gBgP2uHaeaex4WYW+8AgQCF7MgX3Y4gdEu+dA
	6UnmkDiJc4wtpLzjnACkdSLeFO7PQ5UbT7BlPKqgGMuAG3cpe5m2VAZHuY9QqeEjev93qxx0DQd
	b7tRzK31GbF3dITWVc+NcjQbx2ZInpQVf/UklnJGIjm3fR2WZxomC5ac5YRHixFqfLwlWyc5sKS
	rrENJeGrmraCtlQgsthhw1wQ61a+KGnJGpmmfpNmNEDnCAdB1UoVn+n2J+32A5Xqrveukhu40m3
	RrW3as+vsGPkjc6HgBDOaouV1WfLJKj1C0K2t3tNe4rusxm17rHrcq8FqPnWe1+p3Gky9pbCUDH
	myqrxSt0d9gKTI6ZHCC3NzNtiOrw==
X-Google-Smtp-Source: AGHT+IGXtGMT6O6A6KaQIdzPXBUgINz+WinbQ4cwEL4NneioBCpZL0bLeOv1X+9oO0ye3ANqbf5YQw==
X-Received: by 2002:a05:6214:3a83:b0:888:7d0a:18db with SMTP id 6a1803df08f44-88d83a78234mr548804566d6.48.1767031345078;
        Mon, 29 Dec 2025 10:02:25 -0800 (PST)
Received: from [10.211.55.5] ([209.81.125.20])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997ada77sm231925916d6.37.2025.12.29.10.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 10:02:24 -0800 (PST)
Message-ID: <4c7c0f69-4732-4f62-970a-2a9273b3b5c7@riscstar.com>
Date: Mon, 29 Dec 2025 12:02:23 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] rtc: spacemit: default module when MFD_SPACEMIT_P1
 is enabled
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
 <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
 <202512251653368b33c7e7@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <202512251653368b33c7e7@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/25/25 10:53 AM, Alexandre Belloni wrote:
> On 25/12/2025 15:46:33+0800, Troy Mitchell wrote:
>> The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
>> caused it to be built-in automatically whenever the PMIC support was
>> set to y.
>>
>> This is not always desirable, as the RTC function is not required on
>> all platforms using the SpacemiT P1 PMIC.
> 
> But then, can't people simply change the config? I don't feel like
> this is an improvement.

It's not an improvement for people who want to use the SpacemiT
P1 PMIC, but it's an improvement for all the other RISC-V builds
using "defconfig" that would rather have that support be modular
to avoid needlessly consuming resources.

I haven't done any testing on this but it looks fine to me.

Acked-by: Alex Elder <elder@riscstar.com>

I think it's a small change worth merging.  I don't think
doing so does any harm.  Your call or course, Alexandre.

					-Alex

>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>>   drivers/rtc/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>> index 50dc779f7f983074df7882200c90f0df21d142f2..53866493e9bbaf35ff0de85cbfe43e8343eadc1e 100644
>> --- a/drivers/rtc/Kconfig
>> +++ b/drivers/rtc/Kconfig
>> @@ -410,7 +410,7 @@ config RTC_DRV_SPACEMIT_P1
>>   	tristate "SpacemiT P1 RTC"
>>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>>   	depends on MFD_SPACEMIT_P1
>> -	default MFD_SPACEMIT_P1
>> +	default m if MFD_SPACEMIT_P1
>>   	help
>>   	  Enable support for the RTC function in the SpacemiT P1 PMIC.
>>   	  This driver can also be built as a module, which will be called
>>
>> -- 
>> 2.52.0
>>
> 


