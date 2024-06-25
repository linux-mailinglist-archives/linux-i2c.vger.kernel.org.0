Return-Path: <linux-i2c+bounces-4351-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 014EA91737D
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 23:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B331B235AA
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 21:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A5A17E47C;
	Tue, 25 Jun 2024 21:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="QamC3VkU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9976517E441
	for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 21:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719351013; cv=none; b=bj1pvflXEjEE6QrSQDDW4G2xNye/B+nK03SQZhuhSPhPiJWUKtOh7gl57+TkTz0T2Ov4we39jokzXZfehICo8FEOk1xiD4mBQoYPIQjLjc2/W1flyg05IXbx8qnnj9H1UReTzIp4uULBb7v4ZiWjMC4hflHPXozWRXrH4nmdVkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719351013; c=relaxed/simple;
	bh=+XwBzr+aVabHBDwIiPjPzSHop57WblWAyB9K4VL6IZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6PwPvKn98LsXLQwBKye2ZdW5ipDaQwfBjmnNTs6gsyi90MfFqN461BJOOARzHsH7oPLywxaj5CsSDhQQln++Lnw8PtghMUP8UmiPVwN/tibGY+oMw+ljZvLnQ8fHLEIwf0MZ3AAYk97Wqu24vIK2ZWj8Ed5Qnb5XNhmuyU0QEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=QamC3VkU; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2c7b14bb4a5so4193882a91.0
        for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 14:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1719351010; x=1719955810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TQJM0xp8mYLkOXf0VM+GeUZ+q6CrpnIfH8/QAHHq+94=;
        b=QamC3VkUnXXLVdrfW1Xbzka1tYOBKLnvgwMbOsg5nvChwFjqg091WPNnDqQPSAaPaG
         6sVQ6mEeq6wK0mPgEtJPop1iiT7A1vocwMyMznc+swWcN3nVQk292HB8RLB/rwM7JPip
         SKe2oEiBuOkNW8R5WqRhkcyxs5q/7yQyvlx+ogCWxU5EQY3KZzEwI2PB6RMy0BXLzjWU
         ub8Jl6KdyrQkXBTu1BZKJK7I7Wufiyps705BhGPDRYhA6jNlkb3zmZhq+ehfj+4dWqHM
         4n1jRuK3zuU4dzPwWOvSLWY4Ug28b7xYrGF9YP7BgOTuaJQ+Mqrzx5xvfSHUR5TXFfq/
         U3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719351010; x=1719955810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQJM0xp8mYLkOXf0VM+GeUZ+q6CrpnIfH8/QAHHq+94=;
        b=BSKEnfW63pF8ysmLXl7HyGrLsZQa8mrRoUznDzjxvbgoE4IGBbdIt1hx79fRQmIg3f
         uGeoFzlxc2WGnH6aWAjwyZRQVdbk61dP/0Eu23AtZ0SGVdh2o5y+0VpJPXMNrCcDxmvd
         jMMduTzZMFN/cz0Y95HHIaNoOZ6jh0I9xvuaPyttsv1GXCI8l/H7SWBwuGo4rdwaoLlR
         SDBwFbANU+hFS1BXBxNhLbi3IH+5bTyhSGGpGOcy/vaIzONky+ZKwfcwZtMITkcOxuoe
         hrRvDGrGHOCA1iSdfnObYXIHyZudcg8uv/ockIT1AGFG4n0Iw9KUSk0PyN+cBuiYK4j0
         BRBg==
X-Forwarded-Encrypted: i=1; AJvYcCUXX9/zI4G14Hd5rfgN9Mvziyg+C8/juxbT/VLqD0izGanzEYRwQ3JP5H7JuvDw21jWV0JcjZkj/t9/cX4lHg4gvtbSAEn8CKdm
X-Gm-Message-State: AOJu0YyFuYS3FB4uHzqEEOLCD1O+XyUVpMArRd/J2LBMAiht98Ej4ftx
	hWAZYHe9qTgdGqYHOebxh1twnUKQs4FSBI3DtJgpwT43TjO/SsmWyhy4ZOKplEg=
X-Google-Smtp-Source: AGHT+IF+HNe0biV4YaXq1Ta4JFB82FlHqjmAKTErcH11CnWEB/zPBSEhSne+xVJYUXesf5Y0b6DRow==
X-Received: by 2002:a17:90a:a00c:b0:2c7:70ba:3f02 with SMTP id 98e67ed59e1d1-2c8a2357c93mr7008846a91.6.1719351009882;
        Tue, 25 Jun 2024 14:30:09 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:efe7:d185:104e:b7b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c8b8332794sm1388752a91.1.2024.06.25.14.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 14:30:09 -0700 (PDT)
Date: Tue, 25 Jun 2024 14:30:07 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/3] riscv: dts: thead: Add TH1520 I2C nodes
Message-ID: <Zns236F7vXPov4WK@x1>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
 <20240618-i2c-th1520-v3-2-3042590a16b1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-i2c-th1520-v3-2-3042590a16b1@bootlin.com>

On Tue, Jun 18, 2024 at 09:42:39AM +0200, Thomas Bonnefille wrote:
> Add nodes for the six I2C on the T-Head TH1520 RISCV SoC.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 60 +++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index d88d4cade02c..f0b2b05e9bd4 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -232,6 +232,36 @@ uart3: serial@ffe7f04000 {
>  			status = "disabled";
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
>  		gpio@ffe7f34000 {
>  			compatible = "snps,dw-apb-gpio";
>  			reg = <0xff 0xe7f34000 0x0 0x1000>;
> @@ -320,6 +350,16 @@ padctrl0_apsys: pinctrl@ffec007000 {
>  			clocks = <&clk CLK_PADCTRL0>;
>  		};
>  
> +		i2c2: i2c@ffec00c000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xec00c000 0x0 0x4000>;
> +			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_I2C2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		uart2: serial@ffec010000 {
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0xff 0xec010000 0x0 0x4000>;
> @@ -331,6 +371,16 @@ uart2: serial@ffec010000 {
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
> @@ -405,6 +455,16 @@ uart5: serial@fff7f0c000 {
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
>  		timer4: timer@ffffc33000 {
>  			compatible = "snps,dw-apb-timer";
>  			reg = <0xff 0xffc33000 0x0 0x14>;
> 
> -- 
> 2.45.2
> 

Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>

