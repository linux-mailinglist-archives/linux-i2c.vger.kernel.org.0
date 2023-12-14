Return-Path: <linux-i2c+bounces-789-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D4C813132
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 14:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 734C21F21DDD
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 13:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7CB55778;
	Thu, 14 Dec 2023 13:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UzoQm5/j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D668C11B
	for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 05:19:25 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a1f37fd4b53so1004037966b.1
        for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 05:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702559964; x=1703164764; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hs3nbf7IHgswwMuxAfVtH00znSWNLiiUoU/HIKm76XY=;
        b=UzoQm5/jCaf4naVdH8qpZ6PSpAFccp+JfPw1ern22sFkCVqisU8DPeZDeqsR8EEfc6
         3Mdu4k8CC0XlR+54ifUqYW76hjgDjOGVGGdUi0o6IQQyyZMNO0VeMX80/Ayz4GWZ0qTD
         eCL33j/y0ThkwsGAwbTEpQVVqVVgpHIBGKLkKXobi6wypKLlxVUy07shE/2oJSBQDE99
         s5hh6MKU4BsT2OEuM5fxuv2zEBnk+WIANGtPOnj3GR2n5fT7UXi+0wNNIjm+v3hra02l
         wnTqwKM+pZRtN5Nhkp+J97CNZneR7b3hto3dSvF6B1z9eq1Wy6VyIUClxvAO8rQ9SwLQ
         k5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702559964; x=1703164764;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hs3nbf7IHgswwMuxAfVtH00znSWNLiiUoU/HIKm76XY=;
        b=WC5lzQybL/4cg9hjHmJ91IbJJxr9BgjgUIbr0cTI+jNQZfHIrwnk5n5cvcmy1Vji2v
         3CT7q7VkKig4N9GwLH3rzn2s4vek5W6nuYku5wsna773aYv8Ym21ZPnWexxz0msIwloa
         HZ57j6DJ5d3ZRMGrbatpWFYPYL557K/JnFC6hRgtzo6jZhGh5qkY++ARwL+2dodWA9UV
         1nCcNytxv/ahNMWeZ3orfebf0nRsZhOauqAYUnE8SWvNdFs6JFmHO+FyCngnIZYCZhSq
         kbQtx3zURRapKfWS4EbvfpFwGNkFN578BahXhx9HOpSqRDRQ9YSVAHtS2RgmHJ9LdIVW
         MwPw==
X-Gm-Message-State: AOJu0YwLpfD78GHqvSAyEbhZJ6GG485X7snvnvyCMnB4dEN5oxuLUv51
	l8pqPVqBteGRMeKDRLseXbPMXA==
X-Google-Smtp-Source: AGHT+IH40oOO/VEtiD6FtA4nZx2Bo4oVjzCdEsBKS0QGgaOD15dYXbplxEWDbdeFuSCk0e9n7hNXdA==
X-Received: by 2002:a17:906:3f5c:b0:a1d:4f5c:57f5 with SMTP id f28-20020a1709063f5c00b00a1d4f5c57f5mr4915283ejj.78.1702559964212;
        Thu, 14 Dec 2023 05:19:24 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id r25-20020a170906351900b00a1cc1be1146sm9332509eja.217.2023.12.14.05.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 05:19:23 -0800 (PST)
Message-ID: <93969025-606c-4e4c-9cbc-3c8351f95adb@linaro.org>
Date: Thu, 14 Dec 2023 14:19:21 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] arm64: defconfig: sync with savedefconfig
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 andi.shyti@kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 saravanak@google.com, William McVicker <willmcvicker@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
 <20231214105243.3707730-13-tudor.ambarus@linaro.org>
 <1153987b-a818-454a-a292-57f2b3898771@app.fastmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1153987b-a818-454a-a292-57f2b3898771@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/12/2023 13:08, Arnd Bergmann wrote:
> On Thu, Dec 14, 2023, at 11:52, Tudor Ambarus wrote:
>> Sync the defconfig with savedefconfig as config options
>> change/move over time.
>>
>> Generated with the following commands:
>> make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig
>> make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- savedefconfig
>> cp defconfig arch/arm64/configs/defconfig

These are obvious. You cannot do it differently.

>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  arch/arm64/configs/defconfig | 144 +++++++++++++----------------------
>>  1 file changed, 55 insertions(+), 89 deletions(-)
> 
> I usually ask for defconfig changes to be merged when someone just
> adds a single line per patch, but a 144 line change is clearly too
> big, please split this up.

Anyway this should not go via my tree, because of possible conflicts.
This commit, so the savedefconfig, must be prepared on linux-next, which
should be mentioned in changelog for example. It also is not related to
this patchset.

> 
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index b60aa1f89343..09fb467303ba 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -30,6 +30,8 @@ CONFIG_SCHED_AUTOGROUP=y
>>  CONFIG_BLK_DEV_INITRD=y
>>  CONFIG_KALLSYMS_ALL=y
>>  CONFIG_PROFILING=y
>> +CONFIG_KEXEC_FILE=y
>> +CONFIG_CRASH_DUMP=y
>>  CONFIG_ARCH_ACTIONS=y
>>  CONFIG_ARCH_SUNXI=y
>>  CONFIG_ARCH_ALPINE=y
>> @@ -77,9 +79,6 @@ CONFIG_ARM64_VA_BITS_48=y
>>  CONFIG_SCHED_MC=y
>>  CONFIG_SCHED_SMT=y
>>  CONFIG_NUMA=y
>> -CONFIG_KEXEC=y
>> -CONFIG_KEXEC_FILE=y
>> -CONFIG_CRASH_DUMP=y
>>  CONFIG_XEN=y
>>  CONFIG_COMPAT=y
>>  CONFIG_RANDOMIZE_BASE=y
> 
> These two hunks seem to go together, but it needs an explanation
> why you are removing CONFIG_KEXEC.
> 
>> @@ -119,7 +118,6 @@ CONFIG_KVM=y
>>  CONFIG_JUMP_LABEL=y
>>  CONFIG_MODULES=y
>>  CONFIG_MODULE_UNLOAD=y
>> -CONFIG_IOSCHED_BFQ=y
>>  # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>>  # CONFIG_COMPAT_BRK is not set
>>  CONFIG_MEMORY_HOTPLUG=y
> 
> No, I definitely want CONFIG_IOSCHED_BFQ=y, it is essential
> for performance on certain classes of machines. It would
> be better to drop the 'imply IOSCHED_BFQ' in two Kconfig
> files.
> 
>> @@ -129,8 +127,6 @@ CONFIG_MEMORY_FAILURE=y
>>  CONFIG_TRANSPARENT_HUGEPAGE=y
>>  CONFIG_NET=y
>>  CONFIG_PACKET=y
>> -CONFIG_UNIX=y
>> -CONFIG_INET=y
>>  CONFIG_IP_MULTICAST=y
>>  CONFIG_IP_PNP=y
>>  CONFIG_IP_PNP_DHCP=y
> 
> These also seem kind of essential for almost any machine,
> I assume you are doing something wrong here.

Yep. I think the folks forget the rule not to remove user-selectable
options :/

> 


...

> 
>>  CONFIG_SLIM_QCOM_NGD_CTRL=m
>> -CONFIG_INTERCONNECT=y
>>  CONFIG_INTERCONNECT_IMX=y
>>  CONFIG_INTERCONNECT_IMX8MM=m
>>  CONFIG_INTERCONNECT_IMX8MN=m
> 
> I think the problem here are some Tegra device drivers that
> incorrectly 'select INTERCONNECT' rather than using the
> 'depends on' that every other interconnect driver has.
> Please fix those instead.

In current setup interconnect is user-selectable, so it must not be removed.

Best regards,
Krzysztof


