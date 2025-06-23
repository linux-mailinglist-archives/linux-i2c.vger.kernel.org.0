Return-Path: <linux-i2c+bounces-11553-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAA1AE3DF8
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Jun 2025 13:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8DC03B2F05
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Jun 2025 11:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBE123E359;
	Mon, 23 Jun 2025 11:33:20 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E151E3DCD;
	Mon, 23 Jun 2025 11:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678400; cv=none; b=sSHr0DKaQMSvCrvbZGX+vJK+LCTaygozefEdCKXn+A90+EI59W7Q6y/JIrzftDfoxOzB9oeP8RWP27/Y53CthpIXjnBTH4CZbFOnfz99LPi5GBEBknYWyJcCh0DbmT8cOqRWly7ocXYY1gX8LkTvq37qWzR0MspdiPzEfocuSyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678400; c=relaxed/simple;
	bh=4Byfl6XKyk9PR8pgbpDrhICsoDtDHYLEMWWU/ZfABpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFFOAX5sBw7ZitT8FFS/rxyQmfgqjM001vTetZnawD+2toYhsyJT/ek0jnS5NWN7d9NRb8uZSkeufffqT0KIypWoJXlJbtqZseeEFRRYe8ZAwccECwkVOnshmYSmLu+AMpHM4sNPlrxsMhAKR7dSrOaLMQpT3uJXGS46o4pOeGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43268113E;
	Mon, 23 Jun 2025 04:32:58 -0700 (PDT)
Received: from [10.57.29.116] (unknown [10.57.29.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3092E3F66E;
	Mon, 23 Jun 2025 04:33:12 -0700 (PDT)
Message-ID: <9f80f7c4-01a3-4a03-94dc-2a19136707f8@arm.com>
Date: Mon, 23 Jun 2025 12:33:03 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] arm64: defconfig: Enable Apple Silicon drivers
To: Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>, linux-kernel@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, Neal Gompa <neal@gompa.dev>,
 linux-clk@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-i2c@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, =?UTF-8?Q?Martin_Povi=C5=A1er?=
 <povik+lin@cutebit.org>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, iommu@lists.linux.dev,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Andi Shyti <andi.shyti@kernel.org>, Will Deacon <will@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
 <20250612-apple-kconfig-defconfig-v1-11-0e6f9cb512c1@kernel.org>
 <2e022f4e-4c87-4da1-9d02-f7a3ae7c5798@arm.com>
 <d5a616f3-67a3-4504-904e-6cec503ab157@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <d5a616f3-67a3-4504-904e-6cec503ab157@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-06-21 5:01 pm, Sven Peter wrote:
> On 13.06.25 18:50, Robin Murphy wrote:
>> On 2025-06-12 10:11 pm, Sven Peter wrote:
>>> Enable drivers for hardware present on Apple Silicon machines.
>>> The power domain and interrupt driver should be built-it since these are
>>> critical for the system to boot, the rest can be build as modules.
>>
>> Nit: I'd be tempted to put this patch first, just in case anyone 
>> bisecting with "make defconfig" in their process lands in the middle 
>> and suddenly loses some drivers (although arguably them going from 
>> "=y" to "=m" could still be a surprise, but at least a bit less so).
> 
> Ah, that's a good point that I hadn't even thought about.
> Now that most of these have already been merged into different trees 
> that ship has sailed though.

Yeah, like I say it's only minor and rather contrived anyway. Not a big 
worry.

>> [...]
>>> @@ -1504,6 +1520,7 @@ CONFIG_ARCH_TEGRA_194_SOC=y
>>>   CONFIG_ARCH_TEGRA_234_SOC=y
>>>   CONFIG_TI_PRUSS=m
>>>   CONFIG_OWL_PM_DOMAINS=y
>>> +CONFIG_APPLE_PMGR_PWRSTATE=y
>>
>> If this is critical for any Apple platform to work then it would 
>> probably make sense to explicitly select it from ARCH_APPLE, as is 
>> done for APPLE_AIC...
> 
> 
> Documentation/kbuild/kconfig-language.rst:
> 
>    select should be used with care. select will force a symbol to a value
>    without visiting the dependencies. By abusing select you are able to
>    select a symbol FOO even if FOO depends on BAR that is not set. In
>    general use select only for non-visible symbols (no prompts anywhere)
>    and for symbols with no dependencies. That will limit the usefulness
>    but on the other hand avoid the illegal configurations all over.
> 
> 
> That's probably fine for APPLE_AIC which only depends on ARM64 (and 
> ARCH_APPLE) which is guaranteed to be set when ARCH_APPLE is set anyway.
> APPLE_PMGR_PWRSTATE also has an additional dependency on PM so it should 
> probably remain in defconfig and not use select.

Sorry if the implication wasn't clear, but I did mean "select it" in the 
sense of "select it and all of its necessary dependencies in a manner 
that works correctly". The same argument applies all the way down - if a 
!PM config will not be able to boot on ARCH_APPLE platforms due to 
forcibly deselecting APPLE_PMGR_PWRSTATE, then there is little point in 
permitting that combination. Which of course the user would already have 
to disable at least ARCH_MXC, ARCH_ROCKCHIP, ARCH_TEGRA and 
ARCH_VEXPRESS to achieve in the first place ;)

Thanks,
Robin.

