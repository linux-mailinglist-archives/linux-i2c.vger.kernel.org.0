Return-Path: <linux-i2c+bounces-11465-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9CDAD934A
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 18:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB0251888F1E
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 16:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20F621B9E5;
	Fri, 13 Jun 2025 16:56:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69950211476;
	Fri, 13 Jun 2025 16:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749833761; cv=none; b=E9tyYpRiv6EH6yXOtdsphLasWy2wt+lpUZyB0dcD8IH1r5RXm2z/nEoTSaTFNg6x39l0XfW55Romsakc9pxFi2Sm5Gzpl8XSM6TBwZ5x5Ok0xfPO9eAywTKEZXY8xkTXf1ntYO7ma5vorrm9R3FjweHFJ4VMhbF6tb83CiMBQg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749833761; c=relaxed/simple;
	bh=FOdKOxiJZ2/SG1w79e7BZqr7n17OwPwEdtWDqq4NXw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPx6Ind9NU6ohdEqiBwBj5MhsxaweDsFodXWa0tpawdE3bm+oDI3bQJ0R2XUznL0UAjNwY4J01gNotcoAh9mBP4Hm1VJQZ8uap9XNinb0O1rKqT6xBGzY2EhiC74zQheFXnTJhOfIxDTVWkHCZoeW6WkpDRczhLUHgPrTmTX+iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B7C21C0A;
	Fri, 13 Jun 2025 09:55:38 -0700 (PDT)
Received: from [10.57.28.131] (unknown [10.57.28.131])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1F523F66E;
	Fri, 13 Jun 2025 09:55:53 -0700 (PDT)
Message-ID: <7ffe2c8a-1433-4adf-9786-ee0a9d2f3867@arm.com>
Date: Fri, 13 Jun 2025 17:55:52 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] iommu/apple-dart: Drop default ARCH_APPLE in
 Kconfig
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
 <20250612-apple-kconfig-defconfig-v1-7-0e6f9cb512c1@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-7-0e6f9cb512c1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-12 10:11 pm, Sven Peter wrote:
> When the first driver for Apple Silicon was upstreamed we accidentally
> included `default ARCH_APPLE` in its Kconfig which then spread to almost
> every subsequent driver. As soon as ARCH_APPLE is set to y this will
> pull in many drivers as built-ins which is not what we want.
> Thus, drop `default ARCH_APPLE` from Kconfig.

Acked-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>   drivers/iommu/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 0a33d995d15dd759eb47705c00b411f1157b408a..91d0c871acc418ac5fede4f177ce3af97aef5560 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -305,7 +305,6 @@ config APPLE_DART
>   	depends on !GENERIC_ATOMIC64	# for IOMMU_IO_PGTABLE_DART
>   	select IOMMU_API
>   	select IOMMU_IO_PGTABLE_DART
> -	default ARCH_APPLE
>   	help
>   	  Support for Apple DART (Device Address Resolution Table) IOMMUs
>   	  found in Apple ARM SoCs like the M1.
> 


