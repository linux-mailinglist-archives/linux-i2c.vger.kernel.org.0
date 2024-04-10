Return-Path: <linux-i2c+bounces-2849-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DCE89ECAA
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 09:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 872421F216DA
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 07:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D1413D294;
	Wed, 10 Apr 2024 07:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="1FBMhjvz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FF28BE8;
	Wed, 10 Apr 2024 07:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712735523; cv=none; b=SsRTxttaetLQLALFFIh6dmNmNpgkLnG6Eaq3wQPU7s8Zg5wl5LcenpYoWEtCWebHLpPHQD/C3Ca7KHBqbNFpaaNY1ALQWVxzcwoJCH1ECXp6ZJXjv39BFzSmR72X37c1Mk0UuDVQJ2VJhK7M6/tYQdncEKn7kFpCqlNeI2VDSSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712735523; c=relaxed/simple;
	bh=siJ2QNW2b3ebPf5Jy5J3KNvU1Jw8yyo8OvyNbFZ7pRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WubqBXIgCdrUu4Ovx/ahoYhLK0dGhBM8XDFBNbi/Qrl+K6otkRsI8rTFf7FJCYG7eNWOcNGJ3KiV7DfC86uAGU54KNZPrEABErCwHh2pPwLsiJ9+YYwVvWtHB6pECqyco0127NOFHhdSZ447aDUmjnmWnAtFUt8vvoAGpQ79B1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=1FBMhjvz; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id E3FA21F9C5;
	Wed, 10 Apr 2024 09:51:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1712735516;
	bh=Rf9tbmyHVVZAveMk9B3qlTo48OjSr4wSqvHKOQgw4WY=; h=From:To:Subject;
	b=1FBMhjvzVLPhdRUPpxqL+ggGPFh8OQluY/51j/ktYpw5jg5BKtEEj0UiWFswmx4HY
	 AhPpbmaJiF/zqrCZIz5xQslhKx9lEerphyQNoQPVvR1QkMAnWezd8PY1vnhmh7YCPv
	 UyPjN12ZckhNMKaN+dXi/dqVHbWiLvW0N86ZoxgZ1mNe37rmllXlpZ/O0F5hj7cB2H
	 q8iB1HWNUCCxfdq+dYWekLIWrie+uNmEmz7i5Sb1HYJkB42gdGCcxeJkG+MZhgtRps
	 /gZMljhuJvgcyMTD0yw5Hr+9hXxQ1q8b4S5LYaj1hqDTmcctAjvjwtIixXAYzFdQWU
	 vuLayzDsOM4Zg==
Date: Wed, 10 Apr 2024 09:51:52 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com,
	u-kumar1@ti.com
Subject: Re: [PATCH v4 16/18] PCI: j721e: Use dev_err_probe() in the probe()
 function
Message-ID: <20240410075152.GA7748@francesco-nb>
References: <20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com>
 <20240102-j7200-pcie-s2r-v4-16-6f1f53390c85@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102-j7200-pcie-s2r-v4-16-6f1f53390c85@bootlin.com>

On Mon, Mar 04, 2024 at 04:35:59PM +0100, Thomas Richard wrote:
> Use dev_err_probe() instead of dev_err() in the probe() function to
> simplify the code and standardize the error output.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Franceco


