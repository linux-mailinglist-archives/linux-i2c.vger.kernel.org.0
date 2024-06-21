Return-Path: <linux-i2c+bounces-4156-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABFE911729
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 02:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 172352833FF
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 00:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DE7A34;
	Fri, 21 Jun 2024 00:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opWxR8bk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C5C3C0D;
	Fri, 21 Jun 2024 00:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718928538; cv=none; b=Cu1ZtNbkSAWRfm2+oVCPgxfAS0wXiT7e1ATJshb9pzwcq6mWGJvv/TS7tJ8qoDwrEgr85AAWxIro9oF0dywo5xltSW/2gtgd4u2Jp6+/oXEhNfx/OkZuuJwJYSivD15O1xlHT3WDN4rE7oDYcRZzdxFYDH6bZ+O/MRrUU4KoXMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718928538; c=relaxed/simple;
	bh=NcYLAWARUMh+igt8rrvEXRwaLFG2bKHXFVrUT7Mk6M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OV/869vOhXZssFz6CA8V2tCYKxEMsJoGbv1dLXYKxoHQd1/D+gPzk4fomfWBPQX67jKuCxFPN4Hw+XQwJJbkB9BtuD1KTtcK2SSHneonwFmAMS+lYzaweCPFbpdX6kwtIljYZqgBFVHSUSO5uocsxdW8tlL96XDBkQ44yxEplIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opWxR8bk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F23C2BD10;
	Fri, 21 Jun 2024 00:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718928538;
	bh=NcYLAWARUMh+igt8rrvEXRwaLFG2bKHXFVrUT7Mk6M0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=opWxR8bkfnY2Q9SJZz9epjFx4WPQdQI/a3gm9mYCYrw4xJgMrtXSSADHxdtzlN8Oi
	 dm9gCeaD69Kw98WHc1UYIuIKPtzZyN+0ZvCC9LBj0qVrYLHbomM03mqNQrApLVSzTc
	 AqAH7uIrIUqwXes+qFOjkt032u8blpcyEquXLerbRhhb6Pu2zaQMvWaNYdKaHsYYLA
	 vc16FHiinwkHn1mNKXd3Tmi25pNkKpf3xJlNylS1hLD//1znLY6Fol4ZfoNyijBpJI
	 xNOhOAgsqf+dW5d+GvISQklqGFJiqPxVw7d+GC8Mx9QmttxZcMDcgFzlnqxSGMOh1l
	 0cyD+2RKPYKtg==
Date: Fri, 21 Jun 2024 02:08:54 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Frank Li <Frank.Li@nxp.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] dt-bindings: drop stale Anson Huang from maintainers
Message-ID: <2wdijuaqederq6sebpqvby4jpe2b7nhuc3jcvoefn2wi5vpey5@wfvbli3tv6v7>
References: <20240617065828.9531-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240617065828.9531-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

On Mon, Jun 17, 2024 at 08:58:28AM GMT, Krzysztof Kozlowski wrote:
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

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

