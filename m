Return-Path: <linux-i2c+bounces-10115-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D94CA7D1FF
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 04:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB4E93AC2EF
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 02:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0D9212F94;
	Mon,  7 Apr 2025 02:09:53 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA056212D65;
	Mon,  7 Apr 2025 02:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743991793; cv=none; b=lFszrrYBsPfa8Y3qEalITh5wZWb31s+ht/uopiRcvegF8oJIWsU5CLUh8thT42DpPA1b3qSPQ/35Ofzr1PyGyggu22J8wR5hpf/kH8WQS+ST9LpXAzONkrCTcIg02keedxGkwI4otEMT4tCwluQYMoIgB7R9oi5Hq4s+DicCw4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743991793; c=relaxed/simple;
	bh=I0uSkIs7MwYCiFKpPqFS9fHzKIERPrO5A7jKe4gKoxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQwz0Urn4BcmiPWpneUaR+BHDPYRM/2xGp6UlWnsxqlGUaSR/4CVQOOmdz+hb1/WiBCpt5pawfpxmfojURR1mX4wcGNhr8h+f/C46N8Fvvp20+p+ULKvXT5Xi2gB3RJSCeHZL5+/507wZ4gs0zN0kT2WwmzWrjo2yF3k1u89BL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 406253430A7;
	Mon, 07 Apr 2025 02:09:50 +0000 (UTC)
Date: Mon, 7 Apr 2025 02:09:45 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 9/9] riscv: dts: sophgo: Add initial device tree of
 Sophgo SRD3-10
Message-ID: <20250407020945-GYA13182@gentoo>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-10-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-10-inochiama@gmail.com>


On 09:06 Mon 07 Apr     , Inochi Amaoto wrote:
> Sophgo SG2044 SRD3-10 board bases on Sophgo SG2044 SoC.
> This board includes 5 uart ports, 5 pcie x8 slots, 1 1G Ethernet port,
> 1 microSD slot.
> 
> Add initial device tree of this board with uart support.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/Makefile           |    1 +
>  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi   | 3002 +++++++++++++++++
>  arch/riscv/boot/dts/sophgo/sg2044-reset.h     |  128 +
>  .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   32 +
>  arch/riscv/boot/dts/sophgo/sg2044.dtsi        |   86 +
>  5 files changed, 3249 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-reset.h
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044.dtsi
> 
..
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044-reset.h b/arch/riscv/boot/dts/sophgo/sg2044-reset.h
> new file mode 100644
> index 000000000000..94ed1e3777c3
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2044-reset.h
> @@ -0,0 +1,128 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
you might want to use your gmail suffix? IIRC your outlook account
isn't preferable? besides, it's better cosistent with your signed-off

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

