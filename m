Return-Path: <linux-i2c+bounces-11464-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5294CAD932F
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 18:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 762B6189AFBF
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 16:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07C52135BC;
	Fri, 13 Jun 2025 16:50:29 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3D715A87C;
	Fri, 13 Jun 2025 16:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749833429; cv=none; b=IENNzv0tPurCN5Zt8ngXn6ZEvX3ZK2ZazGkX9eRj13U+my5lW5pYZmmo7ehLNqZUOgxiLwo1EmYU0YfxTazx/oyhbtsajBcCb5MHjPH6PBKvwpEhue+mv9Viy9SX3fD5P97Fkl3k3FwbyK9WCTwC7ACXBgw4kAso31KFueY9fM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749833429; c=relaxed/simple;
	bh=7bhRMmk/rqBBya6D/yZgVdiqWytle+3/P0OHnRbqkE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9Km91Li3RINnrlUSYGRvoP9flskxbcRRSwuhJp3LGl+mR6dW6R1bRQCodnsBfLe6ITnEhgMTNU5hne8QrOwBdVR/03OMy3UzoPkvM+GjhtRFxoOPEyBU42bD0lUAFimVPMZDFnhBVQIQYsPrcwGaHTaS3kwrS2T++aSahi9Lpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B22231C0A;
	Fri, 13 Jun 2025 09:50:06 -0700 (PDT)
Received: from [10.57.28.131] (unknown [10.57.28.131])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 534A23F673;
	Fri, 13 Jun 2025 09:50:22 -0700 (PDT)
Message-ID: <2e022f4e-4c87-4da1-9d02-f7a3ae7c5798@arm.com>
Date: Fri, 13 Jun 2025 17:50:20 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] arm64: defconfig: Enable Apple Silicon drivers
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, =?UTF-8?Q?Martin_Povi=C5=A1er?=
 <povik+lin@cutebit.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
 <20250612-apple-kconfig-defconfig-v1-11-0e6f9cb512c1@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-11-0e6f9cb512c1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-12 10:11 pm, Sven Peter wrote:
> Enable drivers for hardware present on Apple Silicon machines.
> The power domain and interrupt driver should be built-it since these are
> critical for the system to boot, the rest can be build as modules.

Nit: I'd be tempted to put this patch first, just in case anyone 
bisecting with "make defconfig" in their process lands in the middle and 
suddenly loses some drivers (although arguably them going from "=y" to 
"=m" could still be a surprise, but at least a bit less so).

[...]
> @@ -1504,6 +1520,7 @@ CONFIG_ARCH_TEGRA_194_SOC=y
>   CONFIG_ARCH_TEGRA_234_SOC=y
>   CONFIG_TI_PRUSS=m
>   CONFIG_OWL_PM_DOMAINS=y
> +CONFIG_APPLE_PMGR_PWRSTATE=y

If this is critical for any Apple platform to work then it would 
probably make sense to explicitly select it from ARCH_APPLE, as is done 
for APPLE_AIC...

>   CONFIG_RASPBERRYPI_POWER=y
>   CONFIG_IMX_SCU_PD=y
>   CONFIG_QCOM_CPR=y
> @@ -1567,6 +1584,7 @@ CONFIG_QCOM_PDC=y
>   CONFIG_QCOM_MPM=y
>   CONFIG_TI_SCI_INTR_IRQCHIP=y
>   CONFIG_TI_SCI_INTA_IRQCHIP=y
> +CONFIG_APPLE_AIC=y

...which I think means this would already be redundant.

Thanks,
Robin.

>   CONFIG_RESET_GPIO=m
>   CONFIG_RESET_IMX7=y
>   CONFIG_RESET_QCOM_AOSS=y
> @@ -1640,6 +1658,7 @@ CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
>   CONFIG_NVIDIA_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
>   CONFIG_MESON_DDR_PMU=m
>   CONFIG_NVMEM_LAYOUT_SL28_VPD=m
> +CONFIG_NVMEM_APPLE_EFUSES=m
>   CONFIG_NVMEM_IMX_OCOTP=y
>   CONFIG_NVMEM_IMX_OCOTP_ELE=m
>   CONFIG_NVMEM_IMX_OCOTP_SCU=y
> 


