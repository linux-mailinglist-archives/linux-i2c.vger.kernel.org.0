Return-Path: <linux-i2c+bounces-9025-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF0CA094D5
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jan 2025 16:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF30E188E169
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jan 2025 15:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F6A211498;
	Fri, 10 Jan 2025 15:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N34Zwy/L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA46211466;
	Fri, 10 Jan 2025 15:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736522253; cv=none; b=topM46JaIjmqz4D6CkI2J8eGELujOCAF1tSJcCSCrWt/cCB5P8apSjxoxLfSH/ylRTPaocByNGA+X8STyq7SEDYpWIskBSDYIzKU+asueuWWWYiBPSMEAddCH1wmx1CMIf/bFJH3xtFJt/fxKMxQTxP04w5yoCZ7evaBIfjOqKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736522253; c=relaxed/simple;
	bh=vV5YP4ti6joqgVLYym/e9MtCph3opVzCLEJw51PCJBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R28FYYeCjja2PaLIlyUCQanAbBUXqSPGXPx1mNyLDV0RTjiuTZy9zmvEtT1532WU1fL0OZ4v+ojJ0KtHxymT+85kI/6sHwdZ7V+Ru864Ajglm9Qy8mywLVa6ORvi1cE6m8UfGtdS3Bl2LGQFJeTuZjB94OY0lYzhuDyXZ9tLL+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=N34Zwy/L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1ABC4CEE0;
	Fri, 10 Jan 2025 15:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736522252;
	bh=vV5YP4ti6joqgVLYym/e9MtCph3opVzCLEJw51PCJBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N34Zwy/LPLAJtyes0nTlsjEjtaQtcD21wLTToYB9GKDmsELEVS6F8b97TjHG0AjaK
	 Gg28VlgJXBv5xjl0XRTTeEOWWla9v9oTNFnnki3PS+NMhM7mEeB4O4PYNQ92L5wAf8
	 81yg6IF0+P7CugZsyUDbKza15SfNZlEJa2vq/u3U=
Date: Fri, 10 Jan 2025 16:17:29 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 9/9] misc: add FPC202 dual port controller driver
Message-ID: <2025011011-backache-facing-6c99@gregkh>
References: <20250108-fpc202-v5-0-a439ab999d5a@bootlin.com>
 <20250108-fpc202-v5-9-a439ab999d5a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-fpc202-v5-9-a439ab999d5a@bootlin.com>

On Wed, Jan 08, 2025 at 05:14:10PM +0100, Romain Gantois wrote:
> The TI FPC202 dual port controller serves as a low-speed signal aggregator
> for common port types such as SFP, QSFP, Mini-SAS HD, and others.
> 
> It aggregates GPIO and I2C signals across two downstream ports, acting as
> both a GPIO controller and an I2C address translator for up to two logical
> devices per port.
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>  MAINTAINERS              |   1 +
>  drivers/misc/Kconfig     |  11 ++
>  drivers/misc/Makefile    |   1 +
>  drivers/misc/ti_fpc202.c | 440 +++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 453 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2ef5c0d395b3668167dddbd27237a2177f85571e..865ef413b38c293e1c7b1405322fafe9df81ea96 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23502,6 +23502,7 @@ M:	Romain Gantois <romain.gantois@bootlin.com>
>  L:	linux-kernel@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/misc/ti,fpc202.yaml
> +F:	drivers/misc/ti_fpc202.c
>  
>  TI FPD-LINK DRIVERS
>  M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 09cbe3f0ab1e56f85852c0cb50cfc03cae659d2b..3c7e82e86e4ae83eff84999d123cd8c0f018323c 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -114,6 +114,17 @@ config RPMB
>  
>  	  If unsure, select N.
>  
> +config TI_FPC202
> +	tristate "TI FPC202 Dual Port Controller"
> +	select GPIOLIB
> +	depends on I2C_ATR
> +	help
> +	  If you say yes here you get support for the Texas Instruments FPC202
> +	  Dual Port Controller.
> +
> +	  This driver can also be built as a module. If so, the module will be
> +	  called fpc202.
> +
>  config TIFM_CORE
>  	tristate "TI Flash Media interface support"
>  	depends on PCI
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index 40bf953185c773afa91f7784a286ae0752bb0b53..ba47db46a5ff2559de597447ce7e2d88e26efa61 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_ATMEL_SSC)		+= atmel-ssc.o
>  obj-$(CONFIG_DUMMY_IRQ)		+= dummy-irq.o
>  obj-$(CONFIG_ICS932S401)	+= ics932s401.o
>  obj-$(CONFIG_LKDTM)		+= lkdtm/
> +obj-$(CONFIG_TI_FPC202)         += ti_fpc202.o

Nit, you didn't use a tab here :(

thanks,

greg k-h

