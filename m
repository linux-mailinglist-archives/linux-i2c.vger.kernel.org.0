Return-Path: <linux-i2c+bounces-4353-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B9D91743D
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 00:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A745EB22D91
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 22:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE74117F37F;
	Tue, 25 Jun 2024 22:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aHIBw3DB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E27617E905;
	Tue, 25 Jun 2024 22:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719354544; cv=none; b=lRLgrbZ/+i8ofiZ9DUYt0OSJt4GMsLPzhoHJ/X5TtTmLph2ype4Tm9MQ2aJwT6EaFRXz+vtjCfii9YLrpj6lwJeSP7FrpgCsj87ptZTjpeek2M913vcHz4Iwj7sLGFmh6ePznLIG7KFKfXLfM5bqBD4A/Wc/jqG/nny8T5fO23I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719354544; c=relaxed/simple;
	bh=+L/emvVgtDd3ULOJoo20PaysUqptsWugNLJKhSGnCkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9xY9Hpih9mjZ7Ip6VPGC7OL0QIgFTRkTY0NzRH7cbZi4NG0U46xFjs897PTGMpgaYRXl7TndyaaWMqKR+lj3t1vyAUAnQI52Cw8/a6cqnZ4ni62Gs0BzfpDM8EmAxfcYlfB0DWLUrtJEkz6PR/rlDns0h3XaS4Fy9Bbs+F4oJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aHIBw3DB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F0AC32781;
	Tue, 25 Jun 2024 22:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719354544;
	bh=+L/emvVgtDd3ULOJoo20PaysUqptsWugNLJKhSGnCkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aHIBw3DBgsgjmcpsG44SasdTK/47SLheszc2AagGPy/V7LIt+KIuH7AKrKN0mdQ4m
	 v/86HnwE7/KWPAzxgOoR5hd/JrDeNRp9OvGbCb53WyGFL4HooYtZJcZIp7AkX2QJaT
	 +vHjK7JhSOiOAkpK9K/Uyzwtlo1NR5gjQek9RAJpOZqYT6fUx1Eow01E9Q9ijR15CZ
	 38Zdrwgb2Jm2MNu4wtYm/QCdZo2set9VEJc9HQaVddLzXwUicN4X+XaslvpbMn/EO5
	 WLDZHpj95vw9bZc+CTbvXsK9O1YX/XaWex8fqU8mdI6PeHJvGwff4q5XmL1qsCihxt
	 HbV5Mb4qb0ZXA==
Date: Tue, 25 Jun 2024 16:29:02 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>,
	linux-gpio@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-pwm@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jonathan Cameron <jic23@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-watchdog@vger.kernel.org, linux-iio@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	linux-clk@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Zhang Rui <rui.zhang@intel.com>, Andi Shyti <andi.shyti@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: drop stale Anson Huang from maintainers
Message-ID: <171935453992.325655.11101198917545671907.robh@kernel.org>
References: <20240617065828.9531-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240617065828.9531-1-krzysztof.kozlowski@linaro.org>


On Mon, 17 Jun 2024 08:58:28 +0200, Krzysztof Kozlowski wrote:
> Emails to Anson Huang bounce:
> 
>   Diagnostic-Code: smtp; 550 5.4.1 Recipient address rejected: Access denied.
> 
> Add IMX platform maintainers for bindings which would become orphaned.
> 
> Acked-by: Uwe Kleine-König <ukleinek@kernel.org>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Acked-by: Peng Fan <peng.fan@nxp.com>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for I2C
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Add acks/Rbs.
> 2. Change clock maintainers to Abel Vesa and Peng Fan.
> 3. Change iio/magnetometer maintainer to Jonathan.
> ---
>  .../devicetree/bindings/arm/freescale/fsl,imx7ulp-sim.yaml    | 4 +++-
>  Documentation/devicetree/bindings/clock/imx6q-clock.yaml      | 3 ++-
>  Documentation/devicetree/bindings/clock/imx6sl-clock.yaml     | 3 ++-
>  Documentation/devicetree/bindings/clock/imx6sll-clock.yaml    | 3 ++-
>  Documentation/devicetree/bindings/clock/imx6sx-clock.yaml     | 3 ++-
>  Documentation/devicetree/bindings/clock/imx6ul-clock.yaml     | 3 ++-
>  Documentation/devicetree/bindings/clock/imx7d-clock.yaml      | 1 -
>  Documentation/devicetree/bindings/clock/imx8m-clock.yaml      | 3 ++-
>  Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml      | 4 +++-
>  Documentation/devicetree/bindings/gpio/gpio-mxs.yaml          | 1 -
>  Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml      | 4 +++-
>  .../devicetree/bindings/iio/magnetometer/fsl,mag3110.yaml     | 2 +-
>  .../devicetree/bindings/memory-controllers/fsl/mmdc.yaml      | 4 +++-
>  Documentation/devicetree/bindings/nvmem/imx-iim.yaml          | 4 +++-
>  Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml        | 4 +++-
>  Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml        | 4 +++-
>  Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml        | 4 +++-
>  Documentation/devicetree/bindings/pwm/mxs-pwm.yaml            | 1 -
>  Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml      | 4 +++-
>  Documentation/devicetree/bindings/thermal/imx-thermal.yaml    | 1 -
>  Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml | 4 +++-
>  Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml  | 4 +++-
>  Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml   | 4 +++-
>  .../devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml         | 4 +++-
>  24 files changed, 52 insertions(+), 24 deletions(-)
> 

Applied, thanks!


