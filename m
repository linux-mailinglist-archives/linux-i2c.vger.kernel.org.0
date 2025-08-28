Return-Path: <linux-i2c+bounces-12501-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD9B3A4A2
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 17:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6AC3687828
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 15:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D9124503F;
	Thu, 28 Aug 2025 15:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNk6uiU2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D57B23BD13;
	Thu, 28 Aug 2025 15:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756395453; cv=none; b=DTC4i3IeLsKjcdGJjDrXo9N9FijHsHxOsxtfLQiF2dGmYHlYyFXqle6t3fbycRjFmcxP+m6OHEWp+Dy+UU8i0k748hZdV0BZlrZOIuq1Bpo7YgYV3jJtBSDTOHlTyq4doKfUaVJrmyGyCCrnPlIZafMq9laIRh8MmAf8qfdETvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756395453; c=relaxed/simple;
	bh=Mrk3ByfPhQnPnNdDVnBE4R1Od3ANyJxIXi/JlYCTnJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZTaXr5FWo2j5hciCKrapCAMGqLb9yjjuB9cmVtYMktd4kqOBCxPlBpxWE7sA1K1oDywphtjfdrxMugMa96N0W3XsGupIObXehkgZPqRtWfdmuifXmhZhfKMPOEYtpJWoRaaHLYAv/YKUiugbOxXgCdGiRmUzWe3lmyEVS63FCcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNk6uiU2; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-771e15ce64eso936941b3a.0;
        Thu, 28 Aug 2025 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756395447; x=1757000247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+P2/LhB4az5UcnpNbntgPAeqDLpGiuycc8tsuXRu4jA=;
        b=UNk6uiU2Dl8PijdJnzwIy8miZFlpwGOk3I3JSptlADB59PvW3by/+nD6Rhjp7NlBtC
         eH562vYJaodLF0TVdOEQanvDOeDeW3HCNyIWZa2H65f5W5dCmErqSfT/JCyVXBktASPg
         jRQhzlGTvV9JyyAb4X04anLcwbNF/LRSd/L4PlltrAdEWYvRS81Mmdu1X++Zoaut7VG4
         a798i2ZiNVJDaimd4D1noBOJYbYDbi6/PcnNQhvOjwh9UEVbn9jYg+Siry+xn/UQXeFa
         BudAfYjK6r2MC5no/bCLwwtZxnRu9ZQccgZqRXMVEvz7rmR7zsJJGyDmLSJf6GnUjqQ9
         6bwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756395447; x=1757000247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+P2/LhB4az5UcnpNbntgPAeqDLpGiuycc8tsuXRu4jA=;
        b=U9J+Ly4kFznbyu+gqzh2m7A8KfYabNHhNuSemVI2EQ8nCP5EfC9yDxzwKj0TsrcJTt
         1xFJCqAhrvd3UNBo24TdNwgOfmFsnGYUrOIrxK0HXaPEeDTQeby6q3ZwZz062eywXNHl
         o+Fvr5HzDTAPIjFbqyOZog8i/hOunTI4Gh3TNP0S/or0twTajGNHU6F3L+TOwooJ1QLq
         V63LXkRj+pWL1935M1so+kwQpMOGZRfZyjbh81Agc56jJEXyTvrnUCPkyLtzEimYo0Lb
         H2VVFIK4cgYLl4XUSwcFeIlgAbxpqnZkMtZEAukctdS/jAW5UfZSHaI1LXbu1fT5ps35
         u7ww==
X-Forwarded-Encrypted: i=1; AJvYcCU6PVdpegYrQK3iYuO2iN/84x6HWpjbMZ1A9UO0drmdc4FmkfSrvYmyGNsxn4XvbRIdUm6FVZzDjNzQ8HQ=@vger.kernel.org, AJvYcCUG7Cw8UqIX8cbIkwwwZZ5w6eFBDyZ14P0n4q8gvLLAoE17dKpwd14TxvJK4czeKHCj44Yri43LAriRCH1n@vger.kernel.org, AJvYcCV4btOgjg9+9MsK9y3AHFz1jhcHarHaWMM0AJwe29EGvRHPf3o6Zlj+3gwP1Ag8bl9JF99Wp8APbKRoKcSbCbo=@vger.kernel.org, AJvYcCVvgH8+6RCv9SpY/x/8d9RX7Ra9YLXiP1ay+tnPZ2YgpMlImyJCTGwgqCofKmO+WWZLG2GKL1ChXIo77UbsHbc=@vger.kernel.org, AJvYcCW7HhD2MxGEssG+SJ4r1EmbN2Hq7RkLJA9T0AuhBp9ecLwtJm91wxDLiXlVRP1uSDKmWsDU/Wivq1a6@vger.kernel.org, AJvYcCWLV+QJm1a6wh21Ahv2fsI4z5lCXdKk3PcnKiEy8NlWSHmjE7Hiyx8Xp+OxBbjr83LGHOeMqc5hy3vn@vger.kernel.org, AJvYcCWO5ZuDwDvvyMtuUWz6DumnIDA/UVH6BmS5+IDqSYbBhF9e60YHfrahheYkdbW6vdgbSMwmjNfkHuM=@vger.kernel.org, AJvYcCWx5Tzppjw9OdiqBuNX3IKbJAYZ4jC34wsAMPwubQb7XMWGAy3ZC9/aAVrC3FpG41VvMDfBiwLXv672Iw==@vger.kernel.org, AJvYcCX6qkFBcvjdCJSp2BEW8gqEI2fladNKN0PEsDWGA5r8cQBJSiSQglVcUuvWiSlnTATpIuy3D/0v60jv@vger.kernel.org, AJvYcCXTfCekzSCq2p6nh1Zm
 Dq0dKyn0QGE98O/jj+UQnqJmi5KyZoUvQauK2zlIOwCqZiIOmwusA65oUJ8G@vger.kernel.org, AJvYcCXknl+yjHlH0LNmw74amx0ii49J8XeglElKM4hMvZQvyX4JnCwFqaeR/8irUW0CqOuOZGJkhwOTNVOsJaVrTCz6@vger.kernel.org, AJvYcCXmOb7wIC7edl81gT9hV24vYN8UrN2P6HP4k5k+UJsoTx8k5pc7S2ERFQ5UZPwW94qqjeTZ7yIKtLs5@vger.kernel.org, AJvYcCXxvhXV24QmIo3DAAxe+T8OEr6gxeYLW5RdN+nHORtP2bvpIAFJB+qAWj2DuaXqt4h5nm/sJbS4SsRa@vger.kernel.org
X-Gm-Message-State: AOJu0YzxF+4ZswCGLqePE03JOicu5AyCf5HzTR3LN2gwdS23gq8sEdbl
	GEemoEjTxmWoVMwyTx97kNDvJZi9hKEvGhzcqmUo8IbDONWsmqSTpsyJ
X-Gm-Gg: ASbGnctnym6YTWiLnijSJmXQbeWpXdnn1ycxsn5omAJnWyOBL+GXHGx0Mlljxw6JjM1
	Cb1taNfsAXg3SSs68GYkOAbbIE6B55VcKlIfAtutf37mmw6ksqixv++1VQxwzmnzn2NURkMIwLv
	PM/zDaZAGFlgSMoY8E6Y26J4Zi3aCV1oBUORMitkJHZ9vBXvewaWWepQDHxvEECRDNmLlhyqvd5
	a6/1owSAOJNj8Bg8alJXPmzRi2oCXezvSfb46hsxEgWZc4m4In1YVrQzvwkEnVHsHKzi6rQoQ8c
	1WzNbiiqL+qYPx8qTHpeOZs5QesFTITBBXWzUsI8RWs1GFgk/D9fNC5ugZWIURu3lbvzUNrSZu0
	6hMl1aXaH+p/BpzbEsatXEpUAMM7wvg0Roc0VouikeLu6Rh71A0kRtw==
X-Google-Smtp-Source: AGHT+IHWPJz4T3eAUkqlpAn4hWyOQgAV5tlsRyJx2OB/FgrZwgAy/5EQXkme0CANrGmSuNUApm3xBA==
X-Received: by 2002:a17:903:b4e:b0:246:a4ce:120e with SMTP id d9443c01a7336-246a4ce16damr210428505ad.41.1756395445695;
        Thu, 28 Aug 2025 08:37:25 -0700 (PDT)
Received: from [192.168.1.111] ([59.188.211.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-248a2677f81sm46829295ad.149.2025.08.28.08.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 08:37:24 -0700 (PDT)
Message-ID: <5e0e51db-17ae-483a-bb96-8ab88ad2fbad@gmail.com>
Date: Thu, 28 Aug 2025 23:37:08 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 34/37] arm64: dts: apple: Add initial t6020/t6021/t6022
 DTs
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>,
 Lee Jones <lee@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Michael Turquette <mturquette@baylibre.com>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-nvme@lists.infradead.org
References: <20250828-dt-apple-t6020-v1-0-bb8e1b87edef@jannau.net>
 <20250828-dt-apple-t6020-v1-34-bb8e1b87edef@jannau.net>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250828-dt-apple-t6020-v1-34-bb8e1b87edef@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Janne Grunau 於 2025/8/28 夜晚10:52 寫道:
> From: Hector Martin <marcan@marcan.st>
>
> These SoCs are found in Apple devices with M2 Pro (t6020), M2 Max
> (t6021) and M2 Ultra (t6022) and follow the pattern of their M1
> counterparts.
>
> t6020 is a cut-down version of t6021, so the former just includes the
> latter and disables the missing bits (This is currently just one PMGR
> node and all of its domains.
>
> t6022 is two connected t6021 dies. The implementation seems to use
> t6021 with blocks disabled (mostly on the second die). MMIO addresses on
> the second die have a constant offset. The interrupt controller is
> multi-die aware. This setup can be represented in the device tree with
> two top level "soc" nodes. The MMIO offset is applied via "ranges" and
> devices are included with preproceesor macros to make the node labels
> unique and to specify the die number for the interrupt definition.
>
> Device nodes are distributed over dtsi files based on whether they are
> present on both dies or just on the first die. The only exception is the
> NVMe controller which resides on the second die. Its nodes are in a
> separate file.

There are some outdated / copy pasted from M1-series parts.

>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  arch/arm64/boot/dts/apple/t6020.dtsi           |   22 +
>  arch/arm64/boot/dts/apple/t6021.dtsi           |   69 +
>  arch/arm64/boot/dts/apple/t6022.dtsi           |  347 ++++
>  arch/arm64/boot/dts/apple/t602x-common.dtsi    |  465 +++++
>  arch/arm64/boot/dts/apple/t602x-die0.dtsi      |  577 ++++++
>  arch/arm64/boot/dts/apple/t602x-dieX.dtsi      |  129 ++
>  arch/arm64/boot/dts/apple/t602x-gpio-pins.dtsi |   81 +
>  arch/arm64/boot/dts/apple/t602x-nvme.dtsi      |   42 +
>  arch/arm64/boot/dts/apple/t602x-pmgr.dtsi      | 2268 ++++++++++++++++++++++++
>  9 files changed, 4000 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/apple/t6020.dtsi b/arch/arm64/boot/dts/apple/t6020.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..bffa66a3ffff3fea9e980f2a31f2bf87da9d7bfd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/t6020.dtsi
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +/*
> + * Apple T6020 "M2 Pro" SoC
> + *
> + * Other names: H14J, "Rhodes Chop"
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +/* This chip is just a cut down version of t6021, so include it and disable the missing parts */
> +
> +#include "t6021.dtsi"
> +
> +/ {
> +	compatible = "apple,t6020", "apple,arm-platform";
> +};
> +
> +/delete-node/ &pmgr_south;
> +
> +&gpu {
> +	compatible = "apple,agx-g14s";
> +};
> diff --git a/arch/arm64/boot/dts/apple/t6021.dtsi b/arch/arm64/boot/dts/apple/t6021.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..e5d933917ad3032025993b0ece9bdff22d5bc5f1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/t6021.dtsi
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +/*
> + * Apple T6021 "M2 Max" SoC
> + *
> + * Other names: H14J, "Rhodes"
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/apple-aic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/apple.h>
> +#include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +#include "multi-die-cpp.h"
> +
> +#include "t602x-common.dtsi"
> +
> +/ {
> +	compatible = "apple,t6001", "apple,arm-platform";
Here.
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		ranges;
> +		nonposted-mmio;
> +
> +		// filled via templated includes at the end of the file
> +	};
> +};
> +
> +#define DIE
> +#define DIE_NO 0
> +
> +&{/soc} {
> +	#include "t602x-die0.dtsi"
> +	#include "t602x-dieX.dtsi"
> +	#include "t602x-nvme.dtsi"
> +};
> +
> +#include "t602x-gpio-pins.dtsi"
> +#include "t602x-pmgr.dtsi"
> +
> +#undef DIE
> +#undef DIE_NO
> +
> +
> +&aic {
> +	affinities {
> +		e-core-pmu-affinity {
> +			apple,fiq-index = <AIC_CPU_PMU_E>;
> +			cpus = <&cpu_e00 &cpu_e01 &cpu_e02 &cpu_e03>;
> +		};
> +
> +		p-core-pmu-affinity {
> +			apple,fiq-index = <AIC_CPU_PMU_P>;
> +			cpus = <&cpu_p00 &cpu_p01 &cpu_p02 &cpu_p03
> +				&cpu_p10 &cpu_p11 &cpu_p12 &cpu_p13>;
> +		};
> +	};
> +};
> +
> +&gpu {
> +	compatible = "apple,agx-g14c", "apple,agx-g14s";
> +};
> diff --git a/arch/arm64/boot/dts/apple/t6022.dtsi b/arch/arm64/boot/dts/apple/t6022.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..9d702b9bc145e15058d5ac49a647b23ba6d00aed
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/t6022.dtsi
> @@ -0,0 +1,347 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +/*
> + * Apple T6022 "M2 Ultra" SoC
> + *
> + * Other names: H14J, "Rhodes 2C"
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/apple-aic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/apple.h>
> +#include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +#include "multi-die-cpp.h"
> +
> +#include "t602x-common.dtsi"
> +
> +/ {
> +	compatible = "apple,t6022", "apple,arm-platform";
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		cpu-map {
> +			cluster3 {
> +				core0 {
> +					cpu = <&cpu_e10>;
> +				};
> +				core1 {
> +					cpu = <&cpu_e11>;
> +				};
> +				core2 {
> +					cpu = <&cpu_e12>;
> +				};
> +				core3 {
> +					cpu = <&cpu_e13>;
> +				};
> +			};
> +
> +			cluster4 {
> +				core0 {
> +					cpu = <&cpu_p20>;
> +				};
> +				core1 {
> +					cpu = <&cpu_p21>;
> +				};
> +				core2 {
> +					cpu = <&cpu_p22>;
> +				};
> +				core3 {
> +					cpu = <&cpu_p23>;
> +				};
> +			};
> +
> +			cluster5 {
> +				core0 {
> +					cpu = <&cpu_p30>;
> +				};
> +				core1 {
> +					cpu = <&cpu_p31>;
> +				};
> +				core2 {
> +					cpu = <&cpu_p32>;
> +				};
> +				core3 {
> +					cpu = <&cpu_p33>;
> +				};
> +			};
> +		};
> +
> +		cpu_e10: cpu@800 {
> +			compatible = "apple,blizzard";
> +			device_type = "cpu";
> +			reg = <0x0 0x800>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* to be filled by loader */
> +			next-level-cache = <&l2_cache_3>;
> +			i-cache-size  = <0x20000>;
> +			d-cache-size = <0x10000>;
> +			operating-points-v2 = <&blizzard_opp>;
> +			capacity-dmips-mhz = <756>;
> +			performance-domains = <&cpufreq_e_die1>;
> +		};
> +
> +		cpu_e11: cpu@801 {
> +			compatible = "apple,blizzard";
> +			device_type = "cpu";
> +			reg = <0x0 0x801>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* to be filled by loader */
> +			next-level-cache = <&l2_cache_3>;
> +			i-cache-size  = <0x20000>;
> +			d-cache-size = <0x10000>;
> +			operating-points-v2 = <&blizzard_opp>;
> +			capacity-dmips-mhz = <756>;
> +			performance-domains = <&cpufreq_e_die1>;
> +		};
> +
> +		cpu_e12: cpu@802 {
> +			compatible = "apple,blizzard";
> +			device_type = "cpu";
> +			reg = <0x0 0x802>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* to be filled by loader */
> +			next-level-cache = <&l2_cache_3>;
> +			i-cache-size  = <0x20000>;
> +			d-cache-size = <0x10000>;
> +			operating-points-v2 = <&blizzard_opp>;
> +			capacity-dmips-mhz = <756>;
> +			performance-domains = <&cpufreq_e_die1>;
> +		};
> +
> +		cpu_e13: cpu@803 {
> +			compatible = "apple,blizzard";
> +			device_type = "cpu";
> +			reg = <0x0 0x803>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* to be filled by loader */
> +			next-level-cache = <&l2_cache_3>;
> +			i-cache-size  = <0x20000>;
> +			d-cache-size = <0x10000>;
> +			operating-points-v2 = <&blizzard_opp>;
> +			capacity-dmips-mhz = <756>;
> +			performance-domains = <&cpufreq_e_die1>;
> +		};
> +
> +		cpu_p20: cpu@10900 {
> +			compatible = "apple,avalanche";
> +			device_type = "cpu";
> +			reg = <0x0 0x10900>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_4>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +			operating-points-v2 = <&avalanche_opp>;
> +			capacity-dmips-mhz = <1024>;
> +			performance-domains = <&cpufreq_p0_die1>;
> +		};
> +
> +		cpu_p21: cpu@10901 {
> +			compatible = "apple,avalanche";
> +			device_type = "cpu";
> +			reg = <0x0 0x10901>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_4>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +			operating-points-v2 = <&avalanche_opp>;
> +			capacity-dmips-mhz = <1024>;
> +			performance-domains = <&cpufreq_p0_die1>;
> +		};
> +
> +		cpu_p22: cpu@10902 {
> +			compatible = "apple,avalanche";
> +			device_type = "cpu";
> +			reg = <0x0 0x10902>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_4>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +			operating-points-v2 = <&avalanche_opp>;
> +			capacity-dmips-mhz = <1024>;
> +			performance-domains = <&cpufreq_p0_die1>;
> +		};
> +
> +		cpu_p23: cpu@10903 {
> +			compatible = "apple,avalanche";
> +			device_type = "cpu";
> +			reg = <0x0 0x10903>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_4>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +			operating-points-v2 = <&avalanche_opp>;
> +			capacity-dmips-mhz = <1024>;
> +			performance-domains = <&cpufreq_p0_die1>;
> +		};
> +
> +		cpu_p30: cpu@10a00 {
> +			compatible = "apple,avalanche";
> +			device_type = "cpu";
> +			reg = <0x0 0x10a00>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_5>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +			operating-points-v2 = <&avalanche_opp>;
> +			capacity-dmips-mhz = <1024>;
> +			performance-domains = <&cpufreq_p1_die1>;
> +		};
> +
> +		cpu_p31: cpu@10a01 {
> +			compatible = "apple,avalanche";
> +			device_type = "cpu";
> +			reg = <0x0 0x10a01>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_5>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +			operating-points-v2 = <&avalanche_opp>;
> +			capacity-dmips-mhz = <1024>;
> +			performance-domains = <&cpufreq_p1_die1>;
> +		};
> +
> +		cpu_p32: cpu@10a02 {
> +			compatible = "apple,avalanche";
> +			device_type = "cpu";
> +			reg = <0x0 0x10a02>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_5>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +			operating-points-v2 = <&avalanche_opp>;
> +			capacity-dmips-mhz = <1024>;
> +			performance-domains = <&cpufreq_p1_die1>;
> +		};
> +
> +		cpu_p33: cpu@10a03 {
> +			compatible = "apple,avalanche";
> +			device_type = "cpu";
> +			reg = <0x0 0x10a03>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_5>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +			operating-points-v2 = <&avalanche_opp>;
> +			capacity-dmips-mhz = <1024>;
> +			performance-domains = <&cpufreq_p1_die1>;
> +		};
> +
> +		l2_cache_3: l2-cache-3 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +			cache-size = <0x400000>;
> +		};
> +
> +		l2_cache_4: l2-cache-4 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +			cache-size = <0x1000000>;
> +		};
> +
> +		l2_cache_5: l2-cache-5 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +			cache-size = <0x1000000>;
> +		};
> +	};
> +
> +	die0: soc@200000000 {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0x02 0x00000000 0x02 0x00000000 0x4 0x00000000>,
> +			 <0x05 0x80000000 0x05 0x80000000 0x1 0x80000000>,
> +			 <0x07 0x00000000 0x07 0x00000000 0xf 0x80000000>,
> +			 <0x16 0x80000000 0x16 0x80000000 0x5 0x80000000>;
> +		nonposted-mmio;
> +		/* Required to get >32-bit DMA via DARTs */
> +		dma-ranges = <0 0 0 0 0xffffffff 0xffffc000>;
> +
> +		// filled via templated includes at the end of the file
> +	};
> +
> +	die1: soc@2200000000 {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0x02 0x00000000 0x22 0x00000000 0x4 0x00000000>,
> +			 <0x07 0x00000000 0x27 0x00000000 0xf 0x80000000>,
> +			 <0x16 0x80000000 0x36 0x80000000 0x5 0x80000000>;
> +		nonposted-mmio;
> +		/* Required to get >32-bit DMA via DARTs */
> +		dma-ranges = <0 0 0 0 0xffffffff 0xffffc000>;
> +
> +		// filled via templated includes at the end of the file
> +	};
> +};
> +
> +#define DIE
> +#define DIE_NO 0
> +
> +&die0 {
> +	#include "t602x-die0.dtsi"
> +	#include "t602x-dieX.dtsi"
> +};
> +
> +#include "t602x-pmgr.dtsi"
> +#include "t602x-gpio-pins.dtsi"
> +
> +#undef DIE
> +#undef DIE_NO
> +
> +#define DIE _die1
> +#define DIE_NO 1
> +
> +&die1 {
> +	#include "t602x-dieX.dtsi"
> +	#include "t602x-nvme.dtsi"
> +};
> +
> +#include "t602x-pmgr.dtsi"
> +
> +#undef DIE
> +#undef DIE_NO
> +
> +&aic {
> +	affinities {
> +		e-core-pmu-affinity {
> +			apple,fiq-index = <AIC_CPU_PMU_E>;
> +			cpus = <&cpu_e00 &cpu_e01 &cpu_e02 &cpu_e03
> +				&cpu_e10 &cpu_e11 &cpu_e12 &cpu_e13>;
> +		};
> +
> +		p-core-pmu-affinity {
> +			apple,fiq-index = <AIC_CPU_PMU_P>;
> +			cpus = <&cpu_p00 &cpu_p01 &cpu_p02 &cpu_p03
> +				&cpu_p10 &cpu_p11 &cpu_p12 &cpu_p13
> +				&cpu_p20 &cpu_p21 &cpu_p22 &cpu_p23
> +				&cpu_p30 &cpu_p31 &cpu_p32 &cpu_p33>;
> +		};
> +	};
> +};
> +
> +&ps_gfx {
> +	// On t6022, the die0 GPU power domain needs both AFR power domains
> +	power-domains = <&ps_afr>, <&ps_afr_die1>;
> +};
> +
> +&gpu {
> +	compatible = "apple,agx-g14d", "apple,agx-g14s";
> +};
> diff --git a/arch/arm64/boot/dts/apple/t602x-common.dtsi b/arch/arm64/boot/dts/apple/t602x-common.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..9c800a391e7e87f86dce0f34c08276e69d2cb780
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/t602x-common.dtsi
> @@ -0,0 +1,465 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +/*
> + * Nodes common to all T602x family SoCs (M2 Pro/Max/Ultra)
> + *
> + * Other names: H14J, "Rhodes Chop", "Rhodes", "Rhodes 2C"
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		gpu = &gpu;
> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu_e00>;
> +				};
> +				core1 {
> +					cpu = <&cpu_e01>;
> +				};
> +				core2 {
> +					cpu = <&cpu_e02>;
> +				};
> +				core3 {
> +					cpu = <&cpu_e03>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu_p00>;
> +				};
> +				core1 {
> +					cpu = <&cpu_p01>;
> +				};
> +				core2 {
> +					cpu = <&cpu_p02>;
> +				};
> +				core3 {
> +					cpu = <&cpu_p03>;
> +				};
> +			};
> +
> +			cluster2 {
> +				core0 {
> +					cpu = <&cpu_p10>;
> +				};
> +				core1 {
> +					cpu = <&cpu_p11>;
> +				};
> +				core2 {
> +					cpu = <&cpu_p12>;
> +				};
> +				core3 {
> +					cpu = <&cpu_p13>;
> +				};
> +			};
> +		};
> +
> +		cpu_e00: cpu@0 {
> +			compatible = "apple,blizzard";
> +			device_type = "cpu";
> +			reg = <0x0 0x0>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* to be filled by loader */
> +			next-level-cache = <&l2_cache_0>;
> +			i-cache-size = <0x20000>;
> +			d-cache-size = <0x10000>;
> +			operating-points-v2 = <&blizzard_opp>;
> +			capacity-dmips-mhz = <756>;
> +			performance-domains = <&cpufreq_e>;
> +		};
> +
> +		cpu_e01: cpu@1 {
> +			compatible = "apple,blizzard";
> +			device_type = "cpu";
> +			reg = <0x0 0x1>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* to be filled by loader */
> +			next-level-cache = <&l2_cache_0>;
> +			i-cache-size = <0x20000>;
> +			d-cache-size = <0x10000>;
> +			operating-points-v2 = <&blizzard_opp>;
> +			capacity-dmips-mhz = <756>;
> +			performance-domains = <&cpufreq_e>;
> +		};
> +
> +		cpu_e02: cpu@2 {
> +			compatible = "apple,blizzard";
> +			device_type = "cpu";
> +			reg = <0x0 0x2>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* to be filled by loader */
> +			next-level-cache = <&l2_cache_0>;
> +			i-cache-size = <0x20000>;
> +			d-cache-size = <0x10000>;
> +			operating-points-v2 = <&blizzard_opp>;
> +			capacity-dmips-mhz = <756>;
> +			performance-domains = <&cpufreq_e>;
> +		};
> +
> +		cpu_e03: cpu@3 {
> +			compatible = "apple,blizzard";
> +			device_type = "cpu";
> +			reg = <0x0 0x3>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* to be filled by loader */
> +			next-level-cache = <&l2_cache_0>;
> +			i-cache-size = <0x20000>;
> +			d-cache-size = <0x10000>;
> +			operating-points-v2 = <&blizzard_opp>;
> +			capacity-dmips-mhz = <756>;
> +			performance-domains = <&cpufreq_e>;
> +		};
> +
> +		cpu_p00: cpu@10100 {
> +			compatible = "apple,avalanche";
> +			device_type = "cpu";
> +			reg = <0x0 0x10100>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_1>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +			operating-points-v2 = <&avalanche_opp>;
> +			capacity-dmips-mhz = <1024>;
> +			performance-domains = <&cpufreq_p0>;
> +		};
> +
> +		cpu_p01: cpu@10101 {
> +			compatible = "apple,avalanche";
> +			device_type = "cpu";
> +			reg = <0x0 0x10101>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_1>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +			operating-points-v2 = <&avalanche_opp>;
> +			capacity-dmips-mhz = <1024>;
> +			performance-domains = <&cpufreq_p0>;
> +		};
> +
> +		cpu_p02: cpu@10102 {
> +			compatible = "apple,avalanche";
> +			device_type = "cpu";
> +			reg = <0x0 0x10102>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_1>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +			operating-points-v2 = <&avalanche_opp>;
> +			capacity-dmips-mhz = <1024>;
> +			performance-domains = <&cpufreq_p0>;
> +		};
> +
> +		cpu_p03: cpu@10103 {
> +			compatible = "apple,avalanche";
> +			device_type = "cpu";
> +			reg = <0x0 0x10103>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_1>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +			operating-points-v2 = <&avalanche_opp>;
> +			capacity-dmips-mhz = <1024>;
> +			performance-domains = <&cpufreq_p0>;
> +		};
> +
> +		cpu_p10: cpu@10200 {
> +			compatible = "apple,avalanche";
> +			device_type = "cpu";
> +			reg = <0x0 0x10200>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_2>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +			operating-points-v2 = <&avalanche_opp>;
> +			capacity-dmips-mhz = <1024>;
> +			performance-domains = <&cpufreq_p1>;
> +		};
> +
> +		cpu_p11: cpu@10201 {
> +			compatible = "apple,avalanche";
> +			device_type = "cpu";
> +			reg = <0x0 0x10201>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_2>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +			operating-points-v2 = <&avalanche_opp>;
> +			capacity-dmips-mhz = <1024>;
> +			performance-domains = <&cpufreq_p1>;
> +		};
> +
> +		cpu_p12: cpu@10202 {
> +			compatible = "apple,avalanche";
> +			device_type = "cpu";
> +			reg = <0x0 0x10202>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_2>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +			operating-points-v2 = <&avalanche_opp>;
> +			capacity-dmips-mhz = <1024>;
> +			performance-domains = <&cpufreq_p1>;
> +		};
> +
> +		cpu_p13: cpu@10203 {
> +			compatible = "apple,avalanche";
> +			device_type = "cpu";
> +			reg = <0x0 0x10203>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_2>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +			operating-points-v2 = <&avalanche_opp>;
> +			capacity-dmips-mhz = <1024>;
> +			performance-domains = <&cpufreq_p1>;
> +		};
> +
> +		l2_cache_0: l2-cache-0 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +			cache-size = <0x400000>;
> +		};
> +
> +		l2_cache_1: l2-cache-1 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +			cache-size = <0x1000000>;
> +		};
> +
> +		l2_cache_2: l2-cache-2 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +			cache-size = <0x1000000>;
> +		};
> +	 };
> +
> +	blizzard_opp: opp-table-0 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		/* pstate #1 is a dummy clone of #2 */
> +		opp02 {
> +			opp-hz = /bits/ 64 <912000000>;
> +			opp-level = <2>;
> +			clock-latency-ns = <7700>;
> +		};
> +		opp03 {
> +			opp-hz = /bits/ 64 <1284000000>;
> +			opp-level = <3>;
> +			clock-latency-ns = <25000>;
> +		};
> +		opp04 {
> +			opp-hz = /bits/ 64 <1752000000>;
> +			opp-level = <4>;
> +			clock-latency-ns = <33000>;
> +		};
> +		opp05 {
> +			opp-hz = /bits/ 64 <2004000000>;
> +			opp-level = <5>;
> +			clock-latency-ns = <38000>;
> +		};
> +		opp06 {
> +			opp-hz = /bits/ 64 <2256000000>;
> +			opp-level = <6>;
> +			clock-latency-ns = <44000>;
> +		};
> +		opp07 {
> +			opp-hz = /bits/ 64 <2424000000>;
> +			opp-level = <7>;
> +			clock-latency-ns = <48000>;
> +		};
> +	};
> +
> +	avalanche_opp: opp-table-1 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp01 {
> +			opp-hz = /bits/ 64 <702000000>;
> +			opp-level = <1>;
> +			clock-latency-ns = <7400>;
> +		};
> +		opp02 {
> +			opp-hz = /bits/ 64 <948000000>;
> +			opp-level = <2>;
> +			clock-latency-ns = <18000>;
> +		};
> +		opp03 {
> +			opp-hz = /bits/ 64 <1188000000>;
> +			opp-level = <3>;
> +			clock-latency-ns = <21000>;
> +		};
> +		opp04 {
> +			opp-hz = /bits/ 64 <1452000000>;
> +			opp-level = <4>;
> +			clock-latency-ns = <24000>;
> +		};
> +		opp05 {
> +			opp-hz = /bits/ 64 <1704000000>;
> +			opp-level = <5>;
> +			clock-latency-ns = <28000>;
> +		};
> +		opp06 {
> +			opp-hz = /bits/ 64 <1968000000>;
> +			opp-level = <6>;
> +			clock-latency-ns = <31000>;
> +		};
> +		opp07 {
> +			opp-hz = /bits/ 64 <2208000000>;
> +			opp-level = <7>;
> +			clock-latency-ns = <33000>;
> +		};
> +		opp08 {
> +			opp-hz = /bits/ 64 <2400000000>;
> +			opp-level = <8>;
> +			clock-latency-ns = <45000>;
> +		};
> +		opp09 {
> +			opp-hz = /bits/ 64 <2568000000>;
> +			opp-level = <9>;
> +			clock-latency-ns = <47000>;
> +		};
> +		opp10 {
> +			opp-hz = /bits/ 64 <2724000000>;
> +			opp-level = <10>;
> +			clock-latency-ns = <50000>;
> +		};
> +		opp11 {
> +			opp-hz = /bits/ 64 <2868000000>;
> +			opp-level = <11>;
> +			clock-latency-ns = <52000>;
> +		};
> +		opp12 {
> +			opp-hz = /bits/ 64 <3000000000>;
> +			opp-level = <12>;
> +			clock-latency-ns = <57000>;
> +		};
> +		opp13 {
> +			opp-hz = /bits/ 64 <3132000000>;
> +			opp-level = <13>;
> +			clock-latency-ns = <60000>;
> +		};
> +		opp14 {
> +			opp-hz = /bits/ 64 <3264000000>;
> +			opp-level = <14>;
> +			clock-latency-ns = <64000>;
> +		};
> +		opp15 {
> +			opp-hz = /bits/ 64 <3360000000>;
> +			opp-level = <15>;
> +			clock-latency-ns = <64000>;
> +			turbo-mode;
> +		};
> +		opp16 {
> +			opp-hz = /bits/ 64 <3408000000>;
> +			opp-level = <16>;
> +			clock-latency-ns = <64000>;
> +			turbo-mode;
> +		};
> +		opp17 {
> +			opp-hz = /bits/ 64 <3504000000>;
> +			opp-level = <17>;
> +			clock-latency-ns = <64000>;
> +			turbo-mode;
> +		};
> +	};
> +
> +	pmu-e {
> +		compatible = "apple,blizzard-pmu";
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_FIQ 0 AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	pmu-p {
> +		compatible = "apple,avalanche-pmu";
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_FIQ 0 AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&aic>;
> +		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
> +		interrupts = <AIC_FIQ 0 AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
> +			     <AIC_FIQ 0 AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
> +			     <AIC_FIQ 0 AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
> +			     <AIC_FIQ 0 AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	clkref: clock-ref {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		clock-output-names = "clkref";
> +	};
> +
> +	clk_200m: clock-200m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <200000000>;
> +		clock-output-names = "clk_200m";
> +	};
> +
> +	/*
> +	 * This is a fabulated representation of the input clock
> +	 * to NCO since we don't know the true clock tree.
> +	 */
> +	nco_clkref: clock-ref-nco {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-output-names = "nco_ref";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		gpu_globals: globals {
> +			status = "disabled";
> +		};
> +
> +		gpu_hw_cal_a: hw-cal-a {
> +			status = "disabled";
> +		};
> +
> +		gpu_hw_cal_b: hw-cal-b {
> +			status = "disabled";
> +		};
> +
> +		uat_handoff: uat-handoff {
> +			status = "disabled";
> +		};
> +
> +		uat_pagetables: uat-pagetables {
> +			status = "disabled";
> +		};
> +
> +		uat_ttbs: uat-ttbs {
> +			status = "disabled";
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..e07d638561a15b99fa5212133cb6dc24408a70c3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
> @@ -0,0 +1,577 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +/*
> + * In anticipation of an M2 Ultra. Inspired by T600x.
> + *
> + * Obviously needs filling out, just the bare bones required
> + * to boot to a console in the HV.
This is not true anymore.
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +	nco: clock-controller@28e03c000 {
> +		compatible = "apple,t6020-nco", "apple,t8103-nco";
> +		reg = <0x2 0x8e03c000 0x0 0x14000>;
> +		clocks = <&nco_clkref>;
> +		#clock-cells = <1>;
> +	};
> +
> +	aic: interrupt-controller@28e100000 {
> +		compatible = "apple,t6020-aic", "apple,aic2";
> +		#interrupt-cells = <4>;
> +		interrupt-controller;
> +		reg = <0x2 0x8e100000 0x0 0xc000>,
> +			<0x2 0x8e10c000 0x0 0x1000>;
> +		reg-names = "core", "event";
> +		power-domains = <&ps_aic>;
> +	};
> +
> +	nub_spmi0: spmi@29e114000 {
> +		compatible = "apple,t6020-spmi", "apple,t8103-spmi";
> +		reg = <0x2 0x9e114000 0x0 0x100>;
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		pmic1: pmic@f {
> +			compatible = "apple,maverick-pmic", "apple,spmi-nvmem";
> +			reg = <0xb SPMI_USID>;
> +
> +			nvmem-layout {
> +				compatible = "fixed-layout";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +
> +				pm_setting: pm-setting@1405 {
> +					reg = <0x1405 0x1>;
> +				};
> +
> +				rtc_offset: rtc-offset@1411 {
> +					reg = <0x1411 0x6>;
> +				};
> +
> +				boot_stage: boot-stage@6001 {
> +					reg = <0x6001 0x1>;
> +				};
> +
> +				boot_error_count: boot-error-count@6002,0 {
> +					reg = <0x6002 0x1>;
> +					bits = <0 4>;
> +				};
> +
> +				panic_count: panic-count@6002,4 {
> +					reg = <0x6002 0x1>;
> +					bits = <4 4>;
> +				};
> +
> +				boot_error_stage: boot-error-stage@6003 {
> +					reg = <0x6003 0x1>;
> +				};
> +
> +				shutdown_flag: shutdown-flag@600f,3 {
> +					reg = <0x600f 0x1>;
> +					bits = <3 1>;
> +				};
> +
> +				fault_shadow: fault-shadow@867b {
> +					reg = <0x867b 0x10>;
> +				};
> +
> +				socd: socd@8b00 {
> +					reg = <0x8b00 0x400>;
> +				};
> +			};
> +		};
> +	};
> +
> +	wdt: watchdog@29e2c4000 {
> +		compatible = "apple,t6020-wdt", "apple,t8103-wdt";
> +		reg = <0x2 0x9e2c4000 0x0 0x4000>;
> +		clocks = <&clkref>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 719 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	smc_mbox: mbox@2a2408000 {
> +		compatible = "apple,t6020-asc-mailbox", "apple,asc-mailbox-v4";
> +		reg = <0x2 0xa2408000 0x0 0x4000>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 862 IRQ_TYPE_LEVEL_HIGH>,
> +			<AIC_IRQ 0 863 IRQ_TYPE_LEVEL_HIGH>,
> +			<AIC_IRQ 0 864 IRQ_TYPE_LEVEL_HIGH>,
> +			<AIC_IRQ 0 865 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "send-empty", "send-not-empty",
> +			"recv-empty", "recv-not-empty";
> +		#mbox-cells = <0>;
> +	};
> +
> +	smc: smc@2a2400000 {
> +		compatible = "apple,t6020-smc", "apple,t8103-smc";
> +		reg = <0x2 0xa2400000 0x0 0x4000>,
> +			<0x2 0xa3e00000 0x0 0x100000>;
> +		reg-names = "smc", "sram";
> +		mboxes = <&smc_mbox>;
> +
> +		smc_gpio: gpio {
> +			compatible = "apple,smc-gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +
> +		smc_reboot: reboot {
> +			compatible = "apple,smc-reboot";
> +			nvmem-cells = <&shutdown_flag>, <&boot_stage>,
> +				<&boot_error_count>, <&panic_count>;
> +			nvmem-cell-names = "shutdown_flag", "boot_stage",
> +				"boot_error_count", "panic_count";
> +		};
> +	};
> +
> +	pinctrl_smc: pinctrl@2a2820000 {
> +		compatible = "apple,t6020-pinctrl", "apple,t8103-pinctrl";
> +		reg = <0x2 0xa2820000 0x0 0x4000>;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-ranges = <&pinctrl_smc 0 0 30>;
> +		apple,npins = <30>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 851 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 0 852 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 0 853 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 0 854 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 0 855 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 0 856 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 0 857 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	sio_dart: iommu@39b008000 {
> +		compatible = "apple,t6020-dart", "apple,t8110-dart";
> +		reg = <0x3 0x9b008000 0x0 0x8000>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1231 IRQ_TYPE_LEVEL_HIGH>;
> +		#iommu-cells = <1>;
> +		power-domains = <&ps_sio_cpu>;
> +	};
> +
> +	fpwm0: pwm@39b030000 {
> +		compatible = "apple,t6020-fpwm", "apple,s5l-fpwm";
> +		reg = <0x3 0x9b030000 0x0 0x4000>;
> +		power-domains = <&ps_fpwm0>;
> +		clocks = <&clkref>;
> +		#pwm-cells = <2>;
> +		status = "disabled";
> +	};
> +
> +	i2c0: i2c@39b040000 {
> +		compatible = "apple,t6020-i2c", "apple,t8103-i2c";
> +		reg = <0x3 0x9b040000 0x0 0x4000>;
> +		clocks = <&clkref>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1219 IRQ_TYPE_LEVEL_HIGH>;
> +		pinctrl-0 = <&i2c0_pins>;
> +		pinctrl-names = "default";
> +		power-domains = <&ps_i2c0>;
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +	};
> +
> +	i2c1: i2c@39b044000 {
> +		compatible = "apple,t6020-i2c", "apple,t8103-i2c";
> +		reg = <0x3 0x9b044000 0x0 0x4000>;
> +		clocks = <&clkref>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1220 IRQ_TYPE_LEVEL_HIGH>;
> +		pinctrl-0 = <&i2c1_pins>;
> +		pinctrl-names = "default";
> +		power-domains = <&ps_i2c1>;
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +		status = "disabled";
> +	};
> +
> +	i2c2: i2c@39b048000 {
> +		compatible = "apple,t6020-i2c", "apple,t8103-i2c";
> +		reg = <0x3 0x9b048000 0x0 0x4000>;
> +		clocks = <&clkref>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1221 IRQ_TYPE_LEVEL_HIGH>;
> +		pinctrl-0 = <&i2c2_pins>;
> +		pinctrl-names = "default";
> +		power-domains = <&ps_i2c2>;
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +		status = "disabled";
> +	};
> +
> +	i2c3: i2c@39b04c000 {
> +		compatible = "apple,t6020-i2c", "apple,t8103-i2c";
> +		reg = <0x3 0x9b04c000 0x0 0x4000>;
> +		clocks = <&clkref>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1222 IRQ_TYPE_LEVEL_HIGH>;
> +		pinctrl-0 = <&i2c3_pins>;
> +		pinctrl-names = "default";
> +		power-domains = <&ps_i2c3>;
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +		status = "disabled";
> +	};
> +
> +	i2c4: i2c@39b050000 {
> +		compatible = "apple,t6020-i2c", "apple,t8103-i2c";
> +		reg = <0x3 0x9b050000 0x0 0x4000>;
> +		clocks = <&clkref>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1223 IRQ_TYPE_LEVEL_HIGH>;
> +		pinctrl-0 = <&i2c4_pins>;
> +		pinctrl-names = "default";
> +		power-domains = <&ps_i2c4>;
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +		status = "disabled";
> +	};
> +
> +	i2c5: i2c@39b054000 {
> +		compatible = "apple,t6020-i2c", "apple,t8103-i2c";
> +		reg = <0x3 0x9b054000 0x0 0x4000>;
> +		clocks = <&clkref>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1224 IRQ_TYPE_LEVEL_HIGH>;
> +		pinctrl-0 = <&i2c5_pins>;
> +		pinctrl-names = "default";
> +		power-domains = <&ps_i2c5>;
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +		status = "disabled";
> +	};
> +
> +	i2c6: i2c@39b054000 {
> +		compatible = "apple,t6020-i2c", "apple,t8103-i2c";
> +		reg = <0x3 0x9b054000 0x0 0x4000>;
> +		clocks = <&clkref>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1225 IRQ_TYPE_LEVEL_HIGH>;
> +		pinctrl-0 = <&i2c6_pins>;
> +		pinctrl-names = "default";
> +		power-domains = <&ps_i2c6>;
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +		status = "disabled";
> +	};
> +
> +	i2c7: i2c@39b054000 {
> +		compatible = "apple,t6020-i2c", "apple,t8103-i2c";
> +		reg = <0x3 0x9b054000 0x0 0x4000>;
> +		clocks = <&clkref>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1226 IRQ_TYPE_LEVEL_HIGH>;
> +		pinctrl-0 = <&i2c7_pins>;
> +		pinctrl-names = "default";
> +		power-domains = <&ps_i2c7>;
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +		status = "disabled";
> +	};
> +
> +	i2c8: i2c@39b054000 {
> +		compatible = "apple,t6020-i2c", "apple,t8103-i2c";
> +		reg = <0x3 0x9b054000 0x0 0x4000>;
> +		clocks = <&clkref>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1227 IRQ_TYPE_LEVEL_HIGH>;
> +		pinctrl-0 = <&i2c8_pins>;
> +		pinctrl-names = "default";
> +		power-domains = <&ps_i2c8>;
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +		status = "disabled";
> +	};
> +
> +	spi1: spi@39b104000 {
> +		compatible = "apple,t6020-spi", "apple,t8103-spi";
> +		reg = <0x3 0x9b104000 0x0 0x4000>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1206 IRQ_TYPE_LEVEL_HIGH>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&clk_200m>;
> +		pinctrl-0 = <&spi1_pins>;
> +		pinctrl-names = "default";
> +		power-domains = <&ps_spi1>;
> +		status = "disabled";
> +	};
> +
> +	spi2: spi@39b108000 {
> +		compatible = "apple,t6020-spi", "apple,t8103-spi";
> +		reg = <0x3 0x9b108000 0x0 0x4000>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1207 IRQ_TYPE_LEVEL_HIGH>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&clkref>;
> +		pinctrl-0 = <&spi2_pins>;
> +		pinctrl-names = "default";
> +		power-domains = <&ps_spi2>;
> +		status = "disabled";
> +	};
> +
> +	spi4: spi@39b110000 {
> +		compatible = "apple,t6020-spi", "apple,t8103-spi";
> +		reg = <0x3 0x9b110000 0x0 0x4000>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1209 IRQ_TYPE_LEVEL_HIGH>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&clkref>;
> +		pinctrl-0 = <&spi4_pins>;
> +		pinctrl-names = "default";
> +		power-domains = <&ps_spi4>;
> +		status = "disabled";
> +	};
> +
> +	serial0: serial@39b200000 {
> +		compatible = "apple,s5l-uart";
> +		reg = <0x3 0x9b200000 0x0 0x4000>;
> +		reg-io-width = <4>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1198 IRQ_TYPE_LEVEL_HIGH>;
> +		/*
> +		 * TODO: figure out the clocking properly, there may
> +		 * be a third selectable clock.
> +		 */
> +		clocks = <&clkref>, <&clkref>;
> +		clock-names = "uart", "clk_uart_baud0";
> +		power-domains = <&ps_uart0>;
> +		status = "disabled";
> +	};
> +
> +	admac: dma-controller@39b400000 {
> +		compatible = "apple,t6020-admac", "apple,t8103-admac";
> +		reg = <0x3 0x9b400000 0x0 0x34000>;
> +		#dma-cells = <1>;
> +		dma-channels = <16>;
> +		interrupts-extended = <0>,
> +				      <&aic AIC_IRQ 0 1218 IRQ_TYPE_LEVEL_HIGH>,
> +				      <0>,
> +				      <0>;
> +		iommus = <&sio_dart 2>;
> +		power-domains = <&ps_sio_adma>;
> +		resets = <&ps_audio_p>;
> +	};
> +
> +	mca: mca@39b600000 {
> +		compatible = "apple,t6020-mca", "apple,t8103-mca";
> +		reg = <0x3 0x9b600000 0x0 0x10000>,
> +		      <0x3 0x9b500000 0x0 0x20000>;
> +		clocks = <&nco 0>, <&nco 1>, <&nco 2>, <&nco 3>;
> +		dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
> +		       <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
> +		       <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
> +		       <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>;
> +		dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
> +			    "tx1a", "rx1a", "tx1b", "rx1b",
> +			    "tx2a", "rx2a", "tx2b", "rx2b",
> +			    "tx3a", "rx3a", "tx3b", "rx3b";
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1211 IRQ_TYPE_LEVEL_HIGH>,
> +			     <AIC_IRQ 0 1212 IRQ_TYPE_LEVEL_HIGH>,
> +			     <AIC_IRQ 0 1213 IRQ_TYPE_LEVEL_HIGH>,
> +			     <AIC_IRQ 0 1214 IRQ_TYPE_LEVEL_HIGH>;
> +		power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
> +				<&ps_mca2>, <&ps_mca3>;
> +		resets = <&ps_audio_p>;
> +		#sound-dai-cells = <1>;
> +	};
> +
> +	gpu: gpu@406400000 {
> +		compatible = "apple,agx-g14s";
> +		reg = <0x4 0x6400000 0 0x40000>,
> +			<0x4 0x4000000 0 0x1000000>;
> +		reg-names = "asc", "sgx";
> +		mboxes = <&agx_mbox>;
> +		power-domains = <&ps_gfx>;
> +		memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>,
> +				<&gpu_hw_cal_a>, <&gpu_hw_cal_b>, <&gpu_globals>;
> +		memory-region-names = "ttbs", "pagetables", "handoff",
> +				      "hw-cal-a", "hw-cal-b", "globals";
> +
> +		apple,firmware-abi = <0 0 0>;
> +	};
> +
> +	agx_mbox: mbox@406408000 {
> +		compatible = "apple,t6020-asc-mailbox", "apple,asc-mailbox-v4";
> +		reg = <0x4 0x6408000 0x0 0x4000>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1143 IRQ_TYPE_LEVEL_HIGH>,
> +			<AIC_IRQ 0 1144 IRQ_TYPE_LEVEL_HIGH>,
> +			<AIC_IRQ 0 1145 IRQ_TYPE_LEVEL_HIGH>,
> +			<AIC_IRQ 0 1146 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "send-empty", "send-not-empty",
> +			"recv-empty", "recv-not-empty";
> +		#mbox-cells = <0>;
> +	};
> +
> +	pcie0: pcie@580000000 {
> +		compatible = "apple,t6020-pcie";
> +		device_type = "pci";
> +
> +		reg = <0x5 0x80000000 0x0 0x1000000>,	/* config */
> +			<0x5 0x91000000 0x0 0x4000>,	/* rc */
> +			<0x5 0x94008000 0x0 0x4000>,	/* port0 */
> +			<0x5 0x95008000 0x0 0x4000>,	/* port1 */
> +			<0x5 0x96008000 0x0 0x4000>,	/* port2 */
> +			<0x5 0x97008000 0x0 0x4000>,	/* port3 */
> +			<0x5 0x9e00c000 0x0 0x4000>,	/* phy0 */
> +			<0x5 0x9e010000 0x0 0x4000>,	/* phy1 */
> +			<0x5 0x9e014000 0x0 0x4000>,	/* phy2 */
> +			<0x5 0x9e018000 0x0 0x4000>;	/* phy3 */
> +		reg-names = "config", "rc",
> +			"port0", "port1", "port2", "port3",
> +			"phy0", "phy1", "phy2", "phy3";
> +
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1340 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 0 1344 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 0 1348 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 0 1352 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		msi-controller;
> +		msi-parent = <&pcie0>;
> +		msi-ranges = <&aic AIC_IRQ 0 1672 IRQ_TYPE_EDGE_RISING 32>;
> +
> +		iommu-map = <0x100 &pcie0_dart_0 1 1>,
> +				<0x200 &pcie0_dart_1 1 1>,
> +				<0x300 &pcie0_dart_2 1 1>,
> +				<0x400 &pcie0_dart_3 1 1>;
> +		iommu-map-mask = <0xff00>;
> +
> +		bus-range = <0 4>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		ranges = <0x43000000 0x5 0xa0000000 0x5 0xa0000000 0x0 0x20000000>,
> +				<0x02000000 0x0 0xc0000000 0x5 0xc0000000 0x0 0x40000000>;
> +
> +		power-domains = <&ps_apcie_gp_sys>;
> +		pinctrl-0 = <&pcie_pins>;
> +		pinctrl-names = "default";
> +
> +		port00: pci@0,0 {
> +			device_type = "pci";
> +			reg = <0x0 0x0 0x0 0x0 0x0>;
> +			reset-gpios = <&pinctrl_ap 4 GPIO_ACTIVE_LOW>;
> +
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			interrupt-map-mask = <0 0 0 7>;
> +			interrupt-map = <0 0 0 1 &port00 0 0 0 0>,
> +					<0 0 0 2 &port00 0 0 0 1>,
> +					<0 0 0 3 &port00 0 0 0 2>,
> +					<0 0 0 4 &port00 0 0 0 3>;
> +		};
> +
> +		port01: pci@1,0 {
> +			device_type = "pci";
> +			reg = <0x800 0x0 0x0 0x0 0x0>;
> +			reset-gpios = <&pinctrl_ap 5 GPIO_ACTIVE_LOW>;
> +
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			interrupt-map-mask = <0 0 0 7>;
> +			interrupt-map = <0 0 0 1 &port01 0 0 0 0>,
> +					<0 0 0 2 &port01 0 0 0 1>,
> +					<0 0 0 3 &port01 0 0 0 2>,
> +					<0 0 0 4 &port01 0 0 0 3>;
> +			status = "disabled";
> +		};
> +
> +		port02: pci@2,0 {
> +			device_type = "pci";
> +			reg = <0x1000 0x0 0x0 0x0 0x0>;
> +			reset-gpios = <&pinctrl_ap 6 GPIO_ACTIVE_LOW>;
> +
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			interrupt-map-mask = <0 0 0 7>;
> +			interrupt-map = <0 0 0 1 &port02 0 0 0 0>,
> +					<0 0 0 2 &port02 0 0 0 1>,
> +					<0 0 0 3 &port02 0 0 0 2>,
> +					<0 0 0 4 &port02 0 0 0 3>;
> +			status = "disabled";
> +		};
> +
> +		port03: pci@3,0 {
> +			device_type = "pci";
> +			reg = <0x1800 0x0 0x0 0x0 0x0>;
> +			reset-gpios = <&pinctrl_ap 7 GPIO_ACTIVE_LOW>;
> +
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			interrupt-map-mask = <0 0 0 7>;
> +			interrupt-map = <0 0 0 1 &port03 0 0 0 0>,
> +					<0 0 0 2 &port03 0 0 0 1>,
> +					<0 0 0 3 &port03 0 0 0 2>,
> +					<0 0 0 4 &port03 0 0 0 3>;
> +			status = "disabled";
> +		};
> +	};
> +
> +	pcie0_dart_0: iommu@594000000 {
> +		compatible = "apple,t6020-dart", "apple,t8110-dart";
> +		reg = <0x5 0x94000000 0x0 0x4000>;
> +		#iommu-cells = <1>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1341 IRQ_TYPE_LEVEL_HIGH>;
> +		power-domains = <&ps_apcie_gp_sys>;
> +	};
> +
> +	pcie0_dart_1: iommu@595000000 {
> +		compatible = "apple,t6020-dart", "apple,t8110-dart";
> +		reg = <0x5 0x95000000 0x0 0x4000>;
> +		#iommu-cells = <1>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1345 IRQ_TYPE_LEVEL_HIGH>;
> +		power-domains = <&ps_apcie_gp_sys>;
> +		status = "disabled";
> +	};
> +
> +	pcie0_dart_2: iommu@596000000 {
> +		compatible = "apple,t6020-dart", "apple,t8110-dart";
> +		reg = <0x5 0x96000000 0x0 0x4000>;
> +		#iommu-cells = <1>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1349 IRQ_TYPE_LEVEL_HIGH>;
> +		power-domains = <&ps_apcie_gp_sys>;
> +		status = "disabled";
> +	};
> +
> +	pcie0_dart_3: iommu@597000000 {
> +		compatible = "apple,t6020-dart", "apple,t8110-dart";
> +		reg = <0x5 0x97000000 0x0 0x4000>;
> +		#iommu-cells = <1>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ 0 1353 IRQ_TYPE_LEVEL_HIGH>;
> +		power-domains = <&ps_apcie_gp_sys>;
> +		status = "disabled";
> +	};
> diff --git a/arch/arm64/boot/dts/apple/t602x-dieX.dtsi b/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..204a79c23bd7efa1cf19dd561884dcee0ea26bfe
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +/*
> + * Nodes present on both dies of a hypothetical T6022 (M2 Ultra)
> + * and present on M2 Pro/Max.
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +	DIE_NODE(cpufreq_e): cpufreq@210e20000 {
> +		compatible = "apple,t6020-cluster-cpufreq", "apple,t8112-cluster-cpufreq";
> +		reg = <0x2 0x10e20000 0 0x1000>;
> +		#performance-domain-cells = <0>;
> +	};
> +
> +	DIE_NODE(cpufreq_p0): cpufreq@211e20000 {
> +		compatible = "apple,t6020-cluster-cpufreq", "apple,t8112-cluster-cpufreq";
> +		reg = <0x2 0x11e20000 0 0x1000>;
> +		#performance-domain-cells = <0>;
> +	};
> +
> +	DIE_NODE(cpufreq_p1): cpufreq@212e20000 {
> +		compatible = "apple,t6020-cluster-cpufreq", "apple,t8112-cluster-cpufreq";
> +		reg = <0x2 0x12e20000 0 0x1000>;
> +		#performance-domain-cells = <0>;
> +	};
> +
> +	DIE_NODE(pmgr): power-management@28e080000 {
> +		compatible = "apple,t6020-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0x2 0x8e080000 0 0x8000>;
> +	};
> +
> +	DIE_NODE(pmgr_south): power-management@28e680000 {
> +		compatible = "apple,t6020-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0x2 0x8e680000 0 0x8000>;
> +	};
> +
> +	DIE_NODE(pmgr_east): power-management@290280000 {
> +		compatible = "apple,t6020-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0x2 0x90280000 0 0xc000>;
> +	};
> +
> +	DIE_NODE(pinctrl_nub): pinctrl@29e1f0000 {
> +		compatible = "apple,t6020-pinctrl", "apple,t8103-pinctrl";
> +		reg = <0x2 0x9e1f0000 0x0 0x4000>;
> +		power-domains = <&DIE_NODE(ps_nub_gpio)>;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-ranges = <&DIE_NODE(pinctrl_nub) 0 0 30>;
> +		apple,npins = <30>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ DIE_NO 711 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ DIE_NO 712 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ DIE_NO 713 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ DIE_NO 714 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ DIE_NO 715 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ DIE_NO 716 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ DIE_NO 717 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	DIE_NODE(pmgr_mini): power-management@29e280000 {
> +		compatible = "apple,t6020-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0x2 0x9e280000 0 0x4000>;
> +	};
> +
> +	DIE_NODE(pinctrl_aop): pinctrl@2a6820000 {
> +		compatible = "apple,t6020-pinctrl", "apple,t8103-pinctrl";
> +		reg = <0x2 0xa6820000 0x0 0x4000>;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-ranges = <&DIE_NODE(pinctrl_aop) 0 0 72>;
> +		apple,npins = <72>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ DIE_NO 598 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ DIE_NO 599 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ DIE_NO 600 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ DIE_NO 601 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ DIE_NO 602 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ DIE_NO 603 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ DIE_NO 604 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	DIE_NODE(pinctrl_ap): pinctrl@39b028000 {
> +		compatible = "apple,t6020-pinctrl", "apple,t8103-pinctrl";
> +		reg = <0x3 0x9b028000 0x0 0x4000>;
> +
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ DIE_NO 458 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ DIE_NO 459 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ DIE_NO 460 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ DIE_NO 461 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ DIE_NO 462 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ DIE_NO 463 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ DIE_NO 464 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		clocks = <&clkref>;
> +		power-domains = <&DIE_NODE(ps_gpio)>;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-ranges = <&DIE_NODE(pinctrl_ap) 0 0 255>;
> +		apple,npins = <255>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	DIE_NODE(pmgr_gfx): power-management@404e80000 {
> +		compatible = "apple,t6020-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		reg = <0x4 0x4e80000 0 0x4000>;
> +	};
> diff --git a/arch/arm64/boot/dts/apple/t602x-gpio-pins.dtsi b/arch/arm64/boot/dts/apple/t602x-gpio-pins.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..acb133d1723d0332ef429828edad1ed34ebafd6e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/t602x-gpio-pins.dtsi
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +/*
> + * GPIO pin mappings for Apple T600x SoCs.
Here.
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +&pinctrl_ap {
> +	i2c0_pins: i2c0-pins {
> +		pinmux = <APPLE_PINMUX(63, 1)>,
> +			<APPLE_PINMUX(64, 1)>;
> +	};
> +
> +	i2c1_pins: i2c1-pins {
> +		pinmux = <APPLE_PINMUX(65, 1)>,
> +			<APPLE_PINMUX(66, 1)>;
> +	};
> +
> +	i2c2_pins: i2c2-pins {
> +		pinmux = <APPLE_PINMUX(67, 1)>,
> +			<APPLE_PINMUX(68, 1)>;
> +	};
> +
> +	i2c3_pins: i2c3-pins {
> +		pinmux = <APPLE_PINMUX(69, 1)>,
> +			<APPLE_PINMUX(70, 1)>;
> +	};
> +
> +	i2c4_pins: i2c4-pins {
> +		pinmux = <APPLE_PINMUX(71, 1)>,
> +			<APPLE_PINMUX(72, 1)>;
> +	};
> +
> +	i2c5_pins: i2c5-pins {
> +		pinmux = <APPLE_PINMUX(73, 1)>,
> +			<APPLE_PINMUX(74, 1)>;
> +	};
> +
> +	i2c6_pins: i2c6-pins {
> +		pinmux = <APPLE_PINMUX(75, 1)>,
> +			<APPLE_PINMUX(76, 1)>;
> +	};
> +
> +	i2c7_pins: i2c7-pins {
> +		pinmux = <APPLE_PINMUX(77, 1)>,
> +			<APPLE_PINMUX(78, 1)>;
> +	};
> +
> +	i2c8_pins: i2c8-pins {
> +		pinmux = <APPLE_PINMUX(79, 1)>,
> +			<APPLE_PINMUX(80, 1)>;
> +	};
> +
> +	spi1_pins: spi1-pins {
> +		pinmux = <APPLE_PINMUX(155, 1)>, /* SDI */
> +			<APPLE_PINMUX(156, 1)>,  /* SDO */
> +			<APPLE_PINMUX(157, 1)>,  /* SCK */
> +			<APPLE_PINMUX(158, 1)>;  /* CS */
> +	};
> +
> +	spi2_pins: spi2-pins {
> +		pinmux = <APPLE_PINMUX(159, 1)>, /* SDI */
> +			<APPLE_PINMUX(160, 1)>,  /* SDO */
> +			<APPLE_PINMUX(161, 1)>,  /* SCK */
> +			<APPLE_PINMUX(162, 1)>;  /* CS */
> +	};
> +
> +	spi4_pins: spi4-pins {
> +		pinmux = <APPLE_PINMUX(167, 1)>, /* SDI */
> +			<APPLE_PINMUX(168, 1)>,  /* SDO */
> +			<APPLE_PINMUX(169, 1)>,  /* SCK */
> +			<APPLE_PINMUX(170, 1)>;  /* CS */
> +	};
> +
> +	pcie_pins: pcie-pins {
> +		pinmux = <APPLE_PINMUX(0, 1)>,
> +				<APPLE_PINMUX(1, 1)>,
> +				<APPLE_PINMUX(2, 1)>,
> +				<APPLE_PINMUX(3, 1)>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/apple/t602x-nvme.dtsi b/arch/arm64/boot/dts/apple/t602x-nvme.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..590cec8ac804c0b5b35a53ad20666aee9bdb4da7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/t602x-nvme.dtsi
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +/*
> + * NVMe related devices for Apple T602x SoCs.
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +	DIE_NODE(ans_mbox): mbox@347408000 {
> +		compatible = "apple,t6020-asc-mailbox", "apple,asc-mailbox-v4";
> +		reg = <0x3 0x47408000 0x0 0x4000>;
> +		interrupt-parent = <&aic>;
> +		interrupts = <AIC_IRQ DIE_NO 1169 IRQ_TYPE_LEVEL_HIGH>,
> +			<AIC_IRQ DIE_NO 1170 IRQ_TYPE_LEVEL_HIGH>,
> +			<AIC_IRQ DIE_NO 1171 IRQ_TYPE_LEVEL_HIGH>,
> +			<AIC_IRQ DIE_NO 1172 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "send-empty", "send-not-empty",
> +			"recv-empty", "recv-not-empty";
> +		power-domains = <&DIE_NODE(ps_ans2)>;
> +		#mbox-cells = <0>;
> +	};
> +
> +	DIE_NODE(sart): sart@34bc50000 {
> +		compatible = "apple,t6020-sart", "apple,t6000-sart";
> +		reg = <0x3 0x4bc50000 0x0 0x10000>;
> +		power-domains = <&DIE_NODE(ps_ans2)>;
> +	};
> +
> +	DIE_NODE(nvme): nvme@34bcc0000 {
> +		compatible = "apple,t6020-nvme-ans2", "apple,t8103-nvme-ans2";
> +		reg = <0x3 0x4bcc0000 0x0 0x40000>, <0x3 0x47400000 0x0 0x4000>;
> +		reg-names = "nvme", "ans";
> +		interrupt-parent = <&aic>;
> +		/* The NVME interrupt is always routed to die 0 */
> +		interrupts = <AIC_IRQ 0 1832 IRQ_TYPE_LEVEL_HIGH>;
> +		mboxes = <&DIE_NODE(ans_mbox)>;
> +		apple,sart = <&DIE_NODE(sart)>;
> +		power-domains = <&DIE_NODE(ps_ans2)>,
> +			<&DIE_NODE(ps_apcie_st_sys)>,
> +			<&DIE_NODE(ps_apcie_st1_sys)>;
> +		power-domain-names = "ans", "apcie0", "apcie1";
> +		resets = <&DIE_NODE(ps_ans2)>;
> +	};
> diff --git a/arch/arm64/boot/dts/apple/t602x-pmgr.dtsi b/arch/arm64/boot/dts/apple/t602x-pmgr.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..3dc8899270cfe88dd7547e6754b15952ebe62829
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/t602x-pmgr.dtsi
> @@ -0,0 +1,2268 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +/*
> + * PMGR Power domains for the Apple T6001 "M1 Max" SoC
Here.
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +&DIE_NODE(pmgr) {
> +	DIE_NODE(ps_afi): power-controller@100 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x100 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afi);
> +		apple,always-on; /* Apple Fabric, CPU interface is here */
> +	};
> +
> +	DIE_NODE(ps_aic): power-controller@108 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x108 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(aic);
> +		apple,always-on; /* Core device */
> +	};
> +
> +	DIE_NODE(ps_dwi): power-controller@110 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x110 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dwi);
> +	};
> +
> +	DIE_NODE(ps_pms): power-controller@118 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x118 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(pms);
> +		apple,always-on; /* Core device */
> +	};
> +
> +	DIE_NODE(ps_gpio): power-controller@120 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x120 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(gpio);
> +		power-domains = <&DIE_NODE(ps_sio)>, <&DIE_NODE(ps_pms)>;
> +	};
> +
> +	DIE_NODE(ps_soc_dpe): power-controller@128 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x128 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(soc_dpe);
> +		apple,always-on; /* Core device */
> +	};
> +
> +	DIE_NODE(ps_pms_c1ppt): power-controller@130 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x130 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(pms_c1ppt);
> +		apple,always-on; /* Core device */
> +	};
> +
> +	DIE_NODE(ps_pmgr_soc_ocla): power-controller@138 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x138 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(pmgr_soc_ocla);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_amcc0): power-controller@168 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x168 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(amcc0);
> +		apple,always-on; /* Memory controller */
> +	};
> +
> +	DIE_NODE(ps_amcc2): power-controller@170 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x170 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(amcc2);
> +		apple,always-on; /* Memory controller */
> +	};
> +
> +	DIE_NODE(ps_dcs_00): power-controller@178 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x178 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_00);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_01): power-controller@180 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x180 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_01);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_02): power-controller@188 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x188 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_02);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_03): power-controller@190 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x190 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_03);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_08): power-controller@198 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x198 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_08);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_09): power-controller@1a0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1a0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_09);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_10): power-controller@1a8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1a8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_10);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_11): power-controller@1b0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1b0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_11);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_afnc1_ioa): power-controller@1b8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1b8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc1_ioa);
> +		apple,always-on; /* Apple Fabric */
> +		power-domains = <&DIE_NODE(ps_afi)>;
> +	};
> +
> +	DIE_NODE(ps_afc): power-controller@1d0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1d0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afc);
> +		apple,always-on; /* Apple Fabric, CPU interface is here */
> +	};
> +
> +	DIE_NODE(ps_afnc0_ioa): power-controller@1e8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1e8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc0_ioa);
> +		apple,always-on; /* Apple Fabric */
> +		power-domains = <&DIE_NODE(ps_afi)>;
> +	};
> +
> +	DIE_NODE(ps_afnc1_ls): power-controller@1f0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1f0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc1_ls);
> +		apple,always-on; /* Apple Fabric */
> +		power-domains = <&DIE_NODE(ps_afnc1_ioa)>;
> +	};
> +
> +	DIE_NODE(ps_afnc0_ls): power-controller@1f8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1f8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc0_ls);
> +		apple,always-on; /* Apple Fabric */
> +		power-domains = <&DIE_NODE(ps_afnc0_ioa)>;
> +	};
> +
> +	DIE_NODE(ps_afnc1_lw0): power-controller@200 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x200 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc1_lw0);
> +		apple,always-on; /* Apple Fabric */
> +		power-domains = <&DIE_NODE(ps_afnc1_ls)>;
> +	};
> +
> +	DIE_NODE(ps_afnc1_lw1): power-controller@208 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x208 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc1_lw1);
> +		apple,always-on; /* Apple Fabric */
> +		power-domains = <&DIE_NODE(ps_afnc1_ls)>;
> +	};
> +
> +	DIE_NODE(ps_afnc1_lw2): power-controller@210 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x210 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc1_lw2);
> +		apple,always-on; /* Apple Fabric */
> +		power-domains = <&DIE_NODE(ps_afnc1_ls)>;
> +	};
> +
> +	DIE_NODE(ps_afnc0_lw0): power-controller@218 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x218 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc0_lw0);
> +		apple,always-on; /* Apple Fabric */
> +		power-domains = <&DIE_NODE(ps_afnc0_ls)>;
> +	};
> +
> +	DIE_NODE(ps_scodec): power-controller@220 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x220 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(scodec);
> +		power-domains = <&DIE_NODE(ps_afnc1_lw0)>;
> +	};
> +
> +	DIE_NODE(ps_atc0_common): power-controller@228 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x228 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc0_common);
> +		power-domains = <&DIE_NODE(ps_afnc1_lw1)>;
> +	};
> +
> +	DIE_NODE(ps_atc1_common): power-controller@230 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x230 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc1_common);
> +		power-domains = <&DIE_NODE(ps_afnc1_lw1)>;
> +	};
> +
> +	DIE_NODE(ps_atc2_common): power-controller@238 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x238 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc2_common);
> +		power-domains = <&DIE_NODE(ps_afnc1_lw1)>;
> +	};
> +
> +	DIE_NODE(ps_atc3_common): power-controller@240 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x240 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc3_common);
> +		power-domains = <&DIE_NODE(ps_afnc1_lw1)>;
> +	};
> +
> +	DIE_NODE(ps_dispext1_sys): power-controller@248 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x248 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dispext1_sys);
> +		power-domains = <&DIE_NODE(ps_afnc1_lw2)>;
> +	};
> +
> +	DIE_NODE(ps_pms_bridge): power-controller@250 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x250 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(pms_bridge);
> +		apple,always-on; /* Core device */
> +		power-domains = <&DIE_NODE(ps_afnc0_lw0)>;
> +	};
> +
> +	DIE_NODE(ps_dispext0_sys): power-controller@258 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x258 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dispext0_sys);
> +		power-domains = <&DIE_NODE(ps_afnc0_lw0)>, <&DIE_NODE(ps_afr)>;
> +	};
> +
> +	DIE_NODE(ps_ane_sys): power-controller@260 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x260 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(ane_sys);
> +		power-domains = <&DIE_NODE(ps_afnc0_lw0)>;
> +	};
> +
> +	DIE_NODE(ps_avd_sys): power-controller@268 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x268 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(avd_sys);
> +		power-domains = <&DIE_NODE(ps_afnc0_lw0)>;
> +	};
> +
> +	DIE_NODE(ps_atc0_cio): power-controller@270 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x270 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc0_cio);
> +		power-domains = <&DIE_NODE(ps_atc0_common)>;
> +	};
> +
> +	DIE_NODE(ps_atc0_pcie): power-controller@278 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x278 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc0_pcie);
> +		power-domains = <&DIE_NODE(ps_atc0_common)>;
> +	};
> +
> +	DIE_NODE(ps_atc1_cio): power-controller@280 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x280 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc1_cio);
> +		power-domains = <&DIE_NODE(ps_atc1_common)>;
> +	};
> +
> +	DIE_NODE(ps_atc1_pcie): power-controller@288 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x288 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc1_pcie);
> +		power-domains = <&DIE_NODE(ps_atc1_common)>;
> +	};
> +
> +	DIE_NODE(ps_atc2_cio): power-controller@290 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x290 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc2_cio);
> +		power-domains = <&DIE_NODE(ps_atc2_common)>;
> +	};
> +
> +	DIE_NODE(ps_atc2_pcie): power-controller@298 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x298 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc2_pcie);
> +		power-domains = <&DIE_NODE(ps_atc2_common)>;
> +	};
> +
> +	DIE_NODE(ps_atc3_cio): power-controller@2a0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x2a0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc3_cio);
> +		power-domains = <&DIE_NODE(ps_atc3_common)>;
> +	};
> +
> +	DIE_NODE(ps_atc3_pcie): power-controller@2a8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x2a8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc3_pcie);
> +		power-domains = <&DIE_NODE(ps_atc3_common)>;
> +	};
> +
> +	DIE_NODE(ps_dispext1_fe): power-controller@2b0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x2b0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dispext1_fe);
> +		power-domains = <&DIE_NODE(ps_dispext1_sys)>;
> +	};
> +
> +	DIE_NODE(ps_dispext1_cpu0): power-controller@2b8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x2b8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dispext1_cpu0);
> +		power-domains = <&DIE_NODE(ps_dispext1_fe)>;
> +		apple,min-state = <4>;
> +	};
> +
> +	DIE_NODE(ps_dispext0_fe): power-controller@2c0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x2c0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dispext0_fe);
> +		power-domains = <&DIE_NODE(ps_dispext0_sys)>;
> +	};
> +
> +#if DIE_NO == 0
> +	/* PMP is only present on die 0 of the M1 Ultra */
Here.
> +	DIE_NODE(ps_pmp): power-controller@2c8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x2c8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(pmp);
> +	};
> +#endif
> +
> +	DIE_NODE(ps_pms_sram): power-controller@2d0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x2d0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(pms_sram);
> +	};
> +
> +	DIE_NODE(ps_dispext0_cpu0): power-controller@2d8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x2d8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dispext0_cpu0);
> +		power-domains = <&DIE_NODE(ps_dispext0_fe)>;
> +		apple,min-state = <4>;
> +	};
> +
> +	DIE_NODE(ps_ane_cpu): power-controller@2e0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x2e0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(ane_cpu);
> +		power-domains = <&DIE_NODE(ps_ane_sys)>;
> +	};
> +
> +	DIE_NODE(ps_atc0_cio_pcie): power-controller@2e8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x2e8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc0_cio_pcie);
> +		power-domains = <&DIE_NODE(ps_atc0_cio)>;
> +	};
> +
> +	DIE_NODE(ps_atc0_cio_usb): power-controller@2f0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x2f0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc0_cio_usb);
> +		power-domains = <&DIE_NODE(ps_atc0_cio)>;
> +	};
> +
> +	DIE_NODE(ps_atc1_cio_pcie): power-controller@2f8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x2f8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc1_cio_pcie);
> +		power-domains = <&DIE_NODE(ps_atc1_cio)>;
> +	};
> +
> +	DIE_NODE(ps_atc1_cio_usb): power-controller@300 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x300 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc1_cio_usb);
> +		power-domains = <&DIE_NODE(ps_atc1_cio)>;
> +	};
> +
> +	DIE_NODE(ps_atc2_cio_pcie): power-controller@308 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x308 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc2_cio_pcie);
> +		power-domains = <&DIE_NODE(ps_atc2_cio)>;
> +	};
> +
> +	DIE_NODE(ps_atc2_cio_usb): power-controller@310 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x310 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc2_cio_usb);
> +		power-domains = <&DIE_NODE(ps_atc2_cio)>;
> +	};
> +
> +	DIE_NODE(ps_atc3_cio_pcie): power-controller@318 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x318 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc3_cio_pcie);
> +		power-domains = <&DIE_NODE(ps_atc3_cio)>;
> +	};
> +
> +	DIE_NODE(ps_atc3_cio_usb): power-controller@320 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x320 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc3_cio_usb);
> +		power-domains = <&DIE_NODE(ps_atc3_cio)>;
> +	};
> +
> +	DIE_NODE(ps_trace_fab): power-controller@390 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x390 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(trace_fab);
> +	};
> +
> +	DIE_NODE(ps_ane_sys_mpm): power-controller@4000 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x4000 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(ane_sys_mpm);
> +		power-domains = <&DIE_NODE(ps_ane_sys)>;
> +	};
> +
> +	DIE_NODE(ps_ane_td): power-controller@4008 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x4008 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(ane_td);
> +		power-domains = <&DIE_NODE(ps_ane_sys)>;
> +	};
> +
> +	DIE_NODE(ps_ane_base): power-controller@4010 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x4010 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(ane_base);
> +		power-domains = <&DIE_NODE(ps_ane_td)>;
> +	};
> +
> +	DIE_NODE(ps_ane_set1): power-controller@4018 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x4018 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(ane_set1);
> +		power-domains = <&DIE_NODE(ps_ane_base)>;
> +	};
> +
> +	DIE_NODE(ps_ane_set2): power-controller@4020 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x4020 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(ane_set2);
> +		power-domains = <&DIE_NODE(ps_ane_set1)>;
> +	};
> +
> +	DIE_NODE(ps_ane_set3): power-controller@4028 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x4028 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(ane_set3);
> +		power-domains = <&DIE_NODE(ps_ane_set2)>;
> +	};
> +
> +	DIE_NODE(ps_ane_set4): power-controller@4030 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x4030 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(ane_set4);
> +		power-domains = <&DIE_NODE(ps_ane_set3)>;
> +	};
> +};
> +
> +&DIE_NODE(pmgr_south) {
> +	DIE_NODE(ps_amcc4): power-controller@100 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x100 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(amcc4);
> +		apple,always-on;
> +	};
> +
> +	DIE_NODE(ps_amcc5): power-controller@108 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x108 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(amcc5);
> +		apple,always-on;
> +	};
> +
> +	DIE_NODE(ps_amcc6): power-controller@110 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x110 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(amcc6);
> +		apple,always-on;
> +	};
> +
> +	DIE_NODE(ps_amcc7): power-controller@118 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x118 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(amcc7);
> +		apple,always-on;
> +	};
> +
> +	DIE_NODE(ps_dcs_16): power-controller@120 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x120 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_16);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_17): power-controller@128 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x128 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_17);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_18): power-controller@130 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x130 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_18);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_19): power-controller@138 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x138 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_19);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_20): power-controller@140 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x140 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_20);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_21): power-controller@148 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x148 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_21);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_22): power-controller@150 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x150 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_22);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_23): power-controller@158 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x158 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_23);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_24): power-controller@160 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x160 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_24);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_25): power-controller@168 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x168 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_25);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_26): power-controller@170 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x170 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_26);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_27): power-controller@178 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x178 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_27);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_28): power-controller@180 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x180 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_28);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_29): power-controller@188 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x188 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_29);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_30): power-controller@190 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x190 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_30);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_31): power-controller@198 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x198 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_31);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_afnc4_ioa): power-controller@1a0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1a0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc4_ioa);
> +		apple,always-on; /* Apple Fabric */
> +		power-domains = <&DIE_NODE(ps_afi)>;
> +	};
> +
> +	DIE_NODE(ps_afnc4_ls): power-controller@1a8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1a8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc4_ls);
> +		apple,always-on; /* Apple Fabric */
> +		power-domains = <&DIE_NODE(ps_afnc4_ioa)>;
> +	};
> +
> +	DIE_NODE(ps_afnc4_lw0): power-controller@1b0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1b0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc4_lw0);
> +		apple,always-on; /* Apple Fabric */
> +		power-domains = <&DIE_NODE(ps_afnc4_ls)>;
> +	};
> +
> +	DIE_NODE(ps_afnc5_ioa): power-controller@1b8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1b8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc5_ioa);
> +		apple,always-on; /* Apple Fabric */
> +		power-domains = <&DIE_NODE(ps_afi)>;
> +	};
> +
> +	DIE_NODE(ps_afnc5_ls): power-controller@1c0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1c0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc5_ls);
> +		apple,always-on; /* Apple Fabric */
> +		power-domains = <&DIE_NODE(ps_afnc5_ioa)>;
> +	};
> +
> +	DIE_NODE(ps_afnc5_lw0): power-controller@1c8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1c8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc5_lw0);
> +		apple,always-on; /* Apple Fabric */
> +		power-domains = <&DIE_NODE(ps_afnc5_ls)>;
> +	};
> +
> +	DIE_NODE(ps_dispext2_sys): power-controller@1d0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1d0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dispext2_sys);
> +	};
> +
> +	DIE_NODE(ps_msr1): power-controller@1d8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1d8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(msr1);
> +	};
> +
> +	DIE_NODE(ps_dispext2_fe): power-controller@1e0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1e0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dispext2_fe);
> +		power-domains = <&DIE_NODE(ps_dispext2_sys)>;
> +	};
> +
> +	DIE_NODE(ps_dispext2_cpu0): power-controller@1e8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1e8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dispext2_cpu0);
> +		power-domains = <&DIE_NODE(ps_dispext2_fe)>;
> +		apple,min-state = <4>;
> +	};
> +
> +	DIE_NODE(ps_msr1_ase_core): power-controller@1f0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1f0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(msr1_ase_core);
> +		power-domains = <&DIE_NODE(ps_msr1)>;
> +	};
> +
> +	DIE_NODE(ps_dispext3_sys): power-controller@220 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x220 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dispext3_sys);
> +	};
> +
> +	DIE_NODE(ps_venc1_sys): power-controller@228 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x228 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(venc1_sys);
> +	};
> +
> +	DIE_NODE(ps_dispext3_fe): power-controller@230 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x230 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dispext3_fe);
> +		power-domains = <&DIE_NODE(ps_dispext3_sys)>;
> +	};
> +
> +	DIE_NODE(ps_dispext3_cpu0): power-controller@238 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x238 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dispext3_cpu0);
> +		power-domains = <&DIE_NODE(ps_dispext3_fe)>;
> +		apple,min-state = <4>;
> +	};
> +
> +	DIE_NODE(ps_venc1_dma): power-controller@4000 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x4000 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(venc1_dma);
> +		power-domains = <&DIE_NODE(ps_venc1_sys)>;
> +	};
> +
> +	DIE_NODE(ps_venc1_pipe4): power-controller@4008 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x4008 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(venc1_pipe4);
> +		power-domains = <&DIE_NODE(ps_venc1_dma)>;
> +	};
> +
> +	DIE_NODE(ps_venc1_pipe5): power-controller@4010 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x4010 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(venc1_pipe5);
> +		power-domains = <&DIE_NODE(ps_venc1_dma)>;
> +	};
> +
> +	DIE_NODE(ps_venc1_me0): power-controller@4018 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x4018 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(venc1_me0);
> +		power-domains = <&DIE_NODE(ps_venc1_pipe5)>, <&DIE_NODE(ps_venc1_pipe4)>;
> +	};
> +
> +	DIE_NODE(ps_venc1_me1): power-controller@4020 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x4020 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(venc1_me1);
> +		power-domains = <&DIE_NODE(ps_venc1_me0)>;
> +	};
> +};
> +
> +&DIE_NODE(pmgr_east) {
> +	DIE_NODE(ps_clvr_spmi0): power-controller@100 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x100 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(clvr_spmi0);
> +		apple,always-on; /* PCPU voltage regulator interface (used by SMC) */
> +	};
> +
> +	DIE_NODE(ps_clvr_spmi1): power-controller@108 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x108 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(clvr_spmi1);
> +		apple,always-on; /* GPU voltage regulator interface (used by SMC) */
> +	};
> +
> +	DIE_NODE(ps_clvr_spmi2): power-controller@110 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x110 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(clvr_spmi2);
> +		apple,always-on; /* ANE, fabric, AFR voltage regulator interface (used by SMC) */
> +	};
> +
> +	DIE_NODE(ps_clvr_spmi3): power-controller@118 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x118 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(clvr_spmi3);
> +		apple,always-on; /* Additional voltage regulator, probably used on T6021 (SMC) */
> +	};
> +
> +	DIE_NODE(ps_clvr_spmi4): power-controller@120 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x120 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(clvr_spmi4);
> +		apple,always-on; /* Additional voltage regulator, probably used on T6021 (SMC) */
> +	};
> +
> +	DIE_NODE(ps_ispsens0): power-controller@128 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x128 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(ispsens0);
> +	};
> +
> +	DIE_NODE(ps_ispsens1): power-controller@130 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x130 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(ispsens1);
> +	};
> +
> +	DIE_NODE(ps_ispsens2): power-controller@138 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x138 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(ispsens2);
> +	};
> +
> +	DIE_NODE(ps_ispsens3): power-controller@140 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x140 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(ispsens3);
> +	};
> +
> +	DIE_NODE(ps_afnc6_ioa): power-controller@148 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x148 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc6_ioa);
> +		apple,always-on;
> +		power-domains = <&DIE_NODE(ps_afi)>;
> +	};
> +
> +	DIE_NODE(ps_afnc6_ls): power-controller@150 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x150 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc6_ls);
> +		apple,always-on;
> +		power-domains = <&DIE_NODE(ps_afnc6_ioa)>;
> +	};
> +
> +	DIE_NODE(ps_afnc6_lw0): power-controller@158 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x158 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc6_lw0);
> +		apple,always-on;
> +		power-domains = <&DIE_NODE(ps_afnc6_ls)>;
> +	};
> +
> +	DIE_NODE(ps_afnc2_ioa): power-controller@160 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x160 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc2_ioa);
> +		apple,always-on;
> +		power-domains = <&DIE_NODE(ps_dcs_10)>;
> +	};
> +
> +	DIE_NODE(ps_afnc2_ls): power-controller@168 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x168 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc2_ls);
> +		apple,always-on;
> +		power-domains = <&DIE_NODE(ps_afnc2_ioa)>;
> +	};
> +
> +	DIE_NODE(ps_afnc2_lw0): power-controller@170 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x170 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc2_lw0);
> +		apple,always-on;
> +		power-domains = <&DIE_NODE(ps_afnc2_ls)>;
> +	};
> +
> +	DIE_NODE(ps_afnc2_lw1): power-controller@178 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x178 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc2_lw1);
> +		apple,always-on;
> +		power-domains = <&DIE_NODE(ps_afnc2_ls)>;
> +	};
> +
> +	DIE_NODE(ps_afnc3_ioa): power-controller@180 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x180 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc3_ioa);
> +		apple,always-on;
> +		power-domains = <&DIE_NODE(ps_afi)>;
> +	};
> +
> +	DIE_NODE(ps_afnc3_ls): power-controller@188 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x188 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc3_ls);
> +		apple,always-on;
> +		power-domains = <&DIE_NODE(ps_afnc3_ioa)>;
> +	};
> +
> +	DIE_NODE(ps_afnc3_lw0): power-controller@190 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x190 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afnc3_lw0);
> +		apple,always-on;
> +		power-domains = <&DIE_NODE(ps_afnc3_ls)>;
> +	};
> +
> +	DIE_NODE(ps_apcie_gp): power-controller@198 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x198 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(apcie_gp);
> +		power-domains = <&DIE_NODE(ps_afnc6_lw0)>;
> +	};
> +
> +	DIE_NODE(ps_apcie_st): power-controller@1a0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1a0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(apcie_st);
> +		power-domains = <&DIE_NODE(ps_afnc6_lw0)>;
> +	};
> +
> +	DIE_NODE(ps_ans2): power-controller@1a8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1a8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(ans2);
> +		power-domains = <&DIE_NODE(ps_afnc6_lw0)>;
> +	};
> +
> +	DIE_NODE(ps_disp0_sys): power-controller@1b0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1b0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(disp0_sys);
> +		power-domains = <&DIE_NODE(ps_afnc2_lw0)>;
> +	};
> +
> +	DIE_NODE(ps_jpg): power-controller@1b8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1b8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(jpg);
> +		power-domains = <&DIE_NODE(ps_afnc2_lw0)>;
> +	};
> +
> +	DIE_NODE(ps_sio): power-controller@1c0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1c0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(sio);
> +		power-domains = <&DIE_NODE(ps_afnc2_lw1)>;
> +	};
> +
> +	DIE_NODE(ps_isp_sys): power-controller@1c8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1c8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(isp_sys);
> +		power-domains = <&DIE_NODE(ps_afnc2_lw1)>;
> +		status = "disabled";
> +	};
> +
> +	DIE_NODE(ps_disp0_fe): power-controller@1d0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1d0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(disp0_fe);
> +		power-domains = <&DIE_NODE(ps_disp0_sys)>;
> +	};
> +
> +	DIE_NODE(ps_disp0_cpu0): power-controller@1d8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1d8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(disp0_cpu0);
> +		power-domains = <&DIE_NODE(ps_disp0_fe)>;
> +		apple,min-state = <4>;
> +	};
> +
> +	DIE_NODE(ps_sio_cpu): power-controller@1e0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1e0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(sio_cpu);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_fpwm0): power-controller@1e8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1e8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(fpwm0);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_fpwm1): power-controller@1f0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1f0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(fpwm1);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_fpwm2): power-controller@1f8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x1f8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(fpwm2);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_i2c0): power-controller@200 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x200 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(i2c0);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_i2c1): power-controller@208 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x208 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(i2c1);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_i2c2): power-controller@210 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x210 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(i2c2);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_i2c3): power-controller@218 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x218 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(i2c3);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_i2c4): power-controller@220 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x220 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(i2c4);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_i2c5): power-controller@228 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x228 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(i2c5);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_i2c6): power-controller@230 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x230 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(i2c6);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_i2c7): power-controller@238 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x238 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(i2c7);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_i2c8): power-controller@240 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x240 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(i2c8);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_spi_p): power-controller@248 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x248 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(spi_p);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_sio_spmi0): power-controller@250 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x250 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(sio_spmi0);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_sio_spmi1): power-controller@258 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x258 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(sio_spmi1);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_sio_spmi2): power-controller@260 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x260 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(sio_spmi2);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_uart_p): power-controller@268 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x268 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(uart_p);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_audio_p): power-controller@270 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x270 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(audio_p);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_sio_adma): power-controller@278 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x278 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(sio_adma);
> +		power-domains = <&DIE_NODE(ps_audio_p)>, <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_aes): power-controller@280 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x280 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(aes);
> +		apple,always-on;
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_dptx_phy_ps): power-controller@288 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x288 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dptx_phy_ps);
> +		power-domains = <&DIE_NODE(ps_sio)>;
> +	};
> +
> +	DIE_NODE(ps_spi0): power-controller@2d8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x2d8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(spi0);
> +		power-domains = <&DIE_NODE(ps_spi_p)>;
> +	};
> +
> +	DIE_NODE(ps_spi1): power-controller@2e0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x2e0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(spi1);
> +		power-domains = <&DIE_NODE(ps_spi_p)>;
> +	};
> +
> +	DIE_NODE(ps_spi2): power-controller@2e8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x2e8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(spi2);
> +		power-domains = <&DIE_NODE(ps_spi_p)>;
> +	};
> +
> +	DIE_NODE(ps_spi3): power-controller@2f0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x2f0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(spi3);
> +		power-domains = <&DIE_NODE(ps_spi_p)>;
> +	};
> +
> +	DIE_NODE(ps_spi4): power-controller@2f8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x2f8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(spi4);
> +		power-domains = <&DIE_NODE(ps_spi_p)>;
> +	};
> +
> +	DIE_NODE(ps_spi5): power-controller@300 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x300 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(spi5);
> +		power-domains = <&DIE_NODE(ps_spi_p)>;
> +	};
> +
> +	DIE_NODE(ps_uart_n): power-controller@308 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x308 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(uart_n);
> +		power-domains = <&DIE_NODE(ps_uart_p)>;
> +	};
> +
> +	DIE_NODE(ps_uart0): power-controller@310 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x310 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(uart0);
> +		power-domains = <&DIE_NODE(ps_uart_p)>;
> +	};
> +
> +	DIE_NODE(ps_amcc1): power-controller@318 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x318 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(amcc1);
> +		apple,always-on;
> +	};
> +
> +	DIE_NODE(ps_amcc3): power-controller@320 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x320 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(amcc3);
> +		apple,always-on;
> +	};
> +
> +	DIE_NODE(ps_dcs_04): power-controller@328 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x328 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_04);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_05): power-controller@330 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x330 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_05);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_06): power-controller@338 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x338 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_06);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_07): power-controller@340 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x340 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_07);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_12): power-controller@348 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x348 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_12);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_13): power-controller@350 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x350 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_13);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_14): power-controller@358 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x358 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_14);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_dcs_15): power-controller@360 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x360 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dcs_15);
> +		apple,always-on; /* LPDDR5 interface */
> +	};
> +
> +	DIE_NODE(ps_uart1): power-controller@368 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x368 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(uart1);
> +		power-domains = <&DIE_NODE(ps_uart_p)>;
> +	};
> +
> +	DIE_NODE(ps_uart2): power-controller@370 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x370 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(uart2);
> +		power-domains = <&DIE_NODE(ps_uart_p)>;
> +	};
> +
> +	DIE_NODE(ps_uart3): power-controller@378 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x378 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(uart3);
> +		power-domains = <&DIE_NODE(ps_uart_p)>;
> +	};
> +
> +	DIE_NODE(ps_uart4): power-controller@380 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x380 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(uart4);
> +		power-domains = <&DIE_NODE(ps_uart_p)>;
> +	};
> +
> +	DIE_NODE(ps_uart5): power-controller@388 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x388 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(uart5);
> +		power-domains = <&DIE_NODE(ps_uart_p)>;
> +	};
> +
> +	DIE_NODE(ps_uart6): power-controller@390 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x390 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(uart6);
> +		power-domains = <&DIE_NODE(ps_uart_p)>;
> +	};
> +
> +	DIE_NODE(ps_mca0): power-controller@398 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x398 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(mca0);
> +		power-domains = <&DIE_NODE(ps_audio_p)>, <&DIE_NODE(ps_sio_adma)>;
> +	};
> +
> +	DIE_NODE(ps_mca1): power-controller@3a0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x3a0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(mca1);
> +		power-domains = <&DIE_NODE(ps_audio_p)>, <&DIE_NODE(ps_sio_adma)>;
> +	};
> +
> +	DIE_NODE(ps_mca2): power-controller@3a8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x3a8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(mca2);
> +		power-domains = <&DIE_NODE(ps_audio_p)>, <&DIE_NODE(ps_sio_adma)>;
> +	};
> +
> +	DIE_NODE(ps_mca3): power-controller@3b0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x3b0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(mca3);
> +		power-domains = <&DIE_NODE(ps_audio_p)>, <&DIE_NODE(ps_sio_adma)>;
> +	};
> +
> +	DIE_NODE(ps_dpa0): power-controller@3b8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x3b8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dpa0);
> +		power-domains = <&DIE_NODE(ps_audio_p)>;
> +	};
> +
> +	DIE_NODE(ps_dpa1): power-controller@3c0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x3c0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dpa1);
> +		power-domains = <&DIE_NODE(ps_audio_p)>;
> +	};
> +
> +	DIE_NODE(ps_dpa2): power-controller@3c8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x3c8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dpa2);
> +		power-domains = <&DIE_NODE(ps_audio_p)>;
> +	};
> +
> +	DIE_NODE(ps_dpa3): power-controller@3d0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x3d0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dpa3);
> +		power-domains = <&DIE_NODE(ps_audio_p)>;
> +	};
> +
> +	DIE_NODE(ps_msr0): power-controller@3d8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x3d8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(msr0);
> +	};
> +
> +	DIE_NODE(ps_venc_sys): power-controller@3e0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x3e0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(venc_sys);
> +	};
> +
> +	DIE_NODE(ps_dpa4): power-controller@3e8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x3e8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dpa4);
> +		power-domains = <&DIE_NODE(ps_audio_p)>;
> +	};
> +
> +	DIE_NODE(ps_msr0_ase_core): power-controller@3f0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x3f0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(msr0_ase_core);
> +		power-domains = <&DIE_NODE(ps_msr0)>;
> +	};
> +
> +	DIE_NODE(ps_apcie_gpshr_sys): power-controller@3f8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x3f8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(apcie_gpshr_sys);
> +		power-domains = <&DIE_NODE(ps_apcie_gp)>;
> +	};
> +
> +	DIE_NODE(ps_apcie_st_sys): power-controller@408 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x408 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(apcie_st_sys);
> +		power-domains = <&DIE_NODE(ps_apcie_st)>, <&DIE_NODE(ps_ans2)>;
> +	};
> +
> +	DIE_NODE(ps_apcie_st1_sys): power-controller@410 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x410 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(apcie_st1_sys);
> +		power-domains = <&DIE_NODE(ps_apcie_st_sys)>;
> +	};
> +
> +	DIE_NODE(ps_apcie_gp_sys): power-controller@418 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x418 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(apcie_gp_sys);
> +		power-domains = <&DIE_NODE(ps_apcie_gpshr_sys)>;
> +		apple,always-on; /* Breaks things if shut down */
> +	};
> +
> +	DIE_NODE(ps_apcie_ge_sys): power-controller@420 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x420 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(apcie_ge_sys);
> +		power-domains = <&DIE_NODE(ps_apcie_gpshr_sys)>;
> +	};
> +
> +	DIE_NODE(ps_apcie_phy_sw): power-controller@428 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x428 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(apcie_phy_sw);
> +		apple,always-on; /* macOS does not turn this off */
> +	};
> +
> +	DIE_NODE(ps_sep): power-controller@c00 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0xc00 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(sep);
> +		apple,always-on; /* Locked on */
> +	};
> +
> +	/* There is a dependency tree involved with these PDs,
> +	 * but we do not express it here since the ISP driver
> +	 * is supposed to sequence them in the right order anyway.
> +	 *
> +	 * This also works around spurious parent PD activation
> +	 * on machines with ISP disabled (desktops), so we don't
> +	 * have to enable/disable everything in the per-model DTs.
> +	 */
> +	DIE_NODE(ps_isp_cpu): power-controller@4000 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x4000 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(isp_cpu);
> +		/* power-domains = <&DIE_NODE(ps_isp_sys)>; */
> +	};
> +
> +	DIE_NODE(ps_isp_fe): power-controller@4008 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x4008 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(isp_fe);
> +		/* power-domains = <&DIE_NODE(ps_isp_sys)>; */
> +	};
> +
> +	DIE_NODE(ps_dprx): power-controller@4010 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x4010 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(dprx);
> +		/* power-domains = <&DIE_NODE(ps_isp_sys)>; */
> +	};
> +
> +	DIE_NODE(ps_isp_vis): power-controller@4018 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x4018 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(isp_vis);
> +		/* power-domains = <&DIE_NODE(ps_isp_fe)>; */
> +	};
> +
> +	DIE_NODE(ps_isp_be): power-controller@4020 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x4020 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(isp_be);
> +		/* power-domains = <&DIE_NODE(ps_isp_fe)>; */
> +	};
> +
> +	DIE_NODE(ps_isp_raw): power-controller@4028 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x4028 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(isp_raw);
> +		/* power-domains = <&DIE_NODE(ps_isp_fe)>; */
> +	};
> +
> +	DIE_NODE(ps_isp_clr): power-controller@4030 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x4030 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(isp_clr);
> +		/* power-domains = <&DIE_NODE(ps_isp_be)>; */
> +	};
> +
> +	DIE_NODE(ps_venc_dma): power-controller@8000 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x8000 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(venc_dma);
> +		power-domains = <&DIE_NODE(ps_venc_sys)>;
> +	};
> +
> +	DIE_NODE(ps_venc_pipe4): power-controller@8008 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x8008 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(venc_pipe4);
> +		power-domains = <&DIE_NODE(ps_venc_dma)>;
> +	};
> +
> +	DIE_NODE(ps_venc_pipe5): power-controller@8010 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x8010 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(venc_pipe5);
> +		power-domains = <&DIE_NODE(ps_venc_dma)>;
> +	};
> +
> +	DIE_NODE(ps_venc_me0): power-controller@8018 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x8018 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(venc_me0);
> +		power-domains = <&DIE_NODE(ps_venc_pipe5)>, <&DIE_NODE(ps_venc_pipe4)>;
> +	};
> +
> +	DIE_NODE(ps_venc_me1): power-controller@8020 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x8020 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(venc_me1);
> +		power-domains = <&DIE_NODE(ps_venc_me0)>;
> +	};
> +
> +	DIE_NODE(ps_prores): power-controller@c000 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0xc000 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(prores);
> +		power-domains = <&DIE_NODE(ps_afnc3_lw0)>;
> +	};
> +};
> +
> +&DIE_NODE(pmgr_mini) {
> +	DIE_NODE(ps_debug): power-controller@58 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x58 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(debug);
> +		apple,always-on; /* Core AON device */
> +	};
> +
> +	DIE_NODE(ps_nub_spmi0): power-controller@60 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x60 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(nub_spmi0);
> +		apple,always-on; /* Core AON device */
> +	};
> +
> +	DIE_NODE(ps_nub_spmi1): power-controller@68 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x68 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(nub_spmi1);
> +		apple,always-on; /* Core AON device */
> +	};
> +
> +	DIE_NODE(ps_nub_aon): power-controller@70 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x70 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(nub_aon);
> +		apple,always-on; /* Core AON device */
> +	};
> +
> +	DIE_NODE(ps_msg): power-controller@78 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x78 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(msg);
> +		apple,always-on; /* Core AON device? */
> +	};
> +
> +	DIE_NODE(ps_nub_gpio): power-controller@80 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x80 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(nub_gpio);
> +		apple,always-on; /* Core AON device */
> +	};
> +
> +	DIE_NODE(ps_nub_fabric): power-controller@88 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x88 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(nub_fabric);
> +		apple,always-on; /* Core AON device */
> +	};
> +
> +	DIE_NODE(ps_atc0_usb_aon): power-controller@90 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x90 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc0_usb_aon);
> +		apple,always-on; /* Needs to stay on for dwc3 to work */
> +	};
> +
> +	DIE_NODE(ps_atc1_usb_aon): power-controller@98 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x98 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc1_usb_aon);
> +		apple,always-on; /* Needs to stay on for dwc3 to work */
> +	};
> +
> +	DIE_NODE(ps_atc2_usb_aon): power-controller@a0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0xa0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc2_usb_aon);
> +		apple,always-on; /* Needs to stay on for dwc3 to work */
> +	};
> +
> +	DIE_NODE(ps_atc3_usb_aon): power-controller@a8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0xa8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc3_usb_aon);
> +		apple,always-on; /* Needs to stay on for dwc3 to work */
> +	};
> +
> +	DIE_NODE(ps_mtp_fabric): power-controller@b0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0xb0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(mtp_fabric);
> +		apple,always-on;
> +		power-domains = <&DIE_NODE(ps_nub_fabric)>;
> +		status = "disabled";
> +	};
> +
> +	DIE_NODE(ps_nub_sram): power-controller@b8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0xb8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(nub_sram);
> +		apple,always-on; /* Core AON device */
> +	};
> +
> +	DIE_NODE(ps_debug_switch): power-controller@c0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0xc0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(debug_switch);
> +		apple,always-on; /* Core AON device */
> +	};
> +
> +	DIE_NODE(ps_atc0_usb): power-controller@c8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0xc8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc0_usb);
> +		power-domains = <&DIE_NODE(ps_atc0_common)>;
> +	};
> +
> +	DIE_NODE(ps_atc1_usb): power-controller@d0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0xd0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc1_usb);
> +		power-domains = <&DIE_NODE(ps_atc1_common)>;
> +	};
> +
> +	DIE_NODE(ps_atc2_usb): power-controller@d8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0xd8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc2_usb);
> +		power-domains = <&DIE_NODE(ps_atc2_common)>;
> +	};
> +
> +	DIE_NODE(ps_atc3_usb): power-controller@e0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0xe0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(atc3_usb);
> +		power-domains = <&DIE_NODE(ps_atc3_common)>;
> +	};
> +
> +#if 0
> +	/* MTP stuff is self-managed */
> +	DIE_NODE(ps_mtp_gpio): power-controller@e8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0xe8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(mtp_gpio);
> +		apple,always-on; /* MTP always stays on */
> +		power-domains = <&DIE_NODE(ps_mtp_fabric)>;
> +	};
> +
> +	DIE_NODE(ps_mtp_base): power-controller@f0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0xf0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(mtp_base);
> +		apple,always-on; /* MTP always stays on */
> +		power-domains = <&DIE_NODE(ps_mtp_fabric)>;
> +	};
> +
> +	DIE_NODE(ps_mtp_periph): power-controller@f8 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0xf8 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(mtp_periph);
> +		apple,always-on; /* MTP always stays on */
> +		power-domains = <&DIE_NODE(ps_mtp_fabric)>;
> +	};
> +
> +	DIE_NODE(ps_mtp_spi0): power-controller@100 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x100 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(mtp_spi0);
> +		apple,always-on; /* MTP always stays on */
> +		power-domains = <&DIE_NODE(ps_mtp_fabric)>;
> +	};
> +
> +	DIE_NODE(ps_mtp_i2cm0): power-controller@108 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x108 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(mtp_i2cm0);
> +		apple,always-on; /* MTP always stays on */
> +		power-domains = <&DIE_NODE(ps_mtp_fabric)>;
> +	};
> +
> +	DIE_NODE(ps_mtp_uart0): power-controller@110 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x110 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(mtp_uart0);
> +		apple,always-on; /* MTP always stays on */
> +		power-domains = <&DIE_NODE(ps_mtp_fabric)>;
> +	};
> +
> +	DIE_NODE(ps_mtp_cpu): power-controller@118 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x118 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(mtp_cpu);
> +		apple,always-on; /* MTP always stays on */
> +		power-domains = <&DIE_NODE(ps_mtp_fabric)>;
> +	};
> +
> +	DIE_NODE(ps_mtp_scm_fabric): power-controller@120 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x120 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(mtp_scm_fabric);
> +		apple,always-on; /* MTP always stays on */
> +		power-domains = <&DIE_NODE(ps_mtp_periph)>;
> +	};
> +
> +	DIE_NODE(ps_mtp_sram): power-controller@128 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x128 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(mtp_sram);
> +		apple,always-on; /* MTP always stays on */
> +		power-domains = <&DIE_NODE(ps_mtp_scm_fabric)>, <&DIE_NODE(ps_mtp_cpu)>;
> +	};
> +
> +	DIE_NODE(ps_mtp_dma): power-controller@130 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x130 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(mtp_dma);
> +		apple,always-on; /* MTP always stays on */
> +		power-domains = <&DIE_NODE(ps_mtp_sram)>;
> +	};
> +#endif
> +};
> +
> +&DIE_NODE(pmgr_gfx) {
> +	DIE_NODE(ps_gpx): power-controller@0 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x0 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(gpx);
> +		apple,min-state = <4>;
> +		apple,always-on;
> +	};
> +
> +	DIE_NODE(ps_afr): power-controller@100 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x100 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(afr);
> +		/* Apple Fabric, media stuff: this can power down */
> +		apple,min-state = <4>;
> +	};
> +
> +	DIE_NODE(ps_gfx): power-controller@108 {
> +		compatible = "apple,t6020-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
> +		reg = <0x108 4>;
> +		#power-domain-cells = <0>;
> +		#reset-cells = <0>;
> +		label = DIE_LABEL(gfx);
> +		power-domains = <&DIE_NODE(ps_afr)>, <&DIE_NODE(ps_gpx)>;
> +	};
> +};
>
>
Best regards,
Nick Chan

