Return-Path: <linux-i2c+bounces-4153-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5AA911647
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 01:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4851528313F
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 23:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E989143C58;
	Thu, 20 Jun 2024 23:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGsfH1Gp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D8782D83;
	Thu, 20 Jun 2024 23:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718924741; cv=none; b=ejrbX45lgDc7C5JxvicTPnxJMlAUtsLS342p7U7Z+n5acDvFbSNdCLvYHcTjE1eTlioHiXoVm0px/pHlC6cIm6Y6w985Yyi2uCKctFdq8O9CornZKBLNBE8cKS1Q7VDYIdKcfRXS0gXMBkgMqRrcxpcLOE+KeWawcDUj4JPGtRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718924741; c=relaxed/simple;
	bh=SaOaFRr/ohEIO5+x2sHjKUAw9989Q79otM9vhPABR3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBdkHgR1PAa7QZZJrG9d22mqZe6ThcwRYtlL8QnqJnYXjEdig8HsVSAzQtZKp0p440mJDOGIjKe+baXDwMLWyFBxCNddz3ZuF17O0BEbI1VTnpnR2BdrG0nfTc3bG3p6STuoAETTNsAcNGYc5IfWYHLVyfeDa55xOwfWoz5aQnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGsfH1Gp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32575C2BD10;
	Thu, 20 Jun 2024 23:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718924740;
	bh=SaOaFRr/ohEIO5+x2sHjKUAw9989Q79otM9vhPABR3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dGsfH1GpHmQGHTfZ1l4tF8Yc8IR5UiRboDTNredObqxtOQx82e5s0tzE5UQ3HRdti
	 YEn9NRju/HM5BF130UGn7A/JtXSjes40KzIwRc9JuVBmqI+8j7E1dPyQ28nSZcPIyG
	 TOptG9SYCZtxheOmn5MCrlB4o/pGRyWPoX1UppgceSz8O/DTcsfVNH4ydUcWt+i5IJ
	 oqlDDSWtyhj2zce34mKlyDG9TYhoG/y5KLT8TEJYWtVuC7gL+IKxBIvHGJphOe3KMf
	 rP0msnieHjZGex3A1fC77vPMeqWKD0e19wRR09Ly11BI6lTQHNI85BCFts6ZIC+fOW
	 QUnaqIuN62HjA==
Date: Fri, 21 Jun 2024 01:05:37 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Sergiu Moga <sergiu.moga@microchip.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Doug Anderson <dianders@chromium.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, 
	Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Vignesh R <vigneshr@ti.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-tegra@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-omap@vger.kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org
Subject: Re: [PATCH 0/7] dt-bindings: i2c: few fixes and cleanups
Message-ID: <qru4aqjphjnjpo6yjxl2oznhlz774iv77u4u7u4jldnmlanps5@vpzxntuz6arp>
References: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>

Cześć Krzysztof,

On Thu, Jun 20, 2024 at 01:34:48PM GMT, Krzysztof Kozlowski wrote:
> Few fixes for I2C controller schemas. The third patch (atmel,at91sam)
> depends on first, so I suggest not splitting this into fixes branch but
> take as is via next branch.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (7):
>       dt-bindings: i2c: atmel,at91sam: correct path to i2c-controller schema
>       dt-bindings: i2c: google,cros-ec-i2c-tunnel: correct path to i2c-controller schema

merged to i2c/i2c-host-fixes

>       dt-bindings: i2c: atmel,at91sam: drop unneeded address/size-cells
>       dt-bindings: i2c: nvidia,tegra20: drop unneeded address/size-cells
>       dt-bindings: i2c: samsung,s3c2410: drop unneeded address/size-cells
>       dt-bindings: i2c: ti,omap4: reference i2c-controller.yaml schema
>       dt-bindings: i2c: adjust indentation in DTS example to coding style

merged to i2c/i2c-host

Thanks,
Andi

