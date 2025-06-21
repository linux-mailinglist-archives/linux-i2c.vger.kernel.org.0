Return-Path: <linux-i2c+bounces-11545-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CED9AE2A13
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Jun 2025 18:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D6B93AEB20
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Jun 2025 16:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83EF21FF2C;
	Sat, 21 Jun 2025 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uDwXevel"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51193134CF;
	Sat, 21 Jun 2025 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750521703; cv=none; b=Km6J8Vt3A4mZ5EuXrinObRvwKiCPhPmOB9kpcO1ZrQRJDISTM6/XeTPrtNia16NcYe0ipGiMNj6nsrwnmM/qSSuVuJuesiytxJcJgvETf7WW5DF8tvN6XRLBEPYY5P8F8hkpkQJ880OlWNRGKMRZ6utt1xe8qJWibZJluI8LyTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750521703; c=relaxed/simple;
	bh=7z06BI2WfCKHgocG5mZp+KFS5XZpvyaukvIGuVj/RlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F9FTd7ICjmVh1PnwdvbZLUw2TwCOGk/CSfVT7resyUV9W7rUOFgM5OPUaQ/beboDwo5j6orFxcCPpckjuDmvXYOq2MPu+7fLQzcIj62zuKiZuwWOJc9PaAKveVeNx3b9vIObzk+bPy4xPTXMRQ/XELjTL/CYwsqsvzzQXxcOFxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uDwXevel; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3502C4CEE7;
	Sat, 21 Jun 2025 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750521701;
	bh=7z06BI2WfCKHgocG5mZp+KFS5XZpvyaukvIGuVj/RlU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uDwXevel3/1jiq4Sl2EDKgEHARqYuu8Bl7nrJLZ8lUCzHpBkeoumIp6jzt/ZP4Nsl
	 wqLBEHqbQv7BeGHwV/DPP5ckgANF6VbYI5AyU+Yd7Skc57x9V4PhZEjE744+ExYRFr
	 AkERmpzc03BtzkqT5tG8hywtOyMFB4oMbjoTgSssty33EMxdWKqHIONBBQ3NX56YP1
	 1s66LaJ7sUP5cIPW3qhTCIyNXnqk1AvoKqeUz+bq+RtWlN5ktVenNOvVQfcXtnbR0P
	 yISLwmztKCaQ6JNWVfJn38zjoEhxBT4pRdcGegeMhL6zVqHpjw3aesU2v9O/kMhLww
	 W9a4U4D46RlpQ==
Message-ID: <d5a616f3-67a3-4504-904e-6cec503ab157@kernel.org>
Date: Sat, 21 Jun 2025 18:01:33 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] arm64: defconfig: Enable Apple Silicon drivers
To: Robin Murphy <robin.murphy@arm.com>
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
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <2e022f4e-4c87-4da1-9d02-f7a3ae7c5798@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13.06.25 18:50, Robin Murphy wrote:
> On 2025-06-12 10:11 pm, Sven Peter wrote:
>> Enable drivers for hardware present on Apple Silicon machines.
>> The power domain and interrupt driver should be built-it since these are
>> critical for the system to boot, the rest can be build as modules.
> 
> Nit: I'd be tempted to put this patch first, just in case anyone 
> bisecting with "make defconfig" in their process lands in the middle and 
> suddenly loses some drivers (although arguably them going from "=y" to 
> "=m" could still be a surprise, but at least a bit less so).

Ah, that's a good point that I hadn't even thought about.
Now that most of these have already been merged into different trees 
that ship has sailed though.

> 
> [...]
>> @@ -1504,6 +1520,7 @@ CONFIG_ARCH_TEGRA_194_SOC=y
>>   CONFIG_ARCH_TEGRA_234_SOC=y
>>   CONFIG_TI_PRUSS=m
>>   CONFIG_OWL_PM_DOMAINS=y
>> +CONFIG_APPLE_PMGR_PWRSTATE=y
> 
> If this is critical for any Apple platform to work then it would 
> probably make sense to explicitly select it from ARCH_APPLE, as is done 
> for APPLE_AIC...


Documentation/kbuild/kconfig-language.rst:

   select should be used with care. select will force a symbol to a value
   without visiting the dependencies. By abusing select you are able to
   select a symbol FOO even if FOO depends on BAR that is not set. In
   general use select only for non-visible symbols (no prompts anywhere)
   and for symbols with no dependencies. That will limit the usefulness
   but on the other hand avoid the illegal configurations all over.


That's probably fine for APPLE_AIC which only depends on ARM64 (and 
ARCH_APPLE) which is guaranteed to be set when ARCH_APPLE is set anyway.
APPLE_PMGR_PWRSTATE also has an additional dependency on PM so it should 
probably remain in defconfig and not use select.


>>   CONFIG_RASPBERRYPI_POWER=y
>>   CONFIG_IMX_SCU_PD=y
>>   CONFIG_QCOM_CPR=y
>> @@ -1567,6 +1584,7 @@ CONFIG_QCOM_PDC=y
>>   CONFIG_QCOM_MPM=y
>>   CONFIG_TI_SCI_INTR_IRQCHIP=y
>>   CONFIG_TI_SCI_INTA_IRQCHIP=y
>> +CONFIG_APPLE_AIC=y
> 
> ...which I think means this would already be redundant.

Yup, this can be dropped.


Thanks,

Sven


