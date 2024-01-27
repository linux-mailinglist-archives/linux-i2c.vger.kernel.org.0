Return-Path: <linux-i2c+bounces-1494-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A70F883F049
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Jan 2024 22:53:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61087283A96
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Jan 2024 21:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9051B7FA;
	Sat, 27 Jan 2024 21:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cTBgjxua"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC3A1B297;
	Sat, 27 Jan 2024 21:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706392422; cv=none; b=sl2/oyw5nB5WHb57WegPAQp+kjTs4e7E1/JkprrIcoM0JFq4NKBWkrUGHnRvev0gWFYmESI9HbcA6xKQ9puFbHO8BT2cBjhcRAlHYCrM2aX91zLL1QrXLf1d+AnrHAEvS4bV1R9CiAvOo8t0g79KYNShAAW4s2xMHWrF/JrTB8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706392422; c=relaxed/simple;
	bh=NwU+oQa1r9cqfqb+Y9Gu8poXEe3DEKlOE0uxQ1/xnls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4MuohfWcsagq/blEdhNvl/nTJ6IO+cLaEnf/VnFW5XDt1GOmnOMWo3sQZMEWelVSJe4aIM/9Q+qxA8GfRlhMIOyetxMiT2lB4Ws81CmMlhetO+xb2d3hzisttZ0pI3kJ4zAoYMXG1OhlV8C7S2fmCOLTEt1hkVtdfgRQC1yWgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cTBgjxua; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556C4C433F1;
	Sat, 27 Jan 2024 21:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706392421;
	bh=NwU+oQa1r9cqfqb+Y9Gu8poXEe3DEKlOE0uxQ1/xnls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cTBgjxuaJoqtWft7Gv4EaWo+W+B6XihNrDLZ6i31t9w7tWduK4DLx4e50PMoZVB45
	 zmdMUTEcC8YKEqDcvbLamELjPbIYT7h0MgFmEdzz7FdlodSK4L9QUmP+ZzAANC2jjF
	 79etyTz2pRLTF1BtviheweuWuroOadw86bd3tvUfNtYtV9qDtXD4ijH2fAIYPsnJud
	 N6YkeepTGppZQmlJZQ4qM+SqAmPk62FnJhftYlAd+3HpNZl3sHJQk7wObw3vK8qtrY
	 DYM3RzLmMzws7bASNt+/Wz699iNaam82CdOgQHd0ieAKDrGFqg1GKvzJS9qCu2c41N
	 Ov9Ck6cIjWYOw==
Date: Sat, 27 Jan 2024 22:53:36 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Tom Joseph <tjoseph@cadence.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, gregory.clement@bootlin.com, 
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com
Subject: Re: [PATCH v2 02/15] pinctrl: pinctrl-single: move
 suspend()/resume() callbacks to noirq
Message-ID: <k6tf2ryu3jxmeirmo6ymhtaqugi7u67qwwypxq7yvsymenq4pi@isoii76ej3ry>
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com>
 <20240102-j7200-pcie-s2r-v2-2-8e4f7d228ec2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102-j7200-pcie-s2r-v2-2-8e4f7d228ec2@bootlin.com>

Hi Thomas,

...

> -	struct pcs_device *pcs;
> -
> -	pcs = platform_get_drvdata(pdev);
> -	if (!pcs)
> -		return -EINVAL;
> +	struct pcs_device *pcs = dev_get_drvdata(dev);

I think this cleanup can be placed in a different patch. Besides,
it's not mentioned in the commit log.

Otherwise looks good.

Andi

