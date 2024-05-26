Return-Path: <linux-i2c+bounces-3675-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F10B8CF428
	for <lists+linux-i2c@lfdr.de>; Sun, 26 May 2024 14:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A235B2051A
	for <lists+linux-i2c@lfdr.de>; Sun, 26 May 2024 12:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F974DF59;
	Sun, 26 May 2024 12:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="E+MoEpG5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DABC129
	for <linux-i2c@vger.kernel.org>; Sun, 26 May 2024 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716724882; cv=none; b=Sbc0MNRSGAzDrW+2EDs1k3qGZi8tn1HtfH3Hspsm6lCrsoGR++NcO4dy/KwN4h8F50fOdD4MBNbfi6OyNpfEZd1eBgIyy2H2ClkUDiiFBPbqcLZz7P0Gm1rVZMZjjxRvaJR6nXOYk9IZAf08w+3LEfpbsdeAiYeclkY2NhpoYug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716724882; c=relaxed/simple;
	bh=in2sBYIbdKVYfw+Qb1jCBsiXEMEqYYBkJtxjrunmwvA=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n8uN64ofQa7sPGcVXp7OLa2YtKB1WDwQgfpVFYlYWmqH1KPY8sHkyam2rYQ5sO0LLoU5FCJDn5bxZVy1QjnDV/QuVfqc6hSWGpzyXmUr2FSd2gNPKZtJn9Fw/EJgc6AFkzewrYz0wAAq2QDd1IjJvqb82qB2c+8bgzzBQLf7ywg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=E+MoEpG5; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 592E6424CA
	for <linux-i2c@vger.kernel.org>; Sun, 26 May 2024 12:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1716724870;
	bh=tvkwPnG/2WS9EBDE3dwEymI8zBU1MKtjDDlk1d+P43Y=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=E+MoEpG5C/3oQE3IULaZeCHwTS0brmqePaWlTymBF8PMFmt4oQlOUhOGtljK1wvma
	 m9WIgsGAhtY1bJM2OdpevPjRMh8DY9cHl200lhqGzsFKvSBA4xo4i+pYQ6Fi29UDD9
	 QDD7wh/1/ZjR8Mgn0ZjvUaiugM3a37hwElMrgxgK+m1o4k7g63E2uuEyi7CORAfT3w
	 10j/Rb8e1CoQGaeaznR/uL4w2D+SCtNN34d1YTBU+nFjFFFNojq6O6zP6Ch/Loov93
	 Aqy6WERXQKNtNOVbqjSVj11E+NWBtnED8GQkuDaOozVo3fkRWk5UJQw4VVax9uauzm
	 CNzdDHclsdMrA==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-43fb098389aso40092831cf.1
        for <linux-i2c@vger.kernel.org>; Sun, 26 May 2024 05:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716724868; x=1717329668;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tvkwPnG/2WS9EBDE3dwEymI8zBU1MKtjDDlk1d+P43Y=;
        b=rTdAtdchKBrI3zmGEBViph0hrb1jqyp0EmxKaf3nYuKXDGPuTwI8doddSAIWrxsKXp
         tUgVwBgfgFQWvPA1J5wzlAZWZSCgheuGLqT7GA/xEH9KXwFOeFaDLDj+/NU1oXZ9T4Gm
         F/GSebAb6zZCTNSAGbK9pqkaC77fsemBK5BE2eewmZYOQYYjMcxkwVEBR25zRM0Zn63E
         43mqv+EE6VsPmbA4eJjG03iul8EuxSXYBFs1TRJRrvtLfkBk9vzKH3CZo3G9GyeegTmm
         psdcrrji9JWgXpJ8ootkO+QeJ/gFVcm9z91InXFnDJEnSqHD+w0xggpouf6QNIwtlsVi
         9nIg==
X-Forwarded-Encrypted: i=1; AJvYcCW8H4LbCwYsPJpwCdcc5FwtBCJhlzbO9zQpmFoyBgyoiHbujFbafzLa/tJK24v7Rmby9YQBiYOVemCbFjextwa6iGDJO6jV0Ku1
X-Gm-Message-State: AOJu0YzgFed/Q6W0VEZY59nLpfb2HjuFpkL4Kuf59DBv/VSE6kk2AtLE
	/hrWsY4CA9EMbn9JimC0t88/e0gC348jk/4Tn4yLAc9rSzTOlvZMsvsptTcZlR5hjsM2nEYAcHt
	Xlx3yk359yAB24FyAOvWmHg1DblaE+HKwshjm0OVC1ZldWYqqmnUOUg1H6WzO2ZdAJatg93H9W1
	192svaXY1u4Zuex0aT4uGsGmLvmiBejSef5tVeYd2CAaPpP734
X-Received: by 2002:ac8:7c44:0:b0:43e:b52:eea1 with SMTP id d75a77b69052e-43fa746b00cmr180430991cf.16.1716724868103;
        Sun, 26 May 2024 05:01:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJkeH2LUqAq82Lwd2C/Zgjoasg6mKLwrH8I1wgWYFfVMAYYWA5MjWZNr4+CmcBQiREsO5oMSN6bb46jagFZVU=
X-Received: by 2002:ac8:7c44:0:b0:43e:b52:eea1 with SMTP id
 d75a77b69052e-43fa746b00cmr180430101cf.16.1716724867369; Sun, 26 May 2024
 05:01:07 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 26 May 2024 12:01:06 +0000
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240517-i2c-th1520-v2-2-d364d135ccc6@bootlin.com>
References: <20240517-i2c-th1520-v2-0-d364d135ccc6@bootlin.com> <20240517-i2c-th1520-v2-2-d364d135ccc6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Sun, 26 May 2024 12:01:06 +0000
Message-ID: <CAJM55Z_jXFx05YJFOfsguvdABALhi143xpwt61AGiXiyTwRc7A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] riscv: dts: thead: Add TH1520 I2C nodes
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Drew Fustini <dfustini@tenstorrent.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

Thanks for the patch. Some comments below.

Thomas Bonnefille wrote:
> Add nodes for the five I2C on the T-Head TH1520 RISCV SoC.
>
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 50 +++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index de7116290ca4..ae6cf4c441cf 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -252,6 +252,36 @@ gpio2: gpio-controller@0 {
>  			};
>  		};
>
> +		i2c0: i2c@ffe7f20000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xe7f20000 0x0 0x4000>;
> +			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_I2C0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@ffe7f24000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xe7f24000 0x0 0x4000>;
> +			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_I2C1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@ffe7f28000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xe7f28000 0x0 0x4000>;
> +			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_I2C4>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +

These nodes should be ordered by their memory addres, but the gpio2 controller
above has address 0xffe7f34000 which is greater than i2c0 at 0xffe7f20000.

>  		gpio@ffe7f38000 {
>  			compatible = "snps,dw-apb-gpio";
>  			reg = <0xff 0xe7f38000 0x0 0x1000>;
> @@ -342,6 +372,16 @@ uart2: serial@ffec010000 {
>  			status = "disabled";
>  		};
>
> +		i2c3: i2c@ffec014000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xec014000 0x0 0x4000>;
> +			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_I2C3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		dmac0: dma-controller@ffefc00000 {
>  			compatible = "snps,axi-dma-1.01a";
>  			reg = <0xff 0xefc00000 0x0 0x1000>;
> @@ -416,6 +456,16 @@ uart5: serial@fff7f0c000 {
>  			status = "disabled";
>  		};
>
> +		i2c5: i2c@fff7f2c000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xf7f2c000 0x0 0x4000>;
> +			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_I2C5>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +

I know it's probably hard to test i2c2 with the Ahead board, but chances are
very low that the disignware driver works with i2c0, i2c1, i2c3, i2c4 and i2c5,
but not i2c2, so plaese add that node too. The audio and aon i2cs are fine to
add later.

>  		timer4: timer@ffffc33000 {
>  			compatible = "snps,dw-apb-timer";
>  			reg = <0xff 0xffc33000 0x0 0x14>;
>
> --
> 2.45.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

