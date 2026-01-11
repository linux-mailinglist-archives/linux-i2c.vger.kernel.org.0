Return-Path: <linux-i2c+bounces-15028-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F661D0FB9A
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jan 2026 20:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DCB1304F15E
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jan 2026 19:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060A0352FBB;
	Sun, 11 Jan 2026 19:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Dwl50Ziz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2111134B1A0
	for <linux-i2c@vger.kernel.org>; Sun, 11 Jan 2026 19:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768161487; cv=none; b=dSaIXVfivxmeDEwgIQnjxF3ZjIv5ylJxbwG6ly7/DD5TBMWcazp7zzUI2GcjcbKC3EOEp9Rcz0MHkclu5HGYPv0IGh+7YJ5uKLSocn7dshU4Y7FukQwsNvoWiV/CoE1PSd+gmqTKnxzyCKx6xaTJEwCydxqxxcPD2u/QBJFgiz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768161487; c=relaxed/simple;
	bh=z/9aym3YtgfCN06pEMgzSWhuMz1pnW2LST7SY6XR2LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hh0+30V3/vmc60gQDVt5+jkzsxCBLm9wPI/iq4RPertU9ATVk3eFS6EzsvGA6XXV9DwD2TH2Z+mlEO8zxuy3M3/03+51wMzhoDLeM8niMUu0BG/t6GRsKAoqKA2rgQUag4TwcPDqhOJq25sd9/BnvDulWo5Ri/SURBgTkL70VRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Dwl50Ziz; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8b2a4b6876fso896295785a.3
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jan 2026 11:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768161484; x=1768766284; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rp7nIV1t3K3PnuJ7T0RnV1mDaWDy2tcwUgBfEvmqexc=;
        b=Dwl50ZizRYphHifgJPOcqzTPN2f5o22/3Hg6GyaX2pP400yqYVD40JF8MWpSSsvnff
         TCrvFVyOBEjCqcn9uma3DYzXrhw0PxFsRUyX/XvycnP0Gm1itqF+XLjG8wtreUXK0ctD
         oAHiAFNM9l/Lgp9CTfyG8GU+GU90o3znJQKGr783w11l8LiKkfCkHkgmeA3rEp/oo/FD
         wexT7QP/ZuUbeQ9jK68gTNcULdfyKQGRgzQQ5iTOw7yxAVC14nmXRtjrcksykif+Mynb
         vaSnRyf1JpUx2XRBRKvzhxQ59NyetMa5pLBTHFCzi4pfxYN3mT3ebSDyW4BnmtOkGi54
         9PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768161484; x=1768766284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rp7nIV1t3K3PnuJ7T0RnV1mDaWDy2tcwUgBfEvmqexc=;
        b=iXr4sx+QDsUZAt2nSZCCpL/Bb7USEui6CIhco72ulVFMJeAG+Ty3m0OyMai3pZz62r
         gGI3SBPHuCC2UPKV0Wkxxx4ORz9MmS7w/hp0ttypFqKOMq3yB5qF2dc1/i9ejStm8O6e
         GJOPOhOuYuSgRddFWn4W9EwwsEg9Gia9HS41OEKHO/hn28fjclRFFYypuz8FQfplD7rj
         zfd37GowUS83uEeGU2EMwZxlpAAo3UDjpvNooE3JY6suxLJTtWm2D/Uzt/Cpey3DUik9
         87VrcealIKVVz0/Uz+SmrSTEK5Oapt1OXBN0WXXB9ZhU3RVWInnqS8j6/iY1NUd6lhcb
         GCLw==
X-Forwarded-Encrypted: i=1; AJvYcCUF+NiUzH5xSUiSL7IlbMwD4rfVzyRv5tklW9tMNKyupf7Tm6NWY44tqWNHyFJADqmgKEfMXIh3Kgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQJTswQbhB9nm5dUCtIRTlD8zKj0PgrrmwL3xhHLQw/p0mXSK4
	yx5Y/Dt941g848ghwsDXVDy0TDly4d4akHA09aWm/szcPRxMx/S4kuU9/qTOI0VTN3o=
X-Gm-Gg: AY/fxX4W+cGhYzMyJ6BDBTtGvkuhlnch/Bxi535ZnAQoO9xjkEouI+3PhAcTcfpGCkZ
	oReRPDBlBQ1YVpc3BmRFOWMTU30S85q9eqPx+5hQko94fphfef7ULE5+qCVqcHwo/SA0lv+NUlK
	kzrNfw0gYJ9GcUeW6auI+NYgwKlUCDAfyWdwbQk6UJx2yzEqgt93iW99LJ90mPBCrxCp5TZ6Pz8
	oxgL/1ZXbWCeqVt2+Et7Bmk9IQoc3lq2qEXSbLNB0dgAjfO6/lsWxAFkBgkCafrDXv9OwTeG4+7
	ZRF90Ju5uC65MYEquTWsnDawjvf8JeWiyrbuZrL2G32TW5F7Zthos3gSyuZhaB2eWBF/o17Ckn/
	m87lDvpCn/QDdH1Ibo+OdTFZPFmv4DUakGFltTaTLCFXPcn65SpJUraNUbyvZ2448sDShGN2CrJ
	nvM1rOHVEjy1qcUa9X3k5UExk/0/7jUSwu0qywhyvniCbK/s6R5zPTluK7C4XV9p4w
X-Google-Smtp-Source: AGHT+IGdzsnyz2r9XcWFhgYQrFdZnMY+NLVEokAuWRYPrckTaify+dIl447b52d76HmKL9FYD5Hb5g==
X-Received: by 2002:a05:620a:4804:b0:8be:8e5a:7a6c with SMTP id af79cd13be357-8c389416effmr2293547585a.73.1768161484118;
        Sun, 11 Jan 2026 11:58:04 -0800 (PST)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f5312d3sm1325432385a.43.2026.01.11.11.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 11:58:03 -0800 (PST)
Message-ID: <efe5c5e8-6b29-47ff-a3cf-9449f03890e6@riscstar.com>
Date: Sun, 11 Jan 2026 13:58:01 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] rtc: spacemit: default module when MFD_SPACEMIT_P1
 is enabled
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
 <20260108-p1-kconfig-fix-v5-3-6fe19f460269@linux.spacemit.com>
 <20260109223839b59ca7ce@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260109223839b59ca7ce@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/26 4:38 PM, Alexandre Belloni wrote:
> On 08/01/2026 16:38:56+0800, Troy Mitchell wrote:
>> The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
>> caused it to be built-in automatically whenever the PMIC support was
>> set to y.
>>
>> This is not always desirable, as the RTC function is not required on
>> all platforms using the SpacemiT P1 PMIC.
>>
>> Acked-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>> Change log in v5:
>> - add Alex's tag
>> - Link to v4: https://lore.kernel.org/all/20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com/
> 
> See my reply on v4, this is still a NAK for me, I don't believe this
> change is necessary as soon as the default for MFD_SPACEMIT_P1 is m.

Yes I have reconsidered what Alexandre was saying and now I
agree with him, I don't believe this patch is required.

					-Alex

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


