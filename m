Return-Path: <linux-i2c+bounces-12498-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA78B3A40A
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 17:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13B0D206F46
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 15:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65A422156A;
	Thu, 28 Aug 2025 15:16:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7793B21C9EA;
	Thu, 28 Aug 2025 15:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756394214; cv=none; b=SvnkFhcOxWJ+FVwcmbhsWyeXaKO0Wnpptm6hoki4gNCUgyegs/gKaNlAgRUWD4P72VgBsqzRgTKvYmienvuRuo0lA9apQ/vfT7zhhywsWb8of73L8cQv9305y7eWeGWspeJ08CG9P7DuRdiDTEu3aGi9arFhzRBDhtJIhprDJFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756394214; c=relaxed/simple;
	bh=p7a5XSCOIIb5ognlAWc4/hzjceL1nBmJLNpjNSrPJuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJFpKF5okNkZPvEMHOrHv6Lz36T04Q6xJOrvevPlEL2rd5yi3qtXdZt+K9OGhf1lRFltsWwJ+5m5Bx3EtdA+4xJzEhcC4XkVIRBqARC3ujJjJkYv0qWJeGzdjVi7tPT2R/Cyu500XtIYZ87zfYjB2U6y38m4oxCaVCyFtH7N6c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afec5651966so188809466b.2;
        Thu, 28 Aug 2025 08:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756394210; x=1756999010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+bpvOaQAXy7s2cVIMAXdoNDiAVCsEFrmVcS+pTDris=;
        b=OJwsVf3hoCDkL67mUDfJCqxnQLVQ9KndKlEYs8FPEZj0YRolx0XmLFt7Vn8HuhZ3Bg
         q6Q6LwxFUQXcXcXAkJhzFKK2Lt1hTJbljdjLwgjpENmyk9yOHbwLSrugTfQUFG9OKD2h
         24AMHFEm0zH857YP6NCkyGxzgunyQwuHPCdHvmA8JMcr2weC5AYA3wHRdfNV87A75wrk
         olgSQr1mlk4qJ0xtftyd73ALKRtq86GRBZ548F4dc0MtNcpgRRX65BF2xblLDl+m9Oa9
         gv1o/0wB+S1JOgdQytu4lpDKhEm8f4F4camTbLRho1k9rWvV4Ma76Tmtbv8K7mqkXf3Q
         fwQA==
X-Forwarded-Encrypted: i=1; AJvYcCU4jreBMcPvtONTKY0jI18CYbTKRKpD8VVGb4JMLJcggXLnCWg5CLz5JoK516Pv4Cf6w6/VjbCfAyk=@vger.kernel.org, AJvYcCUkon492lW3yxcIG6Vd7EdiVq/QifDsFmywMFGzlzAz7FvCFQPM8q65vb0aJJczRF9Iz09j/lXA0SJwjPBpIwu5@vger.kernel.org, AJvYcCUmJGBdOBlxX7VXRYS/vy/sQs7n8nLl08nGraWFhDtRnI4MzTZztfq/8RI1Rj8PIBSBe9ozutEzVCaU@vger.kernel.org, AJvYcCVFPBKqM244eb7Mb2ykm74zBxAZ4Qikgc/Kj7BqmKTUqUEL3ijplA5TK4CEMe+eZos+SfvMQ1rZnB23fDs=@vger.kernel.org, AJvYcCVko8ePjFDesXCknrpqXZonzAQlaIsLH0bDqrgGmSPUORAWMaTDCUgeBaFsktOMGfYJ8la+IWYbU+wG@vger.kernel.org, AJvYcCVm9ZaJ3gQfE4EXhyumcXpLLzLpS5mexkNTIHhHd56/N2Mhwx1POTH0w4Cj06Pu5EdAh1FmcskmPT8qmA==@vger.kernel.org, AJvYcCW7vH14DlRTZQ7hPPKNZ8HTAbdMCtD0orwEhFaQYKZFc5NxZDm/wKBFvSzbYJiGVey0JZG3mAUlX63R@vger.kernel.org, AJvYcCWIjamdC/vZxm4Ogbe4ZrnJp+373MpjnUKRCqTOcIjahe5vE24kijv2cmi+89nYK+L7MJNsWSQvySKh@vger.kernel.org, AJvYcCWoTZe+vWHAtZpbI9jlM0A71YgY7v3IuqwIbd5sUrS/drNZtLIruYORagUc0pZmcXe9xnQMTqzU+QQjezciBmM=@vger.kernel.org, AJvYcCXC0L2H+sLE476fMFBL76Gr
 wrqLORlmEOousFNB58DSm8IKj5VmaxREVk15pXgmcm9C5AjyQVFPqL7YzxqPcGY=@vger.kernel.org, AJvYcCXC2GtBeR3mq8gWLL5v3qg0VlG9HCamhjICSEMb+X5r7ycyI5YXBeldi0EB92DQz8ziNDVk5rWDhoht@vger.kernel.org, AJvYcCXT5Sr+OIZxCbMS1meItDmHW5ee+The/8g7d3Ah/ka//Hm8zx/t57e1nQaUQ33MM5dk2VP+Y+Ctl1hjEnT5@vger.kernel.org, AJvYcCXubgLyZ7mjLNR1iGW5suOW6ZouGYh5gC+uHhOj0mlEmHum0YVltcGCnhDgoBOPs0yUsmlOKKMFE0P+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnx4GlNrxTFvs8wIIk1h+0rrjMTsrpRkZof8MYkEm+AteY9pHL
	GWNGhVeKff0uJKIDNiHtsDu5SiHJ42QAK7O9/9z3L9FFLkUBxSFKt+xmNnySM6FWMhY=
X-Gm-Gg: ASbGnctlkoHmAKH2VwADJ6/nbHQrHYCcpl0oI41nl5roR27vS5QFQgGfBFQBhrQ6Bgd
	KXvex6NLr2slqdFZvqJC3nJAsTH9TLoJIUflD/HGYLH9LT9eM031FXWMa21zvfSHpqu/6/glXkA
	aE/KPvUGCHfTjzuhzvFSRYWWK242lPTPLNl08q+uW4m0rJqm8cgpShG6HFUrHVlu0hA0R0QpNwC
	hoHU0go7eZ3VFyLJiQr1TCwmUq3vN8uFK4xt4ozkCOfRQUbApTm9ovVCpGck6B6GTRToGJnvYt9
	26I6fj5VDxGj7WLvI/umUHA87+lRaSfLW8XSB/L63wFAeND7/6cWUMWovPh5F4wVn6+pLSQf8F2
	1FZAx5CG56c+su32lX6o4o9Wrh15z1hzqjUbcoJOBhlAVzXNg4BrsMT2VTerGbUhYwZiMkv6vvg
	gd00GBxRJtLg02xbcHiHs=
X-Google-Smtp-Source: AGHT+IFrwVpgVqRw2pee3omOSBCbu8XFasOT8pvY5FpF/auCl20xG4PeKFgG3GT9F6rtwi1rODq5kQ==
X-Received: by 2002:a17:907:7b8c:b0:af9:c400:d6ee with SMTP id a640c23a62f3a-afe29626461mr1939334466b.61.1756394209697;
        Thu, 28 Aug 2025 08:16:49 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe8c25ceafsm804889766b.87.2025.08.28.08.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 08:16:49 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7ace3baso183871466b.3;
        Thu, 28 Aug 2025 08:16:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHa9hna8gq1rgc+mrUKYFom/vQnV7YzeLr9b9TL340IaLHVm7kKokSL18A0DyLmW5xNQhVj1MdwdG5@vger.kernel.org,
 AJvYcCUL1DSC2K8THkY14gW+bqjz1GBFrDPSLsvIz6mbsDFyNaC32nV8ZlQM+vIEGxUl9R4MvucJXarPfD+IOw==@vger.kernel.org,
 AJvYcCUY8vZuDrDKPWmsepIM6t6WxAgcT6GG6YOQDjbH9JzA4X+kM0MxwTFpOCJAd+ADP/NlTbZeYkT15BrS@vger.kernel.org,
 AJvYcCUcEChDUxRG8l1rp/B9XJzy6s0v/p6USimSzQLazVZHVac2pecusWg5hw+gP07Cu6HEaDRttdcAPjCp@vger.kernel.org,
 AJvYcCUemxyWzYQyV6JBzaktJUxNl8gDR1jRH0E4oai/LElGAdngQ3JgrSnr2yHr3zLjtROd7Y6rk9/pDXmi5uTCsRo=@vger.kernel.org,
 AJvYcCUfMRJbB9NUo6Lr1GdUSDvbDz/d5Btw1VAM3Lpi4u0LeWOQzHuj6KB9ehdEJAL4fVVoKHBWzstXiDXx@vger.kernel.org,
 AJvYcCV34/vQyrV2I8Gr8i00ET4qoz1XJ0VefeYvtrDhmOaepTs9r8g8pL52S9MvtBigazczWV82dl7iFIE8thZi@vger.kernel.org,
 AJvYcCW2lu7Kv+U+AtUsHPhD28eaSsVj1gm15s+KA8zRIBCsEHIlTqjPqyTDUKKC2RMrFfG6AnClozRS3Z4=@vger.kernel.org,
 AJvYcCWU4Nbo0VlHEpSqzQyZmhoLxgA7RqDY4/DEmBJCm1TjGunxNw+rgm3V0lp/Jrbdj8hVMB5bCLQSeE+N1jdVfqU=@vger.kernel.org,
 AJvYcCWyzL7FpiIBVShQpsPsAiMtoaUAL//BYdhBVxAmYDhr4nk0tODfB5G1yx0rd/ZJwsIs+DmkkLIo/KM84mS4nXhh@vger.kernel.org,
 AJvYcCX2XXoUItYd8DA1py0dl8Mgx1obvMk9m7hO9nRKqAVvy/HDBJtoxG7bnVZWbv0sjFg6Z6IOcAEvc0mx@vger.kernel.org,
 AJvYcCXFIpWAZydlvZ1ckMHZF3L96SHnZ4Gx9+gyMGfjB+VwKIl8cEdKPD0RM8SkmSkX6+EXTdiQQtcjERtU@vger.kernel.org,
 AJvYcCXosFX47gdj+8+Fpzg9kRJ9ejQ5pQDikhLc71JYSKg9lf65jhh6T+//6gBr5k5H3v4ma5g/OiSiNWxuoJE=@vger.kernel.org
X-Received: by 2002:a17:907:7242:b0:afe:9f26:5819 with SMTP id
 a640c23a62f3a-afe9f265912mr972062166b.28.1756394208258; Thu, 28 Aug 2025
 08:16:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
In-Reply-To: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 28 Aug 2025 11:16:11 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_FrHRE+X9s6od4O8r6VkkKfnie-NytMjxv3We6ee5Ghg@mail.gmail.com>
X-Gm-Features: Ac12FXwTZkDFtMlRGwhEx_nT-vIpwFaGSzleOTcRqJhHRnUCSpwpt1CTW2uLk5I
Message-ID: <CAEg-Je_FrHRE+X9s6od4O8r6VkkKfnie-NytMjxv3We6ee5Ghg@mail.gmail.com>
Subject: Re: [PATCH 00/37] arm64: Add initial device trees for Apple M2
 Pro/Max/Ultra devices
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	van Spriel <arend@broadcom.com>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Michael Turquette <mturquette@baylibre.com>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-bluetooth@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-nvme@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 10:01=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> This series adds device trees for Apple's M2 Pro, Max and Ultra based
> devices. The M2 Pro (t6020), M2 Max (t6021) and M2 Ultra (t6022) SoCs
> follow design of the t600x family so copy the structure of SoC *.dtsi
> files.
>
> t6020 is a cut-down version of t6021, so the former just includes the
> latter and disables the missing bits.
>
> t6022 is two connected t6021 dies. The implementation seems to use
> t6021 and disables blocks based on whether it is useful to carry
> multiple instances. The disabled blocks are mostly on the second die.
> MMIO addresses on the second die have a constant offset. The interrupt
> controller is multi-die aware. This setup can be represented in the
> device tree with two top level "soc" nodes. The MMIO offset is applied
> via "ranges" and devices are included with preprocessor macros to make
> the node labels unique and to specify the die number for the interrupt
> definition.
>
> The devices itself are very similar to their M1 Pro, M1 Max and M1 Ultra
> counterparts. The existing device templates are SoC agnostic so the new
> devices can reuse them and include their t602{0,1,2}.dtsi file. The
> minor differences in pinctrl and gpio numbers can be easily adjusted.
>
> With the t602x SoC family Apple introduced two new devices:
>
> The M2 Pro Mac mini is similar to the larger M1 and M2 Max Mac Studio. Th=
e
> missing SDHCI card reader and two front USB3.1 type-c ports and their
> internal USB hub can be easily deleted.
>
> The M2 Ultra Mac Pro (tower and rack-mount cases) differs from all other
> devices but may share some bits with the M2 Ultra Mac Studio. The PCIe
> implementation on the M2 Ultra in the Mac Pro differs slightly. Apple
> calls the PCIe controller "apcie-ge" in their device tree. The
> implementation seems to be mostly compatible with the base t6020 PCIe
> controller. The main difference is that there is only a single port with
> with 8 or 16 PCIe Gen4 lanes. These ports connect to a Microchip
> Switchtec PCIe switch with 100 lanes to which all internal PCIe devices
> and PCIe slots connect too.
>
> This series does not include PCIe support for the Mac Pro for two
> reasons:
> - the linux switchtec driver fails to probe and the downstream PCIe
>   connections come up as PCIe Gen1
> - some of the internal devices require PERST# and power control to come
>   up. Since the device are connected via the PCIe switch the PCIe
>   controller can not do this. The PCI slot pwrctrl can be utilized for
>   power control but misses integration with PERST# as proposed in [1].
>
> This series depends on "[PATCH v2 0/5] Apple device tree sync from
> downstream kernel" [2] due to the reuse of the t600x device templates
> (patch dependencies and DT compilation) and 4 page table level support
> in apple-dart and io-pgtable-dart [3] since the dart instances report
> 42-bit IAS (IOMMU device attach fails without the series).
>
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatibles anymore [1]. Instead either the first
> compatible SoC or t8103 is used as fallback compatible supported by the
> drivers. t8103 is used as default since most drivers and bindings were
> initially written for M1 based devices.
>
> The series adds those fallback compatibles to drivers where necessary,
> annotates the SoC lists for generic compatibles as "do not extend" and
> adds t6020 per-SoC compatibles.
>
> [1]: https://lore.kernel.org/linux-pci/20250819-pci-pwrctrl-perst-v1-0-4b=
74978d2007@oss.qualcomm.com/
> [2]: https://lore.kernel.org/asahi/20250823-apple-dt-sync-6-17-v2-0-6dc0d=
aeb4786@jannau.net/
> [3]: https://lore.kernel.org/asahi/20250821-apple-dart-4levels-v2-0-e39af=
79daa37@jannau.net/
> [4]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@k=
ernel.org/
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Hector Martin (3):
>       arm64: dts: apple: Add initial t6020/t6021/t6022 DTs
>       arm64: dts: apple: Add J414 and J416 Macbook Pro device trees
>       arm64: dts: apple: Add J180d (Mac Pro, M2 Ultra, 2023) device tree
>
> Janne Grunau (34):
>       dt-bindings: arm: apple: Add t6020x compatibles
>       dt-bindings: arm: apple: apple,pmgr: Add t6020-pmgr compatible
>       pmdomain: apple: Add "apple,t8103-pmgr-pwrstate"
>       dt-bindings: power: apple,pmgr-pwrstate: Add t6020 compatible
>       dt-bindings: cpufreq: apple,cluster-cpufreq: Add t6020 compatible
>       dt-bindings: interrupt-controller: apple,aic2: Add apple,t6020-aic =
compatible
>       dt-bindings: iommu: dart: Add apple,t6020-dart compatible
>       pinctrl: apple: Add "apple,t8103-pinctrl" as compatible
>       dt-bindings: pinctrl: apple,pinctrl: Add apple,t6020-pinctrl compat=
ible
>       dt-bindings: i2c: apple,i2c: Add apple,t6020-i2c compatible
>       dt-bindings: mailbox: apple,mailbox: Add t6020 compatible
>       dt-bindings: gpu: apple,agx: Add agx-{g14s,g14c,g14d} compatibles
>       dt-bindings: iommu: apple,sart: Add apple,t6020-sart compatible
>       nvme-apple: Add "apple,t8103-nvme-ans2" as compatible
>       dt-bindings: nvme: apple: Add apple,t6020-nvme-ans2 compatible
>       dt-bindings: net: bcm4377-bluetooth: Add BCM4388 compatible
>       dt-bindings: net: bcm4329-fmac: Add BCM4388 PCI compatible
>       mfd: macsmc: Add "apple,t8103-smc" compatible
>       dt-bindings: mfd: apple,smc: Add t6020-smc compatible
>       dt-bindings: pwm: apple,s5l-fpwm: Add t6020-fpwm compatible
>       spmi: apple: Add "apple,t8103-spmi" compatible
>       dt-bindings: spmi: apple,spmi: Add t6020-spmi compatible
>       watchdog: apple: Add "apple,t8103-wdt" compatible
>       dt-bindings: watchdog: apple,wdt: Add t6020-wdt compatible
>       clk: clk-apple-nco: Add "apple,t8103-nco" compatible
>       dt-bindings: clock: apple,nco: Add t6020-nco compatible
>       dmaengine: apple-admac: Add "apple,t8103-admac" compatible
>       dt-bindings: dma: apple,admac: Add t6020-admac compatible
>       ASoC: apple: mca: Add "apple,t8103-mca" compatible
>       ASoC: dt-bindings: apple,mca: Add t6020-mca compatible
>       spi: apple: Add "apple,t8103-spi" compatible
>       spi: dt-bindings: apple,spi: Add t6020-spi compatible
>       arm64: dts: apple: Add ethernet0 alias for J375 template
>       arm64: dts: apple: Add J474s, J475c and J475d device trees
>
>  Documentation/devicetree/bindings/arm/apple.yaml   |   39 +-
>  .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |   33 +-
>  .../devicetree/bindings/clock/apple,nco.yaml       |   17 +-
>  .../bindings/cpufreq/apple,cluster-cpufreq.yaml    |    3 +
>  .../devicetree/bindings/dma/apple,admac.yaml       |   17 +-
>  .../devicetree/bindings/gpu/apple,agx.yaml         |    6 +
>  .../devicetree/bindings/i2c/apple,i2c.yaml         |   27 +-
>  .../bindings/interrupt-controller/apple,aic2.yaml  |    1 +
>  .../devicetree/bindings/iommu/apple,dart.yaml      |   14 +-
>  .../devicetree/bindings/iommu/apple,sart.yaml      |    4 +-
>  .../devicetree/bindings/mailbox/apple,mailbox.yaml |    1 +
>  .../devicetree/bindings/mfd/apple,smc.yaml         |   17 +-
>  .../net/bluetooth/brcm,bcm4377-bluetooth.yaml      |    1 +
>  .../bindings/net/wireless/brcm,bcm4329-fmac.yaml   |    1 +
>  .../devicetree/bindings/nvme/apple,nvme-ans.yaml   |   29 +-
>  .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |   27 +-
>  .../bindings/power/apple,pmgr-pwrstate.yaml        |   27 +-
>  .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |    3 +-
>  .../devicetree/bindings/sound/apple,mca.yaml       |   17 +-
>  .../devicetree/bindings/spi/apple,spi.yaml         |   16 +-
>  .../devicetree/bindings/spmi/apple,spmi.yaml       |   17 +-
>  .../devicetree/bindings/watchdog/apple,wdt.yaml    |   27 +-
>  arch/arm64/boot/dts/apple/Makefile                 |    8 +
>  arch/arm64/boot/dts/apple/t600x-j375.dtsi          |    1 +
>  arch/arm64/boot/dts/apple/t6020-j414s.dts          |   26 +
>  arch/arm64/boot/dts/apple/t6020-j416s.dts          |   26 +
>  arch/arm64/boot/dts/apple/t6020-j474s.dts          |   47 +
>  arch/arm64/boot/dts/apple/t6020.dtsi               |   22 +
>  arch/arm64/boot/dts/apple/t6021-j414c.dts          |   26 +
>  arch/arm64/boot/dts/apple/t6021-j416c.dts          |   26 +
>  arch/arm64/boot/dts/apple/t6021-j475c.dts          |   37 +
>  arch/arm64/boot/dts/apple/t6021.dtsi               |   69 +
>  arch/arm64/boot/dts/apple/t6022-j180d.dts          |  121 ++
>  arch/arm64/boot/dts/apple/t6022-j475d.dts          |   42 +
>  arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi         |   38 +
>  arch/arm64/boot/dts/apple/t6022.dtsi               |  347 +++
>  arch/arm64/boot/dts/apple/t602x-common.dtsi        |  465 ++++
>  arch/arm64/boot/dts/apple/t602x-die0.dtsi          |  577 +++++
>  arch/arm64/boot/dts/apple/t602x-dieX.dtsi          |  129 ++
>  arch/arm64/boot/dts/apple/t602x-gpio-pins.dtsi     |   81 +
>  arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi     |   45 +
>  arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi     |   38 +
>  arch/arm64/boot/dts/apple/t602x-nvme.dtsi          |   42 +
>  arch/arm64/boot/dts/apple/t602x-pmgr.dtsi          | 2268 ++++++++++++++=
++++++
>  drivers/clk/clk-apple-nco.c                        |    1 +
>  drivers/dma/apple-admac.c                          |    1 +
>  drivers/mfd/macsmc.c                               |    1 +
>  drivers/nvme/host/apple.c                          |    1 +
>  drivers/pinctrl/pinctrl-apple-gpio.c               |    1 +
>  drivers/pmdomain/apple/pmgr-pwrstate.c             |    1 +
>  drivers/spi/spi-apple.c                            |    1 +
>  drivers/spmi/spmi-apple-controller.c               |    1 +
>  drivers/watchdog/apple_wdt.c                       |    1 +
>  sound/soc/apple/mca.c                              |    1 +
>  54 files changed, 4722 insertions(+), 113 deletions(-)
> ---
> base-commit: 50ee15a27ec4cc41e99ee5e9011de7875569cd52
> change-id: 20250811-dt-apple-t6020-1359ce9bf2e7
> prerequisite-change-id: 20250813-apple-dt-sync-6-17-d1fc1c89f7ca:v2
> prerequisite-patch-id: 1405c7c78139704a4cbeb1adc67786b2c7971a3f
> prerequisite-patch-id: 65865050e9e7427bac04f47d0b7927aacaac19bd
> prerequisite-patch-id: 9240e5f435fb3406e77b4e4e9b02eb3d52e660e6
> prerequisite-patch-id: c16715c9a9fcb396b7e4365fd767b05604b8de81
> prerequisite-patch-id: a675ad20c2b427a021dafb5d6c8716497741604c
>

This is quite a series, but pretty straightforward.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

