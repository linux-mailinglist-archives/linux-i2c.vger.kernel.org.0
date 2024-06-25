Return-Path: <linux-i2c+bounces-4352-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC91917380
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 23:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C2D21C2351E
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 21:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F28917D8A5;
	Tue, 25 Jun 2024 21:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="UESqX9y8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCC8146A63
	for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 21:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719351057; cv=none; b=ms1GjxXP4BlMw4GBH+UkyAvcKMrpCWGqvXRfEwSmnCNtACE+w/rCo+7rej906Avl4V4vxWHO99ehjRVB+wizVnip6oMiMiWJpnZVVVgaglzbvfDEFQgKkymAXC0JtP7fUvvCcIvJBEgSo7MQkO4pyZyeB0lHSx7Ru1YDv9drWN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719351057; c=relaxed/simple;
	bh=cj7Gt+uQU5ptKgdIzkqkZMdjHHsqa2VwADHNYHlv+yI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmEZ6kqd2ka2jGKYun+Ov4GfltJNjgIdLnR0bdfsw7tFdpwDS4XAmv5vY5CIr16Z6QSjgwVpyecY4ULoseVQ0xLD+zzDBFOonk0+L1t0o+LZ2jE6GSw027muTJs8UlpY6K3CNw6IMWugEPqSEHTKIb9fIIqJW461xkFqSEyFQN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=UESqX9y8; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-71871d5e087so2929959a12.1
        for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 14:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1719351056; x=1719955856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B2W8rgNXG1QVMuA1bBYIoQVqie0Y2SU5GMCzLUNZnjw=;
        b=UESqX9y87/Xp7F769iJHetz59DFJjHKn3pCjsrw8Q47W0yvo8E4Ds+PrmhfujQ4FzG
         WNxO6cf4tC6BrTVgLSPk41f8uYgcODWIzgMFCpo+8VYsWzIyXw/e9yuyWazMSpMX0+X4
         jI5jqjkW2FxDCR1bcjhZxWBBkspLh/LQ+vWhq0PPhmbtD0KD0+aq3iCVgx9TD5pvUM+C
         GCG4Qj0J0n+npxj74ge7tzgLDEHsuunpeDlK2Zlpz3jKvo9w+s/z5o/gcTYNrPzah5fc
         4H+PUbGuIL+6BxS/PIYDYxnfoWMsHbVGfs7ez8pRXOebTRj9fgpbcFbA9QKMl5u4Opp8
         vJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719351056; x=1719955856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2W8rgNXG1QVMuA1bBYIoQVqie0Y2SU5GMCzLUNZnjw=;
        b=Fc/Amw5sAKPrDVgNDsZMRKWpJD0kh65RR2Weo4xkS1jASAIC+JP9IyxOzPAZeCPf6t
         1YKHUIka00xuksh+kK4NNDkklIGIXIsyBHVIBkaIigVy6SZIS3Ag4H6Dplp6BXdjtvrQ
         XuD1uv10saL4zrQdEHBCOE+HWww0g+3S/Adafbop52wjDw6pTvNBi9KH/Yv3+8VgZXZz
         qweGo3IdOJV0oEZ02ixPI4IRrgxO8PYOv9C9CzQLRdaxMmPgJb/TUE20i6GxbvjShK10
         f2Lo7txdGV17fiUJex4YnG2+z9ZAf3uS9vI/wtwIhyJ3rumFJQYe5OAVY/MlGJuz/ir0
         THoA==
X-Forwarded-Encrypted: i=1; AJvYcCUK8pbOdf7SU0ElMA99aEAL4aWZ8qAjnoYHVPWA8knJDC0O7XsAM3gdess6pa8hGNGHEffxQKmmbQ4JrDnSSq9dNp4i9NxM3QWv
X-Gm-Message-State: AOJu0YzqHrkl7pBU41Zfdzs8ah3QlxsUIqoEiqNdYe8hCmUIkk5I3P14
	w7+FwfO+xc4iaO6aM2rFY4e4G7JwhE63132+6ndkmOoMHxKOPLoNIzTsLfUmifLNO1wpkbdhhh4
	J
X-Google-Smtp-Source: AGHT+IHLYzhYJqgZIhjVBl957rNEit7/68mjSYfy0ZR3K9f3qNxYJuPCUrQQrG4u1+TQDgmb+OtrJg==
X-Received: by 2002:a17:902:d4cd:b0:1fa:18c3:2788 with SMTP id d9443c01a7336-1fa1d51c210mr95820215ad.24.1719351049966;
        Tue, 25 Jun 2024 14:30:49 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:efe7:d185:104e:b7b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7d245asm86453135ad.232.2024.06.25.14.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 14:30:49 -0700 (PDT)
Date: Tue, 25 Jun 2024 14:30:47 -0700
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
Subject: Re: [PATCH v3 3/3] riscv: dts: thead: Enable I2C on the BeagleV-Ahead
Message-ID: <Zns3B/eJUUqFL6XE@x1>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
 <20240618-i2c-th1520-v3-3-3042590a16b1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-i2c-th1520-v3-3-3042590a16b1@bootlin.com>

On Tue, Jun 18, 2024 at 09:42:40AM +0200, Thomas Bonnefille wrote:
> This commit enables the I2C0 controller of the TH1520, together with
> the FT24C32A EEPROM that is connected to it.
> In addition, this commit also enables the I2C controllers I2C2, I2C4
> and I2C5 as they are all three exposed on headers (P9 19 and 20 for I2C2,
> P9 17 and 18 for I2C5 and MikroBus 7 and 5 for I2C4).
> It also defined the required pinctrl nodes.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 84 ++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> index 57a2578123eb..b5c4f1811955 100644
> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> @@ -122,6 +122,19 @@ led-pins {
>  };
>  
>  &padctrl0_apsys {
> +	i2c2_pins: i2c2-0 {
> +		i2c-pins {
> +			pins = "I2C2_SDA",
> +			       "I2C2_SCL";
> +			function = "i2c";
> +			bias-pull-up = <48000>;
> +			drive-strength = <7>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
>  	uart0_pins: uart0-0 {
>  		tx-pins {
>  			pins = "UART0_TXD";
> @@ -145,8 +158,79 @@ rx-pins {
>  	};
>  };
>  
> +&padctrl1_apsys {
> +	i2c0_pins: i2c0-0 {
> +		i2c-pins {
> +			pins = "I2C0_SDA",
> +			       "I2C0_SCL";
> +			function = "i2c";
> +			bias-pull-up = <48000>;
> +			drive-strength = <7>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	i2c4_pins: i2c4-0 {
> +		i2c-pins {
> +			pins = "GPIO0_19", /* I2C4_SDA */
> +			       "GPIO0_18"; /* I2C4_SCL */
> +			function = "i2c";
> +			bias-pull-up = <48000>;
> +			drive-strength = <7>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	i2c5_pins: i2c5-0 {
> +		i2c-pins {
> +			pins = "QSPI1_D0_MOSI", /* I2C5_SDA */
> +			       "QSPI1_CSN0";    /* I2C5_SCL */
> +			function = "i2c";
> +			bias-pull-up = <48000>;
> +			drive-strength = <7>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";
>  };
> +
> +&i2c0 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins>;
> +	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c32";
> +		reg = <0x50>;
> +	};
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_pins>;
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c4_pins>;
> +	status = "okay";
> +};
> +
> +&i2c5 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c5_pins>;
> +	status = "okay";
> +};
> 
> -- 
> 2.45.2
>

Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>

