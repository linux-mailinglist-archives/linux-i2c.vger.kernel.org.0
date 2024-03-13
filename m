Return-Path: <linux-i2c+bounces-2344-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0647E87A043
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Mar 2024 01:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36BB11C20FE3
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Mar 2024 00:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAAA78C1E;
	Wed, 13 Mar 2024 00:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUI0zndk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D19611B;
	Wed, 13 Mar 2024 00:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710290906; cv=none; b=BZ/k5+va9kckGPP9oEJQrqP8n99N/Ijo0MR8mAx7+ziq7kLIfbB6lYA1zYi+G2ykfeSQxsV5m2M9SUJzDM3WALfp5BxUCf1Msz7BX+He8Ys5mLWm8/BHxpTuHagWt/ZfFfFZEXaLTw13ly6D3nNIcGDZPkwZEuq/XjvC1yr61kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710290906; c=relaxed/simple;
	bh=JwNSt8qBIgZ0lI4rYKFXA6azdwMl4susKf4soxWbxDI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMyxAnWzN/jrD3rrzQbuxFJsXnjdZ75zz0h2605vjn7BMB4+bE6GzwQh30dsLpkYbFxNNpqcaRtbTaHucFWPYjLYcdzxfmzmxJ6uXM6UYjXAg1E6/wvsYancJ//offcpnnonSHZxJ7H2x07247EDofqEW9Oir060ej5MEfbBH/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUI0zndk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC15EC433F1;
	Wed, 13 Mar 2024 00:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710290904;
	bh=JwNSt8qBIgZ0lI4rYKFXA6azdwMl4susKf4soxWbxDI=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=mUI0zndkLnjHGsO/bcsHGfjR15MwnAzcZ4lRsK8pD+DwIWP5bylEnveCQ9TUjN6xB
	 HCRBctDnT83vur/oW8CGtfSNseFhg4Q2XeXO2H8LgOFfXjwlvmmT5/teGjX+fTOFSi
	 yqpPs+4Woy8Gei9WqBH2ZEN1cVGn3MiowlOOVEBN2tXOEqGxhFp86eqnbC1pH2W8wp
	 4SssIHz/IneOePtM2NVTojjC3n8Hw0PAAgKWNfrz2DvfB+aUN8nXNAhhdInvhPPi0R
	 OG46v1JDklHArZUrVOgB4lKFMvP0Fd/uc84gfHRbtIet6aoJ+E1MlRIaTMHJQrv4Wj
	 MNuBCJnnFxbkw==
Date: Wed, 13 Mar 2024 01:48:21 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Thomas Richard <thomas.richard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, 
	gregory.clement@bootlin.com, theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, 
	u-kumar1@ti.com
Subject: Re: [PATCH v4 03/18] i2c: omap: wakeup the controller during
 suspend() callback
Message-ID: <63oaudxrjdqredpbh4rojcpgjh5tot2tx2gs2kpfplwgjmrluw@f3x2x5us5hw5>
References: <20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com>
 <20240102-j7200-pcie-s2r-v4-3-6f1f53390c85@bootlin.com>
 <20240308084240.GK52537@atomide.com>
 <ZfAMT8CDW1VKW0qR@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfAMT8CDW1VKW0qR@shikoro>

Hi Wolfram,

On Tue, Mar 12, 2024 at 09:03:27AM +0100, Wolfram Sang wrote:
> On Fri, Mar 08, 2024 at 10:42:40AM +0200, Tony Lindgren wrote:
> > * Thomas Richard <thomas.richard@bootlin.com> [240304 15:36]:
> > > A device may need the controller up during suspend_noirq() or
> > > resume_noirq().
> > > But if the controller is autosuspended, there is no way to wakeup it during
> > > suspend_noirq() or resume_noirq() because runtime pm is disabled at this
> > > time.
> > > 
> > > The suspend() callback wakes up the controller, so it is available until
> > > its suspend_noirq() callback (pm_runtime_force_suspend()).
> > > During the resume, it's restored by resume_noirq() callback
> > > (pm_runtime_force_resume()). Then resume() callback enables autosuspend.
> > 
> > Reviewed-by: Tony Lindgren <tony@atomide.com>
> 
> I fully trust Tony and I assume that this series should go in via some
> other tree than I2C. So:
> 
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Andi, do you agree?

Agree... but who is going to take this? Eventually I can just
this one.

Andi

