Return-Path: <linux-i2c+bounces-2110-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CB686EDE4
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 02:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEEF0287861
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 01:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176546FCC;
	Sat,  2 Mar 2024 01:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FD60jhNg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35246FB2;
	Sat,  2 Mar 2024 01:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709343123; cv=none; b=EPm5Jig2Yox9sEa7Beiuq1dh1YRPEJpP7vPF66bxLLMxsyg86N6/A6Y8YT3XTWlzQsyeRBfI1p21deP4Eg8SM9TgWiJqxHST+Gf6qU3hhJ5WuHkwS5X+zKj7SHHnVT6phIcaBRqQVG0iOvQqcKR+1Rg0hLbPANUOVCDhseW2z4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709343123; c=relaxed/simple;
	bh=rHF/bXLQ8b+3BXxGnr6KcyjuviXECUQbNcq+/6COo3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOoAS+AA/HKl7n5ISla3KcqpshDU/ZjmdSoZlX9uviqIMFwK2L6PCrEoF2UUhPe77kTW0YBtASc5zYNyU7B3yAwYUmc6/AmyRt9abp7inRqX+v4enOqcqavIxhZQQALxtEh+B0ZNzQhvug/+/z3jykJZ6Ho0zNYjDPh1I8myAiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FD60jhNg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA6CC433C7;
	Sat,  2 Mar 2024 01:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709343123;
	bh=rHF/bXLQ8b+3BXxGnr6KcyjuviXECUQbNcq+/6COo3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FD60jhNgomdXIOK3lfH1M9pMO4962ogK1c7fl6wTi6rbrUE609+0CdCE4au+mNPgT
	 Jk99X28a7UBQUCsrk1qZW8ps8upIi574GcdLhLXVqkV9xg2YyPTLDlSPkb8fSI+Nwj
	 zyyK9+OOK1R8VTu546gwyyyGMiCrrfHeAxWhe9noifMzjeZej8Y6SNl8WCCFo5KMnj
	 p+Gcuxs0Vboyl6PDz5ycPAW5Gt+pdJu4VH/mljmzO/wSN9wttb4AIpcGxzZsXPylHm
	 CZ529KMYXvKwSF3rTsR/HKkcgK2EnsMTzTYNBmkDl0lYeD1Nufyoe0v01SNNKXdfWr
	 oMbZVEUuxeWIQ==
Date: Sat, 2 Mar 2024 02:31:59 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v2 05/11] i2c: nomadik: use bitops helpers
Message-ID: <3kooaexx6vhlfwoojcpmnyhagupqwppwenjh4k7ucxbvlfpjn6@e3b7c3ocu6kc>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-5-b32ed18c098c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229-mbly-i2c-v2-5-b32ed18c098c@bootlin.com>

Hi Theo,

...

> @@ -284,7 +290,7 @@ static int init_hw(struct nmk_i2c_dev *priv)
>  }
>  
>  /* enable peripheral, master mode operation */
> -#define DEFAULT_I2C_REG_CR	((1 << 1) | I2C_CR_PE)
> +#define DEFAULT_I2C_REG_CR	(FIELD_PREP(I2C_CR_OM, 0b01) | I2C_CR_PE)

0b01?

>  /**
>   * load_i2c_mcr_reg() - load the MCR register
> @@ -296,41 +302,42 @@ static u32 load_i2c_mcr_reg(struct nmk_i2c_dev *priv, u16 flags)
>  	u32 mcr = 0;
>  	unsigned short slave_adr_3msb_bits;
>  
> -	mcr |= GEN_MASK(priv->cli.slave_adr, I2C_MCR_A7, 1);
> +	mcr |= FIELD_PREP(I2C_MCR_A7, priv->cli.slave_adr);
>  
>  	if (unlikely(flags & I2C_M_TEN)) {
>  		/* 10-bit address transaction */
> -		mcr |= GEN_MASK(2, I2C_MCR_AM, 12);
> +		mcr |= FIELD_PREP(I2C_MCR_AM, 2);
>  		/*
>  		 * Get the top 3 bits.
>  		 * EA10 represents extended address in MCR. This includes
>  		 * the extension (MSB bits) of the 7 bit address loaded
>  		 * in A7
>  		 */
> -		slave_adr_3msb_bits = (priv->cli.slave_adr >> 7) & 0x7;
> +		slave_adr_3msb_bits = FIELD_GET(GENMASK(9, 7),
> +						priv->cli.slave_adr);

This looks like the only one not having a define. Shall we give a
definition to GENMASK(9, 7)?

>  
> -		mcr |= GEN_MASK(slave_adr_3msb_bits, I2C_MCR_EA10, 8);
> +		mcr |= FIELD_PREP(I2C_MCR_EA10, slave_adr_3msb_bits);

...

> @@ -824,15 +827,16 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
>  	 * during the transaction.
>  	 */
>  	case I2C_IT_BERR:
> +	{
> +		u32 sr = readl(priv->virtbase + I2C_SR);

please give a blank line after the variable definition.

Besides, I'd prefer the assignment, when it is a bit more
complex, in a different line, as well.

Rest looks OK, didn't see anything off.

Andi

